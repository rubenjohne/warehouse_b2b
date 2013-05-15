<cfcomponent extends="coldbox.system.eventhandler" output="false">

	<cffunction name="index" access="public" returntype="void" output="false">
		<cfargument name="Event" type="coldbox.system.beans.requestContext">
		
		<cfset var rc = event.getCollection()>
		
		<cfset rc.roles = getPlugin("ioc").getBean("RoleGateway").getAll()>

		<cfset event.noRender()>
		
	</cffunction>

</cfcomponent>