<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="HealthCare_Portal.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 1141px;
            height: 366px;
            text-align: center;
        }
        .auto-style3 {
            width: 75%;
            height: 171px;
        }
        .auto-style4 {
            height: 28px;
        }
        .auto-style5 {
            height: 22px;
        }
        .auto-style6 {
            text-align: left;
        }
        .auto-style8 {
            height: 28px;
            text-align: justify;
            width: 283px;
        }
        .auto-style9 {
            height: 22px;
            text-align: justify;
            width: 283px;
        }
        .auto-style10 {
            text-align: left;
            width: 265px;
        }
        .auto-style11 {
            height: 28px;
            text-align: left;
            width: 265px;
        }
        .auto-style12 {
            height: 22px;
            text-align: left;
            width: 265px;
        }
        .auto-style13 {
            height: 25px;
            text-align: justify;
            width: 283px;
        }
        .auto-style14 {
            height: 25px;
            text-align: left;
            width: 265px;
        }
        .auto-style15 {
            height: 25px;
        }
        .auto-style16 {
            text-align: justify;
            width: 283px;
        }
        .auto-style17 {
            text-align: justify;
            width: 283px;
            height: 29px;
        }
        .auto-style18 {
            text-align: left;
            height: 29px;
            width: 265px;
        }
        .auto-style19 {
            height: 29px;
        }
        .auto-style20 {
            height: 27px;
            text-align: justify;
            width: 283px;
        }
        .auto-style21 {
            height: 27px;
            text-align: left;
            width: 265px;
        }
        .auto-style22 {
            height: 27px;
        }
    </style>
</head>
<body>
    <p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; REGISTER<br />
    </p>
    <form id="form1" runat="server">
    <div class="auto-style1">
    
        <table class="auto-style3" style="margin: 0 auto;">
            <tr>
                <td class="auto-style16">
                    <asp:Label ID="Label1" runat="server" Text="First Name:"></asp:Label>
                </td>
                <td class="auto-style10">
                    <asp:TextBox ID="TxtFirstName" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="First Name Required" ControlToValidate="TxtFirstName"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style16">
                    <asp:Label ID="Label2" runat="server" Text="Last Name"></asp:Label>
                </td>
                <td class="auto-style10">
                    <asp:TextBox ID="TxtLastName" runat="server" ></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Last Name Required" ControlToValidate="TxtLastName"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style20">
                    <asp:Label ID="Label3" runat="server" Text="Email Id"></asp:Label>
                    :</td>
                <td class="auto-style21">
                    <asp:TextBox ID="TxtEmailId" runat="server"  TextMode="Email"></asp:TextBox>
                </td>
                <td class="auto-style22">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Emaild Is Required" ControlToValidate="TxtEmailId"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter Valid Email" ControlToValidate="TxtEmailId" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style13">
                    <asp:Label ID="Label8" runat="server" Text="Password"></asp:Label>
                    :</td>
                <td class="auto-style14">
                    <asp:TextBox ID="Txtpassword" runat="server" TextMode="Password" ></asp:TextBox>
                    </td>
                <td class="auto-style15">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Password required" ControlToValidate="Txtpassword"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style13">
                    <asp:Label ID="Label9" runat="server" Text="Confirm Password"></asp:Label>
                    :</td>
                <td class="auto-style14">
                    <asp:TextBox ID="TxtConfirmPwd" runat="server" TextMode="Password" ></asp:TextBox>
                    </td>
                <td class="auto-style15">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Confirm Password" ControlToValidate="TxtConfirmPwd"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password doesn't match" ControlToCompare="Txtpassword" ControlToValidate="TxtConfirmPwd"></asp:CompareValidator>
                </td>
            </tr>
             <tr>
                <td class="auto-style13">
                    <asp:Label ID="Label4" runat="server" Text="Date Of Birth"></asp:Label>
                    :</td>
                <td class="auto-style14">
                    <asp:TextBox ID="TxtDate" runat="server" MaxLength="10" AutoPostBack="True" OnTextChanged="TxtDate_TextChanged"></asp:TextBox>
                    <asp:Label ID="Label10" runat="server" Text="MM/DD/YYYY"></asp:Label>
                 </td>
                <td class="auto-style15">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="TxtDate" ErrorMessage="Enter Date"></asp:RequiredFieldValidator>&nbsp
                    <asp:Label ID="LabelDateError" runat="server"></asp:Label>
                 </td>
            </tr>
             <tr>
                <td class="auto-style8">
                    <asp:Label ID="Label5" runat="server" Text="Contact Phone"></asp:Label>
                    :</td>
                <td class="auto-style11">
                    <asp:TextBox ID="TxtPhone" runat="server" Height="21px"  TextMode="Phone" Width="160px"></asp:TextBox>
                 </td>
                <td class="auto-style4">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Phone Number Rquired" ControlToValidate="TxtPhone"></asp:RequiredFieldValidator>
                 </td>
            </tr>
                <tr>
                <td class="auto-style9">
                    <asp:Label ID="Label7" runat="server" Text="Gender"></asp:Label>
                    :</td>
                <td class="auto-style12">
                    &nbsp;<asp:RadioButtonList ID="RadioGender" runat="server" Height="36px" Width="157px">
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                    </asp:RadioButtonList>
                    </td>
                <td class="auto-style5">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="RadioGender" ErrorMessage="Select Gender"></asp:RequiredFieldValidator>
                    </td>
            </tr>
            <tr>
                <td class="auto-style17">
                    <asp:Label ID="Label6" runat="server" Text="Insurance Provider"></asp:Label>
                </td>
                <td class="auto-style18">
                    <asp:DropDownList ID="DropDownInsurance" runat="server" Height="16px" Width="150px">
                        <asp:ListItem Text="--Please Select--" Value="-1"></asp:ListItem>
                        <asp:ListItem>Cigna</asp:ListItem>
                        <asp:ListItem>Aetna</asp:ListItem>
                        <asp:ListItem>United Health</asp:ListItem>
                        <asp:ListItem>Humana</asp:ListItem>
                        <asp:ListItem>HCSC</asp:ListItem>
                        <asp:ListItem>Wellpoint</asp:ListItem>
                        <asp:ListItem>Kaiser</asp:ListItem>
                        <asp:ListItem>Others</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style19">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="DropDownInsurance" ErrorMessage="Select Insurance Provider"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="DropDownInsurance" ErrorMessage="Select Provider" Operator="NotEqual" ValueToCompare="-1"></asp:CompareValidator>
                </td>
            </tr>
        </table>
    
        <br />
    
    </div>
        <p class="auto-style6">
    
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    
            <asp:Button ID="Register" runat="server" OnClick="Register_Click" Text="Register" />
            <asp:Button ID="Login" runat="server" OnClick="Login_Click" Text="Login" />
    
        </p>
        
        <p class="auto-style6">
            &nbsp;</p>
        
    </form>
</body>
</html>
