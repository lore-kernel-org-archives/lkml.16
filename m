Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2DC2505B4
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 18:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743704842; cv=none; b=iTfNIrQgO0p7pugOfbVvU4damIxRz8NnkBUCcqM8LUWQjpAIUNhXi7oZhlcx24NujoqC1R3NYUpsBAxmoe6ptIl5V5gRw/T7Kx37gT7T8pzcM64HfFZrjgmgzTNm4fd0dZGnW+vgJr3zBaVCMJIv1S5Ztgu0p+RkeIRG3MmPPU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743704842; c=relaxed/simple;
	bh=bYraRZiMv6RmjSw34sdPdja1hVNIiHhZOxCntke1i4o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lkOjjVaX4+yJmXQN603CHz1Ow8/g1RaGO0pRDYkF3N0NkJi+XNAzfUy6hxcqIHd+ECribxisxLU2nZ4wQVrYHZLoCCTG4s2Yq0Ouke/VCbF4ElWBy1gtFoUFlrMPCZ3w4YskLOrd3QCbZw94lpiH+ni63vj3eMCAAnUTrphuFss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=guoO5ANB; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="guoO5ANB"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1743704838;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wrnsdp0l5+wWoIiQp89RjBUicPnfcdbh9m3aLbleqOk=;
	b=guoO5ANBgA1S/Oscnv3WSwEt4k3EG8VqxPkw1frb3v0XHYCrh7BRPrKoediUajWDDjZJMl
	gIHWzWwZYqiGI92RvkKQtgAcTaNkbHZMKcbrcFtlRGbkyHexVhNUEHbtDzi+byX7JLuOc4
	xlXRUkRDTXw8YKmu11gsj71lrwTS+y8=
From: Sean Anderson <sean.anderson@linux.dev>
To: netdev@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	linux-kernel@vger.kernel.org,
	upstream@airoha.com,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [RFC net-next PATCH 10/13] net: macb: Support external PCSs
Date: Thu,  3 Apr 2025 14:27:06 -0400
Message-Id: <20250403182706.1948535-1-sean.anderson@linux.dev>
In-Reply-To: <20250403181907.1947517-1-sean.anderson@linux.dev>
References: <20250403181907.1947517-1-sean.anderson@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

This adds support for external PCSs. For example, the Xilinx UltraScale+
processor exposes its GMII interface to the FPGA fabric. This fabric may
implement PCS to convert GMII to a serial interface such as SGMII or
1000BASE-X. When present, the external PCS takes precedence over the
internal PCSs.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

 drivers/net/ethernet/cadence/macb.h      |  1 +
 drivers/net/ethernet/cadence/macb_main.c | 30 ++++++++++++++++++++----
 2 files changed, 27 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/cadence/macb.h b/drivers/net/ethernet/cadence/macb.h
index c9a5c8beb2fa..9d310814f052 100644
--- a/drivers/net/ethernet/cadence/macb.h
+++ b/drivers/net/ethernet/cadence/macb.h
@@ -1291,6 +1291,7 @@ struct macb {
 	struct phylink_config	phylink_config;
 	struct phylink_pcs	phylink_usx_pcs;
 	struct phylink_pcs	phylink_sgmii_pcs;
+	struct phylink_pcs	*phylink_ext_pcs;
 
 	u32			caps;
 	unsigned int		dma_burst_length;
diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index 665fc3c4d39a..65cdf3b478fc 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -21,6 +21,7 @@
 #include <linux/netdevice.h>
 #include <linux/etherdevice.h>
 #include <linux/dma-mapping.h>
+#include <linux/pcs.h>
 #include <linux/platform_device.h>
 #include <linux/phylink.h>
 #include <linux/of.h>
@@ -549,12 +550,12 @@ static void macb_set_tx_clk(struct macb *bp, int speed)
 		netdev_err(bp->dev, "adjusting tx_clk failed.\n");
 }
 
-static void macb_pcs_get_state(struct phylink_pcs *pcs,
+static void macb_pcs_get_state(struct phylink_pcs *pcs, unsigned int neg_mode,
 			       struct phylink_link_state *state)
 {
 	struct macb *bp = container_of(pcs, struct macb, phylink_sgmii_pcs);
 
-	phylink_mii_c22_pcs_decode_state(state, gem_readl(bp, PCSSTS),
+	phylink_mii_c22_pcs_decode_state(state, neg_mode, gem_readl(bp, PCSSTS),
 					 gem_readl(bp, PCSANLPBASE));
 }
 
@@ -707,7 +708,10 @@ static struct phylink_pcs *macb_mac_select_pcs(struct phylink_config *config,
 	struct net_device *ndev = to_net_dev(config->dev);
 	struct macb *bp = netdev_priv(ndev);
 
-	if (interface == PHY_INTERFACE_MODE_10GBASER)
+	if (bp->phylink_ext_pcs &&
+	    test_bit(interface, bp->phylink_ext_pcs->supported_interfaces))
+		return bp->phylink_ext_pcs;
+	else if (interface == PHY_INTERFACE_MODE_10GBASER)
 		return &bp->phylink_usx_pcs;
 	else if (interface == PHY_INTERFACE_MODE_SGMII)
 		return &bp->phylink_sgmii_pcs;
@@ -733,7 +737,10 @@ static void macb_mac_config(struct phylink_config *config, unsigned int mode,
 		if (state->interface == PHY_INTERFACE_MODE_RMII)
 			ctrl |= MACB_BIT(RM9200_RMII);
 	} else if (macb_is_gem(bp)) {
-		if (macb_mac_select_pcs(config, state->interface))
+		struct phylink_pcs *pcs = macb_mac_select_pcs(config,
+							      state->interface);
+
+		if (pcs && pcs != bp->phylink_ext_pcs)
 			ctrl |= GEM_BIT(PCSSEL);
 		else
 			ctrl &= ~GEM_BIT(PCSSEL);
@@ -907,6 +914,14 @@ static int macb_mii_probe(struct net_device *dev)
 	bp->phylink_sgmii_pcs.ops = &macb_phylink_pcs_ops;
 	bp->phylink_usx_pcs.ops = &macb_phylink_usx_pcs_ops;
 
+	bp->phylink_ext_pcs = pcs_get_by_fwnode_optional(&bp->pdev->dev,
+							 bp->pdev->dev.fwnode,
+							 NULL);
+	if (IS_ERR(bp->phylink_ext_pcs))
+		return dev_err_probe(&bp->pdev->dev,
+				     PTR_ERR(bp->phylink_ext_pcs),
+				     "Could not get external PCS\n");
+
 	bp->phylink_config.dev = &dev->dev;
 	bp->phylink_config.type = PHYLINK_NETDEV;
 	bp->phylink_config.mac_managed_pm = true;
@@ -924,6 +939,11 @@ static int macb_mii_probe(struct net_device *dev)
 	__set_bit(PHY_INTERFACE_MODE_RMII,
 		  bp->phylink_config.supported_interfaces);
 
+	if (bp->phylink_ext_pcs)
+		phy_interface_or(bp->phylink_config.supported_interfaces,
+				 bp->phylink_config.supported_interfaces,
+				 bp->phylink_ext_pcs->supported_interfaces);
+
 	/* Determine what modes are supported */
 	if (macb_is_gem(bp) && (bp->caps & MACB_CAPS_GIGABIT_MODE_AVAILABLE)) {
 		bp->phylink_config.mac_capabilities |= MAC_1000FD;
@@ -950,6 +970,7 @@ static int macb_mii_probe(struct net_device *dev)
 	if (IS_ERR(bp->phylink)) {
 		netdev_err(dev, "Could not create a phylink instance (%ld)\n",
 			   PTR_ERR(bp->phylink));
+		pcs_put(&bp->pdev->dev, bp->phylink_ext_pcs);
 		return PTR_ERR(bp->phylink);
 	}
 
@@ -5462,6 +5483,7 @@ static void macb_remove(struct platform_device *pdev)
 					  bp->rx_clk, bp->tsu_clk);
 			pm_runtime_set_suspended(&pdev->dev);
 		}
+		pcs_put(&pdev->dev, bp->phylink_ext_pcs);
 		phylink_destroy(bp->phylink);
 		free_netdev(dev);
 	}
-- 
2.35.1.1320.gc452695387.dirty

