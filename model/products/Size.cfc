<cfcomponent output="false" alias="warehouse.model.products.Size">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="sizeID" type="numeric" default="0">
	<cfproperty name="sizeScaleCode" type="string" default="">
	<cfproperty name="sizeDescription" type="string" default="">
	<cfproperty name="sizeCode1" type="string" default="">
	<cfproperty name="sizeCode2" type="string" default="">
	<cfproperty name="sizeCode3" type="string" default="">
	<cfproperty name="sizeCode4" type="string" default="">
	<cfproperty name="sizeCode5" type="string" default="">
	<cfproperty name="sizeCode6" type="string" default="">
	<cfproperty name="sizeCode7" type="string" default="">
	<cfproperty name="sizeCode8" type="string" default="">
	<cfproperty name="sizeCode9" type="string" default="">
	<cfproperty name="sizeCode10" type="string" default="">
	<cfproperty name="sizeCode11" type="string" default="">
	<cfproperty name="sizeCode12" type="string" default="">

	<cfscript>
		//Initialize the CFC with the default properties values.
		variables.sizeID = 0;
		variables.sizeScaleCode = "";
		variables.sizeDescription = "";
		variables.sizeCode1 = "";
		variables.sizeCode2 = "";
		variables.sizeCode3 = "";
		variables.sizeCode4 = "";
		variables.sizeCode5 = "";
		variables.sizeCode6 = "";
		variables.sizeCode7 = "";
		variables.sizeCode8 = "";
		variables.sizeCode9 = "";
		variables.sizeCode10 = "";
		variables.sizeCode11 = "";
		variables.sizeCode12 = "";
	</cfscript>

	<cffunction name="init" output="false" returntype="Size">
		<cfreturn this>
	</cffunction>
	<cffunction name="getSizeID" output="false" access="public" returntype="any">
		<cfreturn variables.SizeID>
	</cffunction>

	<cffunction name="setSizeID" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.SizeID = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getSizeScaleCode" output="false" access="public" returntype="any">
		<cfreturn variables.SizeScaleCode>
	</cffunction>

	<cffunction name="setSizeScaleCode" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.SizeScaleCode = arguments.val>
	</cffunction>

	<cffunction name="getSizeDescription" output="false" access="public" returntype="any">
		<cfreturn variables.SizeDescription>
	</cffunction>

	<cffunction name="setSizeDescription" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.SizeDescription = arguments.val>
	</cffunction>

	<cffunction name="getSizeCode1" output="false" access="public" returntype="any">
		<cfreturn variables.SizeCode1>
	</cffunction>

	<cffunction name="setSizeCode1" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.SizeCode1 = arguments.val>
	</cffunction>

	<cffunction name="getSizeCode2" output="false" access="public" returntype="any">
		<cfreturn variables.SizeCode2>
	</cffunction>

	<cffunction name="setSizeCode2" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.SizeCode2 = arguments.val>
	</cffunction>

	<cffunction name="getSizeCode3" output="false" access="public" returntype="any">
		<cfreturn variables.SizeCode3>
	</cffunction>

	<cffunction name="setSizeCode3" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.SizeCode3 = arguments.val>
	</cffunction>

	<cffunction name="getSizeCode4" output="false" access="public" returntype="any">
		<cfreturn variables.SizeCode4>
	</cffunction>

	<cffunction name="setSizeCode4" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.SizeCode4 = arguments.val>
	</cffunction>

	<cffunction name="getSizeCode5" output="false" access="public" returntype="any">
		<cfreturn variables.SizeCode5>
	</cffunction>

	<cffunction name="setSizeCode5" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.SizeCode5 = arguments.val>
	</cffunction>

	<cffunction name="getSizeCode6" output="false" access="public" returntype="any">
		<cfreturn variables.SizeCode6>
	</cffunction>

	<cffunction name="setSizeCode6" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.SizeCode6 = arguments.val>
	</cffunction>

	<cffunction name="getSizeCode7" output="false" access="public" returntype="any">
		<cfreturn variables.SizeCode7>
	</cffunction>

	<cffunction name="setSizeCode7" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.SizeCode7 = arguments.val>
	</cffunction>

	<cffunction name="getSizeCode8" output="false" access="public" returntype="any">
		<cfreturn variables.SizeCode8>
	</cffunction>

	<cffunction name="setSizeCode8" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.SizeCode8 = arguments.val>
	</cffunction>

	<cffunction name="getSizeCode9" output="false" access="public" returntype="any">
		<cfreturn variables.SizeCode9>
	</cffunction>

	<cffunction name="setSizeCode9" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.SizeCode9 = arguments.val>
	</cffunction>

	<cffunction name="getSizeCode10" output="false" access="public" returntype="any">
		<cfreturn variables.SizeCode10>
	</cffunction>

	<cffunction name="setSizeCode10" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.SizeCode10 = arguments.val>
	</cffunction>

	<cffunction name="getSizeCode11" output="false" access="public" returntype="any">
		<cfreturn variables.SizeCode11>
	</cffunction>

	<cffunction name="setSizeCode11" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.SizeCode11 = arguments.val>
	</cffunction>

	<cffunction name="getSizeCode12" output="false" access="public" returntype="any">
		<cfreturn variables.SizeCode12>
	</cffunction>

	<cffunction name="setSizeCode12" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.SizeCode12 = arguments.val>
	</cffunction>



</cfcomponent>