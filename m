Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF291F7904;
	Fri,  7 Feb 2025 14:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738937292; cv=none; b=Mqe7+XhDaLylvswVtDMPagO5St4qzwc826gNyLhrSzl+z/yIh82VYSmqotP74s2+BSqJa0DHcZ0x0RX2eVbgrzFVQBCDebYlmCV3UiIKoMJfigOstwCoST3HdT7Fz+Nj+eWSamoflu2++sCVFWtdMMs/LzkJmHvjp9v9f5/w9j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738937292; c=relaxed/simple;
	bh=49eKxDqQtP3po1mBGZJU1bNO+vDFpnsz8KG9NigI21E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gc/lhopA6GGiveoAn/PorTvXzvYPJfJgM0s02oGvZHTl5EMKzzonNg8AwXSosqmRHHPGT7iNAe9NnkWHkl9bp/p5IZhzLUA/UnESSeenBZ26Ai4BwUHHaJrcTE0nEgjMP6FeNwg7qfLMH4IMytsxdeSncukfwZ28DbgSw1XUFUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FYu3WOtP; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FYu3WOtP"
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e3c8ae3a3b2so1661549276.0;
        Fri, 07 Feb 2025 06:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738937289; x=1739542089; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=78jUbb12GWv+OJbtaS4vNafGBdENBEI5UTnuBg/ppNE=;
        b=FYu3WOtPIf1J/HaGqV/mNoOk9Lz8gLFS/c9CVR7LGQzVz1MoND/LIFCKZcQW5alIaM
         5bC2lnXP0gFXlJ+Ks8T+dSb654dwkD0Q7UawHo8PR/JngqC/bxUv5uTH4XAxVcg7u5IG
         QkUH0oX89wlcjSEB/8VryI2fdnELl8zSYveXhOGXvUD/3K4fCWTR4Z3iq27MH21+Pm4S
         MrA37MDiEFNAvxXlGz9sD502wBLJS2408br3sqMlkeM9u2P//MEirbELdf8vdx1YvZn7
         f2mMNRp7eFQA2dNGuyRDbAaz2bHC7sH5X0TD9Eu/tGY3lMDU/b+bzmF7eNweuSHLolyY
         Azag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738937289; x=1739542089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=78jUbb12GWv+OJbtaS4vNafGBdENBEI5UTnuBg/ppNE=;
        b=niTr7PnkuBulSS1HF+44g5U++tNAesMly8MuNlVxWTqPAonxlIwiK7rqmntC7kTHMj
         qBG5ML7W9Js5qT0ZZ7T+z4WUdVA09pxRHOl8/zJfQq/c0F/c5lkTA0gTJqxM03PQjT3B
         sR0W7ueI8KjLFJrYyyvEvTC9wCoVewNVfopCIY6sZ3NulLuhPDc0PzWpTTUGx/DRRUeD
         C2JECdwz5Y3bllGTclkmAZ61KmOIwB6N5Ysv18ROSFqqeUo1Cp1FGLAWNJCWNCIGs59t
         LtlvNzer5XsCeIE+MAdsDV8ykVi0vYYC7fD6hMs6zZOJEf9P3GDQOo1OtehLInYkbDnv
         BUpg==
X-Forwarded-Encrypted: i=1; AJvYcCXSxmNvu4pQYByqh0EOIgdqyOZBFp8LUdMtFiI+4WuRUMgpxO3xZpkKJVatD69Jszf5TjbRUCU1M3ifIDw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEA8GDHs+8buPn+l2wu+dKk39R6aoZ7K8UoDSPeKhBkM8SVZvH
	gSM0KC8/bf7X8lijzxyHlSabE8FZFyM+xeCuhoI5Jpq+i+GtXaznW5sYTg==
X-Gm-Gg: ASbGncvNON+YnneRY+Iw03DcFP1J4OfkHNzm63p17qUNMnUn3id8ioXV16hbo1y2Qzu
	0WzaEupERZdaFQOkG05u7Xa46iIxoDVJbxE4n6rd/nmMruoPOURuPU/8SE0WYlJZO/npKwhObXX
	l1MQAvTiuCL8DAgxPK5qmtdkbfC1Ogq1PAwxmpAEj8XNs526Cgx0pmIJKZXL9Es50ai1e0QB05o
	1828PM/s4d5/7AHqhSa//gAi4qZILFNNaMayzfFladMhuK6Mzxodf6sIQ2D6jPsLiVdgqQkhb4M
	ePmU9gBIpMsa+9STGGQR29E=
X-Google-Smtp-Source: AGHT+IFevhJ9cciL54SwiH08riEH6aj6edC4nYaIu0IoLYwxfoaH0poaRA80/tyM9UfWvTC9ZdPMOA==
X-Received: by 2002:a05:690c:3610:b0:6f9:a997:3a52 with SMTP id 00721157ae682-6f9b29e29f0mr24671197b3.38.1738937289128;
        Fri, 07 Feb 2025 06:08:09 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:3d2:4207:a956:ebad:2a64])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f9a000f577sm5525607b3.118.2025.02.07.06.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 06:08:08 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	"Kurt Borja" <kuurtb@gmail.com>
Subject: [PATCH v9 01/14] platform/x86: alienware-wmi: Add a state container for LED control feature
Date: Fri,  7 Feb 2025 09:07:30 -0500
Message-ID: <20250207140743.16822-2-kuurtb@gmail.com>
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

