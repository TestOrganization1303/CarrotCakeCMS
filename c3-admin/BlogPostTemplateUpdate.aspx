﻿<%@ Page Title="Bulk Apply Templates/Skins - Posts" Language="C#" MasterPageFile="MasterPages/Main.Master" AutoEventWireup="true" CodeBehind="BlogPostTemplateUpdate.aspx.cs"
	Inherits="Carrotware.CMS.UI.Admin.c3_admin.BlogPostTemplateUpdate" %>

<%@ MasterType VirtualPath="MasterPages/Main.Master" %>
<%@ Register Src="ucBlogMenuItems.ascx" TagName="ucBlogMenuItems" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" runat="server">
	<script type="text/javascript">
		function CheckTheBoxes() {
			checkGridBoxes('<%=gvPages.ClientID %>');
		}

		function UncheckTheBoxes() {
			uncheckGridBoxes('<%=gvPages.ClientID %>');
		}
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="H1ContentPlaceHolder" runat="server">
	Bulk Apply Templates/Skins - Posts
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="NoAjaxContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="BodyContentPlaceHolder" runat="server">
	<uc1:ucBlogMenuItems ID="ucBlogMenuItems1" runat="server" />
	<table>
		<tr>
			<td class="tablecaption">
				show content:
			</td>
			<td colspan="3">
				<div class="jqradioset">
					<asp:RadioButton ID="rdoFilterResults1" GroupName="rdoFilterResults" runat="server" Text="Show Filtered" Checked="true" AutoPostBack="True" OnCheckedChanged="rdoFilterResults_CheckedChanged" />
					<asp:RadioButton ID="rdoFilterResults2" GroupName="rdoFilterResults" runat="server" Text="Show All" AutoPostBack="True" OnCheckedChanged="rdoFilterResults_CheckedChanged" />
				</div>
			</td>
		</tr>
	</table>
	<table>
		<tr runat="server" id="trFilter">
			<td class="tablecaption">
				go live date post filter:
				<br />
			</td>
			<td>
				&nbsp;&nbsp;
			</td>
			<td>
				<asp:TextBox CssClass="dateRegion" ID="txtDate" Columns="12" runat="server" />
				<asp:DropDownList ID="ddlDateRange" runat="server">
					<asp:ListItem Text="30 Days +/-" Value="30" />
					<asp:ListItem Text="60 Days +/-" Value="60" />
					<asp:ListItem Text="90 Days +/-" Value="90" />
					<asp:ListItem Text="120 Days +/-" Value="120" />
				</asp:DropDownList>
				<div style="clear: both; height: 2px;">
				</div>
			</td>
			<td>
				&nbsp;&nbsp;
			</td>
			<td>
				<asp:Button ID="btnFilter" runat="server" Text="Apply" OnClick="btnFilter_Click" />
			</td>
		</tr>
	</table>
	<br />
	<table>
		<tr>
			<td class="tablecaption">
				template to apply to selected posts:
			</td>
			<td>
				<asp:DropDownList DataTextField="Caption" DataValueField="TemplatePath" ID="ddlTemplate" runat="server">
				</asp:DropDownList>
			</td>
		</tr>
	</table>
	<br />
	<div style="height: 50px; margin-top: 10px; margin-bottom: 10px;">
		<asp:Button ID="btnSaveMapping" runat="server" Text="Save" OnClick="btnSaveMapping_Click" />
	</div>
	<p>
		<input type="button" value="Check All" onclick="CheckTheBoxes()" />&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" value="Uncheck All" onclick="UncheckTheBoxes()" />
	</p>
	<div class="SortableGrid">
		<carrot:CarrotGridView CssClass="datatable" DefaultSort="TemplateFile ASC" ID="gvPages" runat="server" AutoGenerateColumns="false" HeaderStyle-CssClass="tablehead"
			AlternatingRowStyle-CssClass="rowalt" RowStyle-CssClass="rowregular">
			<EmptyDataTemplate>
				<p>
					<b>No content found.</b>
				</p>
			</EmptyDataTemplate>
			<Columns>
				<asp:TemplateField ItemStyle-HorizontalAlign="Center">
					<HeaderTemplate>
						&nbsp;
					</HeaderTemplate>
					<ItemTemplate>
						<asp:CheckBox ID="chkSelect" runat="server" value='<%# Eval("Root_ContentID") %>' />
					</ItemTemplate>
				</asp:TemplateField>
				<asp:BoundField HeaderText="Template File" DataField="TemplateFile" />
				<asp:BoundField HeaderText="Nav Menu Text" DataField="NavMenuText" />
				<asp:BoundField HeaderText="Filename" DataField="Filename" />
				<asp:BoundField HeaderText="Last Edited" DataField="EditDate" DataFormatString="{0:d}" />
				<asp:BoundField HeaderText="Created On" DataField="CreateDate" DataFormatString="{0:d}" />
				<asp:BoundField HeaderText="Go Live" DataField="GoLiveDate" DataFormatString="{0:d}" />
				<carrot:CarrotHeaderSortTemplateField ItemStyle-HorizontalAlign="Center" DataField="PageActive" HeaderText="Active" AlternateTextFalse="Inactive"
					AlternateTextTrue="Active" ShowBooleanImage="true" />
			</Columns>
		</carrot:CarrotGridView>
	</div>
</asp:Content>