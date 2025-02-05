Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE22022CBC6
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752419; cv=none; b=qDwZH66+1nTxYfDuSv1JKNcB5bOeElO3z20tobN14dBab1DkIhtxzUjPLjPq1Frx0KFVL3nXA9skZsoWjJT8nyx11UTDpkKMRoVQREQFgnPd3Xzef/VMmpffvvmtrAcRNOWsYe2rjLRSfOS7gLghj9p4RNfWlANS4wzkWRMa4dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752419; c=relaxed/simple;
	bh=Gz7FyKLYBhEbY6Bm+fcua7MxGEsX4WEg7YqKiHPnk98=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=S4o4lxYL3K+JcLdXIx8zAGOJb+O66fUI6bv5dDjItRVEBdeGqm/lwlOpMGQbDRA0LLwJyLLSKIzc0GNI5RgqsdEf0YzE0RDHXachV00dInsao/yic4DrupKgo96PxAZjBYBmGB2Jrpfo7jL0LHyOaSQ2M/J7lrAXLDXP0BGpaxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=AoccFSk9; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=kIPLhBEz; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="AoccFSk9";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="kIPLhBEz"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752415;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0BDcLu8h+UPyhwanniDJTRX1mpZRlCtCxxfcTZmc8fY=;
	b=AoccFSk9fk2xDe8IoU42wENOXbTuCtesJKPdcSTm4BMQzpO/iwVqBHppEuNhJJrhQFIww7
	V7H///DxiuiaUwR4nOsv9cUrjXCi9K05wdkyt5uf2WAssh3InU5OQVYIcRw8tkmt1clkOo
	lC17y5yqdFYIBf7T84X+jg/WzZuoX5MqvYs+G/leOXB00BhRCU1n884nixHQQwUqL3ahpu
	hlw2P+qtPwh5Qv9vwi2MUwuawvySxhUVwWmr0uiZwPG1l+v+QqyjjsG/LJ9wbeNq9PDNu+
	2MnMugqJe6qy9fn8RZAHPI9/QBkugUD/9Ss1ctMt7a9s9zYMAEHQZgEakVRjAA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752415;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0BDcLu8h+UPyhwanniDJTRX1mpZRlCtCxxfcTZmc8fY=;
	b=kIPLhBEzCDui5hb0buAQwkqCvhQ+cfzPgS4FZjxjMSbCwTTKos+HrREtqMXhfiQq2BHQHI
	uGxY7Ye4y+vvqcCA==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Zack Rusin <zack.rusin@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 08/45] serial: 8250: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:45:56 +0100
Message-Id: <991926d130cc272df30d226760d5d74187991669.1738746904.git.namcao@linutronix.de>
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

Acked-by: Zack Rusin <zack.rusin@broadcom.com>
Signed-off-by: Nam Cao <namcao@linutronix.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/tty/serial/8250/8250_bcm7271.c |  3 +--
 drivers/tty/serial/8250/8250_port.c    | 10 ++++------
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_bcm7271.c b/drivers/tty/serial/82=
50/8250_bcm7271.c
index d0b18358859e..742004d63c6f 100644
--- a/drivers/tty/serial/8250/8250_bcm7271.c
+++ b/drivers/tty/serial/8250/8250_bcm7271.c
@@ -1056,8 +1056,7 @@ static int brcmuart_probe(struct platform_device *pde=
v)
 	}
=20
 	/* setup HR timer */
-	hrtimer_init(&priv->hrt, CLOCK_MONOTONIC, HRTIMER_MODE_ABS);
-	priv->hrt.function =3D brcmuart_hrtimer_func;
+	hrtimer_setup(&priv->hrt, brcmuart_hrtimer_func, CLOCK_MONOTONIC, HRTIMER=
_MODE_ABS);
=20
 	up.port.shutdown =3D brcmuart_shutdown;
 	up.port.startup =3D brcmuart_startup;
diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/=
8250_port.c
index d7976a21cca9..253bf5c756de 100644
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -566,12 +566,10 @@ static int serial8250_em485_init(struct uart_8250_por=
t *p)
 	if (!p->em485)
 		return -ENOMEM;
=20
-	hrtimer_init(&p->em485->stop_tx_timer, CLOCK_MONOTONIC,
-		     HRTIMER_MODE_REL);
-	hrtimer_init(&p->em485->start_tx_timer, CLOCK_MONOTONIC,
-		     HRTIMER_MODE_REL);
-	p->em485->stop_tx_timer.function =3D &serial8250_em485_handle_stop_tx;
-	p->em485->start_tx_timer.function =3D &serial8250_em485_handle_start_tx;
+	hrtimer_setup(&p->em485->stop_tx_timer, &serial8250_em485_handle_stop_tx,=
 CLOCK_MONOTONIC,
+		      HRTIMER_MODE_REL);
+	hrtimer_setup(&p->em485->start_tx_timer, &serial8250_em485_handle_start_t=
x, CLOCK_MONOTONIC,
+		      HRTIMER_MODE_REL);
 	p->em485->port =3D p;
 	p->em485->active_timer =3D NULL;
 	p->em485->tx_stopped =3D true;
--=20
2.39.5

