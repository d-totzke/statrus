# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create([{name: 'Dylan', email: 'dylan.totzke@uwaterloo.ca', password: 'pass.me', password_confirmation: 'pass.me'}])
status = Status.create([{status: 'Available'},{status: 'Back Shortly'},{status: 'In a Meeting'},{status: 'Working Remotely'},{status: 'Out of the Office'}])