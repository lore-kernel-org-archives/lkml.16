Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FC1A23B63A
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 08:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750926282; cv=none; b=lSiZQTmKJ8rCNckgutE8T1eFmmf4PoqZZq9hlzz0b1uNpoQs2cDmvNn3pXWxtPcsu6uGwtask542wLFi5QUAzuBb8AWAvYWU5QbSVnkv0yCrsYcf378BeID/OP5+MAYTQoylRJ2OvUblwOikaGdjhwLCCNaQE0aLEiBpAdxtdV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750926282; c=relaxed/simple;
	bh=5c/d1Moc4QCu1wAAq+x5/pEkmsxVBPZo62SiSD4GJ34=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Lnv3spOzx1vdrLQgBzbNR3xyduxjX7unCb/LEJ3Hvkmgp+A1XjqdXVUNoh66Yi03aQirPewYZgl2ncQySW/Ll9dv2EE3HaXbn/Vm8zi037z4l93SjBkYuJ+zQ5vSBqUXYH3cQxg/5X40LCNF21VTD+CktRO7nl9KfGYqZaRgpOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: futPo8+7SuGN17aFMcVJHw==
X-CSE-MsgGUID: MH/zGbVgSv2iX388bl2Qvw==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 26 Jun 2025 17:24:39 +0900
Received: from REE-DUD04480.adwin.renesas.com (unknown [10.226.78.19])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 69D9B41A2767;
	Thu, 26 Jun 2025 17:24:37 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Michael Dege <michael.dege@renesas.com>,
	Uwe Kleine-Koenig <u.kleine-koenig@baylibre.com>,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2 RESEND] phy: renesas: r8a779f0-ether-serdes: add USXGMII mode
Date: Thu, 26 Jun 2025 10:24:33 +0200
Message-Id: <20250626082433.1925917-1-michael.dege@renesas.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The initial driver implementation was limited to SGMII and 1GBit/s. The
new mode allows speeds up to 2.5GBit/s on R-Car S4-8 SOCs.

Signed-off-by: Michael Dege <michael.dege@renesas.com>
---
 drivers/phy/renesas/r8a779f0-ether-serdes.c | 69 +++++++++++++++++----
 1 file changed, 57 insertions(+), 12 deletions(-)

diff --git a/drivers/phy/renesas/r8a779f0-ether-serdes.c b/drivers/phy/renesas/r8a779f0-ether-serdes.c
index 3b2d8cef75e5..ed83c46f6d00 100644
--- a/drivers/phy/renesas/r8a779f0-ether-serdes.c
+++ b/drivers/phy/renesas/r8a779f0-ether-serdes.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Renesas Ethernet SERDES device driver
  *
- * Copyright (C) 2022 Renesas Electronics Corporation
+ * Copyright (C) 2022-2025 Renesas Electronics Corporation
  */
 
 #include <linux/delay.h>
@@ -92,17 +92,18 @@ r8a779f0_eth_serdes_common_setting(struct r8a779f0_eth_serdes_channel *channel)
 {
 	struct r8a779f0_eth_serdes_drv_data *dd = channel->dd;
 
-	switch (channel->phy_interface) {
-	case PHY_INTERFACE_MODE_SGMII:
-		r8a779f0_eth_serdes_write32(dd->addr, 0x0244, 0x180, 0x0097);
-		r8a779f0_eth_serdes_write32(dd->addr, 0x01d0, 0x180, 0x0060);
-		r8a779f0_eth_serdes_write32(dd->addr, 0x01d8, 0x180, 0x2200);
-		r8a779f0_eth_serdes_write32(dd->addr, 0x01d4, 0x180, 0x0000);
-		r8a779f0_eth_serdes_write32(dd->addr, 0x01e0, 0x180, 0x003d);
-		return 0;
-	default:
-		return -EOPNOTSUPP;
-	}
+	/* Set combination mode */
+	r8a779f0_eth_serdes_write32(dd->addr, 0x0244, 0x180, 0x00d7);
+	r8a779f0_eth_serdes_write32(dd->addr, 0x01cc, 0x180, 0xc200);
+	r8a779f0_eth_serdes_write32(dd->addr, 0x01c4, 0x180, 0x0042);
+	r8a779f0_eth_serdes_write32(dd->addr, 0x01c8, 0x180, 0x0000);
+	r8a779f0_eth_serdes_write32(dd->addr, 0x01dc, 0x180, 0x002f);
+	r8a779f0_eth_serdes_write32(dd->addr, 0x01d0, 0x180, 0x0060);
+	r8a779f0_eth_serdes_write32(dd->addr, 0x01d8, 0x180, 0x2200);
+	r8a779f0_eth_serdes_write32(dd->addr, 0x01d4, 0x180, 0x0000);
+	r8a779f0_eth_serdes_write32(dd->addr, 0x01e0, 0x180, 0x003d);
+
+	return 0;
 }
 
 static int
@@ -155,6 +156,42 @@ r8a779f0_eth_serdes_chan_setting(struct r8a779f0_eth_serdes_channel *channel)
 		r8a779f0_eth_serdes_write32(channel->addr, 0x0028, 0x1f80, 0x07a1);
 		r8a779f0_eth_serdes_write32(channel->addr, 0x0000, 0x1f80, 0x0208);
 		break;
+
+	case PHY_INTERFACE_MODE_USXGMII:
+		r8a779f0_eth_serdes_write32(channel->addr, 0x001c, 0x300, 0x0000);
+		r8a779f0_eth_serdes_write32(channel->addr, 0x0014, 0x380, 0x0050);
+		r8a779f0_eth_serdes_write32(channel->addr, 0x0000, 0x380, 0x2200);
+		r8a779f0_eth_serdes_write32(channel->addr, 0x001c, 0x380, 0x0400);
+		r8a779f0_eth_serdes_write32(channel->addr, 0x01c0, 0x180, 0x0001);
+		r8a779f0_eth_serdes_write32(channel->addr, 0x0248, 0x180, 0x056a);
+		r8a779f0_eth_serdes_write32(channel->addr, 0x0258, 0x180, 0x0015);
+		r8a779f0_eth_serdes_write32(channel->addr, 0x0144, 0x180, 0x1100);
+		r8a779f0_eth_serdes_write32(channel->addr, 0x01a0, 0x180, 0x0001);
+		r8a779f0_eth_serdes_write32(channel->addr, 0x00d0, 0x180, 0x0001);
+		r8a779f0_eth_serdes_write32(channel->addr, 0x0150, 0x180, 0x0001);
+		r8a779f0_eth_serdes_write32(channel->addr, 0x00c8, 0x180, 0x0300);
+		r8a779f0_eth_serdes_write32(channel->addr, 0x0148, 0x180, 0x0300);
+		r8a779f0_eth_serdes_write32(channel->addr, 0x0174, 0x180, 0x0000);
+		r8a779f0_eth_serdes_write32(channel->addr, 0x0160, 0x180, 0x0004);
+		r8a779f0_eth_serdes_write32(channel->addr, 0x01ac, 0x180, 0x0000);
+		r8a779f0_eth_serdes_write32(channel->addr, 0x00c4, 0x180, 0x0310);
+		r8a779f0_eth_serdes_write32(channel->addr, 0x00c8, 0x180, 0x0301);
+		ret = r8a779f0_eth_serdes_reg_wait(channel, 0x00c8, 0x180, BIT(0), 0);
+		if (ret)
+			return ret;
+		r8a779f0_eth_serdes_write32(channel->addr, 0x0148, 0x180, 0x0301);
+		ret = r8a779f0_eth_serdes_reg_wait(channel, 0x0148, 0x180, BIT(0), 0);
+		if (ret)
+			return ret;
+		r8a779f0_eth_serdes_write32(channel->addr, 0x00c4, 0x180, 0x1310);
+		r8a779f0_eth_serdes_write32(channel->addr, 0x00d8, 0x180, 0x1800);
+		r8a779f0_eth_serdes_write32(channel->addr, 0x00dc, 0x180, 0x0000);
+		r8a779f0_eth_serdes_write32(channel->addr, 0x0000, 0x380, 0x2300);
+		ret = r8a779f0_eth_serdes_reg_wait(channel, 0x0000, 0x380, BIT(8), 0);
+		if (ret)
+			return ret;
+		break;
+
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -179,6 +216,14 @@ r8a779f0_eth_serdes_chan_speed(struct r8a779f0_eth_serdes_channel *channel)
 			return ret;
 		r8a779f0_eth_serdes_write32(channel->addr, 0x0008, 0x1f80, 0x0000);
 		break;
+	case PHY_INTERFACE_MODE_USXGMII:
+		r8a779f0_eth_serdes_write32(channel->addr, 0x0000, 0x1f00, 0x0120);
+		usleep_range(10, 20);
+		r8a779f0_eth_serdes_write32(channel->addr, 0x0000, 0x380, 0x2600);
+		ret = r8a779f0_eth_serdes_reg_wait(channel, 0x0000, 0x380, BIT(10), 0);
+		if (ret)
+			return ret;
+		break;
 	default:
 		return -EOPNOTSUPP;
 	}
-- 
2.25.1

