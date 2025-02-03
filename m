Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A9C2066DB
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 13:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738591193; cv=none; b=E15G1jn45/oEFD3+PfJHujOKKRfNA83gj/9MqTw8Mzeqxus3hVn/xlfg2IZIvzThQvUVlrYXy6XrR/XTcDIkwGanOFLfnnBIIAi0PyaHUgi4mibt0NooezRI+jhhzgG6F/XQ4PnyXXpB0Tti/SRNiCk2dWCKIfti2/BZMQEXiJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738591193; c=relaxed/simple;
	bh=1uYS9pNiTULyeIwt9yeX0lUYb6w6XJseygnHhzzqUQE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A3mOcCrmaYnR9dz6Hlu12jb/NgaCwDyGW4Ut9YKvPaePtwyTxfZgl4bQ7lr5OHUZ7TgX0uX2ki6XXK6NXCzdSvhV90vvAg04uIZcWGaNfUQJJ/B/4q1UfCb6B1BXPtz7c3kqA5OWlmJaSnJDLleYyHFcS3ryh4eCp+asWWTFQBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=VPlObGbP; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=wE4mSvr0; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="VPlObGbP";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="wE4mSvr0"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738591187;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J1iTOZ4lQ3H+o3YagXn1wXAwJ9BFbmsamUspj/Lezec=;
	b=VPlObGbPyKbNT5ckC/Dy/dGcpSteFcTZ0NJ5DtQzMyUZy0eGSzPr71MGF/ds14SVu5b36h
	YAGVHg0Ap4I2E0cZTaYRyWsFigl9aC0Jfj5axyO6TRjvjs+V2+DeVGOYFxTTMOw4leexUn
	fQzAL1F44LAFXn696ZNAULTUeeDBugWuFigZlPPS9I1Q3ubLmQ5udqmr6Y3X0sR5ovuWtj
	cstVetwF+oshF6dzMne0jq/djEc6obD2H876FHA3LnX6Z6plWv5igmm1VIeUKooYUpYiSh
	cevLWu3pBT/Wh3wudTv7MkUf2OgHF6LQGgYOXtsZR3BUI7Z1rZ6e4hiOxgkiaA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738591188;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J1iTOZ4lQ3H+o3YagXn1wXAwJ9BFbmsamUspj/Lezec=;
	b=wE4mSvr0IBnKhJdv4DWD07gqIUKvHbo0xkjsMRvWtpP9bTE9JlqNi5Luk8gTnxn/Q2gLs5
	mRGFSB/qLMSrS4CA==
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
Subject: [PATCH v8 11/15] futex: Acquire a hash reference in futex_wait_multiple_setup().
Date: Mon,  3 Feb 2025 14:59:31 +0100
Message-ID: <20250203135935.440018-12-bigeasy@linutronix.de>
In-Reply-To: <20250203135935.440018-1-bigeasy@linutronix.de>
References: <20250203135935.440018-1-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

futex_wait_multiple_setup() changes task_struct::__state to
!TASK_RUNNING and then enqueues on multiple futexes. Every
futex_q_lock() acquires a reference on the global hash which is dropped
later.
If a rehash is in progress then the loop will block on
mm_struct::futex_hash_bucket for the rehash to complete and this will
lose the previously set task_struct::__state.

Acquire a reference on the local hash to avoiding blocking on
mm_struct::futex_hash_bucket.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 kernel/futex/core.c     | 10 ++++++++++
 kernel/futex/futex.h    |  2 ++
 kernel/futex/waitwake.c | 21 +++++++++++++++++++--
 3 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/kernel/futex/core.c b/kernel/futex/core.c
index b0fb2b10a387c..7130019aa9ec6 100644
--- a/kernel/futex/core.c
+++ b/kernel/futex/core.c
@@ -129,6 +129,11 @@ static struct futex_hash_bucket *futex_hash_private(un=
ion futex_key *key,
 	return &fhb[hash & hash_mask];
 }
=20
+struct futex_private_hash *futex_get_private_hash(void)
+{
+	return NULL;
+}
+
 /**
  * futex_hash - Return the hash bucket in the global or local hash
  * @key:	Pointer to the futex key for which the hash is calculated
@@ -152,6 +157,11 @@ struct futex_hash_bucket *futex_hash(union futex_key *=
key)
 	return &futex_queues[hash & (futex_hashsize - 1)];
 }
=20
+bool futex_put_private_hash(struct futex_private_hash *hb_p)
+{
+	return false;
+}
+
 void futex_hash_put(struct futex_hash_bucket *hb)
 {
 }
diff --git a/kernel/futex/futex.h b/kernel/futex/futex.h
index 5b33016648ecd..d6fa6f663d9ad 100644
--- a/kernel/futex/futex.h
+++ b/kernel/futex/futex.h
@@ -205,6 +205,8 @@ futex_setup_timer(ktime_t *time, struct hrtimer_sleeper=
 *timeout,
 extern struct futex_hash_bucket *futex_hash(union futex_key *key);
 extern void futex_hash_get(struct futex_hash_bucket *hb);
 extern void futex_hash_put(struct futex_hash_bucket *hb);
+extern struct futex_private_hash *futex_get_private_hash(void);
+extern bool futex_put_private_hash(struct futex_private_hash *hb_p);
=20
 /**
  * futex_match - Check whether two futex keys are equal
diff --git a/kernel/futex/waitwake.c b/kernel/futex/waitwake.c
index 98409ba9605a8..3d57b47692f57 100644
--- a/kernel/futex/waitwake.c
+++ b/kernel/futex/waitwake.c
@@ -395,7 +395,7 @@ int futex_unqueue_multiple(struct futex_vector *v, int =
count)
 }
=20
 /**
- * futex_wait_multiple_setup - Prepare to wait and enqueue multiple futexes
+ * __futex_wait_multiple_setup - Prepare to wait and enqueue multiple fute=
xes
  * @vs:		The futex list to wait on
  * @count:	The size of the list
  * @woken:	Index of the last woken futex, if any. Used to notify the
@@ -410,7 +410,7 @@ int futex_unqueue_multiple(struct futex_vector *v, int =
count)
  *  -  0 - Success
  *  - <0 - -EFAULT, -EWOULDBLOCK or -EINVAL
  */
-int futex_wait_multiple_setup(struct futex_vector *vs, int count, int *wok=
en)
+static int __futex_wait_multiple_setup(struct futex_vector *vs, int count,=
 int *woken)
 {
 	struct futex_hash_bucket *hb;
 	bool retry =3D false;
@@ -499,6 +499,23 @@ int futex_wait_multiple_setup(struct futex_vector *vs,=
 int count, int *woken)
 	return 0;
 }
=20
+int futex_wait_multiple_setup(struct futex_vector *vs, int count, int *wok=
en)
+{
+	struct futex_private_hash *hb_p;
+	int ret;
+
+	/*
+	 * Assume to have a private futex and acquire a reference on the private
+	 * hash to avoid blocking on mm_struct::futex_hash_bucket during rehash
+	 * after changing the task state.
+	 */
+	hb_p =3D futex_get_private_hash();
+	ret =3D __futex_wait_multiple_setup(vs, count, woken);
+	if (hb_p)
+		futex_put_private_hash(hb_p);
+	return ret;
+}
+
 /**
  * futex_sleep_multiple - Check sleeping conditions and sleep
  * @vs:    List of futexes to wait for
--=20
2.47.2

