FROM    node:10.16
WORKDIR /usr/src/app
COPY    package*.json ./

# TODO: use env port variable
EXPOSE 3500

## Update package list, then install node and npm
RUN     apt-get update -y \
        && npm -g config set user root \
        && npm install -g @bigcommerce/stencil-cli

COPY    . .

ENV     NODE_ENV=production

# initialize a new .stencil config for the theme
RUN     stencil init --url https://harveynichols-sb.mybigcommerce.com/ --token rcx1mpnone6u8zmtkd4nn5zwj8oxd1q  --port 3500

# serve a live, Browsersync enabled preview of the theme
CMD     [ "stencil", "start" ]
