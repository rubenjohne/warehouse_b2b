<cfcomponent output="false">

	<cffunction name="read" output="false" access="public" returntype="warehouse.model.products.Product">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="warehouse">
			select 	productID, styleID, colorID, discountID, onWeb, archive, 
					onStock, hotSeller, forReview, onHand, orders, 
					wip, stock, available, deliveryMonth, deliveryYear, 
					comments, reviewedDate, reviewedBy, createdDate, createdBy, 
					lastMaintainedDate, lastMaintainedBy
			from ts_products
			where productID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "warehouse.model.products.Product").init();
			obj.setproductID(qRead.productID);
			obj.setstyleID(qRead.styleID);
			obj.setcolorID(qRead.colorID);
			obj.setdiscountID(qRead.discountID);
			obj.setonWeb(qRead.onWeb);
			obj.setarchive(qRead.archive);
			obj.setonStock(qRead.onStock);
			obj.sethotSeller(qRead.hotSeller);
			obj.setforReview(qRead.forReview);
			obj.setonHand(qRead.onHand);
			obj.setorders(qRead.orders);
			obj.setwip(qRead.wip);
			obj.setstock(qRead.stock);
			obj.setavailable(qRead.available);
			obj.setdeliveryMonth(qRead.deliveryMonth);
			obj.setdeliveryYear(qRead.deliveryYear);
			obj.setcomments(qRead.comments);
			obj.setreviewedDate(qRead.reviewedDate);
			obj.setreviewedBy(qRead.reviewedBy);
			obj.setcreatedDate(qRead.createdDate);
			obj.setcreatedBy(qRead.createdBy);
			obj.setlastMaintainedDate(qRead.lastMaintainedDate);
			obj.setlastMaintainedBy(qRead.lastMaintainedBy);
			return obj;
		</cfscript>
	</cffunction>



	<cffunction name="create" output="false" access="public">
		<cfargument name="bean" required="true" type="warehouse.model.products.Product">
		<cfset var qCreate="">

		<cfset var qGetId="">

		<cfset var local1=arguments.bean.getstyleID()>
		<cfset var local2=arguments.bean.getcolorID()>
		<cfset var local3=arguments.bean.getdiscountID()>
		<cfset var local4=arguments.bean.getonWeb()>
		<cfset var local5=arguments.bean.getarchive()>
		<cfset var local6=arguments.bean.getonStock()>
		<cfset var local7=arguments.bean.gethotSeller()>
		<cfset var local8=arguments.bean.getforReview()>
		<cfset var local9=arguments.bean.getonHand()>
		<cfset var local10=arguments.bean.getorders()>
		<cfset var local11=arguments.bean.getwip()>
		<cfset var local12=arguments.bean.getstock()>
		<cfset var local13=arguments.bean.getavailable()>
		<cfset var local14=arguments.bean.getdeliveryMonth()>
		<cfset var local15=arguments.bean.getdeliveryYear()>
		<cfset var local16=arguments.bean.getcomments()>
		<cfset var local17=arguments.bean.getreviewedDate()>
		<cfset var local18=arguments.bean.getreviewedBy()>
		<cfset var local19=arguments.bean.getcreatedDate()>
		<cfset var local20=arguments.bean.getcreatedBy()>
		<cfset var local21=arguments.bean.getlastMaintainedDate()>
		<cfset var local22=arguments.bean.getlastMaintainedBy()>

		<cftransaction isolation="read_committed">
			<cfquery name="qCreate" datasource="warehouse">
				insert into ts_products(styleID, colorID, discountID, onWeb, archive, onStock, hotSeller, forReview, onHand, orders, wip, stock, available, deliveryMonth, deliveryYear, comments, reviewedDate, reviewedBy, createdDate, createdBy, lastMaintainedDate, lastMaintainedBy)
				values (
					<cfqueryparam value="#local1#" cfsqltype="CF_SQL_INTEGER" null="#iif((local1 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local2#" cfsqltype="CF_SQL_INTEGER" null="#iif((local2 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local3#" cfsqltype="CF_SQL_INTEGER" null="#iif((local3 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local4#" cfsqltype="CF_SQL_TINYINT" null="#iif((local4 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local5#" cfsqltype="CF_SQL_TINYINT" null="#iif((local5 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local6#" cfsqltype="CF_SQL_TINYINT" null="#iif((local6 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local7#" cfsqltype="CF_SQL_TINYINT" null="#iif((local7 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local8#" cfsqltype="CF_SQL_TINYINT" null="#iif((local8 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local9#" cfsqltype="CF_SQL_INTEGER" null="#iif((local9 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local10#" cfsqltype="CF_SQL_INTEGER" null="#iif((local10 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local11#" cfsqltype="CF_SQL_INTEGER" null="#iif((local11 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local12#" cfsqltype="CF_SQL_INTEGER" null="#iif((local12 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local13#" cfsqltype="CF_SQL_INTEGER" null="#iif((local13 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local14#" cfsqltype="CF_SQL_INTEGER" null="#iif((local14 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local15#" cfsqltype="CF_SQL_INTEGER" null="#iif((local15 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local16#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local17#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local17 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local18#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local19#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local19 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local20#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local21#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local21 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local22#" cfsqltype="CF_SQL_VARCHAR" />
				)
			</cfquery>

			<!--- If your server has a better way to get the ID that is more reliable, use that instead --->
			<cfquery name="qGetID" datasource="warehouse">
				select productID
				from ts_products
				where styleID = <cfqueryparam value="#local1#" cfsqltype="CF_SQL_INTEGER" null="#iif((local1 eq ""), de("yes"), de("no"))#" />
				  and colorID = <cfqueryparam value="#local2#" cfsqltype="CF_SQL_INTEGER" null="#iif((local2 eq ""), de("yes"), de("no"))#" />
				  and discountID = <cfqueryparam value="#local3#" cfsqltype="CF_SQL_INTEGER" null="#iif((local3 eq ""), de("yes"), de("no"))#" />
				  and onWeb = <cfqueryparam value="#local4#" cfsqltype="CF_SQL_TINYINT" null="#iif((local4 eq ""), de("yes"), de("no"))#" />
				  and archive = <cfqueryparam value="#local5#" cfsqltype="CF_SQL_TINYINT" null="#iif((local5 eq ""), de("yes"), de("no"))#" />
				  and onStock = <cfqueryparam value="#local6#" cfsqltype="CF_SQL_TINYINT" null="#iif((local6 eq ""), de("yes"), de("no"))#" />
				  and hotSeller = <cfqueryparam value="#local7#" cfsqltype="CF_SQL_TINYINT" null="#iif((local7 eq ""), de("yes"), de("no"))#" />
				  and forReview = <cfqueryparam value="#local8#" cfsqltype="CF_SQL_TINYINT" null="#iif((local8 eq ""), de("yes"), de("no"))#" />
				  and onHand = <cfqueryparam value="#local9#" cfsqltype="CF_SQL_INTEGER" null="#iif((local9 eq ""), de("yes"), de("no"))#" />
				  and orders = <cfqueryparam value="#local10#" cfsqltype="CF_SQL_INTEGER" null="#iif((local10 eq ""), de("yes"), de("no"))#" />
				  and wip = <cfqueryparam value="#local11#" cfsqltype="CF_SQL_INTEGER" null="#iif((local11 eq ""), de("yes"), de("no"))#" />
				  and stock = <cfqueryparam value="#local12#" cfsqltype="CF_SQL_INTEGER" null="#iif((local12 eq ""), de("yes"), de("no"))#" />
				  and available = <cfqueryparam value="#local13#" cfsqltype="CF_SQL_INTEGER" null="#iif((local13 eq ""), de("yes"), de("no"))#" />
				  and deliveryMonth = <cfqueryparam value="#local14#" cfsqltype="CF_SQL_INTEGER" null="#iif((local14 eq ""), de("yes"), de("no"))#" />
				  and deliveryYear = <cfqueryparam value="#local15#" cfsqltype="CF_SQL_INTEGER" null="#iif((local15 eq ""), de("yes"), de("no"))#" />
				  and comments = <cfqueryparam value="#local16#" cfsqltype="CF_SQL_VARCHAR" />
				  and reviewedDate = <cfqueryparam value="#local17#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local17 eq ""), de("yes"), de("no"))#" />
				  and reviewedBy = <cfqueryparam value="#local18#" cfsqltype="CF_SQL_VARCHAR" />
				  and createdDate = <cfqueryparam value="#local19#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local19 eq ""), de("yes"), de("no"))#" />
				  and createdBy = <cfqueryparam value="#local20#" cfsqltype="CF_SQL_VARCHAR" />
				  and lastMaintainedDate = <cfqueryparam value="#local21#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local21 eq ""), de("yes"), de("no"))#" />
				  and lastMaintainedBy = <cfqueryparam value="#local22#" cfsqltype="CF_SQL_VARCHAR" />
				order by productID desc
			</cfquery>
		</cftransaction>

		<cfscript>
			arguments.bean.setproductID(qGetID.productID);
		</cfscript>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="update" output="false" access="public">
		<cfargument name="bean" required="true" type="warehouse.model.products.Product">
		<cfset var qUpdate="">

		<cfquery name="qUpdate" datasource="warehouse" result="status">
			update ts_products
			set styleID = <cfqueryparam value="#arguments.bean.getstyleID()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getstyleID() eq ""), de("yes"), de("no"))#" />,
				colorID = <cfqueryparam value="#arguments.bean.getcolorID()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getcolorID() eq ""), de("yes"), de("no"))#" />,
				discountID = <cfqueryparam value="#arguments.bean.getdiscountID()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getdiscountID() eq ""), de("yes"), de("no"))#" />,
				onWeb = <cfqueryparam value="#arguments.bean.getonWeb()#" cfsqltype="CF_SQL_TINYINT" null="#iif((arguments.bean.getonWeb() eq ""), de("yes"), de("no"))#" />,
				archive = <cfqueryparam value="#arguments.bean.getarchive()#" cfsqltype="CF_SQL_TINYINT" null="#iif((arguments.bean.getarchive() eq ""), de("yes"), de("no"))#" />,
				onStock = <cfqueryparam value="#arguments.bean.getonStock()#" cfsqltype="CF_SQL_TINYINT" null="#iif((arguments.bean.getonStock() eq ""), de("yes"), de("no"))#" />,
				hotSeller = <cfqueryparam value="#arguments.bean.gethotSeller()#" cfsqltype="CF_SQL_TINYINT" null="#iif((arguments.bean.gethotSeller() eq ""), de("yes"), de("no"))#" />,
				forReview = <cfqueryparam value="#arguments.bean.getforReview()#" cfsqltype="CF_SQL_TINYINT" null="#iif((arguments.bean.getforReview() eq ""), de("yes"), de("no"))#" />,
				onHand = <cfqueryparam value="#arguments.bean.getonHand()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getonHand() eq ""), de("yes"), de("no"))#" />,
				orders = <cfqueryparam value="#arguments.bean.getorders()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getorders() eq ""), de("yes"), de("no"))#" />,
				wip = <cfqueryparam value="#arguments.bean.getwip()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getwip() eq ""), de("yes"), de("no"))#" />,
				stock = <cfqueryparam value="#arguments.bean.getstock()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getstock() eq ""), de("yes"), de("no"))#" />,
				available = <cfqueryparam value="#arguments.bean.getavailable()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getavailable() eq ""), de("yes"), de("no"))#" />,
				deliveryMonth = <cfqueryparam value="#arguments.bean.getdeliveryMonth()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getdeliveryMonth() eq ""), de("yes"), de("no"))#" />,
				deliveryYear = <cfqueryparam value="#arguments.bean.getdeliveryYear()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getdeliveryYear() eq ""), de("yes"), de("no"))#" />,
				comments = <cfqueryparam value="#arguments.bean.getcomments()#" cfsqltype="CF_SQL_VARCHAR" />,
				reviewedDate = <cfqueryparam value="#arguments.bean.getreviewedDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getreviewedDate() eq ""), de("yes"), de("no"))#" />,
				reviewedBy = <cfqueryparam value="#arguments.bean.getreviewedBy()#" cfsqltype="CF_SQL_VARCHAR" />,
				createdDate = <cfqueryparam value="#arguments.bean.getcreatedDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getcreatedDate() eq ""), de("yes"), de("no"))#" />,
				createdBy = <cfqueryparam value="#arguments.bean.getcreatedBy()#" cfsqltype="CF_SQL_VARCHAR" />,
				lastMaintainedDate = <cfqueryparam value="#arguments.bean.getlastMaintainedDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getlastMaintainedDate() eq ""), de("yes"), de("no"))#" />,
				lastMaintainedBy = <cfqueryparam value="#arguments.bean.getlastMaintainedBy()#" cfsqltype="CF_SQL_VARCHAR" />
			where productID = <cfqueryparam value="#arguments.bean.getproductID()#" cfsqltype="CF_SQL_INTEGER">
		</cfquery>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="bean" required="true" type="warehouse.model.products.Product">
		<cfset var qDelete="">

		<cfquery name="qDelete" datasource="warehouse" result="status">
			delete
			from ts_products
			where productID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.bean.getproductID()#" />
		</cfquery>

	</cffunction>


</cfcomponent>