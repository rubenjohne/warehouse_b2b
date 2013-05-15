<cfcomponent output="false">

	<cffunction name="read" output="false" access="public" returntype="warehouse.model.retailers.Retailer">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="warehouse">
			select 	retailerID, firstName, lastName, email, phone, storeName, 
					website, source, comments
			from ts_retailers
			where retailerID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "warehouse.model.retailers.Retailer").init();
			obj.setretailerID(qRead.retailerID);
			obj.setfirstName(qRead.firstName);
			obj.setlastName(qRead.lastName);
			obj.setemail(qRead.email);
			obj.setphone(qRead.phone);
			obj.setstoreName(qRead.storeName);
			obj.setwebsite(qRead.website);
			obj.setsource(qRead.source);
			obj.setcomments(qRead.comments);
			return obj;
		</cfscript>
	</cffunction>



	<cffunction name="create" output="false" access="public">
		<cfargument name="bean" required="true" type="warehouse.model.retailers.Retailer">
		<cfset var qCreate="">

		<cfset var qGetId="">

		<cfset var local1=arguments.bean.getfirstName()>
		<cfset var local2=arguments.bean.getlastName()>
		<cfset var local3=arguments.bean.getemail()>
		<cfset var local4=arguments.bean.getphone()>
		<cfset var local5=arguments.bean.getstoreName()>
		<cfset var local6=arguments.bean.getwebsite()>
		<cfset var local7=arguments.bean.getsource()>
		<cfset var local8=arguments.bean.getcomments()>

		<cftransaction isolation="read_committed">
			<cfquery name="qCreate" datasource="warehouse">
				insert into ts_retailers(firstName, lastName, email, phone, storeName, website, source, comments)
				values (
					<cfqueryparam value="#local1#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local2#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local3#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local4#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local5#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local6#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local7#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local8#" cfsqltype="CF_SQL_LONGVARCHAR" />
				)
			</cfquery>

			<!--- If your server has a better way to get the ID that is more reliable, use that instead --->
			<cfquery name="qGetID" datasource="warehouse">
				select retailerID
				from ts_retailers
				where firstName = <cfqueryparam value="#local1#" cfsqltype="CF_SQL_VARCHAR" />
				  and lastName = <cfqueryparam value="#local2#" cfsqltype="CF_SQL_VARCHAR" />
				  and email = <cfqueryparam value="#local3#" cfsqltype="CF_SQL_VARCHAR" />
				  and phone = <cfqueryparam value="#local4#" cfsqltype="CF_SQL_VARCHAR" />
				  and storeName = <cfqueryparam value="#local5#" cfsqltype="CF_SQL_VARCHAR" />
				  and website = <cfqueryparam value="#local6#" cfsqltype="CF_SQL_VARCHAR" />
				  and source = <cfqueryparam value="#local7#" cfsqltype="CF_SQL_VARCHAR" />
				  and comments = <cfqueryparam value="#local8#" cfsqltype="CF_SQL_LONGVARCHAR" />
				order by retailerID desc
			</cfquery>
		</cftransaction>

		<cfscript>
			arguments.bean.setretailerID(qGetID.retailerID);
		</cfscript>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="update" output="false" access="public">
		<cfargument name="bean" required="true" type="warehouse.model.retailers.Retailer">
		<cfset var qUpdate="">

		<cfquery name="qUpdate" datasource="warehouse" result="status">
			update ts_retailers
			set firstName = <cfqueryparam value="#arguments.bean.getfirstName()#" cfsqltype="CF_SQL_VARCHAR" />,
				lastName = <cfqueryparam value="#arguments.bean.getlastName()#" cfsqltype="CF_SQL_VARCHAR" />,
				email = <cfqueryparam value="#arguments.bean.getemail()#" cfsqltype="CF_SQL_VARCHAR" />,
				phone = <cfqueryparam value="#arguments.bean.getphone()#" cfsqltype="CF_SQL_VARCHAR" />,
				storeName = <cfqueryparam value="#arguments.bean.getstoreName()#" cfsqltype="CF_SQL_VARCHAR" />,
				website = <cfqueryparam value="#arguments.bean.getwebsite()#" cfsqltype="CF_SQL_VARCHAR" />,
				source = <cfqueryparam value="#arguments.bean.getsource()#" cfsqltype="CF_SQL_VARCHAR" />,
				comments = <cfqueryparam value="#arguments.bean.getcomments()#" cfsqltype="CF_SQL_LONGVARCHAR" />
			where retailerID = <cfqueryparam value="#arguments.bean.getretailerID()#" cfsqltype="CF_SQL_INTEGER">
		</cfquery>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="bean" required="true" type="warehouse.model.retailers.Retailer">
		<cfset var qDelete="">

		<cfquery name="qDelete" datasource="warehouse" result="status">
			delete
			from ts_retailers
			where retailerID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.bean.getretailerID()#" />
		</cfquery>

	</cffunction>


</cfcomponent>