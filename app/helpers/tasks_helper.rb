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

  def display_errors_for_attribute(obj, attribute)
    if obj.errors[attribute].any?
      obj.errors[attribute].each do |error|
        concat(content_tag(:p, error, class: 'text-danger'))
      end
    end
  end
end
