Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6525425C712
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 08:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750926019; cv=none; b=J0fUgoms9QkOU336MLU3qx/K5V1qa3OwaAp6VbWU+b0Z6yLAbC0xp5oY6OXM12yvGOcbR7yawQ5UEEhpR8is5WzHjSjJOvhmWEHWawHPeMlSSvdHxOvrYJGNOcn5PGKzd2oJCCXqOKu6V4tn/Kyvj0dV15SOi9nBAOu/EDQCZBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750926019; c=relaxed/simple;
	bh=XqIcxV9tYYGK5WIxG83oeOFYBxW9iRFFIB/DMui79tA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XM+cUUd4qA0JEqs20xts4C0V8pJeJMRyoGQwtHggT6FZq7IGsq0Me9tkmVq0iyvvJbDrkIl/lslVveF6S33TkzaltPGqUFg3iK4gkrJ9auuIRSErK3u97xtNDgAd+BGSXu87VtV8SiwPOzkhyZW88CKiWKF3wlZ2cjV9I0RQzqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: 6ZYuhy3MSd+Ep4z1BFAuLA==
X-CSE-MsgGUID: Wwn/6KNFTY+z1Bqzxt6wNA==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 26 Jun 2025 17:20:16 +0900
Received: from REE-DUD04480.adwin.renesas.com (unknown [10.226.78.19])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 61CC241A0D72;
	Thu, 26 Jun 2025 17:20:14 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Michael Dege <michael.dege@renesas.com>,
	Uwe Kleine-Koenig <u.kleine-koenig@baylibre.com>,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] phy: renesas: r8a779f0-ether-serdes: add new step added to latest datasheet
Date: Thu, 26 Jun 2025 10:19:55 +0200
Message-Id: <20250626081955.1924861-1-michael.dege@renesas.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

R-Car S4-8 datasheet Rev.1.20 describes some additional register
settings at the end of the initialization.

- update after failed CI test:
  Replace wrong macro with R8A779F0_ETH_SERDES_BANK_SELECT

Signed-off-by: Michael Dege <michael.dege@renesas.com>
---
 drivers/phy/renesas/r8a779f0-ether-serdes.c | 28 +++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/phy/renesas/r8a779f0-ether-serdes.c b/drivers/phy/renesas/r8a779f0-ether-serdes.c
index ed83c46f6d00..8a6b6f366fe3 100644
--- a/drivers/phy/renesas/r8a779f0-ether-serdes.c
+++ b/drivers/phy/renesas/r8a779f0-ether-serdes.c
@@ -49,6 +49,13 @@ static void r8a779f0_eth_serdes_write32(void __iomem *addr, u32 offs, u32 bank,
 	iowrite32(data, addr + offs);
 }
 
+static u32 r8a779f0_eth_serdes_read32(void __iomem *addr, u32 offs,  u32 bank)
+{
+	iowrite32(bank, addr + R8A779F0_ETH_SERDES_BANK_SELECT);
+
+	return ioread32(addr + offs);
+}
+
 static int
 r8a779f0_eth_serdes_reg_wait(struct r8a779f0_eth_serdes_channel *channel,
 			     u32 offs, u32 bank, u32 mask, u32 expected)
@@ -319,6 +326,7 @@ static int r8a779f0_eth_serdes_hw_init_late(struct r8a779f0_eth_serdes_channel
 *channel)
 {
 	int ret;
+	u32 val;
 
 	ret = r8a779f0_eth_serdes_chan_setting(channel);
 	if (ret)
@@ -332,6 +340,26 @@ static int r8a779f0_eth_serdes_hw_init_late(struct r8a779f0_eth_serdes_channel
 
 	r8a779f0_eth_serdes_write32(channel->addr, 0x03d0, 0x380, 0x0000);
 
+	val = r8a779f0_eth_serdes_read32(channel->addr, 0x00c0, 0x180);
+	r8a779f0_eth_serdes_write32(channel->addr, 0x00c0, 0x180, val | BIT(8));
+	ret = r8a779f0_eth_serdes_reg_wait(channel, 0x0100, 0x180, BIT(0), 1);
+	if (ret)
+		return ret;
+	r8a779f0_eth_serdes_write32(channel->addr, 0x00c0, 0x180, val & ~BIT(8));
+	ret = r8a779f0_eth_serdes_reg_wait(channel, 0x0100, 0x180, BIT(0), 0);
+	if (ret)
+		return ret;
+
+	val = r8a779f0_eth_serdes_read32(channel->addr, 0x0144, 0x180);
+	r8a779f0_eth_serdes_write32(channel->addr, 0x0144, 0x180, val | BIT(4));
+	ret = r8a779f0_eth_serdes_reg_wait(channel, 0x0180, 0x180, BIT(0), 1);
+	if (ret)
+		return ret;
+	r8a779f0_eth_serdes_write32(channel->addr, 0x0144, 0x180, val & ~BIT(4));
+	ret = r8a779f0_eth_serdes_reg_wait(channel, 0x0180, 0x180, BIT(0), 0);
+	if (ret)
+		return ret;
+
 	return r8a779f0_eth_serdes_monitor_linkup(channel);
 }
 
-- 
2.25.1

