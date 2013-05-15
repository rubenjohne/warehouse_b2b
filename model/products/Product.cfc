<cfcomponent output="false" alias="warehouse.model.products.Product">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="productID" type="numeric" default="0">
	<cfproperty name="styleID" type="numeric" default="0">
	<cfproperty name="colorID" type="numeric" default="0">
	<cfproperty name="discountID" type="numeric" default="0">
	<cfproperty name="onWeb" type="numeric" default="0">
	<cfproperty name="archive" type="numeric" default="0">
	<cfproperty name="onStock" type="numeric" default="0">
	<cfproperty name="hotSeller" type="numeric" default="0">
	<cfproperty name="forReview" type="numeric" default="0">
	<cfproperty name="onHand" type="numeric" default="0">
	<cfproperty name="orders" type="numeric" default="0">
	<cfproperty name="wip" type="numeric" default="0">
	<cfproperty name="stock" type="numeric" default="0">
	<cfproperty name="available" type="numeric" default="0">
	<cfproperty name="deliveryMonth" type="numeric" default="0">
	<cfproperty name="deliveryYear" type="numeric" default="0">
	<cfproperty name="comments" type="string" default="">
	<cfproperty name="reviewedDate" type="date" default="">
	<cfproperty name="reviewedBy" type="string" default="">
	<cfproperty name="createdDate" type="date" default="">
	<cfproperty name="createdBy" type="string" default="">
	<cfproperty name="lastMaintainedDate" type="date" default="">
	<cfproperty name="lastMaintainedBy" type="string" default="">

	<cfscript>
		//Initialize the CFC with the default properties values.
		variables.productID = 0;
		variables.styleID = 0;
		variables.colorID = 0;
		variables.discountID = 0;
		variables.onWeb = 0;
		variables.archive = 0;
		variables.onStock = 0;
		variables.hotSeller = 0;
		variables.forReview = 0;
		variables.onHand = 0;
		variables.orders = 0;
		variables.wip = 0;
		variables.stock = 0;
		variables.available = 0;
		variables.deliveryMonth = 0;
		variables.deliveryYear = 0;
		variables.comments = "";
		variables.reviewedDate = "";
		variables.reviewedBy = "";
		variables.createdDate = "";
		variables.createdBy = "";
		variables.lastMaintainedDate = "";
		variables.lastMaintainedBy = "";
	</cfscript>

	<cffunction name="init" output="false" returntype="Product">
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

	<cffunction name="getForReview" output="false" access="public" returntype="any">
		<cfreturn variables.ForReview>
	</cffunction>

	<cffunction name="setForReview" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.ForReview = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getOnHand" output="false" access="public" returntype="any">
		<cfreturn variables.OnHand>
	</cffunction>

	<cffunction name="setOnHand" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.OnHand = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getOrders" output="false" access="public" returntype="any">
		<cfreturn variables.Orders>
	</cffunction>

	<cffunction name="setOrders" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.Orders = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getWip" output="false" access="public" returntype="any">
		<cfreturn variables.Wip>
	</cffunction>

	<cffunction name="setWip" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.Wip = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getStock" output="false" access="public" returntype="any">
		<cfreturn variables.Stock>
	</cffunction>

	<cffunction name="setStock" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.Stock = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getAvailable" output="false" access="public" returntype="any">
		<cfreturn variables.Available>
	</cffunction>

	<cffunction name="setAvailable" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.Available = arguments.val>
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

	<cffunction name="getComments" output="false" access="public" returntype="any">
		<cfreturn variables.Comments>
	</cffunction>

	<cffunction name="setComments" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Comments = arguments.val>
	</cffunction>

	<cffunction name="getReviewedDate" output="false" access="public" returntype="any">
		<cfreturn variables.ReviewedDate>
	</cffunction>

	<cffunction name="setReviewedDate" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsDate(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.ReviewedDate = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid date"/>
		</cfif>
	</cffunction>

	<cffunction name="getReviewedBy" output="false" access="public" returntype="any">
		<cfreturn variables.ReviewedBy>
	</cffunction>

	<cffunction name="setReviewedBy" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.ReviewedBy = arguments.val>
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