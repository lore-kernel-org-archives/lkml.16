Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37951CAA9D
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 16:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738427500; cv=none; b=VR678YGb6gsaoPqvpdD9R/fpqI5q70GtgtTJi9N4JoCZb22mpemqMGAbqeSK6v7JR21KwOB634bYfC3s2ebvySTIOYM5HXGC6BVf+fFLKNBNzueGqeHfQ3Ijrg3KFAqWZIm3XVoe8I5ChOPdg4su0H5fYaf3B0VMKGGGq3wHeOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738427500; c=relaxed/simple;
	bh=C8s0Xb9NhS5ua26k3JymOms2OQn46XAZzDAtSAivs6A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MO0yWQXzC9vtQ2XQmVE9To4G2dCVlLOxVet6kLp+cKNb+CDI7ODl47TsOQlyaPes6+jBTuK/jlUs7ezApNwOwx2gvvS1C+r1yMyTurI0gr3t/Mb7dv3/4DL9Gm/RFzCwl7WXsLkDMLaHm7d1M5gwlWWBGenQhKn/4ld7k1eT4vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AUoVLGwE; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AUoVLGwE"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5d41848901bso5765788a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 01 Feb 2025 08:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738427497; x=1739032297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9gAV0esEOMPqj1wMAKXBZQiiLf9TUFsrr9mzaYygi1E=;
        b=AUoVLGwEPVHkcNI8UvVz2ksv1crdS/lsrF8Pr0kEZr4jgGCp1O/DYkKNps8nbYn3CH
         YYWX/GHGlmK6DSklrp0hc2Woh1NjIURrAUxG43aBnKWI9QhLAbCNhzo6NA9y2AS/dxyM
         Mq750JKICs5BrRWNnMZrqf3D5q+cV31Inyl7TPDm5nMbJamxYJDQsGjn0/KH9dpK2hNB
         Hq64SJ0WQOKiPxq8Ao2sprR5QYYXVkgrVpI+2yrJYXxWcxUg8jphHfqJvhnQEiSNSmic
         5c+BDfm+6Gz+7eCjEMH+l0as1N6ZP0MOVcdGeBrEog8p8ehP7Zo6Kd3L+mMR0OcsaCam
         Z7Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738427497; x=1739032297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9gAV0esEOMPqj1wMAKXBZQiiLf9TUFsrr9mzaYygi1E=;
        b=SkNMb69NzgA3AZkwQLOp+Qq6samSEW2AZv+RIsTLuQjSONeQtKQ5Kjn+h7jV15vrhh
         my/SNuM83RWdQg5Vq/6K2hhTvpFlM9qIvaduHLAqWkXFMCzcAchj7Xm+EqqhLhxYLSkE
         q92bUbTPGyLCK6g5UHjlQ6zeQ8TCTu82H/uJwQgoxmo3q99UyQy5xdBDkJYRhUvC+bHQ
         LT3BCnLOSt3Gk/6+9cJk9NSPETK9dQAfGPHqECGQeWuPuLBmBGj26iYrmjbqGJ5zPNDS
         lq7KHwfH8TjDJJjoZ+HaqFX1SSHw8Aj3LnNkGcuwc1M5aiu1n4FqK8mbxIUBmULVuoA0
         EWrg==
X-Forwarded-Encrypted: i=1; AJvYcCUXMXLoWcAQC/YQoy04557a+XLqTwe9jjnZwsTkwYM7wMTkDufMKesqS34ak00aXOJbt51wWAV9/m2QEKQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd6nV+murYiv1oyy/t0O0gTY8v5ghGyD/vBmzVo5K/GXm5KBR8
	8JEXWWbiRN7mLDYPIdykF+yqTThVRfxyshZebbM4YnbCNDmNBqJ7
X-Gm-Gg: ASbGncuvWf0GSitYjnI7swPGRNy494W26WjuoFuOk6WKcG6HTLEzdKZrda8Zdk3QegT
	oxaYS2pAB8Y5TL8uuFqJrgvhySvf4HGt48zsssDMYeQB7SX4j/VoDQRwg02LLsQ+eOT13KDJR+z
	oQYwX0Xnsdd5TY0U7RGJqRGOye5egIRDomAexEfyA0Gb4OhKlmUhKAElfj+VAYaUmq6ax8cD3Y9
	zzHz/EbSFLEaq29HF9wTU6/91iQL8rsA3BG6hY1d5JNNNVJrr5dkwVIAT2lpwqChBOYK/XI9IRD
	4Rz7me8Lgr5ps0AI22wylpJdEW1EMqrvNw==
X-Google-Smtp-Source: AGHT+IF4wAmURNewahoQOVfYM6M5jXjyc6eKsbposvu/SCSkZtrKzenFnpL1jbA6kPR8ePzJ8PJdEw==
X-Received: by 2002:a05:6402:847:b0:5dc:783e:3efe with SMTP id 4fb4d7f45d1cf-5dc7fbb58ebmr8188423a12.6.1738427496993;
        Sat, 01 Feb 2025 08:31:36 -0800 (PST)
Received: from f.. (cst-prg-25-223.cust.vodafone.cz. [46.135.25.223])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc723cff72sm4636959a12.15.2025.02.01.08.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 08:31:36 -0800 (PST)
From: Mateusz Guzik <mjguzik@gmail.com>
To: ebiederm@xmission.com,
	oleg@redhat.com
Cc: brauner@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Mateusz Guzik <mjguzik@gmail.com>
Subject: [PATCH v3 5/6] pid: perform free_pid() calls outside of tasklist_lock
Date: Sat,  1 Feb 2025 17:31:05 +0100
Message-ID: <20250201163106.28912-6-mjguzik@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250201163106.28912-1-mjguzik@gmail.com>
References: <20250201163106.28912-1-mjguzik@gmail.com>
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

Signed-off-by: Mateusz Guzik <mjguzik@gmail.com>
---
 include/linux/pid.h |  7 ++++---
 kernel/exit.c       | 15 +++++++++------
 kernel/pid.c        | 44 ++++++++++++++++++++++----------------------
 kernel/sys.c        | 14 +++++++++-----
 4 files changed, 44 insertions(+), 36 deletions(-)

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
index d2c74f93f7d2..a90a0d159570 100644
--- a/kernel/exit.c
+++ b/kernel/exit.c
@@ -127,16 +127,18 @@ late_initcall(kernel_exit_sysfs_init);
  */
 struct release_task_post {
 	struct tty_struct *tty;
+	struct pid *pids[PIDTYPE_MAX];
 };
 
-static void __unhash_process(struct task_struct *p, bool group_dead)
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
@@ -200,7 +202,7 @@ static void __exit_signal(struct release_task_post *post, struct task_struct *ts
 	task_io_accounting_add(&sig->ioac, &tsk->ioac);
 	sig->sum_sched_runtime += tsk->se.sum_exec_runtime;
 	sig->nr_threads--;
-	__unhash_process(tsk, group_dead);
+	__unhash_process(post, tsk, group_dead);
 	write_sequnlock(&sig->stats_lock);
 
 	/*
@@ -285,6 +287,7 @@ void release_task(struct task_struct *p)
 	put_pid(thread_pid);
 	add_device_randomness((const void*) &p->se.sum_exec_runtime,
 			      sizeof(unsigned long long));
+	free_pids(post.pids);
 	release_thread(p);
 	put_task_struct_rcu_user(p);
 	tty_kref_put(post.tty);
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

