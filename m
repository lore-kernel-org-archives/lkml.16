Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D308489;
	Sun, 30 Mar 2025 04:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743310210; cv=none; b=oUUFBqsb01Qex7pxGxzDuwhZXW5768ygCg/vfIVbh8wsc7+6T8NrdaY5ZVbNPd7kA0bi5mj90V2kw8JqP3GBltv5cyIsaeFEdsH0kVnFulC3rptqTROYYF0CrScW+CQLXAlntKTuxHfrsrlNwv0jzApA+Scu785CV4vZJBUvn/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743310210; c=relaxed/simple;
	bh=CK1QfpgKSiHCS1qAsNeH+UmtfAyhpYtz091Z1J7p+r4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KfLdLoljV6/Xdv7RD4eV4+h8cPW3eyiCH+LChKbHGZgdK+VESgsmUgqKvL8CaD30bCOp7zE/eSoWprrW0f0mi/j6/o7cAQPmBKgsc06zlRQ3lLaiWiViBGQlluWDcV6gbplhukpjk3foBLCKhKnpF1oHBh3pqDog44RajAGxzYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HiLMJtsU; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HiLMJtsU"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-476af5479feso31080251cf.2;
        Sat, 29 Mar 2025 21:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743310205; x=1743915005; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+LCM6J7hQo2EtA+Fu2USHZsuPhbcMABpHc7UdpQXQE4=;
        b=HiLMJtsUXvTq0zdaL0ttw23COhe2YFZ/61aLkTjCv+KYs1w5UqvXTeCfsTgZR8dfRS
         Nn6vOnkugs7IhIYs9E/SigE9kjzd23RtOFYuB4wtN4QEdxRt7ObAf7PyCVnr4qgyijL2
         BU8XVjOI2Sx2S1oRwnk78E6ksbYeMiNiwXxuLp9el2M9Nejdsz8SLLFX7HMUloSKPBJU
         gCVZZOaJRyxPEMOETqqrNERAE8aPx5uzHLZECUNie95B83GXEAABciICZx6zT00/hyeR
         hQcngO0GMqKb5u1+fl1Rcl2bw2obHp4cbn4gbSF/SQE12u41P3Kmbmrdw6Y3li5R1p5a
         btuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743310205; x=1743915005;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+LCM6J7hQo2EtA+Fu2USHZsuPhbcMABpHc7UdpQXQE4=;
        b=sAJbfigLNMjuk/tN3GUwIc2mIf4WPht8BCHWKGBceb8IOtvOCY8K3qMxbPm3Uv0SsL
         qajtfQSoKetcolYEU5GCA4F/9cy4/Uk9wEs0VvINClcGthAm5QcrgrkCmGnO99WouySq
         io0carL8HYyV7KWRQgve2BTZFzqcShQV/VPxI8EUrkJIoDBIciqrv1tcbcPtQh9GEJ8T
         ANGDHVe+bpSYFJFQf2UdyOJLLvMymyCOuiIrpsDJ7EsKn/grOcNZ3joTsUMtj9tAL99a
         z1zdIHTr5W3n73cBphmrHGMgq3S1EqpNQ/O45tJfwdlO0V9aCwuZr9a4HZRL/R5aHqUG
         /D6A==
X-Forwarded-Encrypted: i=1; AJvYcCUXsURwRqFncV5ZxG0ajBhdTUZ00YXPdMlQEF794rkSz77Rt8Ss3URA6Pt3F9f2OTDxc2GUL73ZfqCTiP8+@vger.kernel.org, AJvYcCWbbY0e7+rxvqV+4h5IAMwTOtzPZjhK7L9ntFyEzMqLlFaEYSYjmmglraq4DJBz3jJ2jy6QVkXzUaQ=@vger.kernel.org, AJvYcCXFjyMJcm2Zs2tgFot59bgb1FGlz+V2knw/CH5B32HY728LBoYAni0zvHDVAoztlkF07YRkhTg/u9dWK1RH+H8s2ORZhw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw54C/U1W+IHPZPTpFlEjGMDqFJllpFk4xhqh63AZqnw5yLWFwt
	NTZl2EvsvifEzLu8TqoN7u95lOspUm/i8spr2CVM0lvczLg+hdQWfM65ZRKGIEAM7yutDJa2eUQ
	BH1IGRH0k1KgNr/VmgeYK+oI3hW8=
X-Gm-Gg: ASbGnctfJKMMnTG9utJ1O+JyJlCfCU2HqbxOpK8Y4yd8UW4DesvmKc3Z6lR6cMbmdWa
	tdfpsD+TEsAJWubXoDXMFPyf1bH7ht2OSu76m4zJMLRwR045na4ExhpYz14+NrxhkQYFBHWY6nt
	yOnZBwgMZrtEUSYarnbmGOwKWLaso=
X-Google-Smtp-Source: AGHT+IG9lpV+zPd09a7OMCX2T7W5WB1dGFrcLZsfbLOO2xcMaBUCSPlrBy79kRNmZ90LHBuM1lsNNDi6i7Q8jisCpJA=
X-Received: by 2002:a05:6214:b6a:b0:6e8:ef80:bcbc with SMTP id
 6a1803df08f44-6eed5f9d45cmr71492806d6.5.1743310205389; Sat, 29 Mar 2025
 21:50:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250317144326.5850-1-derekjohn.clark@gmail.com>
 <20250317144326.5850-2-derekjohn.clark@gmail.com> <58cf676c-ffb3-4849-90fd-e570885d3a45@gmx.de>
In-Reply-To: <58cf676c-ffb3-4849-90fd-e570885d3a45@gmx.de>
From: Derek John Clark <derekjohn.clark@gmail.com>
Date: Sat, 29 Mar 2025 21:49:54 -0700
X-Gm-Features: AQ5f1JpC4gDfuYzwJx_zsvhCTfOkGA4UJg8qIfCxOckRPWTnOfsInDVn3gLb8I4
Message-ID: <CAFqHKT=dAB-7Gk7wytHkzNQjCdvBX8RyGzfEjpu8qVqGhjJ5Ng@mail.gmail.com>
Subject: Re: [PATCH v4 1/6 RESEND] platform/x86: Add lenovo-wmi-* driver Documentation
To: Armin Wolf <W_Armin@gmx.de>
Cc: Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Jonathan Corbet <corbet@lwn.net>, Mario Limonciello <superm1@kernel.org>, Luke Jones <luke@ljones.dev>, 
	Xino Ni <nijs1@lenovo.com>, Zhixin Zhang <zhangzx36@lenovo.com>, Mia Shao <shaohz1@lenovo.com>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, 
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>, "Cody T . -H . Chiu" <codyit@gmail.com>, 
	John Martens <johnfanv2@gmail.com>, platform-driver-x86@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 26, 2025 at 5:26=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> wrote:
>
> Am 17.03.25 um 15:43 schrieb Derek J. Clark:
>
> > Adds documentation for new lenovo-wmi drivers.
> >
> > Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> > ---
> > v4:
> >   - Fixed MOF formatting issues.
> >   - Fixed spelling mistakes.
> >   - Updated description of balanced-performance profile for Gamezone.
> >   - Updated description of thermal mode event GUID for Gamezone.
> > v3:
> > - Split documentation into multiple files, one for each parent
> >    driver for the Gamezone and Other Mode WMI interfaces.
> > - Add MOF data for all parent and child interfaces.
> > - Remove lenovo-wmi-camera.c driver from v2 documentation.
> > v2:
> > - Update description of Custom Profile to include the need to manually
> >    set it.
> > - Remove all references to Legion hardware.
> > - Add section for lenovo-wmi-camera.c driver as it follows the same
> >    naming convention.
> > ---
> >   .../wmi/devices/lenovo-wmi-gamezone.rst       | 203 +++++++++++++++++=
+
> >   .../wmi/devices/lenovo-wmi-other-method.rst   | 108 ++++++++++
> >   MAINTAINERS                                   |   7 +
> >   3 files changed, 318 insertions(+)
> >   create mode 100644 Documentation/wmi/devices/lenovo-wmi-gamezone.rst
> >   create mode 100644 Documentation/wmi/devices/lenovo-wmi-other-method.=
rst
> >
> > diff --git a/Documentation/wmi/devices/lenovo-wmi-gamezone.rst b/Docume=
ntation/wmi/devices/lenovo-wmi-gamezone.rst
> > new file mode 100644
> > index 000000000000..bde63dde285d
> > --- /dev/null
> > +++ b/Documentation/wmi/devices/lenovo-wmi-gamezone.rst
> > @@ -0,0 +1,203 @@
> > +.. SPDX-License-Identifier: GPL-2.0-or-later
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +Lenovo WMI Interface Gamezone Driver (lenovo-wmi-gamezone)
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +Introduction
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +The Lenovo WMI gamezone interface is broken up into multiple GUIDs,
> > +The priamry "Gamezone" GUID provides advanced features such as fan
> > +profiles and overclocking. It is paired with multiple event GUIDs
> > +and data block GUIDs that provide context for the various methods.
> > +
> > +Gamezone Data
> > +-------------
> > +
> > +WMI GUID "887B54E3-DDDC-4B2C-8B88-68A26A8835D0"
> > +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > +
> > +The Gamezone Data WMI interface provides platform-profile and fan curv=
e
> > +settings for devices that fall under the "Gaming Series" of Lenovo dev=
ices.
> > +It uses a notifier chain to inform other Lenovo WMI interface drivers =
of the
> > +current platform profile when it changes.
> > +
> > +The following platform profiles are supported:
> > + - low-power
> > + - balanced
> > + - balanced-performance*
> > + - performance
> > + - custom
> > +
> > +Balanced-Performance
> > +~~~~~~~~~~~~~~~~~~~~
> > +Some newer Lenovo "Gaming Series" laptops have an "Extreme Mode" profi=
le
> > +enabled in their BIOS. For these devices, the performance platform pro=
file
> > +will correspond to the BIOS Extreme Mode, while the balanced-performan=
ce
> > +platform profile will correspond to the BIOS Performance mode. For leg=
acy
> > +devices, the performance platform profile will correspond with the BIO=
S
> > +Performance mode. For some newer devices the "Extreme Mode" profile is
> > +incomplete in the BIOS and setting it will cause undefined behavior. A
> > +BIOS bug quirk table is provided to ensure these devices cannot set
> > +"Extreme Mode" from the driver.
> > +
> > +Custom Profile
> > +~~~~~~~~~~~~~~
> > +The custom profile represents a hardware mode on Lenovo devices that e=
nables
> > +user modifications to Package Power Tracking (PPT) and fan curve setti=
ngs.
> > +When an attribute exposed by the Other Mode WMI interface is to be mod=
ified,
> > +the Gamezone driver must first be switched to the "custom" profile man=
ually,
> > +or the setting will have no effect. If another profile is set from the=
 list
> > +of supported profiles, the BIOS will override any user PPT settings wh=
en
> > +switching to that profile.
> > +
> > +Gamezone Thermal Mode Event
> > +---------------------------
> > +
> > +WMI GUID "D320289E-8FEA-41E0-86F9-911D83151B5F"
>
> Hi,
>
> if i remember correctly we agreed that the GUIDs could use some special m=
arkup (monospace, ...)
> instead of using "".
>

I misunderstood your meaning and added the ~'s below based on some
documentation I can't find anymore. There are some conflicting
accounts of how this should be done that I can find and I cant find
any reStructuredText documentation that states it specifically. For
clarity, are you looking for:

WMI GUID ``D320289E-8FEA-41E0-86F9-911D83151B5F``

> > +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > +
> > +The Gamezone Thermal Mode Event interface notifies the system when the=
 platform
> > +profile has changed, either through the hardware event (Fn+Q for lapto=
ps or
> > +Legion + Y for Go Series), or through the Gamezone WMI interface. This=
 event is
> > +implemented in the Lenovo WMI Events driver (lenovo-wmi-events).
> > +
> > +
> > +WMI interface description
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> > +
> > +The WMI interface description can be decoded from the embedded binary =
MOF (bmof)
> > +data using the `bmfdec <https://github.com/pali/bmfdec>`_ utility:
> > +
> > +::
> > +
> > +  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description=
("LENOVO_GAMEZONE_DATA class"), guid("{887B54E3-DDDC-4B2C-8B88-68A26A8835D0=
}")]
> > +  class LENOVO_GAMEZONE_DATA {
> > +     [key, read] string InstanceName;
> > +     [read] boolean Active;
>
> When building the html documentation the following errors appear:
>
> /home/wolf/Dokumente/Kernel/platform-drivers-x86/Documentation/wmi/device=
s/lenovo-wmi-gamezone.rst:2: WARNING: Explicit markup ends without a blank =
line; unexpected unindent.
> /home/wolf/Dokumente/Kernel/platform-drivers-x86/Documentation/wmi/device=
s/lenovo-wmi-other-method.rst:2: WARNING: Explicit markup ends without a bl=
ank line; unexpected unindent.
>
> Please fix those errors.
>

Yes, I caught those in my self-reply.

> > +
> > +    [WmiMethodId(4), Implemented, Description("Is SupportGpu OverClock=
")] void IsSupportGpuOC([out, Description("Is SupportGpu OverClock")] uint3=
2 Data);
> > +    [WmiMethodId(11), Implemented, Description("Get AslCode Version")]=
 void GetVersion ([out, Description("AslCode version")] UINT32 Data);
> > +    [WmiMethodId(12), Implemented, Description("Fan cooling capability=
")] void IsSupportFanCooling([out, Description("Fan cooling capability")] U=
INT32 Data);
> > +    [WmiMethodId(13), Implemented, Description("Set Fan cooling on/off=
")] void SetFanCooling ([in, Description("Set Fan cooling on/off")] UINT32 =
Data);
> > +    [WmiMethodId(14), Implemented, Description("cpu oc capability")] v=
oid IsSupportCpuOC ([out, Description("cpu oc capability")] UINT32 Data);
> > +    [WmiMethodId(15), Implemented, Description("bios has overclock cap=
ability")] void IsBIOSSupportOC ([out, Description("bios has overclock capa=
bility")] UINT32 Data);
> > +    [WmiMethodId(16), Implemented, Description("enable or disable over=
clock in bios")] void SetBIOSOC ([in, Description("enable or disable overcl=
ock in bios")] UINT32 Data);
> > +    [WmiMethodId(18), Implemented, Description("Get CPU temperature")]=
 void GetCPUTemp ([out, Description("Get CPU temperature")] UINT32 Data);
> > +    [WmiMethodId(19), Implemented, Description("Get GPU temperature")]=
 void GetGPUTemp ([out, Description("Get GPU temperature")] UINT32 Data);
> > +    [WmiMethodId(20), Implemented, Description("Get Fan cooling on/off=
 status")] void GetFanCoolingStatus ([out, Description("Get Fan cooling on/=
off status")] UINT32 Data);
> > +    [WmiMethodId(21), Implemented, Description("EC support disable win=
dows key capability")] void IsSupportDisableWinKey ([out, Description("EC s=
upport disable windows key capability")] UINT32 Data);
> > +    [WmiMethodId(22), Implemented, Description("Set windows key disabl=
e/enable")] void SetWinKeyStatus ([in, Description("Set windows key disable=
/enable")] UINT32 Data);
> > +    [WmiMethodId(23), Implemented, Description("Get windows key disabl=
e/enable status")] void GetWinKeyStatus ([out, Description("Get windows key=
 disable/enable status")] UINT32 Data);
> > +    [WmiMethodId(24), Implemented, Description("EC support disable tou=
chpad capability")] void IsSupportDisableTP ([out, Description("EC support =
disable touchpad capability")] UINT32 Data);
> > +    [WmiMethodId(25), Implemented, Description("Set touchpad disable/e=
nable")] void SetTPStatus ([in, Description("Set touchpad disable/enable")]=
 UINT32 Data);
> > +    [WmiMethodId(26), Implemented, Description("Get touchpad disable/e=
nable status")] void GetTPStatus ([out, Description("Get touchpad disable/e=
nable status")] UINT32 Data);
> > +    [WmiMethodId(30), Implemented, Description("Get Keyboard feature l=
ist")] void GetKeyboardfeaturelist ([out, Description("Get Keyboard feature=
 list")] UINT32 Data);
> > +    [WmiMethodId(31), Implemented, Description("Get Memory OC Informat=
ion")] void GetMemoryOCInfo ([out, Description("Get Memory OC Information")=
] UINT32 Data);
> > +    [WmiMethodId(32), Implemented, Description("Water Cooling feature =
capability")] void IsSupportWaterCooling ([out, Description("Water Cooling =
feature capability")] UINT32 Data);
> > +    [WmiMethodId(33), Implemented, Description("Set Water Cooling stat=
us")] void SetWaterCoolingStatus ([in, Description("Set Water Cooling statu=
s")] UINT32 Data);
> > +    [WmiMethodId(34), Implemented, Description("Get Water Cooling stat=
us")] void GetWaterCoolingStatus ([out, Description("Get Water Cooling stat=
us")] UINT32 Data);
> > +    [WmiMethodId(35), Implemented, Description("Lighting feature capab=
ility")] void IsSupportLightingFeature ([out, Description("Lighting feature=
 capability")] UINT32 Data);
> > +    [WmiMethodId(36), Implemented, Description("Set keyboard light off=
 or on to max")] void SetKeyboardLight ([in, Description("keyboard light of=
f or on switch")] UINT32 Data);
> > +    [WmiMethodId(37), Implemented, Description("Get keyboard light on/=
off status")] void GetKeyboardLight ([out, Description("Get keyboard light =
on/off status")] UINT32 Data);
> > +    [WmiMethodId(38), Implemented, Description("Get Macrokey scan code=
")] void GetMacrokeyScancode ([in, Description("Macrokey index")] UINT32 id=
x, [out, Description("Scan code")] UINT32 scancode);
> > +    [WmiMethodId(39), Implemented, Description("Get Macrokey count")] =
void GetMacrokeyCount ([out, Description("Macrokey count")] UINT32 Data);
> > +    [WmiMethodId(40), Implemented, Description("Support G-Sync feature=
")] void IsSupportGSync ([out, Description("Support G-Sync feature")] UINT3=
2 Data);
> > +    [WmiMethodId(41), Implemented, Description("Get G-Sync Status")] v=
oid GetGSyncStatus ([out, Description("Get G-Sync Status")] UINT32 Data);
> > +    [WmiMethodId(42), Implemented, Description("Set G-Sync Status")] v=
oid SetGSyncStatus ([in, Description("Set G-Sync Status")] UINT32 Data);
> > +    [WmiMethodId(43), Implemented, Description("Support Smart Fan feat=
ure")] void IsSupportSmartFan ([out, Description("Support Smart Fan feature=
")] UINT32 Data);
> > +    [WmiMethodId(44), Implemented, Description("Set Smart Fan Mode")] =
void SetSmartFanMode ([in, Description("Set Smart Fan Mode")] UINT32 Data);
> > +    [WmiMethodId(45), Implemented, Description("Get Smart Fan Mode")] =
void GetSmartFanMode ([out, Description("Get Smart Fan Mode")] UINT32 Data)=
;
> > +    [WmiMethodId(46), Implemented, Description("Get Smart Fan Setting =
Mode")] void GetSmartFanSetting ([out, Description("Get Smart Setting Mode"=
)] UINT32 Data);
> > +    [WmiMethodId(47), Implemented, Description("Get Power Charge Mode"=
)] void GetPowerChargeMode ([out, Description("Get Power Charge Mode")] UIN=
T32 Data);
> > +    [WmiMethodId(48), Implemented, Description("Get Gaming Product Inf=
o")] void GetProductInfo ([out, Description("Get Gaming Product Info")] UIN=
T32 Data);
> > +    [WmiMethodId(49), Implemented, Description("Over Drive feature cap=
ability")] void IsSupportOD ([out, Description("Over Drive feature capabili=
ty")] UINT32 Data);
> > +    [WmiMethodId(50), Implemented, Description("Get Over Drive status"=
)] void GetODStatus ([out, Description("Get Over Drive status")] UINT32 Dat=
a);
> > +    [WmiMethodId(51), Implemented, Description("Set Over Drive status"=
)] void SetODStatus ([in, Description("Set Over Drive status")] UINT32 Data=
);
> > +    [WmiMethodId(52), Implemented, Description("Set Light Control Owne=
r")] void SetLightControlOwner ([in, Description("Set Light Control Owner")=
] UINT32 Data);
> > +    [WmiMethodId(53), Implemented, Description("Set DDS Control Owner"=
)] void SetDDSControlOwner ([in, Description("Set DDS Control Owner")] UINT=
32 Data);
> > +    [WmiMethodId(54), Implemented, Description("Get the flag of restor=
e OC value")] void IsRestoreOCValue ([in, Description("Clean this flag")] U=
INT32 idx, [out, Description("Restore oc value flag")] UINT32 Data);
> > +    [WmiMethodId(55), Implemented, Description("Get Real Thremal Mode"=
)] void GetThermalMode ([out, Description("Real Thremal Mode")] UINT32 Data=
);
> > +    [WmiMethodId(56), Implemented, Description("Get the OC switch stat=
us in BIOS")] void GetBIOSOCMode ([out, Description("OC Mode")] UINT32 Data=
);
> > +    [WmiMethodId(59), Implemented, Description("Get hardware info supp=
ort version")] void GetHardwareInfoSupportVersion ([out, Description("versi=
on")] UINT32 Data);
> > +    [WmiMethodId(60), Implemented, Description("Get Cpu core 0 max fre=
quency")] void GetCpuFrequency ([out, Description("frequency")] UINT32 Data=
);
> > +    [WmiMethodId(62), Implemented, Description("Check the Adapter type=
 fit for OC")] void IsACFitForOC ([out, Description("AC check result")] UIN=
T32 Data);
> > +    [WmiMethodId(63), Implemented, Description("Is support IGPU mode")=
] void IsSupportIGPUMode ([out, Description("IGPU modes")] UINT32 Data);
> > +    [WmiMethodId(64), Implemented, Description("Get IGPU Mode Status")=
] void GetIGPUModeStatus([out, Description("IGPU Mode Status")] UINT32 Data=
);
> > +    [WmiMethodId(65), Implemented, Description("Set IGPU Mode")] void =
SetIGPUModeStatus([in, Description("IGPU Mode")] UINT32 mode, [out, Descrip=
tion("return code")] UINT32 Data);
> > +    [WmiMethodId(66), Implemented, Description("Notify DGPU Status")] =
void NotifyDGPUStatus([in, Description("DGPU status")] UINT32 status, [out,=
 Description("return code")] UINT32 Data);
> > +    [WmiMethodId(67), Implemented, Description("Is changed Y log")] vo=
id IsChangedYLog([out, Description("Is changed Y Log")] UINT32 Data);
> > +    [WmiMethodId(68), Implemented, Description("Get DGPU Hardwawre ID"=
)] void GetDGPUHWId([out, Description("Get DGPU Hardware ID")] string Data)=
;
> > +  };
> > +
> > +  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description=
("Definition of CPU OC parameter list"), guid("{B7F3CA0A-ACDC-42D2-9217-77C=
6C628FBD2}")]
> > +  class LENOVO_GAMEZONE_CPU_OC_DATA {
> > +    [key, read] string InstanceName;
> > +    [read] boolean Active;
> > +
> > +    [WmiDataId(1), read, Description("OC tune id.")] uint32 Tuneid;
> > +    [WmiDataId(2), read, Description("Default value.")] uint32 Default=
Value;
> > +    [WmiDataId(3), read, Description("OC Value.")] uint32 OCValue;
> > +    [WmiDataId(4), read, Description("Min Value.")] uint32 MinValue;
> > +    [WmiDataId(5), read, Description("Max Value.")] uint32 MaxValue;
> > +    [WmiDataId(6), read, Description("Scale Value.")] uint32 ScaleValu=
e;
> > +    [WmiDataId(7), read, Description("OC Order id.")] uint32 OCOrderid=
;
> > +    [WmiDataId(8), read, Description("NON-OC Order id.")] uint32 NOCOr=
derid;
> > +    [WmiDataId(9), read, Description("Delay time in ms.")] uint32 Inte=
rval;
> > +  };
> > +
> > +  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description=
("Definition of GPU OC parameter list"), guid("{887B54E2-DDDC-4B2C-8B88-68A=
26A8835D0}")]
> > +  class LENOVO_GAMEZONE_GPU_OC_DATA {
> > +    [key, read] string InstanceName;
> > +    [read] boolean Active;
> > +
> > +    [WmiDataId(1), read, Description("P-State ID.")] uint32 PStateID;
> > +    [WmiDataId(2), read, Description("CLOCK ID.")] uint32 ClockID;
> > +    [WmiDataId(3), read, Description("Default value.")] uint32 default=
value;
> > +    [WmiDataId(4), read, Description("OC Offset freqency.")] uint32 OC=
OffsetFreq;
> > +    [WmiDataId(5), read, Description("OC Min offset value.")] uint32 O=
CMinOffset;
> > +    [WmiDataId(6), read, Description("OC Max offset value.")] uint32 O=
CMaxOffset;
> > +    [WmiDataId(7), read, Description("OC Offset Scale.")] uint32 OCOff=
setScale;
> > +    [WmiDataId(8), read, Description("OC Order id.")] uint32 OCOrderid=
;
> > +    [WmiDataId(9), read, Description("NON-OC Order id.")] uint32 NOCOr=
derid;
> > +  };
> > +
> > +  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description=
("Fancooling finish event"), guid("{BC72A435-E8C1-4275-B3E2-D8B8074ABA59}")=
]
> > +  class LENOVO_GAMEZONE_FAN_COOLING_EVENT: WMIEvent {
> > +    [key, read] string InstanceName;
> > +    [read] boolean Active;
> > +
> > +    [WmiDataId(1), read, Description("Fancooling clean finish event")]=
 uint32 EventId;
> > +  };
> > +
> > +  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description=
("Smart Fan mode change event"), guid("{D320289E-8FEA-41E0-86F9-611D83151B5=
F}")]
> > +  class LENOVO_GAMEZONE_SMART_FAN_MODE_EVENT: WMIEvent {
> > +    [key, read] string InstanceName;
> > +    [read] boolean Active;
> > +
> > +    [WmiDataId(1), read, Description("Smart Fan Mode change event")] u=
int32 mode;
> > +    [WmiDataId(2), read, Description("version of FN+Q")] uint32 versio=
n;
> > +  };
> > +
> > +  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description=
("Smart Fan setting mode change event"), guid("{D320289E-8FEA-41E1-86F9-611=
D83151B5F}")]
> > +  class LENOVO_GAMEZONE_SMART_FAN_SETTING_EVENT: WMIEvent {
> > +    [key, read] string InstanceName;
> > +    [read] boolean Active;
> > +
> > +    [WmiDataId(1), read, Description("Smart Fan Setting mode change ev=
ent")] uint32 mode;
> > +  };
> > +
> > +  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description=
("POWER CHARGE MODE Change EVENT"), guid("{D320289E-8FEA-41E0-86F9-711D8315=
1B5F}")]
> > +  class LENOVO_GAMEZONE_POWER_CHARGE_MODE_EVENT: WMIEvent {
> > +    [key, read] string InstanceName;
> > +    [read] boolean Active;
> > +
> > +    [WmiDataId(1), read, Description("POWER CHARGE MODE Change EVENT")=
] uint32 mode;
> > +  };
> > +
> > +  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description=
("Thermal Mode Real Mode change event"), guid("{D320289E-8FEA-41E0-86F9-911=
D83151B5F}")]
> > +  class LENOVO_GAMEZONE_THERMAL_MODE_EVENT: WMIEvent {
> > +    [key, read] string InstanceName;
> > +    [read] boolean Active;
> > +
> > +    [WmiDataId(1), read, Description("Thermal Mode Real Mode")] uint32=
 mode;
> > +  };
> > diff --git a/Documentation/wmi/devices/lenovo-wmi-other-method.rst b/Do=
cumentation/wmi/devices/lenovo-wmi-other-method.rst
> > new file mode 100644
> > index 000000000000..b48832726311
> > --- /dev/null
> > +++ b/Documentation/wmi/devices/lenovo-wmi-other-method.rst
> > @@ -0,0 +1,108 @@
> > +.. SPDX-License-Identifier: GPL-2.0-or-later
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +Lenovo WMI Interface Other Mode Driver (lenovo-wmi-other)
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +Introduction
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +Lenovo WMI Other Mode interface is broken up into multiple GUIDs,
> > +The primary Other Mode interface provides advanced power tuning featur=
es
> > +such as Package Power Tracking (PPT). It is paired with multiple data =
block
> > +GUIDs that provide context for the various methods.
> > +
> > +
> > +Other Mode
> > +----------
> > +
> > +WMI GUID "DC2A8805-3A8C-41BA-A6F7-092E0089CD3B"
> > +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > +
> > +The Other Mode WMI interface uses the firmware_attributes class to exp=
ose
> > +various WMI attributes provided by the interface in the sysfs. This en=
ables
> > +CPU and GPU power limit tuning as well as various other attributes for
> > +devices that fall under the "Gaming Series" of Lenovo devices. Each
> > +attribute exposed by the Other Mode interface has corresponding
> > +capability data blocks which allow the driver to probe details about t=
he
> > +attribute. Each attribute has multiple pages, one for each of the plat=
form
> > +profiles managed by the Gamezone interface. Attributes are exposed in =
sysfs
> > +under the following path:
> > +
> > +::
> > +/sys/class/firmware-attributes/lenovo-wmi-other/attributes/<attribute>=
/
>
> Something is wrong with the formatting, the text is being rendered as-is.
> Please indent the path with two spaces and add a blank line between the "=
::"
> and the path.
>

Can do.

Thanks,
Derek

> Thanks,
> Armin Wolf
>
> > +
> > +LENOVO_CAPABILITY_DATA_01
> > +-------------------------
> > +
> > +WMI GUID "7A8F5407-CB67-4D6E-B547-39B3BE018154"
> > +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > +
> > +The LENOVO_CAPABILITY_DATA_01 interface provides information on variou=
s
> > +power limits of integrated CPU and GPU components.
> > +
> > +Each attribute has the following properties:
> > + - current_value
> > + - default_value
> > + - display_name
> > + - max_value
> > + - min_value
> > + - scalar_increment
> > + - type
> > +
> > +The following attributes are implemented:
> > + - ppt_pl1_spl: Platform Profile Tracking Sustained Power Limit
> > + - ppt_pl2_sppt: Platform Profile Tracking Slow Package Power Tracking
> > + - ppt_pl3_fppt: Platform Profile Tracking Fast Package Power Tracking
> > +
> > +
> > +WMI interface description
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> > +
> > +The WMI interface description can be decoded from the embedded binary =
MOF (bmof)
> > +data using the `bmfdec <https://github.com/pali/bmfdec>`_ utility:
> > +
> > +::
> > +
> > +  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description=
("LENOVO_OTHER_METHOD class"), guid("{dc2a8805-3a8c-41ba-a6f7-092e0089cd3b}=
")]
> > +  class LENOVO_OTHER_METHOD {
> > +    [key, read] string InstanceName;
> > +    [read] boolean Active;
> > +
> > +    [WmiMethodId(17), Implemented, Description("Get Feature Value ")] =
void GetFeatureValue([in] uint32 IDs, [out] uint32 value);
> > +    [WmiMethodId(18), Implemented, Description("Set Feature Value ")] =
void SetFeatureValue([in] uint32 IDs, [in] uint32 value);
> > +    [WmiMethodId(19), Implemented, Description("Get Data By Command ")=
] void GetDataByCommand([in] uint32 IDs, [in] uint32 Command, [out] uint32 =
DataSize, [out, WmiSizeIs("DataSize")] uint32 Data[]);
> > +    [WmiMethodId(99), Implemented, Description("Get Data By Package fo=
r TAC")] void GetDataByPackage([in, Max(40)] uint8 Input[], [out] uint32 Da=
taSize, [out, WmiSizeIs("DataSize")] uint8 Data[]);
> > +  };
> > +
> > +  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description=
("LENOVO CAPABILITY DATA 00"), guid("{362a3afe-3d96-4665-8530-96dad5bb300e}=
")]
> > +  class LENOVO_CAPABILITY_DATA_00 {
> > +    [key, read] string InstanceName;
> > +    [read] boolean Active;
> > +
> > +    [WmiDataId(1), read, Description(" IDs.")] uint32 IDs;
> > +    [WmiDataId(2), read, Description("Capability.")] uint32 Capability=
;
> > +    [WmiDataId(3), read, Description("Capability Default Value.")] uin=
t32 DefaultValue;
> > +  };
> > +
> > +  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description=
("LENOVO CAPABILITY DATA 01"), guid("{7a8f5407-cb67-4d6e-b547-39b3be018154}=
")]
> > +  class LENOVO_CAPABILITY_DATA_01 {
> > +    [key, read] string InstanceName;
> > +    [read] boolean Active;
> > +
> > +    [WmiDataId(1), read, Description(" IDs.")] uint32 IDs;
> > +    [WmiDataId(2), read, Description("Capability.")] uint32 Capability=
;
> > +    [WmiDataId(3), read, Description("Default Value.")] uint32 Default=
Value;
> > +    [WmiDataId(4), read, Description("Step.")] uint32 Step;
> > +    [WmiDataId(5), read, Description("Minimum Value.")] uint32 MinValu=
e;
> > +    [WmiDataId(6), read, Description("Maximum Value.")] uint32 MaxValu=
e;
> > +  };
> > +
> > +  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description=
("LENOVO CAPABILITY DATA 02"), guid("{bbf1f790-6c2f-422b-bc8c-4e7369c7f6ab}=
")]
> > +  class LENOVO_CAPABILITY_DATA_02 {
> > +    [key, read] string InstanceName;
> > +    [read] boolean Active;
> > +
> > +    [WmiDataId(1), read, Description(" IDs.")] uint32 IDs;
> > +    [WmiDataId(2), read, Description("Capability.")] uint32 Capability=
;
> > +    [WmiDataId(3), read, Description("Data Size.")] uint32 DataSize;
> > +    [WmiDataId(4), read, Description("Default Value"), WmiSizeIs("Data=
Size")] uint8 DefaultValue[];
> > +  };
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 1afd30d00aec..675f4b26426d 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -13158,6 +13158,13 @@ S:   Maintained
> >   W:  http://legousb.sourceforge.net/
> >   F:  drivers/usb/misc/legousbtower.c
> >
> > +LENOVO WMI DRIVERS
> > +M:   Derek J. Clark <derekjohn.clark@gmail.com>
> > +L:   platform-driver-x86@vger.kernel.org
> > +S:   Maintained
> > +F:   Documentation/wmi/devices/lenovo-wmi-gamezone.rst
> > +F:   Documentation/wmi/devices/lenovo-wmi-other.rst
> > +
> >   LENOVO WMI HOTKEY UTILITIES DRIVER
> >   M:  Jackie Dong <xy-jackie@139.com>
> >   L:  platform-driver-x86@vger.kernel.org
