Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1803226533
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 09:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749634783; cv=none; b=rXYa3FsicZqZgh8hyfvBnTM+o4gG3mXXLEHmK8EZU/yoLKsWrjsn4FMpW/HijJuref16LlOWEz/Se6t5ooba9JFhEj7HC7Nvn4pwJCbrO8/u3mBzRALX/0hbwHzzaiKS9fawq60n8x1ryvbrmJ/0Dq3EfDfFqAqVXEX0yx6zI/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749634783; c=relaxed/simple;
	bh=n58LCx0Q6HSsy3FLeeVAfZTIIHYr5jD+rxbWKbBG9rw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M0zcn05rJ20ZQ3RU3l1fnzCDTH35p5fBPA8cV45d1bnQRW/Y1HfyRjxTvBlMKCaNPhSG96XKhQeocGKo6RbZ/6LhOkvRy7NDLJ5AA23+bqF4Wcbp1JbU18r98ze75DGEqKDU520m5Tx2kS11nI4tS3AWrk4/r8xePMwK9FZnbsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=dgYvIUAJ; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="dgYvIUAJ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Cxjr9KUCKMPOyF7AgQiT3i6Sz3Z2R7PLH7NkrcCxjKA=; b=dgYvIUAJObUSgZWCIiTrbnV8dC
	vIBddDeHiXzBHK1rvjw4IRl4MLKy572HwtFSs1O59/+CXwZ4lure8KtqMIhCUar0dO6i/I7LdpiC3
	OA6N9b8cf8RW341uFVa507aLgZIqgaC4gZoXnfFwWslqJoPBQka3eiMjYGPcCGFGf4Gg87QL93JyP
	m2gfK+22WlzVY+irDIQt+gLO2n8QYuI11nDNq5aTjqCinBYh4gYRYcsEN1AyF0N9esRUmxOjMOsZB
	DVCQYwIGhY7wZHyeq9pSWHNYaPO9ft0vP0Mxw4uHYet9tH5/+xpclWNZh+mM1TGr0lZL0jVTSijfs
	ttvMSglg==;
Received: from 2001-1c00-8d82-d000-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d82:d000:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPHvj-00000002EvT-1pzg;
	Wed, 11 Jun 2025 09:39:35 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 123673021EF; Wed, 11 Jun 2025 11:39:34 +0200 (CEST)
Date: Wed, 11 Jun 2025 11:39:34 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: mingo@redhat.com, juri.lelli@redhat.com, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, clm@meta.com, linux-kernel@vger.kernel.org
Subject: Re: [RFC][PATCH 5/5] sched: Add ttwu_queue support for delayed tasks
Message-ID: <20250611093934.GB2273038@noisy.programming.kicks-ass.net>
References: <20250520094538.086709102@infradead.org>
 <20250520101727.984171377@infradead.org>
 <CAKfTPtDOQVEMRWaK9xEVqSDKcvUfai4CUck6G=oOdaeRBhZQUw@mail.gmail.com>
 <20250606153800.GB39944@noisy.programming.kicks-ass.net>
 <CAKfTPtDhC3nCcWcWSz08nadZDJ0OtbgZ0r3Usjcu6AagGqYcRA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKfTPtDhC3nCcWcWSz08nadZDJ0OtbgZ0r3Usjcu6AagGqYcRA@mail.gmail.com>

On Fri, Jun 06, 2025 at 06:55:37PM +0200, Vincent Guittot wrote:
> > > > @@ -3830,12 +3859,41 @@ void sched_ttwu_pending(void *arg)
> > > >         update_rq_clock(rq);
> > > >
> > > >         llist_for_each_entry_safe(p, t, llist, wake_entry.llist) {
> > > > +               struct rq *p_rq = task_rq(p);
> > > > +               int ret;
> > > > +
> > > > +               /*
> > > > +                * This is the ttwu_runnable() case. Notably it is possible for
> > > > +                * on-rq entities to get migrated -- even sched_delayed ones.
> > >
> > > I haven't found where the sched_delayed task could migrate on another cpu.
> >
> > Doesn't happen often, but it can happen. Nothing really stops it from
> > happening. Eg weight based balancing can do it. As can numa balancing
> > and affinity changes.
> 
> Yes, I agree that delayed tasks can migrate because of load balancing
> but not at wake up.

Right, but this here is the case where wakeup races with load-balancing.
Specifically, due to the wake_list, the wakeup can happen while the task
is on CPU N, and by the time the IPI gets processed the task has moved
to CPU M.

It doesn't happen often, but it was 'fun' chasing that fail around for a
day :/
