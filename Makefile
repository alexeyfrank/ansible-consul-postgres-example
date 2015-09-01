master:
	ansible-playbook -i cm/inventory.ini -u vagrant --private-key=.vagrant/machines/n1/virtualbox/private_key cm/master.yml
slave1:
	ansible-playbook -i cm/inventory.ini -u vagrant --private-key=.vagrant/machines/n2/virtualbox/private_key cm/slave.yml
slave2:
	ansible-playbook -i cm/inventory.ini -u vagrant --private-key=.vagrant/machines/n3/virtualbox/private_key cm/slave.yml


start_postgres_master:
	ansible-playbook -i cm/inventory.ini -u vagrant --private-key=.vagrant/machines/n1/virtualbox/private_key cm/scripts/start_postgres_master.yml
start_postgres_slave1:
	ansible-playbook -i cm/inventory.ini -u vagrant --private-key=.vagrant/machines/n2/virtualbox/private_key cm/scripts/start_postgres_slave.yml
start_postgres_slave2:
	ansible-playbook -i cm/inventory.ini -u vagrant --private-key=.vagrant/machines/n3/virtualbox/private_key cm/scripts/start_postgres_slave.yml

deps:
	sudo ansible-galaxy install -f -r requirements.yml

start_master:
	ansible-playbook -i cm/inventory.ini -u vagrant cm/scripts/start_postgres_master.yml --ask-pass
start_slave:
	ansible-playbook -i cm/inventory.ini -u vagrant cm/scripts/start_postgres_slave.yml --ask-pass
stop_master:
	ansible-playbook -i cm/inventory.ini -u vagrant cm/scripts/stop_master.yml --ask-pass
