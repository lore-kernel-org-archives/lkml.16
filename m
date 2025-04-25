Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1CC2522B6
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 12:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745585763; cv=none; b=PpNQogBT5fst1CCI5TFBY40Y/V9fvjascS8NZVp7ILo1ToY58ODSPTUyNCbhZEfCSx2ybSl5CmDh3GRqBf9Bn7Y3EejkusUICUWDljbZQf4SbpprNMshMoBLY2xh1VVyRgOL6SGaRLbDhpnm+/ZJj19icH5WhWae/YicFDJJMsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745585763; c=relaxed/simple;
	bh=rtvSQs5sn8DFskoVmNHkXHQ5Il3xEAwLCSOmMITKQ7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=so4nokGIvHVi7gveilzDix7b9icYLIgmCJdgvlBbQ+tIZkClrSEUgB6x4rItg0iFoFKt58rZ2sytmSoqFQBiBnz/UR8mDrXNJtSDP5G+JF2T2LNKIPqq50WLdjabcALc+vFCrTJ5/M5gLpJZGao8mLIL/2ed8HL0v5u411MtXwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=HYmEnUGv; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="HYmEnUGv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=KqkXKBaPTXbUkNJ2jE53HryeIbvsc/d33HgRQekEnP4=; b=HYmEnUGvudEfggLD3HOx7Khwy4
	re7Q7ENwHVjCc1NxTeUHRVJO791mb+5XD0ji3U+5nSzsAH5c7XFU2ovhCS8YFp59Vh/jS2zVaHI5c
	WIhd68WT6SKuUkmbxe507XNvs23ak+nPHG1H5kkAEwPd3hFnRWLQePhLmQCFgTV9WAUbJF0FP4uOW
	h0QYZNYWxMniCv1yueaT5P0qOI7/wHYlaUqW7MilVw/yn9aYUW3F+F+hBUdkFR7jVyuVkJVYj0IPf
	6pPY+GsTf8fgneJKwXagtKN25f15XnPCoVm61Y9lXUMygN3SITDaZO0g/jaIhruFO5cyWrNrGM3H1
	1Yy2orLw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Iaz-0000000EWnJ-0vfx;
	Fri, 25 Apr 2025 12:55:57 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 994463003C4; Fri, 25 Apr 2025 14:55:56 +0200 (CEST)
Date: Fri, 25 Apr 2025 14:55:56 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: "Liang, Kan" <kan.liang@linux.intel.com>
Cc: mingo@redhat.com, acme@kernel.org, namhyung@kernel.org,
	irogers@google.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 0/5] Several fixes for group flag and
 counters-snapshotting
Message-ID: <20250425125556.GD22125@noisy.programming.kicks-ass.net>
References: <20250424134718.311934-1-kan.liang@linux.intel.com>
 <20250424142528.GD1166@noisy.programming.kicks-ass.net>
 <c919a36c-f343-48ce-a262-401159c5bf30@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c919a36c-f343-48ce-a262-401159c5bf30@linux.intel.com>

On Thu, Apr 24, 2025 at 12:00:02PM -0400, Liang, Kan wrote:
> 
> 
> On 2025-04-24 10:25 a.m., Peter Zijlstra wrote:
> > On Thu, Apr 24, 2025 at 06:47:13AM -0700, kan.liang@linux.intel.com wrote:
> >> From: Kan Liang <kan.liang@linux.intel.com>
> >>
> >> The patch series includes several fixes for the new Intel features.
> >>
> >> The first 4 patches are to fix the group flag issue which impacts the
> >> branch counters, PEBS counters-snapshotting and ACR.
> >> The V1 can be found at
> >> https://lore.kernel.org/lkml/20250423221015.268949-1-kan.liang@linux.intel.com/
> >>
> >> The last patch is to fix an issue of counters-snapshotting.
> >> The V1 can be found at
> >> https://lore.kernel.org/lkml/20250204210514.4089680-1-kan.liang@linux.intel.com/
> >>
> >> Kan Liang (5):
> >>   perf/x86/intel: Only check the group flag for X86 leader
> >>   perf/x86/intel: Check the X86 leader for pebs_counter_event_group
> >>   perf/x86/intel: Check the X86 leader for ACR group
> >>   perf/x86: Optimize the is_x86_event
> >>   perf/x86/intel/ds: Fix counter backwards of non-precise events
> >>     counters-snapshotting
> > 
> > It didn't apply cleanly,
> 
> Sorry for it.
> 
> > but I stomped on it and pushed out new
> > perf/urgent and perf/core branches that contain these patches. Hopefully
> > I didn't mess it up ;-)
> 
> Something is missed in this patch 5d4d71ebc737 ("perf/x86/intel: Only
> check the group flag for X86 leader")
> 
> diff --git a/arch/x86/events/perf_event.h b/arch/x86/events/perf_event.h
> index a73b1ff031b2..1f72a4f77b5c 100644
> --- a/arch/x86/events/perf_event.h
> +++ b/arch/x86/events/perf_event.h
> @@ -119,7 +119,7 @@ static inline bool check_leader_group(struct
> perf_event *leader, int flags)
> 
>  static inline bool is_branch_counters_group(struct perf_event *event)
>  {
> -	return check_leader_group(event->group_leader, PERF_X86_EVENT_PEBS_CNTR);
> +	return check_leader_group(event->group_leader,
> PERF_X86_EVENT_BRANCH_COUNTERS);
>  }
> 
>  static inline bool is_pebs_counter_event_group(struct perf_event *event)

Right.

> @@ -1123,7 +1123,6 @@ static struct perf_pmu_format_hybrid_attr
> format_attr_hybrid_##_name = {\
>  	.pmu_type	= _pmu,                                         \
>  }
> 
> -int is_x86_event(struct perf_event *event);
>  struct pmu *x86_get_pmu(unsigned int cpu);
>  extern struct x86_pmu x86_pmu __read_mostly;

See, that isn't there in tip/perf/urgent :-)


I've pushed out an updated set. Please check.
