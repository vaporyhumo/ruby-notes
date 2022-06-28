require 'bundler/inline'

gemfile do
  source "https://rubygems.org"

  gem 'activerecord'
  gem 'sqlite3'
end

require 'sqlite3'
require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'db.sql'
)

ActiveRecord::Schema.define do
  create_table :shows, force: true do |t|
    t.string :name
    t.integer :year
  end

  create_table :episodes, force: true do |t|
    t.string :name
    t.belongs_to :show, index: true
  end
end

class Show < ActiveRecord::Base
  validates :name, presence: true

  has_many :episodes
end

class Episode < ActiveRecord::Base
  belongs_to :show
end

# creates a new object, that is not saved to the database. this is also
# known as `building` and object.
new_show = Show.new(name: 'stranger things') 

# create **and save** an object to the database directly.
# this will fail quietly if validations fail
created_show = Show.create(name: 'spy family', year: 2022)
failed_show = Show.create

# create and save to database. RAISE an error if validations fail.
bang_show = Show.create!(name: 'avatar', year: 2000)

# find one or many records by id. RAISE an error if any record is not found
found_show = Show.find(1)
found_shows = Show.find(1, 2)

# find one record by attributes.
stranger_things = Show.find_by(name: 'stranger things')

# find or RAISSE an error
spy_family = Show.find_by!(name: 'spy family')

# find the ONE and ONLY record by attributes. RAISE an error if there
# are many records that meet the conditions
avatar = Show.find_sole_by(year: 2000)

# find many records by attributes
Show.create(name: 'euphoria', year: 2022)
shows_2022 = Show.where(year: 2022)

# get ALL records
shows = Show.all
binding.irb
