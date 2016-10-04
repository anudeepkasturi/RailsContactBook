# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

louis = User.create!(name: "Louis", email: "test@me.com")
ish = User.create!(name: "Ish", email: "Ish@me.com")

tom = Contact.create!(name: "Tom", email: "Tom@whatever.com", user_id: louis.id, favorited: true)
jerry = Contact.create!(name: "Jerry", email: "Jerry@whatever.com",  user_id: louis.id)

tom_share = ContactShare.create!(user_id: ish.id, contact_id: tom.id)
jerry_share = ContactShare.create!(user_id: ish.id, contact_id: jerry.id)

comment1 = Comment.create!(commentable: tom, body: "testing1")
comment2 = Comment.create!(commentable: ish, body: "hello1")

contact_group1 = ContactGroup.create!(name: "cats", user_id: louis.id)
cg_assoc1 = ContactGroupAssociation.create!(contact_id: tom.id, contact_group_id: contact_group1.id)
cg_assoc2 = ContactGroupAssociation.create!(contact_id: jerry.id, contact_group_id: contact_group1.id)
