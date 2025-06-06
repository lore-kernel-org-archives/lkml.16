Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4999283FE0
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 08:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749198527; cv=none; b=eD82P0KC4Q1Z/AkBZXfr8MRTERhWDXzTkHv09Qn9ZpVUYYvkI2SShCLwUCIHUMpPihhVZstx/MrFBrZ9qtgXrSBxzhUD9vFHahDoCAOwmt0cYqyRCNPWJOe0ZyZhyA+JdF5N13NrdMDZy0Wz9LR5jX7o99JTMZxS5z4jFmDH18M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749198527; c=relaxed/simple;
	bh=PAaodisFRp8BXNshl8hjloIjaJQDtSt/c9gq0ObNylk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nO4vasQ5ct5/5hAAvDI36phyUCB0YRWkHB/sFym2QMSMw12eqeSYq01ZeEZk430PLs12XUP0+cQecrESBj8XqvqHT8Zmfqssw1EPDZwE5JjZPxjk0ZkdXC/pcwk3fYZySqdlqeZH8dugyZH8bEq36aNgARhJM7qptiyucsfFCE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=XlbGiJC9; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="XlbGiJC9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=3+Pbk+AMqlQcQg0IkPAdVHTlxrIIFf5Dha1LbvjUbTc=; b=XlbGiJC9RQz1KM7Ij82rDYp0z9
	LD+AZyjrmmvR+Iw7srmbzOykDg4dmR59qkjiXx1PPtvzGmt8SZiBmcBvPsJG5wTeK2tYYN89l3sG8
	KNvzYW771h9vCw8GyQrxNBE5uhwloCna//c1+lQcOV3aLi2vozired3CEL2KK0ShK6rscjf2x5OlG
	JyqAgHATRtsrux9WnKO6RHkQOVsOYSo4UqxQZt9Pvp8mgHyS7IoJQK1csbmZx0PSNJsNr4DQV/DXZ
	RQFxVxiXwxeaf7C0gTPk3oAn7B+YCGtudDz7/OIjZAW3vKl2jpGHLMZzlyVF7DsA4UBT71yJ9dzMf
	LogbYWMg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNSRH-00000001FeD-3qdc;
	Fri, 06 Jun 2025 08:28:36 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id EF72130078B; Fri,  6 Jun 2025 10:28:34 +0200 (CEST)
Date: Fri, 6 Jun 2025 10:28:34 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Kuyo Chang <kuyo.chang@mediatek.com>
Cc: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/1] sched/core: Fix migrate_swap() vs. hotplug
Message-ID: <20250606082834.GM30486@noisy.programming.kicks-ass.net>
References: <20250602072242.1839605-1-kuyo.chang@mediatek.com>
 <20250605100009.GO39944@noisy.programming.kicks-ass.net>
 <8e1018116ad7c5c325eced2cb17b65c73ca2ceca.camel@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8e1018116ad7c5c325eced2cb17b65c73ca2ceca.camel@mediatek.com>

On Fri, Jun 06, 2025 at 11:46:57AM +0800, Kuyo Chang wrote:

> Thank you for your patch.
> I believe this patch also effectively addresses this race condition.
> I will queue it in our test pool for testing.

Thank you; I shall await the results!


> > @@ -101,12 +98,12 @@ static bool cpu_stop_queue_work(unsigned int
> > cpu, struct cpu_stop_work *work)
> >         raw_spin_lock_irqsave(&stopper->lock, flags);
> >         enabled = stopper->enabled;
> >         if (enabled)
> > -               __cpu_stop_queue_work(stopper, work, &wakeq);
> > +               __cpu_stop_queue_work(stopper, work);
> >         else if (work->done)
> >                 cpu_stop_signal_done(work->done);
> >         raw_spin_unlock_irqrestore(&stopper->lock, flags);
> > 
> > -       wake_up_q(&wakeq);
> > +       wake_up_process(stopper->thread);
> 
> BTW, should we add enabled check here?
> 	if (enabled) 
> 		wake_up_process(stopper->thread);

Ah yes. Spuriously waking the stopper thread is harmless, but wasteful.

> >         preempt_enable();
> > 
> >         return enabled;
