user1 = User.create(:full_name => 'Timur Vafin', :email => 'me@timurv.ru', :password => '123456')
user2 = User.create(:full_name => 'Test User', :email => 'me2@timurv.ru', :password => '123456')

%W(101 102 103 104 200 201 202 202A 203).each do |room_name|
  room = Room.create(:name => room_name)

  # test data
  1..20.times do |n|
    Unit.create(
      :unit_type => APP_CONFIG['unit_types'].sample,
      :name => "Mac mini #{n}",
      :description => '2GB',
      :room_id => room.id,
      :user_id => user1.id,
      :on_depot => false
    )
  end
end
