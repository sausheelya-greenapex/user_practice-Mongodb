class User
  include Mongoid::Document
  include Mongoid::Timestamps
  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
  User.create(first_name:"Vartika",last_name:"Tripathi",email:"Vartikaec@gamil.com")
  User.create(first_name:"Sausheelya",last_name:"Tripathi",email:"sausheelya42@gmail.com")
  User.create(first_name:"Krupali",last_name:"Patel",email:"krupali@greenapex.com")
  User.create(first_name:"Jai",last_name:"Rajput",email:"jai@gmail.com")
end
