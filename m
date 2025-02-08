Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3858B33DB
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 09:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739006489; cv=none; b=rzQgmQpyqOm9JkDYX/ENYVqS3X0ndzOj72iWtV8mY8SY5SmJz2QwVfLFnpivAfgd2gSY0AVbUBI7EUT8vIBrVIiHQVXF2cbjBxJKt2J76mQW9XtUgyQfkYcays/3kNe5nmQ3So55EksWvRo3W8J30ch+oEGnGpCVeHBxMvlxCHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739006489; c=relaxed/simple;
	bh=TwGfzpOP9HeE1uOmLWnwYiPLV5OM6OIXhZyFksw8jlE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q4/nc8faa5yyZ64jcDQF7zyGMJwfckUxs0BVS/lLkwSywcEch8BWZOHt2ACg7AgneXxYd0coczHyOkslh1sWbNIh2HG1DrrpH9719eBzYREagZ7GHMi8ZW1Ci9xoBsIRHV/iHTRrr4k4oQ3WswtKfOqQyJjk2VhoxTL+RVQwb1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D5jVWBHP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D5jVWBHP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A418C4CED6;
	Sat,  8 Feb 2025 09:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739006488;
	bh=TwGfzpOP9HeE1uOmLWnwYiPLV5OM6OIXhZyFksw8jlE=;
	h=Date:From:To:Cc:Subject:From;
	b=D5jVWBHPaLY4jIJPmVbCNhNTsfjiboQWJmEtVvTYnhAwcMNTk84x2PpA4IMsm8zDq
	 fVZKxH/1tkTlQEHuow3wHCJDve/+VVG8upJET2M3ClEYLqGkSBdMusGLWaILkjBCeR
	 jcPwE/zODwV1loPP3fb0XB6XBGclN6gfR4wGCVmYInh74YGSZu3uncLFY7WC1l3ty/
	 y83VQLi54CpMtN0akgYbYsUMrUycw1ANnhDa1KFer/JewjKYIR+3BIbzorf6Nfvt3g
	 2vi8mbUqzHWiyc907BNUwFSRUIkhhnb2M2slfH8du0LrnDi2q+YmUDQ7JdwW8Psjuq
	 b9/qrL4YY27GQ==
Date: Sat, 8 Feb 2025 10:21:17 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Daniel Bristot de Oliveira <bristot@redhat.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [GIT PULL] scheduler fixes
Message-ID: <Z6ciDeTzQTHn2Gci@gmail.com>
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

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched-urgent-2025-02-08

   # HEAD: 9065ce69754dece78606c8bbb3821449272e56bf sched/debug: Provide slice length for fair tasks

Fix a cfs_rq->h_nr_runnable accounting bug that trips up a
defensive SCHED_WARN_ON() on certain workloads. The bug is
believed to be (accidentally) self-correcting, hence no
behavioral side effects are expected.

Also print se.slice in debug output, since this value can now be
set via the syscall ABI and can be useful to track.

 Thanks,

	Ingo

------------------>
Christian Loehle (1):
      sched/debug: Provide slice length for fair tasks

K Prateek Nayak (1):
      sched/fair: Fix inaccurate h_nr_runnable accounting with delayed dequeue


 kernel/sched/debug.c |  2 ++
 kernel/sched/fair.c  | 19 +++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index a1be00a988bf..5b32d3cc393b 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -1265,6 +1265,8 @@ void proc_sched_show_task(struct task_struct *p, struct pid_namespace *ns,
 	if (task_has_dl_policy(p)) {
 		P(dl.runtime);
 		P(dl.deadline);
+	} else if (fair_policy(p->policy)) {
+		P(se.slice);
 	}
 #ifdef CONFIG_SCHED_CLASS_EXT
 	__PS("ext.enabled", task_on_scx(p));
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 26958431deb7..f4e4d3ed943c 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -5372,6 +5372,15 @@ static __always_inline void return_cfs_rq_runtime(struct cfs_rq *cfs_rq);
 static void set_delayed(struct sched_entity *se)
 {
 	se->sched_delayed = 1;
+
+	/*
+	 * Delayed se of cfs_rq have no tasks queued on them.
+	 * Do not adjust h_nr_runnable since dequeue_entities()
+	 * will account it for blocked tasks.
+	 */
+	if (!entity_is_task(se))
+		return;
+
 	for_each_sched_entity(se) {
 		struct cfs_rq *cfs_rq = cfs_rq_of(se);
 
@@ -5384,6 +5393,16 @@ static void set_delayed(struct sched_entity *se)
 static void clear_delayed(struct sched_entity *se)
 {
 	se->sched_delayed = 0;
+
+	/*
+	 * Delayed se of cfs_rq have no tasks queued on them.
+	 * Do not adjust h_nr_runnable since a dequeue has
+	 * already accounted for it or an enqueue of a task
+	 * below it will account for it in enqueue_task_fair().
+	 */
+	if (!entity_is_task(se))
+		return;
+
 	for_each_sched_entity(se) {
 		struct cfs_rq *cfs_rq = cfs_rq_of(se);
 
