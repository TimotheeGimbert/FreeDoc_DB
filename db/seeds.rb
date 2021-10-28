# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Appointment.destroy_all
Patient.destroy_all
Doctor.destroy_all
City.destroy_all

bdx = City.create(name: 'Bordeaux')
nan = City.create(name: 'Nantes')
par = City.create(name: 'Paris')

10.times do
  doctor = Doctor.create(
    first_name: Faker::Name.first_name,
    last_name: 'Dr. ' + Faker::Name.last_name,
    specialty: ['generalist', 'globalist', 'limitist', 'placebist'][rand(0..3)],
    zip_code: Faker::Number.within(range: 33000..34000),
    city: [bdx, nan, par][rand(0..2)]

  )
  puts doctor
end

50.times do
  patient = Patient.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    city: [bdx, nan, par][rand(0..2)]
  )
  puts patient
end

100.times do
  appointment = Appointment.create(
    doctor: Doctor.all[rand(0..9)],
    patient: Patient.all[rand(0..50)],
    date: Faker::Date.between(from: 2.days.ago, to: Date.today),
    city: [bdx, nan, par][rand(0..2)]
  )
  puts appointment
end

Appointment.all.each do |rdv|
  rdv.update(city: rdv.doctor.city)
  puts "Appointment scheduled at the doctor's city : " + rdv.city.name
end