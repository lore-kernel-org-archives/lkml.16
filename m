Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A670A283CBA
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 11:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744285997; cv=none; b=ko8VsYeIMUZGfA3NSLE1Khil48gC4uUXhfRsdezyMR0o2poBB6gTUdsEb7AJWLkNvDMxr93VbaqcVJUNrGSWfxBJ+Qm6jUoHWupfcQ+592hU/5DSR+VAKqJakiXWpzu2HSqAUCSKBiIu6WQbDTh0xjuCg1qM7md8Y1dbz1uw4aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744285997; c=relaxed/simple;
	bh=F4ezS0IGE20rigPt9f1Y8W7hqRuQafYstaqCZwkDiGc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=vD4NSbkfo4gQxFzttgxGpx7jA5E1JJ2M2YdWFTv1hSgkj1VL25Sxm8+fqJnD4mqrYkc1NAGvRJ6fT1lnjriS0tCfNQV1vwgEQmA1G8keuxkZoUO2uJrY3wJoEdNYtY2FFv3vm9qFecGaAAI7X0ri7BZ+DPUbDLNSvXJXZF2tHUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1u2qSz-0002y0-Iq; Thu, 10 Apr 2025 13:53:09 +0200
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1u2qSu-004GLD-0c;
	Thu, 10 Apr 2025 13:53:04 +0200
Received: from ore by dude04.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1u2qSu-00AkgB-07;
	Thu, 10 Apr 2025 13:53:04 +0200
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Woojung Huh <woojung.huh@microchip.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Thangaraj Samynathan <Thangaraj.S@microchip.com>,
	Rengarajan Sundararajan <Rengarajan.S@microchip.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	kernel@pengutronix.de,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	UNGLinuxDriver@microchip.com,
	Phil Elwell <phil@raspberrypi.org>,
	Simon Horman <horms@kernel.org>
Subject: [PATCH net-next v6 10/12] net: usb: lan78xx: port link settings to phylink API
Date: Thu, 10 Apr 2025 13:53:00 +0200
Message-Id: <20250410115302.2562562-11-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250410115302.2562562-1-o.rempel@pengutronix.de>
References: <20250410115302.2562562-1-o.rempel@pengutronix.de>
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

Refactor lan78xx_get_link_ksettings and lan78xx_set_link_ksettings to
use the phylink API (phylink_ethtool_ksettings_get and
phylink_ethtool_ksettings_set) instead of directly interfacing with the
PHY. This change simplifies the code and ensures better integration with
the phylink framework for link management.

Additionally, the explicit calls to usb_autopm_get_interface() and
usb_autopm_put_interface() have been removed. These were originally
needed to manage USB power management during register accesses. However,
lan78xx_mdiobus_read() and lan78xx_mdiobus_write() already handle USB
auto power management internally, ensuring that the interface remains
active when necessary. Since there are no other direct register accesses
in these functions that require explicit power management handling, the
extra calls have become redundant and are no longer needed.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
changes v4:
- add explanation why we do not care about usb_autopm in this functions
---
 drivers/net/usb/lan78xx.c | 34 ++--------------------------------
 1 file changed, 2 insertions(+), 32 deletions(-)

diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
index ee01f021fa3a..680b8efa086a 100644
--- a/drivers/net/usb/lan78xx.c
+++ b/drivers/net/usb/lan78xx.c
@@ -1866,46 +1866,16 @@ static int lan78xx_get_link_ksettings(struct net_device *net,
 				      struct ethtool_link_ksettings *cmd)
 {
 	struct lan78xx_net *dev = netdev_priv(net);
-	struct phy_device *phydev = net->phydev;
-	int ret;
-
-	ret = usb_autopm_get_interface(dev->intf);
-	if (ret < 0)
-		return ret;
 
-	phy_ethtool_ksettings_get(phydev, cmd);
-
-	usb_autopm_put_interface(dev->intf);
-
-	return ret;
+	return phylink_ethtool_ksettings_get(dev->phylink, cmd);
 }
 
 static int lan78xx_set_link_ksettings(struct net_device *net,
 				      const struct ethtool_link_ksettings *cmd)
 {
 	struct lan78xx_net *dev = netdev_priv(net);
-	struct phy_device *phydev = net->phydev;
-	int ret = 0;
-	int temp;
-
-	ret = usb_autopm_get_interface(dev->intf);
-	if (ret < 0)
-		return ret;
-
-	/* change speed & duplex */
-	ret = phy_ethtool_ksettings_set(phydev, cmd);
 
-	if (!cmd->base.autoneg) {
-		/* force link down */
-		temp = phy_read(phydev, MII_BMCR);
-		phy_write(phydev, MII_BMCR, temp | BMCR_LOOPBACK);
-		mdelay(1);
-		phy_write(phydev, MII_BMCR, temp);
-	}
-
-	usb_autopm_put_interface(dev->intf);
-
-	return ret;
+	return phylink_ethtool_ksettings_set(dev->phylink, cmd);
 }
 
 static void lan78xx_get_pause(struct net_device *net,
-- 
2.39.5

