import consumer from "./consumer";

const initConversationCable = () => {
  const messagesContainer = document.getElementById('messages');
  const navbar = document.querySelector('.navbar-lewagon')
  if (messagesContainer) {
    const id = messagesContainer.dataset.chatroomId;

    consumer.subscriptions.create({ channel: "ConversationChannel", id: id }, {
      received(data) {
        console.log(data); // called when data is broadcast in the cable
        messagesContainer.insertAdjacentHTML('beforeend', data);
        document.getElementById('message_content').value = '';
      },
    });
  }

  if (navbar) {
    const id = navbar.dataset.userId;
    consumer.subscriptions.create({ channel: "UserChannel", id: id }, {
      received(data) {
        console.log(data);
        const notificationBox = document.getElementById('notification-count')
        notificationBox.innerText = data
        if (data !== 0) {
          notificationBox.classList.add("red-box")
        }
        // called when data is broadcast in the cable
      },
    });
  }
}

export { initConversationCable };
