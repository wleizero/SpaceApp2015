desc 'rebuild image versions'
task 'rebuild_image_versions' => :environment do 
  Image.all.each do |img| 
    begin
      img.image.cache_stored_file! 
      img.image.retrieve_from_cache!(img.image.cache_name) 
      img.image.recreate_versions! 
      img.save! 
      print '.'
    rescue => e
      puts  "ERROR: #{Image}: #{img.id} -> #{e.to_s}"
    end
  end
end

