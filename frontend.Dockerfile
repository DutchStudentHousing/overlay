FROM node:20 as BUILD
WORKDIR /tmp/frontendbuild
# COPY package*.json ./
RUN git clone https://github.com/DutchStudentHousing/Frontend-draft.git --recursive .
RUN npm install
# COPY . .
RUN npm run build

FROM nginx:1.14.2
COPY --from=BUILD /tmp/frontendbuild/dist/dsh/* /usr/share/nginx/html/
COPY --from=BUILD /tmp/frontendbuild/nginx.conf /etc/nginx/conf.d/default.conf
# COPY mime.types /etc/nginx/mime.types
