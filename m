Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E281FCF47
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 17:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738777958; cv=none; b=g3q6YVsQaJsC4rJDwmUcQaOJOuH4/VzUBXeymFNBKP4XXZcFAASby2Go0ZoGf5nuBYQWh5alGvfP71Ask5otbrHDF/ae710q5zE3/MfTnn21OT7WrES4UId6FstsznVWFck96ujhrmX5wJVl52SK6JCHxd8LeGdTmNEpsX+064Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738777958; c=relaxed/simple;
	bh=q18aSFR6vq3KVvUaoHgvB1HGvkwaut4qgFwgISSuXIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dOQ0gNEjVUKQgFvLTCn7JsjUR7Woa8qEGM+E/9rn5ReAn6pafucweRBcoGG3sSD8YASBfUIwkfzAuS72zFG8rW4vb+WaJBKmNcxeRHNutbicUF9/XUY6RwVB+dqztufOMNC/a/W94pnsjGGmU29ssjF36tDjcC4kDHPhc39+DRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RflA5U4a; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RflA5U4a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738777955;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WJ8jnjLaMNZnYZ2+cO3APeYG0LIlTFJ4mhKRkS5LVCY=;
	b=RflA5U4aUb8o8gM20HKJQhrRV9xxZcVLIU55d8+pip/0QEiM4jWBRSQwFqE0lgcAQQ4KWB
	qVFXOuUJrvfndC2d/IyIKACCNr9pqabkcH6w34SfHCxyybFuQFuLCm7HOf+aXwQkKe7a2m
	YcF+NOQL2g9wG9AW5QvnllDPwZPrRPs=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-252-bgGwV7t_M9OTDI2E1-Q_Kw-1; Wed,
 05 Feb 2025 12:52:31 -0500
X-MC-Unique: bgGwV7t_M9OTDI2E1-Q_Kw-1
X-Mimecast-MFC-AGG-ID: bgGwV7t_M9OTDI2E1-Q_Kw
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 469E11956094;
	Wed,  5 Feb 2025 17:52:30 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.224.10])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 715BB1800360;
	Wed,  5 Feb 2025 17:52:27 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Wed,  5 Feb 2025 18:52:03 +0100 (CET)
Date: Wed, 5 Feb 2025 18:51:59 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Mateusz Guzik <mjguzik@gmail.com>, linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] exit: change the release_task() paths to call
 flush_sigqueue() lockless
Message-ID: <20250205175159.GA8714@redhat.com>
References: <20250205175136.GA8702@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205175136.GA8702@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

A task can block a signal, accumulate up to RLIMIT_SIGPENDING sigqueues,
and exit. In this case __exit_signal()->flush_sigqueue() called with irqs
disabled can triger a hard lockup, see
https://lore.kernel.org/all/20190322114917.GC28876@redhat.com/

Fortunately, after the recent posixtimer changes sys_timer_delete() paths
no longer try to clear SIGQUEUE_PREALLOC and/or free tmr->sigq, and after
the exiting task passes __exit_signal() lock_task_sighand() can't succeed
and pid_task(tmr->it_pid) will return NULL.

This means that after __exit_signal(tsk) nobody can play with tsk->pending
or (if group_dead) with tsk->signal->shared_pending, so release_task() can
safely call flush_sigqueue() after write_unlock_irq(&tasklist_lock).

Also, kill clear_tsk_thread_flag(TIF_SIGPENDING), it was never needed.

TODO:
	- we can probably shift posix_cpu_timers_exit() as well
	- do_sigaction() can hit the similar problem

Signed-off-by: Oleg Nesterov <oleg@redhat.com>
---
 kernel/exit.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/kernel/exit.c b/kernel/exit.c
index 3485e5fc499e..bc2c24ea4181 100644
--- a/kernel/exit.c
+++ b/kernel/exit.c
@@ -200,20 +200,12 @@ static void __exit_signal(struct task_struct *tsk)
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
-	clear_tsk_thread_flag(tsk, TIF_SIGPENDING);
-	if (group_dead) {
-		flush_sigqueue(&sig->shared_pending);
+	if (group_dead)
 		tty_kref_put(tty);
-	}
 }
 
 static void delayed_put_task_struct(struct rcu_head *rhp)
@@ -279,6 +271,11 @@ void release_task(struct task_struct *p)
 	proc_flush_pid(thread_pid);
 	put_pid(thread_pid);
 	release_thread(p);
+
+	flush_sigqueue(&p->pending);
+	if (thread_group_leader(p))
+		flush_sigqueue(&p->signal->shared_pending);
+
 	put_task_struct_rcu_user(p);
 
 	p = leader;
-- 
2.25.1.362.g51ebf55


