document.addEventListener('turbolinks:load', function() {
  if (document.getElementById('user_password') && document.getElementById('user_password_confirmation')) {
    let password = new ValidationUtility(document.getElementById('user_password'))
    let password_confirmation = new ValidationUtility(document.getElementById('user_password_confirmation'))
  
    password.html_object.oninput = function() {
      password.validation(this.value, password_confirmation.value)
      password_confirmation.validation(password_confirmation.value, password.value)
    }

    password_confirmation.html_object.oninput = function() {
      password_confirmation.validation(this.value, password.value)
      password.validation(password.value, password_confirmation.value)
    }
   }
  }
)
