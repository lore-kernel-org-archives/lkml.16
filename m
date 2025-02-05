Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0578E23236D
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752425; cv=none; b=O3qi/Xk14Yaxhkeso3rrGjRpglLy3/qUJssQg+e8Uf9VKYX06SKkxBSfzZYUfev6RMXITZHkA8oPBnvYZtb/rNCFv3cneknhHFOnCI25nF+hypr1H/hFXQOeytnF6AzEhHSATKc2OAoVpqgBedtrR8a/uJf6KzmOrO4IGPtFzp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752425; c=relaxed/simple;
	bh=Lybvc7LO/jeeVpjBAU8joTd/29m68j3g5FVa67y2zXg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Nvbdwm33cWHRb5Rf85KNiE3vCdFrvt+48zqSuzoiFooTNQ2QbiniTGat4fRAGIjWZaz32aYcApiuLi1lShm9v4r5SLPluJ+YwpIpBJthPc9FmCe2WGz65Y4CoKBdpeeo0cSMjL+SUkB4FH0S73yLzAyO/eg3X0h/yusyhEO8awE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=o/QctFBI; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=K/kHWhYh; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="o/QctFBI";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="K/kHWhYh"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752421;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZLkUtUnLETo6ELVPNAVhtdtOwGBRl4rSaF031Rj8MNw=;
	b=o/QctFBImjZwxPkJeYpHxJ1v9yysweDeXLa0Hc52hKPadqgw9r1iNj8/HZz+CtNpW1ZJT5
	1RkqAFC2Y6JhI1YeOeD547/Wi8IPmLkXntv/2RkVJDfKYjgD7xp/LqNUAcFUU85l73RELW
	TY3QpFCE1qV/mYmx5T7aZkWo2FKMYugv/xGrgBic9vtRYEB7HEy4IxO+uNFB+w9qR8nqsz
	DS54lv1ikpCSMLxf5XEEO89tU4FrpA3HQlVwXewLgvI1hEsLX/ufo+n/7M4U28GH2wFLJy
	+uzW81AHR9OlWFRWd3Y00fwUwNzWqug913jk9wLy8gh3q0aQO5WFRohwzNgb9w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752421;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZLkUtUnLETo6ELVPNAVhtdtOwGBRl4rSaF031Rj8MNw=;
	b=K/kHWhYhelQtonGHXyhUrrET7pDiT66362k4J+N54QDVGAse7A/skGgkDCVeTjJMGzdEPo
	pc4tPYxfJz621eAw==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Zack Rusin <zack.rusin@broadcom.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v2 26/45] Input: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:46:14 +0100
Message-Id: <62db561622799dfc8d58682ca41b54e3f1ff6949.1738746904.git.namcao@linutronix.de>
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
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/joystick/walkera0701.c |  3 +--
 drivers/input/keyboard/gpio_keys.c   | 10 ++++------
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/input/joystick/walkera0701.c b/drivers/input/joystick/=
walkera0701.c
index 59eea813f258..15370fb82317 100644
--- a/drivers/input/joystick/walkera0701.c
+++ b/drivers/input/joystick/walkera0701.c
@@ -232,8 +232,7 @@ static void walkera0701_attach(struct parport *pp)
 		goto err_unregister_device;
 	}
=20
-	hrtimer_init(&w->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-	w->timer.function =3D timer_handler;
+	hrtimer_setup(&w->timer, timer_handler, CLOCK_MONOTONIC, HRTIMER_MODE_REL=
);
=20
 	w->input_dev =3D input_allocate_device();
 	if (!w->input_dev) {
diff --git a/drivers/input/keyboard/gpio_keys.c b/drivers/input/keyboard/gp=
io_keys.c
index 5eef66516e37..166cfc67d98b 100644
--- a/drivers/input/keyboard/gpio_keys.c
+++ b/drivers/input/keyboard/gpio_keys.c
@@ -590,9 +590,8 @@ static int gpio_keys_setup_key(struct platform_device *=
pdev,
=20
 		INIT_DELAYED_WORK(&bdata->work, gpio_keys_gpio_work_func);
=20
-		hrtimer_init(&bdata->debounce_timer,
-			     CLOCK_REALTIME, HRTIMER_MODE_REL);
-		bdata->debounce_timer.function =3D gpio_keys_debounce_timer;
+		hrtimer_setup(&bdata->debounce_timer, gpio_keys_debounce_timer, CLOCK_RE=
ALTIME,
+			      HRTIMER_MODE_REL);
=20
 		isr =3D gpio_keys_gpio_isr;
 		irqflags =3D IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING;
@@ -628,9 +627,8 @@ static int gpio_keys_setup_key(struct platform_device *=
pdev,
 		}
=20
 		bdata->release_delay =3D button->debounce_interval;
-		hrtimer_init(&bdata->release_timer,
-			     CLOCK_REALTIME, HRTIMER_MODE_REL_HARD);
-		bdata->release_timer.function =3D gpio_keys_irq_timer;
+		hrtimer_setup(&bdata->release_timer, gpio_keys_irq_timer, CLOCK_REALTIME,
+			      HRTIMER_MODE_REL_HARD);
=20
 		isr =3D gpio_keys_irq_isr;
 		irqflags =3D 0;
--=20
2.39.5

