<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add Doctors.aspx.cs" Inherits="HealthCare_Portal.Admin.Add_Doctors" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 1196px;
            height: 279px;
        }
        .auto-style2 {
            text-align: center;
        }
        .auto-style3 {
            width: 493px;
        }
        .auto-style4 {
            width: 100%;
        }
        .auto-style5 {
            width: 493px;
            height: 31px;
        }
        .auto-style6 {
            height: 31px;
        }
        </style>
    
</head>
<body style="width: 1210px; height: 484px">
    <script type="text/javascript">
        function ValidateSpeciality(source, args)
            {
                    var chkListModules= document.getElementById ('<%= check_speciality.ClientID %>');
                     var chkListinputs = chkListModules.getElementsByTagName("input");
                        for (var i=0;i<chkListinputs .length;i++)
                               {
                                 if (chkListinputs [i].checked)
                                     {
                                          args.IsValid = true;
                                           return;
                                     }
                                }
                        args.IsValid = false;
            }
    </script>
    <h4 class="auto-style2"> &nbsp;Add Doctor</h4>
    <form id="form1" runat="server">
    <div class="auto-style1">
      <table class="auto-style4">
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Doc_Firstname" runat="server" Text="First Name"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txt_firstname" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_firstname" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Doc_Lastname" runat="server" Text="Last Name"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txt_lastname" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_lastname" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label_Practice" runat="server" Text="Practice Since"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="Dropdown_practice" runat="server">
                        <asp:ListItem Value="-1">--Please Select--</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="Dropdown_practice" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="Dropdown_practice" ErrorMessage="Select Year" Operator="NotEqual" ValueToCompare="-1"></asp:CompareValidator>
                </td>
            </tr>
          <tr>
                <td class="auto-style5">
                    <asp:Label ID="Label_Speciality" runat="server" Text="Speciality"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:CheckBoxList ID="check_speciality" runat="server" Height="63px" Width="186px">
                        <asp:ListItem>Physician</asp:ListItem>
                        <asp:ListItem>Pediatrics</asp:ListItem>
                        <asp:ListItem>Gynecology</asp:ListItem>
                        <asp:ListItem>Obstetrics</asp:ListItem>
                        <asp:ListItem>Allergy</asp:ListItem>
                    </asp:CheckBoxList>
                </td>
                <td class="auto-style6">
                    <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="Select Speciality" ClientValidationFunction="ValidateSpeciality"></asp:CustomValidator>
                </td>
            </tr>
          <tr>
              <td></td>
              <td> <asp:Button ID="btn_submit" runat="server" Text="Submit" OnClick="btn_submit_Click" /></td>
          </tr>
        </table>
    </div>
      
    </form>
</body>
</html>
