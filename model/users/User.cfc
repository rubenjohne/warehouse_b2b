<cfcomponent output="false" alias="warehouse.model.users.User">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="userID" type="numeric" default="0">
	<cfproperty name="accountNumber" type="numeric" default="0">
	<cfproperty name="accountName" type="string" default="">
	<cfproperty name="firstName" type="string" default="">
	<cfproperty name="lastName" type="string" default="">
	<cfproperty name="email" type="string" default="">
	<cfproperty name="password" type="string" default="">
	<cfproperty name="roleID" type="numeric" default="0">

	<cfscript>
		//Initialize the CFC with the default properties values.
		variables.userID = 0;
		variables.accountNumber = 0;
		variables.accountName = "";
		variables.firstName = "";
		variables.lastName = "";
		variables.email = "";
		variables.password = "";
		variables.roleID = 0;
	</cfscript>

	<cffunction name="init" output="false" returntype="User">
		<cfreturn this>
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

	<cffunction name="getAccountNumber" output="false" access="public" returntype="any">
		<cfreturn variables.AccountNumber>
	</cffunction>

	<cffunction name="setAccountNumber" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.AccountNumber = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getAccountName" output="false" access="public" returntype="any">
		<cfreturn variables.AccountName>
	</cffunction>

	<cffunction name="setAccountName" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.AccountName = arguments.val>
	</cffunction>

	<cffunction name="getFirstName" output="false" access="public" returntype="any">
		<cfreturn variables.FirstName>
	</cffunction>

	<cffunction name="setFirstName" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.FirstName = arguments.val>
	</cffunction>

	<cffunction name="getLastName" output="false" access="public" returntype="any">
		<cfreturn variables.LastName>
	</cffunction>

	<cffunction name="setLastName" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.LastName = arguments.val>
	</cffunction>

	<cffunction name="getEmail" output="false" access="public" returntype="any">
		<cfreturn variables.Email>
	</cffunction>

	<cffunction name="setEmail" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Email = arguments.val>
	</cffunction>

	<cffunction name="getPassword" output="false" access="public" returntype="any">
		<cfreturn variables.Password>
	</cffunction>

	<cffunction name="setPassword" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Password = arguments.val>
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



</cfcomponent>