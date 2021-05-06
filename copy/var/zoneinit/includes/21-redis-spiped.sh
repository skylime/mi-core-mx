#!/bin/bash
# Configure spiped for redis

/opt/core/bin/spiped-configure-smf api-redis encrypt [127.0.0.1]:63790 $(mdata-get api_redis_addr):63790 $(mdata-get api_redis_key)
