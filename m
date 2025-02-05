Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD3122D4FA
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738751997; cv=none; b=YN8/oZM2Lm71VXAl5q6igaFd4DL0APf9+NRDuYcCgqq2Rp5TbUhOesxqFp9TRDCQuMtsE66a9FrlYiqfhD8DIz9hxMo1OcAEdUSBnRKZJckCvqXrZee/h87nTnRjnVhEPu2SBdH4pCOLo5LIul2Hs0qIjPYaIm3oPlWo3+t+NAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738751997; c=relaxed/simple;
	bh=CvoAJ16kV0lvWMkQs+qHm8R9UjaR8Zh9Owp9/4UQQDU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=G0GOssAUnCv1Ru3HKtJuNt26r3+3NZT70GkQ32PsjbiW93cMqD5EUThE9994eTpfLbCJe/zDuvErmjy1bFphKa7NBjZhQ8/6G+zaEGPgv5jSle0s76Frt2hqL7uwgFyIXaccrDhyrYMaelP+bXGmr23ZoLN5Xppj/HVcxvCly4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=YYzzH9P/; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=H/d5y7gg; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="YYzzH9P/";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="H/d5y7gg"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738751992;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3Erq6ZPL0l/t9gxwTNufEWCUeKPTMeHf6c8zI/WqGgw=;
	b=YYzzH9P//Y61Yg0K0dp5DdORjfpG3l07W7Sa7tqvcb6XFXARZJwiPUmMVXx+99Lm6/vOyd
	WBNN0x8rsEndbkZZrQUV9Y277nFdEwIDVK8yxuBbi0BSnW2hsWXypK1yNcGP9UeyYHvN2I
	/ZZK7Hgo2un8TRi42T8lxHh0CeTPw9Sa6K0OL3D3AIYpvgrJrQK9VFVT7cLpIRDA9JONyg
	sp5xnkrdhXgNyeqoVuxubBJpwrIYuT3Y4qZEa5UWJOg5I64oItpy3hnQRlnn3iEJGN4iIH
	oYLVVyLpxLXGp88e60zSFhnASxQ/BKVpBOPfXtYHTmvYOrLh68aUBrO6dip+DQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738751992;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3Erq6ZPL0l/t9gxwTNufEWCUeKPTMeHf6c8zI/WqGgw=;
	b=H/d5y7ggCePsW+rqe/PxzCeQT56CVBCLxB276qoUcYAN/Q4q44tmtzNc7g3RF7/xB/31rZ
	hFbEPDozJ3tdzzAw==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Christian Brauner <brauner@kernel.org>
Subject: [PATCH v2 19/31] timerfd: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:39:03 +0100
Message-Id: <2d1f26c2c2f3ad15f1ca1a09ecb9d760cafef4a6.1738746821.git.namcao@linutronix.de>
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

Signed-off-by: Nam Cao <namcao@linutronix.de>
Cc: Christian Brauner <brauner@kernel.org>
---
 fs/timerfd.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/timerfd.c b/fs/timerfd.c
index 9f7eb451a60f..cee007e0d978 100644
--- a/fs/timerfd.c
+++ b/fs/timerfd.c
@@ -205,9 +205,8 @@ static int timerfd_setup(struct timerfd_ctx *ctx, int f=
lags,
 			   ALARM_REALTIME : ALARM_BOOTTIME,
 			   timerfd_alarmproc);
 	} else {
-		hrtimer_init(&ctx->t.tmr, clockid, htmode);
+		hrtimer_setup(&ctx->t.tmr, timerfd_tmrproc, clockid, htmode);
 		hrtimer_set_expires(&ctx->t.tmr, texp);
-		ctx->t.tmr.function =3D timerfd_tmrproc;
 	}
=20
 	if (texp !=3D 0) {
@@ -429,7 +428,7 @@ SYSCALL_DEFINE2(timerfd_create, int, clockid, int, flag=
s)
 			   ALARM_REALTIME : ALARM_BOOTTIME,
 			   timerfd_alarmproc);
 	else
-		hrtimer_init(&ctx->t.tmr, clockid, HRTIMER_MODE_ABS);
+		hrtimer_setup(&ctx->t.tmr, timerfd_tmrproc, clockid, HRTIMER_MODE_ABS);
=20
 	ctx->moffs =3D ktime_mono_to_real(0);
=20
--=20
2.39.5

