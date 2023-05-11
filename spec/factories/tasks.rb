FactoryBot.define do
  factory :task do
    title { "Example" }
    deadline { "Sun, 01 Jan 2023" } 
  end

  trait :done do
    done_at { "Wed, 10 May 2023 00:00:00.000000000 UTC +00:00" }
end