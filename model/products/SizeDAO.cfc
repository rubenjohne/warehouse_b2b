<cfcomponent output="false">

	<cffunction name="read" output="false" access="public" returntype="warehouse.model.products.Size">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="warehouse">
			select 	sizeID, sizeScaleCode, sizeDescription, sizeCode1, sizeCode2, sizeCode3, 
					sizeCode4, sizeCode5, sizeCode6, sizeCode7, sizeCode8, 
					sizeCode9, sizeCode10, sizeCode11, sizeCode12
			from ts_sizes
			where sizeID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "warehouse.model.products.Size").init();
			obj.setsizeID(qRead.sizeID);
			obj.setsizeScaleCode(qRead.sizeScaleCode);
			obj.setsizeDescription(qRead.sizeDescription);
			obj.setsizeCode1(qRead.sizeCode1);
			obj.setsizeCode2(qRead.sizeCode2);
			obj.setsizeCode3(qRead.sizeCode3);
			obj.setsizeCode4(qRead.sizeCode4);
			obj.setsizeCode5(qRead.sizeCode5);
			obj.setsizeCode6(qRead.sizeCode6);
			obj.setsizeCode7(qRead.sizeCode7);
			obj.setsizeCode8(qRead.sizeCode8);
			obj.setsizeCode9(qRead.sizeCode9);
			obj.setsizeCode10(qRead.sizeCode10);
			obj.setsizeCode11(qRead.sizeCode11);
			obj.setsizeCode12(qRead.sizeCode12);
			return obj;
		</cfscript>
	</cffunction>



	<cffunction name="create" output="false" access="public">
		<cfargument name="bean" required="true" type="warehouse.model.products.Size">
		<cfset var qCreate="">

		<cfset var qGetId="">

		<cfset var local1=arguments.bean.getsizeScaleCode()>
		<cfset var local2=arguments.bean.getsizeDescription()>
		<cfset var local3=arguments.bean.getsizeCode1()>
		<cfset var local4=arguments.bean.getsizeCode2()>
		<cfset var local5=arguments.bean.getsizeCode3()>
		<cfset var local6=arguments.bean.getsizeCode4()>
		<cfset var local7=arguments.bean.getsizeCode5()>
		<cfset var local8=arguments.bean.getsizeCode6()>
		<cfset var local9=arguments.bean.getsizeCode7()>
		<cfset var local10=arguments.bean.getsizeCode8()>
		<cfset var local11=arguments.bean.getsizeCode9()>
		<cfset var local12=arguments.bean.getsizeCode10()>
		<cfset var local13=arguments.bean.getsizeCode11()>
		<cfset var local14=arguments.bean.getsizeCode12()>

		<cftransaction isolation="read_committed">
			<cfquery name="qCreate" datasource="warehouse">
				insert into ts_sizes(sizeScaleCode, sizeDescription, sizeCode1, sizeCode2, sizeCode3, sizeCode4, sizeCode5, sizeCode6, sizeCode7, sizeCode8, sizeCode9, sizeCode10, sizeCode11, sizeCode12)
				values (
					<cfqueryparam value="#local1#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local2#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local3#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local4#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local5#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local6#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local7#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local8#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local9#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local10#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local11#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local12#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local13#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local14#" cfsqltype="CF_SQL_VARCHAR" />
				)
			</cfquery>

			<!--- If your server has a better way to get the ID that is more reliable, use that instead --->
			<cfquery name="qGetID" datasource="warehouse">
				select sizeID
				from ts_sizes
				where sizeScaleCode = <cfqueryparam value="#local1#" cfsqltype="CF_SQL_VARCHAR" />
				  and sizeDescription = <cfqueryparam value="#local2#" cfsqltype="CF_SQL_VARCHAR" />
				  and sizeCode1 = <cfqueryparam value="#local3#" cfsqltype="CF_SQL_VARCHAR" />
				  and sizeCode2 = <cfqueryparam value="#local4#" cfsqltype="CF_SQL_VARCHAR" />
				  and sizeCode3 = <cfqueryparam value="#local5#" cfsqltype="CF_SQL_VARCHAR" />
				  and sizeCode4 = <cfqueryparam value="#local6#" cfsqltype="CF_SQL_VARCHAR" />
				  and sizeCode5 = <cfqueryparam value="#local7#" cfsqltype="CF_SQL_VARCHAR" />
				  and sizeCode6 = <cfqueryparam value="#local8#" cfsqltype="CF_SQL_VARCHAR" />
				  and sizeCode7 = <cfqueryparam value="#local9#" cfsqltype="CF_SQL_VARCHAR" />
				  and sizeCode8 = <cfqueryparam value="#local10#" cfsqltype="CF_SQL_VARCHAR" />
				  and sizeCode9 = <cfqueryparam value="#local11#" cfsqltype="CF_SQL_VARCHAR" />
				  and sizeCode10 = <cfqueryparam value="#local12#" cfsqltype="CF_SQL_VARCHAR" />
				  and sizeCode11 = <cfqueryparam value="#local13#" cfsqltype="CF_SQL_VARCHAR" />
				  and sizeCode12 = <cfqueryparam value="#local14#" cfsqltype="CF_SQL_VARCHAR" />
				order by sizeID desc
			</cfquery>
		</cftransaction>

		<cfscript>
			arguments.bean.setsizeID(qGetID.sizeID);
		</cfscript>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="update" output="false" access="public">
		<cfargument name="bean" required="true" type="warehouse.model.products.Size">
		<cfset var qUpdate="">

		<cfquery name="qUpdate" datasource="warehouse" result="status">
			update ts_sizes
			set sizeScaleCode = <cfqueryparam value="#arguments.bean.getsizeScaleCode()#" cfsqltype="CF_SQL_VARCHAR" />,
				sizeDescription = <cfqueryparam value="#arguments.bean.getsizeDescription()#" cfsqltype="CF_SQL_VARCHAR" />,
				sizeCode1 = <cfqueryparam value="#arguments.bean.getsizeCode1()#" cfsqltype="CF_SQL_VARCHAR" />,
				sizeCode2 = <cfqueryparam value="#arguments.bean.getsizeCode2()#" cfsqltype="CF_SQL_VARCHAR" />,
				sizeCode3 = <cfqueryparam value="#arguments.bean.getsizeCode3()#" cfsqltype="CF_SQL_VARCHAR" />,
				sizeCode4 = <cfqueryparam value="#arguments.bean.getsizeCode4()#" cfsqltype="CF_SQL_VARCHAR" />,
				sizeCode5 = <cfqueryparam value="#arguments.bean.getsizeCode5()#" cfsqltype="CF_SQL_VARCHAR" />,
				sizeCode6 = <cfqueryparam value="#arguments.bean.getsizeCode6()#" cfsqltype="CF_SQL_VARCHAR" />,
				sizeCode7 = <cfqueryparam value="#arguments.bean.getsizeCode7()#" cfsqltype="CF_SQL_VARCHAR" />,
				sizeCode8 = <cfqueryparam value="#arguments.bean.getsizeCode8()#" cfsqltype="CF_SQL_VARCHAR" />,
				sizeCode9 = <cfqueryparam value="#arguments.bean.getsizeCode9()#" cfsqltype="CF_SQL_VARCHAR" />,
				sizeCode10 = <cfqueryparam value="#arguments.bean.getsizeCode10()#" cfsqltype="CF_SQL_VARCHAR" />,
				sizeCode11 = <cfqueryparam value="#arguments.bean.getsizeCode11()#" cfsqltype="CF_SQL_VARCHAR" />,
				sizeCode12 = <cfqueryparam value="#arguments.bean.getsizeCode12()#" cfsqltype="CF_SQL_VARCHAR" />
			where sizeID = <cfqueryparam value="#arguments.bean.getsizeID()#" cfsqltype="CF_SQL_INTEGER">
		</cfquery>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="bean" required="true" type="warehouse.model.products.Size">
		<cfset var qDelete="">

		<cfquery name="qDelete" datasource="warehouse" result="status">
			delete
			from ts_sizes
			where sizeID = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.bean.getsizeID()#" />
		</cfquery>

	</cffunction>


</cfcomponent>