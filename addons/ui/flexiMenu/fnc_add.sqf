﻿#include "\x\cba\addons\ui\script_component.hpp"
#include "data\common.hpp"

// _this = ["player", [DIK_LSHIFT], ["mission\weapon_menuDef.sqf", ["main"]]]
// Note: calling script may require this file for dik codes: #include "\ca\editor\Data\Scripts\dikCodes.h"

// validate params_msg = format ["Error: invalid params. %1 (%2)", _this, __FILE__];
if (isNil QUOTE(GVAR(typeMenuSources))) exitWith {diag_log _msg};
if (typeName _this != typeName []) exitWith {diag_log _msg};
if (count _this != 4) exitWith {diag_log _msg};
if (typeName (_this select _flexiMenu_typeMenuSources_ID_type) != typeName "") exitWith {diag_log _msg};
if (typeName (_this select _flexiMenu_typeMenuSources_ID_DIKCodes) != typeName []) exitWith {diag_log _msg};
if (typeName (_this select _flexiMenu_typeMenuSources_ID_priority) != typeName 2) exitWith {diag_log _msg};
if !(typeName (_this select _flexiMenu_typeMenuSources_ID_menuSource) in [typeName [], typeName ""]) exitWith {diag_log _msg};

// TODO: Consider checking for duplicate ["type", [dik_code]] entry and warn?

GVAR(typeMenuSources) = GVAR(typeMenuSources)+[_this];
[GVAR(typeMenuSources), _flexiMenu_typeMenuSources_ID_priority] call CBA_fnc_sortNestedArray;
