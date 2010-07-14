module ApplicationHelper
  def title(page_title, show_title = true)
    @content_for_title = page_title.to_s
    @show_title = show_title
    @content_for_title
  end

  def show_title?
    @show_title
  end

  def unit_location(unit)
    if unit.on_depot?
      link_to('on depot', on_depot_units_path)
    else
      (' in ' +
      link_to(unit.room.name, room_path(unit.room)) +
      ' owned by ' +
      link_to(unit.user.full_name_with_email)).html_safe
    end
  end
end
