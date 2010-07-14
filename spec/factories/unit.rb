Factory.sequence :inv_id do |n|
 n
end

Factory.define :unit do |u|
  u.inv_id { Factory.next(:inv_id) }
  u.unit_type APP_CONFIG['unit_types'].sample
  u.name 'Mac mini'
  u.description '2GB'
  u.room {|a| a.association(:room) }
  u.user {|a| a.association(:user) }
end
