Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6725C2E6119
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 11:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751543398; cv=none; b=Gglnb8a27V7EMZxb7LQK2yI77rfzzDPgc/JwIKMqelzEYQX7bM++cqzCTFGjnUJm/aDAxKlSo9aDgtan7yvIWbXUoHggYPIeKr0QxuGdo+egsqBmBO7QGxQxnSrpcLVn6/Wx50tJTRwpZmi9KZnr0E9TPS1D5/42g9KENR1kpro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751543398; c=relaxed/simple;
	bh=h5sT7K0qujjGAxa1ljOQ5qCQmP+3h2L0erhsAYhuP9A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=L10vKp4F6Fj/WxQKq6bpcs6Q4bb2Nyr5e9L9B0SiNMBe9+MQf1TGt0APyCPXcM1wdD5qEqR1hTtr/rh0YogAYVzk7zJ6ssR5Dpm0n3aW3iSkk3q6HO4v+zkoB4o5AlfCBvUAo6W2Nj39UtT2id0bBU10mGH+tg8PPZ0mR/4IWGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1uXIRk-0004Pn-FK; Thu, 03 Jul 2025 13:49:44 +0200
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1uXIRi-006awH-1o;
	Thu, 03 Jul 2025 13:49:42 +0200
Received: from ore by dude04.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1uXIRi-00DbtX-1U;
	Thu, 03 Jul 2025 13:49:42 +0200
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
	Andre Edich <andre.edich@microchip.com>,
	kernel@pengutronix.de,
	linux-kernel@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	netdev@vger.kernel.org,
	Lukas Wunner <lukas@wunner.de>
Subject: [PATCH net v2 2/3] net: phy: smsc: Force predictable MDI-X state on LAN87xx
Date: Thu,  3 Jul 2025 13:49:40 +0200
Message-Id: <20250703114941.3243890-3-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250703114941.3243890-1-o.rempel@pengutronix.de>
References: <20250703114941.3243890-1-o.rempel@pengutronix.de>
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

Override the hardware strap configuration for MDI-X mode to ensure a
predictable initial state for the driver. The initial mode of the LAN87xx
PHY is determined by the AUTOMDIX_EN strap pin, but the driver has no
documented way to read its latched status.

This unpredictability means the driver cannot know if the PHY has
initialized with Auto-MDIX enabled or disabled, preventing it from
providing a reliable interface to the user.

This patch introduces a `config_init` hook that forces the PHY into a
known state by explicitly enabling Auto-MDIX.

Fixes: 05b35e7eb9a1 ("smsc95xx: add phylib support")
Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Andre Edich <andre.edich@microchip.com>
---
 drivers/net/phy/smsc.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/smsc.c b/drivers/net/phy/smsc.c
index adf12d7108b5..ad9a3d91bb8a 100644
--- a/drivers/net/phy/smsc.c
+++ b/drivers/net/phy/smsc.c
@@ -262,6 +262,33 @@ int lan87xx_read_status(struct phy_device *phydev)
 }
 EXPORT_SYMBOL_GPL(lan87xx_read_status);
 
+static int lan87xx_phy_config_init(struct phy_device *phydev)
+{
+	int rc;
+
+	/* The LAN87xx PHY's initial MDI-X mode is determined by the AUTOMDIX_EN
+	 * hardware strap, but the driver cannot read the strap's status. This
+	 * creates an unpredictable initial state.
+	 *
+	 * To ensure consistent and reliable behavior across all boards,
+	 * override the strap configuration on initialization and force the PHY
+	 * into a known state with Auto-MDIX enabled, which is the expected
+	 * default for modern hardware.
+	 */
+	rc = phy_modify(phydev, SPECIAL_CTRL_STS,
+			SPECIAL_CTRL_STS_OVRRD_AMDIX_ |
+			SPECIAL_CTRL_STS_AMDIX_ENABLE_ |
+			SPECIAL_CTRL_STS_AMDIX_STATE_,
+			SPECIAL_CTRL_STS_OVRRD_AMDIX_ |
+			SPECIAL_CTRL_STS_AMDIX_ENABLE_);
+	if (rc < 0)
+		return rc;
+
+	phydev->mdix_ctrl = ETH_TP_MDI_AUTO;
+
+	return smsc_phy_config_init(phydev);
+}
+
 static int lan874x_phy_config_init(struct phy_device *phydev)
 {
 	u16 val;
@@ -696,7 +723,7 @@ static struct phy_driver smsc_phy_driver[] = {
 
 	/* basic functions */
 	.read_status	= lan87xx_read_status,
-	.config_init	= smsc_phy_config_init,
+	.config_init	= lan87xx_phy_config_init,
 	.soft_reset	= smsc_phy_reset,
 	.config_aneg	= lan87xx_config_aneg,
 
-- 
2.39.5

