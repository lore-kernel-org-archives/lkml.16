Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53A92566FD
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 20:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750363563; cv=none; b=ttht1bm2k6IzPuXKLUdxbgjSYliFmi/+XzeaFmlm325SAC9tRwRiomDC0DEDZMdGjVq/GvsNpfJ4kVl8xsXA27WQsCNxw5WbWTFFa0dKWeOj+bzvEgXkiJ1daDN1vZonGa4dkd4Z/0h7kBRBh2s3SlB4t1dYFw7flur99GpduWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750363563; c=relaxed/simple;
	bh=C6LbQKFSIVMacHbPRAYuDgegKEijLlCqHPXIPsTipao=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=D1ogClr7cY5v50KZwPeTGqhomYuhHOlsB6O+IHArSzxgh/8clHnvmVcvXYJ+jM3U+iCrozHLz1xRkZEW00WLZAL0tp6r9jBMznREZCGlmmHqgtUMEZ5AbcW7EE9qGzIxptJVhleVKT/HS+AheoYzTiVUz86NQ/cJgqw7ey7PEOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=klFtIT1y; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="klFtIT1y"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750363559;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qv3D2YlZx4ysbIurldj8bJMj04966kkw5o/UpPt70N8=;
	b=klFtIT1yuBhS6vfklk507j8tk7YFL+7lXRw9vS9DKcsN7bFsVCm5j77Ghrap0Mue8Z7KZB
	MnJ0oUbwqG5AFQrCV1x/lH02TZf8xmEkJIUsScfKKY61KwQUP1CAiXFbLp24CVpmrrXBsa
	ywZ84aO+03kCpjaeH3MbLPh1zcJwuwU=
From: Sean Anderson <sean.anderson@linux.dev>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michal Simek <michal.simek@amd.com>,
	Saravana Kannan <saravanak@google.com>,
	Leon Romanovsky <leon@kernel.org>,
	Dave Ertman <david.m.ertman@intel.com>,
	linux-kernel@vger.kernel.org,
	Ira Weiny <ira.weiny@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH net 3/4] net: axienet: Rearrange lifetime functions
Date: Thu, 19 Jun 2025 16:05:36 -0400
Message-Id: <20250619200537.260017-4-sean.anderson@linux.dev>
In-Reply-To: <20250619200537.260017-1-sean.anderson@linux.dev>
References: <20250619200537.260017-1-sean.anderson@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Rearrange the lifetime functions (probe, remove, etc.) in preparation
for the next commit. No functional change intended.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

 .../net/ethernet/xilinx/xilinx_axienet_main.c | 252 +++++++++---------
 1 file changed, 133 insertions(+), 119 deletions(-)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index 1f277e5e4a62..c2512c04a88f 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -2749,6 +2749,134 @@ static void axienet_disable_misc(void *clocks)
 	clk_bulk_disable_unprepare(XAE_NUM_MISC_CLOCKS, clocks);
 }
 
+static int axienet_mac_probe(struct axienet_local *lp)
+{
+	struct net_device *ndev = lp->ndev;
+	struct device_node *np;
+	int ret;
+
+	SET_NETDEV_DEV(ndev, lp->dev);
+	if (lp->phy_mode == PHY_INTERFACE_MODE_SGMII ||
+	    lp->phy_mode == PHY_INTERFACE_MODE_1000BASEX) {
+		np = of_parse_phandle(lp->dev->of_node, "pcs-handle", 0);
+		if (!np) {
+			/* Deprecated: Always use "pcs-handle" for pcs_phy.
+			 * Falling back to "phy-handle" here is only for
+			 * backward compatibility with old device trees.
+			 */
+			np = of_parse_phandle(lp->dev->of_node, "phy-handle", 0);
+		}
+		if (!np) {
+			dev_err(lp->dev,
+				"pcs-handle (preferred) or phy-handle required for 1000BaseX/SGMII\n");
+			return -EINVAL;
+		}
+		lp->pcs_phy = of_mdio_find_device(np);
+		of_node_put(np);
+		if (!lp->pcs_phy)
+			return -EPROBE_DEFER;
+		lp->pcs.ops = &axienet_pcs_ops;
+		lp->pcs.poll = true;
+	}
+
+	lp->phylink_config.dev = &ndev->dev;
+	lp->phylink_config.type = PHYLINK_NETDEV;
+	lp->phylink_config.mac_managed_pm = true;
+	lp->phylink_config.mac_capabilities = MAC_SYM_PAUSE | MAC_ASYM_PAUSE |
+		MAC_10FD | MAC_100FD | MAC_1000FD;
+
+	__set_bit(lp->phy_mode, lp->phylink_config.supported_interfaces);
+	if (lp->switch_x_sgmii) {
+		__set_bit(PHY_INTERFACE_MODE_1000BASEX,
+			  lp->phylink_config.supported_interfaces);
+		__set_bit(PHY_INTERFACE_MODE_SGMII,
+			  lp->phylink_config.supported_interfaces);
+	}
+
+	lp->phylink = phylink_create(&lp->phylink_config, lp->dev->fwnode,
+				     lp->phy_mode,
+				     &axienet_phylink_ops);
+	if (IS_ERR(lp->phylink)) {
+		ret = PTR_ERR(lp->phylink);
+		dev_err(lp->dev, "phylink_create error (%i)\n", ret);
+		goto cleanup_pcs;
+	}
+
+	ret = register_netdev(ndev);
+	if (ret) {
+		dev_err(lp->dev, "register_netdev() error (%i)\n", ret);
+		goto cleanup_phylink;
+	}
+
+	return 0;
+
+cleanup_phylink:
+	phylink_destroy(lp->phylink);
+cleanup_pcs:
+	if (lp->pcs_phy)
+		put_device(&lp->pcs_phy->dev);
+	return ret;
+}
+
+static void axienet_mac_remove(struct platform_device *pdev)
+{
+	struct net_device *ndev = platform_get_drvdata(pdev);
+	struct axienet_local *lp = netdev_priv(ndev);
+
+	unregister_netdev(ndev);
+	phylink_destroy(lp->phylink);
+	if (lp->pcs_phy)
+		put_device(&lp->pcs_phy->dev);
+}
+
+static void axienet_mac_shutdown(struct platform_device *pdev)
+{
+	struct net_device *ndev = platform_get_drvdata(pdev);
+
+	rtnl_lock();
+	netif_device_detach(ndev);
+
+	if (netif_running(ndev))
+		dev_close(ndev);
+
+	rtnl_unlock();
+}
+
+static int axienet_suspend(struct device *dev)
+{
+	struct net_device *ndev = dev_get_drvdata(dev);
+
+	if (!netif_running(ndev))
+		return 0;
+
+	netif_device_detach(ndev);
+
+	rtnl_lock();
+	axienet_stop(ndev);
+	rtnl_unlock();
+
+	return 0;
+}
+
+static int axienet_resume(struct device *dev)
+{
+	struct net_device *ndev = dev_get_drvdata(dev);
+
+	if (!netif_running(ndev))
+		return 0;
+
+	rtnl_lock();
+	axienet_open(ndev);
+	rtnl_unlock();
+
+	netif_device_attach(ndev);
+
+	return 0;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(axienet_pm_ops,
+				axienet_suspend, axienet_resume);
+
 /**
  * axienet_probe - Axi Ethernet probe function.
  * @pdev:	Pointer to platform device structure.
@@ -3051,69 +3179,10 @@ static int axienet_probe(struct platform_device *pdev)
 		dev_warn(&pdev->dev,
 			 "error registering MDIO bus: %d\n", ret);
 
-	if (lp->phy_mode == PHY_INTERFACE_MODE_SGMII ||
-	    lp->phy_mode == PHY_INTERFACE_MODE_1000BASEX) {
-		np = of_parse_phandle(pdev->dev.of_node, "pcs-handle", 0);
-		if (!np) {
-			/* Deprecated: Always use "pcs-handle" for pcs_phy.
-			 * Falling back to "phy-handle" here is only for
-			 * backward compatibility with old device trees.
-			 */
-			np = of_parse_phandle(pdev->dev.of_node, "phy-handle", 0);
-		}
-		if (!np) {
-			dev_err(&pdev->dev, "pcs-handle (preferred) or phy-handle required for 1000BaseX/SGMII\n");
-			ret = -EINVAL;
-			goto cleanup_mdio;
-		}
-		lp->pcs_phy = of_mdio_find_device(np);
-		if (!lp->pcs_phy) {
-			ret = -EPROBE_DEFER;
-			of_node_put(np);
-			goto cleanup_mdio;
-		}
-		of_node_put(np);
-		lp->pcs.ops = &axienet_pcs_ops;
-		lp->pcs.poll = true;
-	}
+	ret = axienet_mac_probe(lp);
+	if (!ret)
+		return 0;
 
-	lp->phylink_config.dev = &ndev->dev;
-	lp->phylink_config.type = PHYLINK_NETDEV;
-	lp->phylink_config.mac_managed_pm = true;
-	lp->phylink_config.mac_capabilities = MAC_SYM_PAUSE | MAC_ASYM_PAUSE |
-		MAC_10FD | MAC_100FD | MAC_1000FD;
-
-	__set_bit(lp->phy_mode, lp->phylink_config.supported_interfaces);
-	if (lp->switch_x_sgmii) {
-		__set_bit(PHY_INTERFACE_MODE_1000BASEX,
-			  lp->phylink_config.supported_interfaces);
-		__set_bit(PHY_INTERFACE_MODE_SGMII,
-			  lp->phylink_config.supported_interfaces);
-	}
-
-	lp->phylink = phylink_create(&lp->phylink_config, pdev->dev.fwnode,
-				     lp->phy_mode,
-				     &axienet_phylink_ops);
-	if (IS_ERR(lp->phylink)) {
-		ret = PTR_ERR(lp->phylink);
-		dev_err(&pdev->dev, "phylink_create error (%i)\n", ret);
-		goto cleanup_mdio;
-	}
-
-	ret = register_netdev(lp->ndev);
-	if (ret) {
-		dev_err(lp->dev, "register_netdev() error (%i)\n", ret);
-		goto cleanup_phylink;
-	}
-
-	return 0;
-
-cleanup_phylink:
-	phylink_destroy(lp->phylink);
-
-cleanup_mdio:
-	if (lp->pcs_phy)
-		put_device(&lp->pcs_phy->dev);
 	if (lp->mii_bus)
 		axienet_mdio_teardown(lp);
 	return ret;
@@ -3124,69 +3193,14 @@ static void axienet_remove(struct platform_device *pdev)
 	struct net_device *ndev = platform_get_drvdata(pdev);
 	struct axienet_local *lp = netdev_priv(ndev);
 
-	unregister_netdev(ndev);
-
-	if (lp->phylink)
-		phylink_destroy(lp->phylink);
-
-	if (lp->pcs_phy)
-		put_device(&lp->pcs_phy->dev);
-
+	axienet_mac_remove(pdev);
 	axienet_mdio_teardown(lp);
 }
 
-static void axienet_shutdown(struct platform_device *pdev)
-{
-	struct net_device *ndev = platform_get_drvdata(pdev);
-
-	rtnl_lock();
-	netif_device_detach(ndev);
-
-	if (netif_running(ndev))
-		dev_close(ndev);
-
-	rtnl_unlock();
-}
-
-static int axienet_suspend(struct device *dev)
-{
-	struct net_device *ndev = dev_get_drvdata(dev);
-
-	if (!netif_running(ndev))
-		return 0;
-
-	netif_device_detach(ndev);
-
-	rtnl_lock();
-	axienet_stop(ndev);
-	rtnl_unlock();
-
-	return 0;
-}
-
-static int axienet_resume(struct device *dev)
-{
-	struct net_device *ndev = dev_get_drvdata(dev);
-
-	if (!netif_running(ndev))
-		return 0;
-
-	rtnl_lock();
-	axienet_open(ndev);
-	rtnl_unlock();
-
-	netif_device_attach(ndev);
-
-	return 0;
-}
-
-static DEFINE_SIMPLE_DEV_PM_OPS(axienet_pm_ops,
-				axienet_suspend, axienet_resume);
-
 static struct platform_driver axienet_driver = {
 	.probe = axienet_probe,
 	.remove = axienet_remove,
-	.shutdown = axienet_shutdown,
+	.shutdown = axienet_mac_shutdown,
 	.driver = {
 		 .name = "xilinx_axienet",
 		 .pm = &axienet_pm_ops,
-- 
2.35.1.1320.gc452695387.dirty

