Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0393F2609C6
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 09:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749635645; cv=none; b=XiC7wDFCIhWMjFUbF7U3TRJC9T//nZ0QsSToAhmqg1Nnyg9NIdNx9xPR5oFqs2WjfrY8zUow38YMFA9q653Q0SRq9MgSTrfvZ9Aa0LVczgj1T6FNKaE+rG+b8GiH6xkZsKnQhCE52EsIlsICr5R1OQmk9VuvKKkN3JAGoN5IFR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749635645; c=relaxed/simple;
	bh=VzJ1DhNBTnjOMmRNzku8wxZY23+ZKgx12j/0GMftVVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vh5Cf6F+e3tsxyBOrDymrjZCsdjy4Ynt/ltabeWXpxaWtgq71ee/xbVgoFbtuyxUFI+BqCRAAm48SzvzpXpWTUIN7Nw8uWiS1xlVYnplnJWIVmDRWhmfh/pMpyUgNwEiB2bweFGqaI9tITVfq+d3ssUJSXwxU3T2fjCOJWMZlAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=xUjKbP9H; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=nk+dJZSv; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="xUjKbP9H";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="nk+dJZSv"
Date: Wed, 11 Jun 2025 11:54:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749635642;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=741ONKmmW2+0MSt8vaZfluxWMwQvwZ9hPs59sz12f5I=;
	b=xUjKbP9HcAVVqJ68WCqTe21/NNv/HY19ZeJI0ZjDhcLgQof6XDddofyB+vIt6DwmMlRmvw
	HRkyR2wLUtZoek9chJwKPYX3784RKRR6pND2/uZZYmJPjLPSTCFo/wLIXknEiDakewzkMf
	Mj2CKodZFjBw4JsQ9N/U/N3LvH64ec7qlule6X3TVknVHubMiaEZtUkKoS9rrnWNEUO1+t
	EL+GqbtfPYWEIwxds9W25d3/H8e7BAmRU/Hdtj02rw6aePfvmI5UKqGJpwdKdZVL7WQ+2o
	MaY3vFiZYkNgy5wICuBgIxvJh5DBj0Lr/cqds5Fb+dHb61utvLxbL8lm+Gw6jA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749635642;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=741ONKmmW2+0MSt8vaZfluxWMwQvwZ9hPs59sz12f5I=;
	b=nk+dJZSvH40l/leflqowy/YlAcjovWmimeWiz1NhkZ7cl1q4Z+oMuzZyuqv3Pf3glMGGsw
	7EPmLBOgruJE92Bw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, Ben Segall <bsegall@google.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Mel Gorman <mgorman@suse.de>, Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleinxer <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH v3] sched: Remove a preempt-disable section in
 rt_mutex_setprio()
Message-ID: <20250611095400.g8lgs-Tq@linutronix.de>
References: <20250610144700.uBK6RS95@linutronix.de>
 <20250611090306.GA2273038@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250611090306.GA2273038@noisy.programming.kicks-ass.net>

rt_mutex_setprio() has only one caller: rt_mutex_adjust_prio(). It
expects that task_struct::pi_lock and rt_mutex_base::wait_lock are held.
Both locks are raw_spinlock_t and are acquired with disabled interrupts.

Nevertheless rt_mutex_setprio() disables preemption while invoking
__balance_callbacks() and raw_spin_rq_unlock(). Even if the possible
balance callbacks unlock the rq they must not enable interrupts as I
doubt that they also unlock rt_mutex_base::wait_lock.
Therefore interrupts should remain disabled and disabling preemption is
not needed.

Commit 4c9a4bc89a9cc ("sched: Allow balance callbacks for check_class_chang=
ed()")
adds a preempt-disable section to rt_mutex_setprio() and
__sched_setscheduler(). In __sched_setscheduler() the preemption is
disabled before rq is unlocked and interrupts enabled but I don't see
why it makes a difference in rt_mutex_setprio().

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
v2=E2=80=A6v3: https://lore.kernel.org/all/20250610144700.uBK6RS95@linutron=
ix.de/
  - Add a comment why IRQs are still disabled.

v1=E2=80=A6v2: https://lore.kernel.org/all/20250513142954.ZM5QSQNc@linutron=
ix.de/
  - Repost without RFC

 kernel/sched/core.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index dce50fa57471d..537212b33fd84 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -7292,14 +7292,11 @@ void rt_mutex_setprio(struct task_struct *p, struct=
 task_struct *pi_task)
=20
 	check_class_changed(rq, p, prev_class, oldprio);
 out_unlock:
-	/* Avoid rq from going away on us: */
-	preempt_disable();
+	/* Caller holds task_struct::pi_lock, IRQs are still disabled */
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
