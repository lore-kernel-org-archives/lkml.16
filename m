Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C082472BE
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748419884; cv=none; b=KpmrhY+o4oAtMDwcPzacqm5JH8e7TAebPEs4OKLEWZuEbPju4kDkvuRllviIKdivcQZz3Fen9wIzryUnf5xPQ/pWdp1U+IyK6nh4VX/PTqHdSOUTZWYRh8h7Y6SRbv43K3f5+UA1er4colXeAtmvwicH87TZ5b3hRXrLPxm6g6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748419884; c=relaxed/simple;
	bh=MU+eHvbyChE4Bc8+8rbhPS5TvW+nIIPhEbR9gz4Z4iA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oFmZUykJExcnOS2lagUou6X7Fk7zfCr+AwfJ/MvX4Fcj/aJ82f7MiYjLWlbFmoDcx21twTPllRtsCDJ4OxE3Rv38zyiZgdgJF6449SnncxeytIcKbvo5pRI8NbwkOp50Ef7wY+t4x2CUcwBSr5bs85D/kidAC8VeU+a4EYmZsvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AqXd5tKb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AqXd5tKb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D72F6C4CEEF;
	Wed, 28 May 2025 08:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748419883;
	bh=MU+eHvbyChE4Bc8+8rbhPS5TvW+nIIPhEbR9gz4Z4iA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AqXd5tKbMsv+WZzZmf+4QhrXyE1gpgwiVMNjSB7B7r1QdcVWmu9bwlDF0C/kFQ/FM
	 +JVxVdxW32uST10rSIJYccp93pjEJ2KpWhhVHkhAIwnO1VqHZ0YqKzZE/wlZlrK0Xu
	 LaSR2nElUP1YwUPGdRoZUYJptMpzg4Tc6KSyMx1xAHEo8EI8GOPEqiZeE4dI+xH3M2
	 QrJqzd8Z3FsZCtXaUmjaNZYDI/xlEy0zsicf5LYVHDC9h0vwGfZe4ktHkczxnpLPQS
	 WJB3luy8cEdqxb3ngfJArM3xYI4z/EmwkDZhcCnIt2tp8GlIZq+GeT7lGHs7Tn9H7K
	 92mlgidEPBOyg==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mel Gorman <mgorman@suse.de>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Juri Lelli <juri.lelli@redhat.com>
Subject: [PATCH 27/43] sched/smp: Use the SMP version of idle_thread_set_boot_cpu()
Date: Wed, 28 May 2025 10:09:08 +0200
Message-ID: <20250528080924.2273858-28-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250528080924.2273858-1-mingo@kernel.org>
References: <20250528080924.2273858-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify the scheduler by making formerly SMP-only primitives and data
structures unconditional.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: Juri Lelli <juri.lelli@redhat.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mel Gorman <mgorman@suse.de>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Valentin Schneider <vschneid@redhat.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>
---
 kernel/sched/core.c | 2 --
 kernel/smpboot.c    | 4 ----
 2 files changed, 6 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index ac933e6fc465..d2d3e5e337c7 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -8577,9 +8577,7 @@ void __init sched_init(void)
 
 	calc_load_update = jiffies + LOAD_FREQ;
 
-#ifdef CONFIG_SMP
 	idle_thread_set_boot_cpu();
-#endif
 
 	balance_push_set(smp_processor_id(), false);
 	init_sched_fair_class();
diff --git a/kernel/smpboot.c b/kernel/smpboot.c
index 1992b62e980b..4503b60ce9bd 100644
--- a/kernel/smpboot.c
+++ b/kernel/smpboot.c
@@ -18,8 +18,6 @@
 
 #include "smpboot.h"
 
-#ifdef CONFIG_SMP
-
 #ifdef CONFIG_GENERIC_SMP_IDLE_THREAD
 /*
  * For the hotplug case we keep the task structs around and reuse
@@ -76,8 +74,6 @@ void __init idle_threads_init(void)
 }
 #endif
 
-#endif /* #ifdef CONFIG_SMP */
-
 static LIST_HEAD(hotplug_threads);
 static DEFINE_MUTEX(smpboot_threads_lock);
 
-- 
2.45.2

