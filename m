Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EB532063E7
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 05:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748409952; cv=none; b=mucmP82rv0Tgq+cdikTi+pNe8BSOCLLqod8rnGPh+nOiIE+pzRq3iRUzPpAoPUCOnMCj1tMcNIkrPB84xl5bcpuZokjJERImD+tcj5MoPPJ+JlnbhpX5NL1b2ONXrzof10rzCqUVD2JsN7xzSGRt6N5DBK+Gq1lcj7CLNd0iQSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748409952; c=relaxed/simple;
	bh=8bUXCSo65pFuL9K7IKGHK785dYGPeGX435gMmbBZl8I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IGrAiwXwRPZWr8xKj64b/oLuhMdN0sRjJuwgIyARN5hmAJ5gl09cEDXjQxo8mZHgBi93XRJMf/402ykb95k3x38AmNNZ96tla9feiG4aFNFEg6wiGhHkx4wl99wGjPqflKM/6JlsxMQxCkqE5zvVx8XbkHHgRX8Uq8elQHuUUPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: rt5OKpiCTnquPEUvqN4/dQ==
X-CSE-MsgGUID: SdvyL35LRFiTF1FxPEt/Gw==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 28 May 2025 14:25:45 +0900
Received: from [127.0.1.1] (unknown [10.226.78.19])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id B95A34172C21;
	Wed, 28 May 2025 14:25:43 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Date: Wed, 28 May 2025 07:25:25 +0200
Subject: [PATCH v3 2/2] phy: renesas: r8a779f0-ether-serdes: add new step
 added to latest datasheet
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-renesas-serdes-update-v3-2-8413fcd70dba@renesas.com>
References: <20250528-renesas-serdes-update-v3-0-8413fcd70dba@renesas.com>
In-Reply-To: <20250528-renesas-serdes-update-v3-0-8413fcd70dba@renesas.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Michael Dege <michael.dege@renesas.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748409938; l=2379;
 i=michael.dege@renesas.com; s=20250523; h=from:subject:message-id;
 bh=8bUXCSo65pFuL9K7IKGHK785dYGPeGX435gMmbBZl8I=;
 b=8XI1GZGrhlZZC6BBERC915AI0BkHI3Nm+wepvcwgfeCXZZQOIzPGqEXn20w2oyPGj9/8BD+N7
 szvz4bKgdZbDi2H05ASovfJyHiD8tGx7omW0i8qsK0pSwdB79Z7qH1y
X-Developer-Key: i=michael.dege@renesas.com; a=ed25519;
 pk=+gYTlVQ3/MlOju88OuKnXA7MlapP4lYqJn1F81HZGSo=

R-Car S4-8 datasheet Rev.1.20 describes some additional register
settings at the end of the initialization.

Signed-off-by: Michael Dege <michael.dege@renesas.com>
---
 drivers/phy/renesas/r8a779f0-ether-serdes.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/phy/renesas/r8a779f0-ether-serdes.c b/drivers/phy/renesas/r8a779f0-ether-serdes.c
index ed83c46f6d00c255852cc5af867c89ab0d0db02a..8a6b6f366fe376d21f5fee7795893f5aac0feae4 100644
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

