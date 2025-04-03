Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09319200B8B
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 19:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743707791; cv=none; b=AKppidr48kaFr4kY3roE6/ArYKgPXbEWb+cupgbsJ5fbF/kMI3Q0uBwfNHcAZYpjwOQ9qu+EyNWz5wiBV+XQPVZe/QSMNtrjwYiUk72j3W94ubnBwecRfI3zF7YojJdBdEHR9ZqpmCQ76Cj0+LHbqyUOJLLMAlrtIJq47vy7qhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743707791; c=relaxed/simple;
	bh=FkbqQupMpzx0wszT8hmcVx+KkNGgx/ddD0tHr201vd4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MQJ0H628V98Owiavd8w4Y2ktHYCUkJYvsBoYRGlSrd3pumk+PreQn2MVOdbeHJ43owjo6Lxgh+Le5sHBq80NHLK2b5f0UjMDb5+JTR2ZiAzaqSLZ7QPgDK8YY54SRtmfZ6SPeccFUVb4EO3TMG54hyx7DCadA73f3b/tZgnQWe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DUVN8BoL; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DUVN8BoL"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54b09cb06b0so1364529e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 12:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743707787; x=1744312587; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Ka+lvT2WWas4h5SU2dyS9iOFUZ7NSTxVoiGdeZqTAM=;
        b=DUVN8BoLDufoqp6l9PgZ5nVu3y253dfDUXL3m5TFpnDjZ3dSFN7nP4iUbleHFalBTX
         w80OnXcSo1FFVsDLrQyDbl3Y6f4h0474jHBY6XzRh0KXF6j0X5k8ZJFiX3qeTgf3IxeK
         +IrnGEhZH2B3yyG51KNx2kjMbPi8IodSCNHto=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743707787; x=1744312587;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Ka+lvT2WWas4h5SU2dyS9iOFUZ7NSTxVoiGdeZqTAM=;
        b=DGpZaA6WdTL7/2jMd+hAjj4u2WMajTa7VIUHXwJKFs1RJztRn9A781cAfmoukaGlr9
         mjmMgVGNmAeeDGO2ov5Ds6YFYeR5QkBM/qmJ9JMH7EQT/s/4jyUyBjrSumvAjYy0KwsI
         0tz9YDhu5i3qi/U7n2dTQxEo96f4w60MYeSGbEb9wJ8nefeTKNaAbOKZyzRwB7tMPTOi
         R+b3d0jwtV6oLfbMB2wGRYOnvvRB1Lhg/UQvCG0h38Sp9W5hSisEoL+cd//xz6ZA4Ddb
         j2LrTujFmlJ3vHJSTItKcdIpkVYsItVVy9muZ4oAFCYqCTUGNtzWmw3ZulGNr0AmK5nn
         s1eg==
X-Forwarded-Encrypted: i=1; AJvYcCWWu3ZhEwUgrJHG3e+u2bWUGRBpGZ6gn3hAFhJDI8Hnbpeh9HslFGTbEz+lOtYzEUJhNSIW2FroCPJI1CY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNjLQn2WVMt8Jsf9PJiOXNYt6wmrGERFPZmBSUI3idSS6fq+ZU
	mL4ApTfYr3/RQrrxGXuqlUl4yiuN5SQxXETbeSjeejUtxMjjobTk4esftmUJCQ==
X-Gm-Gg: ASbGncuQNWH16D1/FmTHGkXJiT3IdeG1albrVcXeSmmZoi51QR3ICknmJEFUWv+Lhqu
	9o0cnNbxOa9Ny07TgMr7l/HFec1zzvIY5Enf4jAzO9Si/QenNg0dImZznPTp/W1EYnspnC4CPSP
	+8ZzLbtq+afC4y64/Lih7+ULMYAxvCloQVGac5zmzfyFCa3mEcnstecvgiNpPE3osSiQ5qIF1Wy
	ttzvlZJCJUXuMIZYZS++d9mdOSCuFur5/oS/eS8HoVGYJxLUun+1YKYvAhCowC69m5FAh+e8Ly0
	xXPgzS5ZO5JLEnqhNpnScxkbC+Y0svdEl7PPPqKUz9DFulef0n3okqdqyGqtmhzIHWOMrZ+C5yC
	cRDu3suc6EFwmYn1nULpuPKna
X-Google-Smtp-Source: AGHT+IEoqeMaCo7VWkarYWDP+GRzyBsI/lGXquNjw+btFYnKJTWgwFNKTpnH5nMpaFghhD3kro9NkQ==
X-Received: by 2002:a05:6512:3a87:b0:549:31e4:9ea with SMTP id 2adb3069b0e04-54c2282454fmr77746e87.52.1743707786957;
        Thu, 03 Apr 2025 12:16:26 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e65d6b1sm230142e87.194.2025.04.03.12.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 12:16:26 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 03 Apr 2025 19:16:15 +0000
Subject: [PATCH 4/8] media: ipu-bridge: Use v4l2_fwnode_device_parse helper
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-uvc-orientation-v1-4-1a0cc595a62d@chromium.org>
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

v4l2_fwnode_device_parse now supports acpi devices as well. Use the
helper instead of re-implement the logic.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/pci/intel/ipu-bridge.c | 32 ++++++--------------------------
 1 file changed, 6 insertions(+), 26 deletions(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 1cb7458556004d2073688bb0d11defd01f2f61b7..79e6998d37dfde50bd4b44584c8864178527d951 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -251,36 +251,16 @@ static u32 ipu_bridge_parse_rotation(struct acpi_device *adev,
 
 static enum v4l2_fwnode_orientation ipu_bridge_parse_orientation(struct acpi_device *adev)
 {
-	enum v4l2_fwnode_orientation orientation;
-	struct acpi_pld_info *pld = NULL;
+	struct v4l2_fwnode_device_properties props;
+	int ret;
 
-	if (!acpi_get_physical_device_location(ACPI_PTR(adev->handle), &pld)) {
-		dev_warn(ADEV_DEV(adev), "_PLD call failed, using default orientation\n");
+	ret = v4l2_fwnode_device_parse(ADEV_DEV(adev), &props);
+	if (!ret || props.rotation == V4L2_FWNODE_PROPERTY_UNSET) {
+		dev_warn(ADEV_DEV(adev), "Using default orientation\n");
 		return V4L2_FWNODE_ORIENTATION_EXTERNAL;
 	}
 
-	switch (pld->panel) {
-	case ACPI_PLD_PANEL_FRONT:
-		orientation = V4L2_FWNODE_ORIENTATION_FRONT;
-		break;
-	case ACPI_PLD_PANEL_BACK:
-		orientation = V4L2_FWNODE_ORIENTATION_BACK;
-		break;
-	case ACPI_PLD_PANEL_TOP:
-	case ACPI_PLD_PANEL_LEFT:
-	case ACPI_PLD_PANEL_RIGHT:
-	case ACPI_PLD_PANEL_UNKNOWN:
-		orientation = V4L2_FWNODE_ORIENTATION_EXTERNAL;
-		break;
-	default:
-		dev_warn(ADEV_DEV(adev), "Unknown _PLD panel val %d\n",
-			 pld->panel);
-		orientation = V4L2_FWNODE_ORIENTATION_EXTERNAL;
-		break;
-	}
-
-	ACPI_FREE(pld);
-	return orientation;
+	return props.rotation;
 }
 
 int ipu_bridge_parse_ssdb(struct acpi_device *adev, struct ipu_sensor *sensor)

-- 
2.49.0.504.g3bcea36a83-goog

