Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667EC1FC0EA;
	Mon,  3 Feb 2025 06:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738563810; cv=none; b=b6orWI2gWcSELguGrWnx4Unb+BOJxWMw8vnMh5lsqOk2c26ma07/S2ceajJtowM6K6DzsvJWdOSjznBl5Qg9/stgB/nPzYVNDhNhGknm7OtOCRuF3j/Inn6t1S5nOD7dtufl2PMi4HNb8vHacqqoJ6G8j01neIHYxOfENxdFsok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738563810; c=relaxed/simple;
	bh=qpOap77cXjGCFEE7Ib3DtcKq2vg02Aa1BJvEFjtLI1U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z6StpVq9ftftkfTxOz3SKq1P5rg4ige/s5v4OJFEOZrNQKNB/rz/A7y06x/69gRQLqYMqazKmZky4mme12e3gT4+VRFOpMNQKmfcCsrj1PFSv2deK6L2fNo6lFyBUWkhVwxCgh3T3Qc1ua6nXr1EGplOTT9J48xEbdmJ6Q/uATM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nDjQwDXk; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nDjQwDXk"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-517aea3ee2aso2600838e0c.2;
        Sun, 02 Feb 2025 22:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738563807; x=1739168607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9JJ/f/i2YM+KDenChNSxGR+ozsHnFWTtxVHyiGZUle4=;
        b=nDjQwDXkypajDDkjIy150MHF2ZGsWVK4RKqWgUFeWWhfSPlBf9LYFQPmpz2li+56nG
         O0Z4mHxPRsqqXQVv3gsiJ8raBYXyy1b5nSX24e/IbjxIvpeYygJ5mLsRlC0MgsjCpq9j
         JKnIaskvvXTRdexca0K8OPLdt15wBXKH80XENvWT1Ovu8bNJltbZDiqEeqWJ42iphmGc
         NfbJWRwXSlnkQLtIaaY0mPU9W2o6tgTVq6CGVB90Dbxf4ykGN36ckXaqVDlofQvGvEBt
         XlXijQsMEa+4kW9UTaJ+DHR8oVwYPcWfyGanXeUnXsWBKjkd1z0Q/w7AATZr0CuE8lZd
         EPYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738563807; x=1739168607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9JJ/f/i2YM+KDenChNSxGR+ozsHnFWTtxVHyiGZUle4=;
        b=iOE5XTr8mX4ktYrHa6ujnzevHspHnMm+cfSlQg+LJlOZ2PEu0weP+4Eor77x+hv9DN
         Uxd6YAin/5MIXuv/PBn4grnpTzQ58bMoJOSt0jr26jhsSctHMPZycw+eQ+TWPSfvmL8R
         CEX8zNMR2pBuvFvKKqUYXtmJn763JH4Il8vglxjYnEru8MWyseIuTsAujCVAU5PodpKY
         movHyWPNNMDpWvhuG7ifln2uDp24f5UiVVsJseYQFIRg9Slf7SEoy00b1/F/7CM7DEO3
         Oh5lBRRahlRGrOGw9XMieEVDB05vNgErERoRWLbhAfRPdl3NMoxwi7fxD0dQy9U3CyCm
         LGjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmMjDCOXUBBtre86ZW8kDSrfAfoeCAfqzWCNGxqxSdAZAVHmFJVJ8jyEwDVp2JJFP2C2nlxb/EeexgECQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLuGmQWuIlCmuHvpIijxJdbwopqpYZeySvIVmLCErm8txFRTzX
	GC1X75S2zUrhWxefS5XkgkAbbvSVmY/IpHzSSWkBkswRaLBG1qX+O5pXVg==
X-Gm-Gg: ASbGncsmYt8tVWRgzy4+VhzzvBFWbnu7LCbWf5wFmPPtufNuC08mg0oaSHofLtNdHc6
	V4s8YQhW2kYEvwFv1QAaYl/M0JUc0tFWog8V59AhTqTOxghlME6kgJF6BtrucxjWIGHwveoOI85
	u41FoiyYPNXDRR+H7SEhlSTYyhvCdWCXRz2jdTUfPTZK9VCCrKqwDS62VsARfpIUzgYT3kBIehM
	IuhyHVi06685yGxHiIPK+QjYcQJj/PUQ5JZpsmnmZgrOJoTakui7/I0eT9awiRxSxmrWKnOJvOh
	eYOKo1SCHTbxz2GrevABCeM=
X-Google-Smtp-Source: AGHT+IEbLUFVhtukrpPM+aBAq7WHKeM75HoYlCQCloL9atLDyhXOv7DCCoQ0ywFmt8TlFC5TXqSvzQ==
X-Received: by 2002:a05:6122:348a:b0:51e:20de:f9f2 with SMTP id 71dfb90a1353d-51e9e3f6a45mr15712121e0c.6.1738563806972;
        Sun, 02 Feb 2025 22:23:26 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:3d2:4207:a956:ebad:2a64])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51eb1d64c20sm1138789e0c.32.2025.02.02.22.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 22:23:26 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	"Kurt Borja" <kuurtb@gmail.com>
Subject: [PATCH v7 13/14] platform/x86: Update alienware-wmi config entries
Date: Mon,  3 Feb 2025 01:20:54 -0500
Message-ID: <20250203062055.2915-14-kuurtb@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250203062055.2915-1-kuurtb@gmail.com>
References: <20250203062055.2915-1-kuurtb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add config entries for each WMI driver managed by the alienware-wmi
module to be able to conditionally compile them.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/Kconfig         | 30 +++++++++++++++++++----
 drivers/platform/x86/dell/Makefile        |  4 +--
 drivers/platform/x86/dell/alienware-wmi.h | 23 +++++++++++++++++
 3 files changed, 50 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/dell/Kconfig b/drivers/platform/x86/dell/Kconfig
index d09060aedd3f..f8a0dffcaab7 100644
--- a/drivers/platform/x86/dell/Kconfig
+++ b/drivers/platform/x86/dell/Kconfig
@@ -18,15 +18,35 @@ config ALIENWARE_WMI
 	tristate "Alienware Special feature control"
 	default m
 	depends on ACPI
+	depends on ACPI_WMI
+	depends on DMI
 	depends on LEDS_CLASS
 	depends on NEW_LEDS
-	depends on ACPI_WMI
+	help
+	 This is a driver for controlling Alienware WMI driven features.
+
+	 On legacy devices, it exposes an interface for controlling the AlienFX
+	 zones on Alienware machines that don't contain a dedicated
+	 AlienFX USB MCU such as the X51 and X51-R2.
+
+	 On newer devices, it exposes the AWCC thermal control interface through
+	 known Kernel APIs.
+
+config ALIENWARE_WMI_LEGACY
+	bool "Alienware Legacy WMI device driver"
+	default y
+	depends on ALIENWARE_WMI
+	help
+	 Legacy Alienware WMI driver with AlienFX LED control capabilities.
+
+config ALIENWARE_WMI_WMAX
+	bool "Alienware WMAX WMI device driver"
+	default y
+	depends on ALIENWARE_WMI
 	select ACPI_PLATFORM_PROFILE
 	help
-	 This is a driver for controlling Alienware BIOS driven
-	 features.  It exposes an interface for controlling the AlienFX
-	 zones on Alienware machines that don't contain a dedicated AlienFX
-	 USB MCU such as the X51 and X51-R2.
+	 Alienware WMI driver with AlienFX LED, HDMI, amplifier, deep sleep and
+	 AWCC thermal control capabilities.
 
 config DCDBAS
 	tristate "Dell Systems Management Base Driver"
diff --git a/drivers/platform/x86/dell/Makefile b/drivers/platform/x86/dell/Makefile
index d5718ef34c48..8ac9a933c770 100644
--- a/drivers/platform/x86/dell/Makefile
+++ b/drivers/platform/x86/dell/Makefile
@@ -6,8 +6,8 @@
 
 obj-$(CONFIG_ALIENWARE_WMI)			+= alienware-wmi.o
 alienware-wmi-objs				:= alienware-wmi-base.o
-alienware-wmi-y					+= alienware-wmi-legacy.o
-alienware-wmi-y					+= alienware-wmi-wmax.o
+alienware-wmi-$(CONFIG_ALIENWARE_WMI_LEGACY)	+= alienware-wmi-legacy.o
+alienware-wmi-$(CONFIG_ALIENWARE_WMI_WMAX)	+= alienware-wmi-wmax.o
 obj-$(CONFIG_DCDBAS)				+= dcdbas.o
 obj-$(CONFIG_DELL_LAPTOP)			+= dell-laptop.o
 obj-$(CONFIG_DELL_RBTN)				+= dell-rbtn.o
diff --git a/drivers/platform/x86/dell/alienware-wmi.h b/drivers/platform/x86/dell/alienware-wmi.h
index 39a2597b2fee..ca1ddaa74ad1 100644
--- a/drivers/platform/x86/dell/alienware-wmi.h
+++ b/drivers/platform/x86/dell/alienware-wmi.h
@@ -69,10 +69,33 @@ int alienware_wmi_command(struct wmi_device *wdev, u32 method_id,
 
 int alienware_alienfx_setup(struct alienfx_platdata *pdata);
 
+#if IS_ENABLED(CONFIG_ALIENWARE_WMI_LEGACY)
 int __init alienware_legacy_wmi_init(void);
 void __exit alienware_legacy_wmi_exit(void);
+#else
+static inline int alienware_legacy_wmi_init(void)
+{
+	return -ENODEV;
+}
+
+static inline void alienware_legacy_wmi_exit(void)
+{
+}
+#endif
 
+#if IS_ENABLED(CONFIG_ALIENWARE_WMI_WMAX)
 int __init alienware_wmax_wmi_init(void);
 void __exit alienware_wmax_wmi_exit(void);
+#else
+static inline int alienware_wmax_wmi_init(void)
+{
+	return -ENODEV;
+}
+
+
+static inline void alienware_wmax_wmi_exit(void)
+{
+}
+#endif
 
 #endif
-- 
2.48.1

