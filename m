Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6174825DAFB
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748419834; cv=none; b=INPz0MnloHk4th61K5zryXk0peyv396C6Cxz0Hss7H19G+ecjZWqza4dHT5qhKN77vjo/M4JmEoxH/OIopoAMNyfeAW5cMdWjl8RElRTwjTOfpOPqn3iqwnOxte/FdjffHqtS/R0sdElKxMCGDOPpr1s4R9fdn04ov9V+iDG6e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748419834; c=relaxed/simple;
	bh=YhyixJygq2Xiz6zbjdR3uAQI14g8MbE2KC8BX2OleAs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DsYxVjReSUef2ak0hpaMl0kHNS/3si78Hc23r8pYU7IwuKP9J4G2VWDfOWJ9zoE9aOoHwJPcNdJl1zO0HaQ1i1Swf4rnUobb7XfH61DZtQ9FqdDnWBG5JoUllvDrPTxoXgiqEHGeUVKZJ77In0x9t1fK+rOkWUGYqZQtWb25ESs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FtJ8oNnW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FtJ8oNnW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D598C4CEEF;
	Wed, 28 May 2025 08:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748419834;
	bh=YhyixJygq2Xiz6zbjdR3uAQI14g8MbE2KC8BX2OleAs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FtJ8oNnW5z8z/hE2XhrDyi1ixXdnbqfGxplON1XXbabCeuW9VcV7jNzmFfUVzcdQ5
	 ZWYe9YK/r3PQre8oAtjpaewi0Jkevw74AdMzw9OYoEQQxy3K/yPpZ07VQEMEZeZPw7
	 T5DvES7qFqLR6ADIoVcm2+7neQDM6fSktZu1JgYWpxb66pLuCDd1wWm1oZB1At/u3d
	 ezmSARnrBOMBpa2vOy/YAwhqRlMcTEI2ycNOesWq/dQcaWm08ibBFBLxG+xeJ74yk4
	 PQdiaL5G3y+o7GbQhG9BKS2BaqusoLCBYGP/yeqW9qu1QjEeumyY0oOHxXZfneBq3v
	 hg2a/LtVRqELA==
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
Subject: [PATCH 13/43] sched: Clean up and standardize #if/#else/#endif markers in sched/psi.c
Date: Wed, 28 May 2025 10:08:54 +0200
Message-ID: <20250528080924.2273858-14-mingo@kernel.org>
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
 kernel/sched/psi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/psi.c b/kernel/sched/psi.c
index 1396674fa722..c48aba6ab0a6 100644
--- a/kernel/sched/psi.c
+++ b/kernel/sched/psi.c
@@ -1035,7 +1035,7 @@ void psi_account_irqtime(struct rq *rq, struct task_struct *curr, struct task_st
 			psi_schedule_rtpoll_work(group, 1, false);
 	} while ((group = group->parent));
 }
-#endif
+#endif /* CONFIG_IRQ_TIME_ACCOUNTING */
 
 /**
  * psi_memstall_enter - mark the beginning of a memory stall section
@@ -1651,7 +1651,7 @@ static const struct proc_ops psi_irq_proc_ops = {
 	.proc_poll	= psi_fop_poll,
 	.proc_release	= psi_fop_release,
 };
-#endif
+#endif /* CONFIG_IRQ_TIME_ACCOUNTING */
 
 static int __init psi_proc_init(void)
 {
-- 
2.45.2

