class ValidationUtility{
  constructor(html_object) {
   this.html_object = html_object
   this.value = html_object.value
  }

  validation (value, confirm_value) {
    this.value = value
    this.#set_border_color(confirm_value)
  }

  #set_border_color(confirm_value) {
    this.html_object.className = ""
    if (this.value.length == 0 && confirm_value.length == 0) { return this.html_object.classList.add('border-light') }
    if (this.value != confirm_value) { return this.html_object.classList.add('border-danger') }
    if (this.value == confirm_value) { return this.html_object.classList.add('border-success') }
  }
}
