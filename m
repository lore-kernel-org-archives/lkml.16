Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100E21E5B6B
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 16:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738860294; cv=none; b=JO5S2nnsSjbNG0RsdDp0b3tCCpe4DgKSXmcPn5Mzt53eVC974LlMgjEtNpOiLr2fFb3vjo9k5exazA6hE3phtAFjTWbcKD3tvAXwgYgeQje7cR/lOqhRgslaik1tYuZ3/grS/0z2ewbxpThobaLWbqqnukayqo5NvHk/wbhYNyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738860294; c=relaxed/simple;
	bh=aUDgw+gSk0MwQBw13jGt4EmThRoxY02/Q/06X2KM2hU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mYBGC0iJ22GUlFp+YV42Cdku6b2ePnv3UaRjbB9+3FcQbrcqNWyspLmU2cqAXfs23RXYzrNxjMwuskBW67BlNbJsw5NJzVkXM/LDZvUPwNjyl60evfLMHuGVJpHIhtg78hNWhRHzadf9ni37115QpSScF+Ie7jiMHH49lKsmDLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PIcERYkB; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PIcERYkB"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5de3c29e9b3so521445a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 08:44:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738860290; x=1739465090; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P1tcF++dbHlub2RYbrz+kvADf5ajR/p1WCoTi4SqY9k=;
        b=PIcERYkBV8Ivx9sugo8mVbbNJ8XbjSD+ZHBZqsAnkIa9pmAE9WRhdhcP5WZ+iTxhCT
         CAFTRf8VijRXh/XG0I7CCNuUSbRkWF2bkF09IxJOBkwmhTLyfnRZKMRfvNQJg+I0//zc
         KtCRCb9qiVubjek90WZcKl0vicHbsoMApDq+xZtnSH66XTiYKDRsfiOmVZhIu+2yss7j
         fT2zPOv2lIGXrvtZqMmlHFn62WsHC3PweFRWu8U2dAgLc5bKhE0DIDFQ9lkv/d+0iatD
         Jlqg1jmgpsRVy+8/zmwjBYIzAcxzd3Bf3WSILTli66rmsKG529FC+t78mEJHFROG5xkv
         EK3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738860290; x=1739465090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P1tcF++dbHlub2RYbrz+kvADf5ajR/p1WCoTi4SqY9k=;
        b=uykpsc17/sbaa13QCurp90Mu9DGMBv+hQWRZEHnrxK3sJ43/5k2EgueIEDaFi0jEu2
         MMrAqE0r6AdgcIfqws7fb+IwXMhZolVNkhrWwNt6IifWOW1ZV58yl0wT2sMbLtsJiWNc
         P3d8l/uLEbztbBnLuz+rcebLtjLnPfBdSWgfvdDAV/9aA5taQOBugJY4r3tiNIN/w7/H
         c141620zKv3MRUa3mCULPf+6n+bsHmSNgaayASs7i/11KH5Eu5L2gwL4Ew5PymmsSYia
         zJJQLk8/sOzFGiR4gYTrF8yhteBB3HVuKqEZhm1xC8u6uXV1CQ64u2pJUjG2Jg6piDEv
         q28g==
X-Forwarded-Encrypted: i=1; AJvYcCUmZb3AYyEvFJYDpuXhIokAqFnmG7NrZC69y59hM+nbdv6o1FNfmkmZibJhWPGR+cg/eOC2dvBWgxWYQQI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOWApUN74uEIqRtoGfzo2jR75CIiOhgwAKSGK/GZ9KPlUm+zaz
	ez3AviMJGHYkA7fl1eQPeTq9SCSBbdApzIKVFbVZFdN/pC6JPT9n
X-Gm-Gg: ASbGncthAkoATGocmOVdI6JVSpxG29wFvHQ99iexyr+MeB7N5t5ze1ChyWUXlMV7jn5
	l7U1zfJCm5vdm6zBs7mLm3oXYKdwOzBAWMHo6JEAWC8HjY/sj4DOszDK7R6N4qE/U3Tfm+Uh4To
	YdfWWqLmqvgbU7Y+Ag4UG4nNtSsfw+j1XQvGtlgE6PY6PdheFIcIkfXxjQTRZ9mQRsw0GqOr+eA
	FvsORcrRtAV9CCNipgX7cOB5y/Cfm/rSdU1A2czU76qza3CKBuw98zboHCMdNYO48iKWLKEn2QS
	Fj4OsC34MrocmcmBO1utl3I9NUHxFHg=
X-Google-Smtp-Source: AGHT+IE4X6Gh7ABr/CAabaJiQHTc3ksfl4DHOZdtIehrJhW32+PzJmv296KghHaD7mifNH3wlAlW+g==
X-Received: by 2002:a17:906:5594:b0:ab7:7482:a11 with SMTP id a640c23a62f3a-ab774820b25mr252379466b.12.1738860289978;
        Thu, 06 Feb 2025 08:44:49 -0800 (PST)
Received: from f.. (cst-prg-95-94.cust.vodafone.cz. [46.135.95.94])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcf9f6fa69sm1121849a12.73.2025.02.06.08.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 08:44:48 -0800 (PST)
From: Mateusz Guzik <mjguzik@gmail.com>
To: ebiederm@xmission.com,
	oleg@redhat.com
Cc: brauner@kernel.org,
	akpm@linux-foundation.org,
	Liam.Howlett@oracle.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Mateusz Guzik <mjguzik@gmail.com>
Subject: [PATCH v6 4/5] pid: perform free_pid() calls outside of tasklist_lock
Date: Thu,  6 Feb 2025 17:44:13 +0100
Message-ID: <20250206164415.450051-5-mjguzik@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250206164415.450051-1-mjguzik@gmail.com>
References: <20250206164415.450051-1-mjguzik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As the clone side already executes pid allocation with only pidmap_lock
held, issuing free_pid() while still holding tasklist_lock exacerbates
total hold time of the latter.

More things may show up later which require initial clean up with the
lock held and allow finishing without it. For that reason a struct to
collect such work is added instead of merely passing the pid array.

Reviewed-by: Oleg Nesterov <oleg@redhat.com>
Signed-off-by: Mateusz Guzik <mjguzik@gmail.com>
---
 include/linux/pid.h |  7 ++++---
 kernel/exit.c       | 28 ++++++++++++++++++++--------
 kernel/pid.c        | 44 ++++++++++++++++++++++----------------------
 kernel/sys.c        | 14 +++++++++-----
 4 files changed, 55 insertions(+), 38 deletions(-)

diff --git a/include/linux/pid.h b/include/linux/pid.h
index 98837a1ff0f3..311ecebd7d56 100644
--- a/include/linux/pid.h
+++ b/include/linux/pid.h
@@ -101,9 +101,9 @@ extern struct pid *get_task_pid(struct task_struct *task, enum pid_type type);
  * these helpers must be called with the tasklist_lock write-held.
  */
 extern void attach_pid(struct task_struct *task, enum pid_type);
-extern void detach_pid(struct task_struct *task, enum pid_type);
-extern void change_pid(struct task_struct *task, enum pid_type,
-			struct pid *pid);
+void detach_pid(struct pid **pids, struct task_struct *task, enum pid_type);
+void change_pid(struct pid **pids, struct task_struct *task, enum pid_type,
+		struct pid *pid);
 extern void exchange_tids(struct task_struct *task, struct task_struct *old);
 extern void transfer_pid(struct task_struct *old, struct task_struct *new,
 			 enum pid_type);
@@ -129,6 +129,7 @@ extern struct pid *find_ge_pid(int nr, struct pid_namespace *);
 extern struct pid *alloc_pid(struct pid_namespace *ns, pid_t *set_tid,
 			     size_t set_tid_size);
 extern void free_pid(struct pid *pid);
+void free_pids(struct pid **pids);
 extern void disable_pid_allocation(struct pid_namespace *ns);
 
 /*
diff --git a/kernel/exit.c b/kernel/exit.c
index 8c39c84582b7..0d6df671c8a8 100644
--- a/kernel/exit.c
+++ b/kernel/exit.c
@@ -122,14 +122,22 @@ static __init int kernel_exit_sysfs_init(void)
 late_initcall(kernel_exit_sysfs_init);
 #endif
 
-static void __unhash_process(struct task_struct *p, bool group_dead)
+/*
+ * For things release_task() would like to do *after* tasklist_lock is released.
+ */
+struct release_task_post {
+	struct pid *pids[PIDTYPE_MAX];
+};
+
+static void __unhash_process(struct release_task_post *post, struct task_struct *p,
+			     bool group_dead)
 {
 	nr_threads--;
-	detach_pid(p, PIDTYPE_PID);
+	detach_pid(post->pids, p, PIDTYPE_PID);
 	if (group_dead) {
-		detach_pid(p, PIDTYPE_TGID);
-		detach_pid(p, PIDTYPE_PGID);
-		detach_pid(p, PIDTYPE_SID);
+		detach_pid(post->pids, p, PIDTYPE_TGID);
+		detach_pid(post->pids, p, PIDTYPE_PGID);
+		detach_pid(post->pids, p, PIDTYPE_SID);
 
 		list_del_rcu(&p->tasks);
 		list_del_init(&p->sibling);
@@ -141,7 +149,7 @@ static void __unhash_process(struct task_struct *p, bool group_dead)
 /*
  * This function expects the tasklist_lock write-locked.
  */
-static void __exit_signal(struct task_struct *tsk)
+static void __exit_signal(struct release_task_post *post, struct task_struct *tsk)
 {
 	struct signal_struct *sig = tsk->signal;
 	bool group_dead = thread_group_leader(tsk);
@@ -194,7 +202,7 @@ static void __exit_signal(struct task_struct *tsk)
 	task_io_accounting_add(&sig->ioac, &tsk->ioac);
 	sig->sum_sched_runtime += tsk->se.sum_exec_runtime;
 	sig->nr_threads--;
-	__unhash_process(tsk, group_dead);
+	__unhash_process(post, tsk, group_dead);
 	write_sequnlock(&sig->stats_lock);
 
 	/*
@@ -236,10 +244,13 @@ void __weak release_thread(struct task_struct *dead_task)
 
 void release_task(struct task_struct *p)
 {
+	struct release_task_post post;
 	struct task_struct *leader;
 	struct pid *thread_pid;
 	int zap_leader;
 repeat:
+	memset(&post, 0, sizeof(post));
+
 	/* don't need to get the RCU readlock here - the process is dead and
 	 * can't be modifying its own credentials. But shut RCU-lockdep up */
 	rcu_read_lock();
@@ -252,7 +263,7 @@ void release_task(struct task_struct *p)
 
 	write_lock_irq(&tasklist_lock);
 	ptrace_release_task(p);
-	__exit_signal(p);
+	__exit_signal(&post, p);
 
 	/*
 	 * If we are the last non-leader member of the thread
@@ -278,6 +289,7 @@ void release_task(struct task_struct *p)
 	put_pid(thread_pid);
 	add_device_randomness(&p->se.sum_exec_runtime,
 			      sizeof(p->se.sum_exec_runtime));
+	free_pids(post.pids);
 	release_thread(p);
 	put_task_struct_rcu_user(p);
 
diff --git a/kernel/pid.c b/kernel/pid.c
index 2ae872f689a7..73625f28c166 100644
--- a/kernel/pid.c
+++ b/kernel/pid.c
@@ -88,20 +88,6 @@ struct pid_namespace init_pid_ns = {
 };
 EXPORT_SYMBOL_GPL(init_pid_ns);
 
-/*
- * Note: disable interrupts while the pidmap_lock is held as an
- * interrupt might come in and do read_lock(&tasklist_lock).
- *
- * If we don't disable interrupts there is a nasty deadlock between
- * detach_pid()->free_pid() and another cpu that does
- * spin_lock(&pidmap_lock) followed by an interrupt routine that does
- * read_lock(&tasklist_lock);
- *
- * After we clean up the tasklist_lock and know there are no
- * irq handlers that take it we can leave the interrupts enabled.
- * For now it is easier to be safe than to prove it can't happen.
- */
-
 static  __cacheline_aligned_in_smp DEFINE_SPINLOCK(pidmap_lock);
 seqcount_spinlock_t pidmap_lock_seq = SEQCNT_SPINLOCK_ZERO(pidmap_lock_seq, &pidmap_lock);
 
@@ -128,10 +114,11 @@ static void delayed_put_pid(struct rcu_head *rhp)
 
 void free_pid(struct pid *pid)
 {
-	/* We can be called with write_lock_irq(&tasklist_lock) held */
 	int i;
 	unsigned long flags;
 
+	lockdep_assert_not_held(&tasklist_lock);
+
 	spin_lock_irqsave(&pidmap_lock, flags);
 	for (i = 0; i <= pid->level; i++) {
 		struct upid *upid = pid->numbers + i;
@@ -160,6 +147,18 @@ void free_pid(struct pid *pid)
 	call_rcu(&pid->rcu, delayed_put_pid);
 }
 
+void free_pids(struct pid **pids)
+{
+	int tmp;
+
+	/*
+	 * This can batch pidmap_lock.
+	 */
+	for (tmp = PIDTYPE_MAX; --tmp >= 0; )
+		if (pids[tmp])
+			free_pid(pids[tmp]);
+}
+
 struct pid *alloc_pid(struct pid_namespace *ns, pid_t *set_tid,
 		      size_t set_tid_size)
 {
@@ -347,8 +346,8 @@ void attach_pid(struct task_struct *task, enum pid_type type)
 	hlist_add_head_rcu(&task->pid_links[type], &pid->tasks[type]);
 }
 
-static void __change_pid(struct task_struct *task, enum pid_type type,
-			struct pid *new)
+static void __change_pid(struct pid **pids, struct task_struct *task,
+			 enum pid_type type, struct pid *new)
 {
 	struct pid **pid_ptr, *pid;
 	int tmp;
@@ -370,18 +369,19 @@ static void __change_pid(struct task_struct *task, enum pid_type type,
 		if (pid_has_task(pid, tmp))
 			return;
 
-	free_pid(pid);
+	WARN_ON(pids[type]);
+	pids[type] = pid;
 }
 
-void detach_pid(struct task_struct *task, enum pid_type type)
+void detach_pid(struct pid **pids, struct task_struct *task, enum pid_type type)
 {
-	__change_pid(task, type, NULL);
+	__change_pid(pids, task, type, NULL);
 }
 
-void change_pid(struct task_struct *task, enum pid_type type,
+void change_pid(struct pid **pids, struct task_struct *task, enum pid_type type,
 		struct pid *pid)
 {
-	__change_pid(task, type, pid);
+	__change_pid(pids, task, type, pid);
 	attach_pid(task, type);
 }
 
diff --git a/kernel/sys.c b/kernel/sys.c
index cb366ff8703a..4efca8a97d62 100644
--- a/kernel/sys.c
+++ b/kernel/sys.c
@@ -1085,6 +1085,7 @@ SYSCALL_DEFINE2(setpgid, pid_t, pid, pid_t, pgid)
 {
 	struct task_struct *p;
 	struct task_struct *group_leader = current->group_leader;
+	struct pid *pids[PIDTYPE_MAX] = { 0 };
 	struct pid *pgrp;
 	int err;
 
@@ -1142,13 +1143,14 @@ SYSCALL_DEFINE2(setpgid, pid_t, pid, pid_t, pgid)
 		goto out;
 
 	if (task_pgrp(p) != pgrp)
-		change_pid(p, PIDTYPE_PGID, pgrp);
+		change_pid(pids, p, PIDTYPE_PGID, pgrp);
 
 	err = 0;
 out:
 	/* All paths lead to here, thus we are safe. -DaveM */
 	write_unlock_irq(&tasklist_lock);
 	rcu_read_unlock();
+	free_pids(pids);
 	return err;
 }
 
@@ -1222,21 +1224,22 @@ SYSCALL_DEFINE1(getsid, pid_t, pid)
 	return retval;
 }
 
-static void set_special_pids(struct pid *pid)
+static void set_special_pids(struct pid **pids, struct pid *pid)
 {
 	struct task_struct *curr = current->group_leader;
 
 	if (task_session(curr) != pid)
-		change_pid(curr, PIDTYPE_SID, pid);
+		change_pid(pids, curr, PIDTYPE_SID, pid);
 
 	if (task_pgrp(curr) != pid)
-		change_pid(curr, PIDTYPE_PGID, pid);
+		change_pid(pids, curr, PIDTYPE_PGID, pid);
 }
 
 int ksys_setsid(void)
 {
 	struct task_struct *group_leader = current->group_leader;
 	struct pid *sid = task_pid(group_leader);
+	struct pid *pids[PIDTYPE_MAX] = { 0 };
 	pid_t session = pid_vnr(sid);
 	int err = -EPERM;
 
@@ -1252,13 +1255,14 @@ int ksys_setsid(void)
 		goto out;
 
 	group_leader->signal->leader = 1;
-	set_special_pids(sid);
+	set_special_pids(pids, sid);
 
 	proc_clear_tty(group_leader);
 
 	err = session;
 out:
 	write_unlock_irq(&tasklist_lock);
+	free_pids(pids);
 	if (err > 0) {
 		proc_sid_connector(group_leader);
 		sched_autogroup_create_attach(group_leader);
-- 
2.43.0

