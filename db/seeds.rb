# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

item = See.create( [{name: 'Water',points: 4} ,{ name: 'Food',points:3 } ,{ name: 'Medication' ,points:2} ,{ name: 'Ammunition', points:1}])
user = Survivor.create([{id:1,name: 'Rick',age: 35,gender: 'Masculino',infected: false},{id:2,name: 'Carol',age: 25,gender: 'Feminino',infected: false}])
item = Item.create([{name: 'Food',quant: 5,survivor_id:1},{name: 'Medication',quant: 15,survivor_id:1},{name: 'Ammunition',quant: 10,survivor_id:2}])