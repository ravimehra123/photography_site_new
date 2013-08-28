namespace :db do
  desc "TODO"
  task :create_admin => :environment do
  	user =  User.find_by_email('admin@example.com')
  	if user.present?
  		puts "user already exists"
  	else
  		User.create(:email => 'admin@example.com', :password => 'admin1234', :admin => true)
  	end
  end
end
