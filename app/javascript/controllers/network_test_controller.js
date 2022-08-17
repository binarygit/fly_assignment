import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static values = { url: String };
  static targets = ["message"];

  test() {
    let start = new Date();

    fetch(this.urlValue)
      .then((response) => response.json())
      .then((responseData) => {
        let end = new Date();
        this.messageTarget.textContent = `The response data is ${responseData} and the operation took ${
          end.getTime() - start.getTime()
        } msec`;
      });
  }
}
