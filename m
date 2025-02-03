Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4101D6DBB;
	Mon,  3 Feb 2025 06:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738563800; cv=none; b=ovJEUZzj4h4ZPxZgTCUufOet4rjXUMGbZvZvxbOyOlYFAtAWnNZJ8zfnJ7Y66mI6xO6YoVm+r5j52OzF/FhUEVjODg+ayt5pyXfIL5XCnZRPTpjhgN/CuNi/3eBKTzFPCaTKTiPRXMUoC2jF07agYBywiapNU5CbQ+05PQmMrKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738563800; c=relaxed/simple;
	bh=IUfLnQZ8sT0INsTFkaaZ06HR+R9uujr8y1mPJMTy6Fw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iVJXIsZZ4w2iZSnON93utykRHAE6O3hq/O8l9DH/oGotu6Qni4pOUEjXJ/TfApC2Ejvm7Jj5x2/jA1t4ebwGC6cswbO0Zqw+kkW/tObNFbiYXGx/ukJO3bcgsL7iL9O++sk+9i6bAcN2ivhy0GEwTcsfZHat8iFQ41dAUKgWFv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ijsLtTBu; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ijsLtTBu"
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-51eb1a6954cso1175109e0c.0;
        Sun, 02 Feb 2025 22:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738563797; x=1739168597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q/NVGS9TuPPr27z5Yj7VFRKFX5u+0QXnWp1wzELvp+I=;
        b=ijsLtTBu44wez11JmpRDflS/zOZO6gIxUZjR9tNaPDJRiWR7D8GVlHaq+rQa+Uspq0
         emvfYf3xjOKFA6o4NrbSvXlTMrJ2TnZM76qpjkzav8GtZ57q/zPJnP5QG2HNCL3WLa7W
         rB2yBHuXpvfNGU/PKvtTZgMNtc4KzQ9GEO+8EQDZuvGvrekKUg4riZl1bOy3M96ezZ2V
         5Y/rg80dcIoQ1NWLgN+up0SlkeBlyTrVNcqBA6GV8rlGCeCHJgK9bH6PBVXhTdWtU3BL
         qGiKOiz0h7JKkd52U+JOl+4RazgM+LQtt6alv5cX1xl2ia0fk2LQJ/BTDSBqNFoPX5Gm
         2LmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738563797; x=1739168597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q/NVGS9TuPPr27z5Yj7VFRKFX5u+0QXnWp1wzELvp+I=;
        b=TKAB/MVv7ZzxiIGPR7nspeApP7MdHXRCQe00NzdqiQOipxMCZssoOABmzeQpj2IeDx
         Y9JzIjMB0lVc5K4rjky5EIoOp6x+9x0XvwzagbKDdNWaA8kqVHfVLYQsWGRnrZGMobHH
         WrWp/1xU44QFEoJ9xq7gsFUQ6Q0bCDFP9frhm1eh1HzNh2x9CpVaPkyBD4ZbjTVemX8W
         4/sdDb1r/fHzAZP9mg/lwYsz0O6xLvRQjc7kSE08oPwytdl00hB0hjKn5vzliE/mCXFm
         19+cIpzRa/erk/kfjy1PQRIDpkvt/ORcIFKH9/yt+Xn8SMmUpdhzAZ2hoARzdWWPL3nE
         1EZA==
X-Forwarded-Encrypted: i=1; AJvYcCW1ZVYC6aY1ld1GP7xaYl6RNYRQeLXMwZfVgf1AOfEmvJ8GuswZ0I5O09cbbbzpH5W4ha8HhVqrqXHx9aI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQcec6XtFgpi0ipObvnZr3jBQTl/LiPx17eDUJQJRnLa4z/yYR
	aUiDy18PzSlavwO4v04qIBQo3PUyZcabOXMnwuOdb/ICgxmscGVuKEZfUQ==
X-Gm-Gg: ASbGncvs4Bzsfu9oKM5t88yBSmXLpU3eKN5t21BdwzkrcOakwsE8Om+LZ7J+351A9Gs
	Neft9oMvUevF65A7tEqmP6tfD5kIHLi9DQ94FSCznqS4hTtuCpemEuVDYB1ENfyXRSlF64Q/Biq
	Hf8C2VMJT/fZa2QomWUw6He6YpSXthq/fQqRcG1yRvXsW7zWX3qjZwzEtHwMDf3sgvQ+YsvyX4e
	D9vFByA3Z2NATYzj2rZ5q1snRgstVnKGfeMW/tWg8ua/mkvTMaVGJaaGNljFD0LZi8nfhD/IP8b
	aLaw+iZ1GDcTB3hQ04HTYzo=
X-Google-Smtp-Source: AGHT+IFSZ9bVOIxksVOn0uNWzeSUR8XQmnnbAHOXheO/8CssMVKPyyWKL81aodgRPgvZkLDtMjz8mg==
X-Received: by 2002:a05:6122:1821:b0:518:9582:db90 with SMTP id 71dfb90a1353d-51e9e55a408mr14442911e0c.11.1738563796957;
        Sun, 02 Feb 2025 22:23:16 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:3d2:4207:a956:ebad:2a64])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51eb1d64c20sm1138789e0c.32.2025.02.02.22.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 22:23:16 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	"Kurt Borja" <kuurtb@gmail.com>
Subject: [PATCH v7 10/14] platform/x86: Add alienware-wmi.h
Date: Mon,  3 Feb 2025 01:20:51 -0500
Message-ID: <20250203062055.2915-11-kuurtb@gmail.com>
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

Add a header file for alienware-wmi with shared resources to support the
upcoming file split.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 .../platform/x86/dell/alienware-wmi-base.c    | 67 +++-------------
 drivers/platform/x86/dell/alienware-wmi.h     | 78 +++++++++++++++++++
 2 files changed, 87 insertions(+), 58 deletions(-)
 create mode 100644 drivers/platform/x86/dell/alienware-wmi.h

diff --git a/drivers/platform/x86/dell/alienware-wmi-base.c b/drivers/platform/x86/dell/alienware-wmi-base.c
index e426b266239d..6824a79292b7 100644
--- a/drivers/platform/x86/dell/alienware-wmi-base.c
+++ b/drivers/platform/x86/dell/alienware-wmi-base.c
@@ -17,10 +17,7 @@
 #include <linux/dmi.h>
 #include <linux/leds.h>
 #include <linux/wmi.h>
-
-#define LEGACY_CONTROL_GUID		"A90597CE-A997-11DA-B012-B622A1EF5492"
-#define LEGACY_POWER_CONTROL_GUID	"A80593CE-A997-11DA-B012-B622A1EF5492"
-#define WMAX_CONTROL_GUID		"A70591CE-A997-11DA-B012-B622A1EF5492"
+#include "alienware-wmi.h"
 
 #define WMAX_METHOD_HDMI_SOURCE		0x1
 #define WMAX_METHOD_HDMI_STATUS		0x2
@@ -55,18 +52,6 @@ enum INTERFACE_FLAGS {
 	WMAX,
 };
 
-enum LEGACY_CONTROL_STATES {
-	LEGACY_RUNNING = 1,
-	LEGACY_BOOTING = 0,
-	LEGACY_SUSPEND = 3,
-};
-
-enum WMAX_CONTROL_STATES {
-	WMAX_RUNNING = 0xFF,
-	WMAX_BOOTING = 0,
-	WMAX_SUSPEND = 3,
-};
-
 enum WMAX_THERMAL_INFORMATION_OPERATIONS {
 	WMAX_OPERATION_SYS_DESCRIPTION		= 0x02,
 	WMAX_OPERATION_LIST_IDS			= 0x03,
@@ -114,15 +99,7 @@ static const enum platform_profile_option wmax_mode_to_platform_profile[THERMAL_
 	[THERMAL_MODE_BASIC_PERFORMANCE]		= PLATFORM_PROFILE_PERFORMANCE,
 };
 
-struct alienfx_quirks {
-	u8 num_zones;
-	bool hdmi_mux;
-	bool amplifier;
-	bool deepslp;
-};
-
-static struct alienfx_quirks *alienfx;
-
+struct alienfx_quirks *alienfx;
 
 static struct alienfx_quirks quirk_inspiron5675 = {
 	.num_zones = 2,
@@ -246,12 +223,6 @@ static const struct dmi_system_id alienware_quirks[] __initconst = {
 	{}
 };
 
-struct color_platform {
-	u8 blue;
-	u8 green;
-	u8 red;
-} __packed;
-
 struct wmax_brightness_args {
 	u32 led_mask;
 	u32 percentage;
@@ -286,26 +257,6 @@ struct awcc_priv {
 	enum wmax_thermal_mode supported_thermal_profiles[PLATFORM_PROFILE_LAST];
 };
 
-struct alienfx_priv {
-	struct platform_device *pdev;
-	struct led_classdev global_led;
-	struct color_platform colors[4];
-	u8 global_brightness;
-	u8 lighting_control_state;
-};
-
-struct alienfx_ops {
-	int (*upd_led)(struct alienfx_priv *priv, struct wmi_device *wdev,
-		       u8 location);
-	int (*upd_brightness)(struct alienfx_priv *priv, struct wmi_device *wdev,
-			      u8 brightness);
-};
-
-struct alienfx_platdata {
-	struct wmi_device *wdev;
-	struct alienfx_ops ops;
-};
-
 static u8 interface;
 
 struct awcc_quirks {
@@ -418,8 +369,8 @@ static const struct dmi_system_id awcc_dmi_table[] __initconst = {
 
 static struct awcc_quirks *awcc;
 
-static int alienware_wmi_command(struct wmi_device *wdev, u32 method_id,
-				 void *in_args, size_t in_size, u32 *out_data)
+int alienware_wmi_command(struct wmi_device *wdev, u32 method_id,
+			  void *in_args, size_t in_size, u32 *out_data)
 {
 	struct acpi_buffer out = {ACPI_ALLOCATE_BUFFER, NULL};
 	struct acpi_buffer in = {in_size, in_args};
@@ -1165,7 +1116,7 @@ static void alienware_alienfx_remove(void *data)
 	platform_device_unregister(pdev);
 }
 
-static int alienware_alienfx_setup(struct alienfx_platdata *pdata)
+int alienware_alienfx_setup(struct alienfx_platdata *pdata)
 {
 	struct device *dev = &pdata->wdev->dev;
 	struct platform_device *pdev;
@@ -1252,12 +1203,12 @@ static struct wmi_driver alienware_legacy_wmi_driver = {
 	.no_singleton = true,
 };
 
-static int __init alienware_legacy_wmi_init(void)
+int __init alienware_legacy_wmi_init(void)
 {
 	return wmi_driver_register(&alienware_legacy_wmi_driver);
 }
 
-static void __exit alienware_legacy_wmi_exit(void)
+void __exit alienware_legacy_wmi_exit(void)
 {
 	wmi_driver_unregister(&alienware_legacy_wmi_driver);
 }
@@ -1333,7 +1284,7 @@ static struct wmi_driver alienware_wmax_wmi_driver = {
 	.no_singleton = true,
 };
 
-static int __init alienware_wmax_wmi_init(void)
+int __init alienware_wmax_wmi_init(void)
 {
 	const struct dmi_system_id *id;
 
@@ -1358,7 +1309,7 @@ static int __init alienware_wmax_wmi_init(void)
 	return wmi_driver_register(&alienware_wmax_wmi_driver);
 }
 
-static void __exit alienware_wmax_wmi_exit(void)
+void __exit alienware_wmax_wmi_exit(void)
 {
 	wmi_driver_unregister(&alienware_wmax_wmi_driver);
 }
diff --git a/drivers/platform/x86/dell/alienware-wmi.h b/drivers/platform/x86/dell/alienware-wmi.h
new file mode 100644
index 000000000000..39a2597b2fee
--- /dev/null
+++ b/drivers/platform/x86/dell/alienware-wmi.h
@@ -0,0 +1,78 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Alienware WMI special features driver
+ *
+ * Copyright (C) 2014 Dell Inc <Dell.Client.Kernel@dell.com>
+ * Copyright (C) 2024 Kurt Borja <kuurtb@gmail.com>
+ */
+
+#ifndef _ALIENWARE_WMI_H_
+#define _ALIENWARE_WMI_H_
+
+#include <linux/leds.h>
+#include <linux/platform_device.h>
+#include <linux/wmi.h>
+
+#define LEGACY_CONTROL_GUID		"A90597CE-A997-11DA-B012-B622A1EF5492"
+#define LEGACY_POWER_CONTROL_GUID	"A80593CE-A997-11DA-B012-B622A1EF5492"
+#define WMAX_CONTROL_GUID		"A70591CE-A997-11DA-B012-B622A1EF5492"
+
+extern struct alienfx_quirks *alienfx;
+
+enum LEGACY_CONTROL_STATES {
+	LEGACY_RUNNING = 1,
+	LEGACY_BOOTING = 0,
+	LEGACY_SUSPEND = 3,
+};
+
+enum WMAX_CONTROL_STATES {
+	WMAX_RUNNING = 0xFF,
+	WMAX_BOOTING = 0,
+	WMAX_SUSPEND = 3,
+};
+
+struct alienfx_quirks {
+	u8 num_zones;
+	bool hdmi_mux;
+	bool amplifier;
+	bool deepslp;
+};
+
+struct color_platform {
+	u8 blue;
+	u8 green;
+	u8 red;
+} __packed;
+
+struct alienfx_priv {
+	struct platform_device *pdev;
+	struct led_classdev global_led;
+	struct color_platform colors[4];
+	u8 global_brightness;
+	u8 lighting_control_state;
+};
+
+struct alienfx_ops {
+	int (*upd_led)(struct alienfx_priv *priv, struct wmi_device *wdev,
+		       u8 location);
+	int (*upd_brightness)(struct alienfx_priv *priv, struct wmi_device *wdev,
+			      u8 brightness);
+};
+
+struct alienfx_platdata {
+	struct wmi_device *wdev;
+	struct alienfx_ops ops;
+};
+
+int alienware_wmi_command(struct wmi_device *wdev, u32 method_id,
+			  void *in_args, size_t in_size, u32 *out_data);
+
+int alienware_alienfx_setup(struct alienfx_platdata *pdata);
+
+int __init alienware_legacy_wmi_init(void);
+void __exit alienware_legacy_wmi_exit(void);
+
+int __init alienware_wmax_wmi_init(void);
+void __exit alienware_wmax_wmi_exit(void);
+
+#endif
-- 
2.48.1

