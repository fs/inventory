SimpleNavigation::Configuration.run do |navigation|  
  navigation.selected_class = 'current'
  navigation.autogenerate_item_ids = false

  navigation.items do |primary|
    primary.item :units, 'Units', units_path
    primary.item :depot, 'Depot', on_depot_units_path
    primary.item :rooms, 'Rooms', rooms_path
    primary.item :users, 'Users', users_path
  end
end