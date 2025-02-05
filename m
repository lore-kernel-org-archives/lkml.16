Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B429122DF92
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752245; cv=none; b=qWfyJD9cB+OMotYo6CmIQ/Z8iuReu2w2BdQwLxMWrhMIrvlfYnK9GQxnenXKsIJf8vtFVe+aoRgF1bgU43NIGdPOSor0u/0KFy9PpIa4QL5Jqy1wbrkwrBtvgVir7Oi6Uzec7xwlv67fHeeURD7EFcTqimFASEo6v11Ff3u9I3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752245; c=relaxed/simple;
	bh=h0K6bmCS4q1BCFQok2IBhMbBrrfdAwg3rxMcmrQfzTw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=V0pSvW3+umnOpnCYh3SJFRGESJSy+OBwKKmS+rFtl5kIwSliMHsmQf2HBHLZIznFN8+b+FTuF5DEa5nlYUI68pCp/yMf7RwYJwbzuaZ88XaZ08bRmtMQj5VOFvukdwzJy3dRvsyLwcecY749l+su+uVmd8lnGEAqjPbJFCdio6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=kDrRc/Eh; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=+ZBVEG49; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="kDrRc/Eh";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="+ZBVEG49"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EgglCJ8InglBHTkmeAtwEjBiFRG6MBIw9I+Lo8fY/Ng=;
	b=kDrRc/EhphAtHESQ9OkritBSFsoM66dpAO0u7MgjyMG6adhKM0vlTP4JrkA2lXzkCLKvDO
	s2yoptTAsQ5zT/gnSk7QgytH7yYHGUGe7eHLfKu0w+p5in+svCLR2Tj/cH3Zdo030yIqTx
	A3qBDdK0p8rNt43xk+06lu1wAKlSMiDDhNMcx+QWIPnQOjCvslpO4fFBF4kITfzek7FC3l
	Vu/BCx3VxN27L2/VOyWwZHfC7FGNR/qPeUZWswl1ELEVX2PxSVRA0fTc9ck4Tpb/GMu7Ol
	Vqm72891hHwl2UACuU8l5n+QRyJuQYxegZlAuOiTcDciwwkZwsOLfOK92CnIbw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EgglCJ8InglBHTkmeAtwEjBiFRG6MBIw9I+Lo8fY/Ng=;
	b=+ZBVEG49WUxOuH7aAfKA52bpC83Lyz2sHGMtFs2qRJcMApHblZt6c7sFvg8Gn8IdQMZcYe
	4j6F2MzVEYerdCBg==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH v2 12/24] net: sparx5: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:43:32 +0100
Message-Id: <d8f0e09bfa4bd4850e363645cc634afeb5779b88.1738746872.git.namcao@linutronix.de>
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

Signed-off-by: Nam Cao <namcao@linutronix.de>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
---
 drivers/net/ethernet/microchip/sparx5/sparx5_packet.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_packet.c b/driver=
s/net/ethernet/microchip/sparx5/sparx5_packet.c
index 138ac58fae51..f713656f1fae 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_packet.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_packet.c
@@ -375,6 +375,6 @@ irqreturn_t sparx5_xtr_handler(int irq, void *_sparx5)
=20
 void sparx5_port_inj_timer_setup(struct sparx5_port *port)
 {
-	hrtimer_init(&port->inj_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-	port->inj_timer.function =3D sparx5_injection_timeout;
+	hrtimer_setup(&port->inj_timer, sparx5_injection_timeout, CLOCK_MONOTONIC,
+		      HRTIMER_MODE_REL);
 }
--=20
2.39.5

