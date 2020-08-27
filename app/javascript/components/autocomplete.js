import 'js-autocomplete/auto-complete.css';
import autocomplete from 'js-autocomplete';

const autocompleteSearch = function() {
  const sports = document.getElementById('search-data')
  const searchInput = document.getElementById('query_sport');
  console.log(sports)


  if (sports && searchInput) {
    new autocomplete({
      selector: searchInput,
      minChars: 1,
      source: function(term, suggest){
          term = term.toLowerCase();
          const choices = JSON.parse((sports).dataset.sports);
          const matches = [];
          for (let i = 0; i < choices.length; i++)
              if (~choices[i].toLowerCase().indexOf(term)) matches.push(choices[i]);
          suggest(matches);
      },
    });
  }
};

export { autocompleteSearch };
