Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A3524678B
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748419792; cv=none; b=PDc4e4CeFGyGOL0O/o2P+DZZYjhjLB+p/HzMjqzXAxfzwdsvxpdjDjaJ5MlX8AYvp2+XpbDsFrWwp4++h7dsG5nx3VKmOeF+CMmQddJGtE0McdTrI3G6AV/WMZti01ODK+vFwnjuULhoIAfdoyYVmc2sul3kDrjzt+6D3nt4nZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748419792; c=relaxed/simple;
	bh=24zupqe2qOSiEYLckn16iIs+jmiZq7/UI4fvu5kVXUU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rPT7oR1EpSIVEamxXbRAbROGcZx0jVQpahkRfMdwWSncKTQBdeNN2EsNrWU9Z6rWhSITv3EguP3hCAY2Z+TXI2nLUPet2cEnf9rNSBeUc7ZDIkIx8eBD0R3+me6v5i1lirO/v6a64RJGY/yViWLQR10EvrGjtSQcf2U2HRHRseA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fg0cKyeK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fg0cKyeK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9AE9C4CEEF;
	Wed, 28 May 2025 08:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748419792;
	bh=24zupqe2qOSiEYLckn16iIs+jmiZq7/UI4fvu5kVXUU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fg0cKyeKF+6/h4C/4L92RMe65kTSDX67RAKFst53zrqGb6NVI+r7LwBXi4fIvZjpz
	 OhnuTfJxfkPVKNsqR2QYbFeJSe+gTYI6gr+m/aD/pzgMlW1aW/ogRnlYi6+70vxCX/
	 mOSxjvG4+p6LgbraA3ywmztj0Zj6tnPBfl1BnZIUxPwsPj+ocWdWHgwrAhA68NUR+S
	 N14zoC+EhyoSfSmuaE09esNUXGfBmgcaVKapTi/wuNY/6i6aHlv7+5fajm1vyQidvU
	 IkMV8nbJMWJGCOwcD1J3Nf9fHtRtrxQiAiA51kfFrbvIvdLLkN0n8C4qi8gyQdNogS
	 riYSB/AGgRTDg==
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
Subject: [PATCH 01/43] sched: Clean up and standardize #if/#else/#endif markers in sched/autogroup.[ch]
Date: Wed, 28 May 2025 10:08:42 +0200
Message-ID: <20250528080924.2273858-2-mingo@kernel.org>
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
 kernel/sched/autogroup.c | 6 +++---
 kernel/sched/autogroup.h | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/kernel/sched/autogroup.c b/kernel/sched/autogroup.c
index 2b331822c7e7..ad2b218e4657 100644
--- a/kernel/sched/autogroup.c
+++ b/kernel/sched/autogroup.c
@@ -25,9 +25,9 @@ static void __init sched_autogroup_sysctl_init(void)
 {
 	register_sysctl_init("kernel", sched_autogroup_sysctls);
 }
-#else
+#else /* !CONFIG_SYSCTL: */
 #define sched_autogroup_sysctl_init() do { } while (0)
-#endif
+#endif /* !CONFIG_SYSCTL */
 
 void __init autogroup_init(struct task_struct *init_task)
 {
@@ -108,7 +108,7 @@ static inline struct autogroup *autogroup_create(void)
 	free_rt_sched_group(tg);
 	tg->rt_se = root_task_group.rt_se;
 	tg->rt_rq = root_task_group.rt_rq;
-#endif
+#endif /* CONFIG_RT_GROUP_SCHED */
 	tg->autogroup = ag;
 
 	sched_online_group(tg, &root_task_group);
diff --git a/kernel/sched/autogroup.h b/kernel/sched/autogroup.h
index 90d69f2c5eaf..0ad3f71e1bfa 100644
--- a/kernel/sched/autogroup.h
+++ b/kernel/sched/autogroup.h
@@ -41,7 +41,7 @@ autogroup_task_group(struct task_struct *p, struct task_group *tg)
 
 extern int autogroup_path(struct task_group *tg, char *buf, int buflen);
 
-#else /* !CONFIG_SCHED_AUTOGROUP */
+#else /* !CONFIG_SCHED_AUTOGROUP: */
 
 static inline void autogroup_init(struct task_struct *init_task) {  }
 static inline void autogroup_free(struct task_group *tg) { }
@@ -61,6 +61,6 @@ static inline int autogroup_path(struct task_group *tg, char *buf, int buflen)
 	return 0;
 }
 
-#endif /* CONFIG_SCHED_AUTOGROUP */
+#endif /* !CONFIG_SCHED_AUTOGROUP */
 
 #endif /* _KERNEL_SCHED_AUTOGROUP_H */
-- 
2.45.2

