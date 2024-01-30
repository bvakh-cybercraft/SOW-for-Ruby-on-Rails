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
    return unless obj.errors[attribute].any?

    obj.errors[attribute].each do |error|
      concat(content_tag(:p, error, class: 'text-danger'))
    end
  end

  def display_images(obj)
    images = obj.images
    max_count = 5

    if images.count <= max_count
      images.each do |image|
        concat(content_tag(:div, image_tag(image, class: 'img-fluid rounded p-0', style: 'max-width: 100%; height: auto;'), class: 'col p-1'))
      end
    else
      images.first(max_count).each do |image|
        concat(content_tag(:div, image_tag(image, class: 'img-fluid rounded', style: 'max-width: 100%; height: auto;'), class: 'col p-1'))
      end
    end
  end

  def see_all(obj)
    return if obj.images.empty?

    concat(link_to('See more attached files...', task_path(obj), class: 'btn btn-outline-primary mt-2',
                                                                 style: 'height: fit-content'))
  end
end
