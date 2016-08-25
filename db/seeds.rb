# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
if Apartment::Tenant.current_tenant == 'public'
  u1= User.create!(email: 'info1@gmail.com',
                   subdomain: 'prueba1',
                   email: "claudio1@gmail.com"
                   )

  u2= User.create!(email: 'info2@gmail.com',
                   subdomain: 'prueba2',
                   email: "claudio1@gmail.com"
                   )
end

if Apartment::Tenant.current_tenant == 'prueba1'
   (1..1000).each do |i|
     Product.create!(name: "PRUEBA 1 producto #{i}",
     	description: "descripcion ##{i}",
     	code: i)
   end
end

if Apartment::Tenant.current_tenant == 'prueba2'
   (1..1000).each do |i|
     Product.create!(name: "PRUEBA 2 producto #{i}",
     	description: "descripcion ##{i}",
     	code: i)
   end
end