Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E4E2701C3
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 07:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745478292; cv=none; b=LLtUPRvU90y7C+2oCxBcc7WJ7El8kfbia64NaR+meVf38QE1hBG+CCBtobqk0Y/lfT8xrG+wxyLK/Rk2WOqZUq8QacM5XoRUUcyebcr0diCvxEnYAw5mASGCKGuPUKrdzP/luPDXIrGedGa0TaHrCcRuMTNsvG6ZBi6jFOOFsOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745478292; c=relaxed/simple;
	bh=qNH4t9eG2CLNTL3eDk/F7+ms7mC2E/+0Kc61bZYFLgY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U1MIx7/0ua0je6tNGNK8gnuqemXDeldFQQKhEuRiCQDSm+Z49t4bilLbKvhr3NBtEXLvYgld446AxxWQcl+m9xWWrEUElpYjyDJVoXMVKpqIER8O449U2Q5n5tRUY9U08Ox9XDYVjO46SlD+7VxUTOj28NKrahoMuBNAadaY5Eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=R/v3jPd6; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="R/v3jPd6"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-22435603572so7422205ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 00:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745478290; x=1746083090; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WCK1VDbTpYWs4fLQMxD1y8TWj5o2Az5CqghWjMcs5ZI=;
        b=R/v3jPd6uWGG10UsLJjgCJonY1vxJBPfAvPbHElrII9JyBU+EGYHRQGU5a4/U8VZgD
         Q9YCKHWvDtcCkXduZczBIXBuogw9Hx090oHU6m4l9c4PB+GUUzr6hhgTlbD3fBURQvzZ
         Pky517RlDmy0KV+OaHgbyBwuxVyoZsfdYPqRY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745478290; x=1746083090;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WCK1VDbTpYWs4fLQMxD1y8TWj5o2Az5CqghWjMcs5ZI=;
        b=tndAPYK4WLh9LWDaxG+dCmfQMCbZ0f1J+G1hnW9NqVyTbip8a9Y/z3ygVZw6ziDMBe
         HLhuEasMpneOSiTURPt9iSnVCFcMqeqSFkt2vTviYRP10vF6ikD5fwfyA0t2g95mWZef
         C53J7xEudvBIy5nV856UEBG5XzXP1EejX8kuBUvuZqjlZd6DiHDVQrA3jDWjLPE7BxA0
         hcwKdtF6fi5UzXjSEKJe99pPUGuE7YqJLNmyPN8cK8mMFzGtRtXDAMGWtJ79r6ZCtYl3
         W/F6RksupBYPlYO98+Hc2+TtyvN1hJPr5yXIZC+kffOrUgtEX5kA2lfCAulPzf7uV3WJ
         PfSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWF5PIdBtS1gnJfKxz1ic3U56j20Mk+aGama3aysjnoFJnWq1FDQNdQeY1nImJNp/OfBWrPhzF6olXBl5o=@vger.kernel.org
X-Gm-Message-State: AOJu0YynGjDcL+bzhVp7/ncZoScGysN3xx3ghMU0ZhWkzB7iRlBqON0O
	TicdGBlfh2BVoy+Wsko/oihN379mUts1zgpR5VXXHYE3ZUWVF8JyXsmsSSU73g==
X-Gm-Gg: ASbGncs4m7/9zzkQa/9ChuIf7ENc1uD5VP4s9EBql/kx4V/yGp8XgbsooWH6AqY+ay1
	4VUDsLTZwRPxFsMunvRepfOjNVMAqwjCpJuYvmD+YOuMTDGG8z23huWrBvWpvOqytay7SZqypNS
	2Ca2+SONByNASjiBReLzOO+wRY8cS4R7TWGAuAohtkzYYcoZJDjCSq4Be1cyr62G4TA1rPZAoD/
	RokK+muXW03nsHygE4rncDNdomr4qrBZ7Vsnk4YCfoNt+c/ZkILGiPCaEHPtDu4OVSdnYChRIqJ
	WEJcHdlzzCDkNqZXXE4ddja+kV18Mv8m4cTefjey4P0eZyPjjXQh/dePvlHYQRnKaXE=
X-Google-Smtp-Source: AGHT+IEKl/rHf/wX/Rw7PguqNixe9Lyyac7D9EbeN9OaZPbTzu37q0zQNk6SXavakM90zItgiThP8g==
X-Received: by 2002:a17:902:c401:b0:224:2a6d:55ae with SMTP id d9443c01a7336-22db3db6f02mr21659045ad.48.1745478290186;
        Thu, 24 Apr 2025 00:04:50 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:63eb:6b38:399c:5ad7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4d76c80sm6010555ad.51.2025.04.24.00.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 00:04:49 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Tomasz Figa <tfiga@chromium.org>,
	Petr Mladek <pmladek@suse.com>,
	John Ogness <john.ogness@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH] hung_task: configurable hung-task stacktrace loglevel
Date: Thu, 24 Apr 2025 16:02:43 +0900
Message-ID: <20250424070436.2380215-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, hung-task watchdog uses two different loglevels
to report hung-tasks: a) KERN_INFO for all the important task
information (e.g. sched_show_task()) and b)  KERN_ERR for the
rest.  This makes it a little inconvenient, especially for
automated kernel logs parsing.

Introduce CONFIG_HUNG_TASK_STACKTRACE_LOGLEVEL so that (a)
becomes configurable.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 include/linux/sched/debug.h |  1 +
 kernel/hung_task.c          |  6 ++++--
 kernel/sched/core.c         | 19 +++++++++++++------
 lib/Kconfig.debug           |  8 ++++++++
 4 files changed, 26 insertions(+), 8 deletions(-)

diff --git a/include/linux/sched/debug.h b/include/linux/sched/debug.h
index 35ed4577a6cc..80c17cdd35a8 100644
--- a/include/linux/sched/debug.h
+++ b/include/linux/sched/debug.h
@@ -34,6 +34,7 @@ extern void show_stack(struct task_struct *task, unsigned long *sp,
 		       const char *loglvl);
 
 extern void sched_show_task(struct task_struct *p);
+extern void sched_show_task_log_lvl(struct task_struct *p, const char *lvl);
 
 struct seq_file;
 extern void proc_sched_show_task(struct task_struct *p,
diff --git a/kernel/hung_task.c b/kernel/hung_task.c
index d2432df2b905..8817016fd45b 100644
--- a/kernel/hung_task.c
+++ b/kernel/hung_task.c
@@ -26,6 +26,8 @@
 
 #include <trace/events/sched.h>
 
+#define PR_LEVEL KERN_SOH __stringify(CONFIG_HUNG_TASK_STACKTRACE_LOGLEVEL)
+
 /*
  * The number of tasks checked:
  */
@@ -153,7 +155,7 @@ static void debug_show_blocker(struct task_struct *task)
 			       task->comm, task->pid, t->comm, t->pid);
 			break;
 		}
-		sched_show_task(t);
+		sched_show_task_log_lvl(t, PR_LEVEL);
 		return;
 	}
 }
@@ -221,7 +223,7 @@ static void check_hung_task(struct task_struct *t, unsigned long timeout)
 			pr_err("      Blocked by coredump.\n");
 		pr_err("\"echo 0 > /proc/sys/kernel/hung_task_timeout_secs\""
 			" disables this message.\n");
-		sched_show_task(t);
+		sched_show_task_log_lvl(t, PR_LEVEL);
 		debug_show_blocker(t);
 		hung_task_show_lock = true;
 
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 54e7d63f7785..e9033b049092 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -7751,7 +7751,7 @@ void __sched io_schedule(void)
 }
 EXPORT_SYMBOL(io_schedule);
 
-void sched_show_task(struct task_struct *p)
+void sched_show_task_log_lvl(struct task_struct *p, const char *lvl)
 {
 	unsigned long free;
 	int ppid;
@@ -7759,7 +7759,8 @@ void sched_show_task(struct task_struct *p)
 	if (!try_get_task_stack(p))
 		return;
 
-	pr_info("task:%-15.15s state:%c", p->comm, task_state_to_char(p));
+	printk("%stask:%-15.15s state:%c", lvl,
+	       p->comm, task_state_to_char(p));
 
 	if (task_is_running(p))
 		pr_cont("  running task    ");
@@ -7773,12 +7774,18 @@ void sched_show_task(struct task_struct *p)
 		free, task_pid_nr(p), task_tgid_nr(p),
 		ppid, p->flags, read_task_thread_flags(p));
 
-	print_worker_info(KERN_INFO, p);
-	print_stop_info(KERN_INFO, p);
-	print_scx_info(KERN_INFO, p);
-	show_stack(p, NULL, KERN_INFO);
+	print_worker_info(lvl, p);
+	print_stop_info(lvl, p);
+	print_scx_info(lvl, p);
+	show_stack(p, NULL, lvl);
 	put_task_stack(p);
 }
+EXPORT_SYMBOL_GPL(sched_show_task_log_lvl);
+
+void sched_show_task(struct task_struct *p)
+{
+	sched_show_task_log_lvl(p, KERN_INFO);
+}
 EXPORT_SYMBOL_GPL(sched_show_task);
 
 static inline bool
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 3e40f68a4a4f..6cd266651447 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -1290,6 +1290,14 @@ config DETECT_HUNG_TASK_BLOCKER
 	  This will add overhead a bit but shows suspicious tasks and
 	  call trace if it comes from waiting a mutex.
 
+config HUNG_TASK_STACKTRACE_LOGLEVEL
+	int "Log-level for hung task stacktrace (1-7)"
+	depends on DETECT_HUNG_TASK
+	default "6"
+	help
+	  This option controls the log-level used to print the stacktrace
+	  of the hung task. The default is 6 (KERN_INFO).
+
 config WQ_WATCHDOG
 	bool "Detect Workqueue Stalls"
 	depends on DEBUG_KERNEL
-- 
2.49.0.805.g082f7c87e0-goog

