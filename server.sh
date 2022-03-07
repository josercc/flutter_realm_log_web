#!/bin/bash

# Set the port
PORT=5001

# switch directories

# Start the server
echo 'Server starting on port' $PORT '...'
python3 -m http.server $PORT
