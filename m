Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD87F21D3C9
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 07:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751009402; cv=none; b=M9LA4J3aLcl8po9Qa1VLl9vywDTSNGWydKAGJQrtLI/5dswl0UggkdAT8VYtWJySsAfH+onJ9GFX8N+5D0U6OItI3xB7T6OvDlxUtoIpmeffvPhnQN+X5h3oBGthLwNDn7xB+g+NyWJXBPHVFInNc9i+ys+stVCDSbTZLSMQiOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751009402; c=relaxed/simple;
	bh=upp2XMMSzydYHE6K9Q/3J5VDUWJ4aO4qTCokV6k89qw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SSwEd5Lff65qxwokd/+eJiR4ML4K/+CZTQkbOCIcaDXOLj4t09PCIRjDHqWvVhrlXzZjZIQ2AdstfZcJCNI/Jd8nvfvWbcHjFFzOvRM56odIfvYFccuCXsvsYM21yeTHG3HPZdhQnf+KkgfiZrdlD+tp+eaFHL4XEuMcYHI6SJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UqpkvF8L; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UqpkvF8L"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a536ecbf6fso1035495f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 00:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751009398; x=1751614198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=frViLy0H+mcv5Vd2p65vOchSjpU8NXW7W8lMsYCNBFw=;
        b=UqpkvF8LxAHDX04piBtsNvM0EZ2fbpELjtnZxVzi6PQxOIdHbirFFGAgVttZxSHdXF
         xrJWgU6Zjl4Qf/fPmM+1ZsVgsR9hOIXSBsHPzJoy6yGMOwR9GNanHZTj9yeHna0cackU
         6sx5kFMGXuFDspWQ6utzOGwU2CwzIMH2/HI/Wbz4WFWczaxeGRV6IL8emvehywRIX29G
         X4KymKxLIY0diqh57hG4QUNiqZhFP5GJnHACErLMskDiUOlODyUeQI6RTnDaXHCPRbdj
         EqHrIRtUOkRt19q1BD5L9Rv7SlzuMDcHlC6fvcrpYycx69qD+c35wcqnxLB7WBP78ObF
         8jaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751009398; x=1751614198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=frViLy0H+mcv5Vd2p65vOchSjpU8NXW7W8lMsYCNBFw=;
        b=cEmgRRHPy+ZOBBn1kGB5NFI8pxSNTMnLBDu9lEc7t/pPH/mGOsS05OVX7mvjloyDpy
         LB78jSEcdv6ZP+KW1VEhJUMrfyTwNF2XHfOluZY7k/gDn9/V/yPaJxYt8V8pcHR3mngi
         hnfBxE0Km4UccdjzdorNdQ93hrbLfye127UIgXFuC//WVzg98LC6jIdmN+UZFl5xK22Q
         SnwJKyXLv9/AiRhb6bSgh4NjSU4qhlvwzWaLSgoZyXFfmnkBCwzzd3ATBSosx3CS4j9h
         UvH+ft02ILegofpKNkWrZw/0uOvYf+93zFrlkQSNhLjOMwQtZMwHAM6g/vmCLz/CiUwh
         zo+g==
X-Forwarded-Encrypted: i=1; AJvYcCVMSol6vcpzP5j89vuiqgEpADt4Xu2FBfmi03uHVADVMGgN6to/sMzL/kXjHzzYlaG0fNVT8EizaAwe+C8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxgzw29rveLRfCMoxo/cguxjXI8O6ELohlkGP84m4ZdmkxSt50R
	eo2zq0yZy8VKEb0Z8W5kmBlz5bMydFvjnYP6wp9dETW8Xr1b06YCdBAE
X-Gm-Gg: ASbGnctS1ZCcJtfQ8AP5M7ypMxt6qVIlJVsrCztzJmsUfnlWpVCytmVsm+aiaz95pOG
	IXG4g5s7WHS138Gw0a88jokB1B+F23ogCNbsLQauHYmgezdeTQjK6cU68hCsnMA1EA7nGqenYeK
	2WAVTyBUSBa25aQ7wIAemJuUQqem7xTwzaaYqLCvKa7W/Bf0/qHU7a1RWz5SUHL8790okzrgr6R
	kO1vgigfBGA7KWrgwXuDK5GaHyaKcOcEbcD/Q8ALLzRLNhW4jzS410+b3FM1ir+zLo1UZeVas3U
	xoqafQWDhwchwqSupwcVrADRYDKDniULJuSXJnyymNP3aSpf
X-Google-Smtp-Source: AGHT+IE9uEGFp1zc0imGlKPcumD/KOulw91C2XL3gMaggE949OJic2VxzPk9dCh3aR+aapVEjrDUUw==
X-Received: by 2002:a05:6000:2307:b0:3a6:d145:e2cc with SMTP id ffacd0b85a97d-3a8fdff46e4mr1961474f8f.15.1751009397879;
        Fri, 27 Jun 2025 00:29:57 -0700 (PDT)
Received: from EBJ9932692.tcent.cn ([2a09:0:1:2::302c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7e72b6sm1955665f8f.15.2025.06.27.00.29.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Jun 2025 00:29:57 -0700 (PDT)
From: Lance Yang <ioworker0@gmail.com>
X-Google-Original-From: Lance Yang <lance.yang@linux.dev>
To: akpm@linux-foundation.org
Cc: zi.li@linux.dev,
	anna.schumaker@oracle.com,
	boqun.feng@gmail.com,
	joel.granados@kernel.org,
	jstultz@google.com,
	kent.overstreet@linux.dev,
	leonylgao@tencent.com,
	linux-kernel@vger.kernel.org,
	longman@redhat.com,
	mhiramat@kernel.org,
	mingo@redhat.com,
	mingzhe.yang@ly.com,
	peterz@infradead.org,
	rostedt@goodmis.org,
	senozhatsky@chromium.org,
	tfiga@chromium.org,
	will@kernel.org,
	Lance Yang <lance.yang@linux.dev>
Subject: [PATCH 2/3] hung_task: extend hung task blocker tracking to rwsems
Date: Fri, 27 Jun 2025 15:29:23 +0800
Message-ID: <20250627072924.36567-3-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250627072924.36567-1-lance.yang@linux.dev>
References: <20250627072924.36567-1-lance.yang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lance Yang <lance.yang@linux.dev>

Inspired by mutex blocker tracking[1], and having already extended it to
semaphores, let's now add support for reader-writer semaphores (rwsems).

The approach is simple: when a task enters TASK_UNINTERRUPTIBLE while
waiting for an rwsem, we just call hung_task_set_blocker(). The hung task
detector can then query the rwsem's owner to identify the lock holder.

Tracking works reliably for writers, as there can only be a single writer
holding the lock, and its task struct is stored in the owner field.

The main challenge lies with readers. The owner field points to only one
of many concurrent readers, so we might lose track of the blocker if that
specific reader unlocks, even while others remain. This is not a
significant issue, however. In practice, long-lasting lock contention is
almost always caused by a writer. Therefore, reliably tracking the writer
is the primary goal of this patch series ;)

With this change, the hung task detector can now show blocker task's info
like below:

[Fri Jun 27 15:21:34 2025] INFO: task cat:28631 blocked for more than 122 seconds.
[Fri Jun 27 15:21:34 2025]       Tainted: G S                  6.16.0-rc3 #8
[Fri Jun 27 15:21:34 2025] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[Fri Jun 27 15:21:34 2025] task:cat             state:D stack:0     pid:28631 tgid:28631 ppid:28501  task_flags:0x400000 flags:0x00004000
[Fri Jun 27 15:21:34 2025] Call Trace:
[Fri Jun 27 15:21:34 2025]  <TASK>
[Fri Jun 27 15:21:34 2025]  __schedule+0x7c7/0x1930
[Fri Jun 27 15:21:34 2025]  ? __pfx___schedule+0x10/0x10
[Fri Jun 27 15:21:34 2025]  ? policy_nodemask+0x215/0x340
[Fri Jun 27 15:21:34 2025]  ? _raw_spin_lock_irq+0x8a/0xe0
[Fri Jun 27 15:21:34 2025]  ? __pfx__raw_spin_lock_irq+0x10/0x10
[Fri Jun 27 15:21:34 2025]  schedule+0x6a/0x180
[Fri Jun 27 15:21:34 2025]  schedule_preempt_disabled+0x15/0x30
[Fri Jun 27 15:21:34 2025]  rwsem_down_read_slowpath+0x55e/0xe10
[Fri Jun 27 15:21:34 2025]  ? __pfx_rwsem_down_read_slowpath+0x10/0x10
[Fri Jun 27 15:21:34 2025]  ? __pfx___might_resched+0x10/0x10
[Fri Jun 27 15:21:34 2025]  down_read+0xc9/0x230
[Fri Jun 27 15:21:34 2025]  ? __pfx_down_read+0x10/0x10
[Fri Jun 27 15:21:34 2025]  ? __debugfs_file_get+0x14d/0x700
[Fri Jun 27 15:21:34 2025]  ? __pfx___debugfs_file_get+0x10/0x10
[Fri Jun 27 15:21:34 2025]  ? handle_pte_fault+0x52a/0x710
[Fri Jun 27 15:21:34 2025]  ? selinux_file_permission+0x3a9/0x590
[Fri Jun 27 15:21:34 2025]  read_dummy_rwsem_read+0x4a/0x90
[Fri Jun 27 15:21:34 2025]  full_proxy_read+0xff/0x1c0
[Fri Jun 27 15:21:34 2025]  ? rw_verify_area+0x6d/0x410
[Fri Jun 27 15:21:34 2025]  vfs_read+0x177/0xa50
[Fri Jun 27 15:21:34 2025]  ? __pfx_vfs_read+0x10/0x10
[Fri Jun 27 15:21:34 2025]  ? fdget_pos+0x1cf/0x4c0
[Fri Jun 27 15:21:34 2025]  ksys_read+0xfc/0x1d0
[Fri Jun 27 15:21:34 2025]  ? __pfx_ksys_read+0x10/0x10
[Fri Jun 27 15:21:34 2025]  do_syscall_64+0x66/0x2d0
[Fri Jun 27 15:21:34 2025]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[Fri Jun 27 15:21:34 2025] RIP: 0033:0x7f3f8faefb40
[Fri Jun 27 15:21:34 2025] RSP: 002b:00007ffdeda5ab98 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
[Fri Jun 27 15:21:34 2025] RAX: ffffffffffffffda RBX: 0000000000010000 RCX: 00007f3f8faefb40
[Fri Jun 27 15:21:34 2025] RDX: 0000000000010000 RSI: 00000000010fa000 RDI: 0000000000000003
[Fri Jun 27 15:21:34 2025] RBP: 00000000010fa000 R08: 0000000000000000 R09: 0000000000010fff
[Fri Jun 27 15:21:34 2025] R10: 00007ffdeda59fe0 R11: 0000000000000246 R12: 00000000010fa000
[Fri Jun 27 15:21:34 2025] R13: 0000000000000003 R14: 0000000000000000 R15: 0000000000000fff
[Fri Jun 27 15:21:34 2025]  </TASK>
[Fri Jun 27 15:21:34 2025] INFO: task cat:28631 <reader> blocked on an rw-semaphore likely owned by task cat:28630 <writer>
[Fri Jun 27 15:21:34 2025] task:cat             state:S stack:0     pid:28630 tgid:28630 ppid:28501  task_flags:0x400000 flags:0x00004000
[Fri Jun 27 15:21:34 2025] Call Trace:
[Fri Jun 27 15:21:34 2025]  <TASK>
[Fri Jun 27 15:21:34 2025]  __schedule+0x7c7/0x1930
[Fri Jun 27 15:21:34 2025]  ? __pfx___schedule+0x10/0x10
[Fri Jun 27 15:21:34 2025]  ? __mod_timer+0x304/0xa80
[Fri Jun 27 15:21:34 2025]  schedule+0x6a/0x180
[Fri Jun 27 15:21:34 2025]  schedule_timeout+0xfb/0x230
[Fri Jun 27 15:21:34 2025]  ? __pfx_schedule_timeout+0x10/0x10
[Fri Jun 27 15:21:34 2025]  ? __pfx_process_timeout+0x10/0x10
[Fri Jun 27 15:21:34 2025]  ? down_write+0xc4/0x140
[Fri Jun 27 15:21:34 2025]  msleep_interruptible+0xbe/0x150
[Fri Jun 27 15:21:34 2025]  read_dummy_rwsem_write+0x54/0x90
[Fri Jun 27 15:21:34 2025]  full_proxy_read+0xff/0x1c0
[Fri Jun 27 15:21:34 2025]  ? rw_verify_area+0x6d/0x410
[Fri Jun 27 15:21:34 2025]  vfs_read+0x177/0xa50
[Fri Jun 27 15:21:34 2025]  ? __pfx_vfs_read+0x10/0x10
[Fri Jun 27 15:21:34 2025]  ? fdget_pos+0x1cf/0x4c0
[Fri Jun 27 15:21:34 2025]  ksys_read+0xfc/0x1d0
[Fri Jun 27 15:21:34 2025]  ? __pfx_ksys_read+0x10/0x10
[Fri Jun 27 15:21:34 2025]  do_syscall_64+0x66/0x2d0
[Fri Jun 27 15:21:34 2025]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[Fri Jun 27 15:21:34 2025] RIP: 0033:0x7f8f288efb40
[Fri Jun 27 15:21:34 2025] RSP: 002b:00007ffffb631038 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
[Fri Jun 27 15:21:34 2025] RAX: ffffffffffffffda RBX: 0000000000010000 RCX: 00007f8f288efb40
[Fri Jun 27 15:21:34 2025] RDX: 0000000000010000 RSI: 000000002a4b5000 RDI: 0000000000000003
[Fri Jun 27 15:21:34 2025] RBP: 000000002a4b5000 R08: 0000000000000000 R09: 0000000000010fff
[Fri Jun 27 15:21:34 2025] R10: 00007ffffb630460 R11: 0000000000000246 R12: 000000002a4b5000
[Fri Jun 27 15:21:34 2025] R13: 0000000000000003 R14: 0000000000000000 R15: 0000000000000fff
[Fri Jun 27 15:21:34 2025]  </TASK>

[1] https://lore.kernel.org/all/174046694331.2194069.15472952050240807469.stgit@mhiramat.tok.corp.google.com/

Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Suggested-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Signed-off-by: Lance Yang <lance.yang@linux.dev>
---
 include/linux/hung_task.h | 18 +++++++++---------
 kernel/hung_task.c        | 29 +++++++++++++++++++++++++----
 kernel/locking/rwsem.c    | 17 ++++++++++++++++-
 3 files changed, 50 insertions(+), 14 deletions(-)

diff --git a/include/linux/hung_task.h b/include/linux/hung_task.h
index 1bc2b3244613..34e615c76ca5 100644
--- a/include/linux/hung_task.h
+++ b/include/linux/hung_task.h
@@ -21,17 +21,17 @@
  * type.
  *
  * Type encoding:
- * 00 - Blocked on mutex        (BLOCKER_TYPE_MUTEX)
- * 01 - Blocked on semaphore    (BLOCKER_TYPE_SEM)
- * 10 - Blocked on rt-mutex     (BLOCKER_TYPE_RTMUTEX)
- * 11 - Blocked on rw-semaphore (BLOCKER_TYPE_RWSEM)
+ * 00 - Blocked on mutex			(BLOCKER_TYPE_MUTEX)
+ * 01 - Blocked on semaphore			(BLOCKER_TYPE_SEM)
+ * 10 - Blocked on rw-semaphore as READER	(BLOCKER_TYPE_RWSEM_READER)
+ * 11 - Blocked on rw-semaphore as WRITER	(BLOCKER_TYPE_RWSEM_WRITER)
  */
-#define BLOCKER_TYPE_MUTEX      0x00UL
-#define BLOCKER_TYPE_SEM        0x01UL
-#define BLOCKER_TYPE_RTMUTEX    0x02UL
-#define BLOCKER_TYPE_RWSEM      0x03UL
+#define BLOCKER_TYPE_MUTEX		0x00UL
+#define BLOCKER_TYPE_SEM		0x01UL
+#define BLOCKER_TYPE_RWSEM_READER	0x02UL
+#define BLOCKER_TYPE_RWSEM_WRITER	0x03UL
 
-#define BLOCKER_TYPE_MASK       0x03UL
+#define BLOCKER_TYPE_MASK		0x03UL
 
 #ifdef CONFIG_DETECT_HUNG_TASK_BLOCKER
 static inline void hung_task_set_blocker(void *lock, unsigned long type)
diff --git a/kernel/hung_task.c b/kernel/hung_task.c
index d2432df2b905..8708a1205f82 100644
--- a/kernel/hung_task.c
+++ b/kernel/hung_task.c
@@ -23,6 +23,7 @@
 #include <linux/sched/debug.h>
 #include <linux/sched/sysctl.h>
 #include <linux/hung_task.h>
+#include <linux/rwsem.h>
 
 #include <trace/events/sched.h>
 
@@ -100,6 +101,7 @@ static void debug_show_blocker(struct task_struct *task)
 {
 	struct task_struct *g, *t;
 	unsigned long owner, blocker, blocker_type;
+	const char *rwsem_blocked_by, *rwsem_blocked_as;
 
 	RCU_LOCKDEP_WARN(!rcu_read_lock_held(), "No rcu lock held");
 
@@ -111,12 +113,20 @@ static void debug_show_blocker(struct task_struct *task)
 
 	switch (blocker_type) {
 	case BLOCKER_TYPE_MUTEX:
-		owner = mutex_get_owner(
-			(struct mutex *)hung_task_blocker_to_lock(blocker));
+		owner = mutex_get_owner(hung_task_blocker_to_lock(blocker));
 		break;
 	case BLOCKER_TYPE_SEM:
-		owner = sem_last_holder(
-			(struct semaphore *)hung_task_blocker_to_lock(blocker));
+		owner = sem_last_holder(hung_task_blocker_to_lock(blocker));
+		break;
+	case BLOCKER_TYPE_RWSEM_READER:
+	case BLOCKER_TYPE_RWSEM_WRITER:
+		owner = (unsigned long)rwsem_owner(
+					hung_task_blocker_to_lock(blocker));
+		rwsem_blocked_as = (blocker_type == BLOCKER_TYPE_RWSEM_READER) ?
+					"reader" : "writer";
+		rwsem_blocked_by = is_rwsem_reader_owned(
+					hung_task_blocker_to_lock(blocker)) ?
+					"reader" : "writer";
 		break;
 	default:
 		WARN_ON_ONCE(1);
@@ -134,6 +144,11 @@ static void debug_show_blocker(struct task_struct *task)
 			pr_err("INFO: task %s:%d is blocked on a semaphore, but the last holder is not found.\n",
 			       task->comm, task->pid);
 			break;
+		case BLOCKER_TYPE_RWSEM_READER:
+		case BLOCKER_TYPE_RWSEM_WRITER:
+			pr_err("INFO: task %s:%d is blocked on an rw-semaphore, but the owner is not found.\n",
+			       task->comm, task->pid);
+			break;
 		}
 		return;
 	}
@@ -152,6 +167,12 @@ static void debug_show_blocker(struct task_struct *task)
 			pr_err("INFO: task %s:%d blocked on a semaphore likely last held by task %s:%d\n",
 			       task->comm, task->pid, t->comm, t->pid);
 			break;
+		case BLOCKER_TYPE_RWSEM_READER:
+		case BLOCKER_TYPE_RWSEM_WRITER:
+			pr_err("INFO: task %s:%d <%s> blocked on an rw-semaphore likely owned by task %s:%d <%s>\n",
+			       task->comm, task->pid, rwsem_blocked_as, t->comm,
+			       t->pid, rwsem_blocked_by);
+			break;
 		}
 		sched_show_task(t);
 		return;
diff --git a/kernel/locking/rwsem.c b/kernel/locking/rwsem.c
index a310eb9896de..92c6332da401 100644
--- a/kernel/locking/rwsem.c
+++ b/kernel/locking/rwsem.c
@@ -27,6 +27,7 @@
 #include <linux/export.h>
 #include <linux/rwsem.h>
 #include <linux/atomic.h>
+#include <linux/hung_task.h>
 #include <trace/events/lock.h>
 
 #ifndef CONFIG_PREEMPT_RT
@@ -1065,10 +1066,13 @@ rwsem_down_read_slowpath(struct rw_semaphore *sem, long count, unsigned int stat
 		wake_up_q(&wake_q);
 
 	trace_contention_begin(sem, LCB_F_READ);
+	set_current_state(state);
+
+	if (state == TASK_UNINTERRUPTIBLE)
+		hung_task_set_blocker(sem, BLOCKER_TYPE_RWSEM_READER);
 
 	/* wait to be given the lock */
 	for (;;) {
-		set_current_state(state);
 		if (!smp_load_acquire(&waiter.task)) {
 			/* Matches rwsem_mark_wake()'s smp_store_release(). */
 			break;
@@ -1083,8 +1087,12 @@ rwsem_down_read_slowpath(struct rw_semaphore *sem, long count, unsigned int stat
 		}
 		schedule_preempt_disabled();
 		lockevent_inc(rwsem_sleep_reader);
+		set_current_state(state);
 	}
 
+	if (state == TASK_UNINTERRUPTIBLE)
+		hung_task_clear_blocker();
+
 	__set_current_state(TASK_RUNNING);
 	lockevent_inc(rwsem_rlock);
 	trace_contention_end(sem, 0);
@@ -1146,6 +1154,9 @@ rwsem_down_write_slowpath(struct rw_semaphore *sem, int state)
 	set_current_state(state);
 	trace_contention_begin(sem, LCB_F_WRITE);
 
+	if (state == TASK_UNINTERRUPTIBLE)
+		hung_task_set_blocker(sem, BLOCKER_TYPE_RWSEM_WRITER);
+
 	for (;;) {
 		if (rwsem_try_write_lock(sem, &waiter)) {
 			/* rwsem_try_write_lock() implies ACQUIRE on success */
@@ -1179,6 +1190,10 @@ rwsem_down_write_slowpath(struct rw_semaphore *sem, int state)
 trylock_again:
 		raw_spin_lock_irq(&sem->wait_lock);
 	}
+
+	if (state == TASK_UNINTERRUPTIBLE)
+		hung_task_clear_blocker();
+
 	__set_current_state(TASK_RUNNING);
 	raw_spin_unlock_irq(&sem->wait_lock);
 	lockevent_inc(rwsem_wlock);
-- 
2.49.0

