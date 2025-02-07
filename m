Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC5522FF50;
	Fri,  7 Feb 2025 14:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738937307; cv=none; b=Tu42C5jbfXg2x4fYlLpa6Wh5LUQAwsvQRkMJ4Kv4p1GDjDkytwukGGrMJLS+QEx4ZcR3VoUYzPIhVeVSrZLGuPzVykjhzN6Buc/+bowRZ4mEqsXvtn0jM/sbAUXZqenrPowjJ5TuvsFKceU0iSBppCYBMtGLCQq4bfJ1HRvXubA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738937307; c=relaxed/simple;
	bh=fHiEhMW/MUAzNqGF+k0nw60BIC1B+41IdC8VtYXtMTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ocy64+b9/Z0elwOm7BGYgIWpfR7UjMjTzXwaENcxqTSWLZCBATQsUxp14SzeD4n3wQrH+pvkMfGNFob+qoqd+sFtoLNDSAvMoWZ+QrRRHBWB35uA/w4iJuHlUUZStRqO9Xephb58UABxSJ+mVdCgmrHl/QRa2bocN7h1SuJ6wHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KRUgkoXt; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KRUgkoXt"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6f6cb364c7fso14894207b3.3;
        Fri, 07 Feb 2025 06:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738937304; x=1739542104; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m3qXBhgYFmwgLXKfxYMj7rB53ypV2bfglBTEP4SO1Kk=;
        b=KRUgkoXtk3BhSzUEloosvsVrD8UBZQVAJkYE5gRun91CcBBeaGg1TCJOGmvaZ8J/Rj
         oiwtXPGSYeiZjzIDpGUzmFMtY+ykhddD13nVtxxqs1ccRGLtgMY94aIcZ6BkvOfONnwk
         EmR9MHzubUI2XaWa5ouOQ+/awXsco1RkB8y8fXbRu47b0QlVG08FerZgeZB0mcFj9dFV
         gfl5ahcFmnnw4cMrv2uw19b26tpb/nZK8wRQePIk1QCGH47NLDrkQVktHJd21GYob6a5
         8cLBjd0/6OBN4PVSGZbvd+vGrLd9Qhd6/7CoieBN0DzR2TeNTgB9DBxQJXUqaQojRA6f
         kgIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738937304; x=1739542104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m3qXBhgYFmwgLXKfxYMj7rB53ypV2bfglBTEP4SO1Kk=;
        b=tGmXlxQ+MdzBfW9Y/LYfa8xgJ+Hs0txNOIp2tVF+lpaPX1YPtJU10DrO+xZehAg5gk
         IvlM+zO6ytg+QmJSsJpA9Y32kDjeJqu94vO2yVaUra3XVglgee7gKVXsog4iusr4VXeD
         GKtsqNWXvjjOEIkZ6LVnphsIPkka1UBR4C4OAkaajxw0ZUJtEVeQTUEC7Fl1vWb3Vf/z
         /FRPTgniVp8J6Np9bTGSCCSuJKOcEfUpaGR7WjCZwF3BW/CW116lxRAfRvI9NbGqNBj5
         j0JOAx/5lVt4m4RNw6t8KXAp090tBcbK0Fz0E5hO2uRGlKqz9PEiiyQZrPm44kHo7SNE
         40lg==
X-Forwarded-Encrypted: i=1; AJvYcCXynVSY4INcu4ypydyFnwdOnnYJnbgUL9ugg9K/Q1qJW/cnvYczMmJ1LankvGC05Lc+o1VywIZ388ujFQc=@vger.kernel.org
X-Gm-Message-State: AOJu0YykiiFJra3hw1iT+ET2KZYDySyMFt0lsw7W20gcANBCxc6x+Kuc
	/24u72jVDwONZtqRuRRQlCbW/bZzgnR78jv3uvg1HBeAF58m/R03vEX0vg==
X-Gm-Gg: ASbGnct6QeuLpja0bfBUpz/hE9XAA6mTXFci8oGcTNmvdYOMnmL9cP8R1Z02Mifxoft
	iYlSeAjc7Hd48f43Abic3da0tQbNhPnWT8D6pnwWNaPxxQKdYvm7bE3cniWMbckLLbDEM8go4+F
	Q5lfpgIbj5lSs70Om7iQ2wwV+n21wnCca4Iv0gf8pP7MMZVZMc0w0Z4ISx0x0YybrePTVEW18sV
	EiO9WFuNn6tUZjaTC/L4nYXWMwD+lxeT5YmFLRjieIsxC1SDUWfhmkcmoNWFqtduNbHNdC8wpcM
	CcaY8hUglxqCMF5S3ZBlgc0=
X-Google-Smtp-Source: AGHT+IFBe2sysKs/9C3wOqr5Tx7XJK46c2e3eJvQTDBwko4Zc0eNe6N6/Vd2hM3xPewLsZCIMJY4FQ==
X-Received: by 2002:a05:690c:4c13:b0:6f9:97f7:a5c3 with SMTP id 00721157ae682-6f9b287a22emr32814927b3.18.1738937303727;
        Fri, 07 Feb 2025 06:08:23 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:3d2:4207:a956:ebad:2a64])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f9a000f577sm5525607b3.118.2025.02.07.06.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 06:08:23 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	"Kurt Borja" <kuurtb@gmail.com>
Subject: [PATCH v9 10/14] platform/x86: Add alienware-wmi.h
Date: Fri,  7 Feb 2025 09:07:39 -0500
Message-ID: <20250207140743.16822-11-kuurtb@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250207140743.16822-1-kuurtb@gmail.com>
References: <20250207140743.16822-1-kuurtb@gmail.com>
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
 .../platform/x86/dell/alienware-wmi-base.c    | 100 ++++--------------
 drivers/platform/x86/dell/alienware-wmi.h     |  92 ++++++++++++++++
 2 files changed, 114 insertions(+), 78 deletions(-)
 create mode 100644 drivers/platform/x86/dell/alienware-wmi.h

diff --git a/drivers/platform/x86/dell/alienware-wmi-base.c b/drivers/platform/x86/dell/alienware-wmi-base.c
index c575b82f11df..124969e13ec4 100644
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
@@ -50,23 +47,6 @@ static bool force_gmode;
 module_param_unsafe(force_gmode, bool, 0);
 MODULE_PARM_DESC(force_gmode, "Forces G-Mode when performance profile is selected");
 
-enum INTERFACE_FLAGS {
-	LEGACY,
-	WMAX,
-};
-
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
@@ -114,15 +94,7 @@ static const enum platform_profile_option wmax_mode_to_platform_profile[THERMAL_
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
@@ -246,12 +218,6 @@ static const struct dmi_system_id alienware_quirks[] __initconst = {
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
@@ -286,27 +252,7 @@ struct awcc_priv {
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
-static u8 interface;
+u8 alienware_interface;
 
 struct awcc_quirks {
 	bool pprof;
@@ -418,8 +364,8 @@ static const struct dmi_system_id awcc_dmi_table[] __initconst = {
 
 static struct awcc_quirks *awcc;
 
-static int alienware_wmi_command(struct wmi_device *wdev, u32 method_id,
-				 void *in_args, size_t in_size, u32 *out_data)
+int alienware_wmi_command(struct wmi_device *wdev, u32 method_id,
+			  void *in_args, size_t in_size, u32 *out_data)
 {
 	struct acpi_buffer out = {ACPI_ALLOCATE_BUFFER, NULL};
 	struct acpi_buffer in = {in_size, in_args};
@@ -583,7 +529,7 @@ static ssize_t lighting_control_state_store(struct device *dev,
 		val = LEGACY_BOOTING;
 	else if (strcmp(buf, "suspend\n") == 0)
 		val = LEGACY_SUSPEND;
-	else if (interface == LEGACY)
+	else if (alienware_interface == LEGACY)
 		val = LEGACY_RUNNING;
 	else
 		val = WMAX_RUNNING;
@@ -731,7 +677,7 @@ static DEVICE_ATTR_RW(source);
 
 static bool hdmi_group_visible(struct kobject *kobj)
 {
-	return interface == WMAX && alienfx->hdmi_mux;
+	return alienware_interface == WMAX && alienfx->hdmi_mux;
 }
 DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(hdmi);
 
@@ -741,7 +687,7 @@ static struct attribute *hdmi_attrs[] = {
 	NULL,
 };
 
-static const struct attribute_group hdmi_attribute_group = {
+const struct attribute_group wmax_hdmi_attribute_group = {
 	.name = "hdmi",
 	.is_visible = SYSFS_GROUP_VISIBLE(hdmi),
 	.attrs = hdmi_attrs,
@@ -779,7 +725,7 @@ static DEVICE_ATTR_RO(status);
 
 static bool amplifier_group_visible(struct kobject *kobj)
 {
-	return interface == WMAX && alienfx->amplifier;
+	return alienware_interface == WMAX && alienfx->amplifier;
 }
 DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(amplifier);
 
@@ -788,7 +734,7 @@ static struct attribute *amplifier_attrs[] = {
 	NULL,
 };
 
-static const struct attribute_group amplifier_attribute_group = {
+const struct attribute_group wmax_amplifier_attribute_group = {
 	.name = "amplifier",
 	.is_visible = SYSFS_GROUP_VISIBLE(amplifier),
 	.attrs = amplifier_attrs,
@@ -850,7 +796,7 @@ static DEVICE_ATTR_RW(deepsleep);
 
 static bool deepsleep_group_visible(struct kobject *kobj)
 {
-	return interface == WMAX && alienfx->deepslp;
+	return alienware_interface == WMAX && alienfx->deepslp;
 }
 DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(deepsleep);
 
@@ -859,7 +805,7 @@ static struct attribute *deepsleep_attrs[] = {
 	NULL,
 };
 
-static const struct attribute_group deepsleep_attribute_group = {
+const struct attribute_group wmax_deepsleep_attribute_group = {
 	.name = "deepsleep",
 	.is_visible = SYSFS_GROUP_VISIBLE(deepsleep),
 	.attrs = deepsleep_attrs,
@@ -1114,7 +1060,7 @@ static int alienfx_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
-	if (interface == WMAX)
+	if (alienware_interface == WMAX)
 		priv->lighting_control_state = WMAX_RUNNING;
 	else
 		priv->lighting_control_state = LEGACY_RUNNING;
@@ -1132,9 +1078,7 @@ static int alienfx_probe(struct platform_device *pdev)
 
 static const struct attribute_group *alienfx_groups[] = {
 	&zone_attribute_group,
-	&hdmi_attribute_group,
-	&amplifier_attribute_group,
-	&deepsleep_attribute_group,
+	WMAX_DEV_GROUPS
 	NULL
 };
 
@@ -1153,7 +1097,7 @@ static void alienware_alienfx_remove(void *data)
 	platform_device_unregister(pdev);
 }
 
-static int alienware_alienfx_setup(struct alienfx_platdata *pdata)
+int alienware_alienfx_setup(struct alienfx_platdata *pdata)
 {
 	struct device *dev = &pdata->wdev->dev;
 	struct platform_device *pdev;
@@ -1240,12 +1184,12 @@ static struct wmi_driver alienware_legacy_wmi_driver = {
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
@@ -1313,7 +1257,7 @@ static struct wmi_driver alienware_wmax_wmi_driver = {
 	.no_singleton = true,
 };
 
-static int __init alienware_wmax_wmi_init(void)
+int __init alienware_wmax_wmi_init(void)
 {
 	const struct dmi_system_id *id;
 
@@ -1338,7 +1282,7 @@ static int __init alienware_wmax_wmi_init(void)
 	return wmi_driver_register(&alienware_wmax_wmi_driver);
 }
 
-static void __exit alienware_wmax_wmi_exit(void)
+void __exit alienware_wmax_wmi_exit(void)
 {
 	wmi_driver_unregister(&alienware_wmax_wmi_driver);
 }
@@ -1356,10 +1300,10 @@ static int __init alienware_wmi_init(void)
 		return ret;
 
 	if (wmi_has_guid(WMAX_CONTROL_GUID)) {
-		interface = WMAX;
+		alienware_interface = WMAX;
 		ret = alienware_wmax_wmi_init();
 	} else {
-		interface = LEGACY;
+		alienware_interface = LEGACY;
 		ret = alienware_legacy_wmi_init();
 	}
 
@@ -1373,7 +1317,7 @@ module_init(alienware_wmi_init);
 
 static void __exit alienware_wmi_exit(void)
 {
-	if (interface == WMAX)
+	if (alienware_interface == WMAX)
 		alienware_wmax_wmi_exit();
 	else
 		alienware_legacy_wmi_exit();
diff --git a/drivers/platform/x86/dell/alienware-wmi.h b/drivers/platform/x86/dell/alienware-wmi.h
new file mode 100644
index 000000000000..b950c91e1979
--- /dev/null
+++ b/drivers/platform/x86/dell/alienware-wmi.h
@@ -0,0 +1,92 @@
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
+enum INTERFACE_FLAGS {
+	LEGACY,
+	WMAX,
+};
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
+extern u8 alienware_interface;
+extern struct alienfx_quirks *alienfx;
+
+int alienware_wmi_command(struct wmi_device *wdev, u32 method_id,
+			  void *in_args, size_t in_size, u32 *out_data);
+
+int alienware_alienfx_setup(struct alienfx_platdata *pdata);
+
+int __init alienware_legacy_wmi_init(void);
+void __exit alienware_legacy_wmi_exit(void);
+
+extern const struct attribute_group wmax_hdmi_attribute_group;
+extern const struct attribute_group wmax_amplifier_attribute_group;
+extern const struct attribute_group wmax_deepsleep_attribute_group;
+
+#define WMAX_DEV_GROUPS		&wmax_hdmi_attribute_group,		\
+				&wmax_amplifier_attribute_group,	\
+				&wmax_deepsleep_attribute_group,
+
+int __init alienware_wmax_wmi_init(void);
+void __exit alienware_wmax_wmi_exit(void);
+
+#endif
-- 
2.48.1

