Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA41E22172C
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 09:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746004454; cv=none; b=BK9YQCuDoqPHTK7UdrwBl6pE2uGpOnAcvhqU2FlYFT2Vv36tUfn+W48ekvx4bRtpnBf+yDWwuuxTRiH8oUueWSYntV/LLKeKKUFOuhUxDxAVk9clB3zHS9vGYjeip9svSqTUIBtnGUZGkqhyQAn97K5Fx9ZjKetDmt8uir7xIQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746004454; c=relaxed/simple;
	bh=kHVEc8zjUPMH7G4HGjTeGTenLpyMSz3DwGmSVQIByDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gYzHgukchYCebTS+s/QMYGVauL5Dhk8cp+q3gohYHy/FLHJoDckgdbK8UHDZTqPeDI/p+u/v/MjHVbpE6GF17msq+r8gs9geEwVzwYIkBHSTRD306IcIssuD5ApPyxpJy1NxU3kzjldW1m+ciZpj0mK+C1X13h3EbAVic+l7Gvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fCdYQL4g; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fCdYQL4g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746004453; x=1777540453;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kHVEc8zjUPMH7G4HGjTeGTenLpyMSz3DwGmSVQIByDo=;
  b=fCdYQL4g2wOLNn+Sm2wiIHX52dS/9TjJe4KpFBsuPZ916N79dhuQq1zK
   jcfXlSvXVYMaWh/VSQoD2gT0AkR0YPOXP9WZdR3NvKcgowXvUTPoDsffH
   MUY1anmr97uBYr11n4gZGAu6jDWsZrazvSeuk3CQIzR872xlrzze16dd3
   rwFXxYjKwCJSLTP/aYjC9994ZNgONocWj1esXzZ90GfMGtg7VvrKiXBKN
   RlRkL0IUyTvqSgtRjqWhLU15R+6SOSzgrf18Vl3Wrje/nURxDm0xf/2m/
   qHdbZHIjnS1HcJTfbJV5m1CjLiU6mq0hOJgeJObFunulb8a9opy3HhRDs
   w==;
X-CSE-ConnectionGUID: 78Kndbg1SHmuWg+UJD8wgw==
X-CSE-MsgGUID: nsylaoDuRaSyx2kiFibOog==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="47373601"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="47373601"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 02:14:12 -0700
X-CSE-ConnectionGUID: YEXECjo8RKCKjIXwu16b/g==
X-CSE-MsgGUID: RKGbql3uQCmIb7VhTCfVLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="134013731"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa007.fm.intel.com with ESMTP; 30 Apr 2025 02:14:09 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id 266AF207; Wed, 30 Apr 2025 12:14:08 +0300 (EEST)
Date: Wed, 30 Apr 2025 12:14:08 +0300
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@redhat.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>, 
	Mel Gorman <mgorman@techsingularity.net>, "Kalra, Ashish" <ashish.kalra@amd.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, linux-mm@kvack.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Michael Roth <michael.roth@amd.com>
Subject: Re: SNP guest crash in memblock with unaccepted memory
Message-ID: <43o2gni2stscuwjfr2cyawn4ikcfhsroact6t7civ3ud3e6sgi@jizmzw7lpzvt>
References: <f12f5bd0-135b-91fd-9703-7df98500f9c5@amd.com>
 <b037ffeb-bfeb-41a6-b200-d8c57076370f@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b037ffeb-bfeb-41a6-b200-d8c57076370f@redhat.com>

On Mon, Apr 28, 2025 at 04:04:50PM +0200, David Hildenbrand wrote:
> On 27.04.25 17:01, Tom Lendacky wrote:
> > Hi Kirill,
> > 
> > Every now and then I experience an SNP guest boot failure for accessing
> > memory that hasn't been accepted. I managed to get a back trace:
> > 
> >    RIP: 0010:memcpy_orig+0x68/0x130
> >    Code: ...
> >    RSP: 0000:ffffffff9cc03ce8 EFLAGS: 00010006
> >    RAX: ff11001ff83e5000 RBX: 0000000000000000 RCX: fffffffffffff000
> >    RDX: 0000000000000bc0 RSI: ffffffff9dba8860 RDI: ff11001ff83e5c00
> >    RBP: 0000000000002000 R08: 0000000000000000 R09: 0000000000002000
> >    R10: 000000207fffe000 R11: 0000040000000000 R12: ffffffff9d06ef78
> >    R13: ff11001ff83e5000 R14: ffffffff9dba7c60 R15: 0000000000000c00
> >    memblock_double_array+0xff/0x310
> >    memblock_add_range+0x1fb/0x2f0
> >    memblock_reserve+0x4f/0xa0
> >    memblock_alloc_range_nid+0xac/0x130
> >    memblock_alloc_internal+0x53/0xc0
> >    memblock_alloc_try_nid+0x3d/0xa0
> >    swiotlb_init_remap+0x149/0x2f0
> >    mem_init+0xb/0xb0
> >    mm_core_init+0x8f/0x350
> >    start_kernel+0x17e/0x5d0
> >    x86_64_start_reservations+0x14/0x30
> >    x86_64_start_kernel+0x92/0xa0
> >    secondary_startup_64_no_verify+0x194/0x19b
> > 
> > I don't know a lot about memblock, but it appears that it needs to
> > allocate more memory for it's regions array and returns a range of memory
> > that hasn't been accepted. When the memcpy() runs, the SNP guest gets a
> > #VC 0x404 because of this.
> > 
> > Do you think it is as simple as calling accept_memory() on the memory
> > range returned from memblock_find_in_range() in memblock_double_array()?
> 
> (not Kirill, but replying :) )
> 
> Yeah, we seem to be effectively allocating memory from memblock ("from
> ourselves") without considering that memory must be accepted first.
> 
> accept_memory() on the new memory (in case of !slab) should be the right
> thing to do.

Right, it should do the trick.

BTW, Mike, is there any other codepath where memblock allocates memory for
itself? We need to cover them too.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
