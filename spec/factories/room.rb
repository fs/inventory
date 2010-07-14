Factory.sequence :room_name do |n|
 "20#{n}"
end

Factory.define :room do |u|
  u.name { Factory.next(:room_name) }
end
