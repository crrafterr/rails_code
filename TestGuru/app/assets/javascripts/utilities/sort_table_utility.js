class SortTable {
  constructor(table) {
    this.table = table
    this.rows = table.querySelectorAll('tr')
  }

  sortTableByTitle() {
    let sortedRows = this.#getRows()

    if (this.#checkArowUpHide() == true) {
      sortedRows.sort(this.#compareRowsAsc)
      this.#showArowUp()
    } else {
      sortedRows.sort(this.#compareRowsDesc)
      this.#showArowDown()
    }

    this.#replaceTable(sortedRows)
  }

  #getRows() {
    let rows = []
    
    for (let i = 1; i < this.rows.length; i++) {
      rows.push(this.rows[i])
    }

    return rows
  }

  #checkArowUpHide() {
    if (this.table.querySelector('.octicon-arrow-up').classList.contains('hide')) { return true}
    return false
  }

  #showArowUp() {
    this.table.querySelector('.octicon-arrow-up').classList.remove('hide')
    this.table.querySelector('.octicon-arrow-down').classList.add('hide')
  }

  #showArowDown() {
    this.table.querySelector('.octicon-arrow-down').classList.remove('hide')
    this.table.querySelector('.octicon-arrow-up').classList.add('hide')
  }

  #compareRowsAsc(row1, row2) {
    let testTitle1 = row1.querySelector('td').textContent
    let testTitle2 = row2.querySelector('td').textContent
  
    if (testTitle1 < testTitle2) {return -1}
    if (testTitle1 > testTitle2) {return 1}
    return 0
  }  
  
  #compareRowsDesc(row1, row2) {
    let testTitle1 = row1.querySelector('td').textContent
    let testTitle2 = row2.querySelector('td').textContent
  
    if (testTitle1 < testTitle2) {return 1}
    if (testTitle1 > testTitle2) {return -1}
    return 0
  }
  
  #replaceTable(sortedRows) {
    let sortedTable = document.createElement('table')

    sortedTable.classList.add('table')
    sortedTable.appendChild(this.rows[0])

    for (let i = 0; i < sortedRows.length; i++) {
      sortedTable.appendChild(sortedRows[i])
    }

    this.table.parentNode.replaceChild(sortedTable, this.table)
  }
}
