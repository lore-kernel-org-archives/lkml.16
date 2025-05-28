Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67302750FE
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748419929; cv=none; b=pqejAjrStuS6TSjIheI7PTfidiilMcMfdnB/AmhrHdkxxQOPgIWUfFjashcnGbSvRA5C64AXsFe3QCmm85mrX5IDLqwhgK0Ovn8/7FKg8Ei7sU6fkLaRKYRB/m8VAXAg+p7u62UYCG5e9CZyXDwHw6gjxK724cxQdp03Rqm8wwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748419929; c=relaxed/simple;
	bh=dwYh0Xw5KXdyDJX+1yXvaB7TRm12J+XmblxF+9fR9RY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FPXBVQ46CueKvUHSst17BDG64NY+ZONVV97xE4KmwLIkCKIe30MBTtqRZ4b2mBxOMykK6NyUtgWwU1su6Jw6Oq8mIxNARmy29Y0chXAXM0kuOBlP8/6kQ+2cYlJuWKmsacCOnQHobD5VtYt9gM5LiuFRStZvqKdpuMyktg9bDv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=axgamg/N; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="axgamg/N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F09BC4CEEB;
	Wed, 28 May 2025 08:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748419929;
	bh=dwYh0Xw5KXdyDJX+1yXvaB7TRm12J+XmblxF+9fR9RY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=axgamg/N1ydx4SoZufnZCMEjgA7/6CYjYYxK0xRRKeC/abnjeUK+xoB2ZMIOP57Uu
	 UEBNXGKOo1NjmEaBjb5RCiP99WIuJaLjCuKowNbT+O41zCPCCJyn/G+gI+38tIpe2o
	 n17mq7sZJuwSztAvzbhMt5m0UU4nJivPs7qQ+o3x7NmvvaIXfrt9yJIrO1iYMZqYTX
	 WvxU0GxCMI7/lSWQhj5zf85JTklziCLUrblEr27BEW0GNThT95gWTMMXasII+u96Ik
	 H5yXHPzc2q1IM1sxgumHFbc6hEXCPIRT2pRyowikp/GDp47QakyeYik/+j2DvcbOTC
	 HCFW8HPDB5lmQ==
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
Subject: [PATCH 40/43] sched/smp: Use the SMP version of WF_ and SD_ flag sanity checks
Date: Wed, 28 May 2025 10:09:21 +0200
Message-ID: <20250528080924.2273858-41-mingo@kernel.org>
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
 kernel/sched/sched.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index fbc9d25a3e6c..e4aeb1e1c849 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -2260,11 +2260,9 @@ static inline int task_on_rq_migrating(struct task_struct *p)
 #define WF_CURRENT_CPU		0x40 /* Prefer to move the wakee to the current CPU. */
 #define WF_RQ_SELECTED		0x80 /* ->select_task_rq() was called */
 
-#ifdef CONFIG_SMP
 static_assert(WF_EXEC == SD_BALANCE_EXEC);
 static_assert(WF_FORK == SD_BALANCE_FORK);
 static_assert(WF_TTWU == SD_BALANCE_WAKE);
-#endif
 
 /*
  * To aid in avoiding the subversion of "niceness" due to uneven distribution
-- 
2.45.2

