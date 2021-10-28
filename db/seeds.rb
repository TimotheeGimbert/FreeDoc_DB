# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Patient.destroy_all
Doctor.destroy_all
Appointment.destroy_all

50.times do
  patient = Patient.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
  puts patient
end

10.times do
  doctor = Doctor.create(
    first_name: Faker::Name.first_name,
    last_name: 'Dr. ' + Faker::Name.last_name,
    specialty: ['generalist', 'globalist', 'limitist', 'placebist'][rand(0..3)],
    zip_code: Faker::Number.within(range: 33000..34000)
  )
  puts doctor
end

100.times do
  appointment = Appointment.create(
    doctor: Doctor.all[rand(0..9)],
    patient: Patient.all[rand(0..99)],
    date: Faker::Date.between(from: 2.days.ago, to: Date.today)
  )
  puts appointment
end