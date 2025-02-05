Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B0622AE45
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738751998; cv=none; b=JdjQjw80pZOlXDlEXLvRJHwz1k2ujWp5g+Jk1ceVkcW6zPvihvTGgtvJ9htPYYK5oZuwvPYKhiFZAHn/S8P/ard3FRZTyhjN6MxD0mCMVh/yVAFCoBgOt6uC3cnKiHWonzfxJtbM3kj5bEpr/NqaMMlMLlv+q7suLAXG6p5XNdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738751998; c=relaxed/simple;
	bh=AZj+0U/8giZiNOi+t0HlLCsIw8GiuU1KWCwf+5dHwjw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=X4s3oeD/JN+1IFhRuo9J/EERD9OfACMRjsLJ7yyzBxoU4g5oN3rkBZ/mzVO+hUUU7nK5uyNBTAL47jOYd93O2ddjzGgB0sh1q/MeZZy+/AnSMT2rUva5/N1gdvdTtY9tZD7Xf2ig6gksm00cRmk93NeWVHqxxOuS1Zdi4UMoRTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=J/BIyhYE; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=C7EGpP6v; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="J/BIyhYE";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="C7EGpP6v"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738751992;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hL50mMiiXMGWqicdM5KTVmwvFoZm7X6S13ahHy3wZrI=;
	b=J/BIyhYE+Z+O+GGDjTcqy1W2FDNHDJtdbg4d3DqJjNLgskTeu9FikCKbYRzoruMgVp5sfL
	7+6hC0fciEDAvsny8KnB9hMlQo5YSk3tCTYtj2afSc/bi5SCGsnhZcZevaKaA7euNraW1S
	RbIzhSkdhVRm5b+jSQdorTV6VpHyhWlvkap6b5Ok1XKmyXkx1qXFt72JYxv4/U+TwXOpFm
	DffCRMmCdEyPoiosNl/fAEC1Cp3684EtJ8xn0fSJg5CngLYLSzs+j3ELD43JG5SRUAFtlb
	jgJ6/vgRYK2yNorJYi2kqKElBOUUgEOmpgR9SX57hhSknDOtapbax8Z3PcJeDg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738751992;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hL50mMiiXMGWqicdM5KTVmwvFoZm7X6S13ahHy3wZrI=;
	b=C7EGpP6v69HNgvHfbn5LRnEho/2zZSj+a7KjmDyVseLU1eMr91Ddgun0j6bDaYYtNdpqtX
	l0gSyXn6dPo6DDDw==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Jens Axboe <axboe@kernel.dk>
Subject: [PATCH v2 16/31] io_uring/timeout: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:39:00 +0100
Message-Id: <80ca8d959f2cc67c75f6d61008e3bebfe7fbc30a.1738746821.git.namcao@linutronix.de>
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
Cc: Jens Axboe <axboe@kernel.dk>
---
 io_uring/timeout.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/io_uring/timeout.c b/io_uring/timeout.c
index 48fc8cf70784..c5fb817b1e28 100644
--- a/io_uring/timeout.c
+++ b/io_uring/timeout.c
@@ -407,8 +407,7 @@ static int io_linked_timeout_update(struct io_ring_ctx =
*ctx, __u64 user_data,
 	io =3D req->async_data;
 	if (hrtimer_try_to_cancel(&io->timer) =3D=3D -1)
 		return -EALREADY;
-	hrtimer_init(&io->timer, io_timeout_get_clock(io), mode);
-	io->timer.function =3D io_link_timeout_fn;
+	hrtimer_setup(&io->timer, io_link_timeout_fn, io_timeout_get_clock(io), m=
ode);
 	hrtimer_start(&io->timer, timespec64_to_ktime(*ts), mode);
 	return 0;
 }
@@ -430,8 +429,7 @@ static int io_timeout_update(struct io_ring_ctx *ctx, _=
_u64 user_data,
 	data->ts =3D *ts;
=20
 	list_add_tail(&timeout->list, &ctx->timeout_list);
-	hrtimer_init(&data->timer, io_timeout_get_clock(data), mode);
-	data->timer.function =3D io_timeout_fn;
+	hrtimer_setup(&data->timer, io_timeout_fn, io_timeout_get_clock(data), mo=
de);
 	hrtimer_start(&data->timer, timespec64_to_ktime(data->ts), mode);
 	return 0;
 }
@@ -557,7 +555,6 @@ static int __io_timeout_prep(struct io_kiocb *req,
 		return -EINVAL;
=20
 	data->mode =3D io_translate_timeout_mode(flags);
-	hrtimer_init(&data->timer, io_timeout_get_clock(data), data->mode);
=20
 	if (is_timeout_link) {
 		struct io_submit_link *link =3D &req->ctx->submit_state.link;
@@ -568,6 +565,10 @@ static int __io_timeout_prep(struct io_kiocb *req,
 			return -EINVAL;
 		timeout->head =3D link->last;
 		link->last->flags |=3D REQ_F_ARM_LTIMEOUT;
+		hrtimer_setup(&data->timer, io_link_timeout_fn, io_timeout_get_clock(dat=
a),
+			      data->mode);
+	} else {
+		hrtimer_setup(&data->timer, io_timeout_fn, io_timeout_get_clock(data), d=
ata->mode);
 	}
 	return 0;
 }
@@ -627,7 +628,6 @@ int io_timeout(struct io_kiocb *req, unsigned int issue=
_flags)
 	}
 add:
 	list_add(&timeout->list, entry);
-	data->timer.function =3D io_timeout_fn;
 	hrtimer_start(&data->timer, timespec64_to_ktime(data->ts), data->mode);
 	raw_spin_unlock_irq(&ctx->timeout_lock);
 	return IOU_ISSUE_SKIP_COMPLETE;
@@ -646,7 +646,6 @@ void io_queue_linked_timeout(struct io_kiocb *req)
 	if (timeout->head) {
 		struct io_timeout_data *data =3D req->async_data;
=20
-		data->timer.function =3D io_link_timeout_fn;
 		hrtimer_start(&data->timer, timespec64_to_ktime(data->ts),
 				data->mode);
 		list_add_tail(&timeout->list, &ctx->ltimeout_list);
--=20
2.39.5

