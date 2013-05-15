<cfcomponent output="false" alias="warehouse.model.users.Login">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="loginID" type="numeric" default="0">
	<cfproperty name="userID" type="numeric" default="0">
	<cfproperty name="email" type="string" default="">
	<cfproperty name="loginDate" type="date" default="">
	<cfproperty name="loginTime" type="date" default="">

	<cfscript>
		//Initialize the CFC with the default properties values.
		variables.loginID = 0;
		variables.userID = 0;
		variables.email = "";
		variables.loginDate = "";
		variables.loginTime = "";
	</cfscript>

	<cffunction name="init" output="false" returntype="Login">
		<cfreturn this>
	</cffunction>
	<cffunction name="getLoginID" output="false" access="public" returntype="any">
		<cfreturn variables.LoginID>
	</cffunction>

	<cffunction name="setLoginID" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.LoginID = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getUserID" output="false" access="public" returntype="any">
		<cfreturn variables.UserID>
	</cffunction>

	<cffunction name="setUserID" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.UserID = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getEmail" output="false" access="public" returntype="any">
		<cfreturn variables.Email>
	</cffunction>

	<cffunction name="setEmail" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Email = arguments.val>
	</cffunction>

	<cffunction name="getLoginDate" output="false" access="public" returntype="any">
		<cfreturn variables.LoginDate>
	</cffunction>

	<cffunction name="setLoginDate" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsDate(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.LoginDate = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid date"/>
		</cfif>
	</cffunction>

	<cffunction name="getLoginTime" output="false" access="public" returntype="any">
		<cfreturn variables.LoginTime>
	</cffunction>

	<cffunction name="setLoginTime" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsDate(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.LoginTime = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid date"/>
		</cfif>
	</cffunction>



</cfcomponent>