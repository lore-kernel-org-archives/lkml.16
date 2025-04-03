Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E196820011F
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 19:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743707791; cv=none; b=MiofDgYMM8rX0yIn0cuAddLP4K+GBfV7wDa5TtO5i5EPqOAuFedjP1guSZd4dCQMWV3XSOZoJhWz3FLkQeCjL1YAKl+u9EWGArrRfUbB3tsNG1YyZVt/pflUD27K4xMJvq8MQJNLPGvo6I14t2x6k65zOB5g5RFGJat+kVKIJlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743707791; c=relaxed/simple;
	bh=bGaAiPeWPDujMReJfDlyeCQH1PMh/OahseP2Qm+tEqI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BVeH3SFoprjRfQuibdyitjPwnkl65/9CIMOH8g7ogdnalYS47nsIt+IHoZyZggxnLu+P2x4xjTi9e88OjqjG5EOpLO8/UFL4CDIJ2IfoDRquAwt1zYSiKQ5xtsWohSER3KKVXYrLSmWZlOwDWeC1Xn65E0JP31siG8pFyYMCTcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CkE1vVcq; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CkE1vVcq"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54acc0cd458so1565111e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 12:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743707786; x=1744312586; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yEqJQbM1Mf4t3pD37/T8xo0WrUZj8tqnA7nqQpopQiI=;
        b=CkE1vVcqmJ0VCZcMDdAuIgZ55E3XcNguuTEqB8SAxg3SuSdWoLcHrL4zjrsWbCPNnN
         1BBOMSPCKJ9UItHXgbun4sj1cUVQaTnSnY7joVOQWFTtgs+XyFKZWrSRGFtDwVSBjkgY
         2LujMk+EasSKezzcYqwIH5ZnlYiz5vehVx0qo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743707786; x=1744312586;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yEqJQbM1Mf4t3pD37/T8xo0WrUZj8tqnA7nqQpopQiI=;
        b=TS+zjCcl1mynQMSkh1euQ+HAgs3+bpb/EBH6VmcHrvFTeaUKlCgUFcwm7qDUcg6Wac
         D11kgC4O2XK6vNcYlRaX4bBz8HAyYM7KyT6hliM8qXXZAomz3MTm2DDX3HnGfGxOm5lf
         a/ax4XfvI9mY2+V23BH5orzStTCjhG/sNUZFVVx50/DftNSg6jBgspuBxfvpNtpnAAZV
         AJd8W0dlVPLQW18KJfdMSrrgk1cs/ciXcEj33NSET2jVGYYE+5Fd9PpyCSIJsVRevhet
         k+DdzafWrkMHL1c1j5vMr8yxjkhgBJfWBo3Sx6BxAUnu5zHoIFZkanx811gxOX64HA7G
         B58g==
X-Forwarded-Encrypted: i=1; AJvYcCW+Qu5fZ/OW1utFNQaygLgWV9Wj34M7MNQ7I1MDQg5Si7s18/8YrX57PQKXyVdvrlW5v/Gnp87zzET2KZo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw48VDfWKrHDfG/iEE+PDq0uofP6tsm7lVIYi/G6848zXT+RYe6
	MSdjhZzvq+pI4wh6+KKvq3AUT6qpTZ37lXXynjVK3CPhrv5mcvRxsCrkbGInTw==
X-Gm-Gg: ASbGncvg5DxG5RMXM+31+UE/rxO4Ltdckjr1Kf3NyhYeVzZoQf5J0+o18H3w+alhyiH
	ebPy8/R8dIi9L3KQx5+CNaPwIN5tQ+BAb4yyjp3JRtOlWuY0csaf2/oVqmVq52kNnn8cghWMHiB
	WnHhAi40fbnf3JenXqYXNW8nv5RAyyGpaeYqdWe5nTHDEPMfAJyvIo6va5eKeOIFXFcBNy8aqAJ
	YazyauHCbIL9VSAaHvfyffqs6fNKf/bK53YRPwVCD9T1zHekmzTg7tULiKWUH2BXusJfzoBLBs0
	lFz4QrTm5zavrxDd9OGKaccj+tZHJH3DYIi0J+WKkbgmmjrE5rBFDPxqK/bh/E/owy4vqSvco7i
	NLxTLUS7RNkyYpqwoQyFdsqSR
X-Google-Smtp-Source: AGHT+IEtxSrTjJbJCoji6jyspDiVzgskf1D1Wes/27FHcNtXF4JkR2nUjJNmG5ErLGGAKBQY96uhEw==
X-Received: by 2002:a05:6512:3c9c:b0:545:2c2c:5802 with SMTP id 2adb3069b0e04-54c227fec79mr118358e87.48.1743707785840;
        Thu, 03 Apr 2025 12:16:25 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e65d6b1sm230142e87.194.2025.04.03.12.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 12:16:25 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 03 Apr 2025 19:16:14 +0000
Subject: [PATCH 3/8] media: v4l: fwnode: Support acpi devices for
 v4l2_fwnode_device_parse
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-uvc-orientation-v1-3-1a0cc595a62d@chromium.org>
References: <20250403-uvc-orientation-v1-0-1a0cc595a62d@chromium.org>
In-Reply-To: <20250403-uvc-orientation-v1-0-1a0cc595a62d@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

This patch modifies v4l2_fwnode_device_parse() to support ACPI devices.

We initially add support only for orientation via the ACPI _PLD method.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/v4l2-core/v4l2-fwnode.c | 58 +++++++++++++++++++++++++++++++----
 1 file changed, 52 insertions(+), 6 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
index cb153ce42c45d69600a3ec4e59a5584d7e791a2a..81563c36b6436bb61e1c96f2a5ede3fa9d64dab3 100644
--- a/drivers/media/v4l2-core/v4l2-fwnode.c
+++ b/drivers/media/v4l2-core/v4l2-fwnode.c
@@ -15,6 +15,7 @@
  * Author: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
  */
 #include <linux/acpi.h>
+#include <acpi/acpi_bus.h>
 #include <linux/kernel.h>
 #include <linux/mm.h>
 #include <linux/module.h>
@@ -807,16 +808,47 @@ int v4l2_fwnode_connector_add_link(struct fwnode_handle *fwnode,
 }
 EXPORT_SYMBOL_GPL(v4l2_fwnode_connector_add_link);
 
-int v4l2_fwnode_device_parse(struct device *dev,
-			     struct v4l2_fwnode_device_properties *props)
+static int v4l2_fwnode_device_parse_acpi(struct device *dev,
+					 struct v4l2_fwnode_device_properties *props)
+{
+	struct acpi_pld_info *pld;
+	int ret = 0;
+
+	if (!acpi_get_physical_device_location(ACPI_HANDLE(dev), &pld)) {
+		dev_dbg(dev, "acpi _PLD call failed\n");
+		return 0;
+	}
+
+	switch (pld->panel) {
+	case ACPI_PLD_PANEL_FRONT:
+		props->orientation = V4L2_FWNODE_ORIENTATION_FRONT;
+		break;
+	case ACPI_PLD_PANEL_BACK:
+		props->orientation = V4L2_FWNODE_ORIENTATION_BACK;
+		break;
+	case ACPI_PLD_PANEL_TOP:
+	case ACPI_PLD_PANEL_LEFT:
+	case ACPI_PLD_PANEL_RIGHT:
+	case ACPI_PLD_PANEL_UNKNOWN:
+		props->orientation = V4L2_FWNODE_ORIENTATION_EXTERNAL;
+		break;
+	default:
+		dev_dbg(dev, "Unknown _PLD panel val %d\n", pld->panel);
+		ret = -EINVAL;
+		break;
+	}
+
+	ACPI_FREE(pld);
+	return ret;
+}
+
+static int v4l2_fwnode_device_parse_dt(struct device *dev,
+				       struct v4l2_fwnode_device_properties *props)
 {
 	struct fwnode_handle *fwnode = dev_fwnode(dev);
 	u32 val;
 	int ret;
 
-	memset(props, 0, sizeof(*props));
-
-	props->orientation = V4L2_FWNODE_PROPERTY_UNSET;
 	ret = fwnode_property_read_u32(fwnode, "orientation", &val);
 	if (!ret) {
 		switch (val) {
@@ -833,7 +865,6 @@ int v4l2_fwnode_device_parse(struct device *dev,
 		dev_dbg(dev, "device orientation: %u\n", val);
 	}
 
-	props->rotation = V4L2_FWNODE_PROPERTY_UNSET;
 	ret = fwnode_property_read_u32(fwnode, "rotation", &val);
 	if (!ret) {
 		if (val >= 360) {
@@ -847,6 +878,21 @@ int v4l2_fwnode_device_parse(struct device *dev,
 
 	return 0;
 }
+
+int v4l2_fwnode_device_parse(struct device *dev,
+			     struct v4l2_fwnode_device_properties *props)
+{
+	struct fwnode_handle *fwnode = dev_fwnode(dev);
+
+	memset(props, 0, sizeof(*props));
+
+	props->orientation = V4L2_FWNODE_PROPERTY_UNSET;
+	props->rotation = V4L2_FWNODE_PROPERTY_UNSET;
+
+	if (is_acpi_device_node(fwnode))
+		return v4l2_fwnode_device_parse_acpi(dev, props);
+	return v4l2_fwnode_device_parse_dt(dev, props);
+}
 EXPORT_SYMBOL_GPL(v4l2_fwnode_device_parse);
 
 /*

-- 
2.49.0.504.g3bcea36a83-goog

