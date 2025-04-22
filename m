Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C686AA59
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 00:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745280410; cv=none; b=RGk9OD1jKHJkTAo+K4uCiPtAVdqW+Uuvx4KDu+nBeNygplL8QtHM7EfYv1CJv461+eeTQ6icH1Q2qAU7qjP7HZUhcEFCzMbaYQkuWO1KH2lJD+tzJn/SbbdS+2qnaghHme89H6BCjPTc8F6Ymt2hRg171YY2FaDQ5XtMCL6OXKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745280410; c=relaxed/simple;
	bh=gaJ8CNHhuRpy69oqCd2Ln/ciIYRxbwnl4yp/yguh25g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lpzu/zB+QNBYllvf723oNQ+O/QcBbVIBc2j3xTMZ3rEvItQsNciFZfFxH3Ev6y/ye+zROax/vOvg3RX/WcRrTuGs+yWaL6Pbfln6s7hNzEsxyKHedJQO87FQCoGNfKwRz2rRxVYS4wJBsfHj5Vno7FCdIRGAazVmwxeN+igRZNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=kJ7ZbGq8; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="kJ7ZbGq8"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-227c7e4d5feso8873375ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 17:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1745280408; x=1745885208; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QUH+zFjzG8QJ2B56eHcHCDW8HiQiaQrWAYR3RSYagxA=;
        b=kJ7ZbGq852RoxK403axaEV4US3NFNkL09/GI/7tCTrQJRWdjmCEQi7h2p+F7ZGnSzq
         iS9TLE/ezaRqflAHiDQRsxRA2XGFHdaoBoLB1KxCipsnULciwoffL3uTiC3JwGDMMOYC
         8wg4nfHWaDLmF1qvBnumCmG4a5/jpzKr5re+EaJpwZz7Po+81/Y3qmikt9+zh0/KGtLj
         zojqX6Ym9VQzV29D4ie0vi9Kbg7uYlg6n/hOMnl6rFIx+d40tsHDM8QWwNumv9lQoHBO
         Tw+Xc080Pg55zmt0lN0RIZ/nnTPuFljTL1rhO3EnIpoy2fsqmwC7/0FG5LrVityuPA7j
         5psg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745280408; x=1745885208;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QUH+zFjzG8QJ2B56eHcHCDW8HiQiaQrWAYR3RSYagxA=;
        b=WDeIbK/v1wPGjwl7l/z1UiYAvchnq6eTzRWUEJZ/UP6BO8X4X/i9laNQDU4NOgRSUD
         OS/uM66AMeijI7vTKUqtIdHvPhqfN2VqR6p8J2Bx3sXBJmK/9FwZ65D20bG2XdAXGL9K
         QNinVFkyOMCeXQiFhwkaqmsYs40zR3jdnJGxPRIPbN0hW3PJXmwoU+Ezys6gq4SfJaas
         Bix832D9JLiGTZSile2f5+KG0dzqHlf8VZfeEheA4kRsXBDO3ptJ3WRlu6B5YpTR2Hn9
         fpeG37+pMD5tkkSN7cYXCoL3kKIY9yy0ILOo2PNlqotJIxhTKbFN826iiDM/Z0m1w7c1
         drcw==
X-Forwarded-Encrypted: i=1; AJvYcCXDDCVv98cZXqCDEQxLJWxbaE1L4q9UXSmRjyV6gxdZOWEAIhzuieWVZ0t9LFI7AnYtbCUEgJ/v10CQdL8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyC8FNFOl2pDAzDHKP1c/LdGmqkrDJBGt5P6Pw6xjHN/RS9gbzp
	QiElNrtcXFeARPvcD1C8LC5pQKE+kHOQBay0u7tqZ4+9KoiaQX7okoM08UsvKXWKQa1hhpvY4p7
	l
X-Gm-Gg: ASbGncvWy7ikLdSsQlj9RgLwIVuiB77RilnTOPKnTsZPytYPoHfFozzgNhC8nKNSHM+
	q9otMqFWnykf0kbA+3m9WXscaHzgW9XZwLnrWA+qjSwkbTbwYYk72ZJ7Hf+P6M9tO4DcQcCYwdC
	KD2heqzqyJUNlh9MI0qjX4XJICmaZMFCb70vKpDbse8Wue5aVw7rpArkae4uxZrv+uyRXRB0tcg
	5CpvSsR6wM3hoYhpAU4WZsVlVapOcuW1SVW0TUTivNfGuvw0DbPnld7TeWmVB/BKbPZawg4GyZj
	uv+N3VKuP3G355WwEmP6MS8BvTj0Tw0a0w==
X-Google-Smtp-Source: AGHT+IGEj5Tc9GtP9AEqFXLd/raNtdiK1BvYNx7GDQlh/ZRDY3vZrH9qR62I82ueFCQMiWAmU1ll3w==
X-Received: by 2002:a17:903:1a2d:b0:224:88c:9255 with SMTP id d9443c01a7336-22c535dd409mr90831785ad.3.1745280407898;
        Mon, 21 Apr 2025 17:06:47 -0700 (PDT)
Received: from telecaster ([2620:10d:c090:500::5:806])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50fda18esm71217805ad.212.2025.04.21.17.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 17:06:47 -0700 (PDT)
Date: Mon, 21 Apr 2025 17:06:45 -0700
From: Omar Sandoval <osandov@osandov.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Rik van Riel <riel@surriel.com>, Chris Mason <clm@meta.com>,
	Pat Cody <pat@patcody.io>, mingo@redhat.com, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, linux-kernel@vger.kernel.org, patcody@meta.com,
	kernel-team@meta.com, Breno Leitao <leitao@debian.org>
Subject: Re: [PATCH] sched/fair: Add null pointer check to pick_next_entity()
Message-ID: <aAbdlTISuaJnc5AG@telecaster>
References: <20250320205310.779888-1-pat@patcody.io>
 <20250324115613.GD14944@noisy.programming.kicks-ass.net>
 <7B2CFC16-1ADE-4565-B555-7525A50494C2@surriel.com>
 <20250402082221.GT5880@noisy.programming.kicks-ass.net>
 <b378f48593ca7449257a1bb55e78b186d88cd9f1.camel@surriel.com>
 <20250415080235.GK5600@noisy.programming.kicks-ass.net>
 <20250416124442.GC6580@noisy.programming.kicks-ass.net>
 <abffc286b637060f631925f9b373fad114d667d6.camel@surriel.com>
 <20250418154438.GH17910@noisy.programming.kicks-ass.net>
 <aALk9DVfjTTHGdvA@telecaster>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aALk9DVfjTTHGdvA@telecaster>

On Fri, Apr 18, 2025 at 04:49:08PM -0700, Omar Sandoval wrote:
> On Fri, Apr 18, 2025 at 05:44:38PM +0200, Peter Zijlstra wrote:
> > On Wed, Apr 16, 2025 at 10:19:42AM -0400, Rik van Riel wrote:
> > 
> > > The most common warning by far, hitting
> > > about 90% of the time we hit anything
> > > in avg_vruntime_validate is the
> > > WARN_ON_ONCE(cfs_rq->avg_vruntime != vruntime)
> > > 
> > > The most common code path to getting there,
> > > covering about 85% of the cases:
> > > 
> > > avg_vruntime_validate
> > > avg_vruntime_sub
> > > __dequeue_entity
> > > set_next_entity
> > > pick_task_fair
> > > pick_next_task_fair
> > > __pick_next_task
> > > pick_next_task
> > > __schedule
> > > schedule
> > 
> > (I'm assuming zero_vruntime patch here, the stock kernel has more
> > problems vs min_vruntime getting stuck in the future etc..)
> > 
> > So I have a theory about this. Key is that you're running a PREEMPT-NONE
> > kernel.
> > 
> > There is one important site the overflow patch does not cover:
> > avg_vruntime_update().
> > 
> > However, due to PREEMPT_NONE, it is possible (Chris mentioned direct
> > reclaim and OOM) to have very long (in-kernel) runtimes without
> > scheduling.
> > 
> > (I suppose this should be visible by tracing sched_switch)
> > 
> > Were this to happen, then avg_vruntime_add() gets to deal with 'key *
> > weight' for a relatively large key. But per the overflow checks there,
> > this isn't hitting (much).
> > 
> > But then we try and update zero_vruntime, and that is doing 'delta *
> > cfs_rq->avg_load', and avg_load is a larger number and might just cause
> > overflow. We don't have a check there.
> > 
> > If that overflows then avg_vruntime is buggered, but none of the
> > individual tree entities hit overflow, exactly as you observe.
> > 
> > I've modified the zero_vruntime patch a little (new one below) to update
> > zero_vruntime in update_curr(). Additionally, I have every tick re-align
> > it with the tree avg (the update and the tree can drift due to numerical
> > funnies).
> > 
> > This should ensure these very long in-kernel runtimes are broken up in
> > at most tick sized chunks, and by keeping zero_vruntime more or less
> > around the actual 0-lag point, the key values are minimized.
> > 
> > I should probably go play with a kernel module that spins for a few
> > seconds with preemption disabled, see if I can make it go BOOM :-) But
> > I've not yet done so.

[snip]

> >  static inline u64 cfs_rq_min_slice(struct cfs_rq *cfs_rq)
> > @@ -850,6 +811,7 @@ RB_DECLARE_CALLBACKS(static, min_vruntim
> >  static void __enqueue_entity(struct cfs_rq *cfs_rq, struct sched_entity *se)
> >  {
> >  	avg_vruntime_add(cfs_rq, se);
> > +	update_zero_vruntime(cfs_rq);
> 
> Won't this double-count cfs_rq->curr in the avg_vruntime() calculation
> in update_zero_vruntime()? When cfs_rq->curr->on_rq, put_prev_entity()
> calls this with se == cfs_rq->curr _before_ setting cfs_rq->curr to
> NULL. So the avg_vruntime_add() call will add entity_key(cfs_rq->curr)
> to cfs_rq->avg_vruntime and se_weight(cfs_rq->curr) to cfs_rq->avg_load.
> Then update_zero_vruntime() calls avg_vruntime(), which still sees
> curr->on_rq and will add curr's key and weight again. This throws
> zero_vruntime off, maybe by enough to bust zero_vruntime and/or
> avg_vruntime?
> 
> Should the call to update_zero_vruntime() go before avg_vruntime_add()?
> 
> Thanks,
> Omar

Hey, Peter,

We haven't been able to test your latest patch, but I dug through some
core dumps from crashes with your initial zero_vruntime patch. It looks
like on just about all of them, the entity vruntimes are way too spread
out, so we would get overflows regardless of what we picked as
zero_vruntime.

As a representative example, we have a cfs_rq with 3 entities with the
follow vruntimes and (scaled down) weights:

vruntime           weight
39052385155836636  2      (curr)
43658311782076206  2
42824722322062111  4886

The difference between the minimum and maximum is 4605926626239570,
which is 53 bits. The total load is 4890. Even if you picked
zero_vruntime to be equidistant from the minimum and maximum, the
(vruntime - zero_vruntime) * load calculation in entity_eligible() is
doomed to overflow.

That range in vruntime seems too absurd to be due to only to running too
long without preemption. We're only seeing these crashes on internal
node cgroups (i.e., cgroups whose children are cgroups, not tasks). This
all leads me to suspect reweight_entity().

Specifically, this line in reweight_entity():

	se->vlag = div_s64(se->vlag * se->load.weight, weight);

seems like it could create a very large vlag, which could cause
place_entity() to adjust vruntime by a large value. (place_entity() has
a similarly suspect adjustment on se->vlag, only update_entity_lag()
clamps it).

I'll try to reproduce something like this, but do you have any thoughts
on this theory in the meantime?

Thanks,
Omar
