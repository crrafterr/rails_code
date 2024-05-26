document.addEventListener('turbolinks:load', function() {
  let password = document.getElementById('user_password')
  let password_confirmation = document.getElementById('user_password_confirmation')

    password.oninput = function() {
      password.value = this.value
      set_border_color(password, password_confirmation)
    }

    password_confirmation.oninput = function() {
      password_confirmation.value = this.value
      set_border_color(password, password_confirmation)
    }
 }
)

function set_border_color(password, password_confirmation){
  password_utility = new Utility(password)
  password_confirmation_utility = new Utility(password_confirmation)

  validation_status = validation(password.value, password_confirmation.value)
  
  password_utility.set_class(validation_status)
  password_confirmation_utility.set_class(validation_status)
}

function validation(password_value, password_confirmation_value) {
   
  if (password_confirmation_value.length == 0) {
    return 'light'
  } else if (password_value != password_confirmation_value) {
    return 'danger'
  } else {
    return 'success'
  }
}

class Utility{
  constructor(html_element){
   this.html_element = html_element
  }
 
  set_class(value){
   if (value == 'light') {
     this.html_element.classList.remove('border-danger')
     this.html_element.classList.remove('border-success')
     this.html_element.classList.add('border-light')
   } else if (value == 'danger') {
     this.html_element.classList.remove('border-light')
     this.html_element.classList.remove('border-success')
     this.html_element.classList.add('border-danger')
   } else {
     this.html_element.classList.remove('border-light')
     this.html_element.classList.remove('border-danger')
     this.html_element.classList.add('border-success')
   }
  }
 } 
