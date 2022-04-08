FROM rabbitmq:3-management
ADD ./plugin/rabbitmq_delayed_message_exchange-3.9.0.ez $RABBITMQ_HOME/plugins/rabbitmq_delayed_message_exchange-3.9.0.ez
ADD ./plugin/rabbitmq_message_deduplication-0.5.3.ez $RABBITMQ_HOME/plugins/rabbitmq_message_deduplication-0.5.3.ez
ADD ./plugin/elixir-1.12.2.ez $RABBITMQ_HOME/plugins/elixir-1.12.2.ez
RUN rabbitmq-plugins enable --offline rabbitmq_mqtt
RUN rabbitmq-plugins enable --offline rabbitmq_web_mqtt
RUN rabbitmq-plugins enable --offline rabbitmq_delayed_message_exchange
RUN rabbitmq-plugins enable --offline rabbitmq_message_deduplication