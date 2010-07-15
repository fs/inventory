User.create(:full_name => 'Timur Vafin', :email => 'me@timurv.ru', :password => '123456')

%W(101 102 103 104 200 201 202 202A 203).each do |room_name|
  Room.create(:name => room_name)
end
