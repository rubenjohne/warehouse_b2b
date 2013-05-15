<cfcomponent output="false" alias="warehouse.model.retailers.Retailer">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="retailerID" type="numeric" default="0">
	<cfproperty name="firstName" type="string" default="">
	<cfproperty name="lastName" type="string" default="">
	<cfproperty name="email" type="string" default="">
	<cfproperty name="phone" type="string" default="">
	<cfproperty name="storeName" type="string" default="">
	<cfproperty name="website" type="string" default="">
	<cfproperty name="source" type="string" default="">
	<cfproperty name="comments" type="string" default="">

	<cfscript>
		//Initialize the CFC with the default properties values.
		variables.retailerID = 0;
		variables.firstName = "";
		variables.lastName = "";
		variables.email = "";
		variables.phone = "";
		variables.storeName = "";
		variables.website = "";
		variables.source = "";
		variables.comments = "";
	</cfscript>

	<cffunction name="init" output="false" returntype="Retailer">
		<cfreturn this>
	</cffunction>
	<cffunction name="getRetailerID" output="false" access="public" returntype="any">
		<cfreturn variables.RetailerID>
	</cffunction>

	<cffunction name="setRetailerID" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.RetailerID = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
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

	<cffunction name="getPhone" output="false" access="public" returntype="any">
		<cfreturn variables.Phone>
	</cffunction>

	<cffunction name="setPhone" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Phone = arguments.val>
	</cffunction>

	<cffunction name="getStoreName" output="false" access="public" returntype="any">
		<cfreturn variables.StoreName>
	</cffunction>

	<cffunction name="setStoreName" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.StoreName = arguments.val>
	</cffunction>

	<cffunction name="getWebsite" output="false" access="public" returntype="any">
		<cfreturn variables.Website>
	</cffunction>

	<cffunction name="setWebsite" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Website = arguments.val>
	</cffunction>

	<cffunction name="getSource" output="false" access="public" returntype="any">
		<cfreturn variables.Source>
	</cffunction>

	<cffunction name="setSource" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Source = arguments.val>
	</cffunction>

	<cffunction name="getComments" output="false" access="public" returntype="any">
		<cfreturn variables.Comments>
	</cffunction>

	<cffunction name="setComments" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Comments = arguments.val>
	</cffunction>



</cfcomponent>