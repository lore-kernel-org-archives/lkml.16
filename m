Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CCAC2517B9
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748419863; cv=none; b=YsaNMKsB4R0q+84huWREE95tLWSKhJfgebAv5si8Oz549OFIAuhWSKz/1xw8j2RlplVSnLu+i7J/DcG9JpU8ZH3DT3jKDG8/dcm9Z/eHKYb37bobhCzb19ZZ1vcrp1JMzsrWX1KO/AcG+4BUB+0ODiU9f6eRPxDb9FAmSPl7imI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748419863; c=relaxed/simple;
	bh=sLanDBJBBAyjRd/ro3K0Wy5iwo185WPogzHo4PmuQvU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mkMHhdTakF98e/8l2MMNXqppiAhf0hqL43LzkM9m3yM+kfAmrpzoZ0LMEkwHylNIKDa2YcovTj0FkNi5/HDSmcCpsldzNz7pCTsrMEeioa8EsRxmLFCiQDayPRf3i1nOsMTCnEgHXxet+hSOaCXEMkpFN1zFbSRjMBI8uosuQ/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KOcw5wZd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KOcw5wZd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ECDAC4CEEF;
	Wed, 28 May 2025 08:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748419862;
	bh=sLanDBJBBAyjRd/ro3K0Wy5iwo185WPogzHo4PmuQvU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KOcw5wZd1qvaBBCmahA419fAsoH3HbPZsm/S2pce0Dcgs0Ea2zkd7vm38P/EH+sJH
	 XieOiky4i+ADwknEMqy7w5Y151KvSNxue6IwTi6L1+TDNGWF6D/HuWjLOF/80rKIqR
	 PVV4ZvF8E0YewJGGqz4ltOyeZRTDqgvu6nArHyl0fnr6j05z0FYagkNU9PrBovYr1A
	 3iM/DAhI5qwOKj9tUS3MBj/qz2o5WOiSSUR3wqRB3rtRtk+MLSeSMQlW/OIln4uIYY
	 IdBZT7tQagoouK4k1tXMGsBUhmzf6k3uC8/ZufhSWNsj20hFw/0/k8wMd4ON1cq2O/
	 Jgo7tg9arKygg==
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
Subject: [PATCH 21/43] sched/smp: Always define is_percpu_thread() and scheduler_ipi()
Date: Wed, 28 May 2025 10:09:02 +0200
Message-ID: <20250528080924.2273858-22-mingo@kernel.org>
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
 include/linux/sched.h | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index f60aaa7fc4ad..8d3167059675 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -1756,12 +1756,8 @@ extern struct pid *cad_pid;
 
 static __always_inline bool is_percpu_thread(void)
 {
-#ifdef CONFIG_SMP
 	return (current->flags & PF_NO_SETAFFINITY) &&
 		(current->nr_cpus_allowed  == 1);
-#else
-	return true;
-#endif
 }
 
 /* Per-process atomic flags. */
@@ -1958,7 +1954,6 @@ extern void __set_task_comm(struct task_struct *tsk, const char *from, bool exec
 	buf;						\
 })
 
-#ifdef CONFIG_SMP
 static __always_inline void scheduler_ipi(void)
 {
 	/*
@@ -1968,9 +1963,6 @@ static __always_inline void scheduler_ipi(void)
 	 */
 	preempt_fold_need_resched();
 }
-#else
-static inline void scheduler_ipi(void) { }
-#endif
 
 extern unsigned long wait_task_inactive(struct task_struct *, unsigned int match_state);
 
-- 
2.45.2

