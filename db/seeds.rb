# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!([
  { email: 'pioquinto@gmail.com', password: 'admin', role: 'admin' }
])

Package.create!([
  { title: 'Package A - CUTE ALBUM', description: 'packageA', status: 'ACTIVE', amount: 15_000 },
  { title: 'Package B - DIGITAL ALBUM', description: 'packageB', status: 'ACTIVE', amount: 25_000 },
  { title: 'Package C - DIGITAL ALBUM', description: 'packageC', status: 'ACTIVE', amount: 35_000 },
  { title: 'Package D - DIGITAL ALBUM', description: 'packageD', status: 'ACTIVE', amount: 45_000 },
  { title: 'SOLO A', description: 'Video Only DVD', status: 'ACTIVE', amount: 5_500 },
  { title: 'SOLO B', description: '100 Copies Album Only', status: 'ACTIVE', amount: 8_250 },
  { title: 'SOLO C', description: 'Cute AlBUM Only', status: 'ACTIVE', amount: 12_000 },
  { title: 'SOLO D', description: 'Service Only (Photo CD)', status: 'ACTIVE', amount: 3_500 }
])
