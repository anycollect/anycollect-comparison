servers:
{{ range ls "anycollect/jmx/" }}
{{ $jmxDefinition := .Value | parseJSON }}
  - host: {{ $jmxDefinition.host }}
    port: {{ $jmxDefinition.port }}
    alias: {{ $jmxDefinition.id }}
    queries:
      - outputWriters:
          - "@class": com.googlecode.jmxtrans.model.output.GraphiteWriterFactory
            port: {{ key "blackhole/port" }}
            host: {{ key "blackhole/host" }}
            typeNames: [name, k1, k2]
            flushStrategy : "always"
        attr: [Min, Max, Mean, StdDev, 50thPercentile, 75thPercentile, 90thPercentile, 95thPercentile, 99thPercentile, 999thPercentile]
        obj: "test:name=SampleHistogram0,k2=*,k1=*"
      - outputWriters:
          - "@class": com.googlecode.jmxtrans.model.output.GraphiteWriterFactory
            port: {{ key "blackhole/port" }}
            host: {{ key "blackhole/host" }}
            typeNames: [name, k1, k2]
            flushStrategy : "always"
        attr: [Min, Max, Mean, StdDev, 50thPercentile, 75thPercentile, 90thPercentile, 95thPercentile, 99thPercentile, 999thPercentile]
        obj: "test:name=SampleHistogram1,k2=*,k1=*"
      - outputWriters:
          - "@class": com.googlecode.jmxtrans.model.output.GraphiteWriterFactory
            port: {{ key "blackhole/port" }}
            host: {{ key "blackhole/host" }}
            typeNames: [name, k1, k2]
            flushStrategy : "always"
        attr: [Min, Max, Mean, StdDev, 50thPercentile, 75thPercentile, 90thPercentile, 95thPercentile, 99thPercentile, 999thPercentile]
        obj: "test:name=SampleHistogram2,k2=*,k1=*"
      - outputWriters:
          - "@class": com.googlecode.jmxtrans.model.output.GraphiteWriterFactory
            port: {{ key "blackhole/port" }}
            host: {{ key "blackhole/host" }}
            typeNames: [name, k1, k2]
            flushStrategy : "always"
        attr: [Min, Max, Mean, StdDev, 50thPercentile, 75thPercentile, 90thPercentile, 95thPercentile, 99thPercentile, 999thPercentile]
        obj: "test:name=SampleHistogram3,k2=*,k1=*"
      - outputWriters:
          - "@class": com.googlecode.jmxtrans.model.output.GraphiteWriterFactory
            port: {{ key "blackhole/port" }}
            host: {{ key "blackhole/host" }}
            typeNames: [name, k1, k2]
            flushStrategy : "always"
        attr: [Min, Max, Mean, StdDev, 50thPercentile, 75thPercentile, 90thPercentile, 95thPercentile, 99thPercentile, 999thPercentile]
        obj: "test:name=SampleHistogram4,k2=*,k1=*"
      - outputWriters:
          - "@class": com.googlecode.jmxtrans.model.output.GraphiteWriterFactory
            port: {{ key "blackhole/port" }}
            host: {{ key "blackhole/host" }}
            typeNames: [name, k1, k2]
            flushStrategy : "always"
        attr: [Min, Max, Mean, StdDev, 50thPercentile, 75thPercentile, 90thPercentile, 95thPercentile, 99thPercentile, 999thPercentile]
        obj: "test:name=SampleHistogram5,k2=*,k1=*"
      - outputWriters:
          - "@class": com.googlecode.jmxtrans.model.output.GraphiteWriterFactory
            port: {{ key "blackhole/port" }}
            host: {{ key "blackhole/host" }}
            typeNames: [name, k1, k2]
            flushStrategy : "always"
        attr: [Min, Max, Mean, StdDev, 50thPercentile, 75thPercentile, 90thPercentile, 95thPercentile, 99thPercentile, 999thPercentile]
        obj: "test:name=SampleHistogram6,k2=*,k1=*"
      - outputWriters:
          - "@class": com.googlecode.jmxtrans.model.output.GraphiteWriterFactory
            port: {{ key "blackhole/port" }}
            host: {{ key "blackhole/host" }}
            typeNames: [name, k1, k2]
            flushStrategy : "always"
        attr: [Min, Max, Mean, StdDev, 50thPercentile, 75thPercentile, 90thPercentile, 95thPercentile, 99thPercentile, 999thPercentile]
        obj: "test:name=SampleHistogram8,k2=*,k1=*"
      - outputWriters:
          - "@class": com.googlecode.jmxtrans.model.output.GraphiteWriterFactory
            port: {{ key "blackhole/port" }}
            host: {{ key "blackhole/host" }}
            typeNames: [name, k1, k2]
            flushStrategy : "always"
        attr: [Min, Max, Mean, StdDev, 50thPercentile, 75thPercentile, 90thPercentile, 95thPercentile, 99thPercentile, 999thPercentile]
        obj: "test:name=SampleHistogram9,k2=*,k1=*"
      - outputWriters:
          - "@class": com.googlecode.jmxtrans.model.output.GraphiteWriterFactory
            port: {{ key "blackhole/port" }}
            host: {{ key "blackhole/host" }}
            typeNames: [name, k1, k2]
            flushStrategy : "always"
        attr: [Min, Max, Mean, StdDev, 50thPercentile, 75thPercentile, 90thPercentile, 95thPercentile, 99thPercentile, 999thPercentile]
        obj: "test:name=SampleHistogram7,k2=*,k1=*"
    numQueryThreads : {{ key "jmxtrans/numQueryThreads" }}
    runPeriodSeconds: {{ key "jmxtrans/runPeriodSeconds" }}
{{ end }}