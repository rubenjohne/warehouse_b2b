<cfcomponent output="false" alias="warehouse.model.products.Discount">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="discountID" type="numeric" default="0">
	<cfproperty name="description" type="string" default="">
	<cfproperty name="percent" type="numeric" default="0">

	<cfscript>
		//Initialize the CFC with the default properties values.
		variables.discountID = 0;
		variables.description = "";
		variables.percent = 0;
	</cfscript>

	<cffunction name="init" output="false" returntype="Discount">
		<cfreturn this>
	</cffunction>
	<cffunction name="getDiscountID" output="false" access="public" returntype="any">
		<cfreturn variables.DiscountID>
	</cffunction>

	<cffunction name="setDiscountID" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.DiscountID = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getDescription" output="false" access="public" returntype="any">
		<cfreturn variables.Description>
	</cffunction>

	<cffunction name="setDescription" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Description = arguments.val>
	</cffunction>

	<cffunction name="getPercent" output="false" access="public" returntype="any">
		<cfreturn variables.Percent>
	</cffunction>

	<cffunction name="setPercent" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.Percent = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>



</cfcomponent>