# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Meeting.destroy_all
Member.destroy_all

sqls = File.open(File.join(Rails.root, "db", "seeds.sql")).read.split(";")
sqls.each do |sql|
	if sql.length > 5
		sql = sql+";"
		print sql
		ActiveRecord::Base.connection.execute(sql)
		print "---OK---"
	end
end