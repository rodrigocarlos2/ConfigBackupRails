# ConfigBackupRails

Show tutorial for create database backup using backup and whenever gem from Rails.

# Commands

* backup generate:model --trigger nginx_backup --archives --storages='local' --compressor='gzip' --notifiers='mail'

* Insert at config.rb:

Model.new(:nginx_backup, 'Description for nginx_backup') do
archive :my_archive do |archive|
  archive.add "/etc/nginx/"
end

store_with Local do |local|
  local.path = "/home/alok/backup/nginx"
  local.keep = 5
end

compress_with Gzip

notify_by Mail do |mail|
  mail.on_success = true
  mail.on_warning = true
  mail.on_failure = true

  mail.from = "sender@email.com"
  mail.to = "receiver@email.com"
  mail.address = "smtp.gmail.com"
  mail.port = 587
  mail.domain = "your.host.name"
  mail.user_name = "sender@email.com"
  mail.password = "my_password"
  mail.authentication = "plain"
  mail.encryption = :starttls
end

end

* Edit also the file /models/name_backup.rb and insert:

Model.new(:gerenciadorSala_backup, 'Description for gerenciadorSala_backup') do

  database MySQL do |db|
    db.name               = "gerenciadorSala_development"
    db.username           = "root"
    db.password           = "root"
    db.host               = "localhost"
    db.port               = 3306
  end

  store_with Local do |local|
    local.path       = "~/backups/"
    local.keep       = 5
  end
  
  compress_with Gzip

end


* After this, run: backup check



