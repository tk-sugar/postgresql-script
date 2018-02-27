sudo yum -y update
sudo /etc/init.d/postgresql stop
sudo mv /usr/local/pgsql /usr/local/pgsql.old
cd /usr/local/src
sudo wget https://ftp.postgresql.org/pub/source/v9.5.10/postgresql-9.5.10.tar.gz
sudo tar zxvf postgresql-9.5.10.tar.gz
cd postgresql-9.5.10
./configure
make
make check
sudo make install
sudo mkdir /usr/local/pgsql/data
sudo chown postgres:root /usr/local/pgsql/data
sudo chmod 700 /usr/local/pgsql/data
sudo su -
su - postgres
export PGDATA=/usr/local/pgsql/data
/usr/local/pgsql/bin/initdb -d /usr/local/pgsql/data
/usr/local/pgsql/bin/pg_upgrade -b /usr/local/pgsql.old/bin -B /usr/local/pgsql/bin -d /usr/local/pgsql.old/data -D /usr/local/pgsql/data
