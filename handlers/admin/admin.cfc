
<cfcomponent hint="this is the admin controller" extends="coldbox.system.eventhandler">

	<cffunction name="getActiveProducts" access="public" returntype="void" output="false">
		<cfargument name="Event" type="coldbox.system.beans.requestContext">

		<cfset var rc = event.getCollection()>
		
		<cfquery name="qProducts" datasource="#getDatasource('warehouse').getName()#">
			SELECT ts_styles.styleName, ts_colors.colorDescription, ts_divisions.divisionName, 
			ts_class.classDescription, ts_products.onWeb, ts_products.archive, ts_products.onStock, 
			ts_products.hotSeller, ts_products.forReview, ts_products.stock, ts_products.comments
			FROM (((ts_products INNER JOIN ts_styles ON ts_products.styleID = ts_styles.styleID) 
			INNER JOIN ts_colors ON ts_products.colorID = ts_colors.colorID)
			INNER JOIN ts_divisions ON ts_styles.divisionID = ts_divisions.divisionID)
			INNER JOIN ts_class ON ts_styles.classID = ts_class.classID
			WHERE (((ts_products.archive)=0))
		</cfquery>

		<cfset rc.products = qProducts>
		
		<cfset event.noRender()>
				 
	</cffunction>
		
</cfcomponent>