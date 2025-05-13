Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC67269D1B
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 14:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747146600; cv=none; b=M1BaiqaLn9bZL1YFrUiJqp+XYB/bvo2EgXSmi/oRBqI/BQi3cbdjeSyKVE1lJqAGeKhDqUwGKHonuUYObxEP0HSmrmUULrM97UKrjbvPJyFEmHqw5qJ2naqVMfd6PqRcno1Bt1qjsaMDmu6laNh4peSfh+ga3nlCbhIsEOkiE9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747146600; c=relaxed/simple;
	bh=COgloJLk8TCrMH6ggXKuGQPNUuoDR2a3RIAPcnGuB5U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OqL1+4ridFLbY4KXx6CGmSe+8v0lF7PsHckVkeK9nvWW/n4rMYvXV2oNRnspe9W1eYKBJxmo5SriKMXn32dr5TItSfNvVqgsM5weYm3gyUlpGmiiI5aqvt/ICrpLe5q3KFvSIo7Cv1WFtdvrszRE9RZrPd89nqZsKsnL+cMko+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=OwDZfTXx; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ZPCwSxcp; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="OwDZfTXx";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ZPCwSxcp"
Date: Tue, 13 May 2025 16:29:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747146596;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=wX+SKt2E/ZDDzo2AcHa5V/Htba1MQUSQdUI6x7Rms/4=;
	b=OwDZfTXxpDtBt2RvJK1qqvE1T/YQgV40TdoMs5em662gS5HNVpKaYMxt+g/IJjn7i6zWjs
	WJG9S2F/T5mOlYhfWZfSdkTGuMrHR9b9ThjsUW/M0ooVNQiWWtc8eHRhMc6IjKM0qNTps3
	4U5jA0/q4MX4u7chWXHVxe+n0WANJxS0Ql0ZtG0ZEbUolirLHYshKFcAvP8bwXEdrSZ+jK
	2ixLsdL+/o1cGYjm/5kPx5TEXqosZkDMOkSJVPakAeC69B51tNVmpW4xffKd0TrA2vfX2/
	p2AO1/nJ/qdLw5Dx6hhge58fn7XTTFRDr6W+ovpdXWfExqVbUga/CO5NkVG4jg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747146596;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=wX+SKt2E/ZDDzo2AcHa5V/Htba1MQUSQdUI6x7Rms/4=;
	b=ZPCwSxcppG8oVRw/bisafoVq+59kGcWtm7pjZ5Pq0cOYQ7UIav68A5fdBNt7qBRFgNU+Ea
	igi9Ll5A1L8byOAQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: linux-kernel@vger.kernel.org
Cc: Ben Segall <bsegall@google.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Mel Gorman <mgorman@suse.de>, Peter Zijlstra <peterz@infradead.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleinxer <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: [RFC] sched: Remove a preempt-disable section in rt_mutex_setprio()
Message-ID: <20250513142954.ZM5QSQNc@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

rt_mutex_setprio() has only one caller: rt_mutex_adjust_prio(). It
expects that task_struct::pi_lock and rt_mutex_base::wait_lock are held.
Both locks are raw_spinlock_t and are acquired with disabled interrupts.

Nevertheless rt_mutex_setprio() disables preemption while invoking
__balance_callbacks() and raw_spin_rq_unlock(). Even if the possible
balance callbacks unlock the rq they must not enable interrupts as I
doubt that they also unlock rt_mutex_base::wait_lock.
Therefore interrupts remain disabled and disabling preemption is not
needed.

Commit 4c9a4bc89a9cc ("sched: Allow balance callbacks for check_class_changed()")
adds a preempt-disable section to rt_mutex_setprio() and
__sched_setscheduler(). In __sched_setscheduler() the preemption is
disabled before rq is unlocked and interrupts enabled but I don't see
why it makes a difference in rt_mutex_setprio().

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 kernel/sched/core.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index c81cf642dba05..1790304d2c5ae 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -7274,14 +7274,10 @@ void rt_mutex_setprio(struct task_struct *p, struct task_struct *pi_task)
 
 	check_class_changed(rq, p, prev_class, oldprio);
 out_unlock:
-	/* Avoid rq from going away on us: */
-	preempt_disable();
 
 	rq_unpin_lock(rq, &rf);
 	__balance_callbacks(rq);
 	raw_spin_rq_unlock(rq);
-
-	preempt_enable();
 }
 #endif
 
-- 
2.49.0

