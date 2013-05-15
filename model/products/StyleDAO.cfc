<cfcomponent output="false">

	<cffunction name="read" output="false" access="public" returntype="warehouse.model.products.Style">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="warehouse">
			select 	styleID, styleName, description, shortDescription, extendedDescription, classID, 
					divisionID, sizeID, onWeb, archive, shipCharge, 
					sellingPrice, createdDate, createdBy, lastMaintainedDate, lastMaintainedBy
					
			from ts_styles
			where styleID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "warehouse.model.products.Style").init();
			obj.setstyleID(qRead.styleID);
			obj.setstyleName(qRead.styleName);
			obj.setdescription(qRead.description);
			obj.setshortDescription(qRead.shortDescription);
			obj.setextendedDescription(qRead.extendedDescription);
			obj.setclassID(qRead.classID);
			obj.setdivisionID(qRead.divisionID);
			obj.setsizeID(qRead.sizeID);
			obj.setonWeb(qRead.onWeb);
			obj.setarchive(qRead.archive);
			obj.setshipCharge(qRead.shipCharge);
			obj.setsellingPrice(qRead.sellingPrice);
			obj.setcreatedDate(qRead.createdDate);
			obj.setcreatedBy(qRead.createdBy);
			obj.setlastMaintainedDate(qRead.lastMaintainedDate);
			obj.setlastMaintainedBy(qRead.lastMaintainedBy);
			return obj;
		</cfscript>
	</cffunction>



	<cffunction name="create" output="false" access="public">
		<cfargument name="bean" required="true" type="warehouse.model.products.Style">
		<cfset var qCreate="">

		<cfset var qGetId="">

		<cfset var local1=arguments.bean.getstyleName()>
		<cfset var local2=arguments.bean.getdescription()>
		<cfset var local3=arguments.bean.getshortDescription()>
		<cfset var local4=arguments.bean.getextendedDescription()>
		<cfset var local5=arguments.bean.getclassID()>
		<cfset var local6=arguments.bean.getdivisionID()>
		<cfset var local7=arguments.bean.getsizeID()>
		<cfset var local8=arguments.bean.getonWeb()>
		<cfset var local9=arguments.bean.getarchive()>
		<cfset var local10=arguments.bean.getshipCharge()>
		<cfset var local11=arguments.bean.getsellingPrice()>
		<cfset var local12=arguments.bean.getcreatedDate()>
		<cfset var local13=arguments.bean.getcreatedBy()>
		<cfset var local14=arguments.bean.getlastMaintainedDate()>
		<cfset var local15=arguments.bean.getlastMaintainedBy()>

		<cftransaction isolation="read_committed">
			<cfquery name="qCreate" datasource="warehouse">
				insert into ts_styles(styleName, description, shortDescription, extendedDescription, classID, divisionID, sizeID, onWeb, archive, shipCharge, sellingPrice, createdDate, createdBy, lastMaintainedDate, lastMaintainedBy)
				values (
					<cfqueryparam value="#local1#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local2#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local3#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local4#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local5#" cfsqltype="CF_SQL_INTEGER" null="#iif((local5 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local6#" cfsqltype="CF_SQL_INTEGER" null="#iif((local6 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local7#" cfsqltype="CF_SQL_INTEGER" null="#iif((local7 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local8#" cfsqltype="CF_SQL_TINYINT" null="#iif((local8 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local9#" cfsqltype="CF_SQL_TINYINT" null="#iif((local9 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local10#" cfsqltype="CF_SQL_TINYINT" null="#iif((local10 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local11#" cfsqltype="CF_SQL_INTEGER" null="#iif((local11 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local12#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local12 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local13#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local14#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local14 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local15#" cfsqltype="CF_SQL_VARCHAR" />
				)
			</cfquery>

			<!--- If your server has a better way to get the ID that is more reliable, use that instead --->
			<cfquery name="qGetID" datasource="warehouse">
				select styleID
				from ts_styles
				where styleName = <cfqueryparam value="#local1#" cfsqltype="CF_SQL_VARCHAR" />
				  and description = <cfqueryparam value="#local2#" cfsqltype="CF_SQL_VARCHAR" />
				  and shortDescription = <cfqueryparam value="#local3#" cfsqltype="CF_SQL_VARCHAR" />
				  and extendedDescription = <cfqueryparam value="#local4#" cfsqltype="CF_SQL_VARCHAR" />
				  and classID = <cfqueryparam value="#local5#" cfsqltype="CF_SQL_INTEGER" null="#iif((local5 eq ""), de("yes"), de("no"))#" />
				  and divisionID = <cfqueryparam value="#local6#" cfsqltype="CF_SQL_INTEGER" null="#iif((local6 eq ""), de("yes"), de("no"))#" />
				  and sizeID = <cfqueryparam value="#local7#" cfsqltype="CF_SQL_INTEGER" null="#iif((local7 eq ""), de("yes"), de("no"))#" />
				  and onWeb = <cfqueryparam value="#local8#" cfsqltype="CF_SQL_TINYINT" null="#iif((local8 eq ""), de("yes"), de("no"))#" />
				  and archive = <cfqueryparam value="#local9#" cfsqltype="CF_SQL_TINYINT" null="#iif((local9 eq ""), de("yes"), de("no"))#" />
				  and shipCharge = <cfqueryparam value="#local10#" cfsqltype="CF_SQL_TINYINT" null="#iif((local10 eq ""), de("yes"), de("no"))#" />
				  and sellingPrice = <cfqueryparam value="#local11#" cfsqltype="CF_SQL_INTEGER" null="#iif((local11 eq ""), de("yes"), de("no"))#" />
				  and createdDate = <cfqueryparam value="#local12#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local12 eq ""), de("yes"), de("no"))#" />
				  and createdBy = <cfqueryparam value="#local13#" cfsqltype="CF_SQL_VARCHAR" />
				  and lastMaintainedDate = <cfqueryparam value="#local14#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((local14 eq ""), de("yes"), de("no"))#" />
				  and lastMaintainedBy = <cfqueryparam value="#local15#" cfsqltype="CF_SQL_VARCHAR" />
				order by styleID desc
			</cfquery>
		</cftransaction>

		<cfscript>
			arguments.bean.setstyleID(qGetID.styleID);
		</cfscript>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="update" output="false" access="public">
		<cfargument name="bean" required="true" type="warehouse.model.products.Style">
		<cfset var qUpdate="">

		<cfquery name="qUpdate" datasource="warehouse" result="status">
			update ts_styles
			set styleName = <cfqueryparam value="#arguments.bean.getstyleName()#" cfsqltype="CF_SQL_VARCHAR" />,
				description = <cfqueryparam value="#arguments.bean.getdescription()#" cfsqltype="CF_SQL_VARCHAR" />,
				shortDescription = <cfqueryparam value="#arguments.bean.getshortDescription()#" cfsqltype="CF_SQL_VARCHAR" />,
				extendedDescription = <cfqueryparam value="#arguments.bean.getextendedDescription()#" cfsqltype="CF_SQL_VARCHAR" />,
				classID = <cfqueryparam value="#arguments.bean.getclassID()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getclassID() eq ""), de("yes"), de("no"))#" />,
				divisionID = <cfqueryparam value="#arguments.bean.getdivisionID()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getdivisionID() eq ""), de("yes"), de("no"))#" />,
				sizeID = <cfqueryparam value="#arguments.bean.getsizeID()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getsizeID() eq ""), de("yes"), de("no"))#" />,
				onWeb = <cfqueryparam value="#arguments.bean.getonWeb()#" cfsqltype="CF_SQL_TINYINT" null="#iif((arguments.bean.getonWeb() eq ""), de("yes"), de("no"))#" />,
				archive = <cfqueryparam value="#arguments.bean.getarchive()#" cfsqltype="CF_SQL_TINYINT" null="#iif((arguments.bean.getarchive() eq ""), de("yes"), de("no"))#" />,
				shipCharge = <cfqueryparam value="#arguments.bean.getshipCharge()#" cfsqltype="CF_SQL_TINYINT" null="#iif((arguments.bean.getshipCharge() eq ""), de("yes"), de("no"))#" />,
				sellingPrice = <cfqueryparam value="#arguments.bean.getsellingPrice()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getsellingPrice() eq ""), de("yes"), de("no"))#" />,
				createdDate = <cfqueryparam value="#arguments.bean.getcreatedDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getcreatedDate() eq ""), de("yes"), de("no"))#" />,
				createdBy = <cfqueryparam value="#arguments.bean.getcreatedBy()#" cfsqltype="CF_SQL_VARCHAR" />,
				lastMaintainedDate = <cfqueryparam value="#arguments.bean.getlastMaintainedDate()#" cfsqltype="CF_SQL_TIMESTAMP" null="#iif((arguments.bean.getlastMaintainedDate() eq ""), de("yes"), de("no"))#" />,
				lastMaintainedBy = <cfqueryparam value="#arguments.bean.getlastMaintainedBy()#" cfsqltype="CF_SQL_VARCHAR" />
			where styleID = <cfqueryparam value="#arguments.bean.getstyleID()#" cfsqltype="CF_SQL_INTEGER">
		</cfquery>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="bean" required="true" type="warehouse.model.products.Style">
		<cfset var qDelete="">

		<cfquery name="qDelete" datasource="warehouse" result="status">
			delete
			from ts_styles
			where styleID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.bean.getstyleID()#" />
		</cfquery>

	</cffunction>


</cfcomponent>