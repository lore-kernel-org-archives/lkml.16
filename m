Received: from pku.edu.cn (mx17.pku.edu.cn [162.105.129.180])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EFDDEACE
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 12:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.105.129.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745064518; cv=none; b=kd5snZb9jWGf3k0Me4smP8SOR/3lU9sGqD6dXo3WIxH/DIrCX4yRpy5tU+AUH9GXNonrIR21a8CuPSWIT1o21qIf6WdHkbd3UtyzYwy7l88GF5TAviC6U+IL2sac4nSlZleV+AgfMHjuQ8odQuAdIVfZT9MJRx44yKczBvYB6G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745064518; c=relaxed/simple;
	bh=0vi9bSxOteNpYRBLQUKsaQ6T9Zp5ziaJXp50ZLSx+vI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RYeZlPgWe+PgNsaUQfpim9kkZApQqvfOoAxCGZGTkqAxOxfMnRlUdWp8+jRnMjUCqq+Aj8TxXRzXjlyVSWESPJi30o9MdzKFYjM6AV5yap2eFPF7y6t4A7UMWaA7VN0Gf/L6o3YKEDgQNoG5aSh5yae9Z1nChHwEhSeRC2oImOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=pku.edu.cn; spf=pass smtp.mailfrom=pku.edu.cn; dkim=pass (1024-bit key) header.d=pku.edu.cn header.i=@pku.edu.cn header.b=RvoaSgHf; arc=none smtp.client-ip=162.105.129.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=pku.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pku.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pku.edu.cn header.i=@pku.edu.cn header.b="RvoaSgHf"
Received: from pku.edu.cn (unknown [10.4.225.203])
	by mtasvr (Coremail) with SMTP id _____7Dw5kc8kgNoKm9QAA--.8882S3;
	Sat, 19 Apr 2025 20:08:29 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pku.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
	Message-ID:References:MIME-Version:Content-Type:
	Content-Disposition:In-Reply-To; bh=ShQJ6bdQ3naO3cGgvt+FpfUT7oKS
	BjoS2qTqwnLQx1g=; b=RvoaSgHfnbW6HB90vYoyEhTwEA1HE2MGpr70p7MBRPb/
	dW3y6NDSA1KBjHWq0L0IfMtz9vm77GXKd9tWw2sDZ3glZSfX6KAhaTwtMcSRHuC+
	haFOrYFOTrtLET1jXglCz0Vd3NESf6LIJ6Mpt/IdNw36oH1TD9qFmBr8xgeqzuM=
Received: from localhost (unknown [10.4.225.203])
	by front02 (Coremail) with SMTP id 54FpogAXTIY2kgNoR68rAA--.15898S2;
	Sat, 19 Apr 2025 20:08:28 +0800 (CST)
Date: Sat, 19 Apr 2025 20:08:22 +0800
From: Ruihan Li <lrh2000@pku.edu.cn>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Ruihan Li <lrh2000@pku.edu.cn>
Subject: Re: [PATCH] mm/mm_init: Don't iterate pages below ARCH_PFN_OFFSET
Message-ID: <6f2sjssx6f4lidlhucdio45s6p7d6xr4ibr3n3f73z53x5u62e@hvyh5socmfll>
References: <20250418162727.1535335-1-lrh2000@pku.edu.cn>
 <aANN0rwxcajUtFXs@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aANN0rwxcajUtFXs@kernel.org>
X-CM-TRANSID:54FpogAXTIY2kgNoR68rAA--.15898S2
X-CM-SenderInfo: yssqiiarrvmko6sn3hxhgxhubq/1tbiAgEIBWf35XUDOwARsn
X-CM-DELIVERINFO: =?B?aH/fJ6aAH6dYjNjDbLdWX9VB7ttaQFyXTaecYZzOeDisy/krtsX5TsLkpeAzENeCPc
	0+BDdXjm5Mlm64oODP/CxX7Cd2WUS6gvCXweNJGg4wTqVPON5pxajDNeWruRnFGC+vzwRc
	v3bsqmnf43BmGcHw7dEE9dfsVAMjqNIpZo88038huZM7cFNpXzyutorufK+aBg==
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

Hi Mike,

Thanks a lot for your review!

On Sat, Apr 19, 2025 at 10:16:34AM +0300, Mike Rapoport wrote:
> On Sat, Apr 19, 2025 at 12:27:27AM +0800, Ruihan Li wrote:
> > Currently, memmap_init initializes pfn_hole with 0 instead of
> > ARCH_PFN_OFFSET. Then init_unavailable_range will start iterating each
> > page from the page at address zero to the first available page, but it
> > won't do anything for pages below ARCH_PFN_OFFSET because pfn_valid
> > won't pass.
> > 
> > If ARCH_PFN_OFFSET is very large (e.g., something like 2^64-2GiB if the
> > kernel is used as a library and loaded at a very high address), the
> > pointless iteration for pages below ARCH_PFN_OFFSET will take a very
> > long time, and the kernel will look stuck at boot time.
> > 
> > This commit sets the initial value of pfn_hole to ARCH_PFN_OFFSET, which
> > avoids the problematic and useless iteration mentioned above.
> > 
> > Fixes: 907ec5fca3dc ("mm: zero remaining unavailable struct pages")
> 
> I don't think it should be backported, this does not fix a bug.

I thought the Fixes tag only indicated that the problem existed since
the specific commit, not the need for a backport (since the backport
should only happen when someone sends or CC's the patch to the
linux-stable mailing list)?

But anyway, I'm going to remove the Fixes tag when I send v2.

> 
> > Signed-off-by: Ruihan Li <lrh2000@pku.edu.cn>
> > ---
> >  mm/mm_init.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/mm/mm_init.c b/mm/mm_init.c
> > index 84f14fa12..b3ae9f797 100644
> > --- a/mm/mm_init.c
> > +++ b/mm/mm_init.c
> > @@ -966,7 +966,7 @@ static void __init memmap_init_zone_range(struct zone *zone,
> >  static void __init memmap_init(void)
> >  {
> >  	unsigned long start_pfn, end_pfn;
> > -	unsigned long hole_pfn = 0;
> > +	unsigned long hole_pfn = ARCH_PFN_OFFSET;
> 
> ARCH_PFN_OFFSET is defined only for FLATMEM, this won't even build for
> SPARSEMEM.

Sorry for my ignorance. I'm not familiar with the code and I'm only
testing the FLATMEM configuration. I'll send a v2 patch to fix this.
Thanks for pointing out my stupid mistake.

> 
> >  	int i, j, zone_id = 0, nid;
> >  
> >  	for_each_mem_pfn_range(i, MAX_NUMNODES, &start_pfn, &end_pfn, &nid) {
> > -- 
> > 2.49.0
> > 
> > 
> 
> -- 
> Sincerely yours,
> Mike.

Thanks,
Ruihan Li

