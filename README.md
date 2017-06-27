# ConfigBackupRails

Show tutorial for create database backup using backup and whenever gem from Rails.

# Commands

* backup generate:model --trigger nginx_backup --archives --storages='local' --compressor='gzip' --notifiers='mail'

* Insert at config.rb:

# encoding: utf-8

##
# Backup Generated: nginx_backup
# Once configured, you can run the backup with the following command:
#
# $ backup perform -t nginx_backup [-c ]
#
# For more information about Backup's components, see the documentation at:
# http://meskyanichi.github.io/backup
#
Model.new(:nginx_backup, 'Description for nginx_backup') do
##
# Archive [Archive]
#
# Adding a file or directory (including sub-directories):
# archive.add "/path/to/a/file.rb"
# archive.add "/path/to/a/directory/"
#
# Excluding a file or directory (including sub-directories):
# archive.exclude "/path/to/an/excluded_file.rb"
# archive.exclude "/path/to/an/excluded_directory
#
# By default, relative paths will be relative to the directory
# where `backup perform` is executed, and they will be expanded
# to the root of the filesystem when added to the archive.
#
# If a `root` path is set, relative paths will be relative to the
# given `root` path and will not be expanded when added to the archive.
#
# archive.root '/path/to/archive/root'
#
archive :my_archive do |archive|
# Run the `tar` command using `sudo`
# archive.use_sudo
archive.add "/etc/nginx/"
end

##
# Local (Copy) [Storage]
#
store_with Local do |local|
local.path = "/home/alok/backup/nginx"
local.keep = 5
end

##
# Gzip [Compressor]
#
compress_with Gzip

##
# Mail [Notifier]
#
# The default delivery method for Mail Notifiers is 'SMTP'.
# See the documentation for other delivery options.
#
#
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

# encoding: utf-8

##
# Backup Generated: gerenciadorSala_backup
# Once configured, you can run the backup with the following command:
#
# $ backup perform -t gerenciadorSala_backup [-c <path_to_configuration_file>]
#
# For more information about Backup's components, see the documentation at:
# http://backup.github.io/backup
#
Model.new(:gerenciadorSala_backup, 'Description for gerenciadorSala_backup') do

  ##
  # MySQL [Database]
  #
  database MySQL do |db|
    # To dump all databases, set `db.name = :all` (or leave blank)
    db.name               = "gerenciadorSala_development"
    db.username           = "root"
    db.password           = "root"
    db.host               = "localhost"
    db.port               = 3306
  end

  ##
  # Local (Copy) [Storage]
  #
  store_with Local do |local|
    local.path       = "~/backups/"
    local.keep       = 5
    # local.keep       = Time.now - 2592000 # Remove all backups older than 1 month.
  end

  ##
  # Gzip [Compressor]
  #
  compress_with Gzip

end


* After this, run: backup check



