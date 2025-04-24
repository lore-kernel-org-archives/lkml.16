Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C373B944E
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 14:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745503232; cv=none; b=LszzEBCRNZ0dr1VDh0Np5kf9ppK0DE6rACh8C+0Z4VVokcU+34nYx+8jXtNggiTrLSRRm9pLxcx4stFK530xZ9NWagZPCOqE/8uM4Vnn56AgFA2sx7vEhfYFH4K/3XOzekAO5wwj+epi6l9x2a3L3YsOPuc4kFzzqvegt7NKiYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745503232; c=relaxed/simple;
	bh=bUlne0kRowOWIYQSI6iEKqf2XhfccNVw8DLOf4xerqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e0PdSVolpD56km+Kdupe5fES77TlsUzZXF2Vq22PWfxOZ4hGA7MS+2E3//NTmcFP9eS2bFr6A07MpWOPqL9HU1Cwl7zVtvvevhphyLMyLiHXR6NRoVWbcCSgKhM+WKUJVHhdiPinhxAWanYtF97flbQMhMoRe3oje0Op7C/F4HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=nFqXyt45; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="nFqXyt45"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=faDqkkoJV3hJYa6oEfM5DZioqKC28la5MRVVutbGeFk=; b=nFqXyt451xZ1YI+skVzRvPaQuo
	HnJuz0c4FDvElUMwAnrhSrjwic8Ng/7+iHAMjdzeMq44Rij2o9HmMUtB+6wlho95Jjwk5aIS280O3
	iZN386HO1V4vNIVfp5r9fOa5M8bNo2IQWFRRd8zlgL6EowaXqvgr0D4+upEKd3FWyISR8Lb51BsEj
	7B4mKAm9QMGNxMPULq/CHObgJD8Ul0Ubdp7whfrYjpqDNiMnYZBcZ+50msCEE7RyT9AZL0UnAEsLA
	plKh0fa6mT/AqToIVV3cNfEA/6c6BTy8q7BEeMa7F5jenrrVr5eZggz2iWBCz2aSQt1HQ6nWeVsA5
	2BfzbuXA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7wlH-0000000CWH6-49vo;
	Thu, 24 Apr 2025 13:37:08 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 8564E3003FF; Thu, 24 Apr 2025 15:37:07 +0200 (CEST)
Date: Thu, 24 Apr 2025 15:37:07 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: John Stultz <jstultz@google.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Qais Yousef <qyousef@layalina.io>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Zimuzo Ezeozue <zezeozue@google.com>, Mel Gorman <mgorman@suse.de>,
	Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Metin Kaya <Metin.Kaya@arm.com>,
	Xuewen Yan <xuewen.yan94@gmail.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Suleiman Souhlal <suleiman@google.com>, kernel-team@android.com
Subject: Re: [PATCH v16 4/7] sched: Fix runtime accounting w/ split exec &
 sched contexts
Message-ID: <20250424133707.GB1166@noisy.programming.kicks-ass.net>
References: <20250412060258.3844594-1-jstultz@google.com>
 <20250412060258.3844594-5-jstultz@google.com>
 <20250417111235.GK38216@noisy.programming.kicks-ass.net>
 <CANDhNCq7SETQ7j6ifUoF_Pwiv42RNfv9V3AV+=OWg_U4+gZVbA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANDhNCq7SETQ7j6ifUoF_Pwiv42RNfv9V3AV+=OWg_U4+gZVbA@mail.gmail.com>

On Mon, Apr 21, 2025 at 02:00:34PM -0700, John Stultz wrote:
> On Thu, Apr 17, 2025 at 4:12 AM Peter Zijlstra <peterz@infradead.org> wrote:
> > On Fri, Apr 11, 2025 at 11:02:38PM -0700, John Stultz wrote:
> > > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > > index e43993a4e5807..da8b0970c6655 100644
> > > --- a/kernel/sched/fair.c
> > > +++ b/kernel/sched/fair.c
> > > @@ -1143,22 +1143,33 @@ static void update_tg_load_avg(struct cfs_rq *cfs_rq)
> > >  }
> > >  #endif /* CONFIG_SMP */
> > >
> > > -static s64 update_curr_se(struct rq *rq, struct sched_entity *curr)
> > > +static s64 update_se_times(struct rq *rq, struct sched_entity *se)
> >
> > update_se()
> 
> Sure thing!
> 
> > >  {
> > >       u64 now = rq_clock_task(rq);
> > >       s64 delta_exec;
> > >
> > > -     delta_exec = now - curr->exec_start;
> > > +     delta_exec = now - se->exec_start;
> > >       if (unlikely(delta_exec <= 0))
> > >               return delta_exec;
> > >
> > > -     curr->exec_start = now;
> > > -     curr->sum_exec_runtime += delta_exec;
> > > +     se->exec_start = now;
> > > +     if (entity_is_task(se)) {
> > > +             struct task_struct *running = rq->curr;
> > > +             /*
> > > +              * If se is a task, we account the time against the running
> > > +              * task, as w/ proxy-exec they may not be the same.
> > > +              */
> > > +             running->se.exec_start = now;
> > > +             running->se.sum_exec_runtime += delta_exec;
> > > +     } else {
> > > +             /* If not task, account the time against se */
> > > +             se->sum_exec_runtime += delta_exec;
> > > +     }
> >
> >
> > So I am confused; you're accounting runtime to the actual running task,
> > but then accounting the same runtime to the cgroup of the donor.
> >
> > This seems somewhat irregular.
> 
> So, apologies, as it's been a bit since I've deeply thought on this.
> In general we want to charge the donor for everything since it's
> donating its time, etc. However, without this change, we got some
> strange behavior in top, etc, because the proxy tasks that actually
> ran didn't seem to gain any exec_runtime. So the split of charging
> everything to the donor except the sum_exec_runtime to the actually
> running process (the proxy) made sense.
> 
> Now, for cgroup accounting, it seems like we'd still want to charge
> the donor's cgroup, so whatever restrictions there are in place apply
> to the donor, but it's just when we get to the leaf task we charge the
> proxy instead.
> 
> Does that sound reasonable? Or am I making a bad assumption here
> around the cgroup logic?

Its all rather confusing one way or the other I'm afraid :/

This way when people go add up the task times and compare to cgroups
it doesn't match up.

Also, by adding sum_exec_runtime to curr, but
account_group_exec_runtime() on donor, the cputimer information is
inconsistent.

Whatever we do, it should be internally consistent, and this ain't it.

> > Please consider all of update_curr_task(), and if they all want to be
> > against rq->curr, rather than rq->donor then more changes are needed.
> 
> So I think we are ok here, but it is confusing... see more below.

Yeah, we are okay. I remembered the discussion we had last time I
tripped over this. I just tripped over it again before remembering :-)

> > > @@ -1213,7 +1224,7 @@ s64 update_curr_common(struct rq *rq)
> > >       struct task_struct *donor = rq->donor;
> > >       s64 delta_exec;
> > >
> > > -     delta_exec = update_curr_se(rq, &donor->se);
> > > +     delta_exec = update_se_times(rq, &donor->se);
> > >       if (likely(delta_exec > 0))
> > >               update_curr_task(donor, delta_exec);
> > >
> > > @@ -1233,7 +1244,7 @@ static void update_curr(struct cfs_rq *cfs_rq)
> > >       if (unlikely(!curr))
> > >               return;
> > >
> > > -     delta_exec = update_curr_se(rq, curr);
> > > +     delta_exec = update_se_times(rq, curr);
> > >       if (unlikely(delta_exec <= 0))
> > >               return;
> >
> > I think I've tripped over this before, on how update_curr_common() uses
> > donor and update_curr() curr. This definitely needs a comment. Because
> > at first glance they're not the same.
> 
> I suspect part of the incongruity/dissonance comes from the
> cfs_rq->curr is actually the rq->donor (where rq->donor and rq->curr
> are different), as its what the sched-class picked to run.
> 
> Renaming that I think might clarify things, but I have been hesitant
> to cause too much naming churn in the series, but maybe it's the right
> time to do it if it's causing confusion.
> 
> My other hesitancy there, is around wanting the proxy logic to be
> focused in the core, so the sched-class "curr" can still be what the
> class selected to run, its just proxy might pick something else to
> actually run. But the top level rq->curr not being the cfs_rq->curr is
> prone to confusion, and we already do have rq->donor references in
> fair.c so its not like it's perfectly encapsulated and layered.
> 
> But I'll take a pass at renaming cfs_rq->curr to cfs_rq->donor, unless
> you object.

I was more thinking of a comment near here to clarify. Not sure
cfs_rq->donor makes much sense.
