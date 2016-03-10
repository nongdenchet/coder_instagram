namespace :instagram do
  desc "Import Instagram photos from the popular timeline"
  task import_from_instagram: :environment do
    Instagram.client.media_popular.each do |item|
      Photo.create(
          username: item.user.username,
          caption: item.caption.try(:text),
          likes_count: item.likes.count,
          url: item.images.low_resolution.url
      )
    end
  end
end
