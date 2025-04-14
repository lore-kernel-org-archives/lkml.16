Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C45A27A102
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 15:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744642864; cv=none; b=qHMgJJ4pI+XAox/58YAngRLnFBAHe0g6GMWgfJJkorAd9u2H+ZWo7/mx8kqC0TAzdOp/rt7e/51BnangngEQDS9uGHUTr+w0l38R5J1EFZRb6dgjnDwM1511UwJIawcZkRsfB2fBFHcD1r94h5FdWClIjDheD20e4r//fgSuuGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744642864; c=relaxed/simple;
	bh=IipyfSY4OQ0uD8QDotK2r8pQQoJcdHVSy1S1n2S8HnU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OFoQEXfhd3D55VsZZepCqdgwKZHP+eMC0G7l+Y/x1jqQTBNqbbT8PO15h0+kAgS8MxL1m7wJJfeEaQTjEopk3C2jp1bVyqDllHssOyoqifn3C5rQp031dOFRf7eYr/ndVWe/evwehOZGjCHRENwR8nI34UH6ZM5+resMSLf5vdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h0jaeHCP; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h0jaeHCP"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22401f4d35aso50313545ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 08:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744642861; x=1745247661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vEhJyyZGr8mPABG1oRg5/ws5Nit95LvsCMKYdCwGE4o=;
        b=h0jaeHCPyjd5o38ADZlmfCnj7/WV61a4Im3TuaGpL0zqLSgEZPMbD7PDOpdVtFgxNo
         0FpLPlkekrluZyzQORIm79MuP8BMnUejwDnNS0e+1TsjrTaSGX6yLZeqjA1stZX0lGPo
         NPYNwL+2xvnfMQspxUbvI8n4GEkohkpveK0jMOkMdyFHPRoY+58nup/arksEelpCwnyr
         qtTSns72jdc/+lLVn129l9fVcGVrOJ2gziC0a60h3vafTSXpQQjztlcIXfIw4d78ktPB
         ScPKcmpLszXu3uGPRmXMEMZpN2M79FtisgurgKANfeYCOz8I2h2MJsNrMJ4Gf6XXZUVs
         Zm6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744642861; x=1745247661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vEhJyyZGr8mPABG1oRg5/ws5Nit95LvsCMKYdCwGE4o=;
        b=O7aJCv+MUyCn1m1jRt4Ky0Cfip864mBXzbgtlBf6jW0yjWxzHbYmeJDKT0WmImcd1g
         Qg4rn3CGVDRpaBQ/5mU7Y+D/oNz31YJIXP8aPSif+NFIfSju4cTlEh4Y3piJxD+bk4KB
         LXOrwFV3hTV6KPnXDptGcXbgqNibnLivaA1CSf8nUyWC+NuZ8DM+kPlxiPvQFQ9JzWzx
         JgT3j3onxtTFHhJm1s0jYG0mB4oqyZ0U1DHPvZsy4Q2WquMPnvQOGl+213F+f3XHM5vT
         pgUFCxzkeCLuFCE/BWt/Z2TWaiRSrpeeRZXGucpClnOp7T0Ber0jO8VTkHOCE6Jfiwfp
         hmVA==
X-Forwarded-Encrypted: i=1; AJvYcCW+4KUBp1LSMIi2d69t9bTRuoAPyYfqe0ajuzZf3DxBrf1Mj9H7/aHiFveg1KuTeSwV+kovcXVsuEk0Bmc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzawOok1y29nsjRNxVjW8cVU58uUF+7ABXyh5kC2YQYlUY14oXo
	suFIKKKgAAoNiAqxyD2AKe8CTsomY0N0TIER9LyvUsc4jdokMVKL
X-Gm-Gg: ASbGncvjqcFyI1APyAKDOEL8UTVIUdGbNWlxt0iUdS0/hxnSVZYM7dIQKJYN13DNcM2
	ybiqRH79COoxUKURVi4+9WtBlCZsyHvz068Ff/7ntfdtHgEJ1md7UmraBpqUkaEXkSQxwGyG1kR
	njteLG/ZJzuLRcHHV/NXL8Xjj0fqEvnqviwUypw2yD3y+g89jjUks23my2HedQOm/ZPfIjaqtBf
	1rrfsLiX3Or3Qu2vpBvxWY+kL6xzdqVwdCFJKEcX675jCfT1Mg8LdL275rJA5NPnFjKkWiP3dn1
	POhGIiZ/5wP0IMDaPUMbd7PAKVmiOVslqO2PWc1o8YeeGmjC
X-Google-Smtp-Source: AGHT+IH0swiL9S4oJx33H0R3/3ictOmt6SiSWaB4JnTk1npX56z9D5lv0eA4PQjbdtnkY142Hc6niA==
X-Received: by 2002:a17:902:c408:b0:224:1220:7f40 with SMTP id d9443c01a7336-22bea495917mr164449305ad.3.1744642860934;
        Mon, 14 Apr 2025 08:01:00 -0700 (PDT)
Received: from localhost.localdomain ([43.129.202.66])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21e0b95sm6726329b3a.82.2025.04.14.08.00.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Apr 2025 08:01:00 -0700 (PDT)
From: Lance Yang <ioworker0@gmail.com>
To: akpm@linux-foundation.org
Cc: will@kernel.org,
	peterz@infradead.org,
	mingo@redhat.com,
	longman@redhat.com,
	mhiramat@kernel.org,
	anna.schumaker@oracle.com,
	boqun.feng@gmail.com,
	joel.granados@kernel.org,
	kent.overstreet@linux.dev,
	leonylgao@tencent.com,
	linux-kernel@vger.kernel.org,
	rostedt@goodmis.org,
	senozhatsky@chromium.org,
	tfiga@chromium.org,
	amaindex@outlook.com,
	jstultz@google.com,
	Lance Yang <ioworker0@gmail.com>,
	Mingzhe Yang <mingzhe.yang@ly.com>
Subject: [PATCH v5 2/3] hung_task: show the blocker task if the task is hung on semaphore
Date: Mon, 14 Apr 2025 22:59:44 +0800
Message-ID: <20250414145945.84916-3-ioworker0@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250414145945.84916-1-ioworker0@gmail.com>
References: <20250414145945.84916-1-ioworker0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Inspired by mutex blocker tracking[1], this patch makes a trade-off to
balance the overhead and utility of the hung task detector.

Unlike mutexes, semaphores lack explicit ownership tracking, making it
challenging to identify the root cause of hangs. To address this, we
introduce a last_holder field to the semaphore structure, which is
updated when a task successfully calls down() and cleared during up().

The assumption is that if a task is blocked on a semaphore, the holders
must not have released it. While this does not guarantee that the last
holder is one of the current blockers, it likely provides a practical hint
for diagnosing semaphore-related stalls.

With this change, the hung task detector can now show blocker task's info
like below:

[Tue Apr  8 12:19:07 2025] INFO: task cat:945 blocked for more than 120 seconds.
[Tue Apr  8 12:19:07 2025]       Tainted: G            E      6.14.0-rc6+ #1
[Tue Apr  8 12:19:07 2025] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[Tue Apr  8 12:19:07 2025] task:cat             state:D stack:0     pid:945   tgid:945   ppid:828    task_flags:0x400000 flags:0x00000000
[Tue Apr  8 12:19:07 2025] Call Trace:
[Tue Apr  8 12:19:07 2025]  <TASK>
[Tue Apr  8 12:19:07 2025]  __schedule+0x491/0xbd0
[Tue Apr  8 12:19:07 2025]  schedule+0x27/0xf0
[Tue Apr  8 12:19:07 2025]  schedule_timeout+0xe3/0xf0
[Tue Apr  8 12:19:07 2025]  ? __folio_mod_stat+0x2a/0x80
[Tue Apr  8 12:19:07 2025]  ? set_ptes.constprop.0+0x27/0x90
[Tue Apr  8 12:19:07 2025]  __down_common+0x155/0x280
[Tue Apr  8 12:19:07 2025]  down+0x53/0x70
[Tue Apr  8 12:19:07 2025]  read_dummy_semaphore+0x23/0x60
[Tue Apr  8 12:19:07 2025]  full_proxy_read+0x5f/0xa0
[Tue Apr  8 12:19:07 2025]  vfs_read+0xbc/0x350
[Tue Apr  8 12:19:07 2025]  ? __count_memcg_events+0xa5/0x140
[Tue Apr  8 12:19:07 2025]  ? count_memcg_events.constprop.0+0x1a/0x30
[Tue Apr  8 12:19:07 2025]  ? handle_mm_fault+0x180/0x260
[Tue Apr  8 12:19:07 2025]  ksys_read+0x66/0xe0
[Tue Apr  8 12:19:07 2025]  do_syscall_64+0x51/0x120
[Tue Apr  8 12:19:07 2025]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[Tue Apr  8 12:19:07 2025] RIP: 0033:0x7f419478f46e
[Tue Apr  8 12:19:07 2025] RSP: 002b:00007fff1c4d2668 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
[Tue Apr  8 12:19:07 2025] RAX: ffffffffffffffda RBX: 0000000000020000 RCX: 00007f419478f46e
[Tue Apr  8 12:19:07 2025] RDX: 0000000000020000 RSI: 00007f4194683000 RDI: 0000000000000003
[Tue Apr  8 12:19:07 2025] RBP: 00007f4194683000 R08: 00007f4194682010 R09: 0000000000000000
[Tue Apr  8 12:19:07 2025] R10: fffffffffffffbc5 R11: 0000000000000246 R12: 0000000000000000
[Tue Apr  8 12:19:07 2025] R13: 0000000000000003 R14: 0000000000020000 R15: 0000000000020000
[Tue Apr  8 12:19:07 2025]  </TASK>
[Tue Apr  8 12:19:07 2025] INFO: task cat:945 blocked on a semaphore likely last held by task cat:938
[Tue Apr  8 12:19:07 2025] task:cat             state:S stack:0     pid:938   tgid:938   ppid:584    task_flags:0x400000 flags:0x00000000
[Tue Apr  8 12:19:07 2025] Call Trace:
[Tue Apr  8 12:19:07 2025]  <TASK>
[Tue Apr  8 12:19:07 2025]  __schedule+0x491/0xbd0
[Tue Apr  8 12:19:07 2025]  ? _raw_spin_unlock_irqrestore+0xe/0x40
[Tue Apr  8 12:19:07 2025]  schedule+0x27/0xf0
[Tue Apr  8 12:19:07 2025]  schedule_timeout+0x77/0xf0
[Tue Apr  8 12:19:07 2025]  ? __pfx_process_timeout+0x10/0x10
[Tue Apr  8 12:19:07 2025]  msleep_interruptible+0x49/0x60
[Tue Apr  8 12:19:07 2025]  read_dummy_semaphore+0x2d/0x60
[Tue Apr  8 12:19:07 2025]  full_proxy_read+0x5f/0xa0
[Tue Apr  8 12:19:07 2025]  vfs_read+0xbc/0x350
[Tue Apr  8 12:19:07 2025]  ? __count_memcg_events+0xa5/0x140
[Tue Apr  8 12:19:07 2025]  ? count_memcg_events.constprop.0+0x1a/0x30
[Tue Apr  8 12:19:07 2025]  ? handle_mm_fault+0x180/0x260
[Tue Apr  8 12:19:07 2025]  ksys_read+0x66/0xe0
[Tue Apr  8 12:19:07 2025]  do_syscall_64+0x51/0x120
[Tue Apr  8 12:19:07 2025]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[Tue Apr  8 12:19:07 2025] RIP: 0033:0x7f7c584a646e
[Tue Apr  8 12:19:07 2025] RSP: 002b:00007ffdba8ce158 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
[Tue Apr  8 12:19:07 2025] RAX: ffffffffffffffda RBX: 0000000000020000 RCX: 00007f7c584a646e
[Tue Apr  8 12:19:07 2025] RDX: 0000000000020000 RSI: 00007f7c5839a000 RDI: 0000000000000003
[Tue Apr  8 12:19:07 2025] RBP: 00007f7c5839a000 R08: 00007f7c58399010 R09: 0000000000000000
[Tue Apr  8 12:19:07 2025] R10: fffffffffffffbc5 R11: 0000000000000246 R12: 0000000000000000
[Tue Apr  8 12:19:07 2025] R13: 0000000000000003 R14: 0000000000020000 R15: 0000000000020000
[Tue Apr  8 12:19:07 2025]  </TASK>

[1] https://lore.kernel.org/all/174046694331.2194069.15472952050240807469.stgit@mhiramat.tok.corp.google.com

Suggested-by: Andrew Morton <akpm@linux-foundation.org>
Suggested-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Signed-off-by: Mingzhe Yang <mingzhe.yang@ly.com>
Signed-off-by: Lance Yang <ioworker0@gmail.com>
Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
---
 include/linux/semaphore.h  | 15 +++++++++-
 kernel/hung_task.c         | 52 ++++++++++++++++++++++++++--------
 kernel/locking/semaphore.c | 57 ++++++++++++++++++++++++++++++++++----
 3 files changed, 106 insertions(+), 18 deletions(-)

diff --git a/include/linux/semaphore.h b/include/linux/semaphore.h
index 04655faadc2d..89706157e622 100644
--- a/include/linux/semaphore.h
+++ b/include/linux/semaphore.h
@@ -16,13 +16,25 @@ struct semaphore {
 	raw_spinlock_t		lock;
 	unsigned int		count;
 	struct list_head	wait_list;
+
+#ifdef CONFIG_DETECT_HUNG_TASK_BLOCKER
+	unsigned long		last_holder;
+#endif
 };
 
+#ifdef CONFIG_DETECT_HUNG_TASK_BLOCKER
+#define __LAST_HOLDER_SEMAPHORE_INITIALIZER				\
+	, .last_holder = 0UL
+#else
+#define __LAST_HOLDER_SEMAPHORE_INITIALIZER
+#endif
+
 #define __SEMAPHORE_INITIALIZER(name, n)				\
 {									\
 	.lock		= __RAW_SPIN_LOCK_UNLOCKED((name).lock),	\
 	.count		= n,						\
-	.wait_list	= LIST_HEAD_INIT((name).wait_list),		\
+	.wait_list	= LIST_HEAD_INIT((name).wait_list)		\
+	__LAST_HOLDER_SEMAPHORE_INITIALIZER				\
 }
 
 /*
@@ -47,5 +59,6 @@ extern int __must_check down_killable(struct semaphore *sem);
 extern int __must_check down_trylock(struct semaphore *sem);
 extern int __must_check down_timeout(struct semaphore *sem, long jiffies);
 extern void up(struct semaphore *sem);
+extern unsigned long sem_last_holder(struct semaphore *sem);
 
 #endif /* __LINUX_SEMAPHORE_H */
diff --git a/kernel/hung_task.c b/kernel/hung_task.c
index 79558d76ef06..d2432df2b905 100644
--- a/kernel/hung_task.c
+++ b/kernel/hung_task.c
@@ -99,32 +99,62 @@ static struct notifier_block panic_block = {
 static void debug_show_blocker(struct task_struct *task)
 {
 	struct task_struct *g, *t;
-	unsigned long owner, blocker;
+	unsigned long owner, blocker, blocker_type;
 
 	RCU_LOCKDEP_WARN(!rcu_read_lock_held(), "No rcu lock held");
 
 	blocker = READ_ONCE(task->blocker);
-	if (!blocker ||
-	    hung_task_get_blocker_type(blocker) != BLOCKER_TYPE_MUTEX)
+	if (!blocker)
 		return;
 
-	owner = mutex_get_owner(
-		(struct mutex *)hung_task_blocker_to_lock(blocker));
+	blocker_type = hung_task_get_blocker_type(blocker);
+
+	switch (blocker_type) {
+	case BLOCKER_TYPE_MUTEX:
+		owner = mutex_get_owner(
+			(struct mutex *)hung_task_blocker_to_lock(blocker));
+		break;
+	case BLOCKER_TYPE_SEM:
+		owner = sem_last_holder(
+			(struct semaphore *)hung_task_blocker_to_lock(blocker));
+		break;
+	default:
+		WARN_ON_ONCE(1);
+		return;
+	}
+
 
 	if (unlikely(!owner)) {
-		pr_err("INFO: task %s:%d is blocked on a mutex, but the owner is not found.\n",
-			task->comm, task->pid);
+		switch (blocker_type) {
+		case BLOCKER_TYPE_MUTEX:
+			pr_err("INFO: task %s:%d is blocked on a mutex, but the owner is not found.\n",
+			       task->comm, task->pid);
+			break;
+		case BLOCKER_TYPE_SEM:
+			pr_err("INFO: task %s:%d is blocked on a semaphore, but the last holder is not found.\n",
+			       task->comm, task->pid);
+			break;
+		}
 		return;
 	}
 
 	/* Ensure the owner information is correct. */
 	for_each_process_thread(g, t) {
-		if ((unsigned long)t == owner) {
+		if ((unsigned long)t != owner)
+			continue;
+
+		switch (blocker_type) {
+		case BLOCKER_TYPE_MUTEX:
 			pr_err("INFO: task %s:%d is blocked on a mutex likely owned by task %s:%d.\n",
-				task->comm, task->pid, t->comm, t->pid);
-			sched_show_task(t);
-			return;
+			       task->comm, task->pid, t->comm, t->pid);
+			break;
+		case BLOCKER_TYPE_SEM:
+			pr_err("INFO: task %s:%d blocked on a semaphore likely last held by task %s:%d\n",
+			       task->comm, task->pid, t->comm, t->pid);
+			break;
 		}
+		sched_show_task(t);
+		return;
 	}
 }
 #else
diff --git a/kernel/locking/semaphore.c b/kernel/locking/semaphore.c
index 34bfae72f295..db8a8f696f50 100644
--- a/kernel/locking/semaphore.c
+++ b/kernel/locking/semaphore.c
@@ -33,6 +33,7 @@
 #include <linux/spinlock.h>
 #include <linux/ftrace.h>
 #include <trace/events/lock.h>
+#include <linux/hung_task.h>
 
 static noinline void __down(struct semaphore *sem);
 static noinline int __down_interruptible(struct semaphore *sem);
@@ -40,6 +41,41 @@ static noinline int __down_killable(struct semaphore *sem);
 static noinline int __down_timeout(struct semaphore *sem, long timeout);
 static noinline void __up(struct semaphore *sem);
 
+#ifdef CONFIG_DETECT_HUNG_TASK_BLOCKER
+static inline void hung_task_sem_set_holder(struct semaphore *sem)
+{
+	WRITE_ONCE((sem)->last_holder, (unsigned long)current);
+}
+
+static inline void hung_task_sem_clear_if_holder(struct semaphore *sem)
+{
+	if (READ_ONCE((sem)->last_holder) == (unsigned long)current)
+		WRITE_ONCE((sem)->last_holder, 0UL);
+}
+
+unsigned long sem_last_holder(struct semaphore *sem)
+{
+	return READ_ONCE(sem->last_holder);
+}
+#else
+static inline void hung_task_sem_set_holder(struct semaphore *sem)
+{
+}
+static inline void hung_task_sem_clear_if_holder(struct semaphore *sem)
+{
+}
+unsigned long sem_last_holder(struct semaphore *sem)
+{
+	return 0UL;
+}
+#endif
+
+static inline void __sem_acquire(struct semaphore *sem)
+{
+	sem->count--;
+	hung_task_sem_set_holder(sem);
+}
+
 /**
  * down - acquire the semaphore
  * @sem: the semaphore to be acquired
@@ -58,7 +94,7 @@ void __sched down(struct semaphore *sem)
 	might_sleep();
 	raw_spin_lock_irqsave(&sem->lock, flags);
 	if (likely(sem->count > 0))
-		sem->count--;
+		__sem_acquire(sem);
 	else
 		__down(sem);
 	raw_spin_unlock_irqrestore(&sem->lock, flags);
@@ -82,7 +118,7 @@ int __sched down_interruptible(struct semaphore *sem)
 	might_sleep();
 	raw_spin_lock_irqsave(&sem->lock, flags);
 	if (likely(sem->count > 0))
-		sem->count--;
+		__sem_acquire(sem);
 	else
 		result = __down_interruptible(sem);
 	raw_spin_unlock_irqrestore(&sem->lock, flags);
@@ -109,7 +145,7 @@ int __sched down_killable(struct semaphore *sem)
 	might_sleep();
 	raw_spin_lock_irqsave(&sem->lock, flags);
 	if (likely(sem->count > 0))
-		sem->count--;
+		__sem_acquire(sem);
 	else
 		result = __down_killable(sem);
 	raw_spin_unlock_irqrestore(&sem->lock, flags);
@@ -139,7 +175,7 @@ int __sched down_trylock(struct semaphore *sem)
 	raw_spin_lock_irqsave(&sem->lock, flags);
 	count = sem->count - 1;
 	if (likely(count >= 0))
-		sem->count = count;
+		__sem_acquire(sem);
 	raw_spin_unlock_irqrestore(&sem->lock, flags);
 
 	return (count < 0);
@@ -164,7 +200,7 @@ int __sched down_timeout(struct semaphore *sem, long timeout)
 	might_sleep();
 	raw_spin_lock_irqsave(&sem->lock, flags);
 	if (likely(sem->count > 0))
-		sem->count--;
+		__sem_acquire(sem);
 	else
 		result = __down_timeout(sem, timeout);
 	raw_spin_unlock_irqrestore(&sem->lock, flags);
@@ -185,6 +221,9 @@ void __sched up(struct semaphore *sem)
 	unsigned long flags;
 
 	raw_spin_lock_irqsave(&sem->lock, flags);
+
+	hung_task_sem_clear_if_holder(sem);
+
 	if (likely(list_empty(&sem->wait_list)))
 		sem->count++;
 	else
@@ -224,8 +263,10 @@ static inline int __sched ___down_common(struct semaphore *sem, long state,
 		raw_spin_unlock_irq(&sem->lock);
 		timeout = schedule_timeout(timeout);
 		raw_spin_lock_irq(&sem->lock);
-		if (waiter.up)
+		if (waiter.up) {
+			hung_task_sem_set_holder(sem);
 			return 0;
+		}
 	}
 
  timed_out:
@@ -242,10 +283,14 @@ static inline int __sched __down_common(struct semaphore *sem, long state,
 {
 	int ret;
 
+	hung_task_set_blocker(sem, BLOCKER_TYPE_SEM);
+
 	trace_contention_begin(sem, 0);
 	ret = ___down_common(sem, state, timeout);
 	trace_contention_end(sem, ret);
 
+	hung_task_clear_blocker();
+
 	return ret;
 }
 
-- 
2.49.0

