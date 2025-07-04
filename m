Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020F329E114
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 08:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751617606; cv=none; b=Sw8pYnzjeNI9i0kdd+LQTY5lwP4docgnjd1mNfyW7iC+qQPkmCoiDdhodaZ8fj/5tciax2uiUluseeoi6K/ZAGyKG91bVh98eUuQ54TjogmH3PniFySBL4HDW598rrkNyk+7IHdYGaE6okmL21lSaXLeip0oiGsPze7m6z7s4DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751617606; c=relaxed/simple;
	bh=JQrIRbe58PCGQiKH7ICA/VJBqVvZRsRprm11mamR2Sw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I6+OTjJEekEKbIGNtVCyexcUOzETnKtIXZJ2ctK/aMxp7dnzwM/73qZsgSWA1H0qXRMgp7QAcEB/H9rUoE5U/xMwWt6WfRCvA12Xru9gzcB60jVxaTn6vo0EHbreNIQ9uipiEY3ZbDL1WTVvvQx0+i7RPghOIOTax59zBgMx68Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=StbeyWvE; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="StbeyWvE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=bS54nv+4AaRiHW85Bipm2BMsS6RI2YCIMi2UoGsRemo=; b=StbeyWvEHmr5aDijIHML5yK/fU
	XYKUhU4oxNq7jq1Ku0UfrcVzgkDrocyIdBTzDXQbr3zcIklJ2uKkkcZ/VeYeVBk1cOxEcHfwPdNmd
	kawIr3eL7RlVhcsFlh1qGdCTr+aCQq3uOd44wIwwtxw2+mqy/ftHDeScoR1PaKjWxnET6JdI+EnFz
	wSw54O6JzyBhUognF2ywwBAHt5KML19n6UbBylZaMXRUfmcTlRKRIGfH0QOpzc40kVFf7bMiha3vF
	5gb4DKVZ8aC28EHx9GvtR5QdFVB0mnhAoVlo3l0IMaKkppeT/Iu/xWUogd+GOVqI9eg2HTR+l1ZRn
	OYFjTouw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXbkh-00000007rCC-3q3B;
	Fri, 04 Jul 2025 08:26:36 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 72FFB300212; Fri, 04 Jul 2025 10:26:35 +0200 (CEST)
Date: Fri, 4 Jul 2025 10:26:35 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Libo Chen <libo.chen@oracle.com>
Cc: "Chen, Yu C" <yu.c.chen@intel.com>, Michal Hocko <mhocko@suse.com>,
	Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Tim Chen <tim.c.chen@intel.com>, linux-kernel@vger.kernel.org,
	Jirka Hladky <jhladky@redhat.com>,
	Srikanth Aithal <Srikanth.Aithal@amd.com>,
	Suneeth D <Suneeth.D@amd.com>
Subject: Re: [PATCH] sched/numa: Fix NULL pointer access to mm_struct durng
 task swap
Message-ID: <20250704082635.GD2001818@noisy.programming.kicks-ass.net>
References: <20250703072608.GS1613200@noisy.programming.kicks-ass.net>
 <aGZNTtJuCyHJE_25@tiehlicka>
 <20250703115006.GT1613200@noisy.programming.kicks-ass.net>
 <aGZxFRVxHouLaMPg@tiehlicka>
 <b4891cca-4da3-4411-bc9c-669118bf825a@intel.com>
 <e944b504-a852-4f07-a514-7dd99e63b888@oracle.com>
 <20250703123626.GW1613200@noisy.programming.kicks-ass.net>
 <0182cc94-c557-4ce5-b245-fb1fd54bc59b@oracle.com>
 <20250703141800.GX1613200@noisy.programming.kicks-ass.net>
 <12b84e27-f9b1-477e-8e56-4b7c6727e86b@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12b84e27-f9b1-477e-8e56-4b7c6727e86b@oracle.com>

On Thu, Jul 03, 2025 at 04:35:42PM -0700, Libo Chen wrote:

> Probably not as bad as you may think. Systems with one NUMA node or NUMA
> balancing disabled (which will be most of the machines) won't be affected
> by this at all , task_numa_migrate() is also ratelimited so it doesn't get
> touched nearly as often as most of other scheduler events.
> 
> If this is on a really hot and critical path that most of us have to take,
> such as wakeup, I won't argue with you at all. I don't want to be too
> persistent here, it's fine to use eBPF with the existing tracepoints. I
> just think this is convenient and doesn't really hurt those who don't care
> about these numbers. 

Its not about this one path per-se, more a general rant on the 'merit'
of endlessly adding statistics and accounting to code.

