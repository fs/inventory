SimpleNavigation::Configuration.run do |navigation|  
  navigation.selected_class = 'current'
  navigation.autogenerate_item_ids = false

  navigation.items do |primary|
    primary.dom_class = 'navigation'

    primary.with_options(:if => Proc.new { user_signed_in? }) do |signed_in_user|
      signed_in_user.item :units, 'Units', units_path
      signed_in_user.item :depot, 'Depot', on_depot_units_path
      signed_in_user.item :rooms, 'Rooms', rooms_path
      signed_in_user.item :users, 'Users', users_path
    end
  end
end