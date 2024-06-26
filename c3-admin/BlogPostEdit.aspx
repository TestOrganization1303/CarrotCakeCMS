﻿<%@ Page Title="Edit Post Info" Language="C#" MasterPageFile="MasterPages/MainPopup.Master" AutoEventWireup="true" CodeBehind="BlogPostEdit.aspx.cs"
	Inherits="Carrotware.CMS.UI.Admin.c3_admin.BlogPostEdit" %>

<%@ MasterType VirtualPath="MasterPages/MainPopup.Master" %>
<%@ Register Src="ucEditDateTime.ascx" TagPrefix="uc1" TagName="datetime" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" runat="server">
	<script src="Includes/FindUsers.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(document).ready(function () {
			initFindUsersMethod("<%=hdnCreditUserID.ClientID %>", "<%=txtSearchUser.ClientID %>", "FindCreditUsers");
		});
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="H1ContentPlaceHolder" runat="server">
	Edit Post Info
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BodyContentPlaceHolder" runat="server">
	<h2>
		<asp:Literal ID="litPageName" runat="server" /></h2>
	<table style="width: 700px;">
		<tr>
			<td style="width: 125px;" class="tablecaption">
				last updated:
			</td>
			<td style="width: 575px;">
				<asp:Label ID="lblUpdated" runat="server" />
			</td>
		</tr>
		<tr>
			<td class="tablecaption">
				release date:
			</td>
			<td>
				<uc1:datetime runat="server" ID="ucReleaseDate" ValidationGroup="inputForm" />
			</td>
		</tr>
		<tr>
			<td class="tablecaption">
				retire date:
			</td>
			<td>
				<uc1:datetime runat="server" ID="ucRetireDate" ValidationGroup="inputForm" />
			</td>
		</tr>
		<tr>
			<td class="tablecaption">
				titlebar:
			</td>
			<td>
				<asp:TextBox ValidationGroup="inputForm" onkeypress="return ProcessKeyPress(event)" ID="txtTitle" runat="server" Columns="60" MaxLength="200" />
				<asp:RequiredFieldValidator ValidationGroup="inputForm" CssClass="validationError" ForeColor="" ControlToValidate="txtTitle" ID="RequiredFieldValidator1"
					runat="server" ErrorMessage="Titlebar is required" ToolTip="Titlebar is required" Display="Dynamic" Text="**" />
			</td>
		</tr>
		<tr>
			<td class="tablecaption">
				navigation:
			</td>
			<td>
				<asp:TextBox ValidationGroup="inputForm" onkeypress="return ProcessKeyPress(event)" ID="txtNav" runat="server" Columns="60" MaxLength="200" />
				<asp:RequiredFieldValidator ValidationGroup="inputForm" CssClass="validationError" ForeColor="" ControlToValidate="txtNav" ID="RequiredFieldValidator4"
					runat="server" ErrorMessage="Navigation text is required" ToolTip="Navigation text is required" Display="Dynamic" Text="**" />
			</td>
		</tr>
		<tr>
			<td class="tablecaption">
				page head:
			</td>
			<td>
				<asp:TextBox ValidationGroup="inputForm" onkeypress="return ProcessKeyPress(event)" ID="txtHead" runat="server" Columns="60" MaxLength="200" />
			</td>
		</tr>
		<tr>
			<td class="tablecaption">
				thumbnail:
				<br />
			</td>
			<td>
				<asp:TextBox ValidationGroup="inputForm" onkeypress="return ProcessKeyPress(event)" ID="txtThumb" runat="server" Columns="60" MaxLength="200" />
				<input type="button" id="btnThumb" value="Browse" onclick="cmsFileBrowserOpenReturnPop('<%=txtThumb.ClientID %>');return false;" />
			</td>
		</tr>
		<tr>
			<td class="tablecaption">
				&nbsp;
			</td>
			<td>
				<asp:CheckBox ID="chkActive" runat="server" Text="Show publicly" />
				&nbsp;&nbsp;&nbsp;
				<asp:CheckBox ID="chkHide" runat="server" Text="Hide from Search Engines" />
			</td>
		</tr>
		<tr>
			<td class="tablecaption">
				credit author:
			</td>
			<td>
				<b>find:</b> <span id="spanResults"></span>
				<br />
				<asp:TextBox ValidationGroup="inputForm" ID="txtSearchUser" onkeypress="return ProcessKeyPress(event)" Columns="60" MaxLength="100" runat="server" />
				<asp:HiddenField ID="hdnCreditUserID" runat="server" />
			</td>
		</tr>
		<tr>
			<td class="tablecaption">
				meta keywords:
			</td>
			<td>
				<asp:TextBox ValidationGroup="inputForm" ID="txtKey" MaxLength="1000" Columns="60" Style="width: 425px;" Rows="4" TextMode="MultiLine" runat="server" />
			</td>
		</tr>
		<tr>
			<td class="tablecaption">
				meta description:
			</td>
			<td>
				<asp:TextBox ValidationGroup="inputForm" ID="txtDescription" MaxLength="1000" Columns="60" Style="width: 425px;" Rows="4" TextMode="MultiLine"
					runat="server" />
			</td>
		</tr>
	</table>
	<table style="width: 700px; min-height: 75px;">
		<tr>
			<td>
				<div class="ui-widget ui-widget-content ui-corner-all clear">
					<div class="picker-area ui-widget-header ui-state-default ui-corner-top">
						categories
					</div>
					<div class="picker-area ui-widget-content ui-corner-bottom">
						<div>
							<asp:ListBox ID="listCats" DataValueField="ContentMetaInfoID" DataTextField="MetaInfoText" runat="server" SelectionMode="Multiple" CssClass="chosen-select"
								size="2" data-placeholder="select categories" />
						</div>
					</div>
				</div>
				<div class="clear">
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="ui-widget ui-widget-content ui-corner-all clear">
					<div class="picker-area ui-widget-header ui-state-default ui-corner-top">
						tags
					</div>
					<div class="picker-area ui-widget-content ui-corner-bottom">
						<div>
							<asp:ListBox ID="listTags" DataValueField="ContentMetaInfoID" DataTextField="MetaInfoText" runat="server" SelectionMode="Multiple" CssClass="chosen-select"
								size="2" data-placeholder="select tags" />
						</div>
					</div>
				</div>
				<div class="clear">
				</div>
			</td>
		</tr>
	</table>
	<div style="display: none;">
		<asp:ValidationSummary ID="formValidationSummary" runat="server" ShowSummary="true" ValidationGroup="inputForm" />
	</div>
	<asp:Button ValidationGroup="inputForm" ID="btnSaveButton" runat="server" OnClientClick="SubmitPage()" Text="Apply" />
	<br />
	<div style="display: none;">
		<asp:Button ValidationGroup="inputForm" ID="btnSave" runat="server" OnClick="btnSave_Click" Text="Apply" />
	</div>
	<script type="text/javascript">
		$(document).ready(function () {
			$(".chosen-select").chosen({ width: "695px" });
		});

		function SubmitPage() {
			cmsIsPageValid();
			setTimeout("ClickSaveBtn();", 800);
		}

		function ClickSaveBtn() {
			if (cmsIsPageValid()) {
				$('#<%=btnSave.ClientID %>').click();
			}
			cmsLoadPrettyValidationPopup('<%= formValidationSummary.ClientID %>');
			return true;
		}
	</script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="NoAjaxContentPlaceHolder" runat="server">
</asp:Content>