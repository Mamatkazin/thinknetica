FactoryGirl.define do
  factory :answer do
    title "MyString"
    body "MyString"
    question
  end

  factory :invalid_answer, class: "Answer" do
    title nil
    body nil
    question
  end
end
