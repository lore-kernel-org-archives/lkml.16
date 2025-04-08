Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F123266595
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 10:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744108742; cv=none; b=bGH05FgPZLx2RotPrn3y1BLkwqcvRybe4A0f2+mSvV5wszVngVVn2hTTvH0GM1agDG7d/taCyFRzYvZWz4/fGYhttDZthCuMRxfrm+EnNi8m+nclEDKgQLx1dG/TB8GkoDf3q6qrJ3d256+3xmn+VGci95P48veC0XE7NREEgZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744108742; c=relaxed/simple;
	bh=UtJcel0JU1hta3JXEWACt1YiMTzGWnMckV/cVy4L82Q=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=HiqBQkXrOYE6qmtaAQdgPDzxMWijMQSny/S9+gKsJOynv9EpO1XUQebPKdf1AEZ/OlquxEYhNckkcmueYsutMgvX4u/lMeR76450qdreVGdst4/35rTt1yx0OJsOOl0HpxI9EGFr3y0TIfgSfOCwEpQ5xzJLcog8KUVy01l6c+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=MWRtkm1C; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Tr+2xp50; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="MWRtkm1C";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Tr+2xp50"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744108738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KkK9CyClgQ6E9W2Xdc3k95qWykv82a5QP+EJFRJHIqM=;
	b=MWRtkm1C904AxbbcUyf3+3kBHSCtHHdCPxDsVW50zirYdFg1Yd5q5yh48MTAo6y3SozBeu
	MiYYmgHyin1ZsD0NuUgN6xM4PRxW5zMi5SpEgvwSxu5EageK+BEfxOZlNQXecuzZLmV670
	exQ/Ppf/H1q4/zIvukmV9jB56kCmYT+gC0Oyuoorm6on+jH8IzKt1Fs8d7vE0vaVp1Us1q
	kbo+QKFQ+rlgZ972cuN8i8pmb1dHDBiTi/p8j0fffWZk+2rgT91uO5tP03MtRB9EinunDU
	XpjMZ+vbvGp3kLG/eteMdHLrtQJ5W6vMYKaXA21PE9UbpuDlQOyBckk0tABErw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744108738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KkK9CyClgQ6E9W2Xdc3k95qWykv82a5QP+EJFRJHIqM=;
	b=Tr+2xp50I9tV7Vv+SLcA8dtFGjkZ0okWG6E1DrxR6vb2pOlkgsCEcjdeR1dRuleS4trQz6
	1HFK+V7ZlA0ny6CQ==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hrtimer: Use ACCESS_PRIVATE() for hrtimer::function
Date: Tue,  8 Apr 2025 12:38:54 +0200
Message-Id: <20250408103854.1851093-1-namcao@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The "function" field of struct hrtimer has been changed to private, but
some hrtimer code has not been converted to use ACCESS_PRIVATE().

Convert the rest to use ACCESS_PRIVATE().

Fixes: 04257da0c99c ("hrtimers: Make callback function pointer private")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202504071931.vOVl13tt-lkp@int=
el.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202504072155.5UAZjYGU-lkp@int=
el.com/
Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 include/linux/hrtimer.h | 2 +-
 kernel/time/hrtimer.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/hrtimer.h b/include/linux/hrtimer.h
index 1adcba3ddd76..1ef867bb8c44 100644
--- a/include/linux/hrtimer.h
+++ b/include/linux/hrtimer.h
@@ -345,7 +345,7 @@ static inline void hrtimer_update_function(struct hrtim=
er *timer,
 	if (WARN_ON_ONCE(!function))
 		return;
 #endif
-	timer->function =3D function;
+	ACCESS_PRIVATE(timer, function) =3D function;
 }
=20
 /* Forward a hrtimer so it expires after now: */
diff --git a/kernel/time/hrtimer.c b/kernel/time/hrtimer.c
index 517ee2590a29..30899a8cc52c 100644
--- a/kernel/time/hrtimer.c
+++ b/kernel/time/hrtimer.c
@@ -366,7 +366,7 @@ static const struct debug_obj_descr hrtimer_debug_descr;
=20
 static void *hrtimer_debug_hint(void *addr)
 {
-	return ((struct hrtimer *) addr)->function;
+	return ACCESS_PRIVATE((struct hrtimer *)addr, function);
 }
=20
 /*
--=20
2.39.5

