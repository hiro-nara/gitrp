# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Staff.create!(
  staff_no:'060079', 
  name:'中村 博', 
  department:'中部事業部 中部AM事業部 第一BU M分室', 
  dep_1st:'中部事業部', 
  dep_2nd:'中部AM事業部', 
  dep_3rd:'第一BU', dep_bunshitsu:'M分室', 
  position:'一般', 
  email:'hiro@em', 
  account_id:1)
#Staff.create(staff_no:'061111', name:'佐藤 太郎', department:'中部事業部 中部AM事業部 第一BU M分室', dep_1st:'中部事業部', dep_2nd:'中部AM事業部', dep_3rd:'第一BU', dep_bunshitsu:'M分室', position:'一般', email:'taro@em1') 
