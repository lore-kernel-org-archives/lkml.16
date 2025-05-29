Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68B42A55
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 10:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748513945; cv=none; b=OQNS/Noe+h/0akCRjE3TaWNmHgbflJ2PoeR8yHGFzyx1Kbqm/bFRvmarxRaJRHpPjxJol0DBpGZkObt125sv3A5peLrcgOHlbRRy7832CyJapD82oF7Y8E+5N8/rilz5/ZpWae7J5CwKmWnAREOYd6JzfWyUtw8Y+D9Ya59gAdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748513945; c=relaxed/simple;
	bh=leRUt0lr1lFv3OB0+CJ56Wv2chSMZk1VwdIKjgIDiPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MnODSj8LEDb0T6Wgc6yo0QJPGLxv+F7gKOaFyMxxwnyo6oIEG0ohE53u+isOwyjCl7of2eDdCUKa66+vLU5oewXCbdfpG95UPom1jpUCDX7THdXrCctt/uhqUHiNKz3zKzgnCNCRnk+maF8HQObv/2qywTFQf2R7NTPjiXwgiMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F2AA4113E;
	Thu, 29 May 2025 03:18:44 -0700 (PDT)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A71873F673;
	Thu, 29 May 2025 03:18:58 -0700 (PDT)
Date: Thu, 29 May 2025 12:18:54 +0200
From: Beata Michalska <beata.michalska@arm.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, clm@meta.com,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC][PATCH 0/5] sched: Try and address some recent-ish
 regressions
Message-ID: <aDg0jp4DiPTGnmq5@arm.com>
References: <20250520094538.086709102@infradead.org>
 <20250528195944.GB19261@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528195944.GB19261@noisy.programming.kicks-ass.net>

On Wed, May 28, 2025 at 09:59:44PM +0200, Peter Zijlstra wrote:
> On Tue, May 20, 2025 at 11:45:38AM +0200, Peter Zijlstra wrote:
> 
> > Anyway, the patches are stable (finally!, I hope, knock on wood) but in a
> > somewhat rough state. At the very least the last patch is missing ttwu_stat(),
> > still need to figure out how to account it ;-)
> > 
> > Chris, I'm hoping your machine will agree with these numbers; it hasn't been
> > straight sailing in that regard.
> 
> Anybody? -- If no comments I'll just stick them in sched/core or so.
>
Hi Peter,

I've tried out your series on top of 6.15 on an Ampere Altra Mt Jade
dual-socket (160-core) system, which enables SCHED_CLUSTER (2-core MC domains).
Sharing preliminary test results of 50 runs per setup as, so far, the data
show quite a bit of run-to-run variability - not sure how useful those will be.
At this point without any deep dive, which is probably needed and hopefully
will come later on.


Results for average rps (60s) sorted based on P90

CFG |   min      |  max       |   stdev    |   90th
----+------------+------------+------------+-----------
 1  | 704577.50  | 942665.67  | 46439.49   | 891272.09
 4  | 656313.48  | 877223.85  | 47871.43   | 837693.28
 3  | 658665.75  | 859520.32  | 50257.35   | 832174.80
 5  | 630419.62  | 842170.47  | 47267.52   | 815911.81
 2  | 647163.57  | 815392.65  | 35559.98   | 783884.00

Legend:
#1 : kernel 6.9
#2 : kernel 6.15
#3 : kernel 6.15 patched def (TTWU_QUEUE_ON_CPU + NO_TTWU_QUEUE_DEFAULT)
#4 : kernel 6.15 patched + TTWU_QUEUE_ON_CPU + TTWU_QUEUE_DEFAULT
#5 : kernel 6.15 patched + NO_TTWU_QUEUE_ON_CPU + NO_TTWU_QUEUE_DEFAULT

---
BR
Beata
