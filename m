Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8CC22538B;
	Fri,  7 Feb 2025 15:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738943234; cv=none; b=rGFAzz3E3W7nIYBkPjeRXmEUzaxSQjaw8IUuIQm3QRomQWWBYEKh4W5S/iEJUwyvh4wTsyP35XN922znWnjgBsiboPJbiCBXAK+7QKhP+i9CVHhgYoVIS4WHhzkuFfIqizuNkVVObeOeLSXErUxTO4/C8B3Js1vkgKTmJDQoHZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738943234; c=relaxed/simple;
	bh=fHiEhMW/MUAzNqGF+k0nw60BIC1B+41IdC8VtYXtMTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UYu9uNREMk/FvRIWuHHAMqPLsz+zkQ4aVqKKqDQR+wVewwazEB1gulgMtNPnLvAyRKZ9yIZonJWnVZES4eZBcijtNQmNwo28U/cShn/RLChYAAAFw9N7liHb8YgCaScfuZdafSWlcjs/Ei3ElwkT7oC1nXwO/BvNi2v2CYfAEmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bP8ULtEb; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bP8ULtEb"
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4ba7a9c17c0so992109137.0;
        Fri, 07 Feb 2025 07:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738943230; x=1739548030; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m3qXBhgYFmwgLXKfxYMj7rB53ypV2bfglBTEP4SO1Kk=;
        b=bP8ULtEbeFdwiVHEHMpN92TPixxe2QzJCfMKeZCafZa+LG6Ge+p86wXRYs9WLpgvIr
         DZArZSOWjtURl3zqKt6zLIcK3yKRrWEfxGwJxir0xNfvMKN4HcXs19urtyEbfFRRWksZ
         sYLoFj+fTS8yqqUCnZzzdm0jZ59TpByEjK3zeV9ngHWzbkayDvGsdgGRLyaDkr+PDJKE
         nwjhyG1IJsEm/56L5PAHLfaPXfyYWBKzzCm/R/zheqU4Tts6bHmq1yet7Kt3ynxlexQW
         xjlgkQgw3/qcrwRg+2gN/uAklV5HKEnK+RZ8l1CWMsQioONfjGZPPuMMDb2HOJvBU8fz
         gtuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738943230; x=1739548030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m3qXBhgYFmwgLXKfxYMj7rB53ypV2bfglBTEP4SO1Kk=;
        b=whrqCu6beALvkuQ0uWL35TivGTkKYyJ/i1oj6GTXHgHbjTwEsCkLafTfCwgTIIgH85
         LwrD/w2c+NvbVA8vP2jowBp1SDuCT5tthgbjOvW2tsq90J6dscL87fs6rSXe627SQXrJ
         GgXNE9RptokZVxrWp34QesIl6KnNsYTS/lT4V14Ixvkc2tfw01yLv4cihhiI41Noi8w0
         M1ipOji+CMCdktDXC5Y4m/oYVMXXaIJwR6eL/e+DBQIcxF/9V4vb1jGl/uqvcOWEXdPA
         p9AjfHIEry4FKDr20iVJtLSNGZZV/jiwZY9HG0JuXmzHthiWo4ARYVUuJ7EV8CKpMxpD
         HgFA==
X-Forwarded-Encrypted: i=1; AJvYcCXmbnZZYedEcQd3xcSAf6frsBEAXH9Kfgj1121GGhK0bbJCtOeqkT+NmMUWY6phR8dUBovXiOwuRi+aHQQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTIVgeNQQ3jsTqb1cB0LbIi6hrqywuE/pr9CM90oIldQw4Hzye
	SMY0BIdk4dfWq/JY9gTPes6EbtHGFJ7Zvwceq+8qxUneyZP1MjjWFb4vNQ==
X-Gm-Gg: ASbGncsz4jzvQGkTGL5+3c9ZZUe71XN4qhcwlxCTT0CBt/BLjZ4DiBlnLzGzEwsuCa+
	el/3mOLbjVebkcJCnIaZXDmCqLSaoBMUxFuzpSJ2MiGvmgoWIFCsKNxd2WcOIVKwI+ttxeGjpfM
	Uf7U3ALncVhHVD6jtmZGq8on8T7mt0apBmjT1EZMDnc2PC6L6XPREgi7NoGW2evqil9r7wKvGUl
	HU45Z9HNs1BPrZI4y/i/joFv4271pgY2VRtib/dJkalgE8moud4oPqMSmrBrEREuPRUXB6k2Ljr
	0lUQW8snYax0nfi6Y73UKEk=
X-Google-Smtp-Source: AGHT+IEKEeVe7+8yOjm5MthpaSEjyUqcAnbpGPZ62LFsTmyg1SetrEy2biANVXa+bGl4NKKtbv78UA==
X-Received: by 2002:a05:6102:5e88:b0:4b5:aa91:f29f with SMTP id ada2fe7eead31-4ba87141794mr2424062137.8.1738943230597;
        Fri, 07 Feb 2025 07:47:10 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:3d2:4207:a956:ebad:2a64])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4ba76cb8e44sm768456137.0.2025.02.07.07.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 07:47:09 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	"Kurt Borja" <kuurtb@gmail.com>
Subject: [PATCH v10 10/14] platform/x86: Add alienware-wmi.h
Date: Fri,  7 Feb 2025 10:46:06 -0500
Message-ID: <20250207154610.13675-11-kuurtb@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250207154610.13675-1-kuurtb@gmail.com>
References: <20250207154610.13675-1-kuurtb@gmail.com>
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

