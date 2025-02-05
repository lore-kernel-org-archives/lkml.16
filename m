Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A4922E401
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752247; cv=none; b=bSqL5YJiC8D93s+ngS9olM5a4IKnxI4xuFSXPvNPSaeJ286cnGIhtck0VAOhGLG12WCqzKfhv/OOfFqABT5SjxzQyQjKEdr1jDq5x+4YDmz4LbGnGwXneFbizvtuB6J+h/I1gS8nU3zirejxZfK8YmWs+gdkDSKBVNeenUQPC9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752247; c=relaxed/simple;
	bh=gj/8Mg6slLLqxOr8YxYsRB9Z+0pAaZUEoHEUKUkYwoU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=u3H7Qpd73ioIcWH12wTUAUz/TAanVcLl6v5yNBBu/FHr/ss+bnGupoUKesfzvVmlk4+xkiEPG6K9diozFWKZnTN2pT835G5rs9iAuzoJI0HmNDsNsyF2B3lI5i+d6GLVBfXJSCFIeSmFjX2QAW0h94Oh3vNEmlVwqy+xq1OrK9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=n+Dj/vtP; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=7mnWtfys; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="n+Dj/vtP";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="7mnWtfys"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GI1ayQd/PQf/8dhAdlzeg3802DLw7KK72RtoekfarPw=;
	b=n+Dj/vtPrtVFl1RmAF37K4PNt1gEs5oBZnpVE7qZOpeS99g+nh4yYoP8aIDN/ulMTp+yvr
	EQbxQLtLj25AIRYYj+fNleHfGQfIpcxlAmsd5JwqsBh7WquAHrMgBJPnxnB30LaHpJbNyK
	nQop4tt+D2uM+Izh/thPvqk0BRbElYBpLsNelSjqaajhgqlF4MXMmx4Gfixnit0dUh30qE
	M2ezFOUgGbYTRmtocrm2oTfQ7Mbm6nosjXQlsDSgCSPj8wF4NSpMZYt3tN8mF7r273aHz7
	abL8DVtqpaxi5SWo8h6JWLDHhvkGDQn0Wm0aBpm/5GPCdjB5S1DJCBUqdS+vgA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GI1ayQd/PQf/8dhAdlzeg3802DLw7KK72RtoekfarPw=;
	b=7mnWtfys3aQ1X7d6sZWk9V0hqttCnZYEfNlRDoe9yEdkKRx8RpIA7YHJ2GszeMhdfgPd+1
	o9EoQiVsLh60crDQ==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH v2 16/24] net: stmmac: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:43:36 +0100
Message-Id: <73598e0c22ca99ce7a0e863298a0e0902f4d6e1d.1738746872.git.namcao@linutronix.de>
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
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/ne=
t/ethernet/stmicro/stmmac/stmmac_main.c
index d04543e5697b..8bcb435ec71f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3184,8 +3184,7 @@ static void stmmac_init_coalesce(struct stmmac_priv *=
priv)
 		priv->tx_coal_frames[chan] =3D STMMAC_TX_FRAMES;
 		priv->tx_coal_timer[chan] =3D STMMAC_COAL_TX_TIMER;
=20
-		hrtimer_init(&tx_q->txtimer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-		tx_q->txtimer.function =3D stmmac_tx_timer;
+		hrtimer_setup(&tx_q->txtimer, stmmac_tx_timer, CLOCK_MONOTONIC, HRTIMER_=
MODE_REL);
 	}
=20
 	for (chan =3D 0; chan < rx_channel_count; chan++)
@@ -6952,8 +6951,7 @@ int stmmac_xdp_open(struct net_device *dev)
 		stmmac_set_tx_tail_ptr(priv, priv->ioaddr,
 				       tx_q->tx_tail_addr, chan);
=20
-		hrtimer_init(&tx_q->txtimer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-		tx_q->txtimer.function =3D stmmac_tx_timer;
+		hrtimer_setup(&tx_q->txtimer, stmmac_tx_timer, CLOCK_MONOTONIC, HRTIMER_=
MODE_REL);
 	}
=20
 	/* Enable the MAC Rx/Tx */
--=20
2.39.5

