Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D751A23A9
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 09:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738921882; cv=none; b=RLXXg4FIbPpuZmW49YBwPEF/5YqyMJsTbg7Bj9txDUTvJ3VzNnScCjhfQtT0z5WQ+bcgBOTqHy1zs9ad7qdXgjAeeghyYTG0TGGN6vHd4A9uBOo/vgSBST/1wlqlxVlJkAqPZz33jdxtC+YsV03njNoy0pP02OeT1BDbwTdsHd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738921882; c=relaxed/simple;
	bh=ngJO7QmaDQrn23uZgS2xweCgDp91dFI3t0Q8eN71yoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SNPaqm++SXRveEuoB04YTMCIAN5MsDWtDzHksX86L9UcW2DtXhTIDg/Z6KoVf4VT1QBxWAwGt2HQ/bAHoKsNt+egQvPMmNXijEM+/Z4nedVoLV4orMOLyVHQTTpe+SpwsomMSOzLaMYC57bvnzbhhJBLGQ/qUd4Nc4iI2dMwX7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=NUS6vtz6; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="NUS6vtz6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=I3zHKIIrHLZPRQJg9EPbWWtt+Jc1QDKf1pOOHmPfCvA=; b=NUS6vtz6BBZ7OxDmYuLHAQtwWX
	HUruHEv4y0/38vsTBSGHox8V14WNq1koNkFg5pmNys8ITSq+N0vUPrbkypcit4YZVtWInswyqP0Tp
	dZNShe9iI9poWZp8S1lFD2iqYxG8P05Q4WcU38mSz4wcN5iD54UnOtpJRDPoVbZO8JlsK5ny+hMXH
	aP119/cCCAqI3efFIw+gCwSHgZYjQLlto0GwmQIHiZ8g11qIvGKim+94IMhBiMgh+R4Uupk5wAsDO
	3rilYisiS29euEPQS4MgLYJbB2Suhr3H/IFCiZb8t7Ukex5srCcqcMhRL9m+9Gp7B4HRMMftRKvmk
	hGGKlz+w==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1tgL0h-00000007aqf-3vaR;
	Fri, 07 Feb 2025 09:50:55 +0000
Date: Fri, 7 Feb 2025 09:50:55 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Bharata B Rao <bharata@amd.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Raghavendra K T <raghavendra.kt@amd.com>, linux-mm@kvack.org,
	akpm@linux-foundation.org, lsf-pc@lists.linux-foundation.org,
	gourry@gourry.net, nehagholkar@meta.com, abhishekd@meta.com,
	ying.huang@linux.alibaba.com, nphamcs@gmail.com, hannes@cmpxchg.org,
	feng.tang@intel.com, kbusch@meta.com, Hasan.Maruf@amd.com,
	sj@kernel.org, david@redhat.com, k.shutemov@gmail.com,
	mgorman@techsingularity.net, vbabka@suse.cz, hughd@google.com,
	rientjes@google.com, shy828301@gmail.com, liam.howlett@oracle.com,
	peterz@infradead.org, mingo@redhat.com, nadav.amit@gmail.com,
	shivankg@amd.com, ziy@nvidia.com, jhubbard@nvidia.com,
	AneeshKumar.KizhakeVeetil@arm.com, linux-kernel@vger.kernel.org,
	jon.grimm@amd.com, santosh.shukla@amd.com, Michael.Day@amd.com,
	riel@surriel.com, weixugc@google.com, leesuyeon0506@gmail.com,
	honggyu.kim@sk.com, leillc@google.com, kmanaouil.dev@gmail.com,
	rppt@kernel.org, dave.hansen@intel.com
Subject: Re: [LSF/MM/BPF TOPIC] Unifying sources of page temperature
 information - what info is actually wanted?
Message-ID: <Z6XXf5OaLe9ZaN02@casper.infradead.org>
References: <20250123105721.424117-1-raghavendra.kt@amd.com>
 <20250131122803.000031aa@huawei.com>
 <20250131130901.00000dd1@huawei.com>
 <de31971e-98fc-4baf-8f4f-09d153902e2e@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de31971e-98fc-4baf-8f4f-09d153902e2e@amd.com>

On Wed, Feb 05, 2025 at 11:54:05AM +0530, Bharata B Rao wrote:
> Here is a compilation of available temperature sources and how the
> hot/access data is consumed by different subsystems:
> 
> PA-Physical address available
> VA-Virtual address available
> AA-Access time available
> NA-accessing Node info available
> 
> I have left the slot blank for those which I am not sure about.
> ==================================================
> Temperature		PA	VA	AA	NA
> source
> ==================================================
> PROT_NONE faults	Y	Y	Y	Y
> --------------------------------------------------
> folio_mark_accessed()	Y		Y	Y
> --------------------------------------------------
> PTE A bit		Y	Y	N	N
> --------------------------------------------------
> Platform hints		Y	Y	Y	Y
> (AMD IBS)
> --------------------------------------------------
> Device hints		Y
> (CXL HMU)
> ==================================================
> 
> And here is an attempt to compile how different subsystems
> use the above data:
> ==============================================================
> Source			Subsystem		Consumption
> ==============================================================
> PROT_NONE faults	NUMAB		NUMAB=1 locality based
> via process pgtable			balancing
> walk					NUMAB=2 hot page
> 					promotion
> ==============================================================
> folio_mark_accessed()	FS/filemap/GUP	LRU list activation
> ==============================================================
> PTE A bit via		Reclaim:LRU	LRU list activation,	
> rmap walk				deactivation/demotion
> ==============================================================
> PTE A bit via		Reclaim:MGLRU	LRU list activation,	
> rmap walk and process			deactivation/demotion
> pgtable walk
> ==============================================================
> PTE A bit via		DAMON		LRU activation,
> rmap walk				hot page promotion,
> 					demotion etc
> ==============================================================
> Platform hints		NUMAB		NUMAB=1 Locality based
> (AMD IBS)				balancing and
> 					NUMAB=2 hot page
> 					promotion
> ==============================================================
> Device hints		NUMAB		NUMAB=2 hot page
> 					promotion
> ==============================================================
> The last two are listed as possibilities.
> 
> Feel free to correct/clarify and add more.

There's PG_young / PG_idle as well.
