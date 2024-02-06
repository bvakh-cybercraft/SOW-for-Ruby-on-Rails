import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="task"
export default class extends Controller {
    static targets = [
      'taskCheckboxFields',
      'taskCheckboxes',
    ]
  connect() {
  }

  addTaskCheckbox(e) {
    e.preventDefault();
    this.taskCheckboxesTarget.insertAdjacentHTML('beforeend', this.taskCheckboxFieldsTarget.innerHTML);
  }

  remove_association(e) {
    e.preventDefault()
    let wrapper = e.target.closest(".nested-fields")
    wrapper.remove();
  }
}