<cfcomponent output="false" alias="warehouse.model.products.Color">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="colorID" type="numeric" default="0">
	<cfproperty name="colorCode" type="string" default="">
	<cfproperty name="colorDescription" type="string" default="">

	<cfscript>
		//Initialize the CFC with the default properties values.
		variables.colorID = 0;
		variables.colorCode = "";
		variables.colorDescription = "";
	</cfscript>

	<cffunction name="init" output="false" returntype="Color">
		<cfreturn this>
	</cffunction>
	<cffunction name="getColorID" output="false" access="public" returntype="any">
		<cfreturn variables.ColorID>
	</cffunction>

	<cffunction name="setColorID" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.ColorID = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getColorCode" output="false" access="public" returntype="any">
		<cfreturn variables.ColorCode>
	</cffunction>

	<cffunction name="setColorCode" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.ColorCode = arguments.val>
	</cffunction>

	<cffunction name="getColorDescription" output="false" access="public" returntype="any">
		<cfreturn variables.ColorDescription>
	</cffunction>

	<cffunction name="setColorDescription" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.ColorDescription = arguments.val>
	</cffunction>



</cfcomponent>