Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936A2283CAE
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 11:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744285998; cv=none; b=eB5+ZEd/B993JX46i3yslyrZtmbMyN9M6rdiUThosvUUtMjdUx5LGI+fGw6Q0i0jUx2WW83Dgd2qOgZnsRj8nEHaMhSBVnKOWji3AXVOw+zONXrqroR2aY/OelctDJDks9uHoWcMQD9aB227zNyzrsgv1JnRlKMO/kudTqenfAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744285998; c=relaxed/simple;
	bh=R6b4n6nC15xoaOkbAw+pBbmn+M3dq3xctr6dUUJpFgI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=I+d2Sr3egAgAuvWEYK6skTh5/k9nU8mha1BI5BZIa3XuWB1scAd0uS+ckR6C9HMg8CA5lUTrmfzYmsSYoHKUW2uku08wBVpgJY+HpBofvsP2tibAM98SOaHU5VpVT51huVABgOfWEKZuZmcOR6XUBsEFXoNjkPfIxRPojWMbh8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1u2qSw-0002xt-Q1; Thu, 10 Apr 2025 13:53:06 +0200
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1u2qSt-004GKy-37;
	Thu, 10 Apr 2025 13:53:03 +0200
Received: from ore by dude04.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1u2qSt-00Akep-2s;
	Thu, 10 Apr 2025 13:53:03 +0200
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
Subject: [PATCH net-next v6 02/12] net: usb: lan78xx: remove explicit check for missing PHY driver
Date: Thu, 10 Apr 2025 13:52:52 +0200
Message-Id: <20250410115302.2562562-3-o.rempel@pengutronix.de>
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

RGMII timing correctness relies on the PHY providing internal delays.
This is typically ensured via PHY driver, strap pins, or PCB layout.

Explicitly checking for a PHY driver here is unnecessary and non-standard.
This logic applies to all MACs, not just LAN78xx, and should be left to
phylib, phylink, or platform configuration.

Drop the check and rely on standard subsystem behavior.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
changes v6:
- this patch is added in v6
---
 drivers/net/usb/lan78xx.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
index 13b5da18850a..2876a119159c 100644
--- a/drivers/net/usb/lan78xx.c
+++ b/drivers/net/usb/lan78xx.c
@@ -2543,10 +2543,6 @@ static struct phy_device *lan7801_phy_init(struct lan78xx_net *dev)
 		if (ret < 0)
 			return ERR_PTR(ret);
 	} else {
-		if (!phydev->drv) {
-			netdev_err(dev->net, "no PHY driver found\n");
-			return ERR_PTR(-EINVAL);
-		}
 		dev->interface = PHY_INTERFACE_MODE_RGMII_ID;
 		/* The PHY driver is responsible to configure proper RGMII
 		 * interface delays. Disable RGMII delays on MAC side.
-- 
2.39.5

