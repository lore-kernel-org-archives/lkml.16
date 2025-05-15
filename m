Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E461DF990
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 17:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747329406; cv=none; b=VPm2zEPye9BlIkxx5099rPr9MgmteMbzSpaX3e8/g8hOsGvL9X9mYPaHtfUeNQxtXHiamDz6pPN66IRH4uIKtVfGTzDQAS532iKhXmsFyp+zaDUBQK/AWY5KL8cDJtJC2L6lmC/1Z3wpY8mPY3ul6A91s4w9sHZvoyXfG+hah8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747329406; c=relaxed/simple;
	bh=MvM60ZObbi/BQVbSgnG85/LiAIUeh4VIT7d3zsx/4vA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QiDIn/Gg4wFnUsBczNLOIcePPT2ROpYcFc1VHvc0evFjSR1E9uK0WO1FfUZi7xGlJ+AW2cOR/R9K8b6a8tbN35K975O3QSHNmS8J0ZmjYcHyMIHlJgNccsG+vP/kLIzHvW+D+v4YXvIUPb3IZfrqmLH61O4KPkZK8ytP3gECdVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E3J0h3oa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E3J0h3oa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37654C4CEE7;
	Thu, 15 May 2025 17:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747329405;
	bh=MvM60ZObbi/BQVbSgnG85/LiAIUeh4VIT7d3zsx/4vA=;
	h=From:To:Cc:Subject:Date:From;
	b=E3J0h3oaws/CHN4PmzdBqfzAuyTMX7bSoNjnAoQIuchPx9GRgltNMTyPHv6wvDeS8
	 fq7/nikzGeZob5Y7/meLFo5EGoAQfG9/J267zK6f5rE8/hFHnW9xlYaB//oYEgzI/8
	 gf5neSdCDOTamym3bkK9flQPT6TWlRPogAU3PJzPmehgit6S/+6IIiZwh/dVKZIlum
	 ZVy9w51SmhBxoAGfYpsG7czHvh0nkXFf0AtxV5/z3XyYRYLnXwgzHzccN8pgF6HMHi
	 LCw2XCAsT7KkIz1tr14KvoLsQ5rNQVqbQ5kVKFdAwHCtJ2HZobCwqb7T7fsVVwxZmf
	 pu1+XcdYhPnKQ==
From: Borislav Petkov <bp@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: X86 ML <x86@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	"Borislav Petkov (AMD)" <bp@alien8.de>
Subject: [PATCH] fitex: Fix kernel-doc comments
Date: Thu, 15 May 2025 19:16:41 +0200
Message-ID: <20250515171641.24073-1-bp@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Borislav Petkov (AMD)" <bp@alien8.de>

Fix those:

  ./kernel/futex/futex.h:208: warning: Function parameter or struct member 'drop_hb_ref' not described in 'futex_q'
  ./kernel/futex/waitwake.c:343: warning: expecting prototype for futex_wait_queue(). Prototype was for futex_do_wait() instead
  ./kernel/futex/waitwake.c:594: warning: Function parameter or struct member 'task' not described in 'futex_wait_setup'

Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
---
 kernel/futex/futex.h    | 1 +
 kernel/futex/waitwake.c | 5 ++---
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/kernel/futex/futex.h b/kernel/futex/futex.h
index 069fc2a83080..fcd1617212ee 100644
--- a/kernel/futex/futex.h
+++ b/kernel/futex/futex.h
@@ -175,6 +175,7 @@ typedef void (futex_wake_fn)(struct wake_q_head *wake_q, struct futex_q *q);
  * @requeue_pi_key:	the requeue_pi target futex key
  * @bitset:		bitset for the optional bitmasked wakeup
  * @requeue_state:	State field for futex_requeue_pi()
+ * @drop_hb_ref:	Waiter should drop the extra hash bucket reference if true
  * @requeue_wait:	RCU wait for futex_requeue_pi() (RT only)
  *
  * We use this hashed waitqueue, instead of a normal wait_queue_entry_t, so
diff --git a/kernel/futex/waitwake.c b/kernel/futex/waitwake.c
index bd8fef0f8d18..b3738fbe83c6 100644
--- a/kernel/futex/waitwake.c
+++ b/kernel/futex/waitwake.c
@@ -334,8 +334,7 @@ int futex_wake_op(u32 __user *uaddr1, unsigned int flags, u32 __user *uaddr2,
 static long futex_wait_restart(struct restart_block *restart);
 
 /**
- * futex_wait_queue() - futex_queue() and wait for wakeup, timeout, or signal
- * @hb:		the futex hash bucket, must be locked by the caller
+ * futex_do_wait() - wait for wakeup, timeout, or signal
  * @q:		the futex_q to queue up on
  * @timeout:	the prepared hrtimer_sleeper, or null for no timeout
  */
@@ -578,7 +577,7 @@ int futex_wait_multiple(struct futex_vector *vs, unsigned int count,
  * @flags:	futex flags (FLAGS_SHARED, etc.)
  * @q:		the associated futex_q
  * @key2:	the second futex_key if used for requeue PI
- * task:	Task queueing this futex
+ * @task:	Task queueing this futex
  *
  * Setup the futex_q and locate the hash_bucket.  Get the futex value and
  * compare it with the expected value.  Handle atomic faults internally.
-- 
2.43.0

