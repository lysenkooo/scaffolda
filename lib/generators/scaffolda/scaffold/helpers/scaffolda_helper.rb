module ScaffoldaHelper
  def current_page
    params[:page] || 1
  end

  def search_query
    params[:search] || ''
  end

  def sort_column(model = nil)
    if model
      model.column_names.include?(params[:sort]) ? params[:sort] : 'id'
    else
      'id'
    end
  end

  def sort_direction
    %w(asc desc).include?(params[:direction]) ? params[:direction] : 'desc'
  end

  def sort_query(model = nil)
    "#{sort_column(model)} #{sort_direction}"
  end

  def sortable(column, model, title = nil)
    title ||= model.human_attribute_name(column)
    css_class = (column.to_s == sort_column(model)) ? "current #{sort_direction}" : nil
    direction = (column.to_s == sort_column(model) && sort_direction == 'desc') ? 'asc' : 'desc'

    link_to title, { sort: column, direction: direction, page: current_page, search: search_query, remote: true },
                   { class: css_class }
  end
end
