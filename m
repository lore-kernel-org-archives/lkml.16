Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39311C245C
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 13:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738328952; cv=none; b=Yw3tQNDeHdFtYkDc1KaprcIbrGd05Ziv8Fhr4wie6wMLHoMiKKQ1oVccpEliMyz0qzG+uWDL/522EUSJIzzmc4Fe/GL40xQVwowbpgDmFS05uQvTrbs0QoNnSUvmrJLnTEh7GzriLJxSInQ5BjeSUnlt/4unPSjhnuhJKa+tkc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738328952; c=relaxed/simple;
	bh=t4zcKHE90KfWeNDwXqb5TfI7Z9zckUGM6AekiBPuMTE=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j2iJetyiUyHAPD/5Vu2aK1n2Tl2HKhx/lg5Eo8MwcdxzXDjqmTVEIJbnCSOcXVKdsFI/8Mrq6xGqueMZlD7ljmW4qwonLQrp5r/oOb6Zp6Qyc9XPmikj1+ULp89fbMMu8+9aucPbpnueKonD2jEMgXGldHAkSTjrIQgmLRHDtTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Ykx4L0QbVz6M4Pp;
	Fri, 31 Jan 2025 21:06:58 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 68CE6140517;
	Fri, 31 Jan 2025 21:09:06 +0800 (CST)
Received: from localhost (10.195.244.178) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 31 Jan
 2025 14:09:03 +0100
Date: Fri, 31 Jan 2025 13:09:01 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Raghavendra K T <raghavendra.kt@amd.com>
CC: <linux-mm@kvack.org>, <akpm@linux-foundation.org>,
	<lsf-pc@lists.linux-foundation.org>, <bharata@amd.com>, <gourry@gourry.net>,
	<nehagholkar@meta.com>, <abhishekd@meta.com>, <ying.huang@linux.alibaba.com>,
	<nphamcs@gmail.com>, <hannes@cmpxchg.org>, <feng.tang@intel.com>,
	<kbusch@meta.com>, <Hasan.Maruf@amd.com>, <sj@kernel.org>,
	<david@redhat.com>, <willy@infradead.org>, <k.shutemov@gmail.com>,
	<mgorman@techsingularity.net>, <vbabka@suse.cz>, <hughd@google.com>,
	<rientjes@google.com>, <shy828301@gmail.com>, <liam.howlett@oracle.com>,
	<peterz@infradead.org>, <mingo@redhat.com>, <nadav.amit@gmail.com>,
	<shivankg@amd.com>, <ziy@nvidia.com>, <jhubbard@nvidia.com>,
	<AneeshKumar.KizhakeVeetil@arm.com>, <linux-kernel@vger.kernel.org>,
	<jon.grimm@amd.com>, <santosh.shukla@amd.com>, <Michael.Day@amd.com>,
	<riel@surriel.com>, <weixugc@google.com>, <leesuyeon0506@gmail.com>,
	<honggyu.kim@sk.com>, <leillc@google.com>, <kmanaouil.dev@gmail.com>,
	<rppt@kernel.org>, <dave.hansen@intel.com>
Subject: [LSF/MM/BPF TOPIC] Unifying sources of page temperature information
 - what info is actually wanted?
Message-ID: <20250131130901.00000dd1@huawei.com>
In-Reply-To: <20250131122803.000031aa@huawei.com>
References: <20250123105721.424117-1-raghavendra.kt@amd.com>
	<20250131122803.000031aa@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml500009.china.huawei.com (7.191.174.84) To
 frapeml500008.china.huawei.com (7.182.85.71)

On Fri, 31 Jan 2025 12:28:03 +0000
Jonathan Cameron <Jonathan.Cameron@huawei.com> wrote:

> > Here is the list of potential discussion points:  
> ...
> 
> > 2. Possibility of maintaining single source of truth for page hotness that would
> > maintain hot page information from multiple sources and let other sub-systems
> > use that info.  
> Hi,
> 
> I was thinking of proposing a separate topic on a single source of hotness,
> but this question covers it so I'll add some thoughts here instead.
> I think we are very early, but sharing some experience and thoughts in a
> session may be useful.

Thinking more on this over lunch, I think it is worth calling this out as a
potential session topic in it's own right rather than trying to find
time within other sessions.  Hence the title change.

I think a session would start with a brief listing of the temperature sources
we have and those on the horizon to motivate what we are unifying, then
discussion to focus on need for such a unification + requirements 
(maybe with a straw man).

> 
> What do the other subsystems that want to use a single source of page hotness
> want to be able to find out? (subject to filters like memory range, process etc)
> 
> A) How hot is page X?  
> - Is this useful, or too much data? What would use it?
>   * Application optimization maybe. Very handy for developing algorithms
>     to do the rest of the options here as an Oracle!
> - Provides both the cold and hot end of the scale, but maybe measurement
>   techniques vary and can not be easily combined. Hard in general to combine
>   multiple sources of truth if aiming for an absolute number.
> 
> B) Which pages are super hot?
> - Probably these that make the most difference if they are in a slower memory tier.
> 
> C) Some pages are hot enough to consider moving?
> - This may be good enough to get the key data into the fast memory over time.
> - Can combine sources of info as being able to compare precise numbers doesn't matter.
> 
> D) Which pages are fairly cold?
> - Likewise maybe good enough over time.
> 
> E) Which pages are very cold?
> - Ideal case for tiering. Swap these with the super hot ones.
> - Maybe extra signal for swap / zswap etc
> 
> F) Did these hot pages remain hot (and same for cold)
> - This is needed to know when to back off doing things as we have unstable
>   hotness (two phase applications are a pain for this), sampling a few
>   pages may be fine.
> 
> Messy corners:
> 
> Temporal aspects.
> - If only providing lists of hottest / coldest in last second, very hard
>   to find those that are of a stable temperature. We end up moving
>   very hot data (which is disruptive) and it doesn't stay hot.
> - Can reduce that affect by long sampling windows on some measurement approaches
>   (on hardware trackers that can trash accuracy due to resource exhaustion
>    and other subtle effects).
> - bistable / phase based applications are a pain but perhaps up to higher
>   levels to back off.
> 
> My main interest is migrating in tiered systems but good to look at what
> else would use a common layer.
> 
> Mostly I want to know something that is useful to move, and assume convergence
> over the long term with the best things to move so to me the ideal layer has
> following interface (strawman so shoot holes in it!):
> 
> 1) Give me up to X hotish pages from a slow tier (greater than a specific measure
> of temperature)
> 2) Give me X coldish pages a faster tier.
> 3) I expect to ask again in X seconds so please have some info ready for me!
> 4) (a path to get an idea of 'unhelpful moves' from earlier iterations - this
>     is bleeding the tiering application into a shared interface though).
> 
> If we have multiple subsystems using the data we will need to resolve their
> conflicting demands to generate good enough data with appropriate overhead.
> 
> I'd also like a virtualized solution for case of hardware PA trackers (what
> I have with CXL Hotness Monitoring Units) and classic memory pool / stranding
> avoidance case where the VM is the right entity to make migration decisions.
> Making that interface convey what the kernel is going to use would be an
> efficient option. I'd like to hide how the sausage was made from the VM.
> 
> Jonathan
> 

