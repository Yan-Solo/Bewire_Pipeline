import jenkins.model.*

def pluginParameter = "gitlab-plugin maven-plugin workflow-aggregator sonar"
def jenkins_plugins_installer = pluginParameter.split()
println(plugins)
def instance = Jenkins.getInstance()
def pm = Jenkins.getPluginmanager()
def uc = Jenkins.getUpdateCenter()
def installed = false

plugins.each {
  if (!pm.getPlugin(it)) {
    def plugin = uc.getPlugin(it)
    if (plugin) {
      println("Installing " + it)
      plugin.deploy()
      installed = true
    }
  }
}

instance.save()
if (installed) {
  instance.doSafeRestart()
}
