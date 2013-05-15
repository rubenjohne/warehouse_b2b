<cfcomponent output="false">

	<cffunction name="read" output="false" access="public" returntype="warehouse.model.catalog.ProductCatalog">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="warehouse">
			select 	productID, styleName, extendedDescription, classID, divisionID, sizeID, 
					sellingPrice, colorDescription, divisionName, classDescription, sizeDescription, 
					colorID, hotSeller, onWeb, archive, file, 
					thumbnailFile, onStock, deliveryYear, deliveryMonth, percent, 
					discountID, lastMaintainedDate
			from WebProductCatalogView
			where productID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "warehouse.model.catalog.ProductCatalog").init();
			obj.setproductID(qRead.productID);
			obj.setstyleName(qRead.styleName);
			obj.setextendedDescription(qRead.extendedDescription);
			obj.setclassID(qRead.classID);
			obj.setdivisionID(qRead.divisionID);
			obj.setsizeID(qRead.sizeID);
			obj.setsellingPrice(qRead.sellingPrice);
			obj.setcolorDescription(qRead.colorDescription);
			obj.setdivisionName(qRead.divisionName);
			obj.setclassDescription(qRead.classDescription);
			obj.setsizeDescription(qRead.sizeDescription);
			obj.setcolorID(qRead.colorID);
			obj.sethotSeller(qRead.hotSeller);
			obj.setonWeb(qRead.onWeb);
			obj.setarchive(qRead.archive);
			obj.setfile(qRead.file);
			obj.setthumbnailFile(qRead.thumbnailFile);
			obj.setonStock(qRead.onStock);
			obj.setdeliveryYear(qRead.deliveryYear);
			obj.setdeliveryMonth(qRead.deliveryMonth);
			obj.setpercent(qRead.percent);
			obj.setdiscountID(qRead.discountID);
			obj.setlastMaintainedDate(qRead.lastMaintainedDate);
			return obj;
		</cfscript>
	</cffunction>



	<cffunction name="create" output="false" access="public">
		<cfargument name="bean" required="true" type="warehouse.model.catalog.ProductCatalog">
		<cfset var qCreate="">

		<cfset var qGetId="">

		<cfset var local1=arguments.bean.getstyleName()>
		<cfset var local2=arguments.bean.getextendedDescription()>
		<cfset var local3=arguments.bean.getclassID()>
		<cfset var local4=arguments.bean.getdivisionID()>
		<cfset var local5=arguments.bean.getsizeID()>
		<cfset var local6=arguments.bean.getsellingPrice()>
		<cfset var local7=arguments.bean.getcolorDescription()>
		<cfset var local8=arguments.bean.getdivisionName()>
		<cfset var local9=arguments.bean.getclassDescription()>
		<cfset var local10=arguments.bean.getsizeDescription()>
		<cfset var local11=arguments.bean.getcolorID()>
		<cfset var local12=arguments.bean.gethotSeller()>
		<cfset var local13=arguments.bean.getonWeb()>
		<cfset var local14=arguments.bean.getarchive()>
		<cfset var local15=arguments.bean.getfile()>
		<cfset var local16=arguments.bean.getthumbnailFile()>
		<cfset var local17=arguments.bean.getonStock()>
		<cfset var local18=arguments.bean.getdeliveryYear()>
		<cfset var local19=arguments.bean.getdeliveryMonth()>
		<cfset var local20=arguments.bean.getpercent()>
		<cfset var local21=arguments.bean.getdiscountID()>
		<cfset var local22=arguments.bean.getlastMaintainedDate()>

		<cftransaction isolation="read_committed">
			<cfquery name="qCreate" datasource="warehouse">
				insert into WebProductCatalogView(styleName, extendedDescription, classID, divisionID, sizeID, sellingPrice, colorDescription, divisionName, classDescription, sizeDescription, colorID, hotSeller, onWeb, archive, file, thumbnailFile, onStock, deliveryYear, deliveryMonth, percent, discountID, lastMaintainedDate)
				values (
					<cfqueryparam value="#local1#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local2#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local3#" cfsqltype="CF_SQL_INTEGER" null="#iif((local3 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local4#" cfsqltype="CF_SQL_INTEGER" null="#iif((local4 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local5#" cfsqltype="CF_SQL_INTEGER" null="#iif((local5 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local6#" cfsqltype="CF_SQL_INTEGER" null="#iif((local6 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local7#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local8#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local9#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local10#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local11#" cfsqltype="CF_SQL_INTEGER" null="#iif((local11 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local12#" cfsqltype="CF_SQL_TINYINT" null="#iif((local12 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local13#" cfsqltype="CF_SQL_TINYINT" null="#iif((local13 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local14#" cfsqltype="CF_SQL_TINYINT" null="#iif((local14 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local15#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local16#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local17#" cfsqltype="CF_SQL_TINYINT" null="#iif((local17 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local18#" cfsqltype="CF_SQL_INTEGER" null="#iif((local18 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local19#" cfsqltype="CF_SQL_INTEGER" null="#iif((local19 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local20#" cfsqltype="CF_SQL_INTEGER" null="#iif((local20 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local21#" cfsqltype="CF_SQL_INTEGER" null="#iif((local21 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local22#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local22 eq ""), de("yes"), de("no"))#" />
				)
			</cfquery>

			<!--- If your server has a better way to get the ID that is more reliable, use that instead --->
			<cfquery name="qGetID" datasource="warehouse">
				select productID
				from WebProductCatalogView
				where styleName = <cfqueryparam value="#local1#" cfsqltype="CF_SQL_VARCHAR" />
				  and extendedDescription = <cfqueryparam value="#local2#" cfsqltype="CF_SQL_VARCHAR" />
				  and classID = <cfqueryparam value="#local3#" cfsqltype="CF_SQL_INTEGER" null="#iif((local3 eq ""), de("yes"), de("no"))#" />
				  and divisionID = <cfqueryparam value="#local4#" cfsqltype="CF_SQL_INTEGER" null="#iif((local4 eq ""), de("yes"), de("no"))#" />
				  and sizeID = <cfqueryparam value="#local5#" cfsqltype="CF_SQL_INTEGER" null="#iif((local5 eq ""), de("yes"), de("no"))#" />
				  and sellingPrice = <cfqueryparam value="#local6#" cfsqltype="CF_SQL_INTEGER" null="#iif((local6 eq ""), de("yes"), de("no"))#" />
				  and colorDescription = <cfqueryparam value="#local7#" cfsqltype="CF_SQL_VARCHAR" />
				  and divisionName = <cfqueryparam value="#local8#" cfsqltype="CF_SQL_VARCHAR" />
				  and classDescription = <cfqueryparam value="#local9#" cfsqltype="CF_SQL_VARCHAR" />
				  and sizeDescription = <cfqueryparam value="#local10#" cfsqltype="CF_SQL_VARCHAR" />
				  and colorID = <cfqueryparam value="#local11#" cfsqltype="CF_SQL_INTEGER" null="#iif((local11 eq ""), de("yes"), de("no"))#" />
				  and hotSeller = <cfqueryparam value="#local12#" cfsqltype="CF_SQL_TINYINT" null="#iif((local12 eq ""), de("yes"), de("no"))#" />
				  and onWeb = <cfqueryparam value="#local13#" cfsqltype="CF_SQL_TINYINT" null="#iif((local13 eq ""), de("yes"), de("no"))#" />
				  and archive = <cfqueryparam value="#local14#" cfsqltype="CF_SQL_TINYINT" null="#iif((local14 eq ""), de("yes"), de("no"))#" />
				  and file = <cfqueryparam value="#local15#" cfsqltype="CF_SQL_VARCHAR" />
				  and thumbnailFile = <cfqueryparam value="#local16#" cfsqltype="CF_SQL_VARCHAR" />
				  and onStock = <cfqueryparam value="#local17#" cfsqltype="CF_SQL_TINYINT" null="#iif((local17 eq ""), de("yes"), de("no"))#" />
				  and deliveryYear = <cfqueryparam value="#local18#" cfsqltype="CF_SQL_INTEGER" null="#iif((local18 eq ""), de("yes"), de("no"))#" />
				  and deliveryMonth = <cfqueryparam value="#local19#" cfsqltype="CF_SQL_INTEGER" null="#iif((local19 eq ""), de("yes"), de("no"))#" />
				  and percent = <cfqueryparam value="#local20#" cfsqltype="CF_SQL_INTEGER" null="#iif((local20 eq ""), de("yes"), de("no"))#" />
				  and discountID = <cfqueryparam value="#local21#" cfsqltype="CF_SQL_INTEGER" null="#iif((local21 eq ""), de("yes"), de("no"))#" />
				  and lastMaintainedDate = <cfqueryparam value="#local22#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local22 eq ""), de("yes"), de("no"))#" />
				order by productID desc
			</cfquery>
		</cftransaction>

		<cfscript>
			arguments.bean.setproductID(qGetID.productID);
		</cfscript>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="update" output="false" access="public">
		<cfargument name="bean" required="true" type="warehouse.model.catalog.ProductCatalog">
		<cfset var qUpdate="">

		<cfquery name="qUpdate" datasource="warehouse" result="status">
			update WebProductCatalogView
			set styleName = <cfqueryparam value="#arguments.bean.getstyleName()#" cfsqltype="CF_SQL_VARCHAR" />,
				extendedDescription = <cfqueryparam value="#arguments.bean.getextendedDescription()#" cfsqltype="CF_SQL_VARCHAR" />,
				classID = <cfqueryparam value="#arguments.bean.getclassID()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getclassID() eq ""), de("yes"), de("no"))#" />,
				divisionID = <cfqueryparam value="#arguments.bean.getdivisionID()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getdivisionID() eq ""), de("yes"), de("no"))#" />,
				sizeID = <cfqueryparam value="#arguments.bean.getsizeID()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getsizeID() eq ""), de("yes"), de("no"))#" />,
				sellingPrice = <cfqueryparam value="#arguments.bean.getsellingPrice()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getsellingPrice() eq ""), de("yes"), de("no"))#" />,
				colorDescription = <cfqueryparam value="#arguments.bean.getcolorDescription()#" cfsqltype="CF_SQL_VARCHAR" />,
				divisionName = <cfqueryparam value="#arguments.bean.getdivisionName()#" cfsqltype="CF_SQL_VARCHAR" />,
				classDescription = <cfqueryparam value="#arguments.bean.getclassDescription()#" cfsqltype="CF_SQL_VARCHAR" />,
				sizeDescription = <cfqueryparam value="#arguments.bean.getsizeDescription()#" cfsqltype="CF_SQL_VARCHAR" />,
				colorID = <cfqueryparam value="#arguments.bean.getcolorID()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getcolorID() eq ""), de("yes"), de("no"))#" />,
				hotSeller = <cfqueryparam value="#arguments.bean.gethotSeller()#" cfsqltype="CF_SQL_TINYINT" null="#iif((arguments.bean.gethotSeller() eq ""), de("yes"), de("no"))#" />,
				onWeb = <cfqueryparam value="#arguments.bean.getonWeb()#" cfsqltype="CF_SQL_TINYINT" null="#iif((arguments.bean.getonWeb() eq ""), de("yes"), de("no"))#" />,
				archive = <cfqueryparam value="#arguments.bean.getarchive()#" cfsqltype="CF_SQL_TINYINT" null="#iif((arguments.bean.getarchive() eq ""), de("yes"), de("no"))#" />,
				file = <cfqueryparam value="#arguments.bean.getfile()#" cfsqltype="CF_SQL_VARCHAR" />,
				thumbnailFile = <cfqueryparam value="#arguments.bean.getthumbnailFile()#" cfsqltype="CF_SQL_VARCHAR" />,
				onStock = <cfqueryparam value="#arguments.bean.getonStock()#" cfsqltype="CF_SQL_TINYINT" null="#iif((arguments.bean.getonStock() eq ""), de("yes"), de("no"))#" />,
				deliveryYear = <cfqueryparam value="#arguments.bean.getdeliveryYear()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getdeliveryYear() eq ""), de("yes"), de("no"))#" />,
				deliveryMonth = <cfqueryparam value="#arguments.bean.getdeliveryMonth()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getdeliveryMonth() eq ""), de("yes"), de("no"))#" />,
				percent = <cfqueryparam value="#arguments.bean.getpercent()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getpercent() eq ""), de("yes"), de("no"))#" />,
				discountID = <cfqueryparam value="#arguments.bean.getdiscountID()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getdiscountID() eq ""), de("yes"), de("no"))#" />,
				lastMaintainedDate = <cfqueryparam value="#arguments.bean.getlastMaintainedDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getlastMaintainedDate() eq ""), de("yes"), de("no"))#" />
			where productID = <cfqueryparam value="#arguments.bean.getproductID()#" cfsqltype="CF_SQL_INTEGER">
		</cfquery>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="bean" required="true" type="warehouse.model.catalog.ProductCatalog">
		<cfset var qDelete="">

		<cfquery name="qDelete" datasource="warehouse" result="status">
			delete
			from WebProductCatalogView
			where productID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.bean.getproductID()#" />
		</cfquery>

	</cffunction>


</cfcomponent>