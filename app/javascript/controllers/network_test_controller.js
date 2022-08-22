import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static values = { url: String };
  static targets = ["message"];

  async test() {
    const startTime = new Date();

    const response = await fetch(this.urlValue + '.json');
    const result = await response.json();

    const endTime = new Date();

    this.messageTarget.textContent = `Operation took ${
      endTime.getTime() - startTime.getTime()
    } msec`;
  }
}
