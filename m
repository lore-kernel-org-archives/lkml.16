Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6F222D4D7
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752243; cv=none; b=jZ6SlpPhwE8IrJ0dktkHcK/vYCxPR7qqffDzcVNcEGTghmsv/iTrFBl+iifl9LjAR+27U9v0o/0FvmyjYMtxtwrwpewn6WmL1XsfU9zEyKz6H7iNBCX3CvTZuBUCfup5YuE8nPgz8YWvGULF9YlCrMUlRAKOVBdMg6ZuN+a5XzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752243; c=relaxed/simple;
	bh=yqFgXdoIeGEn2fnEns19b+NrMl58lhXFt6MI2Fxf85A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KFv/l3E7jyvPAdVX/PcH5wo0FSPSYOOpPQOr791M8fHIsJ5wKZ2FKnv5gjtl+i9dhJjDYS6xFWbhJ55VOZJde9hpCKPX5Gss1M3jqrkqhrnK/HsaQ2PtpP1hWg6ydZ6zuv6J1t/937xGs4VeBKWiOJ91+nQC0vHMDa+Ska8dXk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ac07Paku; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=6LlfTrKi; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ac07Paku";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="6LlfTrKi"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DEq6TYs97jrhDpTwX+GEUbWawU96CdQbcAH0e1yZZ8E=;
	b=ac07Pakup3XMtv2efgqatK0ZG7OaPY3djyClir4cEF9u1iOowRmRGBZ5LybSJZRpB6m5Tl
	UtkoIhbPdEtB6ul2vSHwIbtAYDSNmB/YAnLH8Jbf0Bme+OOfOCoLb5CuueI/zy6lGyM0Ww
	MjVvPaCUG7+CfefvbeiPQlewuis1k6uwBoNh8V/UC5/OTfJoH+O8OiTDl7Pd5rjHuKU5pk
	x6FYZpYY0AbKq1LchL3hJ1wuKzE9730P9CpLZe9lu3ulD1hxIFXGwQkfYYVtCBzWvhKDtL
	oOlsQb8S5LbhN2ckJaxEweEmJgCyMp+RoCB4LAIW/BYXOHr7JfVLEPlCcCnWtA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DEq6TYs97jrhDpTwX+GEUbWawU96CdQbcAH0e1yZZ8E=;
	b=6LlfTrKiktN0Kkl92ilKj9oqNZpnLvKTuMUUPGc21X2XGZw3oDljceinyW+wWej3qgppXa
	ZF6qaFhWW5Mf9DCw==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH v2 06/24] can: mcp251xfd: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:43:26 +0100
Message-Id: <af32e1b1814263485be17bca9707d555f857c53f.1738746872.git.namcao@linutronix.de>
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

Reviewed-by: Marc Kleine-Budde <mkl@pengutronix.de>
Signed-off-by: Nam Cao <namcao@linutronix.de>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
---
 drivers/net/can/spi/mcp251xfd/mcp251xfd-ring.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/can/spi/mcp251xfd/mcp251xfd-ring.c b/drivers/net/c=
an/spi/mcp251xfd/mcp251xfd-ring.c
index 7209a831f0f2..c34f2067a989 100644
--- a/drivers/net/can/spi/mcp251xfd/mcp251xfd-ring.c
+++ b/drivers/net/can/spi/mcp251xfd/mcp251xfd-ring.c
@@ -541,11 +541,11 @@ int mcp251xfd_ring_alloc(struct mcp251xfd_priv *priv)
 	}
 	priv->rx_ring_num =3D i;
=20
-	hrtimer_init(&priv->rx_irq_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-	priv->rx_irq_timer.function =3D mcp251xfd_rx_irq_timer;
+	hrtimer_setup(&priv->rx_irq_timer, mcp251xfd_rx_irq_timer, CLOCK_MONOTONI=
C,
+		      HRTIMER_MODE_REL);
=20
-	hrtimer_init(&priv->tx_irq_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-	priv->tx_irq_timer.function =3D mcp251xfd_tx_irq_timer;
+	hrtimer_setup(&priv->tx_irq_timer, mcp251xfd_tx_irq_timer, CLOCK_MONOTONI=
C,
+		      HRTIMER_MODE_REL);
=20
 	return 0;
 }
--=20
2.39.5

