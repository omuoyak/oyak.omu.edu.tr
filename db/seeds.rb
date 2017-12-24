# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(
  email: 'test@oyak.omu.edu.tr',
  name: 'ÖYAK',
  role: 'admin',
  password: '123456',
  password_confirmation: '123456'
)
Setting.title = 'Özgür Yazılım ve Açık Kaynak Topluluğu - OMÜ'
Setting.description = 'Ondokuzmayıs Üniversitesi Özgür Yazılım ve Açık Kaynak Topluluğu'
Setting.keywords = 'omü öyak,öyak,linux,ruby,özgür yazılım,açık kaynak'
Setting.uri = 'http://oyak.omu.edu.tr'
Category.create(
  title: 'Teknik',
  description: 'Teknik yazılar',
  keywords: 'oyak teknik'
)
