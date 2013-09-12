namespace :db do
  desc "TODO"
  task :create_admin => :environment do
  	user = User.find_by_email("admin@example.com")
  	if user.present?
  		puts "Admin already exists"
  	else
  		User.create(:email=> "admin@example.com", :password => "admin1234")
  	end
  end

end
