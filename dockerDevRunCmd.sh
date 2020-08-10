# use node_modules deom the container
# use source code from my own machine
docker run -p 3000:3000 -v /app/node_modules -v $(pwd):/app $1