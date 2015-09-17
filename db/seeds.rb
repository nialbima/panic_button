Comment.delete_all
Topic.delete_all
Resource.delete_all
User.delete_all
Cohort.delete_all

# binding.pry

Cohort.create([
  {name:"Pluto", location: "NYC", start_date: '2015-08-10', end_date: '2015-11-02'},
  {name:"Funke", location: "NYC", start_date: '2015-09-02', end_date: '2015-11-29'}
  ])

User.create([
  {first_name: "Harrison", last_name: "Riddell", email:"harrison@gmail.com", password_digest:"password", cohort:Cohort.find(1)},
  {first_name: "Meiji", last_name: "Chen", email:"meiji@gmail.com", password_digest:"password", cohort:Cohort.find(1)},
  {first_name: "Calvin", last_name: "Yeung", email:"calvin@gmail.com", password_digest:"password", cohort:Cohort.find(1)},
  {first_name: "Jaskar", last_name: "Singh", email:"jaskar@gmail.com", password_digest:"password", cohort:Cohort.find(1)},
  {first_name: "Joy", last_name: "Morgan", email:"joy@gmail.com", password_digest:"password", cohort:Cohort.find(1)},
  {first_name: "Brian", last_name: "Deutsch", email:"brian@gmail.com", password_digest:"password", cohort:Cohort.find(1)},
  {first_name: "Josh", last_name: "Bubis", email:"josh@gmail.com", password_digest:"password", cohort:Cohort.find(1)},
  ])

Resource.create([
  {
    name: "MDN",
    description: "This is the big one. EXCELLENT JS/jQuery information, and also stuff about SVGs. Really good HTML/CSS, too, but W3's good, too.",
    link: 'https://developer.mozilla.org/en-US/docs/Web',
    img_url: 'https://mdn.mozillademos.org/files/6457/mdn_logo_only_color.png',
    week: 1,
    user: User.find(1)
  },
  {
    name: "RubyGems",
    description: "Find new gems!",
    link: 'https://rubygems.org/',
    img_url: 'https://rubydocs.org/assets/icon-9f16fa5760a7de73db7ad4f6cb506d38.png',
    week: 5,
    user: User.find(1)
  },
  {
    name: "Rails Guides",
    description: "Narrative guides to Rails. If you're stuck, start with Getting Started to trace your app's behavior.",
    link: 'http://guides.rubyonrails.org/',
    img_url: 'https://upload.wikimedia.org/wikipedia/en/thumb/e/e9/Ruby_on_Rails.svg/791px-Ruby_on_Rails.svg.png',
    week: 6,
    user: User.find(2)
  },

# this one needs line breaks
  {
    name: "Pry",
    description: "General Tips: A) test everything. B) pause everything. C) try to make it explode. D) google. E) yr okay.",
    link: 'https://github.com/pry/pry/wiki/Documentation-browsing',
    img_url: 'http://calicat.tripod.com/gif/giant.jpg',
    week: 0,
    user: User.find(2)
  }])

Topic.create([
  {name: "Rails", docs_url: "http://apidock.com/rails", description: "Framework for rapid web development"},
  {name: "Ruby", docs_url: "http://ruby-doc.org/core-2.2.0/", description:"RUBY."},
  {name: "Javascript", docs_url: "https://www.javascript.com/", description:"Fast, responsive front-end scripting language"},
  {name: "Debugging", docs_url: "https://www.stackoverflow.com", description:"KILL THE BUG. KILL THE BUG. KILL THE BUG."}
])

Comment.create({content: "cool job guys", resource:Resource.find(1), user:User.find(1)})
Comment.create({content: "cool job guys", resource:Resource.find(2), user:User.find(1)})
Comment.create({content: "cool job guys", resource:Resource.find(3), user:User.find(1)})
Comment.create({content: "cool job guys", resource:Resource.find(4), user:User.find(1)})

ResourceTopic.create({resource: Resource.find(2), topic: Topic.find(2)})
ResourceTopic.create({topic: Topic.find(1), resource: Resource.find(3)})
ResourceTopic.create({topic: Topic.find(3), resource: Resource.find(1)})
# testing multiple categories
ResourceTopic.create([
  {topic: Topic.find(4), resource: Resource.find(4)},
  {topic: Topic.find(2), resource: Resource.find(4)},
  ])

Compliment.create([
  {week:1, text: "Step back. This is a machine. It does predictable things. It's doing what you ask it to do. Make sure you know what you're asking"},
  {week:2, text: "Everything ALWAYS breaks. Everything's always fixable (in WDI). Fucking up is a good thing."},
  {week:3, text: "You're making coffee sweats and sleep deprivation look great! But sleeping > code, every time. Go sleep."},
  {week:4, text: "Read the docs again. You aren't even CLOSE to blind yet."},
  {week:5, text: "Laundry can wait. Like, 3 days at least. Nobody's going to notice."},
  {week:6, text: "IT IS A PROVEN FACT THAT SWEARING AT A LAPTOP AND MUTTERING DARKLY AT DOCS ARE SIGNS OF GOOD MENTAL CONDITIONING."},
  {week:7, text: "'Holy shit I broke the entire fucking thing oh shit oh shit' is normal, you're fine!"},
  {week:8, text: "Your self-care regimen is ON POINT. GOOD WORK."}
 ])
