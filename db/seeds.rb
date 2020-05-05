# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
24.times do |i|
  TimeSlot.create(from:  Time.zone.parse("0#{i}:00"), to: Time.zone.parse("0#{i+1}:00"))
end
channels = ['channel_1','channel_2','channel_3', 'channel_4','channel_5','channel_6','channel_7','channel_8', 'channel_9', 'channel_10']
10.times do |i|
    Channel.create(name: channels[i])
  2.times do |j|
    Show.create(name: Faker::TvShows::BreakingBad.episode, channel_id: Channel.last.id, time_slot_id: rand(1..24))
  end
end
