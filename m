Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E423822E3FF
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752000; cv=none; b=rgC2vVkMKhDxbAZYjPftkEnqGfoG9FvThxextP/Ny5ctfsBdI7RXeSYxK6lqu/FdRqnc1l8nfqg0hvxD5DNl4ZNXLcfasawIHJXxktO4euaSjAq2ulfTj5w9PESXmGGOxbTKabhYUXlM86RPRCi35NcPwVZJoHpbX/colHycb5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752000; c=relaxed/simple;
	bh=CD7JvKo/feB52a2k7onyk2ZXeiDetB/mc/twv3Gful4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SkBj5lK/WPSdEa3z0lrpzkGdkyxvwYwPmpV5sRqlQOl8Ysz6XytmYKZ/6Wk5FQlYsR4xNjtYpIlT+KzH2Cme6efD/egjhngHtr273vYJa6YkOb/B+sOPIZUnIXpfkiVfopISywc0pjxFvWDXUliGjMMZYOFt0TvBMq7bYzHf9/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Cpd85kTn; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=vNo89CPa; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Cpd85kTn";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="vNo89CPa"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738751996;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RNi7JDw+w/JQ3w0yvP3N7fB6jIxc2MjvZRk3TGcbngQ=;
	b=Cpd85kTnp1kCHBi27nxXAiMoXt5qnwclR4ccrDA73hLMS1BTLfTkd0RxuMzgZDKMMYdoBM
	0FgABll7/Nhc/TYygXgTKymSghoBbWHe7eQOpmsxx0l2dFMpMy6/g8qUTcRXr9MR4s765Q
	X/Qzpc1hMgz83XRzRaqCpR6Wumx1YIJaMBLb7Rn9BgdZOFhhuBxJxyLywvOaFzKBawr6Zx
	haMzm3+0noJeQyLVjW+oM/Se3lAkH1oXa92b7dxjsbJrmftE54KhZAh3nxhbqhV+druViA
	jr6O051RSJL3tqse82aTZ948aSxwL+n/cst+8itCvAOX3Nit4hFI5Qa9+/sxQg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738751996;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RNi7JDw+w/JQ3w0yvP3N7fB6jIxc2MjvZRk3TGcbngQ=;
	b=vNo89CPagS07Sf3WO7/kYI4AwXEarpbCOmx34Rf1isREE5I1L+bXeMPqCI9BjFJ6qsHzwz
	kjt5iJvmFhaE67Cw==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH v2 30/31] null_blk: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:39:14 +0100
Message-Id: <076cd30acb4b2d6b699f3c80463a8983530d4f06.1738746821.git.namcao@linutronix.de>
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

Signed-off-by: Nam Cao <namcao@linutronix.de>
Cc: Jens Axboe <axboe@kernel.dk>
---
 drivers/block/null_blk/main.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/block/null_blk/main.c b/drivers/block/null_blk/main.c
index d94ef37480bd..16457330c1bc 100644
--- a/drivers/block/null_blk/main.c
+++ b/drivers/block/null_blk/main.c
@@ -1426,8 +1426,7 @@ static void nullb_setup_bwtimer(struct nullb *nullb)
 {
 	ktime_t timer_interval =3D ktime_set(0, TIMER_INTERVAL);
=20
-	hrtimer_init(&nullb->bw_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-	nullb->bw_timer.function =3D nullb_bwtimer_fn;
+	hrtimer_setup(&nullb->bw_timer, nullb_bwtimer_fn, CLOCK_MONOTONIC, HRTIME=
R_MODE_REL);
 	atomic_long_set(&nullb->cur_bytes, mb_per_tick(nullb->dev->mbps));
 	hrtimer_start(&nullb->bw_timer, timer_interval, HRTIMER_MODE_REL);
 }
@@ -1604,8 +1603,8 @@ static blk_status_t null_queue_rq(struct blk_mq_hw_ct=
x *hctx,
 	might_sleep_if(hctx->flags & BLK_MQ_F_BLOCKING);
=20
 	if (!is_poll && nq->dev->irqmode =3D=3D NULL_IRQ_TIMER) {
-		hrtimer_init(&cmd->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-		cmd->timer.function =3D null_cmd_timer_expired;
+		hrtimer_setup(&cmd->timer, null_cmd_timer_expired, CLOCK_MONOTONIC,
+			      HRTIMER_MODE_REL);
 	}
 	cmd->error =3D BLK_STS_OK;
 	cmd->nq =3D nq;
--=20
2.39.5

