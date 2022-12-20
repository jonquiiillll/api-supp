# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Start"
User.destroy_all
puts "Удаление всех постов"
users = User.create([
  {name: "Аня", age:20, problems:"Апатия", email: "john@hse.ru", isadmin: false, description: 'Ищу комфортное общение, поддержку и взаимопонимание. Думаю, как закончить учебу и найти работу по специальности или просто по душе. Тревожусь по поводу будущего. Хочу поговорить с кем-то на эту тему.', avatar:"https://i.pinimg.com/564x/73/67/9f/73679fa3894ee8e7bbbd93087fadf94b.jpg"},
  {name: "Степа", age:20,problems:"Апатия", email: "johnii@hse.ru", isadmin: true, description: 'Не могу понять, что делать со своей жизнью. Постоянно тревожусь и заедаю стресс. Чувствую себя одиноко, так как отдаляюсь от друзей. Может быть кто-то здесь сможет мне помочь. Хочу с кем-нибудь поговорить!(', avatar:"https://i.pinimg.com/564x/fe/a4/4d/fea44d5f44e3c0c9bdcfe7d51a4d954a.jpg"},
  {name: "Вероника", age:20, problems:"Апатия", email: "johniii@hse.ru", isadmin: false, description: 'Я пытаюсь сделать код и чувствую себя глупой', avatar:"https://i.pinimg.com/564x/02/78/f3/0278f318881c8f57f55c721a6b8b01d0.jpg"}
  ])


puts "End"
