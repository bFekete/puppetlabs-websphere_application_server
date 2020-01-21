websphere_jdbc_provider { 'Puppet Test':
  ensure         => 'present',
  dmgr_profile   => 'PROFILE_DMGR_01',
  profile_base   => '/opt/IBM/WebSphere85/Profiles',
  user           => 'webadmins',
  scope          => 'node',
  cell           => 'CELL_01',
  node_name      => 'appNode01',
  server         => 'AppServer01',
  dbtype         => 'Oracle',
  providertype   => 'Oracle JDBC Driver',
  implementation => 'Connection pool data source',
  description    => 'Created by Puppet',
  classpath      => "${ORACLE_JDBC_DRIVER_PATH}/ojdbc6.jar",
}

websphere_jdbc_datasource { 'Puppet Test':
  ensure                        => 'present',
  dmgr_profile                  => 'PROFILE_DMGR_01',
  profile_base                  => '/opt/IBM/WebSphere85/Profiles',
  user                          => 'webadmins',
  scope                         => 'node',
  cell                          => 'CELL_01',
  node_name                     => 'appNode01',
  server                        => 'AppServer01',
  jdbc_provider                 => 'Puppet Test',
  jndi_name                     => 'joshTest',
  data_store_helper_class       => 'com.ibm.websphere.rsadapter.Oracle11gDataStoreHelper',
  container_managed_persistence => true,
  url                           => 'jdbc:oracle:thin:@//localhost:1521/sample',
  description                   => 'Created by Puppet, yo',
}
