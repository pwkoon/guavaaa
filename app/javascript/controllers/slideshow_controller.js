import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="slideshow"
export default class extends Controller {
  static targets = ["slide"]
  static values = { index: Number }

  next() {
    this.indexValue++
  }

  previous() {
    this.indexValue--
  }

  indexValueChanged() {
    this.showCurrentSlide()
  }

  showCurrentSlide() {
    this.slideTargets.forEach((element, index) => {
      if (this.indexValue < 0) {
        this.indexValue = 2
      }
      this.indexValue = this.indexValue % 3
      element.hidden = index !== this.indexValue
    })
  }
}
