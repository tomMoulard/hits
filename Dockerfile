FROM elixir:1.10.3

RUN apt update && apt upgrade -y
RUN apt install -y npm

RUN git clone https://github.com/dwyl/hits.git

WORKDIR hits

RUN sed -i 's/localhost/postgresql/g' config/dev.exs
RUN sed -i 's/true/false/g' config/dev.exs

RUN mix local.hex --force
RUN mix deps.get
RUN cd assets && npm install && \
	node node_modules/webpack/bin/webpack.js --mode development

RUN mix local.rebar --force

EXPOSE 4000

CMD mix ecto.create && mix ecto.migrate && mix phx.server
