Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FA224817C;
	Fri,  7 Feb 2025 15:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738943219; cv=none; b=ptBcElYRXhZvc12ROGq0i1Ui2nZX57ksikK6DmpvKN4aWztwEPq/RS+eE4wB5izwYQF/njZ+lIKEZ933Dw3qIoSAtR+28b5oGa6bjgPXi3AiHRTJgPKHLcqStXxjqK5N9oQEDYJpSKCGZU2E2wB4AOUHLBuJ3jDsScB+EuCdjp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738943219; c=relaxed/simple;
	bh=qRYy/r/XEIn6bETnvu6Yn5nbRR5ag52p7PQHk8zmJfo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rjtd24ajJZbXF5wbzgtDduK6n9wlGDdlEscnQeh1DqMSFjcC0GOHMGoCesBaxqm+xFblu9V5RDtYLqm0G3E1EidtNFJuOlxGL0BFKSvfyhvhgtcfd/qHVjJGheDfVFxLq6/3n+HwnbHtdHoVaTWIQHgXaeMsa5p/eQxxB/Q+vrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DK8s4alK; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DK8s4alK"
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4ba74d1d4a9so729661137.1;
        Fri, 07 Feb 2025 07:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738943216; x=1739548016; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2nYctGPSzCHBlA4oNi+PZAVP+DCpxvNXbv6MyrcOof0=;
        b=DK8s4alK28eWtGsDAunlFBR0rW8W0jggXpgvElDg6kS3O7v2O+qbIfk8lOolDjzFXV
         5XVeKut95Z6oJ41FvzC0d8l157tPlrXIOiWmPxAcNNOdxcJgsBzj6NTww8XwIaUOIBLQ
         VyG5he6M6a01nWi5cmdQvn+qqX6UXYIGVLbIZslQZ3dA9e/KPwl/XBBY32seJ/XnYjU3
         XWYnfZkJ+jn32eE29a7dx2BWzQczdbiEPP6ZaGE31IrHvV8M7aS59Qwwzip13LccUPYf
         6aJfI4So4QZqF2aNzImjeN5aiihxl3YwDeHEXcEhAD2lDjLRMrW1jFgBPJBvHhCILYTR
         8CGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738943216; x=1739548016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2nYctGPSzCHBlA4oNi+PZAVP+DCpxvNXbv6MyrcOof0=;
        b=lnhRVyFiOGIcpUVSzrnf32sAN7GO7rJtO8/HC1FnUvNBMipNfNWJ0hL18O/Ehc87w+
         CkY3peWCbtvfaTN/1P1Ekb1NDziw1D8sRcyPyCoMHb6eeFnE18L+EZw8HXsaKswSEuVS
         1J465dY02JKSZp3zqDoWIkpGCj4/BhC8/T0CSKqqWE8Bgoq/qppkQR+wr2KnMURpjFb7
         cgs//32RB2PpZh+a5YJ6/iaDo5wvDK/wrcLjnmqfFLr22qKRuO1dWoQfxSYyJyLv1Rwj
         8B1HF1JNa3jnznNuqVEF1Jx88L+wnZ0Tpz+U4bLCaYNGQYvdlku7KA9l52GKSz8H8WKQ
         zOAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqq+viOYQtfvoCmHocUlvZNvri9irXiecPLjKmNJB5Hepr+QdgeYVTHjOEFDRf/1ScLIVCw/0U3NFWNZE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8rYnXc/Z7O+9rOwOJhecHLTyRFQe2vGO42r+BwLuN5OJNrcRm
	Xk31YpXu4hA3wNtPRtSr/ERbJYCvksCoZi+zs3zHL/gitMqgq9kWWEGBXw==
X-Gm-Gg: ASbGncsOwFw49jjwdUCwuuw7tBnkj+ECM+PdZJtUA0b4hgYJmhFJTdZmKV73wZvifGL
	2lUSqiyWLMio8W8wDJoqKEJo/Z3Ds39EiLEEoxuG1pmEI3DxIdNljtx5BTlZIvh5qCNNFS9LLFC
	SnDeRu+9OIOLkmdQhM1Sq9AWwhdUAWN55e/h0k/+rEvQT9Et3JTNYsLtflv/MqZoCdkn6bUjm77
	GKfoc9lckwivDTlooVxp3NLmBIjZDo5fzF8T9XzzXg4g4QTjwDG3KzqfuYQdtZNAp77muumNWDz
	5lbLX5oyj7d3/POasvTS4Vc=
X-Google-Smtp-Source: AGHT+IE0LSX/hrQKlZegvBTwRZ93bnWsGrwABQ78G214sOxPojx3T9hF3uWnc5cyEOp+O7Gzxct7jg==
X-Received: by 2002:a05:6102:5e96:b0:4b9:bd30:34c6 with SMTP id ada2fe7eead31-4ba85e8cd46mr2871213137.15.1738943215684;
        Fri, 07 Feb 2025 07:46:55 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:3d2:4207:a956:ebad:2a64])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4ba76cb8e44sm768456137.0.2025.02.07.07.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 07:46:54 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	"Kurt Borja" <kuurtb@gmail.com>
Subject: [PATCH v10 04/14] platform/x86: alienware-wmi: Refactor LED control methods
Date: Fri,  7 Feb 2025 10:46:00 -0500
Message-ID: <20250207154610.13675-5-kuurtb@gmail.com>
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

Both WMI devices handled by this module specify a distinct interface for
LED control. Previously this module handled this by dynamically adapting
arguments passed to wmi_evaluate_method() based on the `interface`
global variable.

To avoid the use of global variables, and enable the migration to
non-deprecated WMI methods, let the WMI drivers define upd_led and
upd_brightness operations, which completely replace
alienware_update_led() and wmax_brightness().

Also define alienware_wmi_command(), which serves as a wrapper for
wmidev_evaluate_method(). This new method is very similar to
alienware_wmax_command() but is WMI device agnostic.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/alienware-wmi.c | 166 ++++++++++++++--------
 1 file changed, 104 insertions(+), 62 deletions(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
index 9512143c82ec..525d25a1fa6c 100644
--- a/drivers/platform/x86/dell/alienware-wmi.c
+++ b/drivers/platform/x86/dell/alienware-wmi.c
@@ -10,6 +10,7 @@
 #include <linux/acpi.h>
 #include <linux/bitfield.h>
 #include <linux/bits.h>
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/platform_profile.h>
@@ -426,12 +427,43 @@ struct alienfx_priv {
 	u8 lighting_control_state;
 };
 
+struct alienfx_ops {
+	int (*upd_led)(struct alienfx_priv *priv, struct wmi_device *wdev,
+		       u8 location);
+	int (*upd_brightness)(struct alienfx_priv *priv, struct wmi_device *wdev,
+			      u8 brightness);
+};
+
 struct alienfx_platdata {
 	struct wmi_device *wdev;
+	struct alienfx_ops ops;
 };
 
 static u8 interface;
 
+static int alienware_wmi_command(struct wmi_device *wdev, u32 method_id,
+				 void *in_args, size_t in_size, u32 *out_data)
+{
+	struct acpi_buffer out = {ACPI_ALLOCATE_BUFFER, NULL};
+	struct acpi_buffer in = {in_size, in_args};
+	acpi_status ret;
+
+	ret = wmidev_evaluate_method(wdev, 0, method_id, &in, out_data ? &out : NULL);
+	if (ACPI_FAILURE(ret))
+		return -EIO;
+
+	union acpi_object *obj __free(kfree) = out.pointer;
+
+	if (out_data) {
+		if (obj && obj->type == ACPI_TYPE_INTEGER)
+			*out_data = (u32)obj->integer.value;
+		else
+			return -ENOMSG;
+	}
+
+	return 0;
+}
+
 /*
  * Helpers used for zone control
  */
@@ -462,46 +494,6 @@ static int parse_rgb(const char *buf, struct color_platform *colors)
 /*
  * Individual RGB zone control
  */
-static int alienware_update_led(struct alienfx_priv *priv, u8 location)
-{
-	int method_id;
-	acpi_status status;
-	char *guid;
-	struct acpi_buffer input;
-	struct legacy_led_args legacy_args;
-	struct wmax_led_args wmax_basic_args;
-	if (interface == WMAX) {
-		wmax_basic_args.led_mask = 1 << location;
-		wmax_basic_args.colors = priv->colors[location];
-		wmax_basic_args.state = priv->lighting_control_state;
-		guid = WMAX_CONTROL_GUID;
-		method_id = WMAX_METHOD_ZONE_CONTROL;
-
-		input.length = sizeof(wmax_basic_args);
-		input.pointer = &wmax_basic_args;
-	} else {
-		legacy_args.colors = priv->colors[location];
-		legacy_args.brightness = priv->global_brightness;
-		legacy_args.state = 0;
-		if (priv->lighting_control_state == LEGACY_BOOTING ||
-		    priv->lighting_control_state == LEGACY_SUSPEND) {
-			guid = LEGACY_POWER_CONTROL_GUID;
-			legacy_args.state = priv->lighting_control_state;
-		} else
-			guid = LEGACY_CONTROL_GUID;
-		method_id = location + 1;
-
-		input.length = sizeof(legacy_args);
-		input.pointer = &legacy_args;
-	}
-	pr_debug("alienware-wmi: guid %s method %d\n", guid, method_id);
-
-	status = wmi_evaluate_method(guid, 0, method_id, &input, NULL);
-	if (ACPI_FAILURE(status))
-		pr_err("alienware-wmi: zone set failure: %u\n", status);
-	return ACPI_FAILURE(status);
-}
-
 static ssize_t zone_show(struct device *dev, struct device_attribute *attr,
 			 char *buf, u8 location)
 {
@@ -518,13 +510,14 @@ static ssize_t zone_store(struct device *dev, struct device_attribute *attr,
 {
 	struct alienfx_priv *priv = dev_get_drvdata(dev);
 	struct color_platform *colors = &priv->colors[location];
+	struct alienfx_platdata *pdata = dev_get_platdata(dev);
 	int ret;
 
 	ret = parse_rgb(buf, colors);
 	if (ret)
 		return ret;
 
-	ret = alienware_update_led(priv, location);
+	ret = pdata->ops.upd_led(priv, pdata->wdev, location);
 
 	return ret ? ret : count;
 }
@@ -660,36 +653,17 @@ static struct attribute_group zone_attribute_group = {
 /*
  * LED Brightness (Global)
  */
-static int wmax_brightness(int brightness)
-{
-	acpi_status status;
-	struct acpi_buffer input;
-	struct wmax_brightness_args args = {
-		.led_mask = 0xFF,
-		.percentage = brightness,
-	};
-	input.length = sizeof(args);
-	input.pointer = &args;
-	status = wmi_evaluate_method(WMAX_CONTROL_GUID, 0,
-				     WMAX_METHOD_BRIGHTNESS, &input, NULL);
-	if (ACPI_FAILURE(status))
-		pr_err("alienware-wmi: brightness set failure: %u\n", status);
-	return ACPI_FAILURE(status);
-}
-
 static void global_led_set(struct led_classdev *led_cdev,
 			   enum led_brightness brightness)
 {
 	struct alienfx_priv *priv = container_of(led_cdev, struct alienfx_priv,
 						 global_led);
+	struct alienfx_platdata *pdata = dev_get_platdata(&priv->pdev->dev);
 	int ret;
 
 	priv->global_brightness = brightness;
 
-	if (interface == WMAX)
-		ret = wmax_brightness(brightness);
-	else
-		ret = alienware_update_led(priv, 0);
+	ret = pdata->ops.upd_brightness(priv, pdata->wdev, brightness);
 	if (ret)
 		pr_err("LED brightness update failed\n");
 }
@@ -1249,10 +1223,49 @@ static int alienware_alienfx_setup(struct alienfx_platdata *pdata)
 /*
  * Legacy WMI driver
  */
+static int legacy_wmi_update_led(struct alienfx_priv *priv,
+				 struct wmi_device *wdev, u8 location)
+{
+	struct legacy_led_args legacy_args = {
+		.colors = priv->colors[location],
+		.brightness = priv->global_brightness,
+		.state = 0,
+	};
+	struct acpi_buffer input;
+	acpi_status status;
+
+	if (legacy_args.state != LEGACY_RUNNING) {
+		legacy_args.state = priv->lighting_control_state;
+
+		input.length = sizeof(legacy_args);
+		input.pointer = &legacy_args;
+
+		status = wmi_evaluate_method(LEGACY_POWER_CONTROL_GUID, 0,
+					     location + 1, &input, NULL);
+		if (ACPI_FAILURE(status))
+			return -EIO;
+
+		return 0;
+	}
+
+	return alienware_wmi_command(wdev, location + 1, &legacy_args,
+				     sizeof(legacy_args), NULL);
+}
+
+static int legacy_wmi_update_brightness(struct alienfx_priv *priv,
+					struct wmi_device *wdev, u8 brightness)
+{
+	return legacy_wmi_update_led(priv, wdev, 0);
+}
+
 static int legacy_wmi_probe(struct wmi_device *wdev, const void *context)
 {
 	struct alienfx_platdata pdata = {
 		.wdev = wdev,
+		.ops = {
+			.upd_led = legacy_wmi_update_led,
+			.upd_brightness = legacy_wmi_update_brightness,
+		},
 	};
 
 	return alienware_alienfx_setup(&pdata);
@@ -1287,10 +1300,39 @@ static void __exit alienware_legacy_wmi_exit(void)
 /*
  * WMAX WMI driver
  */
+static int wmax_wmi_update_led(struct alienfx_priv *priv,
+			       struct wmi_device *wdev, u8 location)
+{
+	struct wmax_led_args in_args = {
+		.led_mask = 1 << location,
+		.colors = priv->colors[location],
+		.state = priv->lighting_control_state,
+	};
+
+	return alienware_wmi_command(wdev, WMAX_METHOD_ZONE_CONTROL, &in_args,
+				     sizeof(in_args), NULL);
+}
+
+static int wmax_wmi_update_brightness(struct alienfx_priv *priv,
+				      struct wmi_device *wdev, u8 brightness)
+{
+	struct wmax_brightness_args in_args = {
+		.led_mask = 0xFF,
+		.percentage = brightness,
+	};
+
+	return alienware_wmi_command(wdev, WMAX_METHOD_BRIGHTNESS, &in_args,
+				     sizeof(in_args), NULL);
+}
+
 static int wmax_wmi_probe(struct wmi_device *wdev, const void *context)
 {
 	struct alienfx_platdata pdata = {
 		.wdev = wdev,
+		.ops = {
+			.upd_led = wmax_wmi_update_led,
+			.upd_brightness = wmax_wmi_update_brightness,
+		},
 	};
 	int ret;
 
-- 
2.48.1

