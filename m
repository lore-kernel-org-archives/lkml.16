Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E582D1AF0C0
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 09:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739006887; cv=none; b=P4Kc+uEttJT1ecmPVPTobKCbWt5PSSpXy+/Ra2L7L1HvlwI2Eeu+RFyKt56xSbstEBSNyZopliAGdVT7tniVbJ6J9fiY4hdt0xseRcos63mGj5lTlrL05wNddXfPEw+or4WSSQewKTmhFM/A/5hr0HXGo/W286vfZQV+Ww/Ll2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739006887; c=relaxed/simple;
	bh=o8R9B3Z///8urEOSTMFwcqEcnjjVd2e8O35XkdP6WrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XAvMwQaoiwzz98aHk/aV1tIo0NFEbFXsgOAPTwMNQ9bgM/NhNMeFc1+f+tUtwdQelpjzBSz8KIHGbsvzH7Nnc9jYqfyOFjX54tSTkRihUszJ9fccpXvUw3UHoGzSUFWksVQnKMK591MdOz/at7Ir88Osweab8xCWQ+KmsDXB2hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uZxkYhw1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uZxkYhw1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55B81C4CED6;
	Sat,  8 Feb 2025 09:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739006886;
	bh=o8R9B3Z///8urEOSTMFwcqEcnjjVd2e8O35XkdP6WrQ=;
	h=Date:From:To:Cc:Subject:From;
	b=uZxkYhw1aFHtJQ2DBq133cBSQOLQCkZ44nQ/AQtjG6UuA3zgB7wJL9hyaAn26s3fU
	 1kb1aWfbgWG/kifffEmvadvbIs/6dIeAiZiJaqIOTOtqQmrCb+W1XaGyOEqpIKp2cO
	 e+D2ET621wwxbsGv/kmufyEjuh0oXxsMKAxd5amEVS/HoJo1IPQuaUsxCxOMDZL5CN
	 wy0LYXqT1xOHfCKZP8Hd2qqKGfc8tTXU0PTu0J0XzG6QMF/mUUBgXrBBW8wP50y0j6
	 zx7di3qab3UY2cvbT9XLss8C80WLq1Tw7XJlb9Yuh25YtXFmJ2BDfJUn87p7un/NFA
	 6k3QDXvBsYbyQ==
Date: Sat, 8 Feb 2025 10:27:56 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Waiman Long <longman@redhat.com>
Subject: [GIT PULL] timer fixes
Message-ID: <Z6cjnBOBUxOq__Ni@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

Please pull the latest timers/urgent Git tree from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers-urgent-2025-02-08

   # HEAD: 868c9037df626b3c245ee26a290a03ae1f9f58d3 timers/migration: Fix off-by-one root mis-connection

Fix a PREEMPT_RT bug in the clocksource verification code that
caused false positive warnings.

Also fix a timer migration setup bug when new CPUs are added.

 Thanks,

	Ingo

------------------>
Frederic Weisbecker (1):
      timers/migration: Fix off-by-one root mis-connection

Waiman Long (1):
      clocksource: Use migrate_disable() to avoid calling get_random_u32() in atomic context


 kernel/time/clocksource.c     |  6 ++++--
 kernel/time/timer_migration.c | 10 +++++++++-
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/kernel/time/clocksource.c b/kernel/time/clocksource.c
index 77d9566d3aa6..2a7802ec480c 100644
--- a/kernel/time/clocksource.c
+++ b/kernel/time/clocksource.c
@@ -373,10 +373,10 @@ void clocksource_verify_percpu(struct clocksource *cs)
 	cpumask_clear(&cpus_ahead);
 	cpumask_clear(&cpus_behind);
 	cpus_read_lock();
-	preempt_disable();
+	migrate_disable();
 	clocksource_verify_choose_cpus();
 	if (cpumask_empty(&cpus_chosen)) {
-		preempt_enable();
+		migrate_enable();
 		cpus_read_unlock();
 		pr_warn("Not enough CPUs to check clocksource '%s'.\n", cs->name);
 		return;
@@ -384,6 +384,7 @@ void clocksource_verify_percpu(struct clocksource *cs)
 	testcpu = smp_processor_id();
 	pr_info("Checking clocksource %s synchronization from CPU %d to CPUs %*pbl.\n",
 		cs->name, testcpu, cpumask_pr_args(&cpus_chosen));
+	preempt_disable();
 	for_each_cpu(cpu, &cpus_chosen) {
 		if (cpu == testcpu)
 			continue;
@@ -403,6 +404,7 @@ void clocksource_verify_percpu(struct clocksource *cs)
 			cs_nsec_min = cs_nsec;
 	}
 	preempt_enable();
+	migrate_enable();
 	cpus_read_unlock();
 	if (!cpumask_empty(&cpus_ahead))
 		pr_warn("        CPUs %*pbl ahead of CPU %d for clocksource %s.\n",
diff --git a/kernel/time/timer_migration.c b/kernel/time/timer_migration.c
index 9cb9b6584ea1..2f6330831f08 100644
--- a/kernel/time/timer_migration.c
+++ b/kernel/time/timer_migration.c
@@ -1675,6 +1675,9 @@ static int tmigr_setup_groups(unsigned int cpu, unsigned int node)
 
 	} while (i < tmigr_hierarchy_levels);
 
+	/* Assert single root */
+	WARN_ON_ONCE(!err && !group->parent && !list_is_singular(&tmigr_level_list[top]));
+
 	while (i > 0) {
 		group = stack[--i];
 
@@ -1716,7 +1719,12 @@ static int tmigr_setup_groups(unsigned int cpu, unsigned int node)
 		WARN_ON_ONCE(top == 0);
 
 		lvllist = &tmigr_level_list[top];
-		if (group->num_children == 1 && list_is_singular(lvllist)) {
+
+		/*
+		 * Newly created root level should have accounted the upcoming
+		 * CPU's child group and pre-accounted the old root.
+		 */
+		if (group->num_children == 2 && list_is_singular(lvllist)) {
 			/*
 			 * The target CPU must never do the prepare work, except
 			 * on early boot when the boot CPU is the target. Otherwise
