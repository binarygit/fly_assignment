import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { url: String }
  static targets = ["message"]

  test() {
    let start = new Date()

    fetch(this.urlValue)
      .then(response => response.json())
      .then(result => console.log(result))
    
    let end = new Date()

    this.messageTarget.textContent = `Operation took ${end.getTime() - start.getTime()} msec`
  }
}
