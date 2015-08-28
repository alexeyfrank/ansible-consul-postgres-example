FROM postgres:9.4

RUN apt-get update
RUN apt-get install wget -y
RUN wget http://www.pgpool.net/download.php?f=pgpool-II-3.4.3.tar.gz
RUN tar -zxvf download.php?f=pgpool-II-3.4.3.tar.gz

RUN apt-get install gcc -y
RUN apt-get install libpq-dev -y
RUN apt-get install make -y
RUN cd pgpool-II-3.4.3 && ./configure && make && make install


EXPOSE 9999

