# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

louis = User.create!(name: "Louis", email: "test@me.com")
ish = User.create!(name: "Ish", email: "Ish@me.com")

tom = Contact.create!(name: "Tom", email: "Tom@whatever.com", user_id: louis.id)
jerry = Contact.create!(name: "Jerry", email: "Jerry@whatever.com",  user_id: louis.id)

tom_share = ContactShare.create!(user_id: louis.id, contact_id: tom.id)
jerry_share = ContactShare.create!(user_id: louis.id, contact_id: jerry.id)
