Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8365B26E145
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 15:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744642859; cv=none; b=UYT3XEWVYC2v5n0Ao4MMdtWG9KCXyETX/LlJBwMAcE6dNBseMN7vAY9Si2ZzbaMLcndw3SGF/Yyp/PKsBKX+4pgp/yBJU562ITuNcbwpxhRzyEMUCZA1/HrivcHUnl5deXtEdre5YYsLQtLNtVCsLnTC4ZHeL+eIqgjKLNMQENQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744642859; c=relaxed/simple;
	bh=B43gw/pvNCm9wYYpNY4ahXqWAEz2mi5JcHkFKZZTftc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qdye5EY+TmVGymQr+iBx7rFv2aWtfzonrRWj1OK97k+e7Y5KZCSZb01VB+O7YkhwPY2K7TBGkaPjSX1qAmsuUKxU7vxOXSVHKfhuisZlEj/BlbwST3DhvgfMdPTvr6RQixNx0hcXksxDVSbeqZvDT0/dLFp3G4v/nSzVreaczyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O4C9eouu; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O4C9eouu"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7376dd56eccso4517438b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 08:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744642857; x=1745247657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jtGjQprUlB3VG+vn5RU8c/zMOflC6GG2zqiCRX8eJBE=;
        b=O4C9eouupLl6rQ9fWbMw0S9YumsYh7jcbOorqUFTs9Q3UZbO3v8Qbvfa6nRc+6t/xl
         417e4naeaisLKlrtchfCTldgC6bL9nGtOcuDWbrRpklV20/NGpyRFHbOE8Hx4P30ChGa
         xqaez84I6WaeYOHtXTEbuLuKvNImb0ZnIv5y4E7s2IU4QIztVfuyVxbGsO7nhjhXZH0R
         dwoqcVdtBge3DAgOULKO6ZQrJbffI+Pcka6JgVbqFXJ6yxOHgHb0luAd5SK73Y/+eoIY
         OEQQWdGlQd1Er5nKQYJA5eJuSsNSnoZfXp/XSEkPo0w6LbO54Yczor+zK+OeLyT5jJKX
         Sf9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744642857; x=1745247657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jtGjQprUlB3VG+vn5RU8c/zMOflC6GG2zqiCRX8eJBE=;
        b=LlsBrk1n5wZNARsbtfuA9HA2zsKXDDgdd89RfGT8eHj+lrV/X5u0Q4+nwD2Qvvll+Y
         pUbMlOyDkIpmoRDisMSotqJxNUS8vuV8x068mbItgzb2N6ZynFMX7h2HDWmQgc9tbf8B
         M2XLFEjNUUbp/wyyhPzlArTgUqPPREaut0m56gIVsnhWV2gahAgZ7d9t23Rs6Ak9vyDR
         YO/5zw1d8MbqSHFXO8+H1X1FcjmNdj12xPx3gn7NlxjvR0QL5OGC/PCdlzSX9svrnr+N
         AnhZnPGJG8E8gtK1EOqYmXlT6ZwjCblTK+9KFFUFeSJcWkScjO9b5puXwGVXj2JZwreG
         K3Tw==
X-Forwarded-Encrypted: i=1; AJvYcCV1Mt7CgnVUgqN+2Me2uXTq9ds1iHgF85raS3ofLuvA/d4H/yQoWCh4Vz1X1ORXqg2ueXMGbyaj0/LAElY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzsx/sfcJoMXvEch4jeQyZp8HFW3SqT2WR+B+FBezKcLQDDBmiU
	n1sEMiBbhrfewdYb7OYM63Z6N04AHyWeKjd3cBQ3UfVDPR8j4UA0De2F/zIb
X-Gm-Gg: ASbGncuvm7QtqKY0K4wNBIKaMJZZBHJcbgD5OQXJcJOm7HQgeMwOSfCK8/4AkfRmyJB
	Y1FdiSHXrFIXMeqzysZDVqXgVQl68phI32aa5LxMFlHnF/JgOON+amWRs32InJq4CW3rCV5kwZo
	S5Z+iFlklk1Lds9lkOXt1ZHB08jOMZmjGz1Y5iDMaJ1Ewx6L84rcyREWzanuhgBQbJB+QGB9XwX
	6sUMfIltuujUTKWrTEQ9kGiYmQaaYrRZ0C4vjUc0b5ItdY13X+JBOrznemb5KfDhixqKYVL0pX0
	sfOxwQlaQ0CcMFHwEl+QJJLIQXqUGpsZVGscChffydEqV4gN
X-Google-Smtp-Source: AGHT+IH7w1gytwCVm2IXXaZ5t6thw3ZnI2dyQJi5PJ6uI6wOshH+z+aq/NgVSQKEySPVfPh97OndkA==
X-Received: by 2002:a05:6a00:392a:b0:736:ab49:a6e4 with SMTP id d2e1a72fcca58-73bd11b4f98mr15928611b3a.1.1744642856397;
        Mon, 14 Apr 2025 08:00:56 -0700 (PDT)
Received: from localhost.localdomain ([43.129.202.66])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21e0b95sm6726329b3a.82.2025.04.14.08.00.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Apr 2025 08:00:56 -0700 (PDT)
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
Subject: [PATCH v5 1/3] hung_task: replace blocker_mutex with encoded blocker
Date: Mon, 14 Apr 2025 22:59:43 +0800
Message-ID: <20250414145945.84916-2-ioworker0@gmail.com>
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

This patch replaces 'struct mutex *blocker_mutex' with 'unsigned long
blocker', as only one blocker is active at a time.

The blocker filed can store both the lock addrees and the lock type, with
LSB used to encode the type as Masami suggested, making it easier to extend
the feature to cover other types of locks.

Also, once the lock type is determined, we can directly extract the address
and cast it to a lock pointer ;)

Suggested-by: Andrew Morton <akpm@linux-foundation.org>
Suggested-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Signed-off-by: Mingzhe Yang <mingzhe.yang@ly.com>
Signed-off-by: Lance Yang <ioworker0@gmail.com>
Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
---
 include/linux/hung_task.h | 99 +++++++++++++++++++++++++++++++++++++++
 include/linux/sched.h     |  6 ++-
 kernel/hung_task.c        | 13 +++--
 kernel/locking/mutex.c    |  5 +-
 4 files changed, 115 insertions(+), 8 deletions(-)
 create mode 100644 include/linux/hung_task.h

diff --git a/include/linux/hung_task.h b/include/linux/hung_task.h
new file mode 100644
index 000000000000..1bc2b3244613
--- /dev/null
+++ b/include/linux/hung_task.h
@@ -0,0 +1,99 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Detect Hung Task: detecting tasks stuck in D state
+ *
+ * Copyright (C) 2025 Tongcheng Travel (www.ly.com)
+ * Author: Lance Yang <mingzhe.yang@ly.com>
+ */
+#ifndef __LINUX_HUNG_TASK_H
+#define __LINUX_HUNG_TASK_H
+
+#include <linux/bug.h>
+#include <linux/sched.h>
+#include <linux/compiler.h>
+
+/*
+ * @blocker: Combines lock address and blocking type.
+ *
+ * Since lock pointers are at least 4-byte aligned(32-bit) or 8-byte
+ * aligned(64-bit). This leaves the 2 least bits (LSBs) of the pointer
+ * always zero. So we can use these bits to encode the specific blocking
+ * type.
+ *
+ * Type encoding:
+ * 00 - Blocked on mutex        (BLOCKER_TYPE_MUTEX)
+ * 01 - Blocked on semaphore    (BLOCKER_TYPE_SEM)
+ * 10 - Blocked on rt-mutex     (BLOCKER_TYPE_RTMUTEX)
+ * 11 - Blocked on rw-semaphore (BLOCKER_TYPE_RWSEM)
+ */
+#define BLOCKER_TYPE_MUTEX      0x00UL
+#define BLOCKER_TYPE_SEM        0x01UL
+#define BLOCKER_TYPE_RTMUTEX    0x02UL
+#define BLOCKER_TYPE_RWSEM      0x03UL
+
+#define BLOCKER_TYPE_MASK       0x03UL
+
+#ifdef CONFIG_DETECT_HUNG_TASK_BLOCKER
+static inline void hung_task_set_blocker(void *lock, unsigned long type)
+{
+	unsigned long lock_ptr = (unsigned long)lock;
+
+	WARN_ON_ONCE(!lock_ptr);
+	WARN_ON_ONCE(READ_ONCE(current->blocker));
+
+	/*
+	 * If the lock pointer matches the BLOCKER_TYPE_MASK, return
+	 * without writing anything.
+	 */
+	if (WARN_ON_ONCE(lock_ptr & BLOCKER_TYPE_MASK))
+		return;
+
+	WRITE_ONCE(current->blocker, lock_ptr | type);
+}
+
+static inline void hung_task_clear_blocker(void)
+{
+	WARN_ON_ONCE(!READ_ONCE(current->blocker));
+
+	WRITE_ONCE(current->blocker, 0UL);
+}
+
+/*
+ * hung_task_get_blocker_type - Extracts blocker type from encoded blocker
+ * address.
+ *
+ * @blocker: Blocker pointer with encoded type (via LSB bits)
+ *
+ * Returns: BLOCKER_TYPE_MUTEX, BLOCKER_TYPE_SEM, etc.
+ */
+static inline unsigned long hung_task_get_blocker_type(unsigned long blocker)
+{
+	WARN_ON_ONCE(!blocker);
+
+	return blocker & BLOCKER_TYPE_MASK;
+}
+
+static inline void *hung_task_blocker_to_lock(unsigned long blocker)
+{
+	WARN_ON_ONCE(!blocker);
+
+	return (void *)(blocker & ~BLOCKER_TYPE_MASK);
+}
+#else
+static inline void hung_task_set_blocker(void *lock, unsigned long type)
+{
+}
+static inline void hung_task_clear_blocker(void)
+{
+}
+static inline unsigned long hung_task_get_blocker_type(unsigned long blocker)
+{
+	return 0UL;
+}
+static inline void *hung_task_blocker_to_lock(unsigned long blocker)
+{
+	return NULL;
+}
+#endif
+
+#endif /* __LINUX_HUNG_TASK_H */
diff --git a/include/linux/sched.h b/include/linux/sched.h
index 1419d94c8e87..27dad9aa99a0 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -1218,7 +1218,11 @@ struct task_struct {
 #endif
 
 #ifdef CONFIG_DETECT_HUNG_TASK_BLOCKER
-	struct mutex			*blocker_mutex;
+	/*
+	 * Encoded lock address causing task block (lower 2 bits = type from
+	 * <linux/hung_task.h>). Accessed via hung_task_*() helpers.
+	 */
+	unsigned long			blocker;
 #endif
 
 #ifdef CONFIG_DEBUG_ATOMIC_SLEEP
diff --git a/kernel/hung_task.c b/kernel/hung_task.c
index dc898ec93463..79558d76ef06 100644
--- a/kernel/hung_task.c
+++ b/kernel/hung_task.c
@@ -22,6 +22,7 @@
 #include <linux/sched/signal.h>
 #include <linux/sched/debug.h>
 #include <linux/sched/sysctl.h>
+#include <linux/hung_task.h>
 
 #include <trace/events/sched.h>
 
@@ -98,16 +99,18 @@ static struct notifier_block panic_block = {
 static void debug_show_blocker(struct task_struct *task)
 {
 	struct task_struct *g, *t;
-	unsigned long owner;
-	struct mutex *lock;
+	unsigned long owner, blocker;
 
 	RCU_LOCKDEP_WARN(!rcu_read_lock_held(), "No rcu lock held");
 
-	lock = READ_ONCE(task->blocker_mutex);
-	if (!lock)
+	blocker = READ_ONCE(task->blocker);
+	if (!blocker ||
+	    hung_task_get_blocker_type(blocker) != BLOCKER_TYPE_MUTEX)
 		return;
 
-	owner = mutex_get_owner(lock);
+	owner = mutex_get_owner(
+		(struct mutex *)hung_task_blocker_to_lock(blocker));
+
 	if (unlikely(!owner)) {
 		pr_err("INFO: task %s:%d is blocked on a mutex, but the owner is not found.\n",
 			task->comm, task->pid);
diff --git a/kernel/locking/mutex.c b/kernel/locking/mutex.c
index 6a543c204a14..e9ef70a6cb5f 100644
--- a/kernel/locking/mutex.c
+++ b/kernel/locking/mutex.c
@@ -29,6 +29,7 @@
 #include <linux/interrupt.h>
 #include <linux/debug_locks.h>
 #include <linux/osq_lock.h>
+#include <linux/hung_task.h>
 
 #define CREATE_TRACE_POINTS
 #include <trace/events/lock.h>
@@ -189,7 +190,7 @@ __mutex_add_waiter(struct mutex *lock, struct mutex_waiter *waiter,
 		   struct list_head *list)
 {
 #ifdef CONFIG_DETECT_HUNG_TASK_BLOCKER
-	WRITE_ONCE(current->blocker_mutex, lock);
+	hung_task_set_blocker(lock, BLOCKER_TYPE_MUTEX);
 #endif
 	debug_mutex_add_waiter(lock, waiter, current);
 
@@ -207,7 +208,7 @@ __mutex_remove_waiter(struct mutex *lock, struct mutex_waiter *waiter)
 
 	debug_mutex_remove_waiter(lock, waiter, current);
 #ifdef CONFIG_DETECT_HUNG_TASK_BLOCKER
-	WRITE_ONCE(current->blocker_mutex, NULL);
+	hung_task_clear_blocker();
 #endif
 }
 
-- 
2.49.0

