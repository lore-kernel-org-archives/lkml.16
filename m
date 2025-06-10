Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9660628B519
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 09:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749546850; cv=none; b=kPuRV68bjmWRd+cbj1pakq+0jlwjYMim2Wmp3CYrISiHwYsCuiP73JYbWi3N2PmuuDUBgBbsGWBXWEV992GL519aZH/75afVJZOi5lCBAv7nPnejhlDO+ALocY4Bhqa7Amqh+x9zbPuZVJDx1NrLCQ63xW+30mpvMAkRV2R1ykA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749546850; c=relaxed/simple;
	bh=u+aF9b6V2pUtD48hyOB5seudSASLfD6rWb1EbHeYoPg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kadw12JagWmqPr9Pz2qyPIjz0c3bcjgt/RHOGZscsgzYa/5PdQ2ktjXv1Cq7TKppEdDkANIg3o/7XNCVAAA8bR4so4gh08zP0IK2F4HZMErZs95+69lPBUIt/HHdwISKaKS8R3O4FPSBkho2IJ2EDbPWcZ6/SVDyFksG3htb/n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1uOv3M-00048A-VW; Tue, 10 Jun 2025 11:13:56 +0200
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1uOv3L-002kQK-1p;
	Tue, 10 Jun 2025 11:13:55 +0200
Received: from ore by dude04.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1uOv3L-00H2KP-1Z;
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
Subject: [PATCH net-next v1 3/3] net: phy: micrel: add cable test support for KSZ9477-class PHYs
Date: Tue, 10 Jun 2025 11:13:54 +0200
Message-Id: <20250610091354.4060454-4-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250610091354.4060454-1-o.rempel@pengutronix.de>
References: <20250610091354.4060454-1-o.rempel@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

Enable cable test support for KSZ9477-class PHYs by reusing the
existing KSZ9131 implementation.

This also adds support for 100Mbit-only PHYs like KSZ8563, which are
identified as KSZ9477. For these PHYs, only two wire pairs (A and B)
are active, so the cable test logic limits the pair_mask accordingly.

Support for KSZ8563 is untested but added based on its register
compatibility and PHY ID match.

Tested on KSZ9893 (Gigabit): open and short conditions were correctly
detected on all four pairs. Fault length reporting is functional and
varies by pair. For example:
- 2m cable: open faults reported ~1.2m (pairs B–D), 0.0m (pair A)
- No cable: all pairs report 0.0m fault length

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 drivers/net/phy/micrel.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/net/phy/micrel.c b/drivers/net/phy/micrel.c
index 68d86383e6c7..d0429dc8f561 100644
--- a/drivers/net/phy/micrel.c
+++ b/drivers/net/phy/micrel.c
@@ -1723,7 +1723,8 @@ static int ksz9x31_cable_test_fault_length(struct phy_device *phydev, u16 stat)
 	 *
 	 * distance to fault = (VCT_DATA - 22) * 4 / cable propagation velocity
 	 */
-	if (phydev_id_compare(phydev, PHY_ID_KSZ9131))
+	if (phydev_id_compare(phydev, PHY_ID_KSZ9131) ||
+	    phydev_id_compare(phydev, PHY_ID_KSZ9477))
 		dt = clamp(dt - 22, 0, 255);
 
 	return (dt * 400) / 10;
@@ -1797,12 +1798,20 @@ static int ksz9x31_cable_test_get_status(struct phy_device *phydev,
 					 bool *finished)
 {
 	struct kszphy_priv *priv = phydev->priv;
-	unsigned long pair_mask = 0xf;
+	unsigned long pair_mask;
 	int retries = 20;
 	int pair, ret, rv;
 
 	*finished = false;
 
+	if (linkmode_test_bit(ETHTOOL_LINK_MODE_1000baseT_Full_BIT,
+			      phydev->supported) ||
+	    linkmode_test_bit(ETHTOOL_LINK_MODE_1000baseT_Half_BIT,
+			      phydev->supported))
+		pair_mask = 0xf; /* All pairs */
+	else
+		pair_mask = 0x3; /* Pairs A and B only */
+
 	/* Try harder if link partner is active */
 	while (pair_mask && retries--) {
 		for_each_set_bit(pair, &pair_mask, 4) {
@@ -5790,6 +5799,8 @@ static struct phy_driver ksphy_driver[] = {
 	.resume		= ksz9477_resume,
 	.get_phy_stats	= kszphy_get_phy_stats,
 	.update_stats	= kszphy_update_stats,
+	.cable_test_start	= ksz9x31_cable_test_start,
+	.cable_test_get_status	= ksz9x31_cable_test_get_status,
 } };
 
 module_phy_driver(ksphy_driver);
-- 
2.39.5

