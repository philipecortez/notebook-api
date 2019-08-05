namespace :dev do
  desc "make the application setup populating the database"
  task setup: :environment do
    puts "===== creating contact kinds"
    ["Friend", "Coleague", "Comercial"].each do |kind|
      Kind.create(description: kind)
    end
    puts "===== contact kinds created!"

    puts "===== creating contacts..."
    100.times { FactoryBot.create(:contact) }
    puts "===== contacts created!"

    puts "===== creating phone numbers..."
    Contact.all.each do |contact|
      rand(1..3).times.each do
        FactoryBot.create(:phone, contact: contact)
      end
    end
    puts "===== phone numbers created!"
  end

end
