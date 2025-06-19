require 'faker'

namespace :seed do

  task :populatecategories => :environment do

    categories = [ "Strings", "Brass", "Woodwinds", "Percussion", "Keyboards",
      "Electronic", "Folk", "World", "Vocal", "Experimental" ]

    categories.each do |name|  
      Category.create!(
        category_name: name
      )
    end
  end

  task :populatecountries => :environment do
    150.times do  
      Country.create!(
        country_name: Faker::Address.unique.country
      )
    end
  end

  task :populatecustomers => :environment do
    countries = Country.all.to_a
    40.times do
      Customer.create!(
        customer_name: Faker::Name.unique.name,
        email: Faker::Internet.unique.email,
        phone: Faker::PhoneNumber.phone_number,
        delivery_address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
        country: countries.sample
      )
    end
  end

  task :populatestores => :environment do
    countries = Country.all.to_a
    company_name = " Quinn-tessential Music"  
    7.times do  
      Store.create!(
        store_name: "#{company_name} - #{Faker::Address.street_name}",
        address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
        phone: Faker::PhoneNumber.phone_number,
        country:countries.sample
      )
    end
  end

  task :populateemployees => :environment do
    stores = Store.all.to_a
    positions = ["Manager", "Sales Associate", "Cashier", "Technician", "Stock Clerk", "Customer Service"]

    50.times do
      store = stores.sample
      Employee.create!(
        employee_name: Faker::Name.unique.name,
        store_id: store.id,
        position: positions.sample,
        hire_date: Faker::Date.between(from: '2015-01-01', to: Date.today),
        birth_date: Faker::Date.birthday(min_age: 18, max_age: 65),
        phone: Faker::PhoneNumber.phone_number,
        email: Faker::Internet.unique.email
        )
    end
  end

  task :populatemanufacturers => :environment do
    countries = Country.all.to_a
    manufacturers = ["Yamaha","Fender","Gibson","Roland","Kawai","Steinway & Sons","Pearl","Shure","Selmer","Bach",
      "Martin","Gretsch","Ludwig","Ibanez","Zildjian"]

    manufacturers.each do |name|
      Manufacturer.create!(
        manufacturer_name: name,
        country_id: countries.sample.id,
        email: Faker::Internet.unique.email
      )
    end
  end

  task :populateinstruments => :environment do
    instruments_by_category = {
      "Strings" => ["Acoustic Guitar", "Electric Guitar", "Bass Guitar", "Violin", "Cello"],
      "Brass" => ["Trumpet", "Trombone"],
      "Woodwinds" => ["Flute", "Clarinet", "Saxophone"],
      "Percussion" => ["Drum Kit", "Snare Drum"],
      "Keyboards" => ["Piano", "Synthesizer", "Accordion"],
      "Electronic" => ["Synthesizer", "Drum Machine", "Theremin"],
      "Folk" => ["Banjo", "Mandolin", "Dulcimer"],
      "World" => ["Sitar", "Djembe", "Erhu"],
      "Vocal" => ["Microphone", "Vocal Processor", "Loop Station"],
      "Experimental" => ["Waterphone", "Prepared Piano", "Noise Box"]
      }

    instruments_by_category.each do |category_name, instrument_names|
      category = Category.find_by(category_name: category_name)

      instrument_names.each do |instrument_name|
        Instrument.create!(
          instrument_name: instrument_name,
          category: category,
        )
      end
    end
  end

  task :populateitems => :environment do
    manufacturers = Manufacturer.all.to_a
    instruments = Instrument.all.to_a
    conditions = ["New", "Like New", "Used", "Refurbished", "Vintage"]
    
    100.times do
      Item.create!(
        instrument: instruments.sample,
        manufacturer: manufacturers.sample,
        serial_number: Faker::Device.serial,
        description: Faker::Lorem.sentence(word_count: 10),
        condition: conditions.sample,
        production_year: rand(1990..2024),
        price: rand(100..5000).to_f.round(2)
      )
    end
  end

  task :populateorders => :environment do
    customers = Customer.all.to_a
    employees = Employee.all.to_a
    payment_statuses = ["Paid", "Pending", "Failed"]
    delivery_statuses = ["Delivered", "In Transit", "Pending", "Cancelled"]

    50.times do
      order_date = Faker::Date.between(from: 6.months.ago, to: Date.today)

      Order.create!(
        customer: customers.sample,
        employee: employees.sample,
        order_date: order_date,
        delivery_date: order_date + rand(1..10).days,
        payment_status: payment_statuses.sample,
        delivery_status: delivery_statuses.sample,
        total_price: rand(100..10000).to_f.round(2)
      )
    end
  end


  task :populateorderitems => :environment do
    orders = Order.all.to_a
    items = Item.all.to_a

    orders.each do |order|
      items.sample(rand(1..3)).each do |item|
        OrderItem.create!(
          order: order,
          item: item
        )
      end
    end
  end

  task :populaterepairs => :environment do
    items = Item.all.to_a
    customers = Customer.all.to_a
    payment_statuses = ["Paid", "Pending", "Failed"]

    30.times do
      Repair.create!(
        item: items.sample,
        customer: customers.sample,
        repair_date: Faker::Date.backward(days: 365),
        description: Faker::Lorem.sentence(word_count: 10),
        price: rand(50..500).round(2),
        payment_status: payment_statuses.sample
      )
    end
  end

  task :populateitemmodels => :environment do
    
    Item.find_each do |item|
      item.update!(model: Faker::Device.model_name)
    end
    
  end

end
