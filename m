Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0BA23644D
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 11:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745579341; cv=none; b=XZwF9uzv9nwW+1ckIDY3Gq0OPdVP5MNO2evm/Dcrp73URhxDnaagO1MRv9kKXYEW2ZUacOo2cztgRMRyYAt2P9u06c2I6HrQsRh/czYD/YXaUjrw54jkt5/Ec+T7Jko63tPo2zx+n08Ra7Vj15V6cwv9k4riMn6AaFpMe+n9tTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745579341; c=relaxed/simple;
	bh=A28LYoc3RVB8w/haAgNOvS5MfiYECdJ08AJKkRK2+AI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qcSwjmp0i1ueU3g9eC+NRZhqgEWyWVIPTKtBsQuVPQrv7lWaq3DiKKvP+09r3AKKSZACfxKAq7L3r5iO7tMgkg4DSCxOsqOXDOWhMAnjV2haNqCkM7/GxDIj7Kb0w+qtlHVPUDkLvkHjc++l3R8b6tKmSElyh0pygj1FutdnXWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1u8GvI-0003Ek-PT; Fri, 25 Apr 2025 13:08:48 +0200
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1u8GvH-0022JL-0j;
	Fri, 25 Apr 2025 13:08:47 +0200
Received: from ore by dude04.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1u8GvH-0021Z1-0V;
	Fri, 25 Apr 2025 13:08:47 +0200
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: "David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew@lunn.ch>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Woojung Huh <woojung.huh@microchip.com>,
	"Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
	kernel@pengutronix.de,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	UNGLinuxDriver@microchip.com
Subject: [PATCH net-next v2 1/1] net: dsa: microchip: Remove ineffective checks from ksz_set_mac_eee()
Date: Fri, 25 Apr 2025 13:08:45 +0200
Message-Id: <20250425110845.482652-1-o.rempel@pengutronix.de>
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

KSZ switches handle EEE internally via PHY advertisement and do not
support MAC-level configuration. The ksz_set_mac_eee() handler previously
rejected Tx LPI disable and timer changes, but provided no real control.

These checks now interfere with userspace attempts to disable EEE and no
longer reflect the actual hardware behavior. Replace the logic with a
no-op.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 drivers/net/dsa/microchip/ksz_common.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/net/dsa/microchip/ksz_common.c b/drivers/net/dsa/microchip/ksz_common.c
index b45052497f8a..b4a8f2c6346f 100644
--- a/drivers/net/dsa/microchip/ksz_common.c
+++ b/drivers/net/dsa/microchip/ksz_common.c
@@ -3492,18 +3492,6 @@ static bool ksz_support_eee(struct dsa_switch *ds, int port)
 static int ksz_set_mac_eee(struct dsa_switch *ds, int port,
 			   struct ethtool_keee *e)
 {
-	struct ksz_device *dev = ds->priv;
-
-	if (!e->tx_lpi_enabled) {
-		dev_err(dev->dev, "Disabling EEE Tx LPI is not supported\n");
-		return -EINVAL;
-	}
-
-	if (e->tx_lpi_timer) {
-		dev_err(dev->dev, "Setting EEE Tx LPI timer is not supported\n");
-		return -EINVAL;
-	}
-
 	return 0;
 }

--
2.39.5

