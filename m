Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A48E224AEB
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 13:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739192688; cv=none; b=fZ9SIIWQR3tQFQa9AkBAsV22n9+sm8spJK7tvJndCAddX7HIP64FFnrqRbmJe93IN4d0aLjXs/O4ESe/cMBaufPyBLTdcd1FyjGmDH0hKVwgWrsGRG+s6FL+oY/Vw5Sp1C5+MDgOQN8Aai+qAjjpn8ElxYEnVM3erhS0BiPGX0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739192688; c=relaxed/simple;
	bh=yKTOzHvjtUJZ30ThdYOqib27UhbmSihpmMZ6uLIRUrM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AdPo0EO5gvCYMs5NKE75wJO2m8awubKU9iZN54CzmVCTTrlj9RPzP+A+R6D1zGgCKpkThFgOJQbJCYAPCvXWN2zQCkuWloFoSXlB1Mq2vp8M8W8hF/TzBO4eRN7QqcV+DRnxfHcUnkNCf+hNPmkL8ksFrQWLSAxb2/YLy0fUWn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=V5yO5awP; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="V5yO5awP"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ab7d3bcf1ceso47060266b.3
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 05:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1739192683; x=1739797483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HaW26J7mtZirTrALfRYZJBUEjaYSL5x2uLwPDfHyOao=;
        b=V5yO5awP3dU/0arWToQPeBKAqfhuYVMg7zJyI0jc7FFlSitYFUCfQhUGPoiraqVPUg
         Cmfw73t+BiR+9dut8G7BqJhrsxaZYgIkXbUiAgGi9GBUGswD0hjEGG+JABcQzt6lBeBO
         y9Wc+S/l2T8nJHuKi0n773zs3ZrxgVmyPmO+I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739192683; x=1739797483;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HaW26J7mtZirTrALfRYZJBUEjaYSL5x2uLwPDfHyOao=;
        b=NYEHw1AJXFRHpMePCL/luimRzZA4lGY6WAJYZLx3jswV+/LY3Zn0lmN4h+Xb7HA9Sa
         Lov0WK3PTuQx6ZPBfb6LDywZwyAho7udKD9xqrQHG7My7Dtuy4366R3TlpiUQpt07Q/a
         oh58vWJtVZ5RgKgH+xc1s4rOT9NUHRm/lrqHxrEaO52h0921j1WfXChToFjHinEvRs35
         Ef6Onu6mFUcya9/L+VNF2t1/OxyErGt3I67xpihwJICrb5kVgV872xLEpjV6Qs0tq6Zg
         3DK8lrPMvssw0IQZwYj6G7l9TdFxBkvpzQJAS4EpViUTWZ+Utqhw2u70iIx21gnrqX0K
         QNVA==
X-Gm-Message-State: AOJu0Yz1LCWy1QwSsxo/3YyjOJGGiggV8h9pXuG0HVsW/eGi2ITXMueb
	IlnQg4HTVGfqHHsN8BA2g6IbFyEMEDkZ1NlUmvySM7EvCsDUnzQYqiYjzPYlPw==
X-Gm-Gg: ASbGncsbLouCZIqdCmPjUlsd8ljRD4+ET6hdYgX6AblRWAVvbQnHYsgI8XUzCCAHyTw
	2KF3YPDJ/t00tf2F8gbei1qIjAESuQjgXuIOf8CYumeFOO756tgLumql4JLaIvCvdFqM2Y4cQQA
	6CwLALu6sohBRDzpVFoortxsidd8NR2sFYe/L3z7b8RSxzlg/ry3zE8MSy9JWvMBw3ZXRUPuBG9
	UQlzKY+7931I8IwuKvg2XJcCcET5H5F2llgqlgTCEOzXN4hjIUJS33Q27OEn0ll1QcHwA9TjGnN
	VR783Dzi+U+tO9I92jv4dUCPrhAvA3rHgWMeaVSvhDGqcBVcrrLyN4Yju1PeapLMP9Sm5aT8i6k
	4qNT1uQ==
X-Google-Smtp-Source: AGHT+IHuDeWepv9LWawTITsPd16QmZhryU1yphj02BJkEjCvATWc0zUlF0EQCYEgyNLLZg8vP5nGcA==
X-Received: by 2002:a17:906:ef0d:b0:ab7:a4b1:99f with SMTP id a640c23a62f3a-ab7a4b10a32mr741267866b.30.1739192683289;
        Mon, 10 Feb 2025 05:04:43 -0800 (PST)
Received: from akuchynski.c.googlers.com.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7732e71f1sm870928466b.92.2025.02.10.05.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 05:04:42 -0800 (PST)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Prashant Malani <pmalani@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	chrome-platform@lists.linux.dev,
	Jameson Thies <jthies@google.com>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>
Cc: linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH] platform/chrome: cros_ec_typec: Add support for setting USB mode via sysfs
Date: Mon, 10 Feb 2025 13:04:19 +0000
Message-ID: <20250210130419.4110130-1-akuchynski@chromium.org>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch implements USB mode setting via a sysfs interface in
cros_ec_typec driver. User-space applications can now change the current
USB mode by writing to "usb_mode" sysfs entry, replacing the previous
ioctl-based method.
The embedded controller (EC) currently supports only entering USB4 mode
and exiting all modes (including altmodes). Both of these operations
trigger Data Reset Message, even if no USB Mode is active.
Additionally, the patch exposes the USB modes supported by the port via
"usb_capability" sysfs attribute.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/platform/chrome/cros_ec_typec.c | 28 +++++++++++++++++++++++++
 drivers/platform/chrome/cros_ec_typec.h |  1 +
 2 files changed, 29 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 6ee182101bc9..d2228720991f 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -42,6 +42,24 @@ static void cros_typec_role_switch_quirk(struct fwnode_handle *fwnode)
 #endif
 }
 
+static int cros_typec_enter_usb_mode(struct typec_port *tc_port, enum usb_mode mode)
+{
+	struct cros_typec_port *port = typec_get_drvdata(tc_port);
+	struct ec_params_typec_control req = {
+		.port = port->port_num,
+		.command = (mode == USB_MODE_USB4) ?
+			TYPEC_CONTROL_COMMAND_ENTER_MODE : TYPEC_CONTROL_COMMAND_EXIT_MODES,
+		.mode_to_enter = CROS_EC_ALTMODE_USB4
+	};
+
+	return cros_ec_cmd(port->typec_data->ec, 0, EC_CMD_TYPEC_CONTROL,
+			  &req, sizeof(req), NULL, 0);
+}
+
+static const struct typec_operations cros_typec_usb_mode_ops = {
+	.enter_usb_mode = cros_typec_enter_usb_mode
+};
+
 static int cros_typec_parse_port_props(struct typec_capability *cap,
 				       struct fwnode_handle *fwnode,
 				       struct device *dev)
@@ -84,6 +102,13 @@ static int cros_typec_parse_port_props(struct typec_capability *cap,
 		cap->prefer_role = ret;
 	}
 
+	if (fwnode_property_present(fwnode, "usb2-port"))
+		cap->usb_capability |= USB_CAPABILITY_USB2;
+	if (fwnode_property_present(fwnode, "usb3-port"))
+		cap->usb_capability |= USB_CAPABILITY_USB3;
+	if (fwnode_property_present(fwnode, "usb4-port"))
+		cap->usb_capability |= USB_CAPABILITY_USB4;
+
 	cros_typec_role_switch_quirk(fwnode);
 
 	cap->fwnode = fwnode;
@@ -379,6 +404,9 @@ static int cros_typec_init_ports(struct cros_typec_data *typec)
 		if (ret < 0)
 			goto unregister_ports;
 
+		cap->driver_data = cros_port;
+		cap->ops = &cros_typec_usb_mode_ops;
+
 		cros_port->port = typec_register_port(dev, cap);
 		if (IS_ERR(cros_port->port)) {
 			ret = PTR_ERR(cros_port->port);
diff --git a/drivers/platform/chrome/cros_ec_typec.h b/drivers/platform/chrome/cros_ec_typec.h
index 9fd5342bb0ad..f9c31f04c102 100644
--- a/drivers/platform/chrome/cros_ec_typec.h
+++ b/drivers/platform/chrome/cros_ec_typec.h
@@ -18,6 +18,7 @@
 enum {
 	CROS_EC_ALTMODE_DP = 0,
 	CROS_EC_ALTMODE_TBT,
+	CROS_EC_ALTMODE_USB4,
 	CROS_EC_ALTMODE_MAX,
 };
 
-- 
2.48.1.502.g6dc24dfdaf-goog

