Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A9722F14F
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752248; cv=none; b=FNFbWY34YyysWK5gVvOf4rB0ezxl+1d0/bvx8p6e/Hogo21r6soB66IBa4E2eZXBWCvThy29d9NTwwHZ7dzTRm3MYDOePXu06O6Xhqc5itqmEo1fGAIvn5/BQJqfsZqStrwQvfW1Q1aj2L84cI1N47hU4Q631/B7M8a/iFfjuew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752248; c=relaxed/simple;
	bh=uCC/69Tzv+3SfGld3SpWWhGW4Yz0ytwitnZOJjQ88Ns=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DRpIITOwPjk/YDRT66n9iDaTsULG2Jg5DSbZDuqt66YRYCDCwcn+UWBtfJRDno4pRXGIGoHMG8pGlBP7b7sQe7XZaK53+Tk0/GxA1+Gri5Q3puxcBweJES0Ve+NF5DfbuLhzdLQ+zuVSmnZOJT0q1QyTTkwuNLrDI2kFHvBZIS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=g3GuJ+1y; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=OYEfKmFQ; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="g3GuJ+1y";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="OYEfKmFQ"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752244;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OJZck8LRzJyIgA1Ap3Q6yWpO0JwaFuR18b7pJw7GS/I=;
	b=g3GuJ+1yYYSlUPbZDNQmpfHE1UZmEJ3g+3HKXIDbPxM96Bxi3syurembalqDn2/zEm18zG
	XgBC1fbGXy0LKt0IBm5DXCBkkNtR3ckpeX+R13d1K2IlI28D81P+8JpYBne5N3wR8SVhaV
	c7eHj+00z3OjF5t9PoN8+a/7QHfopdDBF/XDTzAKRQQGd+kJ5Z1ETC6iWwwhTufVqVyUW1
	3r6gE1z07m67CeB0WrOMuKJ+M4uVlPTnpDm3wVNmBQYf6tL1/+/4O8gbxizFySmV5PKxZK
	FbpCbce5Kouv8GH1ZJPkmWfkUyxyaWYWOuDn4WCrwAEt9aI84YHCHlykVCsVGg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752244;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OJZck8LRzJyIgA1Ap3Q6yWpO0JwaFuR18b7pJw7GS/I=;
	b=OYEfKmFQKY2/d1lAFiaqD7PuaofM+ye9VA7ch9tcF4psLIfTnqc3VsAIYmlTQSwv/5b95R
	A5k2qn6Ec1jPdLAg==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH v2 17/24] net: fec: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:43:37 +0100
Message-Id: <c68759ce7879a41d33d1d435c721f156cb1683c2.1738746872.git.namcao@linutronix.de>
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
 drivers/net/ethernet/freescale/fec_ptp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/freescale/fec_ptp.c b/drivers/net/etherne=
t/freescale/fec_ptp.c
index 7f6b57432071..fe4e7f99b6a3 100644
--- a/drivers/net/ethernet/freescale/fec_ptp.c
+++ b/drivers/net/ethernet/freescale/fec_ptp.c
@@ -739,8 +739,8 @@ void fec_ptp_init(struct platform_device *pdev, int irq=
_idx)
=20
 	INIT_DELAYED_WORK(&fep->time_keep, fec_time_keep);
=20
-	hrtimer_init(&fep->perout_timer, CLOCK_REALTIME, HRTIMER_MODE_REL);
-	fep->perout_timer.function =3D fec_ptp_pps_perout_handler;
+	hrtimer_setup(&fep->perout_timer, fec_ptp_pps_perout_handler, CLOCK_REALT=
IME,
+		      HRTIMER_MODE_REL);
=20
 	irq =3D platform_get_irq_byname_optional(pdev, "pps");
 	if (irq < 0)
--=20
2.39.5

