Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F10212D95
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 16:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744820975; cv=none; b=RrkK+tBfRnecmZcPNoRHcfQ0xWePbDDCut0BpOwji9aefD5bFv5BkgqOWRJb+N+BtDhTTXqh9csYMbGKQRBHScaoXnkA9IYQCuVOmdO5CWWA87HRdTk5UfAnTZXjH8jadp0rlWVzexlLqgjpLGvnPxscW9iIvE3j9mOdMENXLY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744820975; c=relaxed/simple;
	bh=z53cVIovTo2iotibDtas25ckcHnEJfC5ae+Mxvn/d5U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o5PABo82a3LIHGanheR27HOelwS48kYbDeqfWP3F+V+HU+uWsBRDbOGp8eUexCWXakQXhLZ2egA8/2qpZRlE6fug79d91RACKub716jk/NI5GJFAKBsbK9TmA54PECGnDBAn41cd3wtcCrDitJG/Rc/5OHzpMErvUJ6zka4C1Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=kzdj7Uxb; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=zTOLJPCg; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="kzdj7Uxb";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="zTOLJPCg"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744820971;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YhMDpxMm1myz48tpAMxuEHmG2PkPh5xCkOkdXX54tKE=;
	b=kzdj7UxbjAxQeAE2EHB78oBDdZhMc0ze44j30ed8RKqPhRtPUmZJ5vBHimBb4CwCBHHegP
	4Gm143ZkE3iGnoV57sicnb9A00LQW/u+F9CBczj9FlMmj9ndwmYWspYpzHJS12/aMzhScT
	KBXWbcfu25YGtMr1lUFIEqKwyKaO4wYRSg+YtPFHVCi7s9fQ3k+pFbO/2Z0UmquXiQaN3F
	nZY9VE3JIPVjnFeA+97gkoNWFRe1qgGir/9B7zQlB6uAp5fSnmcE2VhZgJJPt08XHSZcUp
	PMwO5wCHESMkqPvj3ufe/tMSZuyfwQpFWkgx1I0J5mZco0LgeJnKNw+JrPpX9Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744820971;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YhMDpxMm1myz48tpAMxuEHmG2PkPh5xCkOkdXX54tKE=;
	b=zTOLJPCgVeVryfD2gpkikmWF+hrd//SRixZ3FEFVb5WriSf7Up4XNQHHDE+mv9bbLLHRIs
	ngzhinK3a1rA/SDA==
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
Subject: [PATCH v12 13/21] futex: Allow automatic allocation of process wide futex hash
Date: Wed, 16 Apr 2025 18:29:13 +0200
Message-ID: <20250416162921.513656-14-bigeasy@linutronix.de>
In-Reply-To: <20250416162921.513656-1-bigeasy@linutronix.de>
References: <20250416162921.513656-1-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Allocate a private futex hash with 16 slots if a task forks its first
thread.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 include/linux/futex.h |  6 ++++++
 kernel/fork.c         | 22 ++++++++++++++++++++++
 kernel/futex/core.c   | 11 +++++++++++
 3 files changed, 39 insertions(+)

diff --git a/include/linux/futex.h b/include/linux/futex.h
index 8f1be08bef18d..1d3f7555825ec 100644
--- a/include/linux/futex.h
+++ b/include/linux/futex.h
@@ -80,6 +80,7 @@ long do_futex(u32 __user *uaddr, int op, u32 val, ktime_t=
 *timeout,
 int futex_hash_prctl(unsigned long arg2, unsigned long arg3, unsigned long=
 arg4);
=20
 #ifdef CONFIG_FUTEX_PRIVATE_HASH
+int futex_hash_allocate_default(void);
 void futex_hash_free(struct mm_struct *mm);
=20
 static inline void futex_mm_init(struct mm_struct *mm)
@@ -88,6 +89,7 @@ static inline void futex_mm_init(struct mm_struct *mm)
 }
=20
 #else /* !CONFIG_FUTEX_PRIVATE_HASH */
+static inline int futex_hash_allocate_default(void) { return 0; }
 static inline void futex_hash_free(struct mm_struct *mm) { }
 static inline void futex_mm_init(struct mm_struct *mm) { }
 #endif /* CONFIG_FUTEX_PRIVATE_HASH */
@@ -107,6 +109,10 @@ static inline int futex_hash_prctl(unsigned long arg2,=
 unsigned long arg3, unsig
 {
 	return -EINVAL;
 }
+static inline int futex_hash_allocate_default(void)
+{
+	return 0;
+}
 static inline void futex_hash_free(struct mm_struct *mm) { }
 static inline void futex_mm_init(struct mm_struct *mm) { }
=20
diff --git a/kernel/fork.c b/kernel/fork.c
index 831dfec450544..1f5d8083eeb25 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -2164,6 +2164,13 @@ static void rv_task_fork(struct task_struct *p)
 #define rv_task_fork(p) do {} while (0)
 #endif
=20
+static bool need_futex_hash_allocate_default(u64 clone_flags)
+{
+	if ((clone_flags & (CLONE_THREAD | CLONE_VM)) !=3D (CLONE_THREAD | CLONE_=
VM))
+		return false;
+	return true;
+}
+
 /*
  * This creates a new process as a copy of the old one,
  * but does not actually start it yet.
@@ -2544,6 +2551,21 @@ __latent_entropy struct task_struct *copy_process(
 	if (retval)
 		goto bad_fork_cancel_cgroup;
=20
+	/*
+	 * Allocate a default futex hash for the user process once the first
+	 * thread spawns.
+	 */
+	if (need_futex_hash_allocate_default(clone_flags)) {
+		retval =3D futex_hash_allocate_default();
+		if (retval)
+			goto bad_fork_core_free;
+		/*
+		 * If we fail beyond this point we don't free the allocated
+		 * futex hash map. We assume that another thread will be created
+		 * and makes use of it. The hash map will be freed once the main
+		 * thread terminates.
+		 */
+	}
 	/*
 	 * From this point on we must avoid any synchronous user-space
 	 * communication until we take the tasklist-lock. In particular, we do
diff --git a/kernel/futex/core.c b/kernel/futex/core.c
index 818df7420a1a9..53b3a00a92539 100644
--- a/kernel/futex/core.c
+++ b/kernel/futex/core.c
@@ -1294,6 +1294,17 @@ static int futex_hash_allocate(unsigned int hash_slo=
ts, bool custom)
 	return 0;
 }
=20
+int futex_hash_allocate_default(void)
+{
+	if (!current->mm)
+		return 0;
+
+	if (current->mm->futex_phash)
+		return 0;
+
+	return futex_hash_allocate(16, false);
+}
+
 static int futex_hash_get_slots(void)
 {
 	struct futex_private_hash *fph;
--=20
2.49.0

