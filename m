Received: from pku.edu.cn (mx18.pku.edu.cn [162.105.129.181])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB8511EFF8D
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 09:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.105.129.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745312912; cv=none; b=Yf87pE1vzCmMP1JUykB6bmlr0b2ianZ7qfRH4x1pNiKNF1hHL+7P6hjHjictFoNo1o5zqVx2xG+sFxMJk20JqzpttI2oOuKlavbU8ndTRxbIT9jswFi9RSR89JV8Y08EfIlrc1KxXyhpATIKyBoM/hpVHFH2gf3gWDs7mkf7/+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745312912; c=relaxed/simple;
	bh=Sp25wwf7qqFpEL4lSw3Bf5tva/tvWrwtapTAmZEwo+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uipkYNQSJIady88ukGqBBEpDc7z4r4bKWnV+lcPPhaTSdcCXqAYCfR/TGEbFSDBlcCUBZuMdz+gqAye/xNs/zpFdYUVCgBZHZVbRSlJTDKq5upU80luX2Ezj8wR5QUj+rc9ZEPHz0eR2JJLPH0rsXkTOFaTh7Hij87lfE/LNEv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=pku.edu.cn; spf=pass smtp.mailfrom=pku.edu.cn; dkim=pass (1024-bit key) header.d=pku.edu.cn header.i=@pku.edu.cn header.b=ImZG9Pnv; arc=none smtp.client-ip=162.105.129.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=pku.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pku.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pku.edu.cn header.i=@pku.edu.cn header.b="ImZG9Pnv"
Received: from pku.edu.cn (unknown [10.4.225.203])
	by mtasvr (Coremail) with SMTP id _____7Dwaw9_XAdoLaQ+AQ--.6526S3;
	Tue, 22 Apr 2025 17:08:16 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pku.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
	Message-ID:References:MIME-Version:Content-Type:
	Content-Disposition:In-Reply-To; bh=xkmO7o7TalhowvM/TAuF7xAW+te2
	csJOkvZPiWkEcVA=; b=ImZG9PnvBu8HnsZ+jpI6Xvru2jWZuq2ECkT1cONufd/v
	ghEH3i+GxPT8cU/DvTMxo40HTDkfPbd7W+N0vPpeb6wbd8uGsOlp60OIYSE2ehlL
	NBNwtUJY/pPfKSAjIAJor7iMoMQz2PqpsR/JCqYOYU583No9M78kqON0DOpp2Vk=
Received: from localhost (unknown [10.4.225.203])
	by front01 (Coremail) with SMTP id 5oFpogBHEcZ3XAdoYrFxAA--.50827S2;
	Tue, 22 Apr 2025 17:08:13 +0800 (CST)
Date: Tue, 22 Apr 2025 17:08:06 +0800
From: Ruihan Li <lrh2000@pku.edu.cn>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Ruihan Li <lrh2000@pku.edu.cn>
Subject: Re: [PATCH v2] mm/mm_init: Don't iterate pages below ARCH_PFN_OFFSET
Message-ID: <asgvzub435pimtmjt7bsve2hyon6as5twncg3scmdwztvr2tct@nlaw5qsyw33g>
References: <20250419122801.1752234-1-lrh2000@pku.edu.cn>
 <aAZ1RzQdgllQYM04@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAZ1RzQdgllQYM04@kernel.org>
X-CM-TRANSID:5oFpogBHEcZ3XAdoYrFxAA--.50827S2
X-CM-SenderInfo: yssqiiarrvmko6sn3hxhgxhubq/1tbiAgEIBWf35XUDOwAgsW
X-CM-DELIVERINFO: =?B?OSVrjqaAH6dYjNjDbLdWX9VB7ttaQFyXTaecYZzOeDisy/krtsX5TsLkpeAzENeCPc
	0+BDdXjm5Mlm64oODP/CxX7CdHrAr06XGcwRbF9fF2WKf3sOM4KfjVzXEXUZJNGnDxNS+C
	CLbkwtEUkO2DmRqJzedd8mz6gv+Cykv5cvqS1q3k21LQR7vDiuSLjtOS7+y72w==
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

Hi Mike,

Thanks for your review!

On Mon, Apr 21, 2025 at 07:41:43PM +0300, Mike Rapoport wrote:
> On Sat, Apr 19, 2025 at 08:28:01PM +0800, Ruihan Li wrote:
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
> > This problem has existed since commit 907ec5fca3dc ("mm: zero remaining
> > unavailable struct pages").
> > 
> > Signed-off-by: Ruihan Li <lrh2000@pku.edu.cn>
> > ---
> > Link to v1:
> >  - https://lore.kernel.org/linux-mm/20250418162727.1535335-1-lrh2000@pku.edu.cn/
> > Changes since v1:
> >  - Removed the unnecessary Fixes tag.
> >  - Fixed the build issue for CONFIG_SPARSEMEM.
> > 
> >  mm/mm_init.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/mm/mm_init.c b/mm/mm_init.c
> > index 84f14fa12..a697a83ff 100644
> > --- a/mm/mm_init.c
> > +++ b/mm/mm_init.c
> > @@ -969,6 +969,15 @@ static void __init memmap_init(void)
> >  	unsigned long hole_pfn = 0;
> >  	int i, j, zone_id = 0, nid;
> >  
> > +#ifdef CONFIG_FLATMEM
> > +	/*
> > +	 * Pages below ARCH_PFN_OFFSET are invalid as far as pfn_valid is
> > +	 * concerned, so don't waste time iterating on them when looking
> > +	 * for holes.
> > +	 */
> > +	hole_pfn = ARCH_PFN_OFFSET;
> > +#endif
> > +
> 
> I'd prefer a solution for both FLATMEM and SPARSMEM. 
> 
> David Woodhouse proposed a for_each_valid_pfn() a while ago:
> 
> https://lore.kernel.org/all/20250404155959.3442111-1-dwmw2@infradead.org
> 
> It can be used in init_unavailable_range() and will essentially skip the
> unpopulated memory map.

for_each_valid_pfn sounds much better. Thanks for your input.

However, the problem is that David's patch is not showing up in the
mainline, so what can I do to move forward with my patch?

Perhaps you mean that I should wait until David's patch is merged and
send another patch to fix the problem?

> 
> >  	for_each_mem_pfn_range(i, MAX_NUMNODES, &start_pfn, &end_pfn, &nid) {
> >  		struct pglist_data *node = NODE_DATA(nid);
> >  
> > -- 
> > 2.49.0
> > 
> 
> -- 
> Sincerely yours,
> Mike.

Thanks,
Ruihan Li

