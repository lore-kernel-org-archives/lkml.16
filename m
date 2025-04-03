Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06ED1C7008
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 23:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743722245; cv=none; b=YTu+JhKf5hcKqYW8tHE1eqiQDwDbUZ6QSzAeYZxJ0QiBXRaPXuKau172Tq42m7Lv0LtePi6a3s/Git2ZKuBTwReIVeI2+dCm3C9HCZO+iKSqLmqknDCr3YEfZ555iXtwC9rIJB41C0ymUEpY0wZ878rc4WCS5lTrERAAyYOzL7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743722245; c=relaxed/simple;
	bh=RpXeLaqMrSqz6yak/7SXmz4WRNuwyIe4mw0ER99HSy4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=o5y58row/OUYUuTVV90OHQ0aCGo6aNm8zMQgMUPCCAhpOiBtVd6RnSFaQxDS75Rt1DeSZ/m8iZpvtpg8kTyz7KRpGmC7ztcUSYJTs5qTArjdfWAdg8k7EK2oql9tug4bgSJBrHuIUmri+53v7g+Yc8rAC9xBPQjMgvjrwPqM/Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <m.grzeschik@pengutronix.de>)
	id 1u0ToH-00033S-Vm; Fri, 04 Apr 2025 01:17:21 +0200
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <m.grzeschik@pengutronix.de>)
	id 1u0ToH-003B2f-0b;
	Fri, 04 Apr 2025 01:17:21 +0200
Received: from localhost ([::1] helo=dude04.red.stw.pengutronix.de)
	by dude04.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <m.grzeschik@pengutronix.de>)
	id 1u0ToH-004fv9-0P;
	Fri, 04 Apr 2025 01:17:21 +0200
From: Michael Grzeschik <m.grzeschik@pengutronix.de>
Date: Fri, 04 Apr 2025 01:17:20 +0200
Subject: [PATCH] usb: typec: tcpci: add regulator support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250404-ml-topic-tcpci-v1-1-4442c7d0ee1e@pengutronix.de>
X-B4-Tracking: v=1; b=H4sIAAAX72cC/x2NQQqDMBAAvyJ7diGG6KFfEQ/JZtWFNIZES0H8e
 5ceZ2CYGxpX4Qav7obKH2lyZIWh74B2nzdGicpgjR2NMw7fCc+jCOFJhQRH6+IQp7ByZNAo+MY
 Yqs+0a5avlFSWyqt8/5d5eZ4fg85xgHUAAAA=
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Michael Grzeschik <m.grzeschik@pengutronix.de>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1278;
 i=m.grzeschik@pengutronix.de; h=from:subject:message-id;
 bh=RpXeLaqMrSqz6yak/7SXmz4WRNuwyIe4mw0ER99HSy4=;
 b=owEBbQKS/ZANAwAKAb9pWET5cfSrAcsmYgBn7xcAnSx83oJbZeJ0LiRRAM0tl2Yw3MX4X6hqo
 0LLW34aScyJAjMEAAEKAB0WIQQV2+2Fpbqd6fvv0Gi/aVhE+XH0qwUCZ+8XAAAKCRC/aVhE+XH0
 q7lkD/sGvI4O3vKtrpfxcq4V02geminY/CI78Ly/cO7VGYgT6dFr2P8lVXnYr+ntajwaYuetYwR
 JfB0nlb/Lqa7WB8OR7Fofz7STbASHSkXjg9QhDLdIBDgptQyKbDGURbkirpRDP1ASuDUi04cEwG
 dHGZltdbdsBbKU7Q5mAYdGv4EB7PxYAcPsxne2a58kqTXLXt/bnSW0LtkpL9IfwMJqNzQ5QP6fG
 Hp8Jm/gyI44vDxWd/9c/jhre1EVteX+mbXYKakrj0PS2Sd00lgHPUjoMGFPo/WtZ9aVzG1Uarzb
 jmolfNP45XhGizcC1uW/zKagePOOOX5QKonQl3SMl4Xlxe+tIyUN45qoRtMv2I/fasgk/CcdWSu
 eWCFfn1ZTp04w2j5FUbPl8EDCP5OZU+TTpDiP/fOZ4E8BI8TehXk9A/w7M2szhUk9yHt8/0QEtz
 8Fsv9RuaQwCzMU51j/kCds3tvzHedm/BUxH9J97MrZGGXP7MAKJcLKDIMFB5XX0XtzIMMM6oq0D
 Yet2MekCmSUuOjobYpuW6O1N+idDfMmxV9eQE+XC3qVvLIhY9sLlsO2+r/1vSNB5Q8dL2Vtjliv
 53Cu/Wl2+QdOBZU+oCgv48ubJzmI2PBLNkZkBLNgYtwIzv1pAKqnmXfZ9tdFBLSDKsQPIxj5rkP
 JH/nPLCoZHgCChQ==
X-Developer-Key: i=m.grzeschik@pengutronix.de; a=openpgp;
 fpr=957BC452CE953D7EA60CF4FC0BE9E3157A1E2C64
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: m.grzeschik@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

The tcpci chip vbus pin is possibly driven by an regulator. This patch
is adding support to enable an optional vdd regulator before probing.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
---
 drivers/usb/typec/tcpm/tcpci.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index 19ab6647af706..a56e31b20c214 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -17,6 +17,7 @@
 #include <linux/usb/tcpci.h>
 #include <linux/usb/tcpm.h>
 #include <linux/usb/typec.h>
+#include <linux/regulator/consumer.h>
 
 #define	PD_RETRY_COUNT_DEFAULT			3
 #define	PD_RETRY_COUNT_3_0_OR_HIGHER		2
@@ -905,6 +906,10 @@ static int tcpci_probe(struct i2c_client *client)
 	int err;
 	u16 val = 0;
 
+	err = devm_regulator_get_enable_optional(&client->dev, "vdd");
+	if (err && err != -ENODEV)
+		return dev_err_probe(&client->dev, err, "Failed to get regulator\n");
+
 	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
 	if (!chip)
 		return -ENOMEM;

---
base-commit: a1b5bd45d4ee58af4f56e49497b8c3db96d8f8a3
change-id: 20250404-ml-topic-tcpci-524d1d6bfede

Best regards,
-- 
Michael Grzeschik <m.grzeschik@pengutronix.de>

