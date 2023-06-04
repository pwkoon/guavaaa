import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="slideshow"
export default class extends Controller {
  static targets = ["slide"]
  static values = { index: Number, reviews: Number}

  connect() {
    // console.log(this.reviewsValue)
  }

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
        this.indexValue = (this.reviewsValue - 1)
      }
      this.indexValue = this.indexValue % this.reviewsValue
      element.hidden = index !== this.indexValue
    })
  }
}
