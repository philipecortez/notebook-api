namespace :dev do
  desc "make the application setup populating the database"
  task setup: :environment do
    puts "===== creating contacts..."
    100.times { FactoryBot.create(:contact) }
    puts "===== contacts created!"
  end

end
