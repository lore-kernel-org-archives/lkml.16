Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0B7256C76
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748419906; cv=none; b=RgxmZ3vDSePLETQWFIMtaWkkIM1R7YKJHpfyfxxZYx/mIA6uVkFufZDxqiVbg9OBCQoU2MteXVizw/Y/ksZS32UlrjwvXJI0pe7TAxXSrC/1LfTHEesIrnMZY4hKaZyezuJw2a0/Gj+pABDrb5+th2f23bPuA5KaTVsbnAWzxzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748419906; c=relaxed/simple;
	bh=LAFq8PNLkFQldtV+H8a7KGA+i1YMFB1mG1+pstgzw1s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tbRMGqQ/dTfj6mJgJ8zVA/1kx/raU6NpzFbkErGq15Xte0qZCbPRU1dovEM//EKfKEnk9Hu1IblBsikMdRaiQBXLb6mCx3Q6xO/VLI9HBFbs63AqOVsu5vYB5f0QkPVI3QiRLYV1O91LJJ371L72Z2CnR5Ey0zAxUMHUqceV0KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pS0BAVO6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pS0BAVO6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD0C6C4CEE7;
	Wed, 28 May 2025 08:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748419904;
	bh=LAFq8PNLkFQldtV+H8a7KGA+i1YMFB1mG1+pstgzw1s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pS0BAVO6FXdS28TOSAxy5BXhHCG3sBYz3jVYF6i6JzwgNJlaRTz6D0Et4rbZO6ir5
	 S3vSAiVCxlrjOg/vGAozLP5FXqRk2NKDYGRSXrJ7AWYQI1ZHtFE9qSrI63cLRRKekr
	 +czqADuneg46ssfXA+pQ7nWkl9+FtoEclQ+mr5uASMf0K313lvv5+xvBaHW/d7ZkiY
	 E6FVKiBhx10hhYSXBBzqjXBhPDHmCZJTMWtn9R05hXnpt2ptw0yfNCVoXiIu0byM/P
	 Rhuaw6uvO/zqz6hbnzAWj4o0sWT4SLZnpIYRnubEL2VRmmlh7eZJ5hTlzkD93Rx/Hp
	 LUhWhctZTVyMg==
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
Subject: [PATCH 33/43] sched/smp: Use the SMP version of sched_update_asym_prefer_cpu()
Date: Wed, 28 May 2025 10:09:14 +0200
Message-ID: <20250528080924.2273858-34-mingo@kernel.org>
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
 kernel/sched/topology.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index 72a9a8e17986..18eb309fd8d0 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -1336,7 +1336,6 @@ static void init_sched_groups_capacity(int cpu, struct sched_domain *sd)
 /* Update the "asym_prefer_cpu" when arch_asym_cpu_priority() changes. */
 void sched_update_asym_prefer_cpu(int cpu, int old_prio, int new_prio)
 {
-#ifdef CONFIG_SMP
 	int asym_prefer_cpu = cpu;
 	struct sched_domain *sd;
 
@@ -1386,7 +1385,6 @@ void sched_update_asym_prefer_cpu(int cpu, int old_prio, int new_prio)
 
 		WRITE_ONCE(sg->asym_prefer_cpu, asym_prefer_cpu);
 	}
-#endif /* CONFIG_SMP */
 }
 
 /*
-- 
2.45.2

