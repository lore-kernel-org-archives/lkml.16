Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2404B29AAEE
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 20:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745353249; cv=none; b=Wy6zlGa/ryoDImNCW5vpCkZm3JtvNEQ1gHJ3b4LfJck/9+QFYg8l6rCxWYR/ttpExsxcWAyADCS+68YFcKlVyaymM/d7YqdctMdeU42jceA7TeB7Mzm1ELFhVS2o2tjMsILzU6V2dGjSGh5oFgBKuLP5Td+eUkmgo9l23SCe43o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745353249; c=relaxed/simple;
	bh=0xhEb/1qj2qQ0bRHlD3fnJYqGYC7qSd5C7GA5eZYVsM=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=AUxXaONrUYalhrhCC7ZDM3nFaB2zgN/Ntz0usYQBfH1mUBoPg2wTxQG8RvCgo4fn6ilkAFdBfekYXHKexHB0vtpnFONnXbBx8TNSAkZ2KMhSI0NvrYJyNu55W1z9ISLXbHabYbI7Rw7ep85m2P8VSt620kvSxbVFhPzgUHyucts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=cNpG0Nr0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="cNpG0Nr0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58FC7C4CEE9;
	Tue, 22 Apr 2025 20:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1745353248;
	bh=0xhEb/1qj2qQ0bRHlD3fnJYqGYC7qSd5C7GA5eZYVsM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=cNpG0Nr00xDGSF3M25gBTnFvtRX49Nbq/fkg7kZKb0jI53bKD8Prfv/EQQeSNSeTB
	 pzTm3cbznEUBJiGNI3+RPrbCSdzSoBIL4Q8PZ6G7d81HatnVu5lcyzyqqC/LOOSny6
	 nOgXkoUau3bOgMLCoFj/+ZluPcYwjnKv+yAJgJ/k=
Date: Tue, 22 Apr 2025 13:20:47 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Ruihan Li <lrh2000@pku.edu.cn>
Cc: Mike Rapoport <rppt@kernel.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH v2] mm/mm_init: Don't iterate pages below
 ARCH_PFN_OFFSET
Message-Id: <20250422132047.22c6cd3a00893bdfd6766df4@linux-foundation.org>
In-Reply-To: <asgvzub435pimtmjt7bsve2hyon6as5twncg3scmdwztvr2tct@nlaw5qsyw33g>
References: <20250419122801.1752234-1-lrh2000@pku.edu.cn>
	<aAZ1RzQdgllQYM04@kernel.org>
	<asgvzub435pimtmjt7bsve2hyon6as5twncg3scmdwztvr2tct@nlaw5qsyw33g>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 22 Apr 2025 17:08:06 +0800 Ruihan Li <lrh2000@pku.edu.cn> wrote:

> Hi Mike,
> 
> Thanks for your review!
> 
> On Mon, Apr 21, 2025 at 07:41:43PM +0300, Mike Rapoport wrote:
> > On Sat, Apr 19, 2025 at 08:28:01PM +0800, Ruihan Li wrote:
> > > Currently, memmap_init initializes pfn_hole with 0 instead of
> > > ARCH_PFN_OFFSET. Then init_unavailable_range will start iterating each
> > > page from the page at address zero to the first available page, but it
> > > won't do anything for pages below ARCH_PFN_OFFSET because pfn_valid
> > > won't pass.
> > > 
> > > If ARCH_PFN_OFFSET is very large (e.g., something like 2^64-2GiB if the
> > > kernel is used as a library and loaded at a very high address), the
> > > pointless iteration for pages below ARCH_PFN_OFFSET will take a very
> > > long time, and the kernel will look stuck at boot time.
> > > 
> > > This commit sets the initial value of pfn_hole to ARCH_PFN_OFFSET, which
> > > avoids the problematic and useless iteration mentioned above.
> > > 
> > > This problem has existed since commit 907ec5fca3dc ("mm: zero remaining
> > > unavailable struct pages").
> > > 
> > > Signed-off-by: Ruihan Li <lrh2000@pku.edu.cn>
> > > ---
> > > Link to v1:
> > >  - https://lore.kernel.org/linux-mm/20250418162727.1535335-1-lrh2000@pku.edu.cn/
> > > Changes since v1:
> > >  - Removed the unnecessary Fixes tag.
> > >  - Fixed the build issue for CONFIG_SPARSEMEM.
> > > 
> > >  mm/mm_init.c | 9 +++++++++
> > >  1 file changed, 9 insertions(+)
> > > 
> > > diff --git a/mm/mm_init.c b/mm/mm_init.c
> > > index 84f14fa12..a697a83ff 100644
> > > --- a/mm/mm_init.c
> > > +++ b/mm/mm_init.c
> > > @@ -969,6 +969,15 @@ static void __init memmap_init(void)
> > >  	unsigned long hole_pfn = 0;
> > >  	int i, j, zone_id = 0, nid;
> > >  
> > > +#ifdef CONFIG_FLATMEM
> > > +	/*
> > > +	 * Pages below ARCH_PFN_OFFSET are invalid as far as pfn_valid is
> > > +	 * concerned, so don't waste time iterating on them when looking
> > > +	 * for holes.
> > > +	 */
> > > +	hole_pfn = ARCH_PFN_OFFSET;
> > > +#endif
> > > +
> > 
> > I'd prefer a solution for both FLATMEM and SPARSMEM. 
> > 
> > David Woodhouse proposed a for_each_valid_pfn() a while ago:
> > 
> > https://lore.kernel.org/all/20250404155959.3442111-1-dwmw2@infradead.org
> > 
> > It can be used in init_unavailable_range() and will essentially skip the
> > unpopulated memory map.
> 
> for_each_valid_pfn sounds much better. Thanks for your input.
> 
> However, the problem is that David's patch is not showing up in the
> mainline, so what can I do to move forward with my patch?
> 
> Perhaps you mean that I should wait until David's patch is merged and
> send another patch to fix the problem?

(cc David)

> > 
> > >  	for_each_mem_pfn_range(i, MAX_NUMNODES, &start_pfn, &end_pfn, &nid) {
> > >  		struct pglist_data *node = NODE_DATA(nid);
> > >  
> > > -- 
> > > 2.49.0
> > > 
> > 
> > -- 
> > Sincerely yours,
> > Mike.
> 
> Thanks,
> Ruihan Li
