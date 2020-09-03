import 'js-autocomplete/auto-complete.css';
const autocompleteSearch = function() {
  const sportss = document.getElementById('search-data')
  const searchInput = document.getElementById('query_sport');
  const list = document.querySelector('.suggestions')
  if (sportss && searchInput) {
    const sports = document.querySelector("#db-sports").dataset.sports
    const parsedSports = JSON.parse(sports)
    searchInput.addEventListener("input", () => {
      list.innerHTML = ""
      if (!searchInput.value == "") {
        const suggestions = parsedSports.filter((sport) => {
          return sport.toLowerCase().includes(searchInput.value.toLowerCase())
        })
        console.log(suggestions, parsedSports)
        suggestions.forEach((suggestion) => {
          list.insertAdjacentHTML("beforeend",`<h5 class="auto">${suggestion}</h5>`)
        })
        const suggestionBoxes = document.querySelectorAll(".auto")
        console.log(suggestionBoxes)
        suggestionBoxes.forEach((box) => {
          box.addEventListener("click", () => {
            searchInput.value = box.innerText
            list.innerHTML = ""
          })
        })
      }
    })

  }
};
export { autocompleteSearch };
