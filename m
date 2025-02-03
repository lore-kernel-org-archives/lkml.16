Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82DC61D89E4;
	Mon,  3 Feb 2025 06:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738563777; cv=none; b=aZJ3gbYnHwA32a4/NjN4KcnSqLXQ9yZmGTVDkbLAXa0fjbGBmYfXWcOYOpesyDoNbFE1pepcFmgc/Zhi45QH9KhPBPkp3T/9Ix9BNGqclCvBhMwoQ+WFOcfjUl/8hxlwa5Dg3+vvVc6Ln9N+48e1wAJ+9BFPqYpLQcHoXvKD0Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738563777; c=relaxed/simple;
	bh=NTC1zhzDokwYZ3rn7PRVHArPU0q4pmMZLnWnR9+qqBk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ombpU5kt+nL7Y9g+7E3v/O/YbfogjGa25n3bb6lDhy/91nMKJykjnXCPa9M52IPnw6+gs3RPEEdoONvowqGR+CmiWG7XCK9lvKvNeuYThnwGQzlnU0o5/TTdkECgK2h368T+jgkWuHAq9j7MVHFA6p4LLJZLFMLH8td23aX3jRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YL0tAzwn; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YL0tAzwn"
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5174f9c0d2aso1336174e0c.1;
        Sun, 02 Feb 2025 22:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738563774; x=1739168574; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eir8hv9u+DDtCXlY54FduEVUV5h/s+JniQ3Fdjx7mV8=;
        b=YL0tAzwnwF/O7Dd53XCMgxWJNJYneLbKVIGqCGDUL4GsbWeAqwDNqeP7rBP1L2Akf4
         yRHJYzBnI33iiB4t/NYktTvL0TT+dWk3r6Rouplw360W0dFNqZQdQ8L9u8xX+d12OhNi
         jkRImw0FtfzNTBUBPcKUPmdS/6du/KLh90cGrUezD6xRRWgksWhqDH+4gvzeh9sVwKbk
         TL7Ms0LV2A8xz7jjwpCPEpdGzWghpcuKFk9/5gJmEiJPVwZJM2CKQfzFg94Dtv99S1qP
         NtVqPQYLhIe3lX4CcW1uiaOosZVTsNVJO/oGAnb5NBriBJ4oL3v8jr2uyKuvcbwEVAtR
         SnuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738563774; x=1739168574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Eir8hv9u+DDtCXlY54FduEVUV5h/s+JniQ3Fdjx7mV8=;
        b=X/b5M3FrlT9jMDbt8yE++2bn3bTQmmjD7W1BklvMmmbUVIZAo8QU/OdHrVeMOq3T3M
         aJs7vViV0yPt9LslOmSEXZ3/joaU+wDiJz39Wpw6yUu5WhgG0jO6fyY5FbC4g+YOCMUf
         VuIfFkRc+ZwcsEIXPavGetbJXU4iyhWRrAS2/A+nT4zE9v3q+g+GjttILxRkjQGyJjfY
         tVsnIM9vZ8gn472ztkj8PER0377jI9jfO9UEL0KBLEuMpYtxlC4Uo0nnU4DmzffpcTLR
         IaL+5JLajyu5g2Elais+YfgaK5DDbDWxbPWCq8nWLluOT1IWkJ1esz3IZKJv6JO2sywE
         JL1w==
X-Forwarded-Encrypted: i=1; AJvYcCXkuIxfOd9+GIH3AI8iGfxldJg98DH+9hdF9UzvfHfn/0cuUhIIA0S0MpW84wtkJ8bALLA/rIeoPRCRH0E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3FG4zt2mdt1JkT8ucqJxhFquyXrQWrZOhncH5yjlQF/2vAarj
	IN0ZsgUvE/SSGa4br8O4KXmCjXLbs8HR33srVZ/SaYaAjort22l6opL6oA==
X-Gm-Gg: ASbGnctSJqT59fAKgGLZTm+BtBFMLQ6RxwQ1ZJ92g+H34VhzEMU46WtTyCKTD+fZO7g
	5O9+2H1eQsqB26K0GNeP0skg1e8E2c3p9FBNVhXuGs40U4GHaGGSuVtjGACGzVLbBpvgoj0kVrt
	qKMSCiUEsDZjQkydM8u2JkE+dXKjyED13RWuCuscBPPS3Y5XxIPdFz+wAT//PKV2Lyp1nlmDIuI
	OvJai0eezBbWpRuLIEjdzSK8Oeatv8GR8YemnXjxN6S0L0BEpJSqzC6PVVdYZQgrWZGHMh1XODM
	dKBegEzMHza623KX2WjJQXA=
X-Google-Smtp-Source: AGHT+IH9lBai6Hvbbjwxmj/XmosgztgTZ3kbqNWA+cUPF3+2Czi7DhXe07E7l+PIiMW/jRX03rKVLg==
X-Received: by 2002:a05:6122:378b:b0:518:a261:adca with SMTP id 71dfb90a1353d-51e9e510332mr14868468e0c.8.1738563773700;
        Sun, 02 Feb 2025 22:22:53 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:3d2:4207:a956:ebad:2a64])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51eb1d64c20sm1138789e0c.32.2025.02.02.22.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 22:22:52 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	"Kurt Borja" <kuurtb@gmail.com>
Subject: [PATCH v7 02/14] platform/x86: alienware-wmi: Add WMI Drivers
Date: Mon,  3 Feb 2025 01:20:43 -0500
Message-ID: <20250203062055.2915-3-kuurtb@gmail.com>
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

Add WMI drivers for LEGACY and WMAX devices.

This involves moving the platform device registration to a helper
function that is now called from the driver's preferred WMI device
driver probe. In the case of the WMAX this is done only if
`!quirks->thermal` because the newer WMAX interface doesn't support any
of the LED features of this driver. This also eliminates the need to
check for `quirks->num_zones > 0` inside alienfx_probe().

The platform_driver's probe type is also set to PROBE_FORCE_SYNCHRONOUS
so we can create WMAX-only sysfs groups from within the probe without
races.

Only one WMI driver is registered on module initialization to prevent
registering a duplicate platform device.

Additionally, create_thermal_profile() now takes wmi_device * instead of
platform_device *.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/alienware-wmi.c | 182 +++++++++++++++++-----
 1 file changed, 143 insertions(+), 39 deletions(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
index ab86deb1adb9..5ce954137f9d 100644
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
@@ -1178,6 +1177,10 @@ static int alienfx_probe(struct platform_device *pdev)
 
 static const struct attribute_group *alienfx_groups[] = {
 	&zone_attribute_group,
+	NULL
+};
+
+static const struct attribute_group *wmax_alienfx_groups[] = {
 	&hdmi_attribute_group,
 	&amplifier_attribute_group,
 	&deepsleep_attribute_group,
@@ -1188,23 +1191,132 @@ static struct platform_driver platform_driver = {
 	.driver = {
 		.name = "alienware-wmi",
 		.dev_groups = alienfx_groups,
+		.probe_type = PROBE_FORCE_SYNCHRONOUS,
 	},
 	.probe = alienfx_probe,
 };
 
-static int __init alienware_wmi_init(void)
+static void alienware_alienfx_remove(void *data)
+{
+	struct platform_device *pdev = data;
+
+	platform_device_unregister(pdev);
+}
+
+static int alienware_alienfx_setup(struct alienfx_platdata *pdata)
 {
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
+	struct platform_device *pdev;
+	int ret;
+
+	if (quirks->thermal) {
+		ret = create_thermal_profile(wdev);
+	} else {
+		ret = alienware_alienfx_setup(&pdata);
+		if (ret < 0)
+			return ret;
+
+		pdev = dev_get_drvdata(&wdev->dev);
+
+		ret = device_add_groups(&pdev->dev, wmax_alienfx_groups);
 	}
 
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
+
 	dmi_check_system(alienware_quirks);
 	if (quirks == NULL)
 		quirks = &quirk_unknown;
@@ -1220,32 +1332,20 @@ static int __init alienware_wmi_init(void)
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
 
@@ -1253,7 +1353,11 @@ module_init(alienware_wmi_init);
 
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

