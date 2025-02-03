Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB8C20F098;
	Mon,  3 Feb 2025 18:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738607264; cv=none; b=Umjd62LVch5ANZbpH3VSpzsQVZpChE0ITc/i7wzR+MnsfWy1l0g0QgipX04DaEXArnkEGtKGkN/Fx9tc/aKaFsDkR5dg89Sfwlg/gusiFxnJAh4AbeLzxtwMgJlA7MlI1cOBmNjEhQKiYR1VMnsdp/mCcrLbcbkFCujqKABQjR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738607264; c=relaxed/simple;
	bh=a+WGN8vLJIackyskJTaWkISF4FNw5DVDAXG+M8x9iwQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HorqRnfSepdB2DIHk1frm+r+2SW1eHKNFXemTr6le3qOPY761nxh/nQTpO4O//OgLHyO5fs4oPA1lrg0s2wom0slCru0TCiSZ1VOaQX1sxMnC/MFhEj+d8aNMQ9sud5gLG2uSAIOQJq73PoCuzYthWQZe4kMH+xVt5EwPL86dIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NKSgQl3p; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NKSgQl3p"
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e5addb0eb8eso2786772276.2;
        Mon, 03 Feb 2025 10:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738607261; x=1739212061; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bCtT3mWBKmSa/+q6IsNS7V/Wacj3G0zU+O2yNcZap7w=;
        b=NKSgQl3pesTUwZWSuoc256T2h7gH3gwvAoLlBq5dgaqSvHbj4IgfklzslnnYazGAi9
         ZGmo3ufEBUPBD5yP6/PMpNNy3dF577D4MbBqNLvFjgZFOIVkNiUcO0jyr9j+PquZHJ4E
         JR2R2gOY+qEtft6rOUWapv6iNQ4U2cTpR0h7YUtPrXZhaSE7ZXjkRTsyWPTZZzBzg1aY
         skbxcn3qTBX1jIxHjDB+9CnSAdwimW/7sUBFrIrAtHxOK6oIUXOGx+slXB+Lmu9C7I3A
         whbgFL00v4Tl0PU45yxBNsSz1nX+PrzmLowPb/BkQk68QfPplWAXyoxRlKD0wTVr7AIk
         gtDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738607261; x=1739212061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bCtT3mWBKmSa/+q6IsNS7V/Wacj3G0zU+O2yNcZap7w=;
        b=gNTnQxCYSpmpvNqPWzyUb/mHfh9APOIInfAy0/L6jRflxbsK7QP075GPD4vlf5AAU3
         eVzFxBiiCZThEFjz+bY74YQXJwWNTZB/X6EG2UFz9f91OGfxz4VBkOW6NYJ7mh7fhurV
         PwGYC6tIEtvEQedpPopIWMgjQl2/uOFcmP2vjIh346ECOHfsof0KIR0kgJLsK47UMnCY
         83a13txIjJb9+HPWlTfHlJE5mtaz1hFUxrrC2/aCvxTKp65cHezM66Ho2kGwX4Pl/UQt
         t5EkF+kRkezd3osp487kGv+iulf37NQaG5ys10DmA12GZSdqiSgsK/7rx69HJzTuPeH9
         vUcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqo8+WN+Dlxxwx1kRyZ4ZYpRQlpUjxMnSwstT14tetniYiV8JmOtH8pM/F3MFeSaSgH/X/B7omI5DAriw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOM8EMvGuydM7zbH1hy6EpSEYbwi34XxrVl/CPV1mQqKwXKh5B
	KKzbWvQM6qoTa56C9N+Bec0lgrFnI4J2JUmgeuhJiMch4ZFA8MjOSCv3rA==
X-Gm-Gg: ASbGncvENfb1WjyKha3kMwdvs8wCj2CossFEUkPlXzWDJl4J+8X6XCIWuYRMZxayyeG
	FISYwpeKvS3FXudHLqQoyxfMFcj+MK8vF7tsFQe8r9V8MXH9mYHSi7XegyoUk2MCRDHRFB4W0tV
	5jUpA2RFtrDTOGYoCuodTnyDyF3HyjcpI6SdJdDCTC4DQRlxXz2ibOCVSxXlqICl+yM+Fi1BOhM
	G5zKZJdLw6PW9ibEfE9pDJ/tsAcEF0p9mcqbw5921L5VXWNP+4SRVnVptteBFiCucTRqZhMI9tf
	ozEYio7fIOHAQcI2qEr724I=
X-Google-Smtp-Source: AGHT+IHzlI1qhGajjk5Y3iNaNFL+UNG6/efaEb0OoVf1Tkeq5/h68gdUKixSr/FOdh2QEnJSQNRfdQ==
X-Received: by 2002:a05:6902:118a:b0:e5b:129c:56ba with SMTP id 3f1490d57ef6-e5b129c5741mr937285276.29.1738607261450;
        Mon, 03 Feb 2025 10:27:41 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:3d2:4207:a956:ebad:2a64])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e5acb2bc726sm2142239276.30.2025.02.03.10.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 10:27:41 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	"Kurt Borja" <kuurtb@gmail.com>
Subject: [PATCH v8 10/14] platform/x86: Add alienware-wmi.h
Date: Mon,  3 Feb 2025 13:27:09 -0500
Message-ID: <20250203182713.27446-11-kuurtb@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250203182713.27446-1-kuurtb@gmail.com>
References: <20250203182713.27446-1-kuurtb@gmail.com>
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
index 7e0a74555e91..3df1f1d763e2 100644
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
@@ -734,7 +680,7 @@ static DEVICE_ATTR_RW(source);
 
 static bool hdmi_group_visible(struct kobject *kobj)
 {
-	return interface == WMAX && alienfx->hdmi_mux;
+	return alienware_interface == WMAX && alienfx->hdmi_mux;
 }
 DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(hdmi);
 
@@ -744,7 +690,7 @@ static struct attribute *hdmi_attrs[] = {
 	NULL,
 };
 
-static const struct attribute_group hdmi_attribute_group = {
+const struct attribute_group wmax_hdmi_attribute_group = {
 	.name = "hdmi",
 	.is_visible = SYSFS_GROUP_VISIBLE(hdmi),
 	.attrs = hdmi_attrs,
@@ -783,7 +729,7 @@ static DEVICE_ATTR_RO(status);
 
 static bool amplifier_group_visible(struct kobject *kobj)
 {
-	return interface == WMAX && alienfx->amplifier;
+	return alienware_interface == WMAX && alienfx->amplifier;
 }
 DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(amplifier);
 
@@ -792,7 +738,7 @@ static struct attribute *amplifier_attrs[] = {
 	NULL,
 };
 
-static const struct attribute_group amplifier_attribute_group = {
+const struct attribute_group wmax_amplifier_attribute_group = {
 	.name = "amplifier",
 	.is_visible = SYSFS_GROUP_VISIBLE(amplifier),
 	.attrs = amplifier_attrs,
@@ -856,7 +802,7 @@ static DEVICE_ATTR_RW(deepsleep);
 
 static bool deepsleep_group_visible(struct kobject *kobj)
 {
-	return interface == WMAX && alienfx->deepslp;
+	return alienware_interface == WMAX && alienfx->deepslp;
 }
 DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(deepsleep);
 
@@ -865,7 +811,7 @@ static struct attribute *deepsleep_attrs[] = {
 	NULL,
 };
 
-static const struct attribute_group deepsleep_attribute_group = {
+const struct attribute_group wmax_deepsleep_attribute_group = {
 	.name = "deepsleep",
 	.is_visible = SYSFS_GROUP_VISIBLE(deepsleep),
 	.attrs = deepsleep_attrs,
@@ -1121,7 +1067,7 @@ static int alienfx_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
-	if (interface == WMAX)
+	if (alienware_interface == WMAX)
 		priv->lighting_control_state = WMAX_RUNNING;
 	else
 		priv->lighting_control_state = LEGACY_RUNNING;
@@ -1139,9 +1085,7 @@ static int alienfx_probe(struct platform_device *pdev)
 
 static const struct attribute_group *alienfx_groups[] = {
 	&zone_attribute_group,
-	&hdmi_attribute_group,
-	&amplifier_attribute_group,
-	&deepsleep_attribute_group,
+	WMAX_DEV_GROUPS
 	NULL
 };
 
@@ -1160,7 +1104,7 @@ static void alienware_alienfx_remove(void *data)
 	platform_device_unregister(pdev);
 }
 
-static int alienware_alienfx_setup(struct alienfx_platdata *pdata)
+int alienware_alienfx_setup(struct alienfx_platdata *pdata)
 {
 	struct device *dev = &pdata->wdev->dev;
 	struct platform_device *pdev;
@@ -1247,12 +1191,12 @@ static struct wmi_driver alienware_legacy_wmi_driver = {
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
@@ -1320,7 +1264,7 @@ static struct wmi_driver alienware_wmax_wmi_driver = {
 	.no_singleton = true,
 };
 
-static int __init alienware_wmax_wmi_init(void)
+int __init alienware_wmax_wmi_init(void)
 {
 	const struct dmi_system_id *id;
 
@@ -1345,7 +1289,7 @@ static int __init alienware_wmax_wmi_init(void)
 	return wmi_driver_register(&alienware_wmax_wmi_driver);
 }
 
-static void __exit alienware_wmax_wmi_exit(void)
+void __exit alienware_wmax_wmi_exit(void)
 {
 	wmi_driver_unregister(&alienware_wmax_wmi_driver);
 }
@@ -1363,10 +1307,10 @@ static int __init alienware_wmi_init(void)
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
 
@@ -1380,7 +1324,7 @@ module_init(alienware_wmi_init);
 
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

