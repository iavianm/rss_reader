FactoryBot.define do
  factory :news do
    title { 'MyNews' }
    link { 'https://drive.ru' }
    author { 'MyAutor' }
    description { 'Lorem Ipsum is simply dummy text of the printing and typesetting industry' }
    pubDate { 1640894100 }
  end
end
