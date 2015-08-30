master:
	ansible-playbook -i cm/inventory -u vagrant --private-key=.vagrant/machines/n1/virtualbox/private_key cm/master.yml -vvvv
slave1:
	ansible-playbook -i cm/inventory -u vagrant --private-key=.vagrant/machines/n2/virtualbox/private_key cm/slave.yml -vvvv
slave2:
	ansible-playbook -i cm/inventory -u vagrant --private-key=.vagrant/machines/n3/virtualbox/private_key cm/slave.yml -vvvv


start_postgres_master:
	ansible-playbook -i cm/inventory -u vagrant --private-key=.vagrant/machines/n1/virtualbox/private_key cm/scripts/start_postgres_master.yml -vvvv
start_postgres_slave:
	ansible-playbook -i cm/inventory -u vagrant --private-key=.vagrant/machines/n1/virtualbox/private_key cm/scripts/start_postgres_slave.yml -vvvv

deps:
	sudo ansible-galaxy install -f -r requirements.yml
