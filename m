Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816671863E;
	Mon, 16 Jun 2025 06:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750054753; cv=none; b=PhffI5TuKGctU+Vg0y0jDwcqmz9Nm6+CNlh494+sPIubcz4Z/lPqG5Cd3To2b3kZGJTXK4yoyaP7wyk+OqAY0EfXf9RcBB1T9hoeZ5UVvXrvdqt2gdezEMe5GMiXy7N7PJjCFf+jh4G0YVXh+iRP7Ct4Wp3w915nYXEz/JnCoTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750054753; c=relaxed/simple;
	bh=Yf7CYDWOszU1weAxe35FQgpofMbkBbfHlDIiXDmtfwk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bxkYThFx0LZmsMBeZhOQutWVVish8nzifRxUKNnllFUu6aP6TFN5MISjjBUQbyBM2kHpiAVX2OxiCH0vCIWTO7bPK9wvRnJ2sli6TrLuFJw+kBzhmby/IhU9JrrxCHgVJFW62FrT7q/ZM2TDGii5UGglF3GToWSNhshFbnnGHsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=UsE/EXZd; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="UsE/EXZd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750054751; x=1781590751;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Yf7CYDWOszU1weAxe35FQgpofMbkBbfHlDIiXDmtfwk=;
  b=UsE/EXZdnn4R4rQXpF7MlK5ZOxoe04MA0OSM27nSD6mXDzyuQbGbln66
   0+vjQw1wICR5TnJBg4cGbsnWGyb++8hbvWQq64MP805sR+QFqBCiLh27h
   hN8UiyUVzfBbMyk0Jj/h6gKfPvQ3ZjxpzEJKo+wPFY0VbSS0Ws4BNy5Kb
   5zQuOsomGaKFr5yRtbDP2ksOxnyu6Jz6UlANp4D/Tmwp/sMkj1hHeBVCD
   ELPdlWGS/OYGIUf3qLzp4hKZHZFz4NUAePP7f2aWxXmfrdsRJmtsfwG3u
   iEAASG3/CP1VhkZrqedFBaZ/uaEgTwd/hjnG8bmXqYDfti0IQUPGIZBqh
   g==;
X-CSE-ConnectionGUID: lpnJe+SITWGM2Ln9dodNAw==
X-CSE-MsgGUID: 5eStiWdKR6izcsMfXw90LA==
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="47833217"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 15 Jun 2025 23:19:04 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 15 Jun 2025 23:18:34 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Sun, 15 Jun 2025 23:18:32 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <stern@rowland.harvard.edu>, <gregkh@linuxfoundation.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <linux-usb@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH v2] usb: ohci-at91: Use dynamic device name for OHCI HCD creation
Date: Mon, 16 Jun 2025 09:18:00 +0300
Message-ID: <20250616061759.3384-2-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Use the dynamic device name instead of the hardcoded string "at91"
when creating the OHCI host controller driver.
This ensures that the device name is more flexible
and correctly reflects the actual device in the system.
This will be in sync with ehci at91 driver.

Before this patch:

[root@sam9x75eb ~]$ dmesg | grep usb
[    1.464487] usb usb1: Manufacturer: Linux 6.16.0-rc2 ehci_hcd
[    1.470210] usb usb1: SerialNumber: 700000.usb-ehci
[    1.595683] usb usb2: Manufacturer: Linux 6.16.0-rc2 ohci_hcd
[    1.601406] usb usb2: SerialNumber: at91

After this patch:

[root@sam9x75eb ~]$ dmesg | grep usb
[    1.464487] usb usb1: Manufacturer: Linux 6.16.0-rc2 ehci_hcd
[    1.470210] usb usb1: SerialNumber: 700000.usb-ehci
[    1.595683] usb usb2: Manufacturer: Linux 6.16.0-rc2 ohci_hcd
[    1.601406] usb usb2: SerialNumber: 600000.usb-ohci

Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
---
 drivers/usb/host/ohci-at91.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/ohci-at91.c b/drivers/usb/host/ohci-at91.c
index 5df793dcb25d..12fdb18934cf 100644
--- a/drivers/usb/host/ohci-at91.c
+++ b/drivers/usb/host/ohci-at91.c
@@ -193,7 +193,7 @@ static int usb_hcd_at91_probe(const struct hc_driver *driver,
 	if (irq < 0)
 		return irq;
 
-	hcd = usb_create_hcd(driver, dev, "at91");
+	hcd = usb_create_hcd(driver, dev, dev_name(dev));
 	if (!hcd)
 		return -ENOMEM;
 	ohci_at91 = hcd_to_ohci_at91_priv(hcd);

base-commit: e04c78d86a9699d136910cfc0bdcf01087e3267e
-- 
2.49.0

