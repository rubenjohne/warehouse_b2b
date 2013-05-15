<cfcomponent output="false" alias="warehouse.model.users.Role">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="roleID" type="numeric" default="0">
	<cfproperty name="role" type="string" default="">
	<cfproperty name="description" type="string" default="">

	<cfscript>
		//Initialize the CFC with the default properties values.
		variables.roleID = 0;
		variables.role = "";
		variables.description = "";
	</cfscript>

	<cffunction name="init" output="false" returntype="Role">
		<cfreturn this>
	</cffunction>
	<cffunction name="getRoleID" output="false" access="public" returntype="any">
		<cfreturn variables.RoleID>
	</cffunction>

	<cffunction name="setRoleID" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.RoleID = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getRole" output="false" access="public" returntype="any">
		<cfreturn variables.Role>
	</cffunction>

	<cffunction name="setRole" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Role = arguments.val>
	</cffunction>

	<cffunction name="getDescription" output="false" access="public" returntype="any">
		<cfreturn variables.Description>
	</cffunction>

	<cffunction name="setDescription" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Description = arguments.val>
	</cffunction>



</cfcomponent>