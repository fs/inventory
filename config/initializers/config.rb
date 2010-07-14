APP_CONFIG = YAML.load(File.read("#{Rails.root}/config/config.yml"))[Rails.env]
Time::DATE_FORMATS[:nice] = '%b %d, %Y %H:%M'
