

Model.new(:gerenciadorSala_development, 'Description for nginx_backup') do
##
# Archive [Archive]

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
	local.path = "/home/aluno/backups"
	local.keep = 5
end

##
# Gzip [Compressor]
#
compress_with Gzip

end
