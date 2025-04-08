Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FC4246348;
	Tue,  8 Apr 2025 01:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744075711; cv=none; b=KeHNZnkf5eUcJtv/B8p8TxMNBtYfMhHgL1LgV7ahbgvM77300pjw6z89U/gmPK8PLJ47Vx84tTXgcT2FJZKzekoAKdyoO4r5vUKLH3zbi47JwCMKgjll+xlWJqs1RmKxebTPYyAmO7ZXknacHJzlk8q1ld0XMOwBbBUX0WP73mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744075711; c=relaxed/simple;
	bh=3FkIdlqFugDHZWH3s0we5Xow5hZweujHLBxEMHL0czM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OubptUDWbh1TitOBnWmgWoeCprVPmGjdKffaAHdvgAQVYMBQoRL674kFA5JPmiuL+ADCrf9SlHiZwzFyGfvNnZxBEQuRqwB844VSp8rdMiwmH4SpxrtWSXeMPSJH+VcrtY4RyfEGYhakfbLLKWLIEh/e3pPW1YPH6U9wQAEEk2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nq5kkvvx; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nq5kkvvx"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-af51e820336so4679516a12.1;
        Mon, 07 Apr 2025 18:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744075709; x=1744680509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ffBUxhJJO8Wj5J5xDbXwSYiLrQjKHTIlQfc8rR9n5o=;
        b=nq5kkvvxdpc4fnd+GG9P+1/RF0bC3w12GdI1QMKHeyXDZdVudVp1fgwMPHzEiPNjCC
         MgYlgJUkQNan6IbHxu3WTXbM7st/IPwBYWxyCiwnOG498y2G88gg+89WPOTX/2BNwrkR
         mGfm36lKqScQ6v9eiFL5PN9fHSux8e108iw1MOAUjMHC7pSwurtmVJ1spXRnSFeojy1Y
         9oBZJbPHcVsrsskaB8xPNfWbYUbitCnWQnpv9NTm+6ZTv7SwZFaSrHpc2g6aaOIqk+k0
         RbbZK4wNjZLF1ge6rgZlyoCcpAmuJ6FUYN3xEfdSe9qq9/iGtKC4g8ehN4yK3hzZ/CHv
         Bp+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744075709; x=1744680509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3ffBUxhJJO8Wj5J5xDbXwSYiLrQjKHTIlQfc8rR9n5o=;
        b=WKeZjdUgXd0Z+YvGb8+hz+CJhKK7v45CQ8CYIOXXLX67MnGxZVyLf9JEFCJmZLZ8tT
         OdqsdjzBdZ/s5P0x5G9td+Yqfb+DI4wPpSXfyHZMrr5UE8tdEox0nUzSUuxkZRjg+ItD
         EI6IY2bv/NmEproodTUtIgbbGXsfFjJ/hBWaQ/gtQjY0Px/JYdiLgmDvprGucYHjM74e
         FdvSPBRuCDXjCo5pbCRmDU9Ah/toKJ9I+JCOtQqFSSZE8EJDqiiihVt0c7b39DK7eLBU
         jhZ4rTapnTMjuti4IMaP/b6x8l56pv03/XRBNFiNuc4pY3YC0lXd+D9qwv3ZmBpEWtSt
         squg==
X-Forwarded-Encrypted: i=1; AJvYcCWS4tQjDh0STKV4BXjm7vNH1dODi3QskTPU5J7+goIr8alYFqzbw0o/+udW3J9k+TSAe2pUt8AIGp8=@vger.kernel.org, AJvYcCX0HQByldUc6pZSmisjME1Z51Gq/EiD8eTT2QBYiyL56zRSoFdC4lNqrFxUIJZxp0c15hjqZzcSFqRQoJWPulU94UAAag==@vger.kernel.org, AJvYcCXJUVnYKT0I5yqBxN+X/mzVWz5Er6j89287Kz/xr6/op0JJck9/fzOFZCnAtt5Y+L8ed2XJPSdZqeZY2vg5@vger.kernel.org
X-Gm-Message-State: AOJu0YwB9fxt/Iy4B/P9Blhpwa1xXFvJnjyL7wjIzB3EvztH0xYVVa8L
	dsb1DeoSpbc5bxKL92RnD79g6QKU7lXlcUUkhgYxuDWVMeyHVnt0
X-Gm-Gg: ASbGncu4xEmdIYCWPWKZYITgowj/4ey2/xgQKt0QYHtHoqtMHSTmydS4uhY+552mvC0
	3Gta2xFZTZyxl8Bf1mSV3QHTOhM/xXU4k93UmvFoD5szXuigr+jzZIp+h/zR4raBpiJUeIo+wz+
	ka5sx5zwm7atpjbeqR+ka848y7zaBDAy2v9RwF2bruSIO0ZINdWVJkjHNx0hsC6inYIfvDzUgjN
	Vt1eMHuMfTihjAFYRm0SBVFafrGtciwJAuljph9YwP6UpM1U8YEsrVo/EYxFM027Yd0Wi85dIsN
	yhvxhkVDpqafr/LYzQDuZaypbiLR9PvgomG03NTSj454C04kp0nM00dNXhnbOh4jQb8TAC2cJBC
	kcsBqSrYkQd3w+PVY9U8dhvoLNFe4JF4xI3yPqZFWkJc=
X-Google-Smtp-Source: AGHT+IGw03iUxPardgCkPjqol170uVJDmcqPtZ2bPGzZFsaH3b0OCen01jnNWdclmZasNxl0J1DYlg==
X-Received: by 2002:a17:902:e5d1:b0:227:e74a:a057 with SMTP id d9443c01a7336-22a95589520mr169093075ad.44.1744075708510;
        Mon, 07 Apr 2025 18:28:28 -0700 (PDT)
Received: from localhost.localdomain (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785c39c1sm87901255ad.85.2025.04.07.18.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 18:28:28 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Armin Wolf <W_Armin@gmx.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Mario Limonciello <superm1@kernel.org>,
	Luke Jones <luke@ljones.dev>,
	Xino Ni <nijs1@lenovo.com>,
	Zhixin Zhang <zhangzx36@lenovo.com>,
	Mia Shao <shaohz1@lenovo.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	"Cody T . -H . Chiu" <codyit@gmail.com>,
	John Martens <johnfanv2@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH v5 1/6] platform/x86: Add lenovo-wmi-* driver Documentation
Date: Mon,  7 Apr 2025 18:28:10 -0700
Message-ID: <20250408012815.1032357-2-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250408012815.1032357-1-derekjohn.clark@gmail.com>
References: <20250408012815.1032357-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds documentation for new lenovo-wmi drivers.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
v5:
 - Fix extra spaces in lenovo-wmi-gamezone.rst.
 - Fix monospace for GUID's.
v4:
 - Fixed MOF formatting issues.
 - Fixed spelling mistakes.
 - Updated description of balanced-performance profile for Gamezone.
 - Updated description of thermal mode event GUID for Gamezone.
v3:
- Split documentation into multiple files, one for each parent
  driver for the Gamezone and Other Mode WMI interfaces.
- Add MOF data for all parent and child interfaces.
- Remove lenovo-wmi-camera.c driver from v2 documentation.
v2:
- Update description of Custom Profile to include the need to manually
  set it.
- Remove all references to Legion hardware.
- Add section for lenovo-wmi-camera.c driver as it follows the same
  naming convention.
---
 .../wmi/devices/lenovo-wmi-gamezone.rst       | 202 ++++++++++++++++++
 .../wmi/devices/lenovo-wmi-other-method.rst   | 108 ++++++++++
 MAINTAINERS                                   |   7 +
 3 files changed, 317 insertions(+)
 create mode 100644 Documentation/wmi/devices/lenovo-wmi-gamezone.rst
 create mode 100644 Documentation/wmi/devices/lenovo-wmi-other-method.rst

diff --git a/Documentation/wmi/devices/lenovo-wmi-gamezone.rst b/Documentation/wmi/devices/lenovo-wmi-gamezone.rst
new file mode 100644
index 000000000000..ec4130c4d490
--- /dev/null
+++ b/Documentation/wmi/devices/lenovo-wmi-gamezone.rst
@@ -0,0 +1,202 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+==========================================================
+Lenovo WMI Interface Gamezone Driver (lenovo-wmi-gamezone)
+==========================================================
+
+Introduction
+============
+The Lenovo WMI gamezone interface is broken up into multiple GUIDs,
+The priamry "Gamezone" GUID provides advanced features such as fan
+profiles and overclocking. It is paired with multiple event GUIDs
+and data block GUIDs that provide context for the various methods.
+
+Gamezone Data
+-------------
+
+WMI GUID ``887B54E3-DDDC-4B2C-8B88-68A26A8835D0``
+
+The Gamezone Data WMI interface provides platform-profile and fan curve
+settings for devices that fall under the "Gaming Series" of Lenovo devices.
+It uses a notifier chain to inform other Lenovo WMI interface drivers of the
+current platform profile when it changes.
+
+The following platform profiles are supported:
+ - low-power
+ - balanced
+ - balanced-performance*
+ - performance
+ - custom
+
+Balanced-Performance
+~~~~~~~~~~~~~~~~~~~~
+Some newer Lenovo "Gaming Series" laptops have an "Extreme Mode" profile
+enabled in their BIOS. For these devices, the performance platform profile
+will correspond to the BIOS Extreme Mode, while the balanced-performance
+platform profile will correspond to the BIOS Performance mode. For legacy
+devices, the performance platform profile will correspond with the BIOS
+Performance mode. For some newer devices the "Extreme Mode" profile is
+incomplete in the BIOS and setting it will cause undefined behavior. A
+BIOS bug quirk table is provided to ensure these devices cannot set
+"Extreme Mode" from the driver.
+
+Custom Profile
+~~~~~~~~~~~~~~
+The custom profile represents a hardware mode on Lenovo devices that enables
+user modifications to Package Power Tracking (PPT) and fan curve settings.
+When an attribute exposed by the Other Mode WMI interface is to be modified,
+the Gamezone driver must first be switched to the "custom" profile manually,
+or the setting will have no effect. If another profile is set from the list
+of supported profiles, the BIOS will override any user PPT settings when
+switching to that profile.
+
+Gamezone Thermal Mode Event
+---------------------------
+
+WMI GUID ``D320289E-8FEA-41E0-86F9-911D83151B5F``
+
+The Gamezone Thermal Mode Event interface notifies the system when the platform
+profile has changed, either through the hardware event (Fn+Q for laptops or
+Legion + Y for Go Series), or through the Gamezone WMI interface. This event is
+implemented in the Lenovo WMI Events driver (lenovo-wmi-events).
+
+
+WMI interface description
+=========================
+
+The WMI interface description can be decoded from the embedded binary MOF (bmof)
+data using the `bmfdec <https://github.com/pali/bmfdec>`_ utility:
+
+::
+
+  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description("LENOVO_GAMEZONE_DATA class"), guid("{887B54E3-DDDC-4B2C-8B88-68A26A8835D0}")]
+  class LENOVO_GAMEZONE_DATA {
+    [key, read] string InstanceName;
+    [read] boolean Active;
+
+    [WmiMethodId(4), Implemented, Description("Is SupportGpu OverClock")] void IsSupportGpuOC([out, Description("Is SupportGpu OverClock")] uint32 Data);
+    [WmiMethodId(11), Implemented, Description("Get AslCode Version")] void GetVersion ([out, Description("AslCode version")] UINT32 Data);
+    [WmiMethodId(12), Implemented, Description("Fan cooling capability")] void IsSupportFanCooling([out, Description("Fan cooling capability")] UINT32 Data);
+    [WmiMethodId(13), Implemented, Description("Set Fan cooling on/off")] void SetFanCooling ([in, Description("Set Fan cooling on/off")] UINT32 Data);
+    [WmiMethodId(14), Implemented, Description("cpu oc capability")] void IsSupportCpuOC ([out, Description("cpu oc capability")] UINT32 Data);
+    [WmiMethodId(15), Implemented, Description("bios has overclock capability")] void IsBIOSSupportOC ([out, Description("bios has overclock capability")] UINT32 Data);
+    [WmiMethodId(16), Implemented, Description("enable or disable overclock in bios")] void SetBIOSOC ([in, Description("enable or disable overclock in bios")] UINT32 Data);
+    [WmiMethodId(18), Implemented, Description("Get CPU temperature")] void GetCPUTemp ([out, Description("Get CPU temperature")] UINT32 Data);
+    [WmiMethodId(19), Implemented, Description("Get GPU temperature")] void GetGPUTemp ([out, Description("Get GPU temperature")] UINT32 Data);
+    [WmiMethodId(20), Implemented, Description("Get Fan cooling on/off status")] void GetFanCoolingStatus ([out, Description("Get Fan cooling on/off status")] UINT32 Data);
+    [WmiMethodId(21), Implemented, Description("EC support disable windows key capability")] void IsSupportDisableWinKey ([out, Description("EC support disable windows key capability")] UINT32 Data);
+    [WmiMethodId(22), Implemented, Description("Set windows key disable/enable")] void SetWinKeyStatus ([in, Description("Set windows key disable/enable")] UINT32 Data);
+    [WmiMethodId(23), Implemented, Description("Get windows key disable/enable status")] void GetWinKeyStatus ([out, Description("Get windows key disable/enable status")] UINT32 Data);
+    [WmiMethodId(24), Implemented, Description("EC support disable touchpad capability")] void IsSupportDisableTP ([out, Description("EC support disable touchpad capability")] UINT32 Data);
+    [WmiMethodId(25), Implemented, Description("Set touchpad disable/enable")] void SetTPStatus ([in, Description("Set touchpad disable/enable")] UINT32 Data);
+    [WmiMethodId(26), Implemented, Description("Get touchpad disable/enable status")] void GetTPStatus ([out, Description("Get touchpad disable/enable status")] UINT32 Data);
+    [WmiMethodId(30), Implemented, Description("Get Keyboard feature list")] void GetKeyboardfeaturelist ([out, Description("Get Keyboard feature list")] UINT32 Data);
+    [WmiMethodId(31), Implemented, Description("Get Memory OC Information")] void GetMemoryOCInfo ([out, Description("Get Memory OC Information")] UINT32 Data);
+    [WmiMethodId(32), Implemented, Description("Water Cooling feature capability")] void IsSupportWaterCooling ([out, Description("Water Cooling feature capability")] UINT32 Data);
+    [WmiMethodId(33), Implemented, Description("Set Water Cooling status")] void SetWaterCoolingStatus ([in, Description("Set Water Cooling status")] UINT32 Data);
+    [WmiMethodId(34), Implemented, Description("Get Water Cooling status")] void GetWaterCoolingStatus ([out, Description("Get Water Cooling status")] UINT32 Data);
+    [WmiMethodId(35), Implemented, Description("Lighting feature capability")] void IsSupportLightingFeature ([out, Description("Lighting feature capability")] UINT32 Data);
+    [WmiMethodId(36), Implemented, Description("Set keyboard light off or on to max")] void SetKeyboardLight ([in, Description("keyboard light off or on switch")] UINT32 Data);
+    [WmiMethodId(37), Implemented, Description("Get keyboard light on/off status")] void GetKeyboardLight ([out, Description("Get keyboard light on/off status")] UINT32 Data);
+    [WmiMethodId(38), Implemented, Description("Get Macrokey scan code")] void GetMacrokeyScancode ([in, Description("Macrokey index")] UINT32 idx, [out, Description("Scan code")] UINT32 scancode);
+    [WmiMethodId(39), Implemented, Description("Get Macrokey count")] void GetMacrokeyCount ([out, Description("Macrokey count")] UINT32 Data);
+    [WmiMethodId(40), Implemented, Description("Support G-Sync feature")] void IsSupportGSync ([out, Description("Support G-Sync feature")] UINT32 Data);
+    [WmiMethodId(41), Implemented, Description("Get G-Sync Status")] void GetGSyncStatus ([out, Description("Get G-Sync Status")] UINT32 Data);
+    [WmiMethodId(42), Implemented, Description("Set G-Sync Status")] void SetGSyncStatus ([in, Description("Set G-Sync Status")] UINT32 Data);
+    [WmiMethodId(43), Implemented, Description("Support Smart Fan feature")] void IsSupportSmartFan ([out, Description("Support Smart Fan feature")] UINT32 Data);
+    [WmiMethodId(44), Implemented, Description("Set Smart Fan Mode")] void SetSmartFanMode ([in, Description("Set Smart Fan Mode")] UINT32 Data);
+    [WmiMethodId(45), Implemented, Description("Get Smart Fan Mode")] void GetSmartFanMode ([out, Description("Get Smart Fan Mode")] UINT32 Data);
+    [WmiMethodId(46), Implemented, Description("Get Smart Fan Setting Mode")] void GetSmartFanSetting ([out, Description("Get Smart Setting Mode")] UINT32 Data);
+    [WmiMethodId(47), Implemented, Description("Get Power Charge Mode")] void GetPowerChargeMode ([out, Description("Get Power Charge Mode")] UINT32 Data);
+    [WmiMethodId(48), Implemented, Description("Get Gaming Product Info")] void GetProductInfo ([out, Description("Get Gaming Product Info")] UINT32 Data);
+    [WmiMethodId(49), Implemented, Description("Over Drive feature capability")] void IsSupportOD ([out, Description("Over Drive feature capability")] UINT32 Data);
+    [WmiMethodId(50), Implemented, Description("Get Over Drive status")] void GetODStatus ([out, Description("Get Over Drive status")] UINT32 Data);
+    [WmiMethodId(51), Implemented, Description("Set Over Drive status")] void SetODStatus ([in, Description("Set Over Drive status")] UINT32 Data);
+    [WmiMethodId(52), Implemented, Description("Set Light Control Owner")] void SetLightControlOwner ([in, Description("Set Light Control Owner")] UINT32 Data);
+    [WmiMethodId(53), Implemented, Description("Set DDS Control Owner")] void SetDDSControlOwner ([in, Description("Set DDS Control Owner")] UINT32 Data);
+    [WmiMethodId(54), Implemented, Description("Get the flag of restore OC value")] void IsRestoreOCValue ([in, Description("Clean this flag")] UINT32 idx, [out, Description("Restore oc value flag")] UINT32 Data);
+    [WmiMethodId(55), Implemented, Description("Get Real Thremal Mode")] void GetThermalMode ([out, Description("Real Thremal Mode")] UINT32 Data);
+    [WmiMethodId(56), Implemented, Description("Get the OC switch status in BIOS")] void GetBIOSOCMode ([out, Description("OC Mode")] UINT32 Data);
+    [WmiMethodId(59), Implemented, Description("Get hardware info support version")] void GetHardwareInfoSupportVersion ([out, Description("version")] UINT32 Data);
+    [WmiMethodId(60), Implemented, Description("Get Cpu core 0 max frequency")] void GetCpuFrequency ([out, Description("frequency")] UINT32 Data);
+    [WmiMethodId(62), Implemented, Description("Check the Adapter type fit for OC")] void IsACFitForOC ([out, Description("AC check result")] UINT32 Data);
+    [WmiMethodId(63), Implemented, Description("Is support IGPU mode")] void IsSupportIGPUMode ([out, Description("IGPU modes")] UINT32 Data);
+    [WmiMethodId(64), Implemented, Description("Get IGPU Mode Status")] void GetIGPUModeStatus([out, Description("IGPU Mode Status")] UINT32 Data);
+    [WmiMethodId(65), Implemented, Description("Set IGPU Mode")] void SetIGPUModeStatus([in, Description("IGPU Mode")] UINT32 mode, [out, Description("return code")] UINT32 Data);
+    [WmiMethodId(66), Implemented, Description("Notify DGPU Status")] void NotifyDGPUStatus([in, Description("DGPU status")] UINT32 status, [out, Description("return code")] UINT32 Data);
+    [WmiMethodId(67), Implemented, Description("Is changed Y log")] void IsChangedYLog([out, Description("Is changed Y Log")] UINT32 Data);
+    [WmiMethodId(68), Implemented, Description("Get DGPU Hardwawre ID")] void GetDGPUHWId([out, Description("Get DGPU Hardware ID")] string Data);
+  };
+
+  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description("Definition of CPU OC parameter list"), guid("{B7F3CA0A-ACDC-42D2-9217-77C6C628FBD2}")]
+  class LENOVO_GAMEZONE_CPU_OC_DATA {
+    [key, read] string InstanceName;
+    [read] boolean Active;
+
+    [WmiDataId(1), read, Description("OC tune id.")] uint32 Tuneid;
+    [WmiDataId(2), read, Description("Default value.")] uint32 DefaultValue;
+    [WmiDataId(3), read, Description("OC Value.")] uint32 OCValue;
+    [WmiDataId(4), read, Description("Min Value.")] uint32 MinValue;
+    [WmiDataId(5), read, Description("Max Value.")] uint32 MaxValue;
+    [WmiDataId(6), read, Description("Scale Value.")] uint32 ScaleValue;
+    [WmiDataId(7), read, Description("OC Order id.")] uint32 OCOrderid;
+    [WmiDataId(8), read, Description("NON-OC Order id.")] uint32 NOCOrderid;
+    [WmiDataId(9), read, Description("Delay time in ms.")] uint32 Interval;
+  };
+
+  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description("Definition of GPU OC parameter list"), guid("{887B54E2-DDDC-4B2C-8B88-68A26A8835D0}")]
+  class LENOVO_GAMEZONE_GPU_OC_DATA {
+    [key, read] string InstanceName;
+    [read] boolean Active;
+
+    [WmiDataId(1), read, Description("P-State ID.")] uint32 PStateID;
+    [WmiDataId(2), read, Description("CLOCK ID.")] uint32 ClockID;
+    [WmiDataId(3), read, Description("Default value.")] uint32 defaultvalue;
+    [WmiDataId(4), read, Description("OC Offset freqency.")] uint32 OCOffsetFreq;
+    [WmiDataId(5), read, Description("OC Min offset value.")] uint32 OCMinOffset;
+    [WmiDataId(6), read, Description("OC Max offset value.")] uint32 OCMaxOffset;
+    [WmiDataId(7), read, Description("OC Offset Scale.")] uint32 OCOffsetScale;
+    [WmiDataId(8), read, Description("OC Order id.")] uint32 OCOrderid;
+    [WmiDataId(9), read, Description("NON-OC Order id.")] uint32 NOCOrderid;
+  };
+
+  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description("Fancooling finish event"), guid("{BC72A435-E8C1-4275-B3E2-D8B8074ABA59}")]
+  class LENOVO_GAMEZONE_FAN_COOLING_EVENT: WMIEvent {
+    [key, read] string InstanceName;
+    [read] boolean Active;
+
+    [WmiDataId(1), read, Description("Fancooling clean finish event")] uint32 EventId;
+  };
+
+  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description("Smart Fan mode change event"), guid("{D320289E-8FEA-41E0-86F9-611D83151B5F}")]
+  class LENOVO_GAMEZONE_SMART_FAN_MODE_EVENT: WMIEvent {
+    [key, read] string InstanceName;
+    [read] boolean Active;
+
+    [WmiDataId(1), read, Description("Smart Fan Mode change event")] uint32 mode;
+    [WmiDataId(2), read, Description("version of FN+Q")] uint32 version;
+  };
+
+  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description("Smart Fan setting mode change event"), guid("{D320289E-8FEA-41E1-86F9-611D83151B5F}")]
+  class LENOVO_GAMEZONE_SMART_FAN_SETTING_EVENT: WMIEvent {
+    [key, read] string InstanceName;
+    [read] boolean Active;
+
+    [WmiDataId(1), read, Description("Smart Fan Setting mode change event")] uint32 mode;
+  };
+
+  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description("POWER CHARGE MODE Change EVENT"), guid("{D320289E-8FEA-41E0-86F9-711D83151B5F}")]
+  class LENOVO_GAMEZONE_POWER_CHARGE_MODE_EVENT: WMIEvent {
+    [key, read] string InstanceName;
+    [read] boolean Active;
+
+    [WmiDataId(1), read, Description("POWER CHARGE MODE Change EVENT")] uint32 mode;
+  };
+
+  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description("Thermal Mode Real Mode change event"), guid("{D320289E-8FEA-41E0-86F9-911D83151B5F}")]
+  class LENOVO_GAMEZONE_THERMAL_MODE_EVENT: WMIEvent {
+    [key, read] string InstanceName;
+    [read] boolean Active;
+
+    [WmiDataId(1), read, Description("Thermal Mode Real Mode")] uint32 mode;
+  };
diff --git a/Documentation/wmi/devices/lenovo-wmi-other-method.rst b/Documentation/wmi/devices/lenovo-wmi-other-method.rst
new file mode 100644
index 000000000000..d7928b8dfb4b
--- /dev/null
+++ b/Documentation/wmi/devices/lenovo-wmi-other-method.rst
@@ -0,0 +1,108 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+===========================================================
+Lenovo WMI Interface Other Mode Driver (lenovo-wmi-other)
+===========================================================
+
+Introduction
+============
+Lenovo WMI Other Mode interface is broken up into multiple GUIDs,
+The primary Other Mode interface provides advanced power tuning features
+such as Package Power Tracking (PPT). It is paired with multiple data block
+GUIDs that provide context for the various methods.
+
+
+Other Mode
+----------
+
+WMI GUID ``DC2A8805-3A8C-41BA-A6F7-092E0089CD3B``
+
+The Other Mode WMI interface uses the firmware_attributes class to expose
+various WMI attributes provided by the interface in the sysfs. This enables
+CPU and GPU power limit tuning as well as various other attributes for
+devices that fall under the "Gaming Series" of Lenovo devices. Each
+attribute exposed by the Other Mode interface has corresponding
+capability data blocks which allow the driver to probe details about the
+attribute. Each attribute has multiple pages, one for each of the platform
+profiles managed by the Gamezone interface. Attributes are exposed in sysfs
+under the following path:
+
+::
+
+  /sys/class/firmware-attributes/lenovo-wmi-other/attributes/<attribute>/
+
+LENOVO_CAPABILITY_DATA_01
+-------------------------
+
+WMI GUID ``7A8F5407-CB67-4D6E-B547-39B3BE018154``
+
+The LENOVO_CAPABILITY_DATA_01 interface provides information on various
+power limits of integrated CPU and GPU components.
+
+Each attribute has the following properties:
+ - current_value
+ - default_value
+ - display_name
+ - max_value
+ - min_value
+ - scalar_increment
+ - type
+
+The following attributes are implemented:
+ - ppt_pl1_spl: Platform Profile Tracking Sustained Power Limit
+ - ppt_pl2_sppt: Platform Profile Tracking Slow Package Power Tracking
+ - ppt_pl3_fppt: Platform Profile Tracking Fast Package Power Tracking
+
+
+WMI interface description
+=========================
+
+The WMI interface description can be decoded from the embedded binary MOF (bmof)
+data using the `bmfdec <https://github.com/pali/bmfdec>`_ utility:
+
+::
+
+  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description("LENOVO_OTHER_METHOD class"), guid("{dc2a8805-3a8c-41ba-a6f7-092e0089cd3b}")]
+  class LENOVO_OTHER_METHOD {
+    [key, read] string InstanceName;
+    [read] boolean Active;
+
+    [WmiMethodId(17), Implemented, Description("Get Feature Value ")] void GetFeatureValue([in] uint32 IDs, [out] uint32 value);
+    [WmiMethodId(18), Implemented, Description("Set Feature Value ")] void SetFeatureValue([in] uint32 IDs, [in] uint32 value);
+    [WmiMethodId(19), Implemented, Description("Get Data By Command ")] void GetDataByCommand([in] uint32 IDs, [in] uint32 Command, [out] uint32 DataSize, [out, WmiSizeIs("DataSize")] uint32 Data[]);
+    [WmiMethodId(99), Implemented, Description("Get Data By Package for TAC")] void GetDataByPackage([in, Max(40)] uint8 Input[], [out] uint32 DataSize, [out, WmiSizeIs("DataSize")] uint8 Data[]);
+  };
+
+  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description("LENOVO CAPABILITY DATA 00"), guid("{362a3afe-3d96-4665-8530-96dad5bb300e}")]
+  class LENOVO_CAPABILITY_DATA_00 {
+    [key, read] string InstanceName;
+    [read] boolean Active;
+
+    [WmiDataId(1), read, Description(" IDs.")] uint32 IDs;
+    [WmiDataId(2), read, Description("Capability.")] uint32 Capability;
+    [WmiDataId(3), read, Description("Capability Default Value.")] uint32 DefaultValue;
+  };
+
+  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description("LENOVO CAPABILITY DATA 01"), guid("{7a8f5407-cb67-4d6e-b547-39b3be018154}")]
+  class LENOVO_CAPABILITY_DATA_01 {
+    [key, read] string InstanceName;
+    [read] boolean Active;
+
+    [WmiDataId(1), read, Description(" IDs.")] uint32 IDs;
+    [WmiDataId(2), read, Description("Capability.")] uint32 Capability;
+    [WmiDataId(3), read, Description("Default Value.")] uint32 DefaultValue;
+    [WmiDataId(4), read, Description("Step.")] uint32 Step;
+    [WmiDataId(5), read, Description("Minimum Value.")] uint32 MinValue;
+    [WmiDataId(6), read, Description("Maximum Value.")] uint32 MaxValue;
+  };
+
+  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description("LENOVO CAPABILITY DATA 02"), guid("{bbf1f790-6c2f-422b-bc8c-4e7369c7f6ab}")]
+  class LENOVO_CAPABILITY_DATA_02 {
+    [key, read] string InstanceName;
+    [read] boolean Active;
+
+    [WmiDataId(1), read, Description(" IDs.")] uint32 IDs;
+    [WmiDataId(2), read, Description("Capability.")] uint32 Capability;
+    [WmiDataId(3), read, Description("Data Size.")] uint32 DataSize;
+    [WmiDataId(4), read, Description("Default Value"), WmiSizeIs("DataSize")] uint8 DefaultValue[];
+  };
diff --git a/MAINTAINERS b/MAINTAINERS
index 1afd30d00aec..675f4b26426d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13158,6 +13158,13 @@ S:	Maintained
 W:	http://legousb.sourceforge.net/
 F:	drivers/usb/misc/legousbtower.c
 
+LENOVO WMI DRIVERS
+M:	Derek J. Clark <derekjohn.clark@gmail.com>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	Documentation/wmi/devices/lenovo-wmi-gamezone.rst
+F:	Documentation/wmi/devices/lenovo-wmi-other.rst
+
 LENOVO WMI HOTKEY UTILITIES DRIVER
 M:	Jackie Dong <xy-jackie@139.com>
 L:	platform-driver-x86@vger.kernel.org
-- 
2.49.0

