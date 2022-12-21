import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "sidebarNav" ]

  connect() {

    const element = document.getElementById('sidebar')

    setTimeout(function(){
      element.classList.add('sidebar-hide');
    }, 5000);

    setTimeout(function(){
      element.style.display = 'none';
    }, 6000);
  }
}
