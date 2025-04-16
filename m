Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978D5211A1D
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 16:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744820971; cv=none; b=tVGYwjBGE0/XDICvLTaw8/gmuqSbtg/J+/p7QGMltV+RlBAM2OZ8+2Ia/rbIquzQXO/Q2aBA5ywtQn1+rxe6lnzW2KRBtIarLIPElBfV9dr97mN+e5ItDX/CCn3lUWOJwE5/se0fjSHxl8lWU24lQJ2/+9FuOLWHBLMPC/zy554=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744820971; c=relaxed/simple;
	bh=Qn/57B9VzWB0JKYD2iE64ugEwzZtE06e200axAfuk/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=heqRTy7dFw5CQ+TjDm2ZxhVRF1M4wMjsNEgdWV48F8lIK9xKsTwZXv5tHKw9nX/4SfLG3qS3/+HmjIbqdStZf/J4fiMScEd35eVWAVEq2cBWz56ayA99pXeJRvIAiZfByzKGSTV8/K6GJzkEuEeWhyBnA2Ddys9dxrgbSDJSEkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=U9712h/I; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=GZ1cIBCE; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="U9712h/I";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="GZ1cIBCE"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744820967;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+7I78ss84vjJrdkUeLd869WN5gJwqNqGsAX7SSgTHw8=;
	b=U9712h/IdrrqPwQBFDjDVZBK2RJooIUpw0Sfc61EoSzA03M5yxEAeLXywaqjRNx9mtldGt
	JAcNslLKZ+t8yBu1OFy7zOXv+UX2Q5303m2HdQ4YHr9hUhBk8h6DzURqF9G38NVrY4KZH9
	973S0zqZKRvO3TBbD5+ONZfpq5mGJYl71hT3dKHRSMaQamU1u73uyU0RnUMAu/K55eMB1f
	y1eWZzBgkVKUIJ/xh+3iwAsu86mUy64z1NYR5J2DZYsqvYJhi+9GEeuSKjlzXTx2r8cWQ5
	WJe+FXzQ5W6w8mtbJXfHNA5j4474T0jAkrgrOLjwx4kBINpmjBL9b7zb8qjOWQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744820967;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+7I78ss84vjJrdkUeLd869WN5gJwqNqGsAX7SSgTHw8=;
	b=GZ1cIBCElpr0EQjLhcan7BCrlPHYHWN/xBBlHonMGKlc5mbFDpBofsxG/Z8DrD2mMM0iLW
	B40tdNioRgx8MDDg==
To: linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <longman@redhat.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH v12 04/21] futex: Pull futex_hash() out of futex_q_lock()
Date: Wed, 16 Apr 2025 18:29:04 +0200
Message-ID: <20250416162921.513656-5-bigeasy@linutronix.de>
In-Reply-To: <20250416162921.513656-1-bigeasy@linutronix.de>
References: <20250416162921.513656-1-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Peter Zijlstra <peterz@infradead.org>

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 kernel/futex/core.c     | 7 +------
 kernel/futex/futex.h    | 2 +-
 kernel/futex/pi.c       | 3 ++-
 kernel/futex/waitwake.c | 6 ++++--
 4 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/kernel/futex/core.c b/kernel/futex/core.c
index cca15859a50be..7adc914878933 100644
--- a/kernel/futex/core.c
+++ b/kernel/futex/core.c
@@ -502,13 +502,9 @@ void __futex_unqueue(struct futex_q *q)
 }
=20
 /* The key must be already stored in q->key. */
-struct futex_hash_bucket *futex_q_lock(struct futex_q *q)
+void futex_q_lock(struct futex_q *q, struct futex_hash_bucket *hb)
 	__acquires(&hb->lock)
 {
-	struct futex_hash_bucket *hb;
-
-	hb =3D futex_hash(&q->key);
-
 	/*
 	 * Increment the counter before taking the lock so that
 	 * a potential waker won't miss a to-be-slept task that is
@@ -522,7 +518,6 @@ struct futex_hash_bucket *futex_q_lock(struct futex_q *=
q)
 	q->lock_ptr =3D &hb->lock;
=20
 	spin_lock(&hb->lock);
-	return hb;
 }
=20
 void futex_q_unlock(struct futex_hash_bucket *hb)
diff --git a/kernel/futex/futex.h b/kernel/futex/futex.h
index 16aafd0113442..a219903e52084 100644
--- a/kernel/futex/futex.h
+++ b/kernel/futex/futex.h
@@ -354,7 +354,7 @@ static inline int futex_hb_waiters_pending(struct futex=
_hash_bucket *hb)
 #endif
 }
=20
-extern struct futex_hash_bucket *futex_q_lock(struct futex_q *q);
+extern void futex_q_lock(struct futex_q *q, struct futex_hash_bucket *hb);
 extern void futex_q_unlock(struct futex_hash_bucket *hb);
=20
=20
diff --git a/kernel/futex/pi.c b/kernel/futex/pi.c
index 7a941845f7eee..3bf942e9400ac 100644
--- a/kernel/futex/pi.c
+++ b/kernel/futex/pi.c
@@ -939,7 +939,8 @@ int futex_lock_pi(u32 __user *uaddr, unsigned int flags=
, ktime_t *time, int tryl
 		goto out;
=20
 retry_private:
-	hb =3D futex_q_lock(&q);
+	hb =3D futex_hash(&q.key);
+	futex_q_lock(&q, hb);
=20
 	ret =3D futex_lock_pi_atomic(uaddr, hb, &q.key, &q.pi_state, current,
 				   &exiting, 0);
diff --git a/kernel/futex/waitwake.c b/kernel/futex/waitwake.c
index 6cf10701294b4..1108f373fd315 100644
--- a/kernel/futex/waitwake.c
+++ b/kernel/futex/waitwake.c
@@ -441,7 +441,8 @@ int futex_wait_multiple_setup(struct futex_vector *vs, =
int count, int *woken)
 		struct futex_q *q =3D &vs[i].q;
 		u32 val =3D vs[i].w.val;
=20
-		hb =3D futex_q_lock(q);
+		hb =3D futex_hash(&q->key);
+		futex_q_lock(q, hb);
 		ret =3D futex_get_value_locked(&uval, uaddr);
=20
 		if (!ret && uval =3D=3D val) {
@@ -611,7 +612,8 @@ int futex_wait_setup(u32 __user *uaddr, u32 val, unsign=
ed int flags,
 		return ret;
=20
 retry_private:
-	hb =3D futex_q_lock(q);
+	hb =3D futex_hash(&q->key);
+	futex_q_lock(q, hb);
=20
 	ret =3D futex_get_value_locked(&uval, uaddr);
=20
--=20
2.49.0

