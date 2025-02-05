Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59BF22CBE0
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752420; cv=none; b=tsxwiiY2fYpxpLF4bI6P82e20Vfln5gLm/ZkeUAOKLac19Ta8SyeAC+hGhxCNvvTL9+ydOl0gQJIYkLWN4AMMo8Rbj+rr5JejGi+edTC3q1WsdrgydbbSmOsUwVsIXlz4PoRNrqvn/60K/cTTVHGXszRcNvSYBG3OCa+nKrIckk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752420; c=relaxed/simple;
	bh=/FMHj0S/buempIOXnQve8ss0tqAVXn+brCtqINFTVTc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pO1Lw9O0Q6QVFF0oRSX24DYKzF28Gv/11jcYRcKe4fHPVNUgJKCB3vhkcKrqfVc+CwF6cTEnZIInnOQgH4NyAkRVSOHMYPZZoW++6qlzV+sAXbvlK3CQU9lIdcS1qpbWwrV3tHO1Z9+vHZKmLtYrqztqQ7xCthpZDwF+uQWYmyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=MegklClc; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=3H9I5KlL; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="MegklClc";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3H9I5KlL"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752415;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mToA3wuzFvp+0xfyhnCc9PQrX3ZEdj4Q6dcAc7yZqPQ=;
	b=MegklClcFUCn22pd31FqL+KZldHZERk3sRsCZsdOjR0UCREfxz9EYwkC34qSOzhgMYswCE
	eFDqoanpmhGIt4osyRgkbQpVCjGp5agid0uC4NM45ii6OfEdJFZUIziyQTIVtPFC30mOSr
	cJCqjDf5qRyx58G1QFF2wS8wbGilXDi7itXdkaupjF4+ypxYungz7E7jXvnIY51mcWWw28
	jiigo/qH3joXZZJUnEuJcmPwPlW6B9maHZLCatTzg4iP/mx9Jlqz5hbA4xlwMqfEWZDNah
	m0sss1fsKU7b3zGGtPSLUHs+tmQgu0/jM/O9h67auCzL0i8j7V51onOh36vGxA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752415;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mToA3wuzFvp+0xfyhnCc9PQrX3ZEdj4Q6dcAc7yZqPQ=;
	b=3H9I5KlLct5vHxc4kIgMiDX6IGguKYCc2TF1SWnp8YTOc1i87rSTodJXb7kghuUn7q46Lx
	e4YYxwHM65YGJlBg==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Zack Rusin <zack.rusin@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 10/45] serial: imx: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:45:58 +0100
Message-Id: <ad27070bc67c13f8a9acbd5cbf4cbae72797e3e1.1738746904.git.namcao@linutronix.de>
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
 drivers/tty/serial/imx.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/imx.c b/drivers/tty/serial/imx.c
index 9c59ec128bb4..9a1afe409b98 100644
--- a/drivers/tty/serial/imx.c
+++ b/drivers/tty/serial/imx.c
@@ -2582,10 +2582,10 @@ static int imx_uart_probe(struct platform_device *p=
dev)
 		imx_uart_writel(sport, ucr3, UCR3);
 	}
=20
-	hrtimer_init(&sport->trigger_start_tx, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-	hrtimer_init(&sport->trigger_stop_tx, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-	sport->trigger_start_tx.function =3D imx_trigger_start_tx;
-	sport->trigger_stop_tx.function =3D imx_trigger_stop_tx;
+	hrtimer_setup(&sport->trigger_start_tx, imx_trigger_start_tx, CLOCK_MONOT=
ONIC,
+		      HRTIMER_MODE_REL);
+	hrtimer_setup(&sport->trigger_stop_tx, imx_trigger_stop_tx, CLOCK_MONOTON=
IC,
+		      HRTIMER_MODE_REL);
=20
 	/*
 	 * Allocate the IRQ(s) i.MX1 has three interrupts whereas later
--=20
2.39.5

