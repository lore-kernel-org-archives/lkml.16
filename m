Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA1421507E
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 17:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743096550; cv=none; b=fSVkAUDBVVWMj/PV9/5unLzClY3yPz5Fa1L557nH6/nSFGz2Ncxwtfk6gUwq9pDyFq1G9iUYcra6RSj3Hnuy7+Mnk9EFXXZASNbFptueF0h7TKKAc19XvYHdHXTtfWuVV2DbnzVTQlR/FWn9qU4X/DUYxqeh5yqpJJDvrnW+lQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743096550; c=relaxed/simple;
	bh=mT4gF22OxFj12zFq1YdpFCcRyDWs05kSi47tg9ckRx0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=efdaFhmtF80aDX7Y/gndtFSLO3B/OYnspYq0Gr5yCNkYE+7k3XRHxunPUyd/cQyQn8NhACrTthYjDbhNz1fBKwpu2Ld+q/hQiqZ7keoczjAR7LfTkoSh6NPYO4T6Y/wzk3kKtdNz+ZOvn/OmY3p5sAMGtPnwJyn4tElWaj65Sko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1txr2C-0002hN-Bs; Thu, 27 Mar 2025 18:28:52 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mka@chromium.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	festevam@denx.de,
	stern@rowland.harvard.edu,
	christophe.jaillet@wanadoo.fr,
	m.felsch@pengutronix.de,
	krzysztof.kozlowski@linaro.org,
	make_ruc2021@163.com
Cc: kernel@pengutronix.de,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] usb: hub: add infrastructure to pass onboard_dev port features
Date: Thu, 27 Mar 2025 18:28:01 +0100
Message-Id: <20250327172803.3404615-3-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250327172803.3404615-1-m.felsch@pengutronix.de>
References: <20250327172803.3404615-1-m.felsch@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

On board devices may require special handling for en-/disable port
features due to PCB design decisions e.g. enable/disable the VBUS power
on the port via a host controlled regulator or GPIO.

This commit adds the necessary infrastructure to prepare the common code
base for such use-cases.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/usb/core/hub.c | 55 ++++++++++++++++++++++++++++++++++++++++--
 drivers/usb/core/hub.h |  2 ++
 include/linux/usb.h    |  3 +++
 3 files changed, 58 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index c3f839637cb5..a1b6040bb2e4 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -451,9 +451,19 @@ static int clear_hub_feature(struct usb_device *hdev, int feature)
  */
 int usb_clear_port_feature(struct usb_device *hdev, int port1, int feature)
 {
-	return usb_control_msg(hdev, usb_sndctrlpipe(hdev, 0),
+	struct usb_hub *hub = usb_hub_to_struct_hub(hdev);
+	int ret;
+
+	ret = usb_control_msg(hdev, usb_sndctrlpipe(hdev, 0),
 		USB_REQ_CLEAR_FEATURE, USB_RT_PORT, feature, port1,
 		NULL, 0, 1000);
+	if (ret)
+		return ret;
+
+	if (hub->onboard_hub_clear_port_feature)
+		ret = hub->onboard_hub_clear_port_feature(hdev, feature, port1);
+
+	return ret;
 }
 
 /*
@@ -461,9 +471,19 @@ int usb_clear_port_feature(struct usb_device *hdev, int port1, int feature)
  */
 static int set_port_feature(struct usb_device *hdev, int port1, int feature)
 {
-	return usb_control_msg(hdev, usb_sndctrlpipe(hdev, 0),
+	struct usb_hub *hub = usb_hub_to_struct_hub(hdev);
+	int ret;
+
+	ret = usb_control_msg(hdev, usb_sndctrlpipe(hdev, 0),
 		USB_REQ_SET_FEATURE, USB_RT_PORT, feature, port1,
 		NULL, 0, 1000);
+	if (ret)
+		return ret;
+
+	if (hub->onboard_hub_set_port_feature)
+		ret = hub->onboard_hub_set_port_feature(hdev, feature, port1);
+
+	return ret;
 }
 
 static char *to_led_name(int selector)
@@ -6452,6 +6472,37 @@ void usb_hub_adjust_deviceremovable(struct usb_device *hdev,
 	}
 }
 
+/**
+ * usb_hub_register_port_feature_hooks - Register port set/get feature hooks
+ * @hdev: USB device belonging to the usb hub
+ * @set_port_feature: set_feature hook which gets called by the hub core
+ * @clear_port_feature: clear_feature hook which gets called by the hub core
+ *
+ * Register set/get_port_feature hooks for a onboard_dev hub.
+ */
+void usb_hub_register_port_feature_hooks(struct usb_device *hdev,
+		int (*set_port_feature)(struct usb_device *, int, int),
+		int (*clear_port_feature)(struct usb_device *, int, int))
+{
+	struct usb_hub *hub = usb_hub_to_struct_hub(hdev);
+
+	if (WARN_ON_ONCE(is_root_hub(hdev) || !hub))
+		return;
+
+	if (set_port_feature)
+		hub->onboard_hub_set_port_feature = set_port_feature;
+	if (clear_port_feature)
+		hub->onboard_hub_clear_port_feature = clear_port_feature;
+
+	/*
+	 * Keep it simple for now. Just check the power state and re-sync it
+	 * after adding the hooks since the onboard-dev may do some additional
+	 * logic e.g. controlling regulators.
+	 */
+	hub_power_on(hub, false);
+}
+EXPORT_SYMBOL_GPL(usb_hub_register_port_feature_hooks);
+
 #ifdef CONFIG_ACPI
 /**
  * usb_get_hub_port_acpi_handle - Get the usb port's acpi handle
diff --git a/drivers/usb/core/hub.h b/drivers/usb/core/hub.h
index 9e91add60b1c..536894092db4 100644
--- a/drivers/usb/core/hub.h
+++ b/drivers/usb/core/hub.h
@@ -75,6 +75,8 @@ struct usb_hub {
 	struct timer_list	irq_urb_retry;
 	struct usb_port		**ports;
 	struct list_head        onboard_devs;
+	int (*onboard_hub_set_port_feature)(struct usb_device *udev, int feature, int port1);
+	int (*onboard_hub_clear_port_feature)(struct usb_device *udev, int feature, int port1);
 };
 
 /**
diff --git a/include/linux/usb.h b/include/linux/usb.h
index cfa8005e24f9..bec98f2b7735 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -924,6 +924,9 @@ int usb_hub_claim_port(struct usb_device *hdev, unsigned port1,
 		struct usb_dev_state *owner);
 int usb_hub_release_port(struct usb_device *hdev, unsigned port1,
 		struct usb_dev_state *owner);
+void usb_hub_register_port_feature_hooks(struct usb_device *hdev,
+		int (*set_port_feature)(struct usb_device *, int, int),
+		int (*clear_port_feature)(struct usb_device *, int, int));
 
 /**
  * usb_make_path - returns stable device path in the usb tree
-- 
2.39.5

