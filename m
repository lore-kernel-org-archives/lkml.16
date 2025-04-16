Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FBF2248869;
	Wed, 16 Apr 2025 21:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744838353; cv=none; b=VdN2iqEjvrzarZeRcuhgqBvvLZ175ClNrEipAesMccI5n7luGkH2094VBhcLnJJKbVpFOY8wC4o5FoavlAqB/SnaB12h7+h5bZ927vaEOSCf13sb6wWJsJJXcmS8dFO0G/twXFm4sZfwH4KqVn4r1atMmJY+XdLIX2s2qVtgBMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744838353; c=relaxed/simple;
	bh=3qadftVF/Li+zncjLraF49/uTB5f0oUgG12USWCDhUA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PLTZtPJ0TNsOHJNGEryEDPAP4YbnAC0KhBCgnW3VGxV1K0lwGVJllL1cseDTIw0MK6tKNic6Xw9IRhd/7zC0OIoJaMgUaT364HnqhRsGE7hOHdosSp7mchmYQk+1ZnBolTTSQiFRVyQKGty+unaeobsClbX+xJ6zUW5wnF21R00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=pMlqbXba; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="pMlqbXba"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1744838336; x=1745443136; i=w_armin@gmx.de;
	bh=5JHOPZVM1j3itVse0FaRAOBGQeUq6k0CVWEb3KRTc1U=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=pMlqbXba0GQG2iDpSRThJudc/Wi0tYYSUsugCxZg0BO6c4kQE7L/Fnu9M6702sif
	 /+jceSxs56pj3KDY4QOnd8d+/vc9IMHDZBReC9TaVSYXiGLYarRvNkU6XO/piRRuK
	 a12njVs/gGxJHRE9wyq7/85H4QR7hQbSW7WibglEUp6y4sxqWZ+XIDQqAu1F+aeEd
	 oq85x30Uzx4yBUo01tJpR9cy9rqLzAk1DbkIsPKIDjEwhEA1CH7kg/4aDkx4qw09U
	 ppOtuw0O3N3YLs0mxXUCq5pMDnyI1i5+8yynp9dNIshc9dkGPE2lcdE/HwRnPemeM
	 dt97w9gEHG3po5FNEg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N7R1T-1vCwcM3Xy9-00sIb2; Wed, 16
 Apr 2025 23:18:56 +0200
Message-ID: <f621c8c2-40f9-41bc-904d-ee8a5fd9fa27@gmx.de>
Date: Wed, 16 Apr 2025 23:18:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/6] platform/x86: Add lenovo-wmi-* driver
 Documentation
To: "Derek J. Clark" <derekjohn.clark@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Mario Limonciello <superm1@kernel.org>,
 Luke Jones <luke@ljones.dev>, Xino Ni <nijs1@lenovo.com>,
 Zhixin Zhang <zhangzx36@lenovo.com>, Mia Shao <shaohz1@lenovo.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
 "Cody T . -H . Chiu" <codyit@gmail.com>, John Martens <johnfanv2@gmail.com>,
 platform-driver-x86@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mario Limonciello <mario.limonciello@amd.com>
References: <20250408012815.1032357-1-derekjohn.clark@gmail.com>
 <20250408012815.1032357-2-derekjohn.clark@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20250408012815.1032357-2-derekjohn.clark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:zCtstLzdS3vXfeAy+dIsMSLrles9HDQd/XKjrM0jNQXJTW66Jgx
 +BQUkzNsy5zHHT+Fm/xcWIMrqLj4bDFBCnDFEWy+/xpGb4LIcpel7hoL0PbeP9QHWtn4JOs
 zCFUObg4uuSHwYno1jrIhLQBbwN++cp8fWqFxOehA0hxEcvomRmlCNV/UFw6T83Mvh/Ahwt
 mv54xXhjkv+CgHKPGY8dg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:4CSM+oNZwrw=;6WzG1plbBAKIpg7XiWPCB2kJGRC
 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
 dBbKuw9wCdoNc=

Am 08.04.25 um 03:28 schrieb Derek J. Clark:

> Adds documentation for new lenovo-wmi drivers.
>
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> ---
> v5:
>   - Fix extra spaces in lenovo-wmi-gamezone.rst.
>   - Fix monospace for GUID's.
> v4:
>   - Fixed MOF formatting issues.
>   - Fixed spelling mistakes.
>   - Updated description of balanced-performance profile for Gamezone.
>   - Updated description of thermal mode event GUID for Gamezone.
> v3:
> - Split documentation into multiple files, one for each parent
>    driver for the Gamezone and Other Mode WMI interfaces.
> - Add MOF data for all parent and child interfaces.
> - Remove lenovo-wmi-camera.c driver from v2 documentation.
> v2:
> - Update description of Custom Profile to include the need to manually
>    set it.
> - Remove all references to Legion hardware.
> - Add section for lenovo-wmi-camera.c driver as it follows the same
>    naming convention.
> ---
>   .../wmi/devices/lenovo-wmi-gamezone.rst       | 202 ++++++++++++++++++
>   .../wmi/devices/lenovo-wmi-other-method.rst   | 108 ++++++++++
>   MAINTAINERS                                   |   7 +
>   3 files changed, 317 insertions(+)
>   create mode 100644 Documentation/wmi/devices/lenovo-wmi-gamezone.rst
>   create mode 100644 Documentation/wmi/devices/lenovo-wmi-other-method.r=
st
>
> diff --git a/Documentation/wmi/devices/lenovo-wmi-gamezone.rst b/Documen=
tation/wmi/devices/lenovo-wmi-gamezone.rst
> new file mode 100644
> index 000000000000..ec4130c4d490
> --- /dev/null
> +++ b/Documentation/wmi/devices/lenovo-wmi-gamezone.rst
> @@ -0,0 +1,202 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Lenovo WMI Interface Gamezone Driver (lenovo-wmi-gamezone)
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Introduction
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +The Lenovo WMI gamezone interface is broken up into multiple GUIDs,
> +The priamry "Gamezone" GUID provides advanced features such as fan

priamry -> primary

> +profiles and overclocking. It is paired with multiple event GUIDs
> +and data block GUIDs that provide context for the various methods.
> +
> +Gamezone Data
> +-------------
> +
> +WMI GUID ``887B54E3-DDDC-4B2C-8B88-68A26A8835D0``
> +
> +The Gamezone Data WMI interface provides platform-profile and fan curve
> +settings for devices that fall under the "Gaming Series" of Lenovo devi=
ces.
> +It uses a notifier chain to inform other Lenovo WMI interface drivers o=
f the
> +current platform profile when it changes.
> +
> +The following platform profiles are supported:
> + - low-power
> + - balanced
> + - balanced-performance*

What does this star mean?

Apart from those minor issues and the sphinx warning pointed out by Bagas =
this
patch seems to be in good shape. If you fixed those issues you may add:

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

> + - performance
> + - custom
> +
> +Balanced-Performance
> +~~~~~~~~~~~~~~~~~~~~
> +Some newer Lenovo "Gaming Series" laptops have an "Extreme Mode" profil=
e
> +enabled in their BIOS. For these devices, the performance platform prof=
ile
> +will correspond to the BIOS Extreme Mode, while the balanced-performanc=
e
> +platform profile will correspond to the BIOS Performance mode. For lega=
cy
> +devices, the performance platform profile will correspond with the BIOS
> +Performance mode. For some newer devices the "Extreme Mode" profile is
> +incomplete in the BIOS and setting it will cause undefined behavior. A
> +BIOS bug quirk table is provided to ensure these devices cannot set
> +"Extreme Mode" from the driver.
> +
> +Custom Profile
> +~~~~~~~~~~~~~~
> +The custom profile represents a hardware mode on Lenovo devices that en=
ables
> +user modifications to Package Power Tracking (PPT) and fan curve settin=
gs.
> +When an attribute exposed by the Other Mode WMI interface is to be modi=
fied,
> +the Gamezone driver must first be switched to the "custom" profile manu=
ally,
> +or the setting will have no effect. If another profile is set from the =
list
> +of supported profiles, the BIOS will override any user PPT settings whe=
n
> +switching to that profile.
> +
> +Gamezone Thermal Mode Event
> +---------------------------
> +
> +WMI GUID ``D320289E-8FEA-41E0-86F9-911D83151B5F``
> +
> +The Gamezone Thermal Mode Event interface notifies the system when the =
platform
> +profile has changed, either through the hardware event (Fn+Q for laptop=
s or
> +Legion + Y for Go Series), or through the Gamezone WMI interface. This =
event is
> +implemented in the Lenovo WMI Events driver (lenovo-wmi-events).
> +
> +
> +WMI interface description
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> +
> +The WMI interface description can be decoded from the embedded binary M=
OF (bmof)
> +data using the `bmfdec <https://github.com/pali/bmfdec>`_ utility:
> +
> +::
> +
> +  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description(=
"LENOVO_GAMEZONE_DATA class"), guid("{887B54E3-DDDC-4B2C-8B88-68A26A8835D0=
}")]
> +  class LENOVO_GAMEZONE_DATA {
> +    [key, read] string InstanceName;
> +    [read] boolean Active;
> +
> +    [WmiMethodId(4), Implemented, Description("Is SupportGpu OverClock"=
)] void IsSupportGpuOC([out, Description("Is SupportGpu OverClock")] uint3=
2 Data);
> +    [WmiMethodId(11), Implemented, Description("Get AslCode Version")] =
void GetVersion ([out, Description("AslCode version")] UINT32 Data);
> +    [WmiMethodId(12), Implemented, Description("Fan cooling capability"=
)] void IsSupportFanCooling([out, Description("Fan cooling capability")] U=
INT32 Data);
> +    [WmiMethodId(13), Implemented, Description("Set Fan cooling on/off"=
)] void SetFanCooling ([in, Description("Set Fan cooling on/off")] UINT32 =
Data);
> +    [WmiMethodId(14), Implemented, Description("cpu oc capability")] vo=
id IsSupportCpuOC ([out, Description("cpu oc capability")] UINT32 Data);
> +    [WmiMethodId(15), Implemented, Description("bios has overclock capa=
bility")] void IsBIOSSupportOC ([out, Description("bios has overclock capa=
bility")] UINT32 Data);
> +    [WmiMethodId(16), Implemented, Description("enable or disable overc=
lock in bios")] void SetBIOSOC ([in, Description("enable or disable overcl=
ock in bios")] UINT32 Data);
> +    [WmiMethodId(18), Implemented, Description("Get CPU temperature")] =
void GetCPUTemp ([out, Description("Get CPU temperature")] UINT32 Data);
> +    [WmiMethodId(19), Implemented, Description("Get GPU temperature")] =
void GetGPUTemp ([out, Description("Get GPU temperature")] UINT32 Data);
> +    [WmiMethodId(20), Implemented, Description("Get Fan cooling on/off =
status")] void GetFanCoolingStatus ([out, Description("Get Fan cooling on/=
off status")] UINT32 Data);
> +    [WmiMethodId(21), Implemented, Description("EC support disable wind=
ows key capability")] void IsSupportDisableWinKey ([out, Description("EC s=
upport disable windows key capability")] UINT32 Data);
> +    [WmiMethodId(22), Implemented, Description("Set windows key disable=
/enable")] void SetWinKeyStatus ([in, Description("Set windows key disable=
/enable")] UINT32 Data);
> +    [WmiMethodId(23), Implemented, Description("Get windows key disable=
/enable status")] void GetWinKeyStatus ([out, Description("Get windows key=
 disable/enable status")] UINT32 Data);
> +    [WmiMethodId(24), Implemented, Description("EC support disable touc=
hpad capability")] void IsSupportDisableTP ([out, Description("EC support =
disable touchpad capability")] UINT32 Data);
> +    [WmiMethodId(25), Implemented, Description("Set touchpad disable/en=
able")] void SetTPStatus ([in, Description("Set touchpad disable/enable")]=
 UINT32 Data);
> +    [WmiMethodId(26), Implemented, Description("Get touchpad disable/en=
able status")] void GetTPStatus ([out, Description("Get touchpad disable/e=
nable status")] UINT32 Data);
> +    [WmiMethodId(30), Implemented, Description("Get Keyboard feature li=
st")] void GetKeyboardfeaturelist ([out, Description("Get Keyboard feature=
 list")] UINT32 Data);
> +    [WmiMethodId(31), Implemented, Description("Get Memory OC Informati=
on")] void GetMemoryOCInfo ([out, Description("Get Memory OC Information")=
] UINT32 Data);
> +    [WmiMethodId(32), Implemented, Description("Water Cooling feature c=
apability")] void IsSupportWaterCooling ([out, Description("Water Cooling =
feature capability")] UINT32 Data);
> +    [WmiMethodId(33), Implemented, Description("Set Water Cooling statu=
s")] void SetWaterCoolingStatus ([in, Description("Set Water Cooling statu=
s")] UINT32 Data);
> +    [WmiMethodId(34), Implemented, Description("Get Water Cooling statu=
s")] void GetWaterCoolingStatus ([out, Description("Get Water Cooling stat=
us")] UINT32 Data);
> +    [WmiMethodId(35), Implemented, Description("Lighting feature capabi=
lity")] void IsSupportLightingFeature ([out, Description("Lighting feature=
 capability")] UINT32 Data);
> +    [WmiMethodId(36), Implemented, Description("Set keyboard light off =
or on to max")] void SetKeyboardLight ([in, Description("keyboard light of=
f or on switch")] UINT32 Data);
> +    [WmiMethodId(37), Implemented, Description("Get keyboard light on/o=
ff status")] void GetKeyboardLight ([out, Description("Get keyboard light =
on/off status")] UINT32 Data);
> +    [WmiMethodId(38), Implemented, Description("Get Macrokey scan code"=
)] void GetMacrokeyScancode ([in, Description("Macrokey index")] UINT32 id=
x, [out, Description("Scan code")] UINT32 scancode);
> +    [WmiMethodId(39), Implemented, Description("Get Macrokey count")] v=
oid GetMacrokeyCount ([out, Description("Macrokey count")] UINT32 Data);
> +    [WmiMethodId(40), Implemented, Description("Support G-Sync feature"=
)] void IsSupportGSync ([out, Description("Support G-Sync feature")] UINT3=
2 Data);
> +    [WmiMethodId(41), Implemented, Description("Get G-Sync Status")] vo=
id GetGSyncStatus ([out, Description("Get G-Sync Status")] UINT32 Data);
> +    [WmiMethodId(42), Implemented, Description("Set G-Sync Status")] vo=
id SetGSyncStatus ([in, Description("Set G-Sync Status")] UINT32 Data);
> +    [WmiMethodId(43), Implemented, Description("Support Smart Fan featu=
re")] void IsSupportSmartFan ([out, Description("Support Smart Fan feature=
")] UINT32 Data);
> +    [WmiMethodId(44), Implemented, Description("Set Smart Fan Mode")] v=
oid SetSmartFanMode ([in, Description("Set Smart Fan Mode")] UINT32 Data);
> +    [WmiMethodId(45), Implemented, Description("Get Smart Fan Mode")] v=
oid GetSmartFanMode ([out, Description("Get Smart Fan Mode")] UINT32 Data)=
;
> +    [WmiMethodId(46), Implemented, Description("Get Smart Fan Setting M=
ode")] void GetSmartFanSetting ([out, Description("Get Smart Setting Mode"=
)] UINT32 Data);
> +    [WmiMethodId(47), Implemented, Description("Get Power Charge Mode")=
] void GetPowerChargeMode ([out, Description("Get Power Charge Mode")] UIN=
T32 Data);
> +    [WmiMethodId(48), Implemented, Description("Get Gaming Product Info=
")] void GetProductInfo ([out, Description("Get Gaming Product Info")] UIN=
T32 Data);
> +    [WmiMethodId(49), Implemented, Description("Over Drive feature capa=
bility")] void IsSupportOD ([out, Description("Over Drive feature capabili=
ty")] UINT32 Data);
> +    [WmiMethodId(50), Implemented, Description("Get Over Drive status")=
] void GetODStatus ([out, Description("Get Over Drive status")] UINT32 Dat=
a);
> +    [WmiMethodId(51), Implemented, Description("Set Over Drive status")=
] void SetODStatus ([in, Description("Set Over Drive status")] UINT32 Data=
);
> +    [WmiMethodId(52), Implemented, Description("Set Light Control Owner=
")] void SetLightControlOwner ([in, Description("Set Light Control Owner")=
] UINT32 Data);
> +    [WmiMethodId(53), Implemented, Description("Set DDS Control Owner")=
] void SetDDSControlOwner ([in, Description("Set DDS Control Owner")] UINT=
32 Data);
> +    [WmiMethodId(54), Implemented, Description("Get the flag of restore=
 OC value")] void IsRestoreOCValue ([in, Description("Clean this flag")] U=
INT32 idx, [out, Description("Restore oc value flag")] UINT32 Data);
> +    [WmiMethodId(55), Implemented, Description("Get Real Thremal Mode")=
] void GetThermalMode ([out, Description("Real Thremal Mode")] UINT32 Data=
);
> +    [WmiMethodId(56), Implemented, Description("Get the OC switch statu=
s in BIOS")] void GetBIOSOCMode ([out, Description("OC Mode")] UINT32 Data=
);
> +    [WmiMethodId(59), Implemented, Description("Get hardware info suppo=
rt version")] void GetHardwareInfoSupportVersion ([out, Description("versi=
on")] UINT32 Data);
> +    [WmiMethodId(60), Implemented, Description("Get Cpu core 0 max freq=
uency")] void GetCpuFrequency ([out, Description("frequency")] UINT32 Data=
);
> +    [WmiMethodId(62), Implemented, Description("Check the Adapter type =
fit for OC")] void IsACFitForOC ([out, Description("AC check result")] UIN=
T32 Data);
> +    [WmiMethodId(63), Implemented, Description("Is support IGPU mode")]=
 void IsSupportIGPUMode ([out, Description("IGPU modes")] UINT32 Data);
> +    [WmiMethodId(64), Implemented, Description("Get IGPU Mode Status")]=
 void GetIGPUModeStatus([out, Description("IGPU Mode Status")] UINT32 Data=
);
> +    [WmiMethodId(65), Implemented, Description("Set IGPU Mode")] void S=
etIGPUModeStatus([in, Description("IGPU Mode")] UINT32 mode, [out, Descrip=
tion("return code")] UINT32 Data);
> +    [WmiMethodId(66), Implemented, Description("Notify DGPU Status")] v=
oid NotifyDGPUStatus([in, Description("DGPU status")] UINT32 status, [out,=
 Description("return code")] UINT32 Data);
> +    [WmiMethodId(67), Implemented, Description("Is changed Y log")] voi=
d IsChangedYLog([out, Description("Is changed Y Log")] UINT32 Data);
> +    [WmiMethodId(68), Implemented, Description("Get DGPU Hardwawre ID")=
] void GetDGPUHWId([out, Description("Get DGPU Hardware ID")] string Data)=
;
> +  };
> +
> +  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description(=
"Definition of CPU OC parameter list"), guid("{B7F3CA0A-ACDC-42D2-9217-77C=
6C628FBD2}")]
> +  class LENOVO_GAMEZONE_CPU_OC_DATA {
> +    [key, read] string InstanceName;
> +    [read] boolean Active;
> +
> +    [WmiDataId(1), read, Description("OC tune id.")] uint32 Tuneid;
> +    [WmiDataId(2), read, Description("Default value.")] uint32 DefaultV=
alue;
> +    [WmiDataId(3), read, Description("OC Value.")] uint32 OCValue;
> +    [WmiDataId(4), read, Description("Min Value.")] uint32 MinValue;
> +    [WmiDataId(5), read, Description("Max Value.")] uint32 MaxValue;
> +    [WmiDataId(6), read, Description("Scale Value.")] uint32 ScaleValue=
;
> +    [WmiDataId(7), read, Description("OC Order id.")] uint32 OCOrderid;
> +    [WmiDataId(8), read, Description("NON-OC Order id.")] uint32 NOCOrd=
erid;
> +    [WmiDataId(9), read, Description("Delay time in ms.")] uint32 Inter=
val;
> +  };
> +
> +  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description(=
"Definition of GPU OC parameter list"), guid("{887B54E2-DDDC-4B2C-8B88-68A=
26A8835D0}")]
> +  class LENOVO_GAMEZONE_GPU_OC_DATA {
> +    [key, read] string InstanceName;
> +    [read] boolean Active;
> +
> +    [WmiDataId(1), read, Description("P-State ID.")] uint32 PStateID;
> +    [WmiDataId(2), read, Description("CLOCK ID.")] uint32 ClockID;
> +    [WmiDataId(3), read, Description("Default value.")] uint32 defaultv=
alue;
> +    [WmiDataId(4), read, Description("OC Offset freqency.")] uint32 OCO=
ffsetFreq;
> +    [WmiDataId(5), read, Description("OC Min offset value.")] uint32 OC=
MinOffset;
> +    [WmiDataId(6), read, Description("OC Max offset value.")] uint32 OC=
MaxOffset;
> +    [WmiDataId(7), read, Description("OC Offset Scale.")] uint32 OCOffs=
etScale;
> +    [WmiDataId(8), read, Description("OC Order id.")] uint32 OCOrderid;
> +    [WmiDataId(9), read, Description("NON-OC Order id.")] uint32 NOCOrd=
erid;
> +  };
> +
> +  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description(=
"Fancooling finish event"), guid("{BC72A435-E8C1-4275-B3E2-D8B8074ABA59}")=
]
> +  class LENOVO_GAMEZONE_FAN_COOLING_EVENT: WMIEvent {
> +    [key, read] string InstanceName;
> +    [read] boolean Active;
> +
> +    [WmiDataId(1), read, Description("Fancooling clean finish event")] =
uint32 EventId;
> +  };
> +
> +  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description(=
"Smart Fan mode change event"), guid("{D320289E-8FEA-41E0-86F9-611D83151B5=
F}")]
> +  class LENOVO_GAMEZONE_SMART_FAN_MODE_EVENT: WMIEvent {
> +    [key, read] string InstanceName;
> +    [read] boolean Active;
> +
> +    [WmiDataId(1), read, Description("Smart Fan Mode change event")] ui=
nt32 mode;
> +    [WmiDataId(2), read, Description("version of FN+Q")] uint32 version=
;
> +  };
> +
> +  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description(=
"Smart Fan setting mode change event"), guid("{D320289E-8FEA-41E1-86F9-611=
D83151B5F}")]
> +  class LENOVO_GAMEZONE_SMART_FAN_SETTING_EVENT: WMIEvent {
> +    [key, read] string InstanceName;
> +    [read] boolean Active;
> +
> +    [WmiDataId(1), read, Description("Smart Fan Setting mode change eve=
nt")] uint32 mode;
> +  };
> +
> +  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description(=
"POWER CHARGE MODE Change EVENT"), guid("{D320289E-8FEA-41E0-86F9-711D8315=
1B5F}")]
> +  class LENOVO_GAMEZONE_POWER_CHARGE_MODE_EVENT: WMIEvent {
> +    [key, read] string InstanceName;
> +    [read] boolean Active;
> +
> +    [WmiDataId(1), read, Description("POWER CHARGE MODE Change EVENT")]=
 uint32 mode;
> +  };
> +
> +  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description(=
"Thermal Mode Real Mode change event"), guid("{D320289E-8FEA-41E0-86F9-911=
D83151B5F}")]
> +  class LENOVO_GAMEZONE_THERMAL_MODE_EVENT: WMIEvent {
> +    [key, read] string InstanceName;
> +    [read] boolean Active;
> +
> +    [WmiDataId(1), read, Description("Thermal Mode Real Mode")] uint32 =
mode;
> +  };
> diff --git a/Documentation/wmi/devices/lenovo-wmi-other-method.rst b/Doc=
umentation/wmi/devices/lenovo-wmi-other-method.rst
> new file mode 100644
> index 000000000000..d7928b8dfb4b
> --- /dev/null
> +++ b/Documentation/wmi/devices/lenovo-wmi-other-method.rst
> @@ -0,0 +1,108 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Lenovo WMI Interface Other Mode Driver (lenovo-wmi-other)
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Introduction
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Lenovo WMI Other Mode interface is broken up into multiple GUIDs,
> +The primary Other Mode interface provides advanced power tuning feature=
s
> +such as Package Power Tracking (PPT). It is paired with multiple data b=
lock
> +GUIDs that provide context for the various methods.
> +
> +
> +Other Mode
> +----------
> +
> +WMI GUID ``DC2A8805-3A8C-41BA-A6F7-092E0089CD3B``
> +
> +The Other Mode WMI interface uses the firmware_attributes class to expo=
se
> +various WMI attributes provided by the interface in the sysfs. This ena=
bles
> +CPU and GPU power limit tuning as well as various other attributes for
> +devices that fall under the "Gaming Series" of Lenovo devices. Each
> +attribute exposed by the Other Mode interface has corresponding
> +capability data blocks which allow the driver to probe details about th=
e
> +attribute. Each attribute has multiple pages, one for each of the platf=
orm
> +profiles managed by the Gamezone interface. Attributes are exposed in s=
ysfs
> +under the following path:
> +
> +::
> +
> +  /sys/class/firmware-attributes/lenovo-wmi-other/attributes/<attribute=
>/
> +
> +LENOVO_CAPABILITY_DATA_01
> +-------------------------
> +
> +WMI GUID ``7A8F5407-CB67-4D6E-B547-39B3BE018154``
> +
> +The LENOVO_CAPABILITY_DATA_01 interface provides information on various
> +power limits of integrated CPU and GPU components.
> +
> +Each attribute has the following properties:
> + - current_value
> + - default_value
> + - display_name
> + - max_value
> + - min_value
> + - scalar_increment
> + - type
> +
> +The following attributes are implemented:
> + - ppt_pl1_spl: Platform Profile Tracking Sustained Power Limit
> + - ppt_pl2_sppt: Platform Profile Tracking Slow Package Power Tracking
> + - ppt_pl3_fppt: Platform Profile Tracking Fast Package Power Tracking
> +
> +
> +WMI interface description
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> +
> +The WMI interface description can be decoded from the embedded binary M=
OF (bmof)
> +data using the `bmfdec <https://github.com/pali/bmfdec>`_ utility:
> +
> +::
> +
> +  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description(=
"LENOVO_OTHER_METHOD class"), guid("{dc2a8805-3a8c-41ba-a6f7-092e0089cd3b}=
")]
> +  class LENOVO_OTHER_METHOD {
> +    [key, read] string InstanceName;
> +    [read] boolean Active;
> +
> +    [WmiMethodId(17), Implemented, Description("Get Feature Value ")] v=
oid GetFeatureValue([in] uint32 IDs, [out] uint32 value);
> +    [WmiMethodId(18), Implemented, Description("Set Feature Value ")] v=
oid SetFeatureValue([in] uint32 IDs, [in] uint32 value);
> +    [WmiMethodId(19), Implemented, Description("Get Data By Command ")]=
 void GetDataByCommand([in] uint32 IDs, [in] uint32 Command, [out] uint32 =
DataSize, [out, WmiSizeIs("DataSize")] uint32 Data[]);
> +    [WmiMethodId(99), Implemented, Description("Get Data By Package for=
 TAC")] void GetDataByPackage([in, Max(40)] uint8 Input[], [out] uint32 Da=
taSize, [out, WmiSizeIs("DataSize")] uint8 Data[]);
> +  };
> +
> +  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description(=
"LENOVO CAPABILITY DATA 00"), guid("{362a3afe-3d96-4665-8530-96dad5bb300e}=
")]
> +  class LENOVO_CAPABILITY_DATA_00 {
> +    [key, read] string InstanceName;
> +    [read] boolean Active;
> +
> +    [WmiDataId(1), read, Description(" IDs.")] uint32 IDs;
> +    [WmiDataId(2), read, Description("Capability.")] uint32 Capability;
> +    [WmiDataId(3), read, Description("Capability Default Value.")] uint=
32 DefaultValue;
> +  };
> +
> +  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description(=
"LENOVO CAPABILITY DATA 01"), guid("{7a8f5407-cb67-4d6e-b547-39b3be018154}=
")]
> +  class LENOVO_CAPABILITY_DATA_01 {
> +    [key, read] string InstanceName;
> +    [read] boolean Active;
> +
> +    [WmiDataId(1), read, Description(" IDs.")] uint32 IDs;
> +    [WmiDataId(2), read, Description("Capability.")] uint32 Capability;
> +    [WmiDataId(3), read, Description("Default Value.")] uint32 DefaultV=
alue;
> +    [WmiDataId(4), read, Description("Step.")] uint32 Step;
> +    [WmiDataId(5), read, Description("Minimum Value.")] uint32 MinValue=
;
> +    [WmiDataId(6), read, Description("Maximum Value.")] uint32 MaxValue=
;
> +  };
> +
> +  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description(=
"LENOVO CAPABILITY DATA 02"), guid("{bbf1f790-6c2f-422b-bc8c-4e7369c7f6ab}=
")]
> +  class LENOVO_CAPABILITY_DATA_02 {
> +    [key, read] string InstanceName;
> +    [read] boolean Active;
> +
> +    [WmiDataId(1), read, Description(" IDs.")] uint32 IDs;
> +    [WmiDataId(2), read, Description("Capability.")] uint32 Capability;
> +    [WmiDataId(3), read, Description("Data Size.")] uint32 DataSize;
> +    [WmiDataId(4), read, Description("Default Value"), WmiSizeIs("DataS=
ize")] uint8 DefaultValue[];
> +  };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1afd30d00aec..675f4b26426d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13158,6 +13158,13 @@ S:	Maintained
>   W:	http://legousb.sourceforge.net/
>   F:	drivers/usb/misc/legousbtower.c
>  =20
> +LENOVO WMI DRIVERS
> +M:	Derek J. Clark <derekjohn.clark@gmail.com>
> +L:	platform-driver-x86@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/wmi/devices/lenovo-wmi-gamezone.rst
> +F:	Documentation/wmi/devices/lenovo-wmi-other.rst
> +
>   LENOVO WMI HOTKEY UTILITIES DRIVER
>   M:	Jackie Dong <xy-jackie@139.com>
>   L:	platform-driver-x86@vger.kernel.org
