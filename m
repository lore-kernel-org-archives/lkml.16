Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0092066E6
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 15:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744041477; cv=none; b=l7N7Vkh1t4SmKSUj9E7SOIA5FHLIHCcFZyTJ/MKcEfF3p4upMfG3vj3CcKRQdcwEQ1v4lwpwBfH/M4YSyxhZ9iREnZ2Hy1RG8qUKVMRs/8i1kM1yow0npqyTgmjaMrpb0MmgoNgPUbTy7qPHt6W5KQ80Eb5ApaqUOzAE5FtxKTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744041477; c=relaxed/simple;
	bh=8Uoczjq/iM82jAmBI+kReD6JpGF+qTYQ1hhsWBaiIHo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BzGnSFp5NW+T3GXkULJ4hA3TsSOnHAKZjcVJbYRHhJmcYZhoXcU2aKeLO78OTtZ/FZz6FJA8QIlxTWvEHwQXqDWBGDf7Nf9+2hDTTkvlkWkDP+l6NBP4DEdYak1o8KNi1O4OAXacWqh4Do1EAe1qgMbSjuJbr8DoTyiD6Q+zhZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=mGlf+9Px; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=rRs3AvWZ; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="mGlf+9Px";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="rRs3AvWZ"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744041472;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I26F+Ig2zVIWrVuk9E7HCrMYUBHHGSvHkRQ+YbSZ58c=;
	b=mGlf+9Px1S0F6UpFEVI7ak/Ghxrdvm4Cwj8EDw9hxHlbv57k81bHluhBQVui/xA+suCG+3
	O2DCEPbJ5ORhrW5dwL6sAOa7hYtUX16HfFCfFhl2MTA4DShan35tRz8a5QRLmpDRqnHRTX
	bcpLXf4rYbEVOgICNA6Mnvc9zCw0LSu/K6jNi1yVTbY6NPXlh9FwmxBqMj9bNnos3/qSUx
	hRZB4s05ygH/IdqQHkLIfD+TTKKnQPJCpa3M7YojtsIxChwkjiE0wNOWC2MfCDcYTWQhfB
	nrfdOQZadghCbGNo1O/W3V87BnVb+ZYDeLpQfoJVLCKLXRgnVpEaDkNbTUSiMg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744041472;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I26F+Ig2zVIWrVuk9E7HCrMYUBHHGSvHkRQ+YbSZ58c=;
	b=rRs3AvWZm57utpEfulVdDUbIXMPxMR/TkEnPleB7lAtPuxbgyR9n1OTCmKAvpW4oiV0wTr
	6ObqGdf9qNAuBoDQ==
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
Subject: [PATCH v11 13/19] futex: Allow automatic allocation of process wide futex hash.
Date: Mon,  7 Apr 2025 17:57:36 +0200
Message-ID: <20250407155742.968816-14-bigeasy@linutronix.de>
In-Reply-To: <20250407155742.968816-1-bigeasy@linutronix.de>
References: <20250407155742.968816-1-bigeasy@linutronix.de>
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
index bbc897e54c864..0e147819ae153 100644
--- a/include/linux/futex.h
+++ b/include/linux/futex.h
@@ -80,6 +80,7 @@ long do_futex(u32 __user *uaddr, int op, u32 val, ktime_t=
 *timeout,
 int futex_hash_prctl(unsigned long arg2, unsigned long arg3);
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
 unsigned long arg3)
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
index 479a629b9aeea..a8ede52bf7e63 100644
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

