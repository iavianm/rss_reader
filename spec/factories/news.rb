FactoryBot.define do
  factory :news do
    association :channel
    title { 'MyNews' }
    link { 'https://drive.ru' }
    author { 'MyAutor' }
    description { 'Lorem Ipsum is simply dummy text of the printing and typesetting industry' }
    pubdate { 1640894100 }
  end
end
