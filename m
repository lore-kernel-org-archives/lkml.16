Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613391D86E8;
	Mon,  3 Feb 2025 06:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738563782; cv=none; b=gasY0EPXJQbKC56Bjk1EDKkzbZowD7df+T4B2KTVdye6GCztRBA0jawymN8NQu1fxbn/WaZ4dt3XQUteEh42JZLjefnbXJbLccd73sy1FFxUyWdQcpRQIJjmJe2g11c3wx3qi/27qBMiA8WR2MwmOWjB234m8JB5w+z67TyZh7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738563782; c=relaxed/simple;
	bh=sKNBdeGoFKtxdg6L0v0QvFc6CvZcS9SIg4xZ579fCH0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=djgizuKAyi8QBoH5KDS3oJRcxfMqe+j0ctMqQarHr21rQkNm90h6WJvV7++w3XnU97yEcGq4QPc29BwiT8KnEoffaEcc8ZbJ54svU3KilWLt8LBW+UWtvCpAQFHP5MJSaKQct1JNWZhq1Uw9BjQcoDY3mL/6XYQ1QUY1YhkI7/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CHLEzeHK; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CHLEzeHK"
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-51eb1a714bfso2142827e0c.3;
        Sun, 02 Feb 2025 22:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738563779; x=1739168579; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xqN943/qLZGcAfve17iT4qcboECw8oPXUJUF0X0yxQk=;
        b=CHLEzeHKTDnS/WjR06ynhwEwQqIOHl7fUsMdNI99Kc4i8JsthMbqsDDorTnhWVcKSu
         2MJt7cGsFLBMJZLGkaMzLA6luoZ9+vaXGokqUfAKf8xGWg59bFRLFps/Wj6IzCKGwapq
         ybI7XFU3HfPMxaIe/vcjlKiz7e6k98JoPDRe27VX+HIGnCcSF+n2j52JRqt53gOw150V
         HeNgbxJnP08aB7+wPLE/vNFum0rPeK+zvxHsZdCo/+WMOG1LUShZldoZHUjE4do+UWIZ
         7BjNVb+RQh/BjgE6/u4/qoL5eSjkXZC4bI3x90hdMCot0pbdIPfFBt4mUKGaE9lQXKQ0
         GhTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738563779; x=1739168579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xqN943/qLZGcAfve17iT4qcboECw8oPXUJUF0X0yxQk=;
        b=XPwNoq4tCVWn7733u5Lawzp8E5XMmaufDNaxcU+bKcH1PpjVsOudzB0kZP/lGyRp9c
         9lPmYARaha1VHbxlnSsvua+zXxmx+CgYdNOpVunp9B+jQ4cDJpZkr1wSVmg4Nsty5u9S
         fuVatp4Ak7/SF4Hcguyg9aBcOa93hIBzShT13a9Ss4UBlsMBFbB0jTK6BsOu3NZ7U598
         kZMFomQNDLPlnWY96mZn/mfHtyfYwB+tYonq3XWorIF5LFJ1cU6LB5Q7cuejZQEE0bmm
         BZ2OpapO282lPNd27HHky7TQyDfd6D57MXU64QgYKXJJl5NPPnRhSrp2ANrr23AXCt0/
         bciw==
X-Forwarded-Encrypted: i=1; AJvYcCVhu5/rmDhzpe4iMZsNCxHGYp6IV6IiAMDaA03sJe8EGtKcT/fa38U9D5FyUlsO/fbyZ/sAEQniH2dtu/A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1JBNbE8jNYDCl9eOtkKqXqnqlgBwDH7lmUqYIPM93SPfMVcSB
	at5FIRHaAtdgkV2Wt7AwXU1dGGdUds2rlg1ecvHhsKLDNdEsiEnd/QyWeQ==
X-Gm-Gg: ASbGncsmoYk8BcgKfgaqMXlrGhEgJQ9tQf0IlAbuZZQvHhNLH1JLJlBv6SzlqaFN7hf
	FUPpFm1ZxvNYtvigGNlWQR3WynDQY0tml5bmKhR5aM/Hdhjizg5rW1Qt4G/jS9NGtr3rnie00kG
	mjrb04FpW9MRT+3RwBGWG3cBPJ3TFlj+Y+iJYsssqLnFeBBJ0AGyFxhcLKN0AI2RjJNE7DHH2k7
	e4w/PZCrcFov0ZHomehoFtjmr0Q11mpJUPZ8c3+WztGRrm7/Jowzd9WjkgdlGMM6bEkgo3zVPSM
	or00WuAC+BaSXG6fvRrSvi8=
X-Google-Smtp-Source: AGHT+IFtYp5yzVXnLTSbSnBLF7gRcmwRhTabc/8C+wG06usSxyFeyomq8LA6Xwd0BKLQY/xMxr+L9g==
X-Received: by 2002:a05:6122:3184:b0:50a:d1e3:82f7 with SMTP id 71dfb90a1353d-51e9e42a7a9mr13209376e0c.8.1738563779072;
        Sun, 02 Feb 2025 22:22:59 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:3d2:4207:a956:ebad:2a64])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51eb1d64c20sm1138789e0c.32.2025.02.02.22.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 22:22:58 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	"Kurt Borja" <kuurtb@gmail.com>
Subject: [PATCH v7 04/14] platform/x86: alienware-wmi: Refactor LED control methods
Date: Mon,  3 Feb 2025 01:20:45 -0500
Message-ID: <20250203062055.2915-5-kuurtb@gmail.com>
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
index 6a3385350725..b069c5c585be 100644
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
@@ -1254,10 +1228,49 @@ static int alienware_alienfx_setup(struct alienfx_platdata *pdata)
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
@@ -1292,10 +1305,39 @@ static void __exit alienware_legacy_wmi_exit(void)
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
 	struct platform_device *pdev;
 	int ret;
-- 
2.48.1

