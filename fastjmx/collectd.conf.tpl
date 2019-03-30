##############################################################################
# Global                                                                     #
#----------------------------------------------------------------------------#
# Global settings for the daemon.                                            #
##############################################################################

#Hostname    "localhost"
#FQDNLookup   true
#BaseDir     "${prefix}/var/lib/collectd"
#PIDFile     "${prefix}/var/run/collectd.pid"
#PluginDir   "${exec_prefix}/lib/collectd"
#TypesDB     "/collectd/build/share/collectd/types.db"

#----------------------------------------------------------------------------#
# When enabled, plugins are loaded automatically with the default options    #
# when an appropriate <Plugin ...> block is encountered.                     #
# Disabled by default.                                                       #
#----------------------------------------------------------------------------#
#AutoLoadPlugin false

#----------------------------------------------------------------------------#
# When enabled, internal statistics are collected, using "collectd" as the   #
# plugin name.                                                               #
# Disabled by default.                                                       #
#----------------------------------------------------------------------------#
#CollectInternalStats false

#----------------------------------------------------------------------------#
# Interval at which to query values. This may be overwritten on a per-plugin #
# base by using the 'Interval' option of the LoadPlugin block:               #
#   <LoadPlugin foo>                                                         #
#       Interval 60                                                          #
#   </LoadPlugin>                                                            #
#----------------------------------------------------------------------------#
#Interval     10

#MaxReadInterval 86400
#Timeout         2
#ReadThreads     5
#WriteThreads    5

# Limit the size of the write queue. Default is no limit. Setting up a limit is
# recommended for servers handling a high volume of traffic.
#WriteQueueLimitHigh 1000000
#WriteQueueLimitLow   800000

LoadPlugin java
<Plugin "java">
  JVMArg "-Dcom.sun.management.jmxremote"
  JVMArg "-Dcom.sun.management.jmxremote.local.only=false"
  JVMArg "-Dcom.sun.management.jmxremote.authenticate=false"
  JVMArg "-Dcom.sun.management.jmxremote.ssl=false"
  JVMArg "-Djava.rmi.server.hostname={{ env "JMX_HOST" }}"
  JVMArg "-Dcom.sun.management.jmxremote.rmi.port={{ env "JMX_PORT" }}"
  JVMArg "-Dcom.sun.management.jmxremote.port={{ env "JMX_PORT" }}"
  JVMArg "-Djava.class.path=/etc/collectd-api.jar:/etc/collectd-fast-jmx.jar"
  #JVMArg "-Xms512m -Xmx512m"
  #JVMARG "-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5009"

  LoadPlugin "com.e_gineering.collectd.FastJMX"
  <Plugin "FastJMX">
    MaxThreads 256
    CollectInternal true
    LogLevel "INFO"
    ForceLoggingTo "WARNING"

    <MBean "histogram0">
      ObjectName "test:name=SampleHistogram0,k2=*,k1=*"
      InstanceFrom "k1"
      InstanceFrom "k2"
      InstanceFrom "name"
      <Value "Min">
        Type "gauge"
      </Value>
      <Value "Max">
        Type "gauge"
      </Value>
      <Value "Mean">
        Type "gauge"
      </Value>
      <Value "StdDev">
        Type "gauge"
      </Value>
      <Value "50thPercentile">
        Type "gauge"
      </Value>
      <Value "75thPercentile">
        Type "gauge"
      </Value>
      <Value "90thPercentile">
        Type "gauge"
      </Value>
      <Value "95thPercentile">
        Type "gauge"
      </Value>
      <Value "99thPercentile">
        Type "gauge"
      </Value>
      <Value "999thPercentile">
        Type "gauge"
      </Value>
    </MBean>
    <MBean "histogram1">
      ObjectName "test:name=SampleHistogram1,k2=*,k1=*"
      InstanceFrom "k1"
      InstanceFrom "k2"
      InstanceFrom "name"
      <Value "Min">
        Type "gauge"
      </Value>
      <Value "Max">
        Type "gauge"
      </Value>
      <Value "Mean">
        Type "gauge"
      </Value>
      <Value "StdDev">
        Type "gauge"
      </Value>
      <Value "50thPercentile">
        Type "gauge"
      </Value>
      <Value "75thPercentile">
        Type "gauge"
      </Value>
      <Value "90thPercentile">
        Type "gauge"
      </Value>
      <Value "95thPercentile">
        Type "gauge"
      </Value>
      <Value "99thPercentile">
        Type "gauge"
      </Value>
      <Value "999thPercentile">
        Type "gauge"
      </Value>
    </MBean>

    <MBean "histogram2">
      ObjectName "test:name=SampleHistogram2,k2=*,k1=*"
      InstanceFrom "k1"
      InstanceFrom "k2"
      InstanceFrom "name"
      <Value "Min">
        Type "gauge"
      </Value>
      <Value "Max">
        Type "gauge"
      </Value>
      <Value "Mean">
        Type "gauge"
      </Value>
      <Value "StdDev">
        Type "gauge"
      </Value>
      <Value "50thPercentile">
        Type "gauge"
      </Value>
      <Value "75thPercentile">
        Type "gauge"
      </Value>
      <Value "90thPercentile">
        Type "gauge"
      </Value>
      <Value "95thPercentile">
        Type "gauge"
      </Value>
      <Value "99thPercentile">
        Type "gauge"
      </Value>
      <Value "999thPercentile">
        Type "gauge"
      </Value>
    </MBean>

    <MBean "histogram3">
      ObjectName "test:name=SampleHistogram3,k2=*,k1=*"
      InstanceFrom "k1"
      InstanceFrom "k2"
      InstanceFrom "name"
      <Value "Min">
        Type "gauge"
      </Value>
      <Value "Max">
        Type "gauge"
      </Value>
      <Value "Mean">
        Type "gauge"
      </Value>
      <Value "StdDev">
        Type "gauge"
      </Value>
      <Value "50thPercentile">
        Type "gauge"
      </Value>
      <Value "75thPercentile">
        Type "gauge"
      </Value>
      <Value "90thPercentile">
        Type "gauge"
      </Value>
      <Value "95thPercentile">
        Type "gauge"
      </Value>
      <Value "99thPercentile">
        Type "gauge"
      </Value>
      <Value "999thPercentile">
        Type "gauge"
      </Value>
    </MBean>

    <MBean "histogram4">
      ObjectName "test:name=SampleHistogram4,k2=*,k1=*"
      InstanceFrom "k1"
      InstanceFrom "k2"
      InstanceFrom "name"
      <Value "Min">
        Type "gauge"
      </Value>
      <Value "Max">
        Type "gauge"
      </Value>
      <Value "Mean">
        Type "gauge"
      </Value>
      <Value "StdDev">
        Type "gauge"
      </Value>
      <Value "50thPercentile">
        Type "gauge"
      </Value>
      <Value "75thPercentile">
        Type "gauge"
      </Value>
      <Value "90thPercentile">
        Type "gauge"
      </Value>
      <Value "95thPercentile">
        Type "gauge"
      </Value>
      <Value "99thPercentile">
        Type "gauge"
      </Value>
      <Value "999thPercentile">
        Type "gauge"
      </Value>
    </MBean>

    <MBean "histogram5">
      ObjectName "test:name=SampleHistogram5,k2=*,k1=*"
      InstanceFrom "k1"
      InstanceFrom "k2"
      InstanceFrom "name"
      <Value "Min">
        Type "gauge"
      </Value>
      <Value "Max">
        Type "gauge"
      </Value>
      <Value "Mean">
        Type "gauge"
      </Value>
      <Value "StdDev">
        Type "gauge"
      </Value>
      <Value "50thPercentile">
        Type "gauge"
      </Value>
      <Value "75thPercentile">
        Type "gauge"
      </Value>
      <Value "90thPercentile">
        Type "gauge"
      </Value>
      <Value "95thPercentile">
        Type "gauge"
      </Value>
      <Value "99thPercentile">
        Type "gauge"
      </Value>
      <Value "999thPercentile">
        Type "gauge"
      </Value>
    </MBean>
    <MBean "histogram6">
      ObjectName "test:name=SampleHistogram6,k2=*,k1=*"
      InstanceFrom "k1"
      InstanceFrom "k2"
      InstanceFrom "name"
      <Value "Min">
        Type "gauge"
      </Value>
      <Value "Max">
        Type "gauge"
      </Value>
      <Value "Mean">
        Type "gauge"
      </Value>
      <Value "StdDev">
        Type "gauge"
      </Value>
      <Value "50thPercentile">
        Type "gauge"
      </Value>
      <Value "75thPercentile">
        Type "gauge"
      </Value>
      <Value "90thPercentile">
        Type "gauge"
      </Value>
      <Value "95thPercentile">
        Type "gauge"
      </Value>
      <Value "99thPercentile">
        Type "gauge"
      </Value>
      <Value "999thPercentile">
        Type "gauge"
      </Value>
    </MBean>
    <MBean "histogram7">
      ObjectName "test:name=SampleHistogram7,k2=*,k1=*"
      InstanceFrom "k1"
      InstanceFrom "k2"
      InstanceFrom "name"
      <Value "Min">
        Type "gauge"
      </Value>
      <Value "Max">
        Type "gauge"
      </Value>
      <Value "Mean">
        Type "gauge"
      </Value>
      <Value "StdDev">
        Type "gauge"
      </Value>
      <Value "50thPercentile">
        Type "gauge"
      </Value>
      <Value "75thPercentile">
        Type "gauge"
      </Value>
      <Value "90thPercentile">
        Type "gauge"
      </Value>
      <Value "95thPercentile">
        Type "gauge"
      </Value>
      <Value "99thPercentile">
        Type "gauge"
      </Value>
      <Value "999thPercentile">
        Type "gauge"
      </Value>
    </MBean>
    <MBean "histogram8">
      ObjectName "test:name=SampleHistogram8,k2=*,k1=*"
      InstanceFrom "k1"
      InstanceFrom "k2"
      InstanceFrom "name"
      <Value "Min">
        Type "gauge"
      </Value>
      <Value "Max">
        Type "gauge"
      </Value>
      <Value "Mean">
        Type "gauge"
      </Value>
      <Value "StdDev">
        Type "gauge"
      </Value>
      <Value "50thPercentile">
        Type "gauge"
      </Value>
      <Value "75thPercentile">
        Type "gauge"
      </Value>
      <Value "90thPercentile">
        Type "gauge"
      </Value>
      <Value "95thPercentile">
        Type "gauge"
      </Value>
      <Value "99thPercentile">
        Type "gauge"
      </Value>
      <Value "999thPercentile">
        Type "gauge"
      </Value>
    </MBean>

    <MBean "histogram9">
      ObjectName "test:name=SampleHistogram9,k2=*,k1=*"
      InstanceFrom "k1"
      InstanceFrom "k2"
      InstanceFrom "name"
      <Value "Min">
        Type "gauge"
      </Value>
      <Value "Max">
        Type "gauge"
      </Value>
      <Value "Mean">
        Type "gauge"
      </Value>
      <Value "StdDev">
        Type "gauge"
      </Value>
      <Value "50thPercentile">
        Type "gauge"
      </Value>
      <Value "75thPercentile">
        Type "gauge"
      </Value>
      <Value "90thPercentile">
        Type "gauge"
      </Value>
      <Value "95thPercentile">
        Type "gauge"
      </Value>
      <Value "99thPercentile">
        Type "gauge"
      </Value>
      <Value "999thPercentile">
        Type "gauge"
      </Value>
    </MBean>

{{ range ls "anycollect/jmx/" }}
{{ if .Key | contains "stub" }}
{{ $jmxDefinition := .Value | parseJSON }}
    <Connection>
      ServiceURL "service:jmx:rmi:///jndi/rmi://{{ $jmxDefinition.host }}:{{ $jmxDefinition.port }}/jmxrmi"
      Collect "compilation"
      Collect "histogram0"
      Collect "histogram1"
      Collect "histogram2"
      Collect "histogram3"
      Collect "histogram4"
      Collect "histogram5"
      Collect "histogram6"
      Collect "histogram7"
      Collect "histogram8"
      Collect "histogram9"
    </Connection>
{{ end }}
{{ end }}
  </Plugin>
</Plugin>

LoadPlugin write_graphite
<Plugin write_graphite>
  <Node "example">
    Host "{{ key "blackhole/host" }}"
    Port "{{ key "blackhole/port" }}"
    Protocol "tcp"
    Prefix "fastjmx"
    EscapeCharacter "_"
  </Node>
</Plugin>

LoadPlugin "logfile"
<Plugin "logfile">
  LogLevel "debug"
  File "/var/log/collectd.log"
  Timestamp true
</Plugin>
