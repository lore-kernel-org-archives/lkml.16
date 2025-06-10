Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008FA28B3F3
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 09:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749546847; cv=none; b=r97+Ky68HRE5/P7aoir9TUX9ls5yOPAWnlNET/2OUIfMthoq3n+0452bNtXSRqkEt+WfA04xAFvHBdeLA58ZxEqSaUXt2PBnF58XKBtED2Z5tsAPgjbKj5GAeD58BBsEw4KGtcpiPWTKdwHThhUrUlunvsTcHm7waMu0xwe9Lag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749546847; c=relaxed/simple;
	bh=jcp4eerj1XChCtXCHwOWYkcIHjfLw1wRtRGAcyyO24E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RX0uhu2G/N1CWCJXlzz2XvrOaHA20JLgZhVDbuFdC5QFS7kHeNNCEQHPIwZrNkn0xmCgTpAI36D9k3fhRJ/XLQrVDD8+u8IyfiE7ts0M1nSK8zsjiu27FDMqXi+SPhc2CuSwPtxoIMHhK9M854DHem5Lq9HQkWd/7Z0UepmlXE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1uOv3M-000488-VW; Tue, 10 Jun 2025 11:13:56 +0200
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1uOv3L-002kQI-1g;
	Tue, 10 Jun 2025 11:13:55 +0200
Received: from ore by dude04.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1uOv3L-00H2K5-1S;
	Tue, 10 Jun 2025 11:13:55 +0200
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
	kernel@pengutronix.de,
	linux-kernel@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	netdev@vger.kernel.org
Subject: [PATCH net-next v1 1/3] net: phy: micrel: add MDI/MDI-X control support for KSZ9477 switch-integrated PHYs
Date: Tue, 10 Jun 2025 11:13:52 +0200
Message-Id: <20250610091354.4060454-2-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250610091354.4060454-1-o.rempel@pengutronix.de>
References: <20250610091354.4060454-1-o.rempel@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

Add MDI/MDI-X configuration support for PHYs integrated in the KSZ9477
family of Ethernet switches.

All MDI/MDI-X configuration modes are supported:
  - Automatic MDI/MDI-X (ETH_TP_MDI_AUTO)
  - Forced MDI (ETH_TP_MDI)
  - Forced MDI-X (ETH_TP_MDI_X)

However, when operating in automatic mode, the PHY does not expose the
resolved crossover status (i.e., whether MDI or MDI-X is active).
Therefore, in auto mode, the driver reports ETH_TP_MDI_INVALID as
the current status.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 drivers/net/phy/micrel.c | 59 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/drivers/net/phy/micrel.c b/drivers/net/phy/micrel.c
index 64aa03aed770..a51010e64444 100644
--- a/drivers/net/phy/micrel.c
+++ b/drivers/net/phy/micrel.c
@@ -1948,6 +1948,56 @@ static int ksz886x_read_status(struct phy_device *phydev)
 	return genphy_read_status(phydev);
 }
 
+static int ksz9477_mdix_update(struct phy_device *phydev)
+{
+	if (phydev->mdix_ctrl != ETH_TP_MDI_AUTO)
+		phydev->mdix = phydev->mdix_ctrl;
+	else
+		phydev->mdix = ETH_TP_MDI_INVALID;
+
+	return 0;
+}
+
+static int ksz9477_read_mdix_ctrl(struct phy_device *phydev)
+{
+	int val;
+
+	val = phy_read(phydev, MII_KSZ9131_AUTO_MDIX);
+	if (val < 0)
+		return val;
+
+	if (!(val & MII_KSZ9131_AUTO_MDIX_SWAP_OFF))
+		phydev->mdix_ctrl = ETH_TP_MDI_AUTO;
+	else if (val & MII_KSZ9131_AUTO_MDI_SET)
+		phydev->mdix_ctrl = ETH_TP_MDI;
+	else
+		phydev->mdix_ctrl = ETH_TP_MDI_X;
+
+	return 0;
+}
+
+static int ksz9477_read_status(struct phy_device *phydev)
+{
+	int ret;
+
+	ret = ksz9477_mdix_update(phydev);
+	if (ret)
+		return ret;
+
+	return genphy_read_status(phydev);
+}
+
+static int ksz9477_config_aneg(struct phy_device *phydev)
+{
+	int ret;
+
+	ret = ksz9131_config_mdix(phydev, phydev->mdix_ctrl);
+	if (ret)
+		return ret;
+
+	return genphy_config_aneg(phydev);
+}
+
 struct ksz9477_errata_write {
 	u8 dev_addr;
 	u8 reg_addr;
@@ -2029,6 +2079,13 @@ static int ksz9477_config_init(struct phy_device *phydev)
 			return err;
 	}
 
+	/* Read initial MDI-X config state. So, we do not need to poll it
+	 * later on.
+	 */
+	err = ksz9477_read_mdix_ctrl(phydev);
+	if (err)
+		return err;
+
 	return kszphy_config_init(phydev);
 }
 
@@ -5691,6 +5748,8 @@ static struct phy_driver ksphy_driver[] = {
 	/* PHY_GBIT_FEATURES */
 	.config_init	= ksz9477_config_init,
 	.config_intr	= kszphy_config_intr,
+	.config_aneg	= ksz9477_config_aneg,
+	.read_status	= ksz9477_read_status,
 	.handle_interrupt = kszphy_handle_interrupt,
 	.suspend	= genphy_suspend,
 	.resume		= ksz9477_resume,
-- 
2.39.5

