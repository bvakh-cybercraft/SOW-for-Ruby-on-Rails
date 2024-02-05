import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="task"
export default class extends Controller {
    static targets = [
      'taskCheckboxFields',
      'taskCheckboxes',
      'taskCheckbox',
    ]
  connect() {
  }

  addTaskCheckbox(e) {
    e.preventDefault();
    console.log(this.taskCheckboxFieldsTarget);
    console.log(this.taskCheckboxesTarget);
    this.taskCheckboxesTarget.insertAdjacentHTML('beforeend', this.taskCheckboxFieldsTarget.innerHTML);
  }
  
  remove_association(event) {
    event.preventDefault()

    let wrapper = event.target.closest(".nested-fields")

    console.log(wrapper);
    wrapper.remove();
  }
}
