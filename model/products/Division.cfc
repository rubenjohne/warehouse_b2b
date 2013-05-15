<cfcomponent output="false" alias="warehouse.model.products.Division">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="divisionID" type="numeric" default="0">
	<cfproperty name="divisionNumber" type="numeric" default="0">
	<cfproperty name="divisionName" type="string" default="">
	<cfproperty name="divisionDescription" type="string" default="">

	<cfscript>
		//Initialize the CFC with the default properties values.
		variables.divisionID = 0;
		variables.divisionNumber = 0;
		variables.divisionName = "";
		variables.divisionDescription = "";
	</cfscript>

	<cffunction name="init" output="false" returntype="Division">
		<cfreturn this>
	</cffunction>
	<cffunction name="getDivisionID" output="false" access="public" returntype="any">
		<cfreturn variables.DivisionID>
	</cffunction>

	<cffunction name="setDivisionID" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.DivisionID = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getDivisionNumber" output="false" access="public" returntype="any">
		<cfreturn variables.DivisionNumber>
	</cffunction>

	<cffunction name="setDivisionNumber" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.DivisionNumber = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getDivisionName" output="false" access="public" returntype="any">
		<cfreturn variables.DivisionName>
	</cffunction>

	<cffunction name="setDivisionName" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.DivisionName = arguments.val>
	</cffunction>

	<cffunction name="getDivisionDescription" output="false" access="public" returntype="any">
		<cfreturn variables.DivisionDescription>
	</cffunction>

	<cffunction name="setDivisionDescription" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.DivisionDescription = arguments.val>
	</cffunction>



</cfcomponent>