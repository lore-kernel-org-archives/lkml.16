Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5A014286
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 15:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748014843; cv=none; b=Z8kyF/WWWsXzK6gxJe9tZwW3pPhKfrz1H1bRLCwLcDYfJlIxWU/QB+GyRdCyA6VdKvbIpajKJvcCMfk6a5qC/HvWowE/NmGTy6YQ9tCgOCn9W6CzSl0RTwunQhjUYbo9NtLqlh1m5FVUbg2uRF9AuPPKZG+qvoizT1Dvn1XeXCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748014843; c=relaxed/simple;
	bh=7SShHhseTkcVUvdD/HmaubB/A4thX3f19PnvsgBdE4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NgEcPJ4SzQMHQTpy7b971h6eBULBIxLWDoD1oyMkQGlYcvlk3YJIfs2/cEAMCo7cTGun0DBxdbB1/tBF1/LY6k7lDuVjfVBNcH2tN4l6MpFt6H5bW693tUQw77GC795tyvm6jqJMtT4M7UaSUq3hvO9FpN+iML/QZtquYcE6a6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=VKQ9l2FG; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="VKQ9l2FG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=x+nRmOtaD3karhz88LSUg85diZHlXcrIVoAQuQ0DbDw=; b=VKQ9l2FGMfscGm8MfxP0gq+S/i
	p5HBZEBEWtOquLk6lrS4DjZQhh3hcS1s/T2Lh2ugsAmjPRBKzMnvjJI4tIoJJT7OwODZBOWCfyBkL
	WrJ4yRH6XK9C3FoFviiMvpdZqzlUSOS7xid4SD+v4Cq3GhEcY06tC+QQTaE5vWWE5LQHpf73Xxh5O
	/RNZhSUiHo/G8nNIfEX3uFR7U9CEC+4ZNOmGb4MRrolm8XAyEOVhcGcCQut9dhRPk0CvYWHpnbDEK
	uLCRovmNzY5TbU+cI+TjOdYYeVmBZZr40FcxC/rCyXdnJW74//VY0lGbE8UX1/0/sDiLzQNBvn4+Z
	jfd2aoCQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uIUVc-00000001LZo-3Urd;
	Fri, 23 May 2025 15:40:33 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id E5FC9300472; Fri, 23 May 2025 17:40:31 +0200 (CEST)
Date: Fri, 23 May 2025 17:40:31 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>, Chris Mason <clm@meta.com>,
	linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>,
	vschneid@redhat.com, Juri Lelli <juri.lelli@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: scheduler performance regression since v6.11
Message-ID: <20250523154031.GM39944@noisy.programming.kicks-ass.net>
References: <20250509194955.GA25798@noisy.programming.kicks-ass.net>
 <20250512180846.GA25891@noisy.programming.kicks-ass.net>
 <2f394a01-1cd9-4719-9394-647d8731cf3f@meta.com>
 <d3c8527f-ffaf-4463-a305-17ca21a06ce8@meta.com>
 <20250516101822.GC16434@noisy.programming.kicks-ass.net>
 <2084b7d9-bb4f-4a5e-aaec-98e07b3edc2e@arm.com>
 <20250520193831.GB39944@noisy.programming.kicks-ass.net>
 <20250521145447.GA31726@noisy.programming.kicks-ass.net>
 <20250522084844.GC31726@noisy.programming.kicks-ass.net>
 <20250522150035.GB1065351@cmpxchg.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522150035.GB1065351@cmpxchg.org>

On Thu, May 22, 2025 at 11:00:35AM -0400, Johannes Weiner wrote:

> Ah right, since all the ancestor walks would ultimately end up at the
> system's seq anyway. And always have, really.
> 
> It does stretch the critical section, of course.

Right, with a cost proportional to the depth of the cgroup tree. So deep
trees will have it worse.

> I ran perf bench
> sched messaging to saturate all CPUs in state changes and then read a
> pressure file 1000x. This is on a 32-way machine:
> 
>      0.18%     +1.34%  [kernel.kallsyms]     [k] collect_percpu_times
> 
> and annotation shows it's indeed retrying on the seq-read a bit more.
> 
> But that seems well within tolerance, and obviously worth it assuming
> it fixes the cpu_clock() regression on the sched side.

Right, it appears it does :-)

> At that point, though, it probably makes sense to move seq out of
> psi_group_cpu altogether? More for clarity, really - it won't save
> much right away given that deliberate 2-cacheline-layout.
> 
> /* Serializes task state changes against aggregation runs */
> static DEFINE_PER_CPU(seqcount_t, psi_seq);

Sure, let me do that.

> Otherwise, the patch looks great to me. Thanks for including a couple
> of cleanups as well.

Yeah, mostly due to the back and forth -- my earlier ugly hack added
more tree iterations and me being lazy I didn't want to type all that
out :-)

Also, I've been migrating to using neovim with clangd language server,
and that doesn't much like the weird scheduler build setup, so I added
sufficient headers for the thing to 'compile' as a stand alone unit
(which is what clangd does).

I'll break out this patch and clean up all the sched bits to be clangd
clean -- I've been sitting on that patch long enough.

> Acked-by: Johannes Weiner <hannes@cmpxchg.org>

Thanks!
