Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95FF32676C2
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 14:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750861293; cv=none; b=SUjo6AZ3S87sA3tPRYLJrGGJayqYHN5Qk15vn5LP1/8VSn6/9kcsoJT/UoMvv2JwyTDHTnlLPhAPQvp8j3MnDod5LkZ38q3ZFl45HUs1fEMFT7z9M9iq+CfhkTFVqHVn6CQCuA0oTmXocYf79m5ir6xIVTqR0gOfBMG6bgE+tww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750861293; c=relaxed/simple;
	bh=64gc/bivlLQdf8HiIPz0607rKHw5qWOyQ8V3IlfkOWs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=kdoeVzG92/OM5gQlPzR2y6zHqazyaBukadsgNwROtaFo8f8F9ELnrBc2BEWdKrMZSRMC1B1niT6gpqunE8nIGVo9bALX+JwUXxnWGgd9W6cCsOpGOIznYw+ZL0KZCN0hP15uTXSdQjzTKXicl3HWhObRwxsCCChSqceEM0bQwzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <jre@pengutronix.de>)
	id 1uUR02-00017V-CV; Wed, 25 Jun 2025 16:21:18 +0200
From: Jonas Rebmann <jre@pengutronix.de>
Date: Wed, 25 Jun 2025 16:21:14 +0200
Subject: [PATCH] net: fec: allow disable coalescing
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-fec_deactivate_coalescing-v1-1-57a1e41a45d3@pengutronix.de>
X-B4-Tracking: v=1; b=H4sIANkFXGgC/x3MQQqEMBAF0atIrw2YMIbBq4hI0/lxGiRKIiKId
 zfM8i2qbirIikJDc1PGqUW3VGHbhuTHaYHRUE2uc33nXW8iZA5gOfTkA7NsvKKIpsWIj99gP2y
 D91T7PSPq9X+P0/O8amWRPWsAAAA=
X-Change-ID: 20250625-fec_deactivate_coalescing-c6f8d14a1d66
To: Wei Fang <wei.fang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>, 
 Clark Wang <xiaoning.wang@nxp.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: imx@lists.linux.dev, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel@pengutronix.de, 
 Jonas Rebmann <jre@pengutronix.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2562; i=jre@pengutronix.de;
 h=from:subject:message-id; bh=64gc/bivlLQdf8HiIPz0607rKHw5qWOyQ8V3IlfkOWs=;
 b=owGbwMvMwCF2ZcYT3onnbjcwnlZLYsiIYb0T9LCcx7lcZ4US9+MHsbuf527ZJnCRf73ILLbg0
 tqVe6qPdZSyMIhxMMiKKbLEqskpCBn7XzertIuFmcPKBDKEgYtTACbSf4mR4a3r7XPujvtd/lQX
 Vv3zybw0vVN784zZrsJBCwWef/vv3c3IsPGyjj7bAWumT22v+ZLL49fnq7n45cfNsv8vx/WktNW
 SAQA=
X-Developer-Key: i=jre@pengutronix.de; a=openpgp;
 fpr=0B7B750D5D3CD21B3B130DE8B61515E135CD49B5
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::ac
X-SA-Exim-Mail-From: jre@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

In the current implementation, IP coalescing is always enabled and
cannot be disabled.

As setting maximum frames to 0 or 1, or setting delay to zero implies
immediate delivery of single packets/IRQs, disable coalescing in
hardware in these cases.

Signed-off-by: Jonas Rebmann <jre@pengutronix.de>
---
 drivers/net/ethernet/freescale/fec_main.c | 34 ++++++++++++++-----------------
 1 file changed, 15 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethernet/freescale/fec_main.c
index 63dac42720453a8b8a847bdd1eec76ac072030bf..07676f35664736a89d53c1cb4a436218c28524f7 100644
--- a/drivers/net/ethernet/freescale/fec_main.c
+++ b/drivers/net/ethernet/freescale/fec_main.c
@@ -3121,27 +3121,23 @@ static int fec_enet_us_to_itr_clock(struct net_device *ndev, int us)
 static void fec_enet_itr_coal_set(struct net_device *ndev)
 {
 	struct fec_enet_private *fep = netdev_priv(ndev);
-	int rx_itr, tx_itr;
+	int rx_itr = 0, tx_itr = 0;
 
-	/* Must be greater than zero to avoid unpredictable behavior */
-	if (!fep->rx_time_itr || !fep->rx_pkts_itr ||
-	    !fep->tx_time_itr || !fep->tx_pkts_itr)
-		return;
-
-	/* Select enet system clock as Interrupt Coalescing
-	 * timer Clock Source
-	 */
-	rx_itr = FEC_ITR_CLK_SEL;
-	tx_itr = FEC_ITR_CLK_SEL;
-
-	/* set ICFT and ICTT */
-	rx_itr |= FEC_ITR_ICFT(fep->rx_pkts_itr);
-	rx_itr |= FEC_ITR_ICTT(fec_enet_us_to_itr_clock(ndev, fep->rx_time_itr));
-	tx_itr |= FEC_ITR_ICFT(fep->tx_pkts_itr);
-	tx_itr |= FEC_ITR_ICTT(fec_enet_us_to_itr_clock(ndev, fep->tx_time_itr));
+	if (fep->rx_time_itr > 0 && fep->rx_pkts_itr > 1) {
+		/* Select enet system clock as Interrupt Coalescing timer Clock Source */
+		rx_itr = FEC_ITR_CLK_SEL;
+		rx_itr |= FEC_ITR_EN;
+		rx_itr |= FEC_ITR_ICFT(fep->rx_pkts_itr);
+		rx_itr |= FEC_ITR_ICTT(fec_enet_us_to_itr_clock(ndev, fep->rx_time_itr));
+	}
 
-	rx_itr |= FEC_ITR_EN;
-	tx_itr |= FEC_ITR_EN;
+	if (fep->tx_time_itr > 0 && fep->tx_pkts_itr > 1) {
+		/* Select enet system clock as Interrupt Coalescing timer Clock Source */
+		tx_itr = FEC_ITR_CLK_SEL;
+		tx_itr |= FEC_ITR_EN;
+		tx_itr |= FEC_ITR_ICFT(fep->tx_pkts_itr);
+		tx_itr |= FEC_ITR_ICTT(fec_enet_us_to_itr_clock(ndev, fep->tx_time_itr));
+	}
 
 	writel(tx_itr, fep->hwp + FEC_TXIC0);
 	writel(rx_itr, fep->hwp + FEC_RXIC0);

---
base-commit: 8dacfd92dbefee829ca555a860e86108fdd1d55b
change-id: 20250625-fec_deactivate_coalescing-c6f8d14a1d66

Best regards,
-- 
Jonas Rebmann <jre@pengutronix.de>

