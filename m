Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8391F4184
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 16:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738858583; cv=none; b=CeSJOVrDdERMMByBG20TIbTzmLj4RdBmG1Fq3HVv6jiEjO0FGH1MYObtUKvN7Q8mGPsPbJEsWWK4BsPgSpCb1E7UD407MIYT47T4STR6TN+4PaClKxfGDVeg2rnOJZtKwMRfwr4siYlD0LbfNuJw5NSZVhkmb9+ZH3gp5o/j71c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738858583; c=relaxed/simple;
	bh=PeXPpUOcWx4WaMghzP6YInvZVL6x/JAZkGEahIKRFBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sdc3BgEQVtHDfAXxQLsVEj8BdAtwzVeRVQioVR50Ab4bco5uasI4f/yjXjOJZ3lf7XOUa/DEGci6goh6o1CyxEI3aJP96fi8qVLYpLFYTn4AEe9uBB1xK/pB1R9I2SWW3HZovK7xOnLoB9Hwv6Mi7NY5nCsHlB61kkMdSQNR2dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=rzZMdbJE; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="rzZMdbJE"
Date: Thu, 6 Feb 2025 16:16:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738858576;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1IZlSqZZbQ+v7dFcZMYYg2FQblOSM6/wVM/2+9y0alo=;
	b=rzZMdbJEnnIcq9IYLc44Jo9x4ffGAeJ9VX/E+mmwzKEmIeRirGj02td+vP2Yo7U86eb83f
	/zBa//b2O9Ux3Tpf5JDfy+FTcjFBNfWsdW/TQnINajFl7V3MfnIFBtzaliZKX2hwUB3Yub
	PTd5FtyoiEzmFkpZ6oIv593v6qMRyhk=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yosry Ahmed <yosry.ahmed@linux.dev>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Kairui Song <ryncsn@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Minchan Kim <minchan@kernel.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCHv4 02/17] zram: do not use per-CPU compression streams
Message-ID: <Z6TgSaYIf1DnOszP@google.com>
References: <20250131090658.3386285-1-senozhatsky@chromium.org>
 <20250131090658.3386285-3-senozhatsky@chromium.org>
 <CAMgjq7BFUrUY5Xq5Eks4ibqbWgJcca1vqB4kq=otQVyG=23FRw@mail.gmail.com>
 <ryc3rgu567q44d3ck4un5itf77i2os4rqx3ruohivaqscn3rrt@ms5xoipyi72q>
 <CAMgjq7DKveiCJVb4ACSaLFV0Q1_Yd+sbL_X2dgXz6QGYwuNRTw@mail.gmail.com>
 <ysqyikz2jhnvjkhmkgwekbmz6dykvjssut6n3t746tpsscursu@zc6rg5xgk6sp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ysqyikz2jhnvjkhmkgwekbmz6dykvjssut6n3t746tpsscursu@zc6rg5xgk6sp>
X-Migadu-Flow: FLOW_OUT

On Thu, Feb 06, 2025 at 04:22:27PM +0900, Sergey Senozhatsky wrote:
> On (25/02/06 14:55), Kairui Song wrote:
> > > On (25/02/01 17:21), Kairui Song wrote:
> > > > This seems will cause a huge regression of performance on multi core
> > > > systems, this is especially significant as the number of concurrent
> > > > tasks increases:
> > > >
> > > > Test build linux kernel using ZRAM as SWAP (1G memcg):
> > > >
> > > > Before:
> > > > + /usr/bin/time make -s -j48
> > > > 2495.77user 2604.77system 2:12.95elapsed 3836%CPU (0avgtext+0avgdata
> > > > 863304maxresident)k
> > > >
> > > > After:
> > > > + /usr/bin/time make -s -j48
> > > > 2403.60user 6676.09system 3:38.22elapsed 4160%CPU (0avgtext+0avgdata
> > > > 863276maxresident)k
> > >
> > > How many CPUs do you have?  I assume, preemption gets into way which is
> > > sort of expected, to be honest...  Using per-CPU compression streams
> > > disables preemption and uses CPU exclusively at a price of other tasks
> > > not being able to run.  I do tend to think that I made a mistake by
> > > switching zram to per-CPU compression streams.
> > >
> > > What preemption model do you use and to what extent do you overload
> > > your system?
> > >
> > > My tests don't show anything unusual (but I don't overload the system)
> > >
> > > CONFIG_PREEMPT
> > 
> > I'm using CONFIG_PREEMPT_VOLUNTARY=y, and there are 96 logical CPUs
> > (48c96t), make -j48 shouldn't be considered overload I think. make
> > -j32 also showed an obvious slow down.
> 
> Hmm, there should be more than enough compression streams then, the
> limit is num_online_cpus.  That's strange.  I wonder if that's zsmalloc
> handle allocation ("remove two-staged handle allocation" in the series.)
> 
> [..]
> > > Hmm it's just
> > >
> > >         spin_lock()
> > >         list first entry
> > >         spin_unlock()
> > >
> > > Shouldn't be "a big spin lock", that's very odd.  I'm not familiar with
> > > perf lock contention, let me take a look.
> > 
> > I can debug this a bit more to figure out why the contention is huge
> > later
> 
> That will be appreciated, thank you.
> 
> > but my first thought is that, as Yosry also mentioned in
> > another reply, making it preemptable doesn't necessarily mean the per
> > CPU stream has to be gone.
> 
> Was going to reply to Yosry's email today/tomorrow, didn't have time to
> look into, but will reply here.
> 
> 
> So for spin-lock contention - yes, but that lock really should not
> be so visible.  Other than that we limit the number of compression
> streams to the number of the CPUs and permit preemption, so it should
> be the same as the "preemptible per-CPU" streams, roughly.

I think one other problem is that with a pool of streams guarded by a
single lock all CPUs have to be serialized on that lock, even if there's
enough streams for all CPUs in theory.

> The difference, perhaps, is that we don't pre-allocate streams, but
> allocate only as needed.  This has two sides: one side is that later
> allocations can fail, but the other side is that we don't allocate
> streams that we don't use.  Especially secondary streams (priority 1
> and 2, which are used for recompression).  I didn't know it was possible
> to use per-CPU data and still have preemption enabled at the same time.
> So I'm not opposed to the idea of still having per-CPU streams and do
> what zswap folks did.

Note that it's not a free lunch. If preemption is allowed there is
nothing holding keeping the CPU that you're using its data, and it can
be offlined. I see that zcomp_cpu_dead() would free the compression
stream from under its user in this case.

We had a similar problem recently in zswap and it took me a couple of
iterations to properly fix it. In short, you need to synchronize the CPU
hotplug callbacks with the users of the compression stream to make sure
the stream is not freed under the user.
