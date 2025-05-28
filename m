Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E55270565
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748419901; cv=none; b=ts0mCaSflbHHBTgYDbZjCWtgR3yV0998EmmvW7JZDq4lKuhOc5F5uz2sQSBGhujShQjLPHMSpYUz163x8bdKNgxXeyPBKFb1Yv9uKOZJSYUD4j5h9IXyMqSwmi/1v1CbVmCV71RavFF36ZsQQu2StbPUu9QViMO7sDNji5m5OeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748419901; c=relaxed/simple;
	bh=HhJn8+Bkf3Al4z35LmUKeudBi8itfc26hNtt4GX4IZE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gYG4gwGS1G/g3NqBOZmCHfgVnrmpF7dQTNL5Bm4d0wA3z87stGRUVjTSoshAk4aHCwxAd4Uv1jvCycaFit8TvxOkCebkiEtOEsg8GF+QYEhPQHc2d2MqVJTwYWq6uEGwHPDvZmmsG8O4MtCCPN8on+xT5PKVZi9nnpUlrU7c9CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cf5HRH+j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cf5HRH+j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 630E1C4CEE7;
	Wed, 28 May 2025 08:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748419901;
	bh=HhJn8+Bkf3Al4z35LmUKeudBi8itfc26hNtt4GX4IZE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Cf5HRH+jVr5Kcj9KAZiD76SB/UAwUOAq0MNQW9KooocId91THoq7DcSLyL4i9dMBY
	 VQql1n/AFRyYTMK3bYsO3dd0rj/Icp/rCDQIHoc9Oq8TfSiYSn0fxxcwjFhr92mASi
	 rjuIeBScLORL4RdqqE+6cX+lR4PtHU5/gAHmBzEtuQhUYbUVN1DfCRERrs1VJ1WHsL
	 cJ/sjngf5UYlI4DCmQ9smFpQJO/vYJr4CB4THLXiO5kbtOM9NtVm8lgfYH62XliIaD
	 IlGka7KfI9EdQ0lGVxXgG3G0BWVx6eg4m6r9yH2Ivbd6j52Hu7654bIRlok2rucWti
	 8aKZNuwwRcvDg==
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
Subject: [PATCH 32/43] sched/smp: Use the SMP version of the scheduler syscalls
Date: Wed, 28 May 2025 10:09:13 +0200
Message-ID: <20250528080924.2273858-33-mingo@kernel.org>
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
 kernel/sched/syscalls.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/kernel/sched/syscalls.c b/kernel/sched/syscalls.c
index d7fccf871c7d..77ae87f36e84 100644
--- a/kernel/sched/syscalls.c
+++ b/kernel/sched/syscalls.c
@@ -209,10 +209,8 @@ int idle_cpu(int cpu)
 	if (rq->nr_running)
 		return 0;
 
-#ifdef CONFIG_SMP
 	if (rq->ttwu_pending)
 		return 0;
-#endif
 
 	return 1;
 }
@@ -641,7 +639,6 @@ int __sched_setscheduler(struct task_struct *p,
 			goto unlock;
 		}
 #endif /* CONFIG_RT_GROUP_SCHED */
-#ifdef CONFIG_SMP
 		if (dl_bandwidth_enabled() && dl_policy(policy) &&
 				!(attr->sched_flags & SCHED_FLAG_SUGOV)) {
 			cpumask_t *span = rq->rd->span;
@@ -657,7 +654,6 @@ int __sched_setscheduler(struct task_struct *p,
 				goto unlock;
 			}
 		}
-#endif /* CONFIG_SMP */
 	}
 
 	/* Re-check policy now with rq lock held: */
@@ -1239,7 +1235,7 @@ long sched_setaffinity(pid_t pid, const struct cpumask *in_mask)
 	user_mask = alloc_user_cpus_ptr(NUMA_NO_NODE);
 	if (user_mask) {
 		cpumask_copy(user_mask, in_mask);
-	} else if (IS_ENABLED(CONFIG_SMP)) {
+	} else {
 		return -ENOMEM;
 	}
 
-- 
2.45.2

