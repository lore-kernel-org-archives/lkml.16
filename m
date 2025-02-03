Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF72D20E6FD;
	Mon,  3 Feb 2025 18:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738607253; cv=none; b=DLWL5TNRuX5VChMZYiSSYkhRTMzfBEwnuGcw8V6GAouiBTCj7TpSRxxqORKB66sFvkUPFc181hQrWciGfE0LJEo+0xfmOQ7ciKI6JEmx5GrkxzgYxESS0aj6AsFvIrWG4y5pzgnV6MoZU3Zr7b1pw/04HQp6I3EfdT43yyJEqoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738607253; c=relaxed/simple;
	bh=qRYy/r/XEIn6bETnvu6Yn5nbRR5ag52p7PQHk8zmJfo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bq7cPPZ34X3VtHGMJZELBcvlqzGhd3l+7nw3MlICso+OtDtBXcVnHIETK+SJbyHiawgpcbEkbCPOlY4uYToPOgr11gKWg//YyPdLWiwhU47sujcybBcIW6wWaO8qc7FjxLEKq6iWpFIA5tRvp1dj9w3UXwwPOsI1/Z5t7SGHdGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W9aW0diY; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W9aW0diY"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e549a71dd3dso4618051276.0;
        Mon, 03 Feb 2025 10:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738607250; x=1739212050; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2nYctGPSzCHBlA4oNi+PZAVP+DCpxvNXbv6MyrcOof0=;
        b=W9aW0diYAHpXOGKgcVv5IJX3/3Yy4pcOmeny8uDsHHhdf2ZUsmSr0qtZ7neQtFmyiS
         K4++aFjx7Q3FJZBJsImKxrWAIw81cvWZOOlz7OosYNgv+c9TrGnYdVBbvoB4wSYWfCAf
         G25OeXs6JOvjheLM+CUjTL6u8ic1JyUoLzGCDu2A++kTc8ttQKTXg8G2DVeddNzNNinO
         c6K7NlNJMwCYyUNBk7eizOi0Pd3Jp0097k7sexQXALkdXkEwTS39zVQ2Pu5K2yCqGdwc
         1jd++VdAIEkpUR0nBPUogojVPJOSU7UE+cHyFFjCqJBsHdCe6RvR+mhtHSHx4zU3wlWM
         GZFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738607250; x=1739212050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2nYctGPSzCHBlA4oNi+PZAVP+DCpxvNXbv6MyrcOof0=;
        b=vMedP6bI3Ai+JvjTkwqpHOGZag/p8M9kcgS410K/GJdlqWwOgVa4+vDRO3gAo25STd
         b8qviuQDf4itaxZVrHbRGpqktJeXMLmo95tebejKNcfGUzdOmAa29DRRdb/BtasBEWJf
         uUHp2L87zqihMGTKUKQwgvUWLsY1snATOp9ywV/pAFG5yj/kUqSRZ5V4M+BUJ6S/iBdI
         tjlw/bzAhQgmaP1MNl7t4kdpFieKiykw/q3Ql+5dIVPC8v4KaXL7kV8QNcDtg/Uklw9x
         RMoPvXOfnLI3sRzaf5HZkGxDenwVhem+c6Ky2jPSeoA6sWogMwOu2MiXMfhYJHXVVoyV
         UPcA==
X-Forwarded-Encrypted: i=1; AJvYcCVTjYi0W6HBXgkb26CZfmgHA8JE5Jd9EW2+B3n0c3k6tp/4E1DNxj/9rYyL4t/rA3n3lYYTRU3Intd3YtY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzxn1EsLpdmrjcSOKgvj1f4WxYPy1KIiPkszPcvsidiJQdOQctp
	HbuWWWunXXwMrg3KHeasin9PkfO07TeNVY6FfAELl3poU8wPXXhxWdc0XQ==
X-Gm-Gg: ASbGnctUS55yvtNPApzVJQlegkM10rRE+kWiopOPVhcsPzrZZ+Neg5SzGYgcR4rtJ2t
	Uha4L1eZB3grmB+bcGy3sw7H3u6mPnfHpm0eNN649MKUD96QnBcTRzg8kf5WxsHTisXTTB9kHS/
	rz/lEBwXywrdvmdSsOSWs42pc/8NHDTGNNHPloorLhJyGs9bZu0XiaoOiLd6RWE/v+ZSOp53Q4M
	FfOWr0mdZn7A/UVcuZXIBKC7mnuYCQI3Yf3hsxuwtfIsXOCmwVzt3K0YRMPVWdymRuKNYewjG0J
	lbupJOGNhlT1xSrQWNn+6e4=
X-Google-Smtp-Source: AGHT+IGrHiTWOyUF5ejqvlbp2LQNmtngaU1fN+bKmWYH9Utl6Hgtno8dBkY0fuUHVG5St1ch0tvsSg==
X-Received: by 2002:a05:6902:1b92:b0:e5a:e7eb:2803 with SMTP id 3f1490d57ef6-e5ae7eb2a74mr7686040276.18.1738607250258;
        Mon, 03 Feb 2025 10:27:30 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:3d2:4207:a956:ebad:2a64])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e5acb2bc726sm2142239276.30.2025.02.03.10.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 10:27:29 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	"Kurt Borja" <kuurtb@gmail.com>
Subject: [PATCH v8 04/14] platform/x86: alienware-wmi: Refactor LED control methods
Date: Mon,  3 Feb 2025 13:27:03 -0500
Message-ID: <20250203182713.27446-5-kuurtb@gmail.com>
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

