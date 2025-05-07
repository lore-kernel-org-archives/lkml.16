Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4015125F7BC
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 12:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746620748; cv=none; b=hOUBKV5bt/p4L6g9+pGUPKW17vK5I6O2Qb3MC6vct164Rgc2p/y99c8z4ysE5iF2UgiGjOl1SWAVfHXIQt9YesEK0z/80B9GkJnfl6UvFGqrEF62qTL+1aGOK1sJ4a0tCuVivuwkqCXs/vLgcbbDtAxvaZzlReKTuG7Y5rCsGPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746620748; c=relaxed/simple;
	bh=q7VldXU6WBNhZBSRfGVstM+5H19J9nGZI3GP8M4Sl9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bLSz0XjUJQTXgWe8xh/ETYeiPUmyQyabzjp9gZsL6eINmWvy/QfcNCWyQ9eOa8cKbK2Ut5bU/bPcg+ChUclpXeRdFEU3MnXKuVXUy4C/QTSyX0oaVUfyHz8R6R2GG/UtHjVK1uexGAfWylr5I6UKUeGg67lvtLyGDHWZEmwF7bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BjvqmCJI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BjvqmCJI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A928DC4CEE7;
	Wed,  7 May 2025 12:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746620748;
	bh=q7VldXU6WBNhZBSRfGVstM+5H19J9nGZI3GP8M4Sl9c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BjvqmCJIoReheZyWZQ/lndomacAax2YrJQzOEO5pPapzD9dP6wbJawsgpIoJw94QK
	 29P7QmZVBG8oX3s1JG2I3CsJpDLLgOR7Fryad4UbmkwgCOqL7KBV10rPAaI0IhwHAM
	 2ntDOvEJPhKQ5Dkgo8geV6oQ/eRh5fl54ZOVosidd1wFALA09bcRHHYMO3aJ7c2VE0
	 favLMZ1PBQjdQMjBnFW3u20u5n/gNiAzGF/OOKj3FV4wQp3r/IzZlnRn9CVyesttZf
	 QckcYt/duROCECLToUa5ywu860E+/kP7tX8EUzoc3srEwOIy8/nIZl07kAADFh4jMS
	 /dk+MVgT+lyWQ==
Date: Wed, 7 May 2025 14:25:45 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v4 2/5] timers: Add the available mask in timer migration
Message-ID: <aBtRSSCxyHcypo4b@localhost.localdomain>
References: <20250506091534.42117-7-gmonaco@redhat.com>
 <20250506091534.42117-9-gmonaco@redhat.com>
 <aBozrJ0C6yzW7oB_@localhost.localdomain>
 <3f54534266f4405fc3c6943599edd9be88becd57.camel@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3f54534266f4405fc3c6943599edd9be88becd57.camel@redhat.com>

Le Wed, May 07, 2025 at 09:57:38AM +0200, Gabriele Monaco a écrit :
> 
> 
> On Tue, 2025-05-06 at 18:07 +0200, Frederic Weisbecker wrote:
> > Le Tue, May 06, 2025 at 11:15:37AM +0200, Gabriele Monaco a écrit :
> > > Keep track of the CPUs available for timer migration in a cpumask.
> > > This
> > > prepares the ground to generalise the concept of unavailable CPUs.
> > > 
> > > Signed-off-by: Gabriele Monaco <gmonaco@redhat.com>
> > > ---
> > >  kernel/time/timer_migration.c | 12 +++++++++++-
> > >  1 file changed, 11 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/kernel/time/timer_migration.c
> > > b/kernel/time/timer_migration.c
> > > index 7efd897c7959..25439f961ccf 100644
> > > --- a/kernel/time/timer_migration.c
> > > +++ b/kernel/time/timer_migration.c
> > > @@ -422,6 +422,9 @@ static unsigned int tmigr_crossnode_level
> > > __read_mostly;
> > >  
> > >  static DEFINE_PER_CPU(struct tmigr_cpu, tmigr_cpu);
> > >  
> > > +/* CPUs available for timer migration */
> > > +static cpumask_var_t tmigr_available_cpumask;
> > > +
> > >  #define TMIGR_NONE	0xFF
> > >  #define BIT_CNT		8
> > >  
> > > @@ -1449,6 +1452,7 @@ static int tmigr_cpu_unavailable(unsigned int
> > > cpu)
> > >  	raw_spin_lock_irq(&tmc->lock);
> > >  	tmc->available = false;
> > >  	WRITE_ONCE(tmc->wakeup, KTIME_MAX);
> > > +	cpumask_clear_cpu(cpu, tmigr_available_cpumask);
> > >  
> > >  	/*
> > >  	 * CPU has to handle the local events on his own, when on
> > > the way to
> > > @@ -1459,7 +1463,7 @@ static int tmigr_cpu_unavailable(unsigned int
> > > cpu)
> > >  	raw_spin_unlock_irq(&tmc->lock);
> > >  
> > >  	if (firstexp != KTIME_MAX) {
> > > -		migrator = cpumask_any_but(cpu_online_mask, cpu);
> > > +		migrator = cpumask_any(tmigr_available_cpumask);
> > 
> > Considering nohz_full CPUs should be still available.
> > 
> > I don't think there is anything ensuring that, in nohz_full mode,
> > there must be at least one housekeeping CPU that is not domain
> > isolated.
> > 
> > For example if we have two CPUs with CPU 0 being domain isolated
> > and CPU 1 being nohz_full, then there is no migrator to handle CPU
> > 1's
> > global timers.
> > 
> 
> Mmh, good point, didn't think about having the domain isolated and
> nohz_full maps disjointed..
> 
> When that's really the case how do you think we should fall back?
> 
> In the situation you describe, no one is going to be able to handle
> global timers on the nohz_full CPUs, right?
> 
> When this situation really occurs, we could keep one of the domain
> isolated CPUs in the hierarchy. 
> Now, I see on x86 CPU0 cannot be offlined and is not added to
> nohz_full, which would make things considerably easier, but ARM doesn't
> seem to work the same way.
> 
> We could elect a lucky winner (e.g. first or last becoming domain
> isolated) and swap it whenever it becomes offline, until we actually
> run out of those (no online cpu non-nohz_full is left), but I believe
> this shouldn't happen..
> 
> Does this make sense to you?

Well, nohz_full= and isolcpus=, when they are passed together, must contain the
same set of CPUs. And if there is no housekeeping CPU then one is forced, so
it's well handled at this point.

But if nohz_full= is passed on boot and cpusets later create an isolated
partition which spans the housekeeping set, then the isolated partition must
be rejected.

Thanks.

-- 
Frederic Weisbecker
SUSE Labs
