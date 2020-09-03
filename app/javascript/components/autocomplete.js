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
          list.insertAdjacentHTML("beforeend",`<h5>${suggestion}</h5>` )
        })
      }
    })
    searchInput.onchange = function() {
    }
  }
};

export { autocompleteSearch };
