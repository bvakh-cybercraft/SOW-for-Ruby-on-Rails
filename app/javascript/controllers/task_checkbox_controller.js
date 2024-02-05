import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="task-checkbox"
export default class extends Controller {
  connect() {
  }

  mark_as_completed(e) {
    e.preventDefault();
    const taskCheckbox = this.element;
    const checkboxInput = taskCheckbox.querySelector("input[type='checkbox']");

    fetch(`task_checkboxes/${taskCheckbox.id}`, {
      method: "PATCH",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content
      },
      body: JSON.stringify({
        checked: checkboxInput.checked
      })
    })
      .then(response => {
        if (response.ok) {
          console.log("Task Checkbox Updated");
        } else {
          console.error("Failed to update task checkbox");
        }
      })
  }

  mark_as_active(e) {
    e.preventDefault();
    const taskCheckbox = this.element;
    const checkboxInput = taskCheckbox.querySelector("input[type='checkbox']");

    fetch(`task_checkboxes/${taskCheckbox.id}`, {
      method: "PATCH",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content
      },
      body: JSON.stringify({
        checked: checkboxInput.checked
      })
    })
      .then(response => {
        if (response.ok) {
          console.log("Task Checkbox Updated");
        } else {
          console.error("Failed to update task checkbox");
        }
      })
  }
}
