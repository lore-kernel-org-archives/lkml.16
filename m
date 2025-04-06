Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B411537F8
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 16:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743958509; cv=none; b=lgoprYxkio/nFR4Bh6i9sTY8eLnMIfIrQSPXHLTy6AKNgwHcMyR0/qZE1st+oC6jJXMNLzxrOmQI+4Z91/ChvizisNOP8NvWpCzeqGfW5t3SkqgqeLhIv7rrsbpeNyVaXKIkWPKohX9kzjK/t4H6Tadz9fRrV+5eHsdUSvRCUwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743958509; c=relaxed/simple;
	bh=w3ltC006kGJ6O8BCTCtrkRifQFArQpDm2qj0xHMN+9M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PcCCidGg32OXvBx+71EIw6ihvg+hGQy+OVtvAV9iSwhywXKjOwXgrW/a2Dck2Tad6FhsCb/A1MZijSVWUVEzcJdtEsRxM/opowpN1HjGYAPzdxv72POUrLXgqCpEAzISNbsJNdL41wXnxeJnHchCtsSpQp2Jg0qv0xLxVYL43o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m5rCLUkO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m5rCLUkO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DE65C4CEE3;
	Sun,  6 Apr 2025 16:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743958508;
	bh=w3ltC006kGJ6O8BCTCtrkRifQFArQpDm2qj0xHMN+9M=;
	h=Date:From:To:Cc:Subject:From;
	b=m5rCLUkO+2qH0Xc/BQU5fn2NN/T4AKYRKgB4sCOWZxlbGGdO7qQL1SD7yf/IDsFxa
	 yoDRR+hPFJ+rJx85XX4Aaqegmw4IK/2m9AhkE09uUBD6rs01cT8wp6g75h92BjOUCw
	 nZNFdDCnK3q2DMw2KwNILDf1IYlBBCDG7N3jQ37S1T40J5yrXKzYChI7JqTXPrLzw7
	 jn1CqWjKRs+sGI7HPxa6G3TK1D4NXkIwDf3uisd+CA4mkuPBbAiqS3fCocH1uQwopM
	 +38/7VJYAmrdO22YnsPKD9b+lrlnA2vpbzGKoICRYKNgBNb+FgZ4vYtmhf5lEQ45eB
	 GdMLatUcnXnNA==
Date: Sun, 6 Apr 2025 18:55:02 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Subject: [GIT PULL] scheduler fixes
Message-ID: <Z_Kx5hEaGkrLgyLf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

Please pull the latest sched/urgent Git tree from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched-urgent-2025-04-06

   # HEAD: 169eae7711ea4b745e2d33d53e7b88689b10e1a0 rseq: Eliminate useless task_work on execve

Miscellaneous scheduler fixes/updates:

 - Fix a nonsensical Kconfig combination
 - Remove an unnecessary rseq-notification

 Thanks,

	Ingo

------------------>
Mathieu Desnoyers (1):
      rseq: Eliminate useless task_work on execve

Oleg Nesterov (1):
      sched/isolation: Make CONFIG_CPU_ISOLATION depend on CONFIG_SMP


 fs/exec.c           | 3 ++-
 init/Kconfig        | 2 +-
 kernel/sched/core.c | 1 -
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/exec.c b/fs/exec.c
index 5d1c0d2dc403..8e4ea5f1e64c 100644
--- a/fs/exec.c
+++ b/fs/exec.c
@@ -1864,9 +1864,9 @@ static int bprm_execve(struct linux_binprm *bprm)
 		goto out;
 
 	sched_mm_cid_after_execve(current);
+	rseq_execve(current);
 	/* execve succeeded */
 	current->in_execve = 0;
-	rseq_execve(current);
 	user_events_execve(current);
 	acct_update_integrals(current);
 	task_numa_free(current, false);
@@ -1883,6 +1883,7 @@ static int bprm_execve(struct linux_binprm *bprm)
 		force_fatal_sig(SIGSEGV);
 
 	sched_mm_cid_after_execve(current);
+	rseq_set_notify_resume(current);
 	current->in_execve = 0;
 
 	return retval;
diff --git a/init/Kconfig b/init/Kconfig
index 681f38ee68db..ab9b0c2c3d52 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -709,7 +709,7 @@ endmenu # "CPU/Task time and stats accounting"
 
 config CPU_ISOLATION
 	bool "CPU isolation"
-	depends on SMP || COMPILE_TEST
+	depends on SMP
 	default y
 	help
 	  Make sure that CPUs running critical tasks are not disturbed by
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index cfaca3040b2f..c81cf642dba0 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -10703,7 +10703,6 @@ void sched_mm_cid_after_execve(struct task_struct *t)
 		smp_mb();
 		t->last_mm_cid = t->mm_cid = mm_cid_get(rq, t, mm);
 	}
-	rseq_set_notify_resume(t);
 }
 
 void sched_mm_cid_fork(struct task_struct *t)
