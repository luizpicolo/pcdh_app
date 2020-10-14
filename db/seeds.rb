# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.last
HydroponicData.delete_all
Hydroponic.delete_all
Greenhouse.delete_all

(1..2).each do |i|
  greenhouse = Greenhouse.create({
    identifier: "Bancada #{i}",
    user_id: user.id
  })

  (1..3).each do |i|
    hydroponic = Hydroponic.create({
      identifier: "Bancada #{i}",
      greenhouse_id: greenhouse.id
    })

    minute = 0
    hour = 1

    (1..100).each do |_i|
      if minute > 59
        minute == 0
        hour = if hour <= 24
          hour + 1
        else
          1
        end
      end
      
      HydroponicData.create({
        temperature: rand(27..30.2),
        humidity: rand(60..70),
        waterflow: rand(1..3),
        ph: rand(6..7.1),
        ce: rand(2..3.1),
        created_at: "2020-09-23 #{hour}:#{minute}:00",
        hydroponic_id: hydroponic.id
      })
      minute += 10
    end
  end
end
