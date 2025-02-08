Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0555D1714B7
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 09:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739005748; cv=none; b=mw7OZtt81A6W303su3FJ1xUfaU1FRVJlIdxdPGzLUs2zrhtrIRvvseR9N3KFJ1ckntOZvRXVikD+oqc5Wj4IRbxrP93brMOH6mmOfNf6YOUrK8cE91rx+dnPgoWUCTspQZTyi28lygDE7Q6D57XUQKNv0L3gdWQI65WJL51jTPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739005748; c=relaxed/simple;
	bh=K9v27FKYN5Io6sK4+bVtDu+/MHEgpZr80i5KRRWY6qM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dYDSUYHqwgZ1YlWf4gclerIjblBJ2XdG3sCFeuW95gF/atvzp8PtCM/nUJ22S6r0g/2ddDdH/FeyYC2pkbK6k0KSRGOq5XoZTx4Kaa3C2/3ZcI4nCfJGdNaiq/8KuEtAOqjMgMAOYwQbrqq0r78gNH/R3NQAOcUfbCBWnOaBXlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ppMsnWIE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ppMsnWIE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 625AFC4CED6;
	Sat,  8 Feb 2025 09:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739005747;
	bh=K9v27FKYN5Io6sK4+bVtDu+/MHEgpZr80i5KRRWY6qM=;
	h=Date:From:To:Cc:Subject:From;
	b=ppMsnWIEPQTUwNzdf53Ac3+RNFga+m81xQqBWYwB4hxy2Pc2Lcdr5njKZAJxxSRCu
	 A/DRhnTYn76ZrCf6EUpxjbtWc0gj2rejb+g9j63Ssgoq0bWHm7D8RCSXSLAixxQjq0
	 zgLoBAzqLgId6/syfTHO+PwJe3IxkmhnxfmZltTBTJKrbNq4bGMlMINmtocCZOiCiz
	 3h499jH6p628w2M5AHyithEcm6/bvP3ninuBrVgP5D3pAkEyqHLiW2nVtJV/vj7XEG
	 Z0hm6HvbXkZCQKXsFRffWueVVtw9xefysPZ+XzGV3ZvDLZXbRmNGMzPsGAt4MyO82z
	 wKQWtx9AhXpqg==
Date: Sat, 8 Feb 2025 10:08:55 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Peter Zijlstra <a.p.zijlstra@chello.nl>,
	Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>
Subject: [GIT PULL] locking fix
Message-ID: <Z6cfJwb7THMU5A90@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

Please pull the latest locking/urgent Git tree from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking-urgent-2025-02-08

   # HEAD: 5e0e02f0d7e52cfc8b1adfc778dd02181d8b47b4 futex: Pass in task to futex_queue()

Fix a dangling pointer bug in the futex code used by the
uring code, which isn't causing problems at the moment
due to uring ABI limitations leaving it essentially
unused in current usages, but is a good idea to fix
nevertheless.

 Thanks,

	Ingo

------------------>
Jens Axboe (1):
      futex: Pass in task to futex_queue()


 io_uring/futex.c        |  2 +-
 kernel/futex/core.c     |  5 +++--
 kernel/futex/futex.h    | 11 ++++++++---
 kernel/futex/pi.c       |  2 +-
 kernel/futex/waitwake.c |  4 ++--
 5 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/io_uring/futex.c b/io_uring/futex.c
index 30139cc150f2..e5cc208810ad 100644
--- a/io_uring/futex.c
+++ b/io_uring/futex.c
@@ -338,7 +338,7 @@ int io_futex_wait(struct io_kiocb *req, unsigned int issue_flags)
 		hlist_add_head(&req->hash_node, &ctx->futex_list);
 		io_ring_submit_unlock(ctx, issue_flags);
 
-		futex_queue(&ifd->q, hb);
+		futex_queue(&ifd->q, hb, NULL);
 		return IOU_ISSUE_SKIP_COMPLETE;
 	}
 
diff --git a/kernel/futex/core.c b/kernel/futex/core.c
index ebdd76b4ecbb..3db8567f5a44 100644
--- a/kernel/futex/core.c
+++ b/kernel/futex/core.c
@@ -532,7 +532,8 @@ void futex_q_unlock(struct futex_hash_bucket *hb)
 	futex_hb_waiters_dec(hb);
 }
 
-void __futex_queue(struct futex_q *q, struct futex_hash_bucket *hb)
+void __futex_queue(struct futex_q *q, struct futex_hash_bucket *hb,
+		   struct task_struct *task)
 {
 	int prio;
 
@@ -548,7 +549,7 @@ void __futex_queue(struct futex_q *q, struct futex_hash_bucket *hb)
 
 	plist_node_init(&q->list, prio);
 	plist_add(&q->list, &hb->chain);
-	q->task = current;
+	q->task = task;
 }
 
 /**
diff --git a/kernel/futex/futex.h b/kernel/futex/futex.h
index 99b32e728c4a..6b2f4c7eb720 100644
--- a/kernel/futex/futex.h
+++ b/kernel/futex/futex.h
@@ -285,13 +285,15 @@ static inline int futex_get_value_locked(u32 *dest, u32 __user *from)
 }
 
 extern void __futex_unqueue(struct futex_q *q);
-extern void __futex_queue(struct futex_q *q, struct futex_hash_bucket *hb);
+extern void __futex_queue(struct futex_q *q, struct futex_hash_bucket *hb,
+				struct task_struct *task);
 extern int futex_unqueue(struct futex_q *q);
 
 /**
  * futex_queue() - Enqueue the futex_q on the futex_hash_bucket
  * @q:	The futex_q to enqueue
  * @hb:	The destination hash bucket
+ * @task: Task queueing this futex
  *
  * The hb->lock must be held by the caller, and is released here. A call to
  * futex_queue() is typically paired with exactly one call to futex_unqueue().  The
@@ -299,11 +301,14 @@ extern int futex_unqueue(struct futex_q *q);
  * or nothing if the unqueue is done as part of the wake process and the unqueue
  * state is implicit in the state of woken task (see futex_wait_requeue_pi() for
  * an example).
+ *
+ * Note that @task may be NULL, for async usage of futexes.
  */
-static inline void futex_queue(struct futex_q *q, struct futex_hash_bucket *hb)
+static inline void futex_queue(struct futex_q *q, struct futex_hash_bucket *hb,
+			       struct task_struct *task)
 	__releases(&hb->lock)
 {
-	__futex_queue(q, hb);
+	__futex_queue(q, hb, task);
 	spin_unlock(&hb->lock);
 }
 
diff --git a/kernel/futex/pi.c b/kernel/futex/pi.c
index daea650b16f5..7a941845f7ee 100644
--- a/kernel/futex/pi.c
+++ b/kernel/futex/pi.c
@@ -982,7 +982,7 @@ int futex_lock_pi(u32 __user *uaddr, unsigned int flags, ktime_t *time, int tryl
 	/*
 	 * Only actually queue now that the atomic ops are done:
 	 */
-	__futex_queue(&q, hb);
+	__futex_queue(&q, hb, current);
 
 	if (trylock) {
 		ret = rt_mutex_futex_trylock(&q.pi_state->pi_mutex);
diff --git a/kernel/futex/waitwake.c b/kernel/futex/waitwake.c
index 3a10375d9521..a9056acb75ee 100644
--- a/kernel/futex/waitwake.c
+++ b/kernel/futex/waitwake.c
@@ -350,7 +350,7 @@ void futex_wait_queue(struct futex_hash_bucket *hb, struct futex_q *q,
 	 * access to the hash list and forcing another memory barrier.
 	 */
 	set_current_state(TASK_INTERRUPTIBLE|TASK_FREEZABLE);
-	futex_queue(q, hb);
+	futex_queue(q, hb, current);
 
 	/* Arm the timer */
 	if (timeout)
@@ -461,7 +461,7 @@ int futex_wait_multiple_setup(struct futex_vector *vs, int count, int *woken)
 			 * next futex. Queue each futex at this moment so hb can
 			 * be unlocked.
 			 */
-			futex_queue(q, hb);
+			futex_queue(q, hb, current);
 			continue;
 		}
 
