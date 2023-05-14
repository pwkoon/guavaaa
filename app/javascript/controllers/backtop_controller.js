import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="backtop"
export default class extends Controller {
  connect() {
  }

  updateButton() {
    if (window.pageYOffset > 100) {
      this.element.classList.add("active")
    } else {
      this.element.classList.remove("active")
    }
  }
}
