Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB92204C3B
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 15:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747839735; cv=none; b=AcZ5c82fX3mTm6+1Ts01toPbY/N4PzvEOko+cO6MP/pcW/K7Ex5i3w/cY/NWkyh9+axdQHBfZHTToTaiw118qsIsVcXqWKJVRD3QLh6LDRWoioO0MpbPluIHXpaGQvNgkoh6jZZXeQKJIZOBJSq+byMC5UVPtdVQQUJh64I4oGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747839735; c=relaxed/simple;
	bh=wFk2s722AC7ZWRjk24JuDJ6KEHN2+8h8LjJDXN+llV0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RQyxIGmKBfmm3N+qWmQ8V7O7ztYmD3ogV+FS1Ib708VUyORfJ7a/CEICHPHIj8BzcesaOsGA5b2VKAJdH4LjjtHdTj38mL9LkBHjR3Tv6kgYPil/HiYYnQeKxqywlOpxyM205OixlAkCv7tj3ywBe7eiHA5j1cK5m3l+ZVsvql4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=sEQXlvCS; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="sEQXlvCS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ocJ6s7DVCAU3sQ814d9gi8XAVaSToxfGwrP2uEkiaqQ=; b=sEQXlvCSlDECx+xABg0VFnqwHE
	skFMu/QFi5dW8g16syXYr/5YM7qv9P/HHcOew+i7xXkDMVMn2fYGizBAHceADONYkTvYrEQRRUmQb
	LHLuJ2TmiXXmxZ2fo3IFlgVtKofEpuo3MWmwJ5y00DaGkjvvugW7YN3D9CLKun1O+xLOkQy3jkSrN
	tzNCmOPpY+F1vHNeYB8OzjQqdZ+bAM0wBtoPuUgBAeWjFhKubmb8DZBZbFK2qblzlqlwCtTF7rXVm
	G3EzMgwQAAbxGf4FgN36Dhbj29MBgV2IsygCXBT8GEuKZGXpyeKWZAkRvd0Hi52XRTcpbbAtvt/1/
	Iu7EOtUg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHkxM-00000004m3t-0n5U;
	Wed, 21 May 2025 15:02:08 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 68371300583; Wed, 21 May 2025 17:02:07 +0200 (CEST)
Date: Wed, 21 May 2025 17:02:07 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: Chris Mason <clm@meta.com>, linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@kernel.org>, vschneid@redhat.com,
	Juri Lelli <juri.lelli@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: scheduler performance regression since v6.11
Message-ID: <20250521150207.GD24938@noisy.programming.kicks-ass.net>
References: <1e3c711f-8c96-4c39-bbe2-7742940d1d31@meta.com>
 <20250509194955.GA25798@noisy.programming.kicks-ass.net>
 <20250512180846.GA25891@noisy.programming.kicks-ass.net>
 <2f394a01-1cd9-4719-9394-647d8731cf3f@meta.com>
 <d3c8527f-ffaf-4463-a305-17ca21a06ce8@meta.com>
 <20250516101822.GC16434@noisy.programming.kicks-ass.net>
 <2084b7d9-bb4f-4a5e-aaec-98e07b3edc2e@arm.com>
 <20250520193831.GB39944@noisy.programming.kicks-ass.net>
 <5cf1790a-3eed-4c0a-8a31-b3802c5d9b35@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5cf1790a-3eed-4c0a-8a31-b3802c5d9b35@arm.com>

On Wed, May 21, 2025 at 04:02:46PM +0200, Dietmar Eggemann wrote:
> On 20/05/2025 21:38, Peter Zijlstra wrote:
> > On Tue, May 20, 2025 at 04:38:09PM +0200, Dietmar Eggemann wrote:
> > 
> >> 3840cbe24cf0 - sched: psi: fix bogus pressure spikes from aggregation race
> >>
> >> With CONFIG_PSI enabled we call cpu_clock(cpu) now multiple times (up to
> >> 4 times per task switch in my setup) in:
> >>
> >> __schedule() -> psi_sched_switch() -> psi_task_switch() ->
> >> psi_group_change().
> >>
> >> There seems to be another/other v6.12 related patch(es) later which
> >> cause(s) another 4% regression I yet have to discover.
> > 
> > Urgh, let me add this to the pile to look at. Thanks!
> 
> Not sure how expensive 'cpu_clock(cpu)' is on bare-metal.
> 
> But I also don't get why PSI needs per group 'now' values when we
> iterate over cgroup levels?

IIUC the read side does something like:

 real-read + guestimate(now, read-time);

And if the time-stamp is from before the write_seqcount_begin(), the
guestimate part goes side-ways.

My 'fix' is fairly simple straight forward brute force, but ideally this
whole thing gets some actual thinking done -- but my brain is fried from
staring at the wakeup path too long and I need to do simple things for a
few days ;-)
