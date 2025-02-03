Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB4A1C1AAA;
	Mon,  3 Feb 2025 18:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738607248; cv=none; b=WKpI1H1EbiqeyXv/Fm6tDxl91jbwNFmgR78jtdgYUZLmbVhHn/VSwWZTRqsGzP9id4ZFud5EJVHyT9LDMVNwgCyU6ttkZxcZ2t1GguFvwkD92tpuDvSLY8F1skObxEktVwt44Ht7a/UiAc+o+wmuvMmgF5A9TAKahRsyHOmAkn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738607248; c=relaxed/simple;
	bh=49eKxDqQtP3po1mBGZJU1bNO+vDFpnsz8KG9NigI21E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NlOsQPYJtr7CUj8OfS+bGrwa+xQcdWsz6UaxLNijdrrWZJWYOtR6qvAjSpuhiTFqRvuZ7ektB2t6hjT/l/3OKpy0bbCkXFSVQogaS4QhpkOuFhO34+pg2jzpLtE9nGEhEKjvzrxt6W97bqzLpfFlJ+WgapDUE/MWzpRRkpm4Qr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lP8vQTsN; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lP8vQTsN"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e549b0f8d57so4539899276.3;
        Mon, 03 Feb 2025 10:27:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738607245; x=1739212045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=78jUbb12GWv+OJbtaS4vNafGBdENBEI5UTnuBg/ppNE=;
        b=lP8vQTsNDQZl5fFFh/dPVoIs9kBMGv4hyxqXzu+Rs4j2vDCLHJHoour8Sdyf365Vp1
         S6dk1oW8W1mjnkayDCBtUeqb3ise9GNhsEYLrone5Gnb0T3+BBQa/OfZwuLfbhlYaoll
         J287D4hGHrAIPTKgspBBhUm3Rk4je4qY42Y7zey3YBL0RDmz2Z07QGg1LgY7QtM7Ioio
         JqgSKYl2lKIBJw8M9Ldku9cU6wGg8oDgTMHijto0qt15yonw5pnUDkZUmcDHszcn0qvk
         3XBBKIPCgjek0sS5i9uKtSlvoB3KZqkRy8XrsDZRFmFZs0+v0myyrF3mV978iow5kYPS
         3Qug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738607245; x=1739212045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=78jUbb12GWv+OJbtaS4vNafGBdENBEI5UTnuBg/ppNE=;
        b=kk0Rjs+D0gW9FaG/TvaqLl6MG2B/QMNUiMc6w2bSujaG0sFE2CyiejC8Dabr5PfVdp
         y/zP6dFBpPVqUF4FJrkZtxiow9txxDDUd7bENIBRy2M5CH9jJQKH2weVZYvo8pr/ZO52
         k4jiu+zbpVg2kV5RZ0dHPzIruuhN2skiak3NADQ+EaTLrLr2mVtnYnS5ITD02+1jfO8P
         TNlDygkP+n1nrOVw1yoi2L86vvN8ip4GWd2sXkQo38Vnpizp/WqpNKH23GkLpj0kgyfI
         EHQTYzWotbThZnQRZo2w319ZSqenk3bqs2aouKkQB83FgXdji4Z3SBZFVqTYI9UeifLp
         PkPA==
X-Forwarded-Encrypted: i=1; AJvYcCXz8WLsko4arbia1jytmncdaZ0QfAq+MndT95KXbYi0YTDA9zJggV8OIQKvNBqTADdpOpWX14uzZxIk518=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAWIOH9rIzkreNtmC+J69R3G/873ljevG8Tl/NLIg3FfEazOfJ
	1zqbD7zwNRMyo9CCCYv4X8jdRhIBA8DH2Z/exuAOJT05GQVM4mIuY74Zog==
X-Gm-Gg: ASbGnctkwkW0R+k5/zGdU0T2Vr9+gHfbbpS5BObmOr3QBbF+KlFxvVhfyR8kbAUFjS6
	odeO//8ExWhXsWAG0T/m0zoiWxWbIWJKFqZIQBBpe5fp9ph/E0Zd10B2BOspQgHmOkB+NZ7FtYG
	kjB0TMbNXdZs3puu64EJ9N3i6en0sT0LWR2YdyntizkihK5za60eOclDlOPgCMycp7Rs4pwU6xj
	e8Dl+JXMJVvPUs7ju5CNmGhoVL1pDVzT9yG19rWcCESq1reWA+4IwiZXa1Xaemtvc28GZz6r2fF
	aLd5pA0kMgddNlLhtvyeLGM=
X-Google-Smtp-Source: AGHT+IELd9zcSwcnHOvKyxaflqzXsn56QcLXeI82zYSJJv2LQYmbU4JAqlVuOv3uP+jxaMcjdqyyGQ==
X-Received: by 2002:a05:6902:11ce:b0:e57:f5a0:85c0 with SMTP id 3f1490d57ef6-e58a4bf2602mr16378982276.43.1738607245066;
        Mon, 03 Feb 2025 10:27:25 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:3d2:4207:a956:ebad:2a64])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e5acb2bc726sm2142239276.30.2025.02.03.10.27.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 10:27:24 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	"Kurt Borja" <kuurtb@gmail.com>
Subject: [PATCH v8 01/14] platform/x86: alienware-wmi: Add a state container for LED control feature
Date: Mon,  3 Feb 2025 13:27:00 -0500
Message-ID: <20250203182713.27446-2-kuurtb@gmail.com>
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

Add a state container for the "alienware-wmi" platform device and
initialize it on the new alienfx_probe(). Migrate all LED control functions
to use this state container to support upcoming file split.

Additionally move the led_classdev registration to the platform driver
probe and make it device managed.

Drop alienware_zone_init() and alienware_zone_exit() because they are no
longer needed and mimic the `quirks->num_zone > 0` check by failing the
platform device probe.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/alienware-wmi.c | 125 ++++++++++++----------
 1 file changed, 68 insertions(+), 57 deletions(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
index e252e0cf47ef..ab86deb1adb9 100644
--- a/drivers/platform/x86/dell/alienware-wmi.c
+++ b/drivers/platform/x86/dell/alienware-wmi.c
@@ -413,13 +413,18 @@ struct wmax_u32_args {
 	u8 arg3;
 };
 
+struct alienfx_priv {
+	struct platform_device *pdev;
+	struct led_classdev global_led;
+	struct color_platform colors[4];
+	u8 global_brightness;
+	u8 lighting_control_state;
+};
+
 static struct platform_device *platform_device;
-static struct color_platform colors[4];
 static enum wmax_thermal_mode supported_thermal_profiles[PLATFORM_PROFILE_LAST];
 
 static u8 interface;
-static u8 lighting_control_state;
-static u8 global_brightness;
 
 /*
  * Helpers used for zone control
@@ -451,7 +456,7 @@ static int parse_rgb(const char *buf, struct color_platform *colors)
 /*
  * Individual RGB zone control
  */
-static int alienware_update_led(u8 location)
+static int alienware_update_led(struct alienfx_priv *priv, u8 location)
 {
 	int method_id;
 	acpi_status status;
@@ -461,21 +466,21 @@ static int alienware_update_led(u8 location)
 	struct wmax_led_args wmax_basic_args;
 	if (interface == WMAX) {
 		wmax_basic_args.led_mask = 1 << location;
-		wmax_basic_args.colors = colors[location];
-		wmax_basic_args.state = lighting_control_state;
+		wmax_basic_args.colors = priv->colors[location];
+		wmax_basic_args.state = priv->lighting_control_state;
 		guid = WMAX_CONTROL_GUID;
 		method_id = WMAX_METHOD_ZONE_CONTROL;
 
 		input.length = sizeof(wmax_basic_args);
 		input.pointer = &wmax_basic_args;
 	} else {
-		legacy_args.colors = colors[location];
-		legacy_args.brightness = global_brightness;
+		legacy_args.colors = priv->colors[location];
+		legacy_args.brightness = priv->global_brightness;
 		legacy_args.state = 0;
-		if (lighting_control_state == LEGACY_BOOTING ||
-		    lighting_control_state == LEGACY_SUSPEND) {
+		if (priv->lighting_control_state == LEGACY_BOOTING ||
+		    priv->lighting_control_state == LEGACY_SUSPEND) {
 			guid = LEGACY_POWER_CONTROL_GUID;
-			legacy_args.state = lighting_control_state;
+			legacy_args.state = priv->lighting_control_state;
 		} else
 			guid = LEGACY_CONTROL_GUID;
 		method_id = location + 1;
@@ -494,22 +499,26 @@ static int alienware_update_led(u8 location)
 static ssize_t zone_show(struct device *dev, struct device_attribute *attr,
 			 char *buf, u8 location)
 {
+	struct alienfx_priv *priv = dev_get_drvdata(dev);
+	struct color_platform *colors = &priv->colors[location];
+
 	return sprintf(buf, "red: %d, green: %d, blue: %d\n",
-		       colors[location].red, colors[location].green,
-		       colors[location].blue);
+		       colors->red, colors->green, colors->blue);
 
 }
 
 static ssize_t zone_store(struct device *dev, struct device_attribute *attr,
 			  const char *buf, size_t count, u8 location)
 {
+	struct alienfx_priv *priv = dev_get_drvdata(dev);
+	struct color_platform *colors = &priv->colors[location];
 	int ret;
 
-	ret = parse_rgb(buf, &colors[location]);
+	ret = parse_rgb(buf, colors);
 	if (ret)
 		return ret;
 
-	ret = alienware_update_led(location);
+	ret = alienware_update_led(priv, location);
 
 	return ret ? ret : count;
 }
@@ -577,9 +586,11 @@ static ssize_t lighting_control_state_show(struct device *dev,
 					   struct device_attribute *attr,
 					   char *buf)
 {
-	if (lighting_control_state == LEGACY_BOOTING)
+	struct alienfx_priv *priv = dev_get_drvdata(dev);
+
+	if (priv->lighting_control_state == LEGACY_BOOTING)
 		return sysfs_emit(buf, "[booting] running suspend\n");
-	else if (lighting_control_state == LEGACY_SUSPEND)
+	else if (priv->lighting_control_state == LEGACY_SUSPEND)
 		return sysfs_emit(buf, "booting running [suspend]\n");
 
 	return sysfs_emit(buf, "booting [running] suspend\n");
@@ -589,6 +600,7 @@ static ssize_t lighting_control_state_store(struct device *dev,
 					    struct device_attribute *attr,
 					    const char *buf, size_t count)
 {
+	struct alienfx_priv *priv = dev_get_drvdata(dev);
 	u8 val;
 
 	if (strcmp(buf, "booting\n") == 0)
@@ -600,9 +612,9 @@ static ssize_t lighting_control_state_store(struct device *dev,
 	else
 		val = WMAX_RUNNING;
 
-	lighting_control_state = val;
+	priv->lighting_control_state = val;
 	pr_debug("alienware-wmi: updated control state to %d\n",
-		 lighting_control_state);
+		 priv->lighting_control_state);
 
 	return count;
 }
@@ -662,46 +674,26 @@ static int wmax_brightness(int brightness)
 static void global_led_set(struct led_classdev *led_cdev,
 			   enum led_brightness brightness)
 {
+	struct alienfx_priv *priv = container_of(led_cdev, struct alienfx_priv,
+						 global_led);
 	int ret;
-	global_brightness = brightness;
+
+	priv->global_brightness = brightness;
+
 	if (interface == WMAX)
 		ret = wmax_brightness(brightness);
 	else
-		ret = alienware_update_led(0);
+		ret = alienware_update_led(priv, 0);
 	if (ret)
 		pr_err("LED brightness update failed\n");
 }
 
 static enum led_brightness global_led_get(struct led_classdev *led_cdev)
 {
-	return global_brightness;
-}
-
-static struct led_classdev global_led = {
-	.brightness_set = global_led_set,
-	.brightness_get = global_led_get,
-	.name = "alienware::global_brightness",
-};
+	struct alienfx_priv *priv = container_of(led_cdev, struct alienfx_priv,
+						 global_led);
 
-static int alienware_zone_init(struct platform_device *dev)
-{
-	if (interface == WMAX) {
-		lighting_control_state = WMAX_RUNNING;
-	} else if (interface == LEGACY) {
-		lighting_control_state = LEGACY_RUNNING;
-	}
-	global_led.max_brightness = 0x0F;
-	global_brightness = global_led.max_brightness;
-
-	return led_classdev_register(&dev->dev, &global_led);
-}
-
-static void alienware_zone_exit(struct platform_device *dev)
-{
-	if (!quirks->num_zones)
-		return;
-
-	led_classdev_unregister(&global_led);
+	return priv->global_brightness;
 }
 
 static acpi_status alienware_wmax_command(void *in_args, size_t in_size,
@@ -1157,6 +1149,33 @@ static int create_thermal_profile(struct platform_device *platform_device)
 /*
  * Platform Driver
  */
+static int alienfx_probe(struct platform_device *pdev)
+{
+	struct alienfx_priv *priv;
+
+	if (!quirks->num_zones)
+		return -ENODEV;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	if (interface == WMAX)
+		priv->lighting_control_state = WMAX_RUNNING;
+	else
+		priv->lighting_control_state = LEGACY_RUNNING;
+
+	priv->pdev = pdev;
+	priv->global_led.name = "alienware::global_brightness";
+	priv->global_led.brightness_set = global_led_set;
+	priv->global_led.brightness_get = global_led_get;
+	priv->global_led.max_brightness = 0x0F;
+	priv->global_brightness = priv->global_led.max_brightness;
+	platform_set_drvdata(pdev, priv);
+
+	return devm_led_classdev_register(&pdev->dev, &priv->global_led);
+}
+
 static const struct attribute_group *alienfx_groups[] = {
 	&zone_attribute_group,
 	&hdmi_attribute_group,
@@ -1170,6 +1189,7 @@ static struct platform_driver platform_driver = {
 		.name = "alienware-wmi",
 		.dev_groups = alienfx_groups,
 	},
+	.probe = alienfx_probe,
 };
 
 static int __init alienware_wmi_init(void)
@@ -1217,16 +1237,8 @@ static int __init alienware_wmi_init(void)
 			goto fail_prep_thermal_profile;
 	}
 
-	if (quirks->num_zones > 0) {
-		ret = alienware_zone_init(platform_device);
-		if (ret)
-			goto fail_prep_zones;
-	}
-
 	return 0;
 
-fail_prep_zones:
-	alienware_zone_exit(platform_device);
 fail_prep_thermal_profile:
 	platform_device_del(platform_device);
 fail_platform_device2:
@@ -1241,7 +1253,6 @@ module_init(alienware_wmi_init);
 
 static void __exit alienware_wmi_exit(void)
 {
-	alienware_zone_exit(platform_device);
 	platform_device_unregister(platform_device);
 	platform_driver_unregister(&platform_driver);
 }
-- 
2.48.1

