Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7774327A442
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 17:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749145991; cv=none; b=a+Pybnuknd16O/LN8MM3/A+Av0skORToLX4Og82fy+WM5hke1vXV+Ud36Y78OXIDFRmLmChMIwICeHuqFgo0iUcEYDSCJ0WkYlvolJSZekk0w4Mo96/oo+QLef9UBOgNWXCAyTyjLOajzM+Tcr/S+7YMblAZrRlH4Co59Daa40w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749145991; c=relaxed/simple;
	bh=HkpzCJY6QMUo/A2tmF9l8NRgkFwGl+Bw/RVcSwiZ3nc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RHCq/ozwIkrwQ396VZCiw0dDbbuQWUKwfw5ecfOnAE1qGq6cTf5FiOBIs9u+54g9LGXCwwxB2mF6sukxlgADIVwL2dMf2p4lFPxcbs2fQWujJio54mzqAVix/Y+DlwZQ4GkGDVTN/N49Uxj7vS57TpnkJOLgGrlzPxXa1RQGvqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mAIbvnSb; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mAIbvnSb"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-553543ddfc7so1375597e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 10:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749145985; x=1749750785; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IAddCa1zo14U93p/hxz3tXNuMoufL4dFoj1aELCNFac=;
        b=mAIbvnSbSujXriDone/jjS4I6hRdXbCA6Sb+MUaRuNWkIv0C+UTJskIZwnosB21vDQ
         GM5uBqOYGmjZmzBvzcWO3BRwgYvDA47BfeHSLZnpiQTPE8wlGEXSrIfXPI+cTZjNueI2
         ac8/+2ZXhvKnXpb3IYUEHaoCIdg3h+8EuvdfE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749145985; x=1749750785;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IAddCa1zo14U93p/hxz3tXNuMoufL4dFoj1aELCNFac=;
        b=ht3Vid6uHQ/J1O7VUgV/tz4zcyMLYtpMfTtwvxsVjLaCTLo64zGGzfzlJT+N/SSlmt
         wxrl8rklUAZNQisFcjgHX60POdnX2iLGktC2MfeKSk68LWLxCm4MIsgmNrkB8ix+Qukn
         VZuytXV/MncINuFwAGHCGKec/Z53EU98yZZLJTEPfMtzOdrvd2O+R9RZ4go4Uql1URk9
         hmMf1BtGv4u1iBqhaTUjs6v20tp3UYbtGIJ6GBoVjPzXFriCxIxgQFzB0JRsfQakR+zP
         LTx64T62oFB3CBt2LA0rJHneeSngk89z19blq3uYu7yDT7xu8CAHOApfPDhvX2/WYlrR
         rZjw==
X-Forwarded-Encrypted: i=1; AJvYcCU0qRmYTb9TOaMdgvqJVqAKX0jJcI0k+EPS4bvrOqpIrm+qKOhXeTou54VvUujwknegf1GXJ3iRtkFj7qU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0UCvmWzXBuLY4Kx5SBXGm34va0u4a7d2j+uAzA29E5G+gMUXg
	0658VoWr8B5Dt+KVbew1+TdsJQUAlBQvC3SJEJ3TPEbR+aPspslUEdNDht2IeLdLKF2OIPN4iwR
	Z5rs=
X-Gm-Gg: ASbGncu65DcEkVC4EymmiUnpfvk9wILVVArQnaRyF5gRPPdFstrQGlqqcURHA++R/Ja
	uP5ISUT3WsmLnPMn7SOfQ8LwBAd1s6K8Ku2qiQsV560nf6pqDu8cBoZxkNqjXEH3rz7CDwOT3Lw
	/lfhg0khelP+dqCiosODgylzMpSDXXVOgG4Z8Du3s6unlEJ75nGaYOW1MMZAj9LtR2ACAvwypM2
	QkmLpPyiZCWaj22JrL4Fju6eOlDlqjiYNjY/ws5b+Lk1SdORIlVEVkHTC8zzhAf7vL9jR65AUGs
	M2+yLSRK5C68bp7C9FAV/rRCGrJKuCPH5FK9opDhjghtSwtOk1VD98BS0qf/LS7rxZffPQDRNJV
	FohzUSZsUdetpWp4ZFZwWRWuTgQ==
X-Google-Smtp-Source: AGHT+IEuQ3DoWfSTvrnWbXmxFE5uIRwAzd3dzxpPZvGceJdrS5ZQ7/hUcchLBDj/wBd6vU9oMBKPzQ==
X-Received: by 2002:a05:6512:3e0f:b0:553:30fc:cedf with SMTP id 2adb3069b0e04-55366c1ee9emr20515e87.38.1749145984851;
        Thu, 05 Jun 2025 10:53:04 -0700 (PDT)
Received: from ribalda.c.googlers.com (90.52.88.34.bc.googleusercontent.com. [34.88.52.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553379379c2sm2641210e87.251.2025.06.05.10.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 10:53:04 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 05 Jun 2025 17:52:57 +0000
Subject: [PATCH v2 04/12] media: ipu-bridge: Use v4l2_fwnode_device_parse
 helper
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250605-uvc-orientation-v2-4-5710f9d030aa@chromium.org>
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

v4l2_fwnode_device_parse now supports acpi devices as well. Use the
helper instead of re-implement the logic.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/pci/intel/ipu-bridge.c | 32 ++++++--------------------------
 1 file changed, 6 insertions(+), 26 deletions(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 83e682e1a4b77d9d97b2988750732d0b7c9087b3..020aa52f590d66b6d333adc56ebfb9ab0561db51 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -253,36 +253,16 @@ static u32 ipu_bridge_parse_rotation(struct acpi_device *adev,
 
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
+	return props.orientation;
 }
 
 int ipu_bridge_parse_ssdb(struct acpi_device *adev, struct ipu_sensor *sensor)

-- 
2.50.0.rc0.642.g800a2b2222-goog

