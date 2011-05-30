# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

#create sample users
[
{:login => "Matthew", :password => "matt", :password_confirmation => "matt"},
{:login => "Gregory", :password => "greg", :password_confirmation => "greg"}
].each do|attr|
User.find_or_create_by_login_and_password(attr)
end

[
{:country=>"USA",:city => "NY", :user_id => User.first.id},
{:country=>"Canada",:city => "AB", :user_id => User.last.id}
].each do |attr|
Address.find_or_create_by_user_id(attr)
end

Post.create(:title => "Hello World", :text => "My first blog post.", :user_id => User.first.id)