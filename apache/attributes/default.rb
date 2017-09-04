default["apache"]["sites"]["gmirocha2"]={"site_title"=>"Gmirocha2 logo vem","port"=>80,"domain"=>"gmirocha2.mylabserver.com"}
default["apache"]["sites"]["gmirocha2b"]={"site_title"=>"Gmirocha2b logo vem","port"=>80,"domain"=>"gmirocha2b.mylabserver.com"}
default["apache"]["sites"]["gmirocha3"]={"site_title"=>"Gmirocha2 logo vem","port"=>80,"domain"=>"gmirocha3.mylabserver.com"}
default["apache"]["sites"]["gmirocha3b"]={"site_title"=>"Gmirocha2b logo vem","port"=>80,"domain"=>"gmirocha3b.mylabserver.com"}

case node["plataform"]
	when "centos"
		default["apache"]["package"]="httpd"
	when "ubunto"
		default["apache"]["package"]="apache2"
end
