node 'vagrant-ubuntu-trusty-64' {
	include nginx
	include java
	class{ 'tomcat':
	require => Class['java'],
	}	
}

node 'host2' {
	class { 'mysql::server':
 	root_password => "jarvis"
}

	include jenkins
	jenkins::plugin {
  	 "git" : ;
 	 "parameterized-trigger" : ;
 	 "token-macro" : ;
	 "mailer" : ;
 	 "scm-api" : ;
	 "promoted-builds" : ;
	 "matrix-project" : ;
	 "git-client" : ;
	 "ssh-credentials" : ;
	 "credentials" : ;
	 "maven-plugin" : ;
	 "javadoc" : ;
	 "junit" : ;
}
}
