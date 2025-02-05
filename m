Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB8E231A3A
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752424; cv=none; b=bq5uQ2vnOe2oTLupgvLHO8ve3pCplKLqPDefucWFg2KyfcWAbdWMw4hKj3mJbIN2wcDe2i/llcD4Q074wJSHvbelWhwVGmxmfsS6XoKrlQmhrfZEpjAK5j7NIUm93XH0ZdQX7KqfPmjFdV9ML53+jMHDlTePtH/UOa20kHKwibk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752424; c=relaxed/simple;
	bh=/QRUIEJcdu2fzCNJ6B++8ueh+6pepgnfzZAqUrn7yFU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gglEMn1IuoU4bYv7CBRt7Q6TD6DrAzT7b13xgCFRwrLZZeg3FJizVy/XN4/uIC8yfJ4M7jvo/P7dan5Aj1FdkD4YogIbX4m8PzHip3R1GaGNbiylTUtuUMVTZE7kl9NNowBU932CRfvu84ZGxjAWPLc4XKYySmCc6XwCGNe0AsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=xZkZEglb; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=G7lUBUkG; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="xZkZEglb";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="G7lUBUkG"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bbmDVlDtVzVzFQHYRxUSMUZd8c/cGrJwTV2M3nZVY6Q=;
	b=xZkZEglbrYL9mw22BU/uM9Vu3wNMUjb8aHwjL6p2fxSOiROh+DsUhm8+1MMzxBhyA1QHbn
	NnB5QTwEGc2AWKt43nwrD4xEWg3XU6kFlFNyg4TyB4sCJYT+F5C0QCSRI5R8vgzYzfuojn
	HoJkt3eCSG0A8Mh5kGoGudol7F72i4FOI4gYPJw+TUZ/z1jQyhQgUwI2JiGH48yJzOA1q2
	l8dVzfqXldQadMh9nY7EBhUq48MEWSWhEEMRzhitIVFwdqDtk0IzSteUvc31SwQQva6eiF
	HeN3mXVeUCZqVW58bLbN+iFIedqQWBX44rx78c7zEpaUdHQigvyLKlgXdoZSHQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bbmDVlDtVzVzFQHYRxUSMUZd8c/cGrJwTV2M3nZVY6Q=;
	b=G7lUBUkGYxpz+mhE+LwQvws2OAfzjl0mpI0NRJDRN9wZCVDs4O1y2HxOxykpAZEpWsB9QD
	JqRAfuc4hQVXexCg==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH v2 17/45] power: supply: ab8500_chargalg: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:46:05 +0100
Message-Id: <fa0bf7376ce8f124c8285a52d9f55d0ab4c42988.1738746904.git.namcao@linutronix.de>
In-Reply-To: <cover.1738746904.git.namcao@linutronix.de>
References: <cover.1738746904.git.namcao@linutronix.de>
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

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Zack Rusin <zack.rusin@broadcom.com>
Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 drivers/power/supply/ab8500_chargalg.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/power/supply/ab8500_chargalg.c b/drivers/power/supply/=
ab8500_chargalg.c
index 7a8d1feb8e90..dc6c8b0dd1cf 100644
--- a/drivers/power/supply/ab8500_chargalg.c
+++ b/drivers/power/supply/ab8500_chargalg.c
@@ -1787,13 +1787,12 @@ static int ab8500_chargalg_probe(struct platform_de=
vice *pdev)
 	psy_cfg.drv_data =3D di;
=20
 	/* Initilialize safety timer */
-	hrtimer_init(&di->safety_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-	di->safety_timer.function =3D ab8500_chargalg_safety_timer_expired;
+	hrtimer_setup(&di->safety_timer, ab8500_chargalg_safety_timer_expired, CL=
OCK_MONOTONIC,
+		      HRTIMER_MODE_REL);
=20
 	/* Initilialize maintenance timer */
-	hrtimer_init(&di->maintenance_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-	di->maintenance_timer.function =3D
-		ab8500_chargalg_maintenance_timer_expired;
+	hrtimer_setup(&di->maintenance_timer, ab8500_chargalg_maintenance_timer_e=
xpired,
+		      CLOCK_MONOTONIC, HRTIMER_MODE_REL);
=20
 	/* Init work for chargalg */
 	INIT_DEFERRABLE_WORK(&di->chargalg_periodic_work,
--=20
2.39.5

