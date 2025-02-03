Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB652066ED
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 13:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738591194; cv=none; b=plhdqo3InfZcm7gRKoW3nAL2xet/sjO6NzJJ4LzAXNS/Von3ODjFwUdIZ+GEABRM5lyyemdch2ceLbp9Ol99PqH8ZtdXn1FvisZEiKpQ1d6EfZyOgrRIbVjsePCIcrGgOatS+sJn1TlPVEzzHniumoOCRwfrQIgWG/DoEuw8Qv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738591194; c=relaxed/simple;
	bh=At0iobiar2kYsDUJScEyR9TMwWbMFo3Vzl5kX1JCPYY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jx3yFEuh9i4dWciZH7Zm2jTK329MwyoOQd50in0TzP5/P8bcfy9OcSYSxLe/bFGsiLDU/e9AnI+/LHF39wvQvMvirav+McHJKwbdxZSyB+NXQah/Z0l8L8DyAQlTBfRWOW69a3aLSsmyYbvbRRIyfvo2vnxOCcgh+zy183i0WgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=1lJSq7mX; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=/wzqmem8; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="1lJSq7mX";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="/wzqmem8"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738591188;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fa74DZfXPqAvHSMVYpF3I4XvhkatGI0nWl7rzvRsR1w=;
	b=1lJSq7mXVlT5TEdN0+T0PW8YHc+RCaAALIuYM/Qdk5Of9Bzg6B6SvCpRdbbPRaHLrMdKOS
	UjXYtKF1yv9H1XoYakHenG8KGUmSTFbnG2eBcs+Bm06CBSY5hJ0WTfcHXwSQqb/5oc3yri
	bo6g4EStNvAfMRce77e/pOz7Yv8vlF5YVcoHR3TUGfJhbS5UzrmZTlgRlEKxIivhJenFeT
	orLWGEE89EQJvIsQVdde1YG9TiYbXape9TdA/EZHE+FbxsoY/vl0ToYZgtmq8JCkvgvj5d
	794jXCVYVjEpiOtZNkoJZLdGfTigmIUGP13s0+SMILxcw0cjXBKo4spiJ2ESbg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738591188;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fa74DZfXPqAvHSMVYpF3I4XvhkatGI0nWl7rzvRsR1w=;
	b=/wzqmem8sQH6iVu6jPrN7houDx6dfAVXdFrOHLDViLgzJV2ZmnPiqF3GouE/g0I7hOhvpA
	yGjUh97/Cxl8WuCA==
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
Subject: [PATCH v8 13/15] futex: Resize local futex hash table based on number of threads.
Date: Mon,  3 Feb 2025 14:59:33 +0100
Message-ID: <20250203135935.440018-14-bigeasy@linutronix.de>
In-Reply-To: <20250203135935.440018-1-bigeasy@linutronix.de>
References: <20250203135935.440018-1-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Automatically size the local hash based on the number of threads. The
logic tries to allocate between 16 and futex_hashsize (the default for
the system wide hash bucket) and uses 4 * number-of-threads.
On CONFIG_BASE_SMALL configs the suggested size is always 2.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 include/linux/futex.h | 12 ------------
 kernel/fork.c         |  4 +---
 kernel/futex/core.c   | 34 +++++++++++++++++++++++++++++++---
 3 files changed, 32 insertions(+), 18 deletions(-)

diff --git a/include/linux/futex.h b/include/linux/futex.h
index bfb38764bac7a..6469aeb76a150 100644
--- a/include/linux/futex.h
+++ b/include/linux/futex.h
@@ -87,13 +87,6 @@ static inline void futex_mm_init(struct mm_struct *mm)
 	mutex_init(&mm->futex_hash_lock);
 }
=20
-static inline bool futex_hash_requires_allocation(void)
-{
-	if (current->mm->futex_phash)
-		return false;
-	return true;
-}
-
 #else
 static inline void futex_init_task(struct task_struct *tsk) { }
 static inline void futex_exit_recursive(struct task_struct *tsk) { }
@@ -116,11 +109,6 @@ static inline int futex_hash_allocate_default(void)
 static inline void futex_hash_free(struct mm_struct *mm) { }
 static inline void futex_mm_init(struct mm_struct *mm) { }
=20
-static inline bool futex_hash_requires_allocation(void)
-{
-	return false;
-}
-
 #endif
=20
 #endif
diff --git a/kernel/fork.c b/kernel/fork.c
index 824cc55d32ece..5e15e5b24f289 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -2142,9 +2142,7 @@ static bool need_futex_hash_allocate_default(u64 clon=
e_flags)
 {
 	if ((clone_flags & (CLONE_THREAD | CLONE_VM)) !=3D (CLONE_THREAD | CLONE_=
VM))
 		return false;
-	if (!thread_group_empty(current))
-		return false;
-	return futex_hash_requires_allocation();
+	return true;
 }
=20
 /*
diff --git a/kernel/futex/core.c b/kernel/futex/core.c
index e1bf43f7eb277..9a12dccb1c995 100644
--- a/kernel/futex/core.c
+++ b/kernel/futex/core.c
@@ -1411,8 +1411,8 @@ static int futex_hash_allocate(unsigned int hash_slot=
s)
 		hash_slots =3D 16;
 	if (hash_slots < 2)
 		hash_slots =3D 2;
-	if (hash_slots > 131072)
-		hash_slots =3D 131072;
+	if (hash_slots > futex_hashsize)
+		hash_slots =3D futex_hashsize;
 	if (!is_power_of_2(hash_slots))
 		hash_slots =3D rounddown_pow_of_two(hash_slots);
=20
@@ -1454,7 +1454,35 @@ static int futex_hash_allocate(unsigned int hash_slo=
ts)
=20
 int futex_hash_allocate_default(void)
 {
-	return futex_hash_allocate(0);
+	unsigned int threads, buckets, current_buckets =3D 0;
+	struct futex_private_hash *hb_p;
+
+	if (!current->mm)
+		return 0;
+
+	scoped_guard(rcu) {
+		threads =3D get_nr_threads(current);
+		hb_p =3D rcu_dereference(current->mm->futex_phash);
+		if (hb_p)
+			current_buckets =3D hb_p->hash_mask + 1;
+	}
+
+	if (IS_ENABLED(CONFIG_BASE_SMALL)) {
+		buckets =3D 2;
+
+	} else {
+		/*
+		 * The default allocation will remain within
+		 *   16 <=3D threads * 4 <=3D global hash size
+		 */
+		buckets =3D roundup_pow_of_two(4 * threads);
+		buckets =3D max(buckets, 16);
+		buckets =3D min(buckets, futex_hashsize);
+	}
+	if (current_buckets >=3D buckets)
+		return 0;
+
+	return futex_hash_allocate(buckets);
 }
=20
 static int futex_hash_get_slots(void)
--=20
2.47.2

