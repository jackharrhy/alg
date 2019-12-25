FROM xyproto/algernon:latest

WORKDIR /srv/algernon
COPY . /srv/algernon

CMD ["/bin/algernon", "--largesize=1048576", "--statcache", "--domain", "--server", "--addr", ":4000" "--cachesize", "67108864", "--dir", "/srv/algernon"]
