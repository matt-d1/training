# This input block will listen on port 10514 for logs to come in.
# host should be an IP on the Logstash server.
# codec => "json" indicates that we expect the lines we're receiving to be in JSON format
# type => "rsyslog" is an optional identifier to help identify messaging streams in the pipeline.

input {
  udp {
    host => "ELK1"
    port => 9480
    codec => "json"
    type => "rsyslog"
  }

kafka {
   zk_connect => "kafka1:2181"
   group_id => "logstash"
   topic_id => "rsyslog"
   consumer_threads => 4 
  }

}



# This is an empty filter block.  You can later add other filters here to further process
# your log lines

filter { }

# This output block will send all events of type "rsyslog" to Elasticsearch at the configured
# host and port into daily indices of the pattern, "rsyslog-YYYY.MM.DD"

output {
  if [type] == "rsyslog" {
    elasticsearch {
      hosts => [ "ELK1:9200" ]
      index => "logstash-%{type}-%{+YYYY.MM.dd}"
    }
  }
}
