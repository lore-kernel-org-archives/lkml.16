Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95316205E06
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 13:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738591189; cv=none; b=Fn3CZNtg2QF0oGk+msTmUNVj6VNErfZzYL9eDZ5YBfmUOO4iUE/aduEv3gQjBFFpuJTPNUFiNSalE99PvkAhA9Uo6d2sZgPd73HwYwiQ4MNC0oZ6WYXGcitquaJApODoSZnAG4ZicOPhqBGU2COjAULuaRJoYq3yOgO7N/BELcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738591189; c=relaxed/simple;
	bh=jx24DITxVlzSBY9t3sScv5dV3Uc64R3fHu3VkFAyLnY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HLvHtgTtHxMrjtLC9P8j9hwaQHyM3+8p0ZK/1bzCLXDjbfsnCrtaAMUtEPtfjuMDX+VFe0xK9eDw3hSa6Qn/X9NQupAqK/kZ9bwq+18+6hnpphqqh3XQ0MC79EcTifOARrxV2XPBXe0n87HjoaNUb7qq4yzm90nhxz7q40y2UIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=D76qvXYx; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=0SO/MN56; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="D76qvXYx";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0SO/MN56"
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738591185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3VkTRA93v/TYQ+iuRG7ZC9MwtD2MiDnMSmSFE4JgP+k=;
	b=D76qvXYx56p9ojZyje4mApDuUcLwaObOfVX2A3kyauTPNdaQW+7tjReWK9hHcDf3gAoOxQ
	IzrFZW123lB2MJBFv8VMgIavy0+3/9LhReyWaNwlmSgasXJKBEdRWal+8vTHrtNWdt/4lV
	RGktU0Msph4+D9uMPY4A6aLNSz/j0ygln6rRlDb/P3MvKc7Xl+VgeVbatydVAPojFWNS/F
	MSrTWTAzY2RWYtxJWKerkc0UM9+9oLhsDcDZrS5fVtRln/eETZYCSIB39n24+lYozeXzxz
	3u0XD1sSRmaIXG95GmH1RZkzjJADyljxb3Ah/qDDKHL1f6+lW8HUzrhpX+tICA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738591185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3VkTRA93v/TYQ+iuRG7ZC9MwtD2MiDnMSmSFE4JgP+k=;
	b=0SO/MN56aksC1mFhnQgftu04wGhlKq0G5ad8ARewLh7eDfxmdJvTNh0ELQJBZZtCHVXt8G
	xnO4j27VXfnouYAw==
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
Subject: [PATCH v8 04/15] futex: Allow automatic allocation of process wide futex hash.
Date: Mon,  3 Feb 2025 14:59:24 +0100
Message-ID: <20250203135935.440018-5-bigeasy@linutronix.de>
In-Reply-To: <20250203135935.440018-1-bigeasy@linutronix.de>
References: <20250203135935.440018-1-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Allocate a default futex hash if a task forks its first thread.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 include/linux/futex.h | 12 ++++++++++++
 kernel/fork.c         | 24 ++++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/include/linux/futex.h b/include/linux/futex.h
index 943828db52234..bad377c30de5e 100644
--- a/include/linux/futex.h
+++ b/include/linux/futex.h
@@ -86,6 +86,13 @@ static inline void futex_mm_init(struct mm_struct *mm)
 	mm->futex_hash_bucket =3D NULL;
 }
=20
+static inline bool futex_hash_requires_allocation(void)
+{
+	if (current->mm->futex_hash_bucket)
+		return false;
+	return true;
+}
+
 #else
 static inline void futex_init_task(struct task_struct *tsk) { }
 static inline void futex_exit_recursive(struct task_struct *tsk) { }
@@ -108,6 +115,11 @@ static inline int futex_hash_allocate_default(void)
 static inline void futex_hash_free(struct mm_struct *mm) { }
 static inline void futex_mm_init(struct mm_struct *mm) { }
=20
+static inline bool futex_hash_requires_allocation(void)
+{
+	return false;
+}
+
 #endif
=20
 #endif
diff --git a/kernel/fork.c b/kernel/fork.c
index 80ac156adebbf..824cc55d32ece 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -2138,6 +2138,15 @@ static void rv_task_fork(struct task_struct *p)
 #define rv_task_fork(p) do {} while (0)
 #endif
=20
+static bool need_futex_hash_allocate_default(u64 clone_flags)
+{
+	if ((clone_flags & (CLONE_THREAD | CLONE_VM)) !=3D (CLONE_THREAD | CLONE_=
VM))
+		return false;
+	if (!thread_group_empty(current))
+		return false;
+	return futex_hash_requires_allocation();
+}
+
 /*
  * This creates a new process as a copy of the old one,
  * but does not actually start it yet.
@@ -2515,6 +2524,21 @@ __latent_entropy struct task_struct *copy_process(
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
--=20
2.47.2

