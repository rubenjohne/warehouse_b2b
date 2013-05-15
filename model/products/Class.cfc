<cfcomponent output="false" alias="warehouse.model.products.Class">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="classID" type="numeric" default="0">
	<cfproperty name="classCode" type="string" default="">
	<cfproperty name="classDescription" type="string" default="">

	<cfscript>
		//Initialize the CFC with the default properties values.
		variables.classID = 0;
		variables.classCode = "";
		variables.classDescription = "";
	</cfscript>

	<cffunction name="init" output="false" returntype="Class">
		<cfreturn this>
	</cffunction>
	<cffunction name="getClassID" output="false" access="public" returntype="any">
		<cfreturn variables.ClassID>
	</cffunction>

	<cffunction name="setClassID" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.ClassID = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getClassCode" output="false" access="public" returntype="any">
		<cfreturn variables.ClassCode>
	</cffunction>

	<cffunction name="setClassCode" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.ClassCode = arguments.val>
	</cffunction>

	<cffunction name="getClassDescription" output="false" access="public" returntype="any">
		<cfreturn variables.ClassDescription>
	</cffunction>

	<cffunction name="setClassDescription" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.ClassDescription = arguments.val>
	</cffunction>



</cfcomponent>