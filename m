Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECADA214803
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 20:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738786189; cv=none; b=ZOZdl2dIPCWk4/PBLN+iIa5nJH0TddxF35HKLDkq8ltc5xAgC6NLKKnNuNjGatD8C1S9eswX9zV6sFJi6hSQPmn9fLnVJC+3qUY2H6j3kwnuvi1APhiA8wo6NRsuHRURit4SefMq2y5jxoUBBGPR57hgz/wyoU3i3EMuWuUnG3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738786189; c=relaxed/simple;
	bh=W3Pd3CkKGyvgAPPYybzEKfQFA7hQ9I4yfPvIKYI3E9k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oA3vh7jFYakucQOiKSLfqyGqbh/jTuE61vpj+7KCOyAHB5VZQKlSHxowRMbW+ZeOojdD/daFmfyLlttQNqPYPsMwrPpnq7UgkqsDk2GDvkpuQ1eY4JbU+CXL2vECEbDXUq5rB0oNfbGvlPR692OoSSmAYoIoGCVZu3iFogxEdn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SSWoQtbn; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SSWoQtbn"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-aafc9d75f8bso40603366b.2
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 12:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738786185; x=1739390985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UXXHLc4u2eFHoy15ceLKQBCXMdX6jJSCsW2EOllr/as=;
        b=SSWoQtbnoCWwOQkzjCqed4sGZSf6Qgw66uDRQOATdT0aD3kscR6pSL1Afkj/6rRcuT
         sdgH1EB3ZFF2d+vzq2+RpmlSzHZ3wU8qsl4ygBGP161c6Fko7++9anHQ7fPqEdfI/QYe
         qWeplKb3o2xFchF4rJj7T2oVmY2r/I//7BsSszjLrM++IHyH9fW+zt2Bu4hbblJ7Kmj/
         rAeOk574IijadYC0MAiuqtLV9zYYpFzXLmfrhDvbY1ocU3EMs4YjrvchDLikk1EqPo4o
         n5VRweWzIQrDnU5W4h3/dULwFApBZptbh+0X0MPqexSd01EyvvoRwJ/QYfJgqMJEpQW7
         YKjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738786185; x=1739390985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UXXHLc4u2eFHoy15ceLKQBCXMdX6jJSCsW2EOllr/as=;
        b=M/wfiyRlfBD9E36OSBQG8ZPwNEExso1KQrb7z0Ijh3nHA/sUh2KRYfUq/1ZIjMA2Uy
         qBRLcXV7y+sybId0Asybv62bGw0W58Qj3UkmgKiSSuPWRVCpjM2yl/UejAOMvZuGYVGK
         JxBoX0+NLv3jndsuJUZkCVBXn2EF8mtYmky0KyQvg0sdADv0GYiE/OUBDN4FsUOPUJsI
         PlXbTjr7Es9N3bAP/p4q65yXKIGcFxN6H0vfm27f3DaWnAzMB2KJ8+CRbB6Lku7yp8nD
         IT7emNqUAuyaQ7jCbZ+SJPZndRKNBa7PTlz4q7vb040pMe6Gv9EKYOyr9CtKFatv/QnJ
         i60g==
X-Forwarded-Encrypted: i=1; AJvYcCXldyaGzk1+WPzgchNHRWBeGGTSJAj0gDUIWWJp+9SiUZu91dudhtNFvKcAIKBYvYSc+l39WMHwLKdwsQk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+r3/k5RzWEQXem9vHACkL7w3qLsCYUOle3C93yTxaa8z8KxvB
	70+Ysxo+8V0zEw2FOfpricfPX5XpsZELD9d01J4z08Mxwv2iu290
X-Gm-Gg: ASbGncsMVL1KPmQO6Z8lWejnRSSG08otP2JbgTnHUArtEA1BbGHiXRA+EntnXsjZwVd
	XXHE4aF3kCJSJht/DkGXmjAsCAnmmR6uDO3YtCZJMxhi9n8zwf8edlcHp+e1GkkX/bHeXOwcArr
	EQawdUylERM0pcpzFji/PUfgEs+rJ9tyiOna5oyc3aVpdiRbBX3vzQr+l7SvWLEdtpojapdDfEI
	LRNPzCpDgX/CRW2taZd1fE4ZYV8plIaiixMKD2S8HIcpQzeNj9H6K1zQ0HvlHixYh4KeiOHZcbm
	KCAutjVQfrqSo/n0FKJuFcxup3cPpyQ=
X-Google-Smtp-Source: AGHT+IFDmULsBHl9yMwJRJbGHgVNOKJAub6H9YT0BDzPSTc7XIU9hNIyfZX4Cm4lZOh8Lcspw1U0/w==
X-Received: by 2002:a17:907:96a2:b0:aa6:9198:75a6 with SMTP id a640c23a62f3a-ab75e23ea38mr444140866b.21.1738786185031;
        Wed, 05 Feb 2025 12:09:45 -0800 (PST)
Received: from f.. (cst-prg-95-94.cust.vodafone.cz. [46.135.95.94])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab703fbcc0csm932221866b.53.2025.02.05.12.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 12:09:44 -0800 (PST)
From: Mateusz Guzik <mjguzik@gmail.com>
To: ebiederm@xmission.com,
	oleg@redhat.com
Cc: brauner@kernel.org,
	akpm@linux-foundation.org,
	Liam.Howlett@oracle.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Mateusz Guzik <mjguzik@gmail.com>
Subject: [PATCH v5 4/5] pid: perform free_pid() calls outside of tasklist_lock
Date: Wed,  5 Feb 2025 21:09:28 +0100
Message-ID: <20250205200929.406568-5-mjguzik@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250205200929.406568-1-mjguzik@gmail.com>
References: <20250205200929.406568-1-mjguzik@gmail.com>
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

The pid array is smuggled through newly added release_task_post struct
so that any extra things want to get moved out have means to do it.

Reviewed-by: Oleg Nesterov <oleg@redhat.com>
Signed-off-by: Mateusz Guzik <mjguzik@gmail.com>
---
 include/linux/pid.h |  7 ++++---
 kernel/exit.c       | 27 +++++++++++++++++++--------
 kernel/pid.c        | 44 ++++++++++++++++++++++----------------------
 kernel/sys.c        | 14 +++++++++-----
 4 files changed, 54 insertions(+), 38 deletions(-)

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
index b5c0cbc6bdfb..0d6df671c8a8 100644
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

