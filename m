Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6E527F195;
	Tue,  6 May 2025 12:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746533598; cv=none; b=jBJw/mlRZTae8n6smhoEPr1wZoieP2KTbIMpRixl55kkcCWBO5vhcbtXAFBKDOAXYtpqNLS0s6HJ7Ytu8qlYCbSLuZ2e90KIk+EzZN3qXxTnEBshFlKnFiqEmh7S+h4hov8SEqIdCE1wAUUpb3Gr7a+zif1HEsdO2rhCL8JVRhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746533598; c=relaxed/simple;
	bh=XwdzxfrxqJdAM3UjBNUoPhX4do+//GQaUlG/0rI954I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eCygLvipzFin+Mw3f+PXLmVAgqJ66TQ9pCGMvcTtzOqAhTIJF9CKHLG1ghcOLaIrM0cQ+u4O8nnab8anCAti0G37Nwo2yWV1seRiHtnNj4GV/I1fyBnOiSwSYiNu1cnAaVJrsd0wT1pS+7cLY/sgDZwqVrNmOBJ57a0oKanIYWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=pXmxJ/c6; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="pXmxJ/c6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1746533570; x=1747138370; i=w_armin@gmx.de;
	bh=XwdzxfrxqJdAM3UjBNUoPhX4do+//GQaUlG/0rI954I=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=pXmxJ/c60ztONqEQgHMrDSy79Ug0PxpD0uKLlKwL68gWNbPyHDHGcrVWxmSl4WIE
	 jHsYLHTeokYEMeAHL3+IPnk3B+AD1rrf2dqBH5UmFROBTrqjX7RU38N4y78FpNPcu
	 od20wDRT5FLS9Ya/vdv4l4BHR0c+iFSQ8bXSIaZ6O4dYz/qgjRHUuM0EDFvSTPMoI
	 RZw57b1rk5gNMZLBPcD6u3LxcZtvnd07ZG/zWTBFdCVTDTzgkHH4+9TNvrogQxlGR
	 HvExcY/6+O4bqS4EBaEkKIkU0w0BvsPd5PkLwqXiforug2mzAPFF9UwuwrXENKkIK
	 w4qIqjlRKAPiyY959g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [172.16.2.70] ([141.76.8.134]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M2f9b-1uBRQE48bP-0065p9; Tue, 06
 May 2025 14:12:50 +0200
Message-ID: <a566e56b-c5f5-456e-92e3-b0887b0f6b62@gmx.de>
Date: Tue, 6 May 2025 14:12:45 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/6] platform/x86: Add lenovo-wmi-* driver
 Documentation
To: ALOK TIWARI <alok.a.tiwari@oracle.com>,
 "Derek J. Clark" <derekjohn.clark@gmail.com>,
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
References: <20250505010659.1450984-1-derekjohn.clark@gmail.com>
 <20250505010659.1450984-2-derekjohn.clark@gmail.com>
 <b23a54c9-ca99-4db9-a105-c0f3c000850d@oracle.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <b23a54c9-ca99-4db9-a105-c0f3c000850d@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:TtCgc5qtQoTdjmQT95qzdYJvsjTRLM9GQtQepAdeDkU4s8Yzefm
 /qmSviBXmbFIGkW32zQpZTHk08bR6npmTSiWCN4U0XliVPQrbzjNL+CtoivkUYX6Wr9WpnE
 zZC8BtYuhlnawS3H4zy0UQkGBR3SLCPQb56xGWhw32hqcjEhV5FLaSb35V9oZwMMyTlwbSp
 5LlpTvNNnnH+ycVo2vAXA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Y2HD6xqcM0I=;kUGegtv2ArMoeLNKrt8Kgou2U+G
 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

Am 06.05.25 um 12:49 schrieb ALOK TIWARI:

>
>
> On 05-05-2025 06:36, Derek J. Clark wrote:
>> Adds documentation for new lenovo-wmi drivers.
>>
>> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
>> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
>> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
>> ---
> ...
>> +
>> +
>> +WMI interface description
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
>> +
>> +The WMI interface description can be decoded from the embedded=20
>> binary MOF (bmof)
>> +data using the `bmfdec=20
>> <https://urldefense.com/v3/__https://github.com/pali/bmfdec__;!!ACWV5N9=
M2RV99hQ!MsBEzFjDFpZkeq1j7_77aBEv31FIW_V_vPvnyFGNSL_ptLYWAYFj1UMisJvhsTGRq=
3_lh5eh5RpYWjdlZUKTA0UZ9jO_$=20
>> >`_ utility:
>> +
>> +::
>> +
>> +=C2=A0 [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"),=20
>> Description("LENOVO_GAMEZONE_DATA class"),=20
>> guid("{887B54E3-DDDC-4B2C-8B88-68A26A8835D0}")]
>> +=C2=A0 class LENOVO_GAMEZONE_DATA {
>> +=C2=A0=C2=A0=C2=A0 [key, read] string InstanceName;
>> +=C2=A0=C2=A0=C2=A0 [read] boolean Active;
>> +
>> +=C2=A0=C2=A0=C2=A0 [WmiMethodId(4), Implemented, Description("Is Suppo=
rtGpu=20
>> OverClock")] void IsSupportGpuOC([out, Description("Is SupportGpu=20
>> OverClock")] uint32 Data);
>> +=C2=A0=C2=A0=C2=A0 [WmiMethodId(11), Implemented, Description("Get Asl=
Code=20
>> Version")] void GetVersion ([out, Description("AslCode version")]=20
>> UINT32 Data);
>> +=C2=A0=C2=A0=C2=A0 [WmiMethodId(12), Implemented, Description("Fan coo=
ling=20
>> capability")] void IsSupportFanCooling([out, Description("Fan cooling=
=20
>> capability")] UINT32 Data);
>> +=C2=A0=C2=A0=C2=A0 [WmiMethodId(13), Implemented, Description("Set Fan=
 cooling=20
>> on/off")] void SetFanCooling ([in, Description("Set Fan cooling=20
>> on/off")] UINT32 Data);
>> +=C2=A0=C2=A0=C2=A0 [WmiMethodId(14), Implemented, Description("cpu oc =
capability")]=20
>> void IsSupportCpuOC ([out, Description("cpu oc capability")] UINT32=20
>> Data);
>> +=C2=A0=C2=A0=C2=A0 [WmiMethodId(15), Implemented, Description("bios ha=
s overclock=20
>> capability")] void IsBIOSSupportOC ([out, Description("bios has=20
>> overclock capability")] UINT32 Data);
>> +=C2=A0=C2=A0=C2=A0 [WmiMethodId(16), Implemented, Description("enable =
or disable=20
>> overclock in bios")] void SetBIOSOC ([in, Description("enable or=20
>> disable overclock in bios")] UINT32 Data);
>> +=C2=A0=C2=A0=C2=A0 [WmiMethodId(18), Implemented, Description("Get CPU=
=20
>> temperature")] void GetCPUTemp ([out, Description("Get CPU=20
>> temperature")] UINT32 Data);
>> +=C2=A0=C2=A0=C2=A0 [WmiMethodId(19), Implemented, Description("Get GPU=
=20
>> temperature")] void GetGPUTemp ([out, Description("Get GPU=20
>> temperature")] UINT32 Data);
>> +=C2=A0=C2=A0=C2=A0 [WmiMethodId(20), Implemented, Description("Get Fan=
 cooling=20
>> on/off status")] void GetFanCoolingStatus ([out, Description("Get Fan=
=20
>> cooling on/off status")] UINT32 Data);
>> +=C2=A0=C2=A0=C2=A0 [WmiMethodId(21), Implemented, Description("EC supp=
ort disable=20
>> windows key capability")] void IsSupportDisableWinKey ([out,=20
>> Description("EC support disable windows key capability")] UINT32 Data);
>> +=C2=A0=C2=A0=C2=A0 [WmiMethodId(22), Implemented, Description("Set win=
dows key=20
>> disable/enable")] void SetWinKeyStatus ([in, Description("Set windows=
=20
>> key disable/enable")] UINT32 Data);
>> +=C2=A0=C2=A0=C2=A0 [WmiMethodId(23), Implemented, Description("Get win=
dows key=20
>> disable/enable status")] void GetWinKeyStatus ([out, Description("Get=
=20
>> windows key disable/enable status")] UINT32 Data);
>> +=C2=A0=C2=A0=C2=A0 [WmiMethodId(24), Implemented, Description("EC supp=
ort disable=20
>> touchpad capability")] void IsSupportDisableTP ([out, Description("EC=
=20
>> support disable touchpad capability")] UINT32 Data);
>> +=C2=A0=C2=A0=C2=A0 [WmiMethodId(25), Implemented, Description("Set tou=
chpad=20
>> disable/enable")] void SetTPStatus ([in, Description("Set touchpad=20
>> disable/enable")] UINT32 Data);
>> +=C2=A0=C2=A0=C2=A0 [WmiMethodId(26), Implemented, Description("Get tou=
chpad=20
>> disable/enable status")] void GetTPStatus ([out, Description("Get=20
>> touchpad disable/enable status")] UINT32 Data);
>> +=C2=A0=C2=A0=C2=A0 [WmiMethodId(30), Implemented, Description("Get Key=
board feature=20
>> list")] void GetKeyboardfeaturelist ([out, Description("Get Keyboard=20
>> feature list")] UINT32 Data);
>> +=C2=A0=C2=A0=C2=A0 [WmiMethodId(31), Implemented, Description("Get Mem=
ory OC=20
>> Information")] void GetMemoryOCInfo ([out, Description("Get Memory OC=
=20
>> Information")] UINT32 Data);
>> +=C2=A0=C2=A0=C2=A0 [WmiMethodId(32), Implemented, Description("Water C=
ooling=20
>> feature capability")] void IsSupportWaterCooling ([out,=20
>> Description("Water Cooling feature capability")] UINT32 Data);
>> +=C2=A0=C2=A0=C2=A0 [WmiMethodId(33), Implemented, Description("Set Wat=
er Cooling=20
>> status")] void SetWaterCoolingStatus ([in, Description("Set Water=20
>> Cooling status")] UINT32 Data);
>> +=C2=A0=C2=A0=C2=A0 [WmiMethodId(34), Implemented, Description("Get Wat=
er Cooling=20
>> status")] void GetWaterCoolingStatus ([out, Description("Get Water=20
>> Cooling status")] UINT32 Data);
>> +=C2=A0=C2=A0=C2=A0 [WmiMethodId(35), Implemented, Description("Lightin=
g feature=20
>> capability")] void IsSupportLightingFeature ([out,=20
>> Description("Lighting feature capability")] UINT32 Data);
>> +=C2=A0=C2=A0=C2=A0 [WmiMethodId(36), Implemented, Description("Set key=
board light=20
>> off or on to max")] void SetKeyboardLight ([in, Description("keyboard=
=20
>> light off or on switch")] UINT32 Data);
>> +=C2=A0=C2=A0=C2=A0 [WmiMethodId(37), Implemented, Description("Get key=
board light=20
>> on/off status")] void GetKeyboardLight ([out, Description("Get=20
>> keyboard light on/off status")] UINT32 Data);
>> +=C2=A0=C2=A0=C2=A0 [WmiMethodId(38), Implemented, Description("Get Mac=
rokey scan=20
>> code")] void GetMacrokeyScancode ([in, Description("Macrokey index")]=
=20
>> UINT32 idx, [out, Description("Scan code")] UINT32 scancode);
>> +=C2=A0=C2=A0=C2=A0 [WmiMethodId(39), Implemented, Description("Get Mac=
rokey=20
>> count")] void GetMacrokeyCount ([out, Description("Macrokey count")]=20
>> UINT32 Data);
>> +=C2=A0=C2=A0=C2=A0 [WmiMethodId(40), Implemented, Description("Support=
 G-Sync=20
>> feature")] void IsSupportGSync ([out, Description("Support G-Sync=20
>> feature")] UINT32 Data);
>> +=C2=A0=C2=A0=C2=A0 [WmiMethodId(41), Implemented, Description("Get G-S=
ync Status")]=20
>> void GetGSyncStatus ([out, Description("Get G-Sync Status")] UINT32=20
>> Data);
>> +=C2=A0=C2=A0=C2=A0 [WmiMethodId(42), Implemented, Description("Set G-S=
ync Status")]=20
>> void SetGSyncStatus ([in, Description("Set G-Sync Status")] UINT32=20
>> Data);
>> +=C2=A0=C2=A0=C2=A0 [WmiMethodId(43), Implemented, Description("Support=
 Smart Fan=20
>> feature")] void IsSupportSmartFan ([out, Description("Support Smart=20
>> Fan feature")] UINT32 Data);
>> +=C2=A0=C2=A0=C2=A0 [WmiMethodId(44), Implemented, Description("Set Sma=
rt Fan=20
>> Mode")] void SetSmartFanMode ([in, Description("Set Smart Fan Mode")]=
=20
>> UINT32 Data);
>> +=C2=A0=C2=A0=C2=A0 [WmiMethodId(45), Implemented, Description("Get Sma=
rt Fan=20
>> Mode")] void GetSmartFanMode ([out, Description("Get Smart Fan=20
>> Mode")] UINT32 Data);
>> +=C2=A0=C2=A0=C2=A0 [WmiMethodId(46), Implemented, Description("Get Sma=
rt Fan=20
>> Setting Mode")] void GetSmartFanSetting ([out, Description("Get Smart=
=20
>> Setting Mode")] UINT32 Data);
>> +=C2=A0=C2=A0=C2=A0 [WmiMethodId(47), Implemented, Description("Get Pow=
er Charge=20
>> Mode")] void GetPowerChargeMode ([out, Description("Get Power Charge=20
>> Mode")] UINT32 Data);
>> +=C2=A0=C2=A0=C2=A0 [WmiMethodId(48), Implemented, Description("Get Gam=
ing Product=20
>> Info")] void GetProductInfo ([out, Description("Get Gaming Product=20
>> Info")] UINT32 Data);
>> +=C2=A0=C2=A0=C2=A0 [WmiMethodId(49), Implemented, Description("Over Dr=
ive feature=20
>> capability")] void IsSupportOD ([out, Description("Over Drive feature=
=20
>> capability")] UINT32 Data);
>> +=C2=A0=C2=A0=C2=A0 [WmiMethodId(50), Implemented, Description("Get Ove=
r Drive=20
>> status")] void GetODStatus ([out, Description("Get Over Drive=20
>> status")] UINT32 Data);
>> +=C2=A0=C2=A0=C2=A0 [WmiMethodId(51), Implemented, Description("Set Ove=
r Drive=20
>> status")] void SetODStatus ([in, Description("Set Over Drive=20
>> status")] UINT32 Data);
>> +=C2=A0=C2=A0=C2=A0 [WmiMethodId(52), Implemented, Description("Set Lig=
ht Control=20
>> Owner")] void SetLightControlOwner ([in, Description("Set Light=20
>> Control Owner")] UINT32 Data);
>> +=C2=A0=C2=A0=C2=A0 [WmiMethodId(53), Implemented, Description("Set DDS=
 Control=20
>> Owner")] void SetDDSControlOwner ([in, Description("Set DDS Control=20
>> Owner")] UINT32 Data);
>> +=C2=A0=C2=A0=C2=A0 [WmiMethodId(54), Implemented, Description("Get the=
 flag of=20
>> restore OC value")] void IsRestoreOCValue ([in, Description("Clean=20
>> this flag")] UINT32 idx, [out, Description("Restore oc value flag")]=20
>> UINT32 Data);
>> +=C2=A0=C2=A0=C2=A0 [WmiMethodId(55), Implemented, Description("Get Rea=
l Thremal=20
>> Mode")] void GetThermalMode ([out, Description("Real Thremal Mode")]=20
>> UINT32 Data);
>
> Thremal -> Thermal

Those spelling mistakes where already present inside the original MOF desc=
ription of the WMI object, so we have to ignore
them in order to not distort the original interface description.

>
>> +=C2=A0=C2=A0=C2=A0 [WmiMethodId(56), Implemented, Description("Get the=
 OC switch=20
>> status in BIOS")] void GetBIOSOCMode ([out, Description("OC Mode")]=20
>> UINT32 Data);
>
> "Get the BIOS OC switch status"

Same as above.

>
>> +=C2=A0=C2=A0=C2=A0 [WmiMethodId(59), Implemented, Description("Get har=
dware info=20
>> support version")] void GetHardwareInfoSupportVersion ([out,=20
>> Description("version")] UINT32 Data);
>> +=C2=A0=C2=A0=C2=A0 [WmiMethodId(60), Implemented, Description("Get Cpu=
 core 0 max=20
>> frequency")] void GetCpuFrequency ([out, Description("frequency")]=20
>> UINT32 Data);
>> +=C2=A0=C2=A0=C2=A0 [WmiMethodId(62), Implemented, Description("Check t=
he Adapter=20
>> type fit for OC")] void IsACFitForOC ([out, Description("AC check=20
>> result")] UINT32 Data);
>> +=C2=A0=C2=A0=C2=A0 [WmiMethodId(63), Implemented, Description("Is supp=
ort IGPU=20
>> mode")] void IsSupportIGPUMode ([out, Description("IGPU modes")]=20
>> UINT32 Data);
>> +=C2=A0=C2=A0=C2=A0 [WmiMethodId(64), Implemented, Description("Get IGP=
U Mode=20
>> Status")] void GetIGPUModeStatus([out, Description("IGPU Mode=20
>> Status")] UINT32 Data);
>> +=C2=A0=C2=A0=C2=A0 [WmiMethodId(65), Implemented, Description("Set IGP=
U Mode")]=20
>> void SetIGPUModeStatus([in, Description("IGPU Mode")] UINT32 mode,=20
>> [out, Description("return code")] UINT32 Data);
>> +=C2=A0=C2=A0=C2=A0 [WmiMethodId(66), Implemented, Description("Notify =
DGPU=20
>> Status")] void NotifyDGPUStatus([in, Description("DGPU status")]=20
>> UINT32 status, [out, Description("return code")] UINT32 Data);
>> +=C2=A0=C2=A0=C2=A0 [WmiMethodId(67), Implemented, Description("Is chan=
ged Y log")]=20
>> void IsChangedYLog([out, Description("Is changed Y Log")] UINT32 Data);
>> +=C2=A0=C2=A0=C2=A0 [WmiMethodId(68), Implemented, Description("Get DGP=
U Hardwawre=20
>> ID")] void GetDGPUHWId([out, Description("Get DGPU Hardware ID")]=20
>> string Data);
>
> Hardwawre -> Hardware
>
> can we Use value or status instead of generic Data where applicable to=
=20
> convey meaning better.?

Same as above.

>
>> +=C2=A0 };
>> +
>> +=C2=A0 [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"),=20
>> Description("Definition of CPU OC parameter list"),=20
>> guid("{B7F3CA0A-ACDC-42D2-9217-77C6C628FBD2}")]
>> +=C2=A0 class LENOVO_GAMEZONE_CPU_OC_DATA {
>> +=C2=A0=C2=A0=C2=A0 [key, read] string InstanceName;
>> +=C2=A0=C2=A0=C2=A0 [read] boolean Active;
>> +
>> +=C2=A0=C2=A0=C2=A0 [WmiDataId(1), read, Description("OC tune id.")] ui=
nt32 Tuneid;
>> +=C2=A0=C2=A0=C2=A0 [WmiDataId(2), read, Description("Default value.")]=
 uint32=20
>> DefaultValue;
>> +=C2=A0=C2=A0=C2=A0 [WmiDataId(3), read, Description("OC Value.")] uint=
32 OCValue;
>> +=C2=A0=C2=A0=C2=A0 [WmiDataId(4), read, Description("Min Value.")] uin=
t32 MinValue;
>> +=C2=A0=C2=A0=C2=A0 [WmiDataId(5), read, Description("Max Value.")] uin=
t32 MaxValue;
>> +=C2=A0=C2=A0=C2=A0 [WmiDataId(6), read, Description("Scale Value.")] u=
int32=20
>> ScaleValue;
>> +=C2=A0=C2=A0=C2=A0 [WmiDataId(7), read, Description("OC Order id.")] u=
int32 OCOrderid;
>> +=C2=A0=C2=A0=C2=A0 [WmiDataId(8), read, Description("NON-OC Order id."=
)] uint32=20
>> NOCOrderid;
>> +=C2=A0=C2=A0=C2=A0 [WmiDataId(9), read, Description("Delay time in ms.=
")] uint32=20
>> Interval;
>> +=C2=A0 };
>> +
>> +=C2=A0 [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"),=20
>> Description("Definition of GPU OC parameter list"),=20
>> guid("{887B54E2-DDDC-4B2C-8B88-68A26A8835D0}")]
>> +=C2=A0 class LENOVO_GAMEZONE_GPU_OC_DATA {
>> +=C2=A0=C2=A0=C2=A0 [key, read] string InstanceName;
>> +=C2=A0=C2=A0=C2=A0 [read] boolean Active;
>> +
>> +=C2=A0=C2=A0=C2=A0 [WmiDataId(1), read, Description("P-State ID.")] ui=
nt32 PStateID;
>> +=C2=A0=C2=A0=C2=A0 [WmiDataId(2), read, Description("CLOCK ID.")] uint=
32 ClockID;
>> +=C2=A0=C2=A0=C2=A0 [WmiDataId(3), read, Description("Default value.")]=
 uint32=20
>> defaultvalue;
>> +=C2=A0=C2=A0=C2=A0 [WmiDataId(4), read, Description("OC Offset freqenc=
y.")] uint32=20
>> OCOffsetFreq;
>> +=C2=A0=C2=A0=C2=A0 [WmiDataId(5), read, Description("OC Min offset val=
ue.")] uint32=20
>> OCMinOffset;
>> +=C2=A0=C2=A0=C2=A0 [WmiDataId(6), read, Description("OC Max offset val=
ue.")] uint32=20
>> OCMaxOffset;
>> +=C2=A0=C2=A0=C2=A0 [WmiDataId(7), read, Description("OC Offset Scale."=
)] uint32=20
>> OCOffsetScale;
>> +=C2=A0=C2=A0=C2=A0 [WmiDataId(8), read, Description("OC Order id.")] u=
int32 OCOrderid;
>> +=C2=A0=C2=A0=C2=A0 [WmiDataId(9), read, Description("NON-OC Order id."=
)] uint32=20
>> NOCOrderid;
>> +=C2=A0 };
>> +
>> +=C2=A0 [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"),=20
>> Description("Fancooling finish event"),=20
>> guid("{BC72A435-E8C1-4275-B3E2-D8B8074ABA59}")]
>> +=C2=A0 class LENOVO_GAMEZONE_FAN_COOLING_EVENT: WMIEvent {
>> +=C2=A0=C2=A0=C2=A0 [key, read] string InstanceName;
>> +=C2=A0=C2=A0=C2=A0 [read] boolean Active;
>> +
>> +=C2=A0=C2=A0=C2=A0 [WmiDataId(1), read, Description("Fancooling clean =
finish=20
>> event")] uint32 EventId;
>
> Fancooling -> Fan cooling
> "Fan cooling completion event"
> "Fan cooling process finished event ID"

Same as above.

Thanks,
Armin Wolf

>
>> +=C2=A0 };
>> +
>> +=C2=A0 [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"),=20
>> Description("Smart Fan mode change event"),=20
>> guid("{D320289E-8FEA-41E0-86F9-611D83151B5F}")]
>> +=C2=A0 class LENOVO_GAMEZONE_SMART_FAN_MODE_EVENT: WMIEvent {
>> +=C2=A0=C2=A0=C2=A0 [key, read] string InstanceName;
>> +=C2=A0=C2=A0=C2=A0 [read] boolean Active;
>> +
>> +=C2=A0=C2=A0=C2=A0 [WmiDataId(1), read, Description("Smart Fan Mode ch=
ange event")]=20
>> uint32 mode;
>> +=C2=A0=C2=A0=C2=A0 [WmiDataId(2), read, Description("version of FN+Q")=
] uint32=20
>> version;
>> +=C2=A0 };
>> +
>> +=C2=A0 [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"),=20
>> Description("Smart Fan setting mode change event"),=20
>> guid("{D320289E-8FEA-41E1-86F9-611D83151B5F}")]
>> +=C2=A0 class LENOVO_GAMEZONE_SMART_FAN_SETTING_EVENT: WMIEvent {
>> +=C2=A0=C2=A0=C2=A0 [key, read] string InstanceName;
>> +=C2=A0=C2=A0=C2=A0 [read] boolean Active;
>> +
>> +=C2=A0=C2=A0=C2=A0 [WmiDataId(1), read, Description("Smart Fan Setting=
 mode change=20
>> event")] uint32 mode;
>> +=C2=A0 };
>> +
>> +=C2=A0 [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"),=20
>> Description("POWER CHARGE MODE Change EVENT"),=20
>> guid("{D320289E-8FEA-41E0-86F9-711D83151B5F}")]
>> +=C2=A0 class LENOVO_GAMEZONE_POWER_CHARGE_MODE_EVENT: WMIEvent {
>> +=C2=A0=C2=A0=C2=A0 [key, read] string InstanceName;
>> +=C2=A0=C2=A0=C2=A0 [read] boolean Active;
>> +
>> +=C2=A0=C2=A0=C2=A0 [WmiDataId(1), read, Description("POWER CHARGE MODE=
 Change=20
>> EVENT")] uint32 mode;
>> +=C2=A0 };
>> +
>> +=C2=A0 [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"),=20
>> Description("Thermal Mode Real Mode change event"),=20
>> guid("{D320289E-8FEA-41E0-86F9-911D83151B5F}")]
>> +=C2=A0 class LENOVO_GAMEZONE_THERMAL_MODE_EVENT: WMIEvent {
>> +=C2=A0=C2=A0=C2=A0 [key, read] string InstanceName;
>> +=C2=A0=C2=A0=C2=A0 [read] boolean Active;
>> +
>> +=C2=A0=C2=A0=C2=A0 [WmiDataId(1), read, Description("Thermal Mode Real=
 Mode")]=20
>> uint32 mode;
>> +=C2=A0 };
>> diff --git a/Documentation/wmi/devices/lenovo-wmi-other.rst=20
>> b/Documentation/wmi/devices/lenovo-wmi-other.rst
>> new file mode 100644
>> index 000000000000..d7928b8dfb4b
>> --- /dev/null
>> +++ b/Documentation/wmi/devices/lenovo-wmi-other.rst
>> @@ -0,0 +1,108 @@
>> +.. SPDX-License-Identifier: GPL-2.0-or-later
>> +
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +Lenovo WMI Interface Other Mode Driver (lenovo-wmi-other)
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +Introduction
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +Lenovo WMI Other Mode interface is broken up into multiple GUIDs,
>> +The primary Other Mode interface provides advanced power tuning=20
>> features
>> +such as Package Power Tracking (PPT). It is paired with multiple=20
>> data block
>> +GUIDs that provide context for the various methods.
>> +
>> +
>> +Other Mode
>> +----------
>> +
>> +WMI GUID ``DC2A8805-3A8C-41BA-A6F7-092E0089CD3B``
>> +
>> +The Other Mode WMI interface uses the firmware_attributes class to=20
>> expose
>> +various WMI attributes provided by the interface in the sysfs. This=20
>> enables
>> +CPU and GPU power limit tuning as well as various other attributes for
>> +devices that fall under the "Gaming Series" of Lenovo devices. Each
>> +attribute exposed by the Other Mode interface has corresponding
>> +capability data blocks which allow the driver to probe details about=
=20
>> the
>> +attribute. Each attribute has multiple pages, one for each of the=20
>> platform
>> +profiles managed by the Gamezone interface. Attributes are exposed=20
>> in sysfs
>> +under the following path:
>> +
>> +::
>> +
>> + /sys/class/firmware-attributes/lenovo-wmi-other/attributes/<attribute=
>/
>> +
>> +LENOVO_CAPABILITY_DATA_01
>> +-------------------------
>> +
>> +WMI GUID ``7A8F5407-CB67-4D6E-B547-39B3BE018154``
>> +
>> +The LENOVO_CAPABILITY_DATA_01 interface provides information on variou=
s
>> +power limits of integrated CPU and GPU components.
>> +
>> +Each attribute has the following properties:
>> + - current_value
>> + - default_value
>> + - display_name
>> + - max_value
>> + - min_value
>> + - scalar_increment
>> + - type
>> +
>> +The following attributes are implemented:
>> + - ppt_pl1_spl: Platform Profile Tracking Sustained Power Limit
>> + - ppt_pl2_sppt: Platform Profile Tracking Slow Package Power Tracking
>> + - ppt_pl3_fppt: Platform Profile Tracking Fast Package Power Tracking
>> +
>> +
>> +WMI interface description
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
>> +
>> +The WMI interface description can be decoded from the embedded=20
>> binary MOF (bmof)
>> +data using the `bmfdec=20
>> <https://urldefense.com/v3/__https://github.com/pali/bmfdec__;!!ACWV5N9=
M2RV99hQ!MsBEzFjDFpZkeq1j7_77aBEv31FIW_V_vPvnyFGNSL_ptLYWAYFj1UMisJvhsTGRq=
3_lh5eh5RpYWjdlZUKTA0UZ9jO_$=20
>> >`_ utility:
>> +
>> +::
>> +
>> +=C2=A0 [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"),=20
>> Description("LENOVO_OTHER_METHOD class"),=20
>> guid("{dc2a8805-3a8c-41ba-a6f7-092e0089cd3b}")]
>> +=C2=A0 class LENOVO_OTHER_METHOD {
>> +=C2=A0=C2=A0=C2=A0 [key, read] string InstanceName;
>> +=C2=A0=C2=A0=C2=A0 [read] boolean Active;
>> +
>> +=C2=A0=C2=A0=C2=A0 [WmiMethodId(17), Implemented, Description("Get Fea=
ture Value=20
>> ")] void GetFeatureValue([in] uint32 IDs, [out] uint32 value);
>> +=C2=A0=C2=A0=C2=A0 [WmiMethodId(18), Implemented, Description("Set Fea=
ture Value=20
>> ")] void SetFeatureValue([in] uint32 IDs, [in] uint32 value);
>> +=C2=A0=C2=A0=C2=A0 [WmiMethodId(19), Implemented, Description("Get Dat=
a By Command=20
>> ")] void GetDataByCommand([in] uint32 IDs, [in] uint32 Command, [out]=
=20
>> uint32 DataSize, [out, WmiSizeIs("DataSize")] uint32 Data[]);
>> +=C2=A0=C2=A0=C2=A0 [WmiMethodId(99), Implemented, Description("Get Dat=
a By Package=20
>> for TAC")] void GetDataByPackage([in, Max(40)] uint8 Input[], [out]=20
>> uint32 DataSize, [out, WmiSizeIs("DataSize")] uint8 Data[]);
>> +=C2=A0 };
>> +
>> +=C2=A0 [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"),=20
>> Description("LENOVO CAPABILITY DATA 00"),=20
>> guid("{362a3afe-3d96-4665-8530-96dad5bb300e}")]
>> +=C2=A0 class LENOVO_CAPABILITY_DATA_00 {
>> +=C2=A0=C2=A0=C2=A0 [key, read] string InstanceName;
>> +=C2=A0=C2=A0=C2=A0 [read] boolean Active;
>> +
>> +=C2=A0=C2=A0=C2=A0 [WmiDataId(1), read, Description(" IDs.")] uint32 I=
Ds;
>> +=C2=A0=C2=A0=C2=A0 [WmiDataId(2), read, Description("Capability.")] ui=
nt32 Capability;
>> +=C2=A0=C2=A0=C2=A0 [WmiDataId(3), read, Description("Capability Defaul=
t Value.")]=20
>> uint32 DefaultValue;
>> +=C2=A0 };
>> +
>> +=C2=A0 [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"),=20
>> Description("LENOVO CAPABILITY DATA 01"),=20
>> guid("{7a8f5407-cb67-4d6e-b547-39b3be018154}")]
>> +=C2=A0 class LENOVO_CAPABILITY_DATA_01 {
>> +=C2=A0=C2=A0=C2=A0 [key, read] string InstanceName;
>> +=C2=A0=C2=A0=C2=A0 [read] boolean Active;
>> +
>> +=C2=A0=C2=A0=C2=A0 [WmiDataId(1), read, Description(" IDs.")] uint32 I=
Ds;
>> +=C2=A0=C2=A0=C2=A0 [WmiDataId(2), read, Description("Capability.")] ui=
nt32 Capability;
>> +=C2=A0=C2=A0=C2=A0 [WmiDataId(3), read, Description("Default Value.")]=
 uint32=20
>> DefaultValue;
>> +=C2=A0=C2=A0=C2=A0 [WmiDataId(4), read, Description("Step.")] uint32 S=
tep;
>> +=C2=A0=C2=A0=C2=A0 [WmiDataId(5), read, Description("Minimum Value.")]=
 uint32=20
>> MinValue;
>> +=C2=A0=C2=A0=C2=A0 [WmiDataId(6), read, Description("Maximum Value.")]=
 uint32=20
>> MaxValue;
>> +=C2=A0 };
>> +
>> +=C2=A0 [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"),=20
>> Description("LENOVO CAPABILITY DATA 02"),=20
>> guid("{bbf1f790-6c2f-422b-bc8c-4e7369c7f6ab}")]
>> +=C2=A0 class LENOVO_CAPABILITY_DATA_02 {
>> +=C2=A0=C2=A0=C2=A0 [key, read] string InstanceName;
>> +=C2=A0=C2=A0=C2=A0 [read] boolean Active;
>> +
>> +=C2=A0=C2=A0=C2=A0 [WmiDataId(1), read, Description(" IDs.")] uint32 I=
Ds;
>> +=C2=A0=C2=A0=C2=A0 [WmiDataId(2), read, Description("Capability.")] ui=
nt32 Capability;
>> +=C2=A0=C2=A0=C2=A0 [WmiDataId(3), read, Description("Data Size.")] uin=
t32 DataSize;
>> +=C2=A0=C2=A0=C2=A0 [WmiDataId(4), read, Description("Default Value"),=
=20
>> WmiSizeIs("DataSize")] uint8 DefaultValue[];
>> +=C2=A0 };
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 1afd30d00aec..675f4b26426d 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -13158,6 +13158,13 @@ S:=C2=A0=C2=A0=C2=A0 Maintained
>> =C2=A0 W:=20
>> https://urldefense.com/v3/__http://legousb.sourceforge.net/__;!!ACWV5N9=
M2RV99hQ!MsBEzFjDFpZkeq1j7_77aBEv31FIW_V_vPvnyFGNSL_ptLYWAYFj1UMisJvhsTGRq=
3_lh5eh5RpYWjdlZUKTA1y38Zxx$
>> =C2=A0 F:=C2=A0=C2=A0=C2=A0 drivers/usb/misc/legousbtower.c
>> =C2=A0 +LENOVO WMI DRIVERS
>> +M:=C2=A0=C2=A0=C2=A0 Derek J. Clark <derekjohn.clark@gmail.com>
>> +L:=C2=A0=C2=A0=C2=A0 platform-driver-x86@vger.kernel.org
>> +S:=C2=A0=C2=A0=C2=A0 Maintained
>> +F:=C2=A0=C2=A0=C2=A0 Documentation/wmi/devices/lenovo-wmi-gamezone.rst
>> +F:=C2=A0=C2=A0=C2=A0 Documentation/wmi/devices/lenovo-wmi-other.rst
>> +
>> =C2=A0 LENOVO WMI HOTKEY UTILITIES DRIVER
>> =C2=A0 M:=C2=A0=C2=A0=C2=A0 Jackie Dong <xy-jackie@139.com>
>> =C2=A0 L:=C2=A0=C2=A0=C2=A0 platform-driver-x86@vger.kernel.org
>
> Reviewed-by: Alok Tiwari <alok.a.tiwari@oracle.com>
>
> Thanks,
> Alok
>
