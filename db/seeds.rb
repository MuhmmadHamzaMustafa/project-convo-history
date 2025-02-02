# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


Project.all_statuses.find_or_create_by!(name: "In Progress")
Project.all_statuses.find_or_create_by!(name: "In Dev")
Project.all_statuses.find_or_create_by!(name: "In QA")
Project.all_statuses.find_or_create_by!(name: "Due")
Project.all_statuses.find_or_create_by!(name: "Completed")


