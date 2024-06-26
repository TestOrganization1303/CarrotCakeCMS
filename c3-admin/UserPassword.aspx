﻿<%@ Page Title="Edit Profile" Language="C#" MasterPageFile="MasterPages/MainPopup.Master" AutoEventWireup="true" CodeBehind="UserPassword.aspx.cs"
	Inherits="Carrotware.CMS.UI.Admin.c3_admin.UserPassword" %>

<%@ MasterType VirtualPath="MasterPages/MainPopup.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="H1ContentPlaceHolder" runat="server">
	User Preferences
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BodyContentPlaceHolder" runat="server">
	<p>
		&nbsp;</p>
	<fieldset style="width: 400px;">
		<legend>
			<label>
				Change Password
			</label>
		</legend>
		<asp:Panel ID="pnlChangeUserInfo" runat="server" Visible="true">
			<asp:ChangePassword runat="server" ID="changePassword" ChangePasswordButtonType="Button" DisplayUserName="false">
				<ChangePasswordTemplate>
					<div style="width: 350px">
						<p style="color: #FF0000;">
							<asp:Label ID="FailureText" runat="server" EnableViewState="False" />
						</p>
						<table style="width: 350px;">
							<tr>
								<td class="tablecontents" style="width: 125px;">
									<b class="caption">Current Password </b>
								</td>
								<td class="tablecontents">
									<asp:TextBox onkeypress="return ProcessKeyPress(event)" ValidationGroup="changePassword" Width="140px" MaxLength="100" ID="CurrentPassword" TextMode="Password"
										runat="server" />
									<asp:RequiredFieldValidator ID="CurrentPasswordRequired" runat="server" CssClass="validationError" ForeColor="" ControlToValidate="CurrentPassword"
										ErrorMessage="!" ToolTip="Current password is required." ValidationGroup="changePassword" Display="Dynamic" Text="**" />
								</td>
							</tr>
							<tr>
								<td class="tablecontents">
									<b class="caption">New Password </b>
								</td>
								<td class="tablecontents">
									<asp:TextBox onkeypress="return ProcessKeyPress(event)" ValidationGroup="changePassword" Width="140px" ID="NewPassword" runat="server" TextMode="Password" />
									<asp:RequiredFieldValidator ID="PasswordRequired" runat="server" CssClass="validationError" ForeColor="" ControlToValidate="NewPassword" ErrorMessage="!"
										ToolTip="Password is required." ValidationGroup="changePassword" Display="Dynamic" Text="**" />
								</td>
							</tr>
							<tr>
								<td class="tablecontents">
									<b class="caption">Confirm Password </b>
								</td>
								<td class="tablecontents">
									<asp:TextBox onkeypress="return ProcessKeyPress(event)" ValidationGroup="changePassword" Width="140px" ID="ConfirmNewPassword" runat="server"
										TextMode="Password" />
									<asp:RequiredFieldValidator ID="ConfirmNewPasswordRequired" runat="server" CssClass="validationError" ForeColor="" ControlToValidate="ConfirmNewPassword"
										ErrorMessage="!" ToolTip="Confirm Password is required." ValidationGroup="changePassword" Display="Dynamic" Text="**" />
									<asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="NewPassword" CssClass="validationError" ForeColor="" ControlToValidate="ConfirmNewPassword"
										Display="Dynamic" ErrorMessage="!!" ToolTip="Both new passwords must match." ValidationGroup="changePassword" />
								</td>
							</tr>
						</table>
						<p style="text-align: right; padding-right: 40px;">
							<asp:Button ID="btnChange" ValidationGroup="changePassword" runat="server" CommandName="changePassword" Text="Submit" />
						</p>
					</div>
				</ChangePasswordTemplate>
				<SuccessTemplate>
					<div class="ui-widget">
						<div class="ui-state-highlight ui-corner-all" style="padding: 0 .7em;">
							<p>
								<span class="ui-icon ui-icon-info" style="float: left; margin-right: .3em;"></span>Your Password has been changed. &nbsp;
							</p>
						</div>
					</div>
				</SuccessTemplate>
			</asp:ChangePassword>
		</asp:Panel>
	</fieldset>
</asp:Content>