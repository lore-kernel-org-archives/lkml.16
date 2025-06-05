Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB8227A47A
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 17:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749145991; cv=none; b=tMwO7Q1civx+fYhlCAyNBhIuyVze9lQZoJZ6wSJrcPGiiGHrv0C+ItgT4vJLRAFCywyxH+dMh03ApqoTzm6LXYp70cqKX21txJFIVuUii6+APN6P3rLulaT/8DVAx63TjpO75WFtZQBuyGfbTiePze1qvdok8358ea8k40tFmTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749145991; c=relaxed/simple;
	bh=yCJh8xYi8LYreBh5dydvM47XVBLZAxTNUSYJHtb7x4M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YIsR8pDNbj9XcQ9cOiG9m3e7wRCI7fCdZW7CvmWWmAA7XS771xC2N/UJbf869VtL7eQwsVQYE6LHx6/mUOdJF0o5SYBjs8AAsgBvZFNXaGAitMlqQIo7oc6aDuyAuwg7Rfxvtbljtt6uOYy+ItkV7TTEat8QJKc59A+wEOQbmhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=D1YRJps2; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="D1YRJps2"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-553241d30b3so1176693e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 10:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749145985; x=1749750785; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5bWh2ADW8TZRmlfflymQkf2Dq+w112Fwi8JTTMtqDFE=;
        b=D1YRJps2zRih9coxBVTJrdx/51+lbtjKYRtENATLKOOVOlpyGlG9RH6yDbXUop3PFC
         Li6dRkgEYA7bQK84Z1zpJ8upk7MmM5j3Fxoi04JNCcAEX2n+XWksq9RUbGaGHLWm1hVk
         kR7Zn2Yn9TS1/lFia5inydJLM2WAwPacg8Yrs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749145985; x=1749750785;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5bWh2ADW8TZRmlfflymQkf2Dq+w112Fwi8JTTMtqDFE=;
        b=xGOqeL+DbRcLmKParqOUligiWxOUatZ8zkyHoipQwLmgF+lQSMdO0fl6yVw3H7PYLc
         a4OsXmVyWe2K/m8VMAZKovuikwwQ2hvLNESzoQutIlnEV1c3+2peAevY8eMvMNN8HFcC
         eF86HsEX7sAoj5730URQEf5IGtdurqUhYM69WfdwwdGP84Lk0T4FNguJfIdvCryP73lz
         NGaQhx6nYndOg13Yw9pLHriIziTAdSkI9M741SVxdoJ9JOR7jJ6YEN0SizrTq6qo3Ml0
         ubp7zQp/rXrrJCkYQMDGkzsitecAMmP204xQG+KphRFzJkFZQOYU58b61D1ohownPxWQ
         sjYA==
X-Forwarded-Encrypted: i=1; AJvYcCUP2RE4TTa+yXj248bO3fMDMhfA96xWj5KiG99YLRn2Ow9V7DhrqD8S3nL+DB873wSJtFI1TpHvgvqhTQM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpIlwXrMu/9zxnnr0abmFsu04hdjM1JDwsL+F+6bqDXNoBczA9
	hcLUBwvPmqUYPPcQyk5L8oy8jzvX8b0YVhxEpwIrnJxyO2u7AjxzlVphqhYURVBWnvaV6InIvrW
	Fwg4=
X-Gm-Gg: ASbGncs5dXUCWPyK5/VQvwffZarGI72r8RAhl99nKxA1leQLG1JAgoO0O2ZV8BYXbp9
	uXJPCxobfNYUyAFdDpkZsjgJY9pMjZWABe7M9a7KkvEp+XqfLbByxWj+S4kQCPbDnoBv5yG7VCH
	kCGFJeUyB6S6GfHpk3uo4OLGNglxKDKAtzWWxIFyQ8qX9Sh/UPgEzX/uUHfmUXB2QTScVhsKwEa
	QHGo7hTGsENcEGf/7GSZwXxLTgLAXrM0UcT5pG5VSxJ922Fi+SSjyz6euc72zNV4arYrHWv6Ucx
	Gzbgo+Hyfpp2W/DZuCPf9swyfdtbBSSYV+RyiclX0YkdL7yvqY7ksdmVG76tU/6pAkApiiXIPbA
	QzrgGHSom47KIHWEy0NfDuD8Pug==
X-Google-Smtp-Source: AGHT+IHP/jNThy5aDvW7T/hvxtEAhADh14D+is1JaPoxECZSvFGKZLcZx8jZje+1dqjf1fDgdS/nDw==
X-Received: by 2002:a05:6512:2247:b0:553:2dce:3aab with SMTP id 2adb3069b0e04-55366c301f2mr13260e87.40.1749145985423;
        Thu, 05 Jun 2025 10:53:05 -0700 (PDT)
Received: from ribalda.c.googlers.com (90.52.88.34.bc.googleusercontent.com. [34.88.52.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553379379c2sm2641210e87.251.2025.06.05.10.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 10:53:05 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 05 Jun 2025 17:52:58 +0000
Subject: [PATCH v2 05/12] media: ipu-bridge: Use v4l2_fwnode for unknown
 rotations
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250605-uvc-orientation-v2-5-5710f9d030aa@chromium.org>
References: <20250605-uvc-orientation-v2-0-5710f9d030aa@chromium.org>
In-Reply-To: <20250605-uvc-orientation-v2-0-5710f9d030aa@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

The v4l2_fwnode_device_properties contains information about the
rotation. Use it if the ssdb data is inconclusive.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/pci/intel/ipu-bridge.c | 30 +++++++++++++++++++-----------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 020aa52f590d66b6d333adc56ebfb9ab0561db51..6f436a8b4d23373af8a6668530333a827eca467a 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -236,37 +236,41 @@ static int ipu_bridge_read_acpi_buffer(struct acpi_device *adev, char *id,
 }
 
 static u32 ipu_bridge_parse_rotation(struct acpi_device *adev,
-				     struct ipu_sensor_ssdb *ssdb)
+				     struct ipu_sensor_ssdb *ssdb,
+				     struct v4l2_fwnode_device_properties *props)
 {
 	switch (ssdb->degree) {
 	case IPU_SENSOR_ROTATION_NORMAL:
 		return 0;
 	case IPU_SENSOR_ROTATION_INVERTED:
 		return 180;
-	default:
+	}
+
+	if (props->rotation == V4L2_FWNODE_PROPERTY_UNSET) {
 		dev_warn(ADEV_DEV(adev),
 			 "Unknown rotation %d. Assume 0 degree rotation\n",
 			 ssdb->degree);
 		return 0;
 	}
+
+	return props->rotation;
 }
 
-static enum v4l2_fwnode_orientation ipu_bridge_parse_orientation(struct acpi_device *adev)
+static enum v4l2_fwnode_orientation
+ipu_bridge_parse_orientation(struct acpi_device *adev,
+			     struct v4l2_fwnode_device_properties *props)
 {
-	struct v4l2_fwnode_device_properties props;
-	int ret;
-
-	ret = v4l2_fwnode_device_parse(ADEV_DEV(adev), &props);
-	if (!ret || props.rotation == V4L2_FWNODE_PROPERTY_UNSET) {
+	if (props->orientation == V4L2_FWNODE_PROPERTY_UNSET) {
 		dev_warn(ADEV_DEV(adev), "Using default orientation\n");
 		return V4L2_FWNODE_ORIENTATION_EXTERNAL;
 	}
 
-	return props.orientation;
+	return props->orientation;
 }
 
 int ipu_bridge_parse_ssdb(struct acpi_device *adev, struct ipu_sensor *sensor)
 {
+	struct v4l2_fwnode_device_properties props;
 	struct ipu_sensor_ssdb ssdb = {};
 	int ret;
 
@@ -274,6 +278,10 @@ int ipu_bridge_parse_ssdb(struct acpi_device *adev, struct ipu_sensor *sensor)
 	if (ret)
 		return ret;
 
+	ret = v4l2_fwnode_device_parse(ADEV_DEV(adev), &props);
+	if (ret)
+		return ret;
+
 	if (ssdb.vcmtype > ARRAY_SIZE(ipu_vcm_types)) {
 		dev_warn(ADEV_DEV(adev), "Unknown VCM type %d\n", ssdb.vcmtype);
 		ssdb.vcmtype = 0;
@@ -287,8 +295,8 @@ int ipu_bridge_parse_ssdb(struct acpi_device *adev, struct ipu_sensor *sensor)
 	sensor->link = ssdb.link;
 	sensor->lanes = ssdb.lanes;
 	sensor->mclkspeed = ssdb.mclkspeed;
-	sensor->rotation = ipu_bridge_parse_rotation(adev, &ssdb);
-	sensor->orientation = ipu_bridge_parse_orientation(adev);
+	sensor->rotation = ipu_bridge_parse_rotation(adev, &ssdb, &props);
+	sensor->orientation = ipu_bridge_parse_orientation(adev, &props);
 
 	if (ssdb.vcmtype)
 		sensor->vcm_type = ipu_vcm_types[ssdb.vcmtype - 1];

-- 
2.50.0.rc0.642.g800a2b2222-goog

