<cfcomponent output="false" alias="warehouse.model.products.Style">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="styleID" type="numeric" default="0">
	<cfproperty name="styleName" type="string" default="">
	<cfproperty name="description" type="string" default="">
	<cfproperty name="shortDescription" type="string" default="">
	<cfproperty name="extendedDescription" type="string" default="">
	<cfproperty name="classID" type="numeric" default="0">
	<cfproperty name="divisionID" type="numeric" default="0">
	<cfproperty name="sizeID" type="numeric" default="0">
	<cfproperty name="onWeb" type="numeric" default="0">
	<cfproperty name="archive" type="numeric" default="0">
	<cfproperty name="shipCharge" type="numeric" default="0">
	<cfproperty name="sellingPrice" type="numeric" default="0">
	<cfproperty name="createdDate" type="date" default="">
	<cfproperty name="createdBy" type="string" default="">
	<cfproperty name="lastMaintainedDate" type="date" default="">
	<cfproperty name="lastMaintainedBy" type="string" default="">

	<cfscript>
		//Initialize the CFC with the default properties values.
		variables.styleID = 0;
		variables.styleName = "";
		variables.description = "";
		variables.shortDescription = "";
		variables.extendedDescription = "";
		variables.classID = 0;
		variables.divisionID = 0;
		variables.sizeID = 0;
		variables.onWeb = 0;
		variables.archive = 0;
		variables.shipCharge = 0;
		variables.sellingPrice = 0;
		variables.createdDate = "";
		variables.createdBy = "";
		variables.lastMaintainedDate = "";
		variables.lastMaintainedBy = "";
	</cfscript>

	<cffunction name="init" output="false" returntype="Style">
		<cfreturn this>
	</cffunction>
	<cffunction name="getStyleID" output="false" access="public" returntype="any">
		<cfreturn variables.StyleID>
	</cffunction>

	<cffunction name="setStyleID" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.StyleID = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getStyleName" output="false" access="public" returntype="any">
		<cfreturn variables.StyleName>
	</cffunction>

	<cffunction name="setStyleName" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.StyleName = arguments.val>
	</cffunction>

	<cffunction name="getDescription" output="false" access="public" returntype="any">
		<cfreturn variables.Description>
	</cffunction>

	<cffunction name="setDescription" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Description = arguments.val>
	</cffunction>

	<cffunction name="getShortDescription" output="false" access="public" returntype="any">
		<cfreturn variables.ShortDescription>
	</cffunction>

	<cffunction name="setShortDescription" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.ShortDescription = arguments.val>
	</cffunction>

	<cffunction name="getExtendedDescription" output="false" access="public" returntype="any">
		<cfreturn variables.ExtendedDescription>
	</cffunction>

	<cffunction name="setExtendedDescription" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.ExtendedDescription = arguments.val>
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

	<cffunction name="getOnWeb" output="false" access="public" returntype="any">
		<cfreturn variables.OnWeb>
	</cffunction>

	<cffunction name="setOnWeb" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.OnWeb = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getArchive" output="false" access="public" returntype="any">
		<cfreturn variables.Archive>
	</cffunction>

	<cffunction name="setArchive" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.Archive = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getShipCharge" output="false" access="public" returntype="any">
		<cfreturn variables.ShipCharge>
	</cffunction>

	<cffunction name="setShipCharge" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.ShipCharge = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getSellingPrice" output="false" access="public" returntype="any">
		<cfreturn variables.SellingPrice>
	</cffunction>

	<cffunction name="setSellingPrice" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.SellingPrice = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getCreatedDate" output="false" access="public" returntype="any">
		<cfreturn variables.CreatedDate>
	</cffunction>

	<cffunction name="setCreatedDate" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsDate(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.CreatedDate = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid date"/>
		</cfif>
	</cffunction>

	<cffunction name="getCreatedBy" output="false" access="public" returntype="any">
		<cfreturn variables.CreatedBy>
	</cffunction>

	<cffunction name="setCreatedBy" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.CreatedBy = arguments.val>
	</cffunction>

	<cffunction name="getLastMaintainedDate" output="false" access="public" returntype="any">
		<cfreturn variables.LastMaintainedDate>
	</cffunction>

	<cffunction name="setLastMaintainedDate" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsDate(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.LastMaintainedDate = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid date"/>
		</cfif>
	</cffunction>

	<cffunction name="getLastMaintainedBy" output="false" access="public" returntype="any">
		<cfreturn variables.LastMaintainedBy>
	</cffunction>

	<cffunction name="setLastMaintainedBy" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.LastMaintainedBy = arguments.val>
	</cffunction>



</cfcomponent>