Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D4F2063E9
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 13:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738591191; cv=none; b=NvuMzonsXKaSlFzB/uON/v2OXRvixHFR4rTp6lcsq1aAHFq0fafTIeSJVHgZ8BZ+hKv9duyFJVujuyCm3VfIxrPiFRtTZq4HOoZtASajCtq4ygWPBqe5QRnPMKBK+iosUp/NfGM93gq3xcn/yy/3Oa11z8jSNqzTdN/tMz/Uk04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738591191; c=relaxed/simple;
	bh=pc05xyIdq1ywOatVW1w3Z8hi+B0vbA81OcYBNiDKpGs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qByX+riXP5OIL5TxmvkjBRe/SbpAHdjAPFtsok/QI69QOGhYJ9VnmfdUEyVxjZ0CkkooyaYn1N1Pyx6uct7NyxYKraaCnEVey6GXQyyfxTLZbQIgz6rQARq5shxfXTHB5guJ80WnCtirbr4ljecf1V/L3JF2piWx5TfTtO9KhrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=t7SFYKht; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=vDO0yJBW; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="t7SFYKht";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="vDO0yJBW"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738591186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ksFDiPENi8cTdcGGbyczRGuxWkcGhFHMgH00kb8pNaA=;
	b=t7SFYKhtX9f/+40BIJGKkCOIeg2U3kJx9Mo44JSkeE/TbLc7dfOMpCFbLqsYkizYny19vW
	OL6gKOXjLEZhK6iO/ecBP6RDB198Px7eRGPe/pRkP8cOy5pLz2tcFmIZr2JoebcIFFnMAe
	Vm5kc7qYxj3cK11m29QxSRs+ehJcxPd5J2UGXIp/KHaALpgcv133FeRsO4iOg8QRH+bfPZ
	3H9JyluaGn6JB11CGQBt/oh6Qi3caeJTVXma5j+OXy0L6ygvuaOsK194F1Rs38jKt0hzpO
	IkKKFPyk1XPb5tAlQeeh4cwDrQRJNk2lKqHg0ADULJX554DVNdmd4rLaryBv7g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738591186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ksFDiPENi8cTdcGGbyczRGuxWkcGhFHMgH00kb8pNaA=;
	b=vDO0yJBWyeTNyWWXWd/ltjMcxPjp1VdHXOAEWIUkGoyQ31QnTICPQvBchnvbJS64JqiDtK
	hVZdUfNWQ3Ssg4Cw==
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
Subject: [PATCH v8 07/15] futex: Decrease the waiter count before the unlock operation.
Date: Mon,  3 Feb 2025 14:59:27 +0100
Message-ID: <20250203135935.440018-8-bigeasy@linutronix.de>
In-Reply-To: <20250203135935.440018-1-bigeasy@linutronix.de>
References: <20250203135935.440018-1-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

To support runtime resizing of the process private hash, it's required
to not use the obtained hash bucket once the reference count has been
dropped. The reference will be dropped after the unlock of the hash
bucket.
The amount of waiters is decremented after the unlock operation. There
is no requirement that this needs to happen after the unlock. The
increment happens before acquiring the lock to signal early that there
will be a waiter. The waiter can avoid blocking on the lock if it is
known that there will be no waiter.
There is no difference in terms of ordering if the decrement happens
before or after the unlock.

Decrease the waiter count before the unlock operation.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 kernel/futex/core.c    | 2 +-
 kernel/futex/requeue.c | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/kernel/futex/core.c b/kernel/futex/core.c
index fdfc3402278a1..6d12614dad5e8 100644
--- a/kernel/futex/core.c
+++ b/kernel/futex/core.c
@@ -558,8 +558,8 @@ struct futex_hash_bucket *futex_q_lock(struct futex_q *=
q)
 void futex_q_unlock(struct futex_hash_bucket *hb)
 	__releases(&hb->lock)
 {
-	spin_unlock(&hb->lock);
 	futex_hb_waiters_dec(hb);
+	spin_unlock(&hb->lock);
 }
=20
 void __futex_queue(struct futex_q *q, struct futex_hash_bucket *hb)
diff --git a/kernel/futex/requeue.c b/kernel/futex/requeue.c
index b47bb764b3520..fb69dcdf74da8 100644
--- a/kernel/futex/requeue.c
+++ b/kernel/futex/requeue.c
@@ -456,8 +456,8 @@ int futex_requeue(u32 __user *uaddr1, unsigned int flag=
s1,
 		ret =3D futex_get_value_locked(&curval, uaddr1);
=20
 		if (unlikely(ret)) {
-			double_unlock_hb(hb1, hb2);
 			futex_hb_waiters_dec(hb2);
+			double_unlock_hb(hb1, hb2);
=20
 			ret =3D get_user(curval, uaddr1);
 			if (ret)
@@ -542,8 +542,8 @@ int futex_requeue(u32 __user *uaddr1, unsigned int flag=
s1,
 		 * waiter::requeue_state is correct.
 		 */
 		case -EFAULT:
-			double_unlock_hb(hb1, hb2);
 			futex_hb_waiters_dec(hb2);
+			double_unlock_hb(hb1, hb2);
 			ret =3D fault_in_user_writeable(uaddr2);
 			if (!ret)
 				goto retry;
@@ -556,8 +556,8 @@ int futex_requeue(u32 __user *uaddr1, unsigned int flag=
s1,
 			 *   exit to complete.
 			 * - EAGAIN: The user space value changed.
 			 */
-			double_unlock_hb(hb1, hb2);
 			futex_hb_waiters_dec(hb2);
+			double_unlock_hb(hb1, hb2);
 			/*
 			 * Handle the case where the owner is in the middle of
 			 * exiting. Wait for the exit to complete otherwise
@@ -674,9 +674,9 @@ int futex_requeue(u32 __user *uaddr1, unsigned int flag=
s1,
 	put_pi_state(pi_state);
=20
 out_unlock:
+	futex_hb_waiters_dec(hb2);
 	double_unlock_hb(hb1, hb2);
 	wake_up_q(&wake_q);
-	futex_hb_waiters_dec(hb2);
 	return ret ? ret : task_count;
 }
=20
--=20
2.47.2

