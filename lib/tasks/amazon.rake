namespace :amazon do
  desc "saled_amazon_kindle_books"
  task kindle: :environment do
    Amazon::Kindle.batch
  end
end
