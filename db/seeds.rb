role = Role.create(:name => 'admin')
user = User.create(:full_name => 'Admin', :email => 'admin@example.com', :password => '123456')
user.roles << role

%W(101 102 103 104 200 201 202 202A 203).each do |room_name|
  Room.create(:name => room_name)
end
