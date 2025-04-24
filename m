Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8782C17578
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 13:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745499763; cv=none; b=jyjH/ZIUzqd1Mp8iBSCCQqiNIQrRwiJuM9w7OblViGVLQgVQh7pYK2ISYse2y/wLRdLQxM1pN59J+QWcKABs8J3adm6K39iOejIV53itSbvdscEqpCqD+1cbz8WgDZ8t1/dS212Nw2JP7tZWp+d3Z8XDknn5lwpVhQa4HYpKPAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745499763; c=relaxed/simple;
	bh=VkBMTFzQQcwgUPsyNIWIjWTCwANchLCXkLSY2etY9w4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DHQ7thLx8TQDlwydz40xI/lSM7zDxmyMYT6z//jr0911PPY+chXokye0zGXg2OfR2yyptHPRY4oXEB5lu8DDiC8LUS+0VLXYb5k0s9ka655i7LDpE0qiumPTxPK8WCytYOiLe0xkplVE4mzAKtmVu5wZmgn3eGtqz1cz/102RX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1u7wDh-0002ZT-3v; Thu, 24 Apr 2025 15:02:25 +0200
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1u7wDf-001swF-1o;
	Thu, 24 Apr 2025 15:02:23 +0200
Received: from ore by dude04.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1u7wDf-00Gc4L-1Y;
	Thu, 24 Apr 2025 15:02:23 +0200
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Woojung Huh <woojung.huh@microchip.com>,
	Andrew Lunn <andrew@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
	kernel@pengutronix.de,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	UNGLinuxDriver@microchip.com,
	Simon Horman <horms@kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: [PATCH net-next v1 0/4]  Improve EEE control for KSZ switches and clarify ethtool output
Date: Thu, 24 Apr 2025 15:02:18 +0200
Message-Id: <20250424130222.3959457-1-o.rempel@pengutronix.de>
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

This patch series addresses two areas related to Energy Efficient
Ethernet (EEE) handling, focusing on better integration of Microchip KSZ
switches with the DSA framework and improving the clarity of ethtool
--show-eee output.

Part 1: Previously, I added a filter to the set_mac_eee() implementation
in the Microchip KSZ driver to reject unsupported configurations -
specifically, attempts to disable LPI while keeping EEE enabled, or to
change the Tx LPI timer. This was intended as a safeguard to clarify
what the driver does not support, since EEE is handled internally by the
KSZ hardware through PHY advertisement.

However, after many changes in the EEE framework, this filter has become
outdated and problematic. It now blocks users from disabling EEE
altogether. Since there is no MAC-level configuration required for KSZ
switches, and the driver already implements support_eee(), the cleanest
path forward is to remove the set_mac_eee() implementation entirely.

Part 2: Clarify ethtool output related to EEE
The ethtool --show-eee command could produce misleading output:
- It displayed "Advertised EEE link modes" even when EEE was disabled
- It omitted the link partner's EEE advertisement unless local EEE was
  enabled

The remaining patches focus on improving the usability and correctness
of the ethtool --show-eee output, particularly in cases where EEE is
disabled.

Tested with Microchip KSZ series hardware.

Oleksij Rempel (4):
  net: dsa: user: Skip set_mac_eee() if support_eee() is implemented
  net: dsa: microchip: Remove set_mac_eee() callback from KSZ driver
  net: phy: Don't report advertised EEE modes if EEE is disabled
  net: phy: Always read EEE LPA in genphy_c45_ethtool_get_eee()

 drivers/net/dsa/microchip/ksz_common.c | 19 -------------------
 drivers/net/phy/phy-c45.c              |  7 ++++---
 net/dsa/user.c                         |  6 ++----
 3 files changed, 6 insertions(+), 26 deletions(-)

--
2.39.5

