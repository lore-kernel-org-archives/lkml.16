Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2431A317C
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 15:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738855816; cv=none; b=DGKrGT45TXJHrOIQa65I8oF5WImlShOEP+shHgQ82abci9p4RtXLuGzIkqaJRqKrBnJhJpu3lIO+9nikf2N1813eOzumuNfH6hE/YcMI0pJ9wvlQYYWn9+4eHlOJxwQmByMLMsrnI/BLslP5gqg1rTGbVz/1fRBtaVWK0iMJq24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738855816; c=relaxed/simple;
	bh=oL/EN/nl6O958Rm22BmCrabMDXCT96uo90M+Q954Hgo=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bIjRwpIrpClBMstDuGFWla5xHa1eWdNdy8mXl6CCGyPvGo7Tj7S171Mv6IaXIn0psYyJMxzD5vWkcAydEeRUvcg4zNpgWJHrjvf3veBYhDEX3R41+rVv4LYdffMpaq46gkPsm6xXa5sHYeKCEvQyLO0RpP1z5OWjSQ/XsMGCADI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Ypgvg6wwlz67TqW;
	Thu,  6 Feb 2025 23:27:27 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id D0E18140B38;
	Thu,  6 Feb 2025 23:30:09 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 6 Feb
 2025 16:30:08 +0100
Date: Thu, 6 Feb 2025 15:30:06 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Johannes Weiner <hannes@cmpxchg.org>
CC: Bharata B Rao <bharata@amd.com>, Raghavendra K T <raghavendra.kt@amd.com>,
	<linux-mm@kvack.org>, <akpm@linux-foundation.org>,
	<lsf-pc@lists.linux-foundation.org>, <gourry@gourry.net>,
	<nehagholkar@meta.com>, <abhishekd@meta.com>, <ying.huang@linux.alibaba.com>,
	<nphamcs@gmail.com>, <feng.tang@intel.com>, <kbusch@meta.com>,
	<Hasan.Maruf@amd.com>, <sj@kernel.org>, <david@redhat.com>,
	<willy@infradead.org>, <k.shutemov@gmail.com>, <mgorman@techsingularity.net>,
	<vbabka@suse.cz>, <hughd@google.com>, <rientjes@google.com>,
	<shy828301@gmail.com>, <liam.howlett@oracle.com>, <peterz@infradead.org>,
	<mingo@redhat.com>, <nadav.amit@gmail.com>, <shivankg@amd.com>,
	<ziy@nvidia.com>, <jhubbard@nvidia.com>, <AneeshKumar.KizhakeVeetil@arm.com>,
	<linux-kernel@vger.kernel.org>, <jon.grimm@amd.com>,
	<santosh.shukla@amd.com>, <Michael.Day@amd.com>, <riel@surriel.com>,
	<weixugc@google.com>, <leesuyeon0506@gmail.com>, <honggyu.kim@sk.com>,
	<leillc@google.com>, <kmanaouil.dev@gmail.com>, <rppt@kernel.org>,
	<dave.hansen@intel.com>
Subject: Re: [LSF/MM/BPF TOPIC] Unifying sources of page temperature
 information - what info is actually wanted?
Message-ID: <20250206153006.00003e0f@huawei.com>
In-Reply-To: <20250205160529.GB1183495@cmpxchg.org>
References: <20250123105721.424117-1-raghavendra.kt@amd.com>
	<20250131122803.000031aa@huawei.com>
	<20250131130901.00000dd1@huawei.com>
	<de31971e-98fc-4baf-8f4f-09d153902e2e@amd.com>
	<20250205160529.GB1183495@cmpxchg.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml100011.china.huawei.com (7.191.174.247) To
 frapeml500008.china.huawei.com (7.182.85.71)

On Wed, 5 Feb 2025 11:05:29 -0500
Johannes Weiner <hannes@cmpxchg.org> wrote:

> On Wed, Feb 05, 2025 at 11:54:05AM +0530, Bharata B Rao wrote:
> > On 31-Jan-25 6:39 PM, Jonathan Cameron wrote:  
> > > On Fri, 31 Jan 2025 12:28:03 +0000
> > > Jonathan Cameron <Jonathan.Cameron@huawei.com> wrote:
> > >   
> > >>> Here is the list of potential discussion points:  
> > >> ...
> > >>  
> > >>> 2. Possibility of maintaining single source of truth for page hotness that would
> > >>> maintain hot page information from multiple sources and let other sub-systems
> > >>> use that info.  
> > >> Hi,
> > >>
> > >> I was thinking of proposing a separate topic on a single source of hotness,
> > >> but this question covers it so I'll add some thoughts here instead.
> > >> I think we are very early, but sharing some experience and thoughts in a
> > >> session may be useful.  
> > > 
> > > Thinking more on this over lunch, I think it is worth calling this out as a
> > > potential session topic in it's own right rather than trying to find
> > > time within other sessions.  Hence the title change.
> > > 
> > > I think a session would start with a brief listing of the temperature sources
> > > we have and those on the horizon to motivate what we are unifying, then
> > > discussion to focus on need for such a unification + requirements
> > > (maybe with a straw man).  
> > 
> > Here is a compilation of available temperature sources and how the 
> > hot/access data is consumed by different subsystems:  
> 
> This is super useful, thanks for collecting this.

Absolutely agree!

> 
> > PA-Physical address available
> > VA-Virtual address available
> > AA-Access time available
> > NA-accessing Node info available
> > 
> > I have left the slot blank for those which I am not sure about.
> > ==================================================
> > Temperature		PA	VA	AA	NA
> > source
> > ==================================================
> > PROT_NONE faults	Y	Y	Y	Y
> > --------------------------------------------------
> > folio_mark_accessed()	Y		Y	Y
> > --------------------------------------------------  
> 
> For fma(), the VA info is available in unmap, but usually it isn't -
> or doesn't meaningfully exist, as in the case of unmapped buffered IO.
> 
> I'd say it's an N.
> 
> > PTE A bit		Y	Y	N	N
> > --------------------------------------------------
> > Platform hints		Y	Y	Y	Y
> > (AMD IBS)
> > --------------------------------------------------
> > Device hints		Y
> > (CXL HMU)
> > ==================================================  

For the use cases where we have relatively few 'pages' the cost of a reverse
map look up doesn't look to be a problem.  Trick is to do it
only after we've done what we can in PA space to cut down on the
pages of interest. So maybe (Y) to reflect that it is indirect.
Whether it makes sense to do that before or after some common
layer is an interesting question.  That PA/VA mapping might be
out of date anyway by the time we see the data.

> 
> For the following table, it might be useful to add *when* the source
> produces this information. Sampling frequency is a likely challenge:
> consumers have different requirements, and overhead should be limited
> to the minimum required to serve enabled consumers.
> 
> Here is an (incomplete) attempt - sorry about the long lines:
> 
> > And here is an attempt to compile how different subsystems
> > use the above data:
> > ==============================================================
> > Source			Subsystem		Consumption         Activation/Frequency
> > ==============================================================
> > PROT_NONE faults	NUMAB		NUMAB=1 locality based              While task is running,
> > via process pgtable			balancing                           rate varies on observed
> > walk					NUMAB=2 hot page                    locality and sysctl knobs.
> > 					promotion
> > ==============================================================
> > folio_mark_accessed()	FS/filemap/GUP	LRU list activation                 On cache access and unmap
> > ==============================================================
> > PTE A bit via		Reclaim:LRU	LRU list activation,	            During memory pressure
> > rmap walk				deactivation/demotion
> > ==============================================================
> > PTE A bit via		Reclaim:MGLRU	LRU list activation,	            - During memory pressure
> > rmap walk and process			deactivation/demotion               - Continuous sampling (configurable)
> > pgtable walk                                                                for workingset reporting
> > ==============================================================
> > PTE A bit via		DAMON		LRU activation,                     Continuous sampling (configurable)?
> > rmap walk				hot page promotion,                 (I believe SJ is looking into
> > 					demotion etc                         auto-tuning this).
> > ==============================================================
> > Platform hints		NUMAB		NUMAB=1 Locality based
> > (AMD IBS)				balancing and
> > 					NUMAB=2 hot page
> > 					promotion
> > ==============================================================
Based on the CXL one...

> > Device hints		NUMAB		NUMAB=2 hot page       Continuous sampling, frequency controllable.
> > 					promotion                      Subsampling programable.
> > ==============================================================
> > The last two are listed as possibilities.
> > 
> > Feel free to correct/clarify and add more.

The above covers what the use cases require. Maybe we need to do similar
for the controls needed the other way (frequency already covered)

Filtering.
* Process ID
* Address range (PA / VA)
* Access type (read vs write) may matter for migration cost.

Also frequency is more nuanced perhaps:
- How often to give data (timeliness)
- How much data to give (bandwidth)
- When don't I care (threshold)
- How precise do I want it to be (subsampling etc)

The layering is clearly to be complex, so maybe addressing each
use case for what info that needs would be helpful?

The following is probably too simplistic.

==================================================================
Usecase       Nature of data
==================================================================
NUMAB =1      Enough hot pages with remote source.
Balancing
==================================================================
NUMAB =2      Enough hot pages in slow memory
Tiering
Promotion
==================================================================
NUMAB = 2     Enough cold pages in fast memory
Tiering
Demotion
===================================================================
LRU list      Specific pages of interest accessed
activation
===================================================================
LRU list      Enough cold pages?
deactivation
====================================================================


Jonathan
> > 
> > Regards,
> > Bharata.  

