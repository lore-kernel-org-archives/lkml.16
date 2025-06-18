Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A971A5BAF
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 12:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750249571; cv=none; b=pzNPgoAPXIw43msTqt9HYkuukwo1cbJp72wAITyf68SX8wP7l0N0nJ+/BAA8HVhDwSKxd2fpYbGh+3+glZdF8cPC4/ANndR0a5nV1LCNZnLa+RZg0wK3bVlfZru3RV69/LNQpK+9CERvrna8xkLrxl30H033fhLB/KGhSSVbbXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750249571; c=relaxed/simple;
	bh=IDD9v6cYS1E9fCQrM9ecA0zZ84fSUhOa0K+YmkkRkZw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ezRJSYgSHKRaw4tQrToK+GnQCFIQfxz85cmldRkbcWtbkKMdAUHat72V79lyuW7N6VprR5pWClW+QqaTGtLusVWOdOkOuX8qWHXeoscyI+qrCltL33bFAuHVKRPNDoKaPb5P/XygbitACFcsVJqqlKUJsbumt/8bRJZNL2cL49k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1uRrrg-00007i-UW; Wed, 18 Jun 2025 14:26:04 +0200
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1uRrrf-0048Uq-1r;
	Wed, 18 Jun 2025 14:26:03 +0200
Received: from ore by dude04.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1uRrrf-00DFCy-1R;
	Wed, 18 Jun 2025 14:26:03 +0200
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
	kernel@pengutronix.de,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	UNGLinuxDriver@microchip.com,
	Phil Elwell <phil@raspberrypi.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Simon Horman <horms@kernel.org>
Subject: [PATCH net-next v8 2/6] net: usb: lan78xx: Rename EVENT_LINK_RESET to EVENT_PHY_INT_ACK
Date: Wed, 18 Jun 2025 14:25:58 +0200
Message-Id: <20250618122602.3156678-3-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250618122602.3156678-1-o.rempel@pengutronix.de>
References: <20250618122602.3156678-1-o.rempel@pengutronix.de>
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

The EVENT_LINK_RESET macro currently triggers deferred work after a PHY
interrupt. Prior to PHYLINK conversion, this work included reconfiguring
the MAC and PHY, effectively performing a 'link reset'.

However, after porting the driver to the PHYLINK framework, the logic
associated with this event now solely handles the acknowledgment of
the PHY interrupt. The MAC and PHY reconfiguration is now managed by
PHYLINK's dedicated callbacks.

To accurately reflect its current, narrowed functionality, rename
EVENT_LINK_RESET to EVENT_PHY_INT_ACK.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 drivers/net/usb/lan78xx.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
index 61b2a7c26f60..18402a3922a6 100644
--- a/drivers/net/usb/lan78xx.c
+++ b/drivers/net/usb/lan78xx.c
@@ -385,7 +385,7 @@ struct skb_data {		/* skb->cb is one of these */
 #define EVENT_RX_HALT			1
 #define EVENT_RX_MEMORY			2
 #define EVENT_STS_SPLIT			3
-#define EVENT_LINK_RESET		4
+#define EVENT_PHY_INT_ACK		4
 #define EVENT_RX_PAUSED			5
 #define EVENT_DEV_WAKING		6
 #define EVENT_DEV_ASLEEP		7
@@ -1642,7 +1642,7 @@ static void lan78xx_status(struct lan78xx_net *dev, struct urb *urb)
 
 	if (intdata & INT_ENP_PHY_INT) {
 		netif_dbg(dev, link, dev->net, "PHY INTR: 0x%08x\n", intdata);
-		lan78xx_defer_kevent(dev, EVENT_LINK_RESET);
+		lan78xx_defer_kevent(dev, EVENT_PHY_INT_ACK);
 
 		if (dev->domain_data.phyirq > 0)
 			generic_handle_irq_safe(dev->domain_data.phyirq);
@@ -3524,7 +3524,7 @@ static int lan78xx_stop(struct net_device *net)
 	 */
 	clear_bit(EVENT_TX_HALT, &dev->flags);
 	clear_bit(EVENT_RX_HALT, &dev->flags);
-	clear_bit(EVENT_LINK_RESET, &dev->flags);
+	clear_bit(EVENT_PHY_INT_ACK, &dev->flags);
 	clear_bit(EVENT_STAT_UPDATE, &dev->flags);
 
 	cancel_delayed_work_sync(&dev->wq);
@@ -4448,10 +4448,10 @@ static void lan78xx_delayedwork(struct work_struct *work)
 		}
 	}
 
-	if (test_bit(EVENT_LINK_RESET, &dev->flags)) {
+	if (test_bit(EVENT_PHY_INT_ACK, &dev->flags)) {
 		int ret = 0;
 
-		clear_bit(EVENT_LINK_RESET, &dev->flags);
+		clear_bit(EVENT_PHY_INT_ACK, &dev->flags);
 		ret = lan78xx_phy_int_ack(dev);
 		if (ret)
 			netdev_info(dev->net, "PHY INT ack failed (%pe)\n",
-- 
2.39.5

