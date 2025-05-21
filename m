Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40233DDD2
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 19:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747854065; cv=none; b=Oh8OVcSir4jQLeCn/EE+cUwibC4p+MEm2k/DuND9wtLhTSyD/NcUXPiCWPiykfDiWePqTREvpwLsv6QYVJv4tAMIyq6e195skKfrFveK5/lFe/40ZrM5fZQmkQU1NHQxD8QgDPSBBC8NVwBGjezzFObHaQC6WcFS1WzF01rmfHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747854065; c=relaxed/simple;
	bh=Mf+9u3n1+ZhDtsOugq2sUG5Qonj835vOoXekrUgBDeo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qfqqxbM8W55ks6UGf6e04SvU3dCULaKKK25G1dTqPYEyT4JKMKMjjQg8Me7CG4vFpTxdnFlsYNkAnKPKCAddRGyHY2lBPTrl5sO4Xcx1d1ZmeZKjcgeYIhWMVGgn7qWLo8d0rQikMRmocx2+jb85llncvRagBE5gsuzpsV+hRK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=HKN523fA; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="HKN523fA"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=fpjugl8iHOvcSiR+d6VL0JPQ8PGDwfqlgoGx5+cGGXU=; b=HKN523fAHdSg6Y2Xat8CXnSfKm
	mFlxintsgNT+KFVfJsVVhNU/+410IHePeLEEKCxDMuhpNcmFxoPWgrfxw6kWyWHapWoDruA0iUgxL
	uuYj5PARpicsO1PslwXawkzEyNXjN4gR0H3qaiKUjQJ9Cudt1EoocPb7/o27Uve7fxuknBFEfMFM8
	bE6BMFsWIRDqlHvuufux55mr5EZ6721ofL9wMFcdJ6chawtmMP3sZKNY6UHAqA55lCHOY7AnTqTF4
	uVCRJDKdDwPJCZC5pojTln41zODX8QTh/5HYwpwCn8mNxTIJ2rnjdzf9YFlKR7HHJBhq26NTD7lOd
	K+zaptOA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uHogT-00000000xiD-17HF;
	Wed, 21 May 2025 19:00:57 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id A1E1A300583; Wed, 21 May 2025 21:00:56 +0200 (CEST)
Date: Wed, 21 May 2025 21:00:56 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: Chris Mason <clm@meta.com>, linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@kernel.org>, vschneid@redhat.com,
	Juri Lelli <juri.lelli@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: scheduler performance regression since v6.11
Message-ID: <20250521190056.GB31726@noisy.programming.kicks-ass.net>
References: <1e3c711f-8c96-4c39-bbe2-7742940d1d31@meta.com>
 <20250509194955.GA25798@noisy.programming.kicks-ass.net>
 <20250512180846.GA25891@noisy.programming.kicks-ass.net>
 <2f394a01-1cd9-4719-9394-647d8731cf3f@meta.com>
 <d3c8527f-ffaf-4463-a305-17ca21a06ce8@meta.com>
 <20250516101822.GC16434@noisy.programming.kicks-ass.net>
 <2084b7d9-bb4f-4a5e-aaec-98e07b3edc2e@arm.com>
 <20250520193831.GB39944@noisy.programming.kicks-ass.net>
 <5cf1790a-3eed-4c0a-8a31-b3802c5d9b35@arm.com>
 <20250521150207.GD24938@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521150207.GD24938@noisy.programming.kicks-ass.net>

On Wed, May 21, 2025 at 05:02:07PM +0200, Peter Zijlstra wrote:
> On Wed, May 21, 2025 at 04:02:46PM +0200, Dietmar Eggemann wrote:
> > On 20/05/2025 21:38, Peter Zijlstra wrote:
> > > On Tue, May 20, 2025 at 04:38:09PM +0200, Dietmar Eggemann wrote:
> > > 
> > >> 3840cbe24cf0 - sched: psi: fix bogus pressure spikes from aggregation race
> > >>
> > >> With CONFIG_PSI enabled we call cpu_clock(cpu) now multiple times (up to
> > >> 4 times per task switch in my setup) in:
> > >>
> > >> __schedule() -> psi_sched_switch() -> psi_task_switch() ->
> > >> psi_group_change().
> > >>
> > >> There seems to be another/other v6.12 related patch(es) later which
> > >> cause(s) another 4% regression I yet have to discover.
> > > 
> > > Urgh, let me add this to the pile to look at. Thanks!
> > 
> > Not sure how expensive 'cpu_clock(cpu)' is on bare-metal.
> > 
> > But I also don't get why PSI needs per group 'now' values when we
> > iterate over cgroup levels?
> 
> IIUC the read side does something like:
> 
>  real-read + guestimate(now, read-time);
> 
> And if the time-stamp is from before the write_seqcount_begin(), the
> guestimate part goes side-ways.
> 
> My 'fix' is fairly simple straight forward brute force, but ideally this
> whole thing gets some actual thinking done -- but my brain is fried from
> staring at the wakeup path too long and I need to do simple things for a
> few days ;-)

Ah, what probably wants to be done is move to a single seqcount_t per
CPU. It makes no sense to have this per group.
