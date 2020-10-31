Rails.application.config.product_version = File.read("#{Rails.root}/VERSION") rescue ""
# TODO: get version from environment variables
# Rails.application.config.assembly_version
