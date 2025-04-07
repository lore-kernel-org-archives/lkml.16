Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3C12066C4
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 15:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744041477; cv=none; b=LmBDyDAh+mqpZRMWD0lXepYXvSWQmWLeL6eFF1v6jaUycnyKXiiY4oJMBZFCU6Mw25TT9cFvJf/1wUcIQGOSLl/UHZsMCIDwF5tKhL7P7KUJq1P8iyiEnD9AbI1BdTx3/5FO6gmiVqXgZ7o3Rkxc/kZaG8FfE1sEIxfGVswhkb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744041477; c=relaxed/simple;
	bh=HFlqT1mLvmo+UShZEWo/EejFFqRQ7TcsnK9RJNrJVVA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FlTwoDajsGSbgQmhWTD1Sse3gOYlwDWB7kByWy7C1TiDtugTPaDgEgdu1xMvBHasQmJR0g1G8NDqB/2wYH3KVqKME4R0sSQpX0X59rxwtRiGTNiVeRT5SxgaYOmJyezN5uBqcI73+949YzeSNWNz5O/V/hYVbc5xhlxrUzm5Xos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=esJZ1ATU; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=CHJNaFwU; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="esJZ1ATU";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="CHJNaFwU"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744041471;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qsSIweOJOeVPMO/KHuLxj3Vruac4eGemiYIOVUirD2Y=;
	b=esJZ1ATUDLbWNi7l0vsd31MIjY/FGG3YHZ3st2w+DxQfMzMYXN39FOj2MOLQsv/LIRDHZC
	LQYgoAsJg/YDQtqRFNFX+/PfX3B8dkMETqfuvJDo7WjA1WFwR/KFykYWNsQ+F5lRtEnnth
	mGkFgmOThVt824jl/1hvItPeEwxXLheF3xKjx1tZvtXqftma6noBuTvD/1H7ponAipD2yX
	q/hJiAPlYEvxq2kl5h9IuBwm1K2ejUDxZTh/tfEfMJfbwktzC73ZEGdYgE776l5kKJgYv1
	h+2AAsBQFRF/OjL86yma3QcojWT25PMejSpFflIRsDQZY721F3kO897xrp8dcA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744041471;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qsSIweOJOeVPMO/KHuLxj3Vruac4eGemiYIOVUirD2Y=;
	b=CHJNaFwU7431HncEDzvSoEcHXJrsY3We+CwURrsTX9bZNuhdk56vOaqWjSX7uN6p5Bmj+6
	5kkNcVuEDpRW36Cw==
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
Subject: [PATCH v11 09/19] futex: Decrease the waiter count before the unlock operation.
Date: Mon,  7 Apr 2025 17:57:32 +0200
Message-ID: <20250407155742.968816-10-bigeasy@linutronix.de>
In-Reply-To: <20250407155742.968816-1-bigeasy@linutronix.de>
References: <20250407155742.968816-1-bigeasy@linutronix.de>
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
index 6a1d6b14277f4..5e70cb8eb2507 100644
--- a/kernel/futex/core.c
+++ b/kernel/futex/core.c
@@ -537,8 +537,8 @@ void futex_q_lock(struct futex_q *q, struct futex_hash_=
bucket *hb)
 void futex_q_unlock(struct futex_hash_bucket *hb)
 	__releases(&hb->lock)
 {
-	spin_unlock(&hb->lock);
 	futex_hb_waiters_dec(hb);
+	spin_unlock(&hb->lock);
 }
=20
 void __futex_queue(struct futex_q *q, struct futex_hash_bucket *hb,
diff --git a/kernel/futex/requeue.c b/kernel/futex/requeue.c
index 992e3ce005c6f..023c028d2fce3 100644
--- a/kernel/futex/requeue.c
+++ b/kernel/futex/requeue.c
@@ -456,8 +456,8 @@ int futex_requeue(u32 __user *uaddr1, unsigned int flag=
s1,
 			ret =3D futex_get_value_locked(&curval, uaddr1);
=20
 			if (unlikely(ret)) {
-				double_unlock_hb(hb1, hb2);
 				futex_hb_waiters_dec(hb2);
+				double_unlock_hb(hb1, hb2);
=20
 				ret =3D get_user(curval, uaddr1);
 				if (ret)
@@ -542,8 +542,8 @@ int futex_requeue(u32 __user *uaddr1, unsigned int flag=
s1,
 				 * waiter::requeue_state is correct.
 				 */
 			case -EFAULT:
-				double_unlock_hb(hb1, hb2);
 				futex_hb_waiters_dec(hb2);
+				double_unlock_hb(hb1, hb2);
 				ret =3D fault_in_user_writeable(uaddr2);
 				if (!ret)
 					goto retry;
@@ -556,8 +556,8 @@ int futex_requeue(u32 __user *uaddr1, unsigned int flag=
s1,
 				 *   exit to complete.
 				 * - EAGAIN: The user space value changed.
 				 */
-				double_unlock_hb(hb1, hb2);
 				futex_hb_waiters_dec(hb2);
+				double_unlock_hb(hb1, hb2);
 				/*
 				 * Handle the case where the owner is in the middle of
 				 * exiting. Wait for the exit to complete otherwise
@@ -674,8 +674,8 @@ int futex_requeue(u32 __user *uaddr1, unsigned int flag=
s1,
 		put_pi_state(pi_state);
=20
 out_unlock:
-		double_unlock_hb(hb1, hb2);
 		futex_hb_waiters_dec(hb2);
+		double_unlock_hb(hb1, hb2);
 	}
 	wake_up_q(&wake_q);
 	return ret ? ret : task_count;
--=20
2.49.0

