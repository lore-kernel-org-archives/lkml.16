Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A4E22D4E1
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752245; cv=none; b=sPZD7AgwzHFTV/lqNyV1bR5UggsrAT/iy1Ixk+FarFbDW8HJ3S+TQ/TEA9ofb0xRUkgarnO4lIh0PHGtV+6GScKnf4e2JPLPdPUCP2gFrzRRid28njNPXkRltohbPrBYKLihNU1qeFtnN96uco2fXQCkJQvogV4RkXHZO+zJoos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752245; c=relaxed/simple;
	bh=3MCkUp4GcywPXVI0Z7DvgOiljVL7mfG2UeO4+a77KjM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bkgq2amuCVqgJNm0J2F3AFhuNqKD/COXcb5DXv7cENM92q45pVlrjL4mCGZ1DA2VvGnfoa1HMuwGj8VOhpRlijkoDrlRMEGBL7QNiRg4pr5jbpV6mIn9sS0ye3PZAdA62SiKlQxtzULStJaMI205zVaPUzpvZrKB/SB9WWfeJWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=I5pJH0oF; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=UcjwB8M0; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="I5pJH0oF";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="UcjwB8M0"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752240;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rw2+KOHKcdJjOsWW3hOAYLU7gY9ICDPP1Zj0SZUVHk8=;
	b=I5pJH0oFHLHFzJPSsScNGQHxzYfnH6kZdsntF7QQ3+q+TO+BxKdE1EOCZZluMIaa6HMf1C
	hea0YBA3MssGO100g4yBpvM22uV745iOdtU4pmb/uz7IG34J+n5+KApk04qKwVqxePijBm
	JvZWZ/pw+dGkHFphufW/5Q2Kngfb4rnvfWxD0PHoFf5s8oh29P5xY5bDjKeSfHUmOWxUhf
	c5mroUb6VbgyjnErdNGtaYWe5LtA4lkwBJpYdkAnyUm7XaI5oJ4hET7g80OMUkiCB6KemT
	JRmTh1gv3iaPlTEMyaFFLZGxDIg63ks01y7vUvA2jZeZ3E4y+Vku0kXZCbnNGQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752240;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rw2+KOHKcdJjOsWW3hOAYLU7gY9ICDPP1Zj0SZUVHk8=;
	b=UcjwB8M0FVzQghAsoZSJ3LMl7YP/xRPBoCIIhOoCc3eHAzUdLj86/gM78niUPdL3bJBd4+
	ukiR7VGSQRB2wmBg==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH v2 08/24] net: ethernet: ti: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:43:28 +0100
Message-Id: <bd34d3d0dba9a47b6ec5d14776941e9aa118c7d2.1738746872.git.namcao@linutronix.de>
In-Reply-To: <cover.1738746872.git.namcao@linutronix.de>
References: <cover.1738746872.git.namcao@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

hrtimer_setup() takes the callback function pointer as argument and
initializes the timer completely.

Replace hrtimer_init() and the open coded initialization of
hrtimer::function with the new setup mechanism.

Patch was created by using Coccinelle.

Signed-off-by: Nam Cao <namcao@linutronix.de>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
---
 drivers/net/ethernet/ti/am65-cpsw-nuss.c     | 9 ++++-----
 drivers/net/ethernet/ti/icssg/icssg_common.c | 5 ++---
 drivers/net/ethernet/ti/icssg/icssg_prueth.c | 5 ++---
 3 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.c b/drivers/net/etherne=
t/ti/am65-cpsw-nuss.c
index b663271e79f7..bf2d51ecd50e 100644
--- a/drivers/net/ethernet/ti/am65-cpsw-nuss.c
+++ b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
@@ -2299,8 +2299,8 @@ static int am65_cpsw_nuss_ndev_add_tx_napi(struct am6=
5_cpsw_common *common)
 	for (i =3D 0; i < common->tx_ch_num; i++) {
 		struct am65_cpsw_tx_chn *tx_chn =3D &common->tx_chns[i];
=20
-		hrtimer_init(&tx_chn->tx_hrtimer, CLOCK_MONOTONIC, HRTIMER_MODE_REL_PINN=
ED);
-		tx_chn->tx_hrtimer.function =3D &am65_cpsw_nuss_tx_timer_callback;
+		hrtimer_setup(&tx_chn->tx_hrtimer, &am65_cpsw_nuss_tx_timer_callback,
+			      CLOCK_MONOTONIC, HRTIMER_MODE_REL_PINNED);
=20
 		ret =3D devm_request_irq(dev, tx_chn->irq,
 				       am65_cpsw_nuss_tx_irq,
@@ -2553,9 +2553,8 @@ static int am65_cpsw_nuss_init_rx_chns(struct am65_cp=
sw_common *common)
 		snprintf(flow->name,
 			 sizeof(flow->name), "%s-rx%d",
 			 dev_name(dev), i);
-		hrtimer_init(&flow->rx_hrtimer, CLOCK_MONOTONIC,
-			     HRTIMER_MODE_REL_PINNED);
-		flow->rx_hrtimer.function =3D &am65_cpsw_nuss_rx_timer_callback;
+		hrtimer_setup(&flow->rx_hrtimer, &am65_cpsw_nuss_rx_timer_callback, CLOC=
K_MONOTONIC,
+			      HRTIMER_MODE_REL_PINNED);
=20
 		ret =3D devm_request_irq(dev, flow->irq,
 				       am65_cpsw_nuss_rx_irq,
diff --git a/drivers/net/ethernet/ti/icssg/icssg_common.c b/drivers/net/eth=
ernet/ti/icssg/icssg_common.c
index 74f0f200a89d..6c1b8ff563e0 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_common.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_common.c
@@ -249,9 +249,8 @@ int prueth_ndev_add_tx_napi(struct prueth_emac *emac)
 		struct prueth_tx_chn *tx_chn =3D &emac->tx_chns[i];
=20
 		netif_napi_add_tx(emac->ndev, &tx_chn->napi_tx, emac_napi_tx_poll);
-		hrtimer_init(&tx_chn->tx_hrtimer, CLOCK_MONOTONIC,
-			     HRTIMER_MODE_REL_PINNED);
-		tx_chn->tx_hrtimer.function =3D &emac_tx_timer_callback;
+		hrtimer_setup(&tx_chn->tx_hrtimer, &emac_tx_timer_callback, CLOCK_MONOTO=
NIC,
+			      HRTIMER_MODE_REL_PINNED);
 		ret =3D request_irq(tx_chn->irq, prueth_tx_irq,
 				  IRQF_TRIGGER_HIGH, tx_chn->name,
 				  tx_chn);
diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.c b/drivers/net/eth=
ernet/ti/icssg/icssg_prueth.c
index 00ed97860547..d3bdde6bd3aa 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
@@ -1169,9 +1169,8 @@ static int prueth_netdev_init(struct prueth *prueth,
 	ndev->hw_features |=3D NETIF_PRUETH_HSR_OFFLOAD_FEATURES;
=20
 	netif_napi_add(ndev, &emac->napi_rx, icssg_napi_rx_poll);
-	hrtimer_init(&emac->rx_hrtimer, CLOCK_MONOTONIC,
-		     HRTIMER_MODE_REL_PINNED);
-	emac->rx_hrtimer.function =3D &emac_rx_timer_callback;
+	hrtimer_setup(&emac->rx_hrtimer, &emac_rx_timer_callback, CLOCK_MONOTONIC,
+		      HRTIMER_MODE_REL_PINNED);
 	prueth->emac[mac] =3D emac;
=20
 	return 0;
--=20
2.39.5

