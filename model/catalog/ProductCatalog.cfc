<cfcomponent output="false" alias="warehouse.model.catalog.ProductCatalog">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="productID" type="numeric" default="0">
	<cfproperty name="styleName" type="string" default="">
	<cfproperty name="extendedDescription" type="string" default="">
	<cfproperty name="classID" type="numeric" default="0">
	<cfproperty name="divisionID" type="numeric" default="0">
	<cfproperty name="sizeID" type="numeric" default="0">
	<cfproperty name="sellingPrice" type="numeric" default="0">
	<cfproperty name="colorDescription" type="string" default="">
	<cfproperty name="divisionName" type="string" default="">
	<cfproperty name="classDescription" type="string" default="">
	<cfproperty name="sizeDescription" type="string" default="">
	<cfproperty name="colorID" type="numeric" default="0">
	<cfproperty name="hotSeller" type="numeric" default="0">
	<cfproperty name="onWeb" type="numeric" default="0">
	<cfproperty name="archive" type="numeric" default="0">
	<cfproperty name="file" type="string" default="">
	<cfproperty name="thumbnailFile" type="string" default="">
	<cfproperty name="onStock" type="numeric" default="0">
	<cfproperty name="deliveryYear" type="numeric" default="0">
	<cfproperty name="deliveryMonth" type="numeric" default="0">
	<cfproperty name="percent" type="numeric" default="0">
	<cfproperty name="discountID" type="numeric" default="0">
	<cfproperty name="lastMaintainedDate" type="date" default="">

	<cfscript>
		//Initialize the CFC with the default properties values.
		variables.productID = 0;
		variables.styleName = "";
		variables.extendedDescription = "";
		variables.classID = 0;
		variables.divisionID = 0;
		variables.sizeID = 0;
		variables.sellingPrice = 0;
		variables.colorDescription = "";
		variables.divisionName = "";
		variables.classDescription = "";
		variables.sizeDescription = "";
		variables.colorID = 0;
		variables.hotSeller = 0;
		variables.onWeb = 0;
		variables.archive = 0;
		variables.file = "";
		variables.thumbnailFile = "";
		variables.onStock = 0;
		variables.deliveryYear = 0;
		variables.deliveryMonth = 0;
		variables.percent = 0;
		variables.discountID = 0;
		variables.lastMaintainedDate = "";
	</cfscript>

	<cffunction name="init" output="false" returntype="ProductCatalog">
		<cfreturn this>
	</cffunction>
	<cffunction name="getProductID" output="false" access="public" returntype="any">
		<cfreturn variables.ProductID>
	</cffunction>

	<cffunction name="setProductID" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.ProductID = arguments.val>
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

	<cffunction name="getColorDescription" output="false" access="public" returntype="any">
		<cfreturn variables.ColorDescription>
	</cffunction>

	<cffunction name="setColorDescription" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.ColorDescription = arguments.val>
	</cffunction>

	<cffunction name="getDivisionName" output="false" access="public" returntype="any">
		<cfreturn variables.DivisionName>
	</cffunction>

	<cffunction name="setDivisionName" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.DivisionName = arguments.val>
	</cffunction>

	<cffunction name="getClassDescription" output="false" access="public" returntype="any">
		<cfreturn variables.ClassDescription>
	</cffunction>

	<cffunction name="setClassDescription" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.ClassDescription = arguments.val>
	</cffunction>

	<cffunction name="getSizeDescription" output="false" access="public" returntype="any">
		<cfreturn variables.SizeDescription>
	</cffunction>

	<cffunction name="setSizeDescription" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.SizeDescription = arguments.val>
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

	<cffunction name="getHotSeller" output="false" access="public" returntype="any">
		<cfreturn variables.HotSeller>
	</cffunction>

	<cffunction name="setHotSeller" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.HotSeller = arguments.val>
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

	<cffunction name="getFile" output="false" access="public" returntype="any">
		<cfreturn variables.File>
	</cffunction>

	<cffunction name="setFile" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.File = arguments.val>
	</cffunction>

	<cffunction name="getThumbnailFile" output="false" access="public" returntype="any">
		<cfreturn variables.ThumbnailFile>
	</cffunction>

	<cffunction name="setThumbnailFile" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.ThumbnailFile = arguments.val>
	</cffunction>

	<cffunction name="getOnStock" output="false" access="public" returntype="any">
		<cfreturn variables.OnStock>
	</cffunction>

	<cffunction name="setOnStock" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.OnStock = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getDeliveryYear" output="false" access="public" returntype="any">
		<cfreturn variables.DeliveryYear>
	</cffunction>

	<cffunction name="setDeliveryYear" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.DeliveryYear = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getDeliveryMonth" output="false" access="public" returntype="any">
		<cfreturn variables.DeliveryMonth>
	</cffunction>

	<cffunction name="setDeliveryMonth" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.DeliveryMonth = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
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



</cfcomponent>