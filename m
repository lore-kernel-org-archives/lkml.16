Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0382E29D19;
	Wed, 11 Jun 2025 07:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749628547; cv=none; b=CrgG8Kk+Yog/hwIC6B1UWvi+9+ZI7PBJPG0TxKWPN3h7xRM1T0ZfkWWSljuR9CQeKVtB3yLjsvuJOT0+JtO1iJKAmNyyL1G2MpW5/U5Ej/2dipWFsh+f2kokSfyLnMEQgaQMRJwxnrY1FLfbajaKdHqHNxBPPQNG8dTb2xq6UfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749628547; c=relaxed/simple;
	bh=7klCgbHcdnpc/FRIacQPzSTO7zTDa1Elo06y8mgwqAM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XisCV8yq+9v4imuAxlxVDdpQIKAgp29JSs5wTW2kO7CJbxl3v9HJ/5Kh3wcuDK5alOOVqU6akWDxt+u2Yz8kzulEAO2sVWUdDV5tzgPJNDbuEbd3GJ1oB34GGZg4pjUnPfC5/GT7yzvPMziroiS6Ja4ad1OpTMQ5MXqY2QV9Prg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=Z90ms/Ok; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="Z90ms/Ok"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1749628546; x=1781164546;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7klCgbHcdnpc/FRIacQPzSTO7zTDa1Elo06y8mgwqAM=;
  b=Z90ms/Oklus59q3uhQX/Syf/gaZcbR0SdiXtGHaoB8mkLG5jlIp0TpH/
   XcpDeHJYx+LpBvLMzCYUFvQjOZVlskkIaDm0GJ37ISXXoM4olFRobJYrc
   +ka1UXEvHEoY3hvSxQB9fSQ6K++RZi3a8UMErBei3L/lBMCa2bzHWpxol
   yyHJEXmTkN6sT2FZuWO2fNnPUSVr7dwFp1dSS94DojX5H+jwnSmmV7KBl
   2Py+R6EL7VnbzET3qg/JCQgIBfKx4laFRZr2qdaZL9NtgtoJe779T3qW3
   emkAwLH2E3Quh5VtoXGq8urWB5FILOZIQSgxIct1CQ6T47spd/xIbyJRo
   A==;
X-CSE-ConnectionGUID: SyFxjzU6S2+ui+bvqltq4w==
X-CSE-MsgGUID: 9ORByZ58QxymSLdZMDcnuA==
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="43238999"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 11 Jun 2025 00:55:45 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 11 Jun 2025 00:55:05 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Wed, 11 Jun 2025 00:55:03 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <stern@rowland.harvard.edu>, <gregkh@linuxfoundation.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <linux-usb@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH] usb: ohci-at91: Use dynamic device name for OHCI HCD creation
Date: Wed, 11 Jun 2025 10:54:15 +0300
Message-ID: <20250611075414.4239-2-mihai.sain@microchip.com>
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

[root@sam9x75eb ~]$ dmesg | grep usb
[    1.464487] usb usb1: Manufacturer: Linux 6.16.0-rc1 ehci_hcd
[    1.470210] usb usb1: SerialNumber: 700000.usb-ehci
[    1.595683] usb usb2: Manufacturer: Linux 6.16.0-rc1 ohci_hcd
[    1.601406] usb usb2: SerialNumber: 600000.usb-ohci

[root@sam9x75eb ~]$ cat /proc/iomem | grep usb
00600000-006fffff : 600000.usb-ohci usb-ohci@600000
00700000-007fffff : 700000.usb-ehci usb-ehci@700000

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

base-commit: aef17cb3d3c43854002956f24c24ec8e1a0e3546
-- 
2.49.0

