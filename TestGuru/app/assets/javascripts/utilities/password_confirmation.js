document.addEventListener('turbolinks:load', function() {
  var password = document.getElementById('user_password')
  var password_confirmation = document.getElementById('user_password_confirmation')

  if (password && password_confirmation) {
    password.addEventListener('input', validation)
    password_confirmation.addEventListener('input', validation)
  }
})

function validation() {
  var password_value = document.getElementById("user_password").value
  var password_confirmation_value = document.getElementById("user_password_confirmation").value
  
  if (password_confirmation_value.length == 0) {
    this.classList.remove('border-danger')
    this.classList.remove('border-success')
    this.classList.add('border-light')
    return;
  }

  if (password_value != password_confirmation_value) {
    this.classList.remove('border-success')
    this.classList.add('border-danger')
  } else {
    this.classList.remove('border-danger')
    this.classList.add('border-success')
  }
}
