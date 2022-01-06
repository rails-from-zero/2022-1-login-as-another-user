# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

book_data = YAML.load_file(Rails.root.join("lib/seeds/fixtures.yml"))
user_names = %w(James Steve Catherine David Matthew Linda)

ActiveRecord::Base.transaction do
  book_data.each.with_index do |data, i|
    Book.create!(
      title: data.fetch(:title),
      author: data.fetch(:author),
      price: data.fetch(:price),
      created_at: (1..100).to_a.sample.days.ago,
      image_path: "/images/#{i + 1}.jpg"
    )
  end

  User.create!(
    name: "Administrator",
    email: "admin@somewebsite.com",
    admin: true,
    password: "secret2",
    password_confirmation: "secret2"
  )

  user_names.each do |name|
    email = name.downcase +
            (20..99).to_a.sample.to_s +
            "@" +
            ["gmail2.com", "out1ook.com"].sample

    User.create!(
      name: name,
      email: email,
      password: "secret",
      password_confirmation: "secret"
    )
  end
end
