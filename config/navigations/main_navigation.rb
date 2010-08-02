SimpleNavigation::Configuration.run do |navigation|  
  navigation.selected_class = 'current'
  navigation.autogenerate_item_ids = false

  navigation.items do |primary|
    primary.dom_class = 'navigation'

    primary.item :units, 'Units', units_path, :if => Proc.new { user_signed_in? && can?(:read, Unit) }
    primary.item :depot, 'Depot', on_depot_units_path, :if => Proc.new { user_signed_in? && can?(:read, Unit) }
    primary.item :rooms, 'Rooms', rooms_path, :if => Proc.new { user_signed_in? && can?(:read, Room) }
    primary.item :users, 'Users', users_path, :if => Proc.new { user_signed_in? && can?(:read, User) }
  end
end