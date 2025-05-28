Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFEA24DCFE
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748419848; cv=none; b=HD89iUsqjMyJ8ueDVx3W347WJHHcYNyQXXcP8TwcQ1pURdZW9I6yobxFXASNQ9X+snrIlu+nnVxfW39Hvry/hkt3CgT9y1vsaDYll61GyBy6RbapQvLVu9wnE/Ka0WZynAonNu68X/piJeCXUAUjE4yXGRsMO/VM5ekrF2/ETIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748419848; c=relaxed/simple;
	bh=EUMq3U+2g1Y6gO9i90Y9JxXLAlxi7fyMP9TxxTt6mJA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oWUWc+rYio+cT8WMXtjH/M+tYAgQ/dyFEprHYW2jNF76c5/dlRyAh99sMuLYCWpb1+lLLMv/BoHITqQU0qvdm35YBdx7WD6JcLCvZVLwYejZv+1tzwTNtRWbaqgo8EJfX8xjx9qDt/XRvtSHt3Q32Tbu/okHtL410ctyAmzEf4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lxTG9bRp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lxTG9bRp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49F1AC4CEE7;
	Wed, 28 May 2025 08:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748419848;
	bh=EUMq3U+2g1Y6gO9i90Y9JxXLAlxi7fyMP9TxxTt6mJA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lxTG9bRpDV9A3L06A/lXpePQ2if1v2R3D6sU47vLRC8ys7yeiG1KyuIjc7v/VHHxm
	 CZEd/pOnIlMow2Qn/nPjqeMFJmo7WDHlfFrNVZVBZmN5/XCoNG5YZVZUyQtZlZ+C+n
	 /zt8BmB08AvFRttmJDvoymGwLsSzsWxs38nySmlrMruVOxnICLNZWMxm3zA2AW7JGU
	 EaUYTcx5WgZBeBJPWpXQ8wPdXhnwIHR+gnPENblUZ9rCuqY/yMYvPBL/TSmlyzEkOD
	 SN5tUyoTiEKW9zqJpg26dJFR60q+L/ixpPfGFKw50p55rFLNjP88Hx8SEA6WUd6Lsv
	 quJPbKIyZmqXQ==
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
Subject: [PATCH 17/43] sched: Clean up and standardize #if/#else/#endif markers in sched/syscalls.c
Date: Wed, 28 May 2025 10:08:58 +0200
Message-ID: <20250528080924.2273858-18-mingo@kernel.org>
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

 - Use the standard #ifdef marker format for larger blocks,
   where appropriate:

        #if CONFIG_FOO
        ...
        #else /* !CONFIG_FOO: */
        ...
        #endif /* !CONFIG_FOO */

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
 kernel/sched/syscalls.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/kernel/sched/syscalls.c b/kernel/sched/syscalls.c
index 547c1f05b667..5cb5e9487f0d 100644
--- a/kernel/sched/syscalls.c
+++ b/kernel/sched/syscalls.c
@@ -174,7 +174,7 @@ SYSCALL_DEFINE1(nice, int, increment)
 	return 0;
 }
 
-#endif
+#endif /* __ARCH_WANT_SYS_NICE */
 
 /**
  * task_prio - return the priority value of a given task.
@@ -255,8 +255,7 @@ int sched_core_idle_cpu(int cpu)
 
 	return idle_cpu(cpu);
 }
-
-#endif
+#endif /* CONFIG_SCHED_CORE */
 
 /**
  * find_process_by_pid - find a process with a matching PID value.
@@ -448,7 +447,7 @@ static inline int uclamp_validate(struct task_struct *p,
 }
 static void __setscheduler_uclamp(struct task_struct *p,
 				  const struct sched_attr *attr) { }
-#endif
+#endif /* !CONFIG_UCLAMP_TASK */
 
 /*
  * Allow unprivileged RT tasks to decrease priority.
@@ -658,7 +657,7 @@ int __sched_setscheduler(struct task_struct *p,
 				goto unlock;
 			}
 		}
-#endif
+#endif /* CONFIG_SMP */
 	}
 
 	/* Re-check policy now with rq lock held: */
-- 
2.45.2

