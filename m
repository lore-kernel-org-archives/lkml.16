Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E5526B0BF
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 12:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745844700; cv=none; b=s+WbS3Cnhg32k50DMI/9BtCcVWstcEqy4h9b8IutMrIEo8RQQFTw99BaDbQXUM7a6mPxdpNSclNnMUUXMUMNlXaaU7oYHy5rOJTTg2fwTa7Dql0adVfXQy5dlnoDHZ8YgQwLZWTDrfBopJW/xczVTuG0hv3r7mIJv+NqgOQNFxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745844700; c=relaxed/simple;
	bh=uk7Y3YRIZo49khtn8nhECd6YZErDw92lSstgPpb5TVI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Zp6IU0htIxKBb5zc493HxRf0iRAG9ErVkYsyNZCZRItCkn4aSIkQs9M5dB3PeruBVEDLCEg0YO2y+WqkoOEPkQ4fbeI5Di5so28TYPJMT5WdaEltbYFLmETxSIxdSJEzbHjMa1sET8/IMrLr0rmV2zTCw+kMxlVY6jODAZTni64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1u9NxD-0002i5-AO; Mon, 28 Apr 2025 14:51:23 +0200
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1u9NxB-00068F-2k;
	Mon, 28 Apr 2025 14:51:21 +0200
Received: from ore by dude04.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1u9NxB-00EK9k-2U;
	Mon, 28 Apr 2025 14:51:21 +0200
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: "David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew@lunn.ch>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Woojung Huh <woojung.huh@microchip.com>,
	"Russell King (Oracle)" <linux@armlinux.org.uk>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
	kernel@pengutronix.de,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	UNGLinuxDriver@microchip.com,
	stable@vger.kernel.org
Subject: [PATCH net v1 0/2] address EEE regressions on KSZ switches since v6.9 (v6.14+)
Date: Mon, 28 Apr 2025 14:51:17 +0200
Message-Id: <20250428125119.3414046-1-o.rempel@pengutronix.de>
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

This patch series addresses a regression in Energy Efficient Ethernet
(EEE) handling for KSZ switches with integrated PHYs, introduced in
kernel v6.9 by commit fe0d4fd9285e ("net: phy: Keep track of EEE
configuration").

The first patch updates the DSA driver to allow phylink to properly
manage PHY EEE configuration. Since integrated PHYs handle LPI
internally and ports without integrated PHYs do not document MAC-level
LPI support, dummy MAC LPI callbacks are provided.

The second patch removes outdated EEE workarounds from the micrel PHY
driver, as they are no longer needed with correct phylink handling.

This series addresses the regression for mainline and kernels starting
from v6.14. It is not easily possible to fully fix older kernels due
to missing infrastructure changes.

Tested on KSZ9893 hardware.

Oleksij Rempel (2):
  net: dsa: microchip: let phylink manage PHY EEE configuration on KSZ
    switches
  net: phy: micrel: remove KSZ9477 EEE quirks now handled by phylink

 drivers/net/dsa/microchip/ksz_common.c | 97 ++++++++++++++++++--------
 drivers/net/phy/micrel.c               |  7 --
 include/linux/micrel_phy.h             |  1 -
 3 files changed, 69 insertions(+), 36 deletions(-)

--
2.39.5

