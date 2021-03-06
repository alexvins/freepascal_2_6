[6~{$ifndef ALLPACKAGES}
{$mode objfpc}{$H+}
program fpmake;

uses fpmkunit;

Const
  SqldbConnectionOSes = [beos,haiku,linux,freebsd,win32,win64,wince,darwin,iphonesim,netbsd,openbsd];
  SqliteOSes          = [beos,haiku,linux,freebsd,darwin,iphonesim,netbsd,openbsd,win32,wince];
    
Var
  T : TTarget;
  P : TPackage;
begin
  With Installer do
    begin
{$endif ALLPACKAGES}

    P:=AddPackage('fpindexer');
{$ifdef ALLPACKAGES}
    P.Directory:='fpindexer';
{$endif ALLPACKAGES}
    P.Version:='2.6.3';
    P.OSes := [beos,haiku,freebsd,darwin,solaris,netbsd,openbsd,linux,win32,win64,wince];
    P.Dependencies.Add('fcl-base');
    P.Dependencies.Add('fcl-db');
    P.Dependencies.Add('chm'); // for fastreaderhtml
    P.Dependencies.Add('sqlite');
    P.Author := 'Free Pascal development team';
    P.License := 'LGPL with modification, ';
    P.HomepageURL := 'www.freepascal.org';
    P.Email := '';
    P.Description := 'Free Pascal text indexer and search engine.';
    P.NeedLibC:= false;

    P.SourcePath.Add('src');

    T:=P.Targets.AddUnit('fpmasks.pp');
   
    T:=P.Targets.AddUnit('fpindexer.pp');
    T.Dependencies.AddUnit('fpmasks');
    T.ResourceStrings:=true;
    
    T:=P.Targets.AddUnit('memindexdb.pp');
    T.ResourceStrings:=true;
    T.Dependencies.AddUnit('fpindexer');
    
    T:=P.Targets.AddUnit('ireaderhtml.pp');
    T.Dependencies.AddUnit('fpindexer');
    
    T:=P.Targets.AddUnit('ireaderpas.pp');
    T.Dependencies.AddUnit('fpindexer');
    
    T:=P.Targets.AddUnit('ireadertxt.pp');
    T.Dependencies.AddUnit('fpindexer');

    T:=P.Targets.AddUnit('sqldbindexdb.pp',SqldbConnectionOSes);
    T.Dependencies.AddUnit('fpindexer');
    
    T:=P.Targets.AddUnit('sqliteindexdb.pp',SqliteOSes);
    T.Dependencies.AddUnit('fpindexer');
    
    T:=P.Targets.AddUnit('fbindexdb.pp',SqliteOSes);
    T.Dependencies.AddUnit('fpindexer');
    
    T:=P.Targets.AddUnit('dbindexer.pp',SqldbConnectionOSes);
    T.Dependencies.AddUnit('fpindexer');
    T.Dependencies.AddUnit('ireadertxt');
    
    
{$ifndef ALLPACKAGES}
    Run;
    end;
end.
{$endif ALLPACKAGES}
