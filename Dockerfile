FROM node:latest

# instalar un simple servidor http para servir nuestro contenido estático
RUN npm install -g http-server

# hacer la carpeta 'app' el directorio de trabajo actual
WORKDIR /Client Side Microservicces
#Cuando se dice directorio de trabajo es el del contenedor o el actual?

# copiar 'package.json' y 'package-lock.json' (si están disponibles)
COPY package*.json ./

# instalar dependencias del proyecto
RUN npm install

# copiar los archivos y carpetas del proyecto al directorio de trabajo actual (es decir, la carpeta 'app')
COPY . .

# construir aplicación para producción minificada
RUN npm run build

EXPOSE 4000
CMD [ "npm", "run", "serve" ]