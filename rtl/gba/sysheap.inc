{
    This file is part of the Free Pascal run time library.
    Copyright (c) 2005 by Free Pascal development team

    Low level memory functions

    See the file COPYING.FPC, included in this distribution,
    for details about the copyright.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

 **********************************************************************}

{*****************************************************************************
      OS Memory allocation / deallocation
 ****************************************************************************}


var
  heap_start: longint; external name '__eheap_start';

function SysOSAlloc(size: ptruint): pointer;
begin
  result := @heap_start;
end;

{ $define HAS_SYSOSFREE}

procedure SysOSFree(p: pointer; size: ptruint);
begin
end;
