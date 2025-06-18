Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892D427FD40
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 12:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750249572; cv=none; b=h79NwM15jubmR/3yktDkSNgzZYW1UPJ39RHeJ2xfrsv7MikLXZ6T1gko1W8E3DHo0J639SHK5CZXtZU/dXibm+E7wv4+USFCADuRSaSxEp77jKYRv/+tli0XNzrNVxqhspUP5ldgaOGfHLVgL4jtiSPE01z+J/t0K6saNXtdno0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750249572; c=relaxed/simple;
	bh=YlEmZjVfwC6NQSI23/ta9zK73SdMNgWCqQ6iou40KV4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VX0a1T/CtjD5/0YnhqHPcJGlcsmMmHoYtCDk1i3nZ9f20dSwoPOpJBOElsWCw7CYUfIGzvq0/DZzA4HJQpvJKz6V1ldx7mezD/p7k9iL+wqeHnDHHR3iumqTkLshugxTu7uybXOxH1HAqjCLy5BKurJx2jJD/l0Vx21Pv2nBZJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1uRrrg-00007g-UU; Wed, 18 Jun 2025 14:26:04 +0200
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1uRrrf-0048Uo-1V;
	Wed, 18 Jun 2025 14:26:03 +0200
Received: from ore by dude04.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1uRrrf-00DFCf-17;
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
Subject: [PATCH net-next v8 0/6] convert lan78xx driver to the PHYLINK
Date: Wed, 18 Jun 2025 14:25:56 +0200
Message-Id: <20250618122602.3156678-1-o.rempel@pengutronix.de>
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

This series converts the lan78xx driver to use the PHYLINK framework,
which enhances PHY and MAC management. The changes also streamline the
driver by removing unused elements and improving link status reporting.

This is the final part of the previously split conversion series:
https://lore.kernel.org/all/20250428130542.3879769-1-o.rempel@pengutronix.de/

Tested on EVB_LAN7850.

Best Regards, Please review.
Oleksij

Oleksij Rempel (6):
  net: usb: lan78xx: Convert to PHYLINK for improved PHY and MAC
    management
  net: usb: lan78xx: Rename EVENT_LINK_RESET to EVENT_PHY_INT_ACK
  net: usb: lan78xx: Use ethtool_op_get_link to reflect current link
    status
  net: usb: lan78xx: port link settings to phylink API
  net: usb: lan78xx: Integrate EEE support with phylink LPI API
  net: usb: lan78xx: remove unused struct members

 drivers/net/usb/Kconfig   |   3 +-
 drivers/net/usb/lan78xx.c | 730 ++++++++++++++++++--------------------
 2 files changed, 348 insertions(+), 385 deletions(-)

--
2.39.5

