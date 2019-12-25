FROM xyproto/algernon:latest

WORKDIR /srv/algernon
COPY . /srv/algernon

CMD ["/bin/algernon", "--statcache", "--domain", "--server", "--addr", ":4000" "--cachesize", "67108864", "--dir", "/srv/algernon"]
