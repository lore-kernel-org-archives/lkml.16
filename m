Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A92E1EDA12
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 15:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738855436; cv=none; b=BwswBbGWUbhM/+zWw1yF7CUv9Vx3KiPd9BTVm2hzGHBeddSA9awkQ4Cq8W6VX5L6aDJd1u3yI4ObX7AOp0jLKaFKJWHXY2/n/ei/bqpJ+jP5XUES3PvShM8bPqV35/TvjRUyhSzy1IAHlDzsSmOU+QOj0jjgpgBUKUXDi1uglfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738855436; c=relaxed/simple;
	bh=I2btI8GjiPwCMk/JEmyQ2h9jMFY4yeGon2YPVUu7jF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G+FxUKs7imVeoNIclmD7Jis8E/8iBtalVoJTq/HqdOS6rxa13/Qk1MAadWTJKWMJLOtXebXB0o7PT7RnR9bVp49Tr8FmqMLRiLY6BEcTbSiRSp0myHd6IVAo3xS19Hcx14JwkIJx9i8ExPOjdlp6/gkRWmnf90+sWWxos6R18p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VCAASXct; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VCAASXct"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738855431;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=F9s/EWJ61FKw21RNO/44oIGW7uTIX6AKUVt9aZsJ+fc=;
	b=VCAASXctMhGbrt44EaWn4CfMMCXkCCX51aWVVC/3JONqtJEiTHQGz3CzmH9A65ZpIzJRP+
	oWlUsNNqi3eP98nUVwnz5aiQQPvXDmmu2wBhiy+SSVlickMEWRIML/kLWD249R4XOFVpQd
	LQ1vYQPbQ0Tjp4NNFKMmaEPvKY1zOuk=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-563-ZPGkF5MBP5SEFkdDy2P2Ig-1; Thu,
 06 Feb 2025 10:23:46 -0500
X-MC-Unique: ZPGkF5MBP5SEFkdDy2P2Ig-1
X-Mimecast-MFC-AGG-ID: ZPGkF5MBP5SEFkdDy2P2Ig
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D6F651800875;
	Thu,  6 Feb 2025 15:23:44 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.44.34.53])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 15F8C19560AE;
	Thu,  6 Feb 2025 15:23:41 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Thu,  6 Feb 2025 16:23:18 +0100 (CET)
Date: Thu, 6 Feb 2025 16:23:14 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Mateusz Guzik <mjguzik@gmail.com>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] exit: change the release_task() paths to call
 flush_sigqueue() lockless
Message-ID: <20250206152314.GA14620@redhat.com>
References: <20250206152244.GA14609@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206152244.GA14609@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

A task can block a signal, accumulate up to RLIMIT_SIGPENDING sigqueues,
and exit. In this case __exit_signal()->flush_sigqueue() called with irqs
disabled can trigger a hard lockup, see
https://lore.kernel.org/all/20190322114917.GC28876@redhat.com/

Fortunately, after the recent posixtimer changes sys_timer_delete() paths
no longer try to clear SIGQUEUE_PREALLOC and/or free tmr->sigq, and after
the exiting task passes __exit_signal() lock_task_sighand() can't succeed
and pid_task(tmr->it_pid) will return NULL.

This means that after __exit_signal(tsk) nobody can play with tsk->pending
or (if group_dead) with tsk->signal->shared_pending, so release_task() can
safely call flush_sigqueue() after write_unlock_irq(&tasklist_lock).

TODO:
	- we can probably shift posix_cpu_timers_exit() as well
	- do_sigaction() can hit the similar problem

Signed-off-by: Oleg Nesterov <oleg@redhat.com>
---
 kernel/exit.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/kernel/exit.c b/kernel/exit.c
index 3485e5fc499e..2d7444da743d 100644
--- a/kernel/exit.c
+++ b/kernel/exit.c
@@ -200,20 +200,13 @@ static void __exit_signal(struct task_struct *tsk)
 	__unhash_process(tsk, group_dead);
 	write_sequnlock(&sig->stats_lock);
 
-	/*
-	 * Do this under ->siglock, we can race with another thread
-	 * doing sigqueue_free() if we have SIGQUEUE_PREALLOC signals.
-	 */
-	flush_sigqueue(&tsk->pending);
 	tsk->sighand = NULL;
 	spin_unlock(&sighand->siglock);
 
 	__cleanup_sighand(sighand);
 	clear_tsk_thread_flag(tsk, TIF_SIGPENDING);
-	if (group_dead) {
-		flush_sigqueue(&sig->shared_pending);
+	if (group_dead)
 		tty_kref_put(tty);
-	}
 }
 
 static void delayed_put_task_struct(struct rcu_head *rhp)
@@ -279,6 +272,16 @@ void release_task(struct task_struct *p)
 	proc_flush_pid(thread_pid);
 	put_pid(thread_pid);
 	release_thread(p);
+	/*
+	 * This task was already removed from the process/thread/pid lists
+	 * and lock_task_sighand(p) can't succeed. Nobody else can touch
+	 * ->pending or, if group dead, signal->shared_pending. We can call
+	 * flush_sigqueue() lockless.
+	 */
+	flush_sigqueue(&p->pending);
+	if (thread_group_leader(p))
+		flush_sigqueue(&p->signal->shared_pending);
+
 	put_task_struct_rcu_user(p);
 
 	p = leader;
-- 
2.25.1.362.g51ebf55


