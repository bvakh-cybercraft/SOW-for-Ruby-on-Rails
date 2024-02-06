FactoryBot.define do
  factory :task do
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    due_date { Faker::Date.forward(days: 7) }
    status { Task.statuses.keys.sample }
    priority { Task.priorities.keys.sample }
  end
end
