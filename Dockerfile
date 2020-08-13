# 2 step process, with 2 base images

# BUILD phase
FROM node:alpine as builder

WORKDIR '/app'

COPY package.json ./
 
# the volume system is not needed here since we are not trying to share my
# machine and docker container storage the way I did it for dev

# copy source code
COPY . .

RUN npm run build

# RUN phase
FROM nginx
# elastic beanstalk is looking for this instruction
EXPOSE 80
# copy over from builder phase to where nginx runs static content from
COPY --from=builder /app/build /usr/share/nginx/html