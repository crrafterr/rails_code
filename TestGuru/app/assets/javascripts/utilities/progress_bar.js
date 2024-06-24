document.addEventListener('turbolinks:load', function() {
  let progressBar = document.querySelector('.progress-bar')

  if (progressBar) {
    let progress = 100/progressBar.dataset.questionCount * (progressBar.dataset.currentQuestionNumber - 1) + "%"
    progressBar.style.width = progress
  }
})
