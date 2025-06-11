Received: from relay.hostedemail.com (smtprelay0010.hostedemail.com [216.40.44.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A015D29ACED
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 14:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749651305; cv=none; b=PDx3Kv1M8KxmNMLgEn57eJy646s/K5uEh1ExWjyovRqPOMozkjR9lZDcxQ63pIUxAP5U1aG4+K8Iu4lnBlpUS6MAYxHHOY+S2OgC6cJkuZnRo9n3NDj9iG0JjpS+9mXtnoERqCDghf5nNoBrhZqT4QcdTMQxw+uKbWep1axeA7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749651305; c=relaxed/simple;
	bh=pFxx+C/5QWV40QbrKzTdzefhgo5GIRyytsEQA9i/6/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s4FHEy+XZwSH9lI8Jc1bPBmeYf8YWFly3OKo01cy5CqPu58mQzhSkzr8HDbs8DuCRIkYgEpTE9b7GBtWCJ5eVMX2dntFYCE7a48Pbz6YcvZq3mgB/j4i76KspkPG3qon+d1KCHI0FGqug3nLQh9gS2F1ula6t+gj4zgkXmbczVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf04.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay01.hostedemail.com (Postfix) with ESMTP id ABE241D7240;
	Wed, 11 Jun 2025 14:15:00 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf04.hostedemail.com (Postfix) with ESMTPA id 5C6D920033;
	Wed, 11 Jun 2025 14:14:58 +0000 (UTC)
Date: Wed, 11 Jun 2025 10:14:57 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-kernel@vger.kernel.org, Ben Segall <bsegall@google.com>, Dietmar
 Eggemann <dietmar.eggemann@arm.com>, Ingo Molnar <mingo@redhat.com>, Juri
 Lelli <juri.lelli@redhat.com>, Mel Gorman <mgorman@suse.de>, Thomas
 Gleinxer <tglx@linutronix.de>, Valentin Schneider <vschneid@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>
Subject: Re: [PATCH v2] sched: Remove a preempt-disable section in
 rt_mutex_setprio()
Message-ID: <20250611101457.13ea44f5@batman.local.home>
In-Reply-To: <20250611090306.GA2273038@noisy.programming.kicks-ass.net>
References: <20250610144700.uBK6RS95@linutronix.de>
	<20250611090306.GA2273038@noisy.programming.kicks-ass.net>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: 5C6D920033
X-Stat-Signature: jfpkggf699s5uq3t8z8iukopfwho48gx
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/WvrBFQsv3gRwMyZGvufRM72PtMU2aDtY=
X-HE-Tag: 1749651298-720991
X-HE-Meta: U2FsdGVkX18MuulUrPufGWjBco2mf9EefcB2MFUtAED5qZCkZckI1+jdoixvFikw+D9j4rhy+pZAeE0Osm9OzscW+0mEoVxG3ZW/44EBCVBhNTRnx76SU8EDBidHUU/y/T/oCkfb0Y8vEL3gPp8Rq0mBxG8vbH7o6y7YISHIsWxjmNAu4oCEsjvrOIlBcIC+gHJ2n9AKKX+LBeIBCZ4bECKivTQNfnjvRNj6jN68a1IYnHUBKjdVM+3u1XUwUKBp1Yz6e2XkyLUGpRQ2Xr8HENiv96uOzIl0Bp981i0bGNcjh33uFXLmWgu3ArFpTHCb13yu3XgJ4kVJGAN1TL5kCh649f0AjS9hXRvOJEJYG/lo9MUox1YwQjJ0JfZqkxIGoXS0E9Vt+kIFOd8V43wfog==

On Wed, 11 Jun 2025 11:03:06 +0200
Peter Zijlstra <peterz@infradead.org> wrote:

> > --- a/kernel/sched/core.c
> > +++ b/kernel/sched/core.c
> > @@ -7292,14 +7292,10 @@ void rt_mutex_setprio(struct task_struct *p, struct task_struct *pi_task)
> >  
> >  	check_class_changed(rq, p, prev_class, oldprio);
> >  out_unlock:
> > -	/* Avoid rq from going away on us: */
> > -	preempt_disable();  
> 
> Perhaps add:
> 
> 	/* IRQs are still disabled */
> 
> or something to that effect such that it is obvious from reading the
> code that dropping the lock will not enable preemption?

Hmm, wouldn't lockdep_assert_irqs_disabled() be better than a comment.
It lets people know that interrupts are disabled and when lockdep is
enabled it also makes sure they are.

-- Steve
