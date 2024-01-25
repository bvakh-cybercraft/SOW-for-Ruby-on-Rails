module TasksHelper
  def priority_color(task)
    case task.priority.to_sym
    when :low
      'bg-secondary'
    when :medium
      'bg-warning'
    when :high
      'bg-danger'
    else
      'bg-danger'
    end
  end

  def active_check(task)
    case task.status.to_sym
    when :active
      'bg-success'
    when :completed
      'bg-secondary'
  end
end
