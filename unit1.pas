unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Menus, ExtCtrls, Clipbrd;

type

  { TMainForm }

  TMainForm = class(TForm)
    btn_generieren: TButton;
    btn_alphanum: TButton;
    btn_loschen: TButton;
    btn_alphanum_cb: TButton;
    cb_mal: TCheckBox;
    cb_gleich: TCheckBox;
    cb_frage: TCheckBox;
    cb_kleiner: TCheckBox;
    cb_grosser: TCheckBox;
    cb_komma: TCheckBox;
    cb_doppelpkt: TCheckBox;
    cb_semikolon: TCheckBox;
    cb_pkt: TCheckBox;
    cb_unterstrich: TCheckBox;
    cb_tilde: TCheckBox;
    cb_plus: TCheckBox;
    cb_erweitert: TCheckBox;
    cb_klammer_auf: TCheckBox;
    cb_klammer_zu: TCheckBox;
    cb_strich: TCheckBox;
    cb_minus: TCheckBox;
    cb_slash: TCheckBox;
    cb_backslash: TCheckBox;
    cb_raute: TCheckBox;
    cb_ausrufe: TCheckBox;
    cb_dollar: TCheckBox;
    cb_prozent: TCheckBox;
    cb_at: TCheckBox;
    ed_lange: TEdit;
    ed_anzahl: TEdit;
    lsb__auswahl: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lsb_allePW: TListBox;
    MenuItemCopyFromAllPasswords: TMenuItem;
    PopupMenuAllPasswords: TPopupMenu;
    procedure btn_generierenClick(Sender: TObject);
    procedure btn_alphanumClick(Sender: TObject);
    procedure btn_loschenClick(Sender: TObject);
    procedure btn_alphanum_cbClick(Sender: TObject);
    procedure cb_erweitertChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lsb_allePWClick(Sender: TObject);
    procedure lsb_allePWMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure MenuItemCopyFromAllPasswordsClick(Sender: TObject);
    procedure proc_generieren(l:byte);
    procedure proc_alphanum(l:byte);
    procedure check(l:byte);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.lfm}
{ TMainForm }

procedure TMainForm.proc_generieren(l:byte);
 var i, a:byte;
   p:string;
begin
p:='';
for i:=1 to l do
  begin
       a:=random(9);
            case a of
            0..3: a:=random(61)+33;
            4..7: a:=random(30)+97;
            8: a:=95;
            end;
         p:=p+chr(a);
  end;
  lsb_allePW.items.add(p);
  lsb_allePW.ItemIndex:=lsb_allePW.Items.Count-1;

end;

procedure TMainForm.proc_alphanum(l:byte);
var a, i:byte;
  p:string;
begin
for i:=1 to l do
         begin
              a:=random(3);
              case a of
              0:a:=random(26)+97;
              1:a:=random(10)+48;
              2:a:=random(26)+65;
              end;
              p:=p+char(a);
         end;
         lsb_allePW.items.Add(p);
         lsb_allePW.ItemIndex:=lsb_allePW.Items.Count-1;

end;

procedure TMainForm.check(l:byte);
var a, b, c, i:byte;
  p:string;
  s:char;
label anfang;
begin
p:='';
for i:=1 to l do
         begin anfang:
              b:=random(2);              //alphanum. or checkbox
              case b of
              0:begin
                a:=random(23);          //checkbox
                case a of
                0:if cb_mal.checked=true then s:='*' else goto anfang;
                1:if cb_plus.checked=true then s:='+' else goto anfang;
                2:if cb_minus.checked=true then s:='-' else goto anfang;
                3:if cb_slash.checked=true then s:='/' else goto anfang;
                4:if cb_backslash.checked=true then s:='\' else goto anfang;
                5:if cb_raute.checked=true then s:='#' else goto anfang;
                6:if cb_ausrufe.checked=true then s:='!' else goto anfang;
                7:if cb_dollar.checked=true then s:='$' else goto anfang;
                8:if cb_prozent.checked=true then s:='%' else goto anfang;
                9:if cb_gleich.checked=true then s:='=' else goto anfang;
                10:if cb_frage.checked=true then s:='?' else goto anfang;
                11:if cb_kleiner.checked=true then s:='<' else goto anfang;
                12:if cb_grosser.checked=true then s:='>' else goto anfang;
                13:if cb_komma.checked=true then s:=',' else goto anfang;
                14:if cb_doppelpkt.checked=true then s:=':' else goto anfang;
                15:if cb_semikolon.checked=true then s:=';' else goto anfang;
                16:if cb_pkt.checked=true then s:='.' else goto anfang;
                17:if cb_unterstrich.checked=true then s:='_' else goto anfang;
                18:if cb_tilde.checked=true then s:='~' else goto anfang;
                19:if cb_klammer_auf.checked=true then s:='(' else goto anfang;
                20:if cb_klammer_zu.checked=true then s:=')' else goto anfang;
                21:if cb_strich.checked=true then s:='|' else goto anfang;
                22:if cb_at.checked=true then s:='@' else goto anfang;
                end;
                p:=p+s; end;

              1:begin
                a:=random(3);            //alphanum
                case a of
                0:c:=random(26)+97;
                1:c:=random(10)+48;
                2:c:=random(26)+65;
                end;
                p:=p+char(c);
                end;

              end;
         end;
         lsb_allePW.items.Add(p);
         lsb_allePW.ItemIndex:=lsb_allePW.Items.Count-1;
end;

procedure TMainForm.btn_generierenClick(Sender: TObject);
var l, z, i: byte;
begin
  l:=strtoint(ed_lange.text);
  z:=strtoint(ed_anzahl.text);
  if (l>=1) and (l<46) then
      for i:=1 to z do proc_generieren(l)
  else
      lsb_allePW.items.add('ungültig');

end;

procedure TMainForm.btn_alphanumClick(Sender: TObject);
var l, z, i: byte;
begin
l:=strtoint(ed_lange.text);
z:=strtoint(ed_anzahl.text);
  if (l>=1) and (l<46) then
     for i:=1 to z do proc_alphanum(l)
  else
      lsb_allePW.items.add('ungültig');

end;


procedure TMainForm.btn_loschenClick(Sender: TObject);
begin
  lsb_allePW.clear;
end;

procedure TMainForm.btn_alphanum_cbClick(Sender: TObject);
var l, z, i: byte;
begin
l:=strtoint(ed_lange.text);
z:=strtoint(ed_anzahl.text);
if (l>=1) and (l<46) then
   for i:=1 to z do check(l)
  else
      lsb_allePW.Items.add('ungültig');

end;

procedure TMainForm.cb_erweitertChange(Sender: TObject);
begin
if cb_erweitert.checked = true then
  begin
  MainForm.height:=445;
  btn_alphanum_cb.visible:=true;
  end
  else
      begin
      MainForm.height:=295;
      btn_alphanum_cb.visible:=false;
      end;

end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  randomize;
  MainForm.height:=295;
  btn_alphanum_cb.visible:=false;
end;

procedure TMainForm.lsb_allePWClick(Sender: TObject);
begin
  if lsb_allePW.ItemIndex >= 0 then
     lsb__auswahl.text:=lsb_allePW.Items[lsb_allePW.ItemIndex];
end;

procedure TMainForm.lsb_allePWMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  APoint: TPoint;
begin
   if Button = mbRight then  begin
    APoint.X := X;
    APoint.Y := Y;
    lsb_allePW.ItemIndex := lsb_allePW.ItemAtPos(APoint, True);
  end;
end;

procedure TMainForm.MenuItemCopyFromAllPasswordsClick(Sender: TObject);
begin
   if lsb_allePW.ItemIndex > 0 then
     Clipboard.AsText:=lsb_allePW.Items[lsb_allePW.ItemIndex];
end;

end.

