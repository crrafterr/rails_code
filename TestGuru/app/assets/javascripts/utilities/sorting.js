document.addEventListener('turbolinks:load', function() {
  let control = document.querySelector('.sort-by-title')
  if (control) { control.addEventListener('click', sortTable) }
})

function sortTable() {
  let table = new SortTable(document.querySelector('table'))
  table.sortTableByTitle()
}
