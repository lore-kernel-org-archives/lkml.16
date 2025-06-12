Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A12233D9E
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 10:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749724936; cv=none; b=uZNReSNXaxHwKrQPqTlqzyJRcY+k/gGWStdU/S2mzX6ujDcnS3gF4gzShLldqrYRWRXpjbg2q1Wk8aX3n8oSA+htBc79JqofcXdp5KpE4m1nq5WNpdeuPRwL2dgex2Uj67mxKNjfAfd8KtizSqHyyqbnkAAf57E8S3RGMyQlRsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749724936; c=relaxed/simple;
	bh=qakqnYbp0Vf8pUMDYk4oYr8IE4ZL3eLBv+g1sFJb9YA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=akUmDYVVIuSGmGV7gFkixHT062RDTOVoWA0x28+MW8UV28sNLfRidSA0aENe72ybFakKb57Erm5JxtiMTb6SpKxfbGNCwwkLRwm0p324JrTiBNlE55uajxSLxL/Z2ftLexXwyZa38Wn7BO/DTUEEKpyDTZVez2v/aUAbM7xYzBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1uPfNg-00069I-GW; Thu, 12 Jun 2025 12:42:00 +0200
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1uPfNf-0036k1-0U;
	Thu, 12 Jun 2025 12:41:59 +0200
Received: from ore by dude04.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1uPfNf-009UTw-0H;
	Thu, 12 Jun 2025 12:41:59 +0200
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: David Jander <david@protonic.nl>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	kernel@pengutronix.de,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v2 2/3] net: phy: dp83tg720: remove redundant 600ms post-reset delay
Date: Thu, 12 Jun 2025 12:41:56 +0200
Message-Id: <20250612104157.2262058-3-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250612104157.2262058-1-o.rempel@pengutronix.de>
References: <20250612104157.2262058-1-o.rempel@pengutronix.de>
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

From: David Jander <david@protonic.nl>

Now that dp83tg720_soft_reset() introduces role-specific delays to avoid
reset synchronization deadlocks, the fixed 600ms post-reset delay in
dp83tg720_read_status() is no longer needed.

The new logic provides both the required MDC timing and link stabilization,
making the old empirical delay redundant and unnecessarily long.

Co-developed-by: Oleksij Rempel <o.rempel@pengutronix.de>
Signed-off-by: David Jander <david@protonic.nl>
Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
changes v2:
- move by Sob to the end of commit message
---
 drivers/net/phy/dp83tg720.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/net/phy/dp83tg720.c b/drivers/net/phy/dp83tg720.c
index a53ea6d6130b..92597d12ecb9 100644
--- a/drivers/net/phy/dp83tg720.c
+++ b/drivers/net/phy/dp83tg720.c
@@ -450,21 +450,11 @@ static int dp83tg720_read_status(struct phy_device *phydev)
 		/* According to the "DP83TC81x, DP83TG72x Software
 		 * Implementation Guide", the PHY needs to be reset after a
 		 * link loss or if no link is created after at least 100ms.
-		 *
-		 * Currently we are polling with the PHY_STATE_TIME (1000ms)
-		 * interval, which is still enough for not automotive use cases.
 		 */
 		ret = phy_init_hw(phydev);
 		if (ret)
 			return ret;
 
-		/* Sleep 600ms for PHY stabilization post-reset.
-		 * Empirically chosen value (not documented).
-		 * Helps reduce reset bounces with link partners having similar
-		 * issues.
-		 */
-		msleep(600);
-
 		/* After HW reset we need to restore master/slave configuration.
 		 * genphy_c45_pma_baset1_read_master_slave() call will be done
 		 * by the dp83tg720_config_aneg() function.
-- 
2.39.5

