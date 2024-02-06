import { Controller } from "@hotwired/stimulus"

function showNotice(message) {
  const messageContainer = document.getElementById("message_container");
  const notice = document.createElement("p");
  notice.classList.add("mx-3", "mt-3", "alert", "alert-success");
  notice.textContent = message;
  messageContainer.appendChild(notice);

  setTimeout(() => {
    notice.remove();
  }, 5000);
}

// Connects to data-controller="task-checkbox"
export default class extends Controller {
  connect() {
    const inputField = this.element.querySelector("input[type='text']");
    const updateButton = this.element.querySelector(".btn-primary");
    const updateButtonContainer = document.getElementById("update_btn_container");
    const initialValue = inputField.value;

    inputField.addEventListener("input", () => {
      const hasChanges = inputField.value !== initialValue;
      console.log(hasChanges)
      updateButtonContainer.style.display = hasChanges ? "block" : "none";
    });

    updateButton.addEventListener("click", () => {
      updateButtonContainer.style.display = "none";
    });
  }

  mark_as_completed(e) {
    e.preventDefault();
    const taskCheckbox = this.element;
    const checkboxInput = taskCheckbox.querySelector("input[type='checkbox']");

    fetch(`/task_checkboxes/${taskCheckbox.id}`, {
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

          showNotice("Task checkbox status was successfully updated.");
        } else {
          console.error("Failed to update task checkbox");
        }
      })
  }

  mark_as_active(e) {
    e.preventDefault();
    const taskCheckbox = this.element;
    const checkboxInput = taskCheckbox.querySelector("input[type='checkbox']");

    fetch(`/task_checkboxes/${taskCheckbox.id}`, {
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

          showNotice("Task checkbox status was successfully updated.");
        } else {
          console.error("Failed to update task checkbox");
        }
      })
  }

  triggerNameChange(e) {
    e.preventDefault();

    const taskCheckbox = this.element;
    const taskCheckboxId = taskCheckbox.id;
    const nameInput = taskCheckbox.querySelector("input[type='text']");
    const newName = nameInput.value;

    fetch(`/task_checkboxes/${taskCheckboxId}`, {
      method: "PATCH",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content
      },
      body: JSON.stringify({
        name: newName
      })
    })
      .then(response => response.json())
      .then(data => {
        if (data.status === "success") {
          console.log("Task Checkbox Name Updated");

          showNotice("Task checkbox name was successfully updated.");
        } else {
          console.error("Failed to update task checkbox name");
        }
      })
  }
}