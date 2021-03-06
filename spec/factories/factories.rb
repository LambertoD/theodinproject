FactoryGirl.define do

  factory :user, :aliases => [:creator] do
    before(:create) do |user|
      user.stub(:send_welcome_email)
    end
    sequence :username do |n|
      "foobar#{n}"
    end
    sequence :email do |n|
      "foo#{n}@bar.com"
    end
    password "foobar"
  end

  factory :cal_event do
    summary "Title"
    start "#{DateTime.now()}"
    self.end "#{DateTime.now()+3600}"
    association :creator
  end

  factory :invalid_cal_event, :parent => :cal_event do
    summary ""
  end

  factory :content_bucket do
    sequence :name do |n| 
      "foobarContent#{n}"
    end
  end

  factory :lesson do
    sequence :title do |n|
      "test lesson#{n}"
    end
    sequence :position do |n| 
      n
    end
    title_url { title.parameterize }
    association :section
  end

  factory :section do
    sequence :title do |n|
      "test section#{n}"
    end
    title_url { title.parameterize }
    sequence :position do |n| 
      n
    end
    association :course
  end

  factory :course do
    sequence :title do |n|
      "test course#{n}"
    end
    title_url { title.parameterize }
    sequence :position do |n| 
      n
    end
  end

end