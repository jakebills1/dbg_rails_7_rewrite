module ApplicationHelper
  def cdn_for(file)
    Rails.env.production? ? "#{ENV['S3_CDN_URL']}#{file.key}" : url_for(file)
  end
end
