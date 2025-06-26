Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9991B6D08
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 10:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750934262; cv=none; b=f39Y+ei3JsthpzoIzIrXwgLKUWbrRFKH0/TRvp4n90PhiGVPVSV1siI/0BLgQILmdHT6Soyzs8dw32yS8szmpqhyTBD4o6rD8U8/jbmEgCKqHKIxQfopbH5WiC9lpkStRpS0OgFp4IFhDi5dcuXCPvkx34WudcysHmjgQV78qP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750934262; c=relaxed/simple;
	bh=Ru4cJwVwT+dUhkwZmjint5XdqI947nBRVkM7H0g4IwA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oM3nL+uOwmq2jlCNUYXPPiZq8oSQ29WAgPyNlWN530dw0bD/eOxcPJcM267XUlYSKlhVNFZbAQiNbDe883e0IRatztIVQZsNJ6T7mdG1qPwSrPa3KkH8Ni6IqIJam/iogJjWwgacm7uKxrSwXAYk93rmAPJ8/p6qKw0nSbQrcZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1uUjz3-0002jU-B0; Thu, 26 Jun 2025 12:37:33 +0200
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1uUjz2-005Qtx-2B;
	Thu, 26 Jun 2025 12:37:32 +0200
Received: from ore by dude04.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1uUjz2-00Gj5S-1v;
	Thu, 26 Jun 2025 12:37:32 +0200
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
	Dan Carpenter <dan.carpenter@linaro.org>,
	kernel@pengutronix.de,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	UNGLinuxDriver@microchip.com,
	Phil Elwell <phil@raspberrypi.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Simon Horman <horms@kernel.org>
Subject: [PATCH net-next v1 1/1] net: usb: lan78xx: fix possible NULL pointer dereference in lan78xx_phy_init()
Date: Thu, 26 Jun 2025 12:37:31 +0200
Message-Id: <20250626103731.3986545-1-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.39.5
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

If no PHY device is found (e.g., for LAN7801 in fixed-link mode),
lan78xx_phy_init() may proceed to dereference a NULL phydev pointer,
leading to a crash.

Update the logic to perform MAC configuration first, then check for the presence
of a PHY. For the fixed-link case, set up the fixed link and return early,
bypassing any code that assumes a valid phydev pointer.

It is safe to move lan78xx_mac_prepare_for_phy() earlier because this function
only uses information from dev->interface, which is configured by
lan78xx_get_phy() beforehand. The function does not access phydev or any data
set up by later steps.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 drivers/net/usb/lan78xx.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
index ae37cd235526..6e9dc30b50f9 100644
--- a/drivers/net/usb/lan78xx.c
+++ b/drivers/net/usb/lan78xx.c
@@ -2831,6 +2831,10 @@ static int lan78xx_phy_init(struct lan78xx_net *dev)
 	if (ret < 0)
 		return ret;
 
+	ret = lan78xx_mac_prepare_for_phy(dev);
+	if (ret < 0)
+		goto phylink_uninit;
+
 	/* If no PHY is found, set up a fixed link. It is very specific to
 	 * the LAN7801 and is used in special cases like EVB-KSZ9897-1 where
 	 * LAN7801 acts as a USB-to-Ethernet interface to a switch without
@@ -2840,11 +2844,12 @@ static int lan78xx_phy_init(struct lan78xx_net *dev)
 		ret = lan78xx_set_fixed_link(dev);
 		if (ret < 0)
 			goto phylink_uninit;
-	}
 
-	ret = lan78xx_mac_prepare_for_phy(dev);
-	if (ret < 0)
-		goto phylink_uninit;
+		/* No PHY found, so set up a fixed link and return early.
+		 * No need to configure PHY IRQ or attach to phylink.
+		 */
+		return 0;
+	}
 
 	/* if phyirq is not set, use polling mode in phylib */
 	if (dev->domain_data.phyirq > 0)
-- 
2.39.5

