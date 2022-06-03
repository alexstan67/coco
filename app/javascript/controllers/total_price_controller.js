import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "hourlyPrice", "totalPrice" ]

  connect() {
    console.log("connected!");
  }
  calculate() {
    console.log("calculate!");
    let hourlyPrice = this.hourlyPriceTarget.innerHTML;
    let duration = event.currentTarget.value / 60;
    let totalPrice = hourlyPrice * duration;
    console.log(totalPrice);
    this.totalPriceTarget.innerHTML = `Total price: ${totalPrice} €`;
  }
}
