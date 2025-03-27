Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533C8218E81
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 17:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743096539; cv=none; b=ngfRi+Qx45wCf3zG7tFConyVSjNfIRrfidKZKkovrP2CKZfsPdah+tm2FrnukEF6oTpz4e0S1FiZEWlrIRCQNBW9rTfMLF72kVoOeS0y+M09/IV+A635vaA95jl5hLwshRRam/qflQm2jSERnOlnEvWpCgIr78XVd7WK3q6q7Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743096539; c=relaxed/simple;
	bh=tQsx4g56aGE7ty/Gx8ccxBo1EVYd2LJSSD3c4S8c9kM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nu24ddYm3kjNgCA8L0LZRcVad3aX1pr+7Ty1IR4enhazgYbVx1Bq8CXjnix2Vcc+HdDR4veyFNMIlQq6JXncSIz4wHJFBLyKNCuiYwrWt73w9tB1V3pHVM6aaI+aj2HI9FUfblB1xiMelD1abZT6ZpSC2AFas2DEV6nQWPju+qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1txr21-0002hN-9v; Thu, 27 Mar 2025 18:28:41 +0100
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
	m.felsch@pengutronix.de,
	kaihengf@nvidia.com,
	lijiayi@kylinos.cn,
	krzysztof.kozlowski@linaro.org
Cc: kernel@pengutronix.de,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] usb: port: track the disabled state
Date: Thu, 27 Mar 2025 18:28:00 +0100
Message-Id: <20250327172803.3404615-2-m.felsch@pengutronix.de>
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

The disable state isn't tracked at the moment, instead the state is
directly passed to the hub driver. Change this behavior to only trigger
the hub if a state change happened. Exit early in case of no state
changes but don't return an error.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/usb/core/hub.h  | 2 ++
 drivers/usb/core/port.c | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/usb/core/hub.h b/drivers/usb/core/hub.h
index e6ae73f8a95d..9e91add60b1c 100644
--- a/drivers/usb/core/hub.h
+++ b/drivers/usb/core/hub.h
@@ -96,6 +96,7 @@ struct usb_hub {
  * @usb3_lpm_u2_permit: whether USB3 U2 LPM is permitted.
  * @early_stop: whether port initialization will be stopped earlier.
  * @ignore_event: whether events of the port are ignored.
+ * @disabled: whether the port is disabled
  */
 struct usb_port {
 	struct usb_device *child;
@@ -117,6 +118,7 @@ struct usb_port {
 	unsigned int is_superspeed:1;
 	unsigned int usb3_lpm_u1_permit:1;
 	unsigned int usb3_lpm_u2_permit:1;
+	unsigned int disabled:1;
 };
 
 #define to_usb_port(_dev) \
diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
index f54198171b6a..cae08a9a71e6 100644
--- a/drivers/usb/core/port.c
+++ b/drivers/usb/core/port.c
@@ -117,6 +117,10 @@ static ssize_t disable_store(struct device *dev, struct device_attribute *attr,
 	if (rc)
 		return rc;
 
+	/* Early quit if no change was detected */
+	if (port_dev->disabled == disabled)
+		return count;
+
 	hub_get(hub);
 	rc = usb_autopm_get_interface(intf);
 	if (rc < 0)
@@ -148,6 +152,8 @@ static ssize_t disable_store(struct device *dev, struct device_attribute *attr,
 			usb_clear_port_feature(hdev, port1, USB_PORT_FEAT_C_ENABLE);
 	}
 
+	port_dev->disabled = disabled;
+
 	if (!rc)
 		rc = count;
 
-- 
2.39.5

