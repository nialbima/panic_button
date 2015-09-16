# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Cohort.create([
  {name:"Pluto", location: "NYC", start_date: '2015-08-10', end_date: '2015-11-02'},
  {name:"Funke", location: "NYC", start_date: '2015-09-02', end_date: '2015-11-29'}
  ])

User.create([
  {first_name: "Harrison", last_name: "Riddell", email:"harrison@gmail.com", password:"password", cohort:0},
  {first_name: "Meiji", last_name: "Chen", email:"meiji@gmail.com", password:"password", cohort:0},
  {first_name: "Calvin", last_name: "Yeung", email:"calvin@gmail.com", password:"password", cohort:0},
  {first_name: "Jaskar", last_name: "Singh", email:"jaskar@gmail.com", password:"password", cohort:0},
  {first_name: "Joy", last_name: "Morgan", email:"joy@gmail.com", password:"password", cohort:0},
  {first_name: "Brian", last_name: "Deutsch", email:"brian@gmail.com", password:"password", cohort:0},
  {first_name: "Josh", last_name: "Bubis", email:"josh@gmail.com", password:"password", cohort:0},
  {first_name: "Nick", last_name: "Marshall", email:"nialbima@gmail.com", password:"password", cohort:1},
  ])

Resource.create([
  {
    name: "MDN",
    description: "This is the big one. EXCELLENT JS/jQuery information, and also stuff about SVGs. Really good HTML/CSS, too, but W3's good, too.",
    link: 'https://developer.mozilla.org/en-US/docs/Web',
    img_url: 'https://mdn.mozillademos.org/files/6457/mdn_logo_only_color.png',
    week: 1,
    user: 0
  },
  {
    name: "Ruby-Docs",
    description: "ALL HAIL RUBY-DOCS. BOOKMARK THIS NOW. COME BACK TO IT ALWAYS.",
    link: 'http://ruby-doc.org/',
    img_url: 'https://rubydocs.org/assets/icon-9f16fa5760a7de73db7ad4f6cb506d38.png',
    week: 5,
    user: 0
  },
  {
    name: "Rails Guides",
    description: "Narrative guides to Rails. If you're stuck, start with Getting Started to trace your app's behavior.",
    link: 'http://guides.rubyonrails.org/',
    img_url: 'https://upload.wikimedia.org/wikipedia/en/thumb/e/e9/Ruby_on_Rails.svg/791px-Ruby_on_Rails.svg.png',
    week: 6,
    user: 1
  },

# this one needs line breaks
  {
    name: "Debugging",
    description: "General Tips: A) test everything. B) pause everything. C) try to make it explode. D) google. E) yr okay.",
    link: '',
    img_url: 'http://calicat.tripod.com/gif/giant.jpg',
    week: 0,
    user: 1
  }])

#didn't do topics, comments, compliments or resource_topics
