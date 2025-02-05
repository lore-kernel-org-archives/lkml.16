Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F7AD22DF9E
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738751998; cv=none; b=SJ3jdN2mHdxZ6M3zGmhe0ivvX767tPkUBAhXxZj4yCYOQ6n+kh3eW3B07TRiUmjauxcPzAzWny7pWKRRclsE8tx8bg5nn9ll2N3jZXvxh8TdkMjVmX4sss04nLTGXwskgBsmFgGmzJ4HyVoshmmXuEIdwUh/B44COfb/ZY1wx0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738751998; c=relaxed/simple;
	bh=GGBXk6f48Of3riytdkya0PlY1YMazvmfX9MK1nyV4u0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AIk+X6Z76QLFFyACKOIIwpgt83bwiM2dsU62/zrg6jrukCfyg5qD5lzqotKoLUgMJdR/xm+FHykeNSdLJ86lGITAI878WchLyk/QyJopU1JfnAbdJ+9rSBk2Yu1tCR5hQVfkmN0Ta5h6an3EWAJrp0UEyNqP41PeZ1EDHTDwGN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=4bXgrzJG; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=rkAJO11a; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="4bXgrzJG";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="rkAJO11a"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738751994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vfzgxjYfbEWz4//KHQQPlOhiuQtZIwViWTzsUTh7j6s=;
	b=4bXgrzJGWqZdQt/f1iANLvjzr4I1DSmJ2n3ZmMjvBE0hBX0AIFY2X3GcQaQntIX3WKEkFq
	kTJrreUc3ZTcAYamtKlJSoy4Sj61kv5o9tGa+oKDFxDJalPvso4USV9qNFpdNxpW4oSxZG
	guFUkR2hfrN7ApMKVXqwxEk6DlEZsPh8QlvfBLcmI9ptsfeNXzq2eQ5Iwv4buBZxrOWMYh
	xXF3NiVTvHynLRBU1c+dDKb2Yi84MkqJ7Eq7iE1aClbb/L9LcH8IKv9qedm4G3mbCT8ng6
	jOLfFaO2HXpRNWIZHA3To6Q1zdEiDP4lNvgldJ2//nqNkZa65gkJkf2g5Ey2GQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738751994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vfzgxjYfbEWz4//KHQQPlOhiuQtZIwViWTzsUTh7j6s=;
	b=rkAJO11ap8Y21IPB7VGZudr/SI9zSJeHWaI6zs5BMlJmxuGm8lPc1IdRDl7MoOkUVrCjoS
	pO5GkTtYG9SjbYDw==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH v2 24/31] tracing/osnoise: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:39:08 +0100
Message-Id: <ff8e6e11df5f928b2b97619ac847b4fa045376a1.1738746821.git.namcao@linutronix.de>
In-Reply-To: <cover.1738746821.git.namcao@linutronix.de>
References: <cover.1738746821.git.namcao@linutronix.de>
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

Acked-by: Steven Rostedt (Google) <rostedt@goodmis.org>
Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 kernel/trace/trace_osnoise.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/kernel/trace/trace_osnoise.c b/kernel/trace/trace_osnoise.c
index f3a2722ee4c0..15999532956a 100644
--- a/kernel/trace/trace_osnoise.c
+++ b/kernel/trace/trace_osnoise.c
@@ -1901,8 +1901,7 @@ static int timerlat_main(void *data)
 	tlat->count =3D 0;
 	tlat->tracing_thread =3D false;
=20
-	hrtimer_init(&tlat->timer, CLOCK_MONOTONIC, HRTIMER_MODE_ABS_PINNED_HARD);
-	tlat->timer.function =3D timerlat_irq;
+	hrtimer_setup(&tlat->timer, timerlat_irq, CLOCK_MONOTONIC, HRTIMER_MODE_A=
BS_PINNED_HARD);
 	tlat->kthread =3D current;
 	osn_var->pid =3D current->pid;
 	/*
@@ -2456,8 +2455,7 @@ static int timerlat_fd_open(struct inode *inode, stru=
ct file *file)
 	tlat =3D this_cpu_tmr_var();
 	tlat->count =3D 0;
=20
-	hrtimer_init(&tlat->timer, CLOCK_MONOTONIC, HRTIMER_MODE_ABS_PINNED_HARD);
-	tlat->timer.function =3D timerlat_irq;
+	hrtimer_setup(&tlat->timer, timerlat_irq, CLOCK_MONOTONIC, HRTIMER_MODE_A=
BS_PINNED_HARD);
=20
 	migrate_enable();
 	return 0;
--=20
2.39.5

