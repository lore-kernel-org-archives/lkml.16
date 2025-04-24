Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877F4E545
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 13:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745499762; cv=none; b=BpabN2IErsuQItXWae+foaI0QV9Bes3stXdn1WqdWGQO/HK1LfH0vsydxIumvDaOxYq94RAD5dYHHqlOnzsgfzatkOa/El3KsH7hzj/kXR4rk8/UcYldOiT5cM9WdGLjCvvcbmpzUn61ZvxW0bMxPTw3K3G+f8uroZJWvcA3H34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745499762; c=relaxed/simple;
	bh=eQzx+fu6PtOfEIyP+38fseRdXivb/g+e7FRifGzNnGI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CBCD9gLp6bwR+CggMMMB2OOiy5zrjhe5jXGMA00Ak9vOmV4HrmtC/DKOBZ8IkV//fbKhdLqXfV9yfmpekV6Vsn4LaCgLOy77gxIz/1UaIw0G2L0c6uR+HPgBwc67NGVLTiWl9CL9kJFi0zbAFOAyh5z31NtlBgReyoHEZBXq0E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1u7wDh-0002ZY-3v; Thu, 24 Apr 2025 15:02:25 +0200
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1u7wDf-001swJ-24;
	Thu, 24 Apr 2025 15:02:23 +0200
Received: from ore by dude04.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1u7wDf-00Gc5G-1m;
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
Subject: [PATCH net-next v1 4/4] net: phy: Always read EEE LPA in genphy_c45_ethtool_get_eee()
Date: Thu, 24 Apr 2025 15:02:22 +0200
Message-Id: <20250424130222.3959457-5-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250424130222.3959457-1-o.rempel@pengutronix.de>
References: <20250424130222.3959457-1-o.rempel@pengutronix.de>
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

Previously, genphy_c45_ethtool_get_eee() used genphy_c45_eee_is_active(),
which skips reading the EEE LPA register if local EEE is disabled. This
prevents ethtool from reporting the link partner's EEE capabilities in
that case.

Replace it with genphy_c45_read_eee_lpa(), which always reads the LPA
register regardless of local EEE state. This allows users to see the
link partner's EEE advertisement even when EEE is disabled locally.

Example before the patch:

  EEE settings for lan1:
          EEE status: disabled
          Tx LPI: disabled
          Supported EEE link modes:  100baseT/Full
                                     1000baseT/Full
          Advertised EEE link modes:  Not reported
          Link partner advertised EEE link modes:  Not reported

After the patch:

  EEE settings for lan1:
          EEE status: disabled
          Tx LPI: disabled
          Supported EEE link modes:  100baseT/Full
                                     1000baseT/Full
          Advertised EEE link modes:  Not reported
          Link partner advertised EEE link modes:  100baseT/Full
                                                   1000baseT/Full

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 drivers/net/phy/phy-c45.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/phy/phy-c45.c b/drivers/net/phy/phy-c45.c
index 8eb12433387d..9c582abc023a 100644
--- a/drivers/net/phy/phy-c45.c
+++ b/drivers/net/phy/phy-c45.c
@@ -1510,8 +1510,8 @@ int genphy_c45_ethtool_get_eee(struct phy_device *phydev,
 {
 	int ret;
 
-	ret = genphy_c45_eee_is_active(phydev, data->lp_advertised);
-	if (ret < 0)
+	ret = genphy_c45_read_eee_lpa(phydev, data->lp_advertised);
+	if (ret)
 		return ret;
 
 	data->eee_active = phydev->eee_active;
-- 
2.39.5

