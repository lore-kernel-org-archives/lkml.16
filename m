Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928352690FE
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 10:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744626197; cv=none; b=Tbb4kZhElY9ASJbvB3pXxm7gCKVyD03S927XEOZd3zDHHyU24XykHrZvFwo6AxqO82mQzaUPO2ZUlMa+eTmq9M66nP4a7WT0fgNYoNYXrtuX3EW4uehtvfP6IoAvaxGFoV+Lb+THkcFw1fgnUlvX9qzYRw6ljcTGxqeqJR7sosM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744626197; c=relaxed/simple;
	bh=CQZP4OvmfS/oQjJGSYdOdpJjiZ3qlk/tdq7XNcHzGaU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UT9XeUe9/gt36xg8QlBcTBLN8BfPoPhluUzt2lH3Z2rQgOCCRDhZjBVoELax44BV+1Sr1yaJ2noDVe4NrntZcTbGkS4pVvY3G7s/fSjS4CmuHFsdd2+UCrOhsdC+IBOwfUoGBLmrWzsFFdbnLyj1g06EeIuXc/5khqSc673MVuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uraz8ayi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uraz8ayi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4344EC4CEED;
	Mon, 14 Apr 2025 10:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744626196;
	bh=CQZP4OvmfS/oQjJGSYdOdpJjiZ3qlk/tdq7XNcHzGaU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uraz8ayiJOj4SYMOL7NSrGBJUxi/jaXMUF+hiVVrZSNtSFwjWp5XI1XfCIyjm4AFw
	 LRAFVgQrbGMOEZvsJLK/+YyXBjueBaVFfPTjrPqwSb7qtGI8liy37+a9AxZEKPIYZJ
	 n9B4VUriIf5LXP/INw7vpbXkP3UYGDOqif/aU2W2I2Px0hgtLoY12XIFuIQ4UGowYB
	 KMO5eql6tTk/z9GccSQpapAvZ5UYcxxD8cniyyWQc0w5JteGl4+xk6cK4Cjl3Fdppm
	 x+4QBzus42OFvWAWBCecrYY3bIBNUFEkHRe/8UWVkusu+6aq/haZCeLzunVeVrVPqi
	 CCG1g1SeHhDqA==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 03/17] treewide, timers: Rename add_timer_global() => timer_add_global()
Date: Mon, 14 Apr 2025 12:22:37 +0200
Message-ID: <20250414102301.332225-4-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250414102301.332225-1-mingo@kernel.org>
References: <20250414102301.332225-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move this API to the canonical timer_*() namespace.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 include/linux/timer.h | 2 +-
 kernel/time/timer.c   | 8 ++++----
 kernel/workqueue.c    | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/linux/timer.h b/include/linux/timer.h
index 10596d7c3a34..d35d3f27a987 100644
--- a/include/linux/timer.h
+++ b/include/linux/timer.h
@@ -160,7 +160,7 @@ extern int timer_reduce(struct timer_list *timer, unsigned long expires);
 
 extern void add_timer(struct timer_list *timer);
 extern void add_timer_local(struct timer_list *timer);
-extern void add_timer_global(struct timer_list *timer);
+extern void timer_add_global(struct timer_list *timer);
 
 extern int try_to_del_timer_sync(struct timer_list *timer);
 extern int timer_delete_sync(struct timer_list *timer);
diff --git a/kernel/time/timer.c b/kernel/time/timer.c
index 4d915c0a263c..47165b16380a 100644
--- a/kernel/time/timer.c
+++ b/kernel/time/timer.c
@@ -1310,21 +1310,21 @@ void add_timer_local(struct timer_list *timer)
 EXPORT_SYMBOL(add_timer_local);
 
 /**
- * add_timer_global() - Start a timer without TIMER_PINNED flag set
+ * timer_add_global() - Start a timer without TIMER_PINNED flag set
  * @timer:	The timer to be started
  *
  * Same as add_timer() except that the timer flag TIMER_PINNED is unset.
  *
  * See add_timer() for further details.
  */
-void add_timer_global(struct timer_list *timer)
+void timer_add_global(struct timer_list *timer)
 {
 	if (WARN_ON_ONCE(timer_pending(timer)))
 		return;
 	timer->flags &= ~TIMER_PINNED;
 	__mod_timer(timer, timer->expires, MOD_TIMER_NOTPENDING);
 }
-EXPORT_SYMBOL(add_timer_global);
+EXPORT_SYMBOL(timer_add_global);
 
 /**
  * add_timer_on - Start a timer on a particular CPU
@@ -1333,7 +1333,7 @@ EXPORT_SYMBOL(add_timer_global);
  *
  * Same as add_timer() except that it starts the timer on the given CPU and
  * the TIMER_PINNED flag is set. When timer shouldn't be a pinned timer in
- * the next round, add_timer_global() should be used instead as it unsets
+ * the next round, timer_add_global() should be used instead as it unsets
  * the TIMER_PINNED flag.
  *
  * See add_timer() for further details.
diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index cf6203282737..b0e53d3e56c7 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -2523,7 +2523,7 @@ static void __queue_delayed_work(int cpu, struct workqueue_struct *wq,
 		add_timer_on(timer, cpu);
 	} else {
 		if (likely(cpu == WORK_CPU_UNBOUND))
-			add_timer_global(timer);
+			timer_add_global(timer);
 		else
 			add_timer_on(timer, cpu);
 	}
-- 
2.45.2

