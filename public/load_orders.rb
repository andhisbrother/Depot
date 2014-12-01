Order.transaction do 
	(1..100).each do |i|
		Order.create(:name => "Zakaznik #{i}", :address => "Hlavna #{i}", :email => "Zakaznik-#{i}@dakde.sk", :pay_type => "Dobierka" )
	end
end
