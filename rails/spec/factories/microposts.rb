FactoryBot.define do
  factory :orange, class: Micropost do
    content { "I just ate an orange!" }
    created_at { 10.minutes.ago }
  end
  
  factory :tau_manifesto, class: Micropost do
    content { "Check out the @tauday site by @mhartl: http://tauday.com" }
    created_at { 3.years.ago }
  end
  
  factory :cat_video, class: Micropost do
    content { "Sad cats are sad: http://youtu.be/PKffm2uI4dk" }
    created_at { 2.hours.ago }
  end
  
  factory :most_recent, class: Micropost do
    content { "Writing a short test" }
    created_at { Time.zone.now }
  end
  
  30.times do |n|
    factory "micropost_#{n}".to_sym, class: Micropost do
      content { Faker::Lorem.sentence(word_count: 5) }
      created_at { 42.days.ago }
    end
  end

  factory :ants , class: Micropost do
    content { "Oh, is that what you want? Because that's how you get ants!" }
    created_at { 2.years.ago }
  end
  
  factory :zone , class: Micropost do
    content { "Danger zone!" }
    created_at { 3.days.ago }
  end

  factory :tone , class: Micropost do
    content { "I'm sorry. Your words made sense, but your sarcastic tone did not." }
    created_at { 10.minutes.ago }
  end

  factory :van , class: Micropost do
    content { "Dude, this van's, like, rolling probable cause." }
    created_at { 4.hours.ago }
  end
end
