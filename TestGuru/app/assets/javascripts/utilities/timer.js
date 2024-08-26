document.addEventListener('turbolinks:load', function() {
  let timerObject = document.getElementById('timer')
  if (timerObject) { countDown(timerObject) }
})

function countDown(timerObject) {
  let completionTime = new Date(Date.parse(timerObject.dataset.completionTime.replace(/"/g, '')) - Date.now())
  let minutes = completionTime.getMinutes()
  let seconds = completionTime.getSeconds()
  
  if (completionTime < 0) {
    document.querySelector('.passage-form').submit()
    return
  }
  
  timer.textContent = 'До завершения: ' + minutes + ':' + seconds

  setTimeout(countDown, 1000, timerObject)
}
