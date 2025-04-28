Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8890026F44C
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 13:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745845557; cv=none; b=Jf+scKRirAFwEKeqvn/fpEtc/4dckaD3hbPj8sB9VRrwkcTv11gY8eMQPKSqHvy5WpMBGQB+VL+5qe5A4tuZPCEYbEqoREt1K+5S9tHmWZDAyKgDrTtTQVhNuVEgV/gK6W0eSO1225FgqT+rqMEIuF3w24DRTwC0LHJ6ffwXGmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745845557; c=relaxed/simple;
	bh=p5K3m/2awqH/wsJhZKbELlqT5m3wW53cDzS4wBXBhoc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jRa2UGbKctt6kkhosK/xsuRMD3FA+j4N5fozcomERm0doX8Blxi5YlEH1s7kDWxkVRg6KCV0AN7VwYWoyL8VguJlteaChEF8QOiJdCUlsC539R6ppsgWXzKhIOo4Vp+IslEwQleYG7r43Th6C4FlDpKwm7ZKBpbTjroNJpMBWoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1u9OBB-0000MZ-Oh; Mon, 28 Apr 2025 15:05:49 +0200
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1u9OB6-0006Fe-1S;
	Mon, 28 Apr 2025 15:05:44 +0200
Received: from ore by dude04.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1u9OB6-00GJBg-0o;
	Mon, 28 Apr 2025 15:05:44 +0200
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
Subject: [PATCH net-next v7 12/12] net: usb: lan78xx: remove unused struct members
Date: Mon, 28 Apr 2025 15:05:42 +0200
Message-Id: <20250428130542.3879769-13-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250428130542.3879769-1-o.rempel@pengutronix.de>
References: <20250428130542.3879769-1-o.rempel@pengutronix.de>
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

Remove unused members from struct lan78xx_net, including:

    driver_priv
    suspend_count
    mdix_ctrl

These fields are no longer used in the driver and can be safely removed
as part of a cleanup.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
changes v6:
- drop only those fields not already removed in previous patches
- align patch structure with review feedback from Russell King
---
 drivers/net/usb/lan78xx.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
index ba6a6cda779e..647ab9d66334 100644
--- a/drivers/net/usb/lan78xx.c
+++ b/drivers/net/usb/lan78xx.c
@@ -414,7 +414,6 @@ struct lan78xx_net {
 	struct net_device	*net;
 	struct usb_device	*udev;
 	struct usb_interface	*intf;
-	void			*driver_priv;
 
 	unsigned int		tx_pend_data_len;
 	size_t			n_tx_urbs;
@@ -449,15 +448,12 @@ struct lan78xx_net {
 	unsigned long		flags;
 
 	wait_queue_head_t	*wait;
-	unsigned char		suspend_count;
 
 	unsigned int		maxpacket;
 	struct timer_list	stat_monitor;
 
 	unsigned long		data[5];
 
-	u8			mdix_ctrl;
-
 	u32			chipid;
 	u32			chiprev;
 	struct mii_bus		*mdiobus;
-- 
2.39.5

