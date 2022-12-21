import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "navbarNavAltMarkup" ]

  connect() {

    this.navbarNavAltMarkupTarget.addEventListener('click', () => {
      document.getElementById('navbarNavAltMarkup').classList.toggle('show')
    })
  }
}
