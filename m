Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10171C68F
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 14:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749566825; cv=none; b=afTq6xvhgXEQwo0x9Iagt3L5eZ/fmCcDpxMuAv/rXFzPO6orCOXZV8MwKlvGCnT4aMY4FqAt/HEDL+9Zm1T/cerZfnqlpupE5w4GxDP3kFrmWQYRjcWSE1juBiSRShVSiGRtuead5KqsT8G5mll52yj9r7/TR8E+3kjSdSHqWy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749566825; c=relaxed/simple;
	bh=xAlLtJkXo4Y/YNF1MM435Yvj13/vO14DPdpgooURdvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d1OsJshXBzJdyOiQSc7EQ2oEDGo5+jQevwxe7bVmOEWnki6ct+RFrBFDdHSh4sPKxnc7Ieo71gMZwzt3rRDAlYk1F452Cwu8ao3AO/kgNc8k3Uym4EKuh01wEmCsO4gM/NuI3MrY+90LFVp5EdC6mwUCDb7Suckpq2epI+Ux4rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=owJSGvDl; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=jnEoz6GG; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="owJSGvDl";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="jnEoz6GG"
Date: Tue, 10 Jun 2025 16:47:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749566821;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pn/oudRSy/X3jpBbrIygJ68BkqGDbpW4wCm8X9XGM4U=;
	b=owJSGvDl/f0+qrQb2WPQnf+J16JW7OoBFHOd8J0YZFJ91F0RJQE07SUwFwXYy7ZZT8HqsV
	+QzDOa1+3ydEwD0q75ctxV+FfQfG1AG2FO1+KcY61wfzhomqNjK/l9Eza0cttNaY6lmglT
	2lfuPk6Nm6XJy+erF9MoXcBvarVERftvyfRB4pGq+6Iy6q9F3Sfjb1lBCmJpZJlGyumelM
	EgRH0xj7wVQ28nxH1tk5ySH9ySiJv6tjdsNaZMcwOMnPtoS6Y4AtWXb9PK5GX3B6qHEXMw
	nk7EFxDpqDP1MHSw4hujqgh4fqazAPvZ2ViCGzFCDx255GcUYRuBPvuyBl26aQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749566821;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pn/oudRSy/X3jpBbrIygJ68BkqGDbpW4wCm8X9XGM4U=;
	b=jnEoz6GG4frureVGHw/dMohafxMy5+uVJmYa1m/yVfbGk01QupKE2d7qCTw1+bt1zqoc/p
	gkUiLCzkqi6DKCAg==
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
Subject: [PATCH v2] sched: Remove a preempt-disable section in
 rt_mutex_setprio()
Message-ID: <20250610144700.uBK6RS95@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

rt_mutex_setprio() has only one caller: rt_mutex_adjust_prio(). It
expects that task_struct::pi_lock and rt_mutex_base::wait_lock are held.
Both locks are raw_spinlock_t and are acquired with disabled interrupts.

Nevertheless rt_mutex_setprio() disables preemption while invoking
__balance_callbacks() and raw_spin_rq_unlock(). Even if one of the
balance callbacks unlocks the rq then it must not enable interrupts
because rt_mutex_base::wait_lock is still locked.
Therefore interrupts should remain disabled and disabling preemption is
not needed.

Commit 4c9a4bc89a9cc ("sched: Allow balance callbacks for check_class_chang=
ed()")
adds a preempt-disable section to rt_mutex_setprio() and
__sched_setscheduler(). In __sched_setscheduler() the preemption is
disabled before rq is unlocked and interrupts enabled but I don't see
why it makes a difference in rt_mutex_setprio().

Remove the preempt_disable() section from rt_mutex_setprio().

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---

v1=E2=80=A6v2: https://lore.kernel.org/all/20250513142954.ZM5QSQNc@linutron=
ix.de/
  - Repost without RFC

 kernel/sched/core.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index dce50fa57471d..362d8ab888748 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -7292,14 +7292,10 @@ void rt_mutex_setprio(struct task_struct *p, struct=
 task_struct *pi_task)
=20
 	check_class_changed(rq, p, prev_class, oldprio);
 out_unlock:
-	/* Avoid rq from going away on us: */
-	preempt_disable();
=20
 	rq_unpin_lock(rq, &rf);
 	__balance_callbacks(rq);
 	raw_spin_rq_unlock(rq);
-
-	preempt_enable();
 }
 #endif
=20
--=20
2.49.0

