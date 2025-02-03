Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8966020E334;
	Mon,  3 Feb 2025 18:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738607251; cv=none; b=uGKBCc17DbvUyxHhwBInCHu/ngERPhQAhC9IYuIWO1Q8dBC051BmmUL0j+oMCEnIsSOGsh5yowjjMcCpReWXOTC5uVEK5r16wKjvor82i/aQpQ3F4fyddghpAnuMYDybfHvnC1izG5ru8/rszrVrVgIL7AW0l5uqNHYlaMpdnqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738607251; c=relaxed/simple;
	bh=pFOd5OL2a6LO2xbS7qts8y3TQPrzRuVcyofMbUr0fok=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pZw0s4/O8RdcsgV7C5CjtEYTyGSM8+61p2wi1AvAsxdqyqDjXORYSn0tnaHyIUjGL2ROFjc+4VgkkWv9CFPO6beX9IJsjeeJ4iBaiIIxMD0S72ZyO7q1sJCye4cnMG2x3TA6JvZnZ0MciOKdP8RDSxsWG5YVeLEOXqUdDUSSLkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YlBGWs/c; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YlBGWs/c"
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e3983426f80so4238500276.1;
        Mon, 03 Feb 2025 10:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738607248; x=1739212048; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SA+zyldD3XpeByN7bIqz8d5mixA6TM9KjPHEPee9EzA=;
        b=YlBGWs/cO9oaShVbcuE0d1PVOXHD8Ht57ukcQWHo/+fXUKWJc8KSGK/7T2wmN+/GTP
         nN4/40PsekWr89MsHO9wJ9q0jwc00OOSWlC98JQDLlrAkIJm1L5yVfjkd98xbKog12TL
         kkpHHYeSDD64sZmI7wda5mwIv48fyWkAFRcAREnJ4InVr9NgQs6TxSQPagAYgvOLtM17
         tOoQu/TzR8fzLZJcyZu8gMTUmlXnfRv1LkaZyVjFaV1Np1xsZRN/+eM0PPAkwu98Xkbh
         iJMHfkzOUaer/IEb7gFyuAKhHaAzfXLqmjR44hpnjFHLG6v1bV7SYf/zO47SP5OKrvOz
         T3mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738607248; x=1739212048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SA+zyldD3XpeByN7bIqz8d5mixA6TM9KjPHEPee9EzA=;
        b=BQzVP61r6vlSy29OfVOH/MnYHeOvOVYKM0LX/4SyMlvC2OH4PHO8/yXiiRnv/Gd85Z
         rsL+NpMVi9GBjvv0H3Oe6vpPKqI4swlUEhtSrzHz0MWWtACw/2iRmWau9CpO1W1mgfRS
         WXAfVelrZt72f7yd4KTM2L62ram51TckroJI59xeXz6xYerlHyNi5Udj96vOicfuZRbP
         r9BwJaD7I92a5AoT2VVJDMBLwSkEupTyqMW9PbqbPWaMcvLIFXDPUV4soavYnS/ZUefm
         J9XEzBIbmhXTu8mmz4dXa3gRHQAizDGlS+D5MOtFFX6XLpE3IHwTcEQGapncMCdn8ZCX
         rXeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUS/33kLG+mOB/X+3v0A/KwwujjrKsy9O554D3KthtKgnQ9az+BjXXoprYiLhsxZql4UwlznDJ7iAhhjV0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdtP/fEFhLm2pGLE6xCoaGHSGaTGe597CG2JjkwdGRjhklSYVW
	Qgv4RedSAbAQ39qY987EPD8855UEMjdUGO59ODqmVC9WgtHnpM/mcduJhA==
X-Gm-Gg: ASbGnctt8BJtLbuiV8dU11qWMwIkrI/CeyB6H+OxaLYz5iGruCoAqNi45Ld992EY6OI
	0ahCPfPRz70zls9yToBbrq1Z5jQ5rbeh1h93CEQNM+xir9CJi9l7YyX572Elhy+kWQJ4tSggHUG
	CNGkQYMRVhI/++TJjQTIaJVT9vdYtHeq6QQEiIQyvec2tK6HA6F7rKiKRjAHU416ppkLeJTbVvZ
	5kIhCuV2/4QD3u4Gwr/eUh6/+FnzANTNpvWR+u8u2IFAoYQoX0h+GkowtHnb7hO4NMQGuyCh7YK
	uEpMt9IstUtypYPqCeW+bB4=
X-Google-Smtp-Source: AGHT+IEfifq8zv+tEtQLvcq93gssnnXuIIvoB0TCD5JWGK7QzxFzCGEQcNxImR8pcWbVUbWcZPm60A==
X-Received: by 2002:a05:6902:1688:b0:e44:82ef:395b with SMTP id 3f1490d57ef6-e58a4b7e736mr16641777276.32.1738607246643;
        Mon, 03 Feb 2025 10:27:26 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:3d2:4207:a956:ebad:2a64])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e5acb2bc726sm2142239276.30.2025.02.03.10.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 10:27:26 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	"Kurt Borja" <kuurtb@gmail.com>
Subject: [PATCH v8 02/14] platform/x86: alienware-wmi: Add WMI Drivers
Date: Mon,  3 Feb 2025 13:27:01 -0500
Message-ID: <20250203182713.27446-3-kuurtb@gmail.com>
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

Add WMI drivers for LEGACY and WMAX devices.

This involves moving the platform device registration to a helper
function that is now called from the driver's preferred WMI device
driver probe. In the case of the WMAX this is done only if
`!quirks->thermal` because the newer WMAX interface doesn't support any
of the LED features of this driver. This also eliminates the need to
check for `quirks->num_zones > 0` inside alienfx_probe().

Only one WMI driver is registered on module initialization to prevent
registering a duplicate platform device.

Additionally, create_thermal_profile() now takes wmi_device * instead of
platform_device *.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/alienware-wmi.c | 177 ++++++++++++++++------
 1 file changed, 134 insertions(+), 43 deletions(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
index ab86deb1adb9..506c096553e8 100644
--- a/drivers/platform/x86/dell/alienware-wmi.c
+++ b/drivers/platform/x86/dell/alienware-wmi.c
@@ -15,6 +15,7 @@
 #include <linux/platform_profile.h>
 #include <linux/dmi.h>
 #include <linux/leds.h>
+#include <linux/wmi.h>
 
 #define LEGACY_CONTROL_GUID		"A90597CE-A997-11DA-B012-B622A1EF5492"
 #define LEGACY_POWER_CONTROL_GUID	"A80593CE-A997-11DA-B012-B622A1EF5492"
@@ -39,8 +40,6 @@
 MODULE_AUTHOR("Mario Limonciello <mario.limonciello@outlook.com>");
 MODULE_DESCRIPTION("Alienware special feature control");
 MODULE_LICENSE("GPL");
-MODULE_ALIAS("wmi:" LEGACY_CONTROL_GUID);
-MODULE_ALIAS("wmi:" WMAX_CONTROL_GUID);
 
 static bool force_platform_profile;
 module_param_unsafe(force_platform_profile, bool, 0);
@@ -421,7 +420,10 @@ struct alienfx_priv {
 	u8 lighting_control_state;
 };
 
-static struct platform_device *platform_device;
+struct alienfx_platdata {
+	struct wmi_device *wdev;
+};
+
 static enum wmax_thermal_mode supported_thermal_profiles[PLATFORM_PROFILE_LAST];
 
 static u8 interface;
@@ -801,7 +803,7 @@ static DEVICE_ATTR_RW(source);
 
 static bool hdmi_group_visible(struct kobject *kobj)
 {
-	return quirks->hdmi_mux;
+	return interface == WMAX && quirks->hdmi_mux;
 }
 DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(hdmi);
 
@@ -848,7 +850,7 @@ static DEVICE_ATTR_RO(status);
 
 static bool amplifier_group_visible(struct kobject *kobj)
 {
-	return quirks->amplifier;
+	return interface == WMAX && quirks->amplifier;
 }
 DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(amplifier);
 
@@ -917,7 +919,7 @@ static DEVICE_ATTR_RW(deepsleep);
 
 static bool deepsleep_group_visible(struct kobject *kobj)
 {
-	return quirks->deepslp;
+	return interface == WMAX && quirks->deepslp;
 }
 DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(deepsleep);
 
@@ -1136,11 +1138,11 @@ static const struct platform_profile_ops awcc_platform_profile_ops = {
 	.profile_set = thermal_profile_set,
 };
 
-static int create_thermal_profile(struct platform_device *platform_device)
+static int create_thermal_profile(struct wmi_device *wdev)
 {
 	struct device *ppdev;
 
-	ppdev = devm_platform_profile_register(&platform_device->dev, "alienware-wmi",
+	ppdev = devm_platform_profile_register(&wdev->dev, "alienware-wmi",
 					       NULL, &awcc_platform_profile_ops);
 
 	return PTR_ERR_OR_ZERO(ppdev);
@@ -1153,9 +1155,6 @@ static int alienfx_probe(struct platform_device *pdev)
 {
 	struct alienfx_priv *priv;
 
-	if (!quirks->num_zones)
-		return -ENODEV;
-
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
@@ -1192,18 +1191,118 @@ static struct platform_driver platform_driver = {
 	.probe = alienfx_probe,
 };
 
-static int __init alienware_wmi_init(void)
+static void alienware_alienfx_remove(void *data)
 {
+	struct platform_device *pdev = data;
+
+	platform_device_unregister(pdev);
+}
+
+static int alienware_alienfx_setup(struct alienfx_platdata *pdata)
+{
+	struct device *dev = &pdata->wdev->dev;
+	struct platform_device *pdev;
 	int ret;
 
-	if (wmi_has_guid(LEGACY_CONTROL_GUID))
-		interface = LEGACY;
-	else if (wmi_has_guid(WMAX_CONTROL_GUID))
-		interface = WMAX;
-	else {
-		pr_warn("alienware-wmi: No known WMI GUID found\n");
-		return -ENODEV;
-	}
+	pdev = platform_device_register_data(NULL, "alienware-wmi",
+					     PLATFORM_DEVID_NONE, pdata,
+					     sizeof(*pdata));
+	if (IS_ERR(pdev))
+		return PTR_ERR(pdev);
+
+	dev_set_drvdata(dev, pdev);
+	ret = devm_add_action_or_reset(dev, alienware_alienfx_remove, pdev);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+/*
+ * Legacy WMI driver
+ */
+static int legacy_wmi_probe(struct wmi_device *wdev, const void *context)
+{
+	struct alienfx_platdata pdata = {
+		.wdev = wdev,
+	};
+
+	return alienware_alienfx_setup(&pdata);
+}
+
+static const struct wmi_device_id alienware_legacy_device_id_table[] = {
+	{ LEGACY_CONTROL_GUID, NULL },
+	{ },
+};
+MODULE_DEVICE_TABLE(wmi, alienware_legacy_device_id_table);
+
+static struct wmi_driver alienware_legacy_wmi_driver = {
+	.driver = {
+		.name = "alienware-wmi-alienfx",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+	},
+	.id_table = alienware_legacy_device_id_table,
+	.probe = legacy_wmi_probe,
+	.no_singleton = true,
+};
+
+static int __init alienware_legacy_wmi_init(void)
+{
+	return wmi_driver_register(&alienware_legacy_wmi_driver);
+}
+
+static void __exit alienware_legacy_wmi_exit(void)
+{
+	wmi_driver_unregister(&alienware_legacy_wmi_driver);
+}
+
+/*
+ * WMAX WMI driver
+ */
+static int wmax_wmi_probe(struct wmi_device *wdev, const void *context)
+{
+	struct alienfx_platdata pdata = {
+		.wdev = wdev,
+	};
+	int ret;
+
+	if (quirks->thermal)
+		ret = create_thermal_profile(wdev);
+	else
+		ret = alienware_alienfx_setup(&pdata);
+
+	return ret;
+}
+
+static const struct wmi_device_id alienware_wmax_device_id_table[] = {
+	{ WMAX_CONTROL_GUID, NULL },
+	{ },
+};
+MODULE_DEVICE_TABLE(wmi, alienware_wmax_device_id_table);
+
+static struct wmi_driver alienware_wmax_wmi_driver = {
+	.driver = {
+		.name = "alienware-wmi-wmax",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+	},
+	.id_table = alienware_wmax_device_id_table,
+	.probe = wmax_wmi_probe,
+	.no_singleton = true,
+};
+
+static int __init alienware_wmax_wmi_init(void)
+{
+	return wmi_driver_register(&alienware_wmax_wmi_driver);
+}
+
+static void __exit alienware_wmax_wmi_exit(void)
+{
+	wmi_driver_unregister(&alienware_wmax_wmi_driver);
+}
+
+static int __init alienware_wmi_init(void)
+{
+	int ret;
 
 	dmi_check_system(alienware_quirks);
 	if (quirks == NULL)
@@ -1220,32 +1319,20 @@ static int __init alienware_wmi_init(void)
 	}
 
 	ret = platform_driver_register(&platform_driver);
-	if (ret)
-		goto fail_platform_driver;
-	platform_device = platform_device_alloc("alienware-wmi", PLATFORM_DEVID_NONE);
-	if (!platform_device) {
-		ret = -ENOMEM;
-		goto fail_platform_device1;
-	}
-	ret = platform_device_add(platform_device);
-	if (ret)
-		goto fail_platform_device2;
+	if (ret < 0)
+		return ret;
 
-	if (quirks->thermal) {
-		ret = create_thermal_profile(platform_device);
-		if (ret)
-			goto fail_prep_thermal_profile;
+	if (wmi_has_guid(WMAX_CONTROL_GUID)) {
+		interface = WMAX;
+		ret = alienware_wmax_wmi_init();
+	} else {
+		interface = LEGACY;
+		ret = alienware_legacy_wmi_init();
 	}
 
-	return 0;
+	if (ret < 0)
+		platform_driver_unregister(&platform_driver);
 
-fail_prep_thermal_profile:
-	platform_device_del(platform_device);
-fail_platform_device2:
-	platform_device_put(platform_device);
-fail_platform_device1:
-	platform_driver_unregister(&platform_driver);
-fail_platform_driver:
 	return ret;
 }
 
@@ -1253,7 +1340,11 @@ module_init(alienware_wmi_init);
 
 static void __exit alienware_wmi_exit(void)
 {
-	platform_device_unregister(platform_device);
+	if (interface == WMAX)
+		alienware_wmax_wmi_exit();
+	else
+		alienware_legacy_wmi_exit();
+
 	platform_driver_unregister(&platform_driver);
 }
 
-- 
2.48.1

