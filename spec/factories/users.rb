FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@email.com"  }
    password { 'f4k3p455w0rd'  }
  end
end
