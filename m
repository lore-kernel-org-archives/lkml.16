Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562F41A238A
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 16:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745253709; cv=none; b=LLyHuDbNxfbV2NfD40mNrkaGa4kSjmxrArJLL4fIFFEA/skoOg0VZryXGK8IngP9LBCjDxIkE1Qpkys3xTef08BmeYlR1mDK3KfSLPR9x4AF4ogmC0Bnw1Ki/HVj5xahVOiPXRFn7h1+ul8QPw+AVLk9luG6ebPGo8ERv+fb1C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745253709; c=relaxed/simple;
	bh=jy6cMfB0NT9IYZb7KcMgcJtbrCslLbtDJ8MnDdG6GhU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qILO9813DJexQ7T+kCZetODvYgsq7cyUGFnwd7wCR1OuU+iCUzxNbUURg+RR4L85eE2J/OHlLAvKWn1dkxd0YmKm77fZFVVi5hz5zCX/Ynb3uAOb/fBz4aj9xAZwCoEPxHCMX+Jt00bY3xk8Ib+z+8yNL9bRAkwgi8HzSEyFVTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ppmL1iJM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ppmL1iJM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8FEFC4CEE4;
	Mon, 21 Apr 2025 16:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745253708;
	bh=jy6cMfB0NT9IYZb7KcMgcJtbrCslLbtDJ8MnDdG6GhU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ppmL1iJMifKsQCp2oO73/Ce4Sw6SZZD2MdiNYPDPw6PNIDc3qzLJGr/FuPeBPpTwV
	 hs2imL0rqpc2kGQN2C+GDwnVTrPfwiWudtnFuaM/+wqypSiL7PLP/VbHx9XPKE76eK
	 Myh1OfhSU1CuS4LwApRfacpDNl2HOdVO6NKx0omyjYJU+mxkNxxD/CndkhdQ6rRfhX
	 padtlRM/AP/fq5LH/j6A383Kb1asRqdftQmn5zMr6HzCm++ztdOrCCvKyeeWNFMCLJ
	 vQ2Ka5Jr855tAX3zaRsNsOjzsCoDbW70tiP5frCNQML5cuf8W9m2UWw7zKDFRgHXIt
	 B0Cr/xpY5gHoQ==
Date: Mon, 21 Apr 2025 19:41:43 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Ruihan Li <lrh2000@pku.edu.cn>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mm/mm_init: Don't iterate pages below ARCH_PFN_OFFSET
Message-ID: <aAZ1RzQdgllQYM04@kernel.org>
References: <20250419122801.1752234-1-lrh2000@pku.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250419122801.1752234-1-lrh2000@pku.edu.cn>

On Sat, Apr 19, 2025 at 08:28:01PM +0800, Ruihan Li wrote:
> Currently, memmap_init initializes pfn_hole with 0 instead of
> ARCH_PFN_OFFSET. Then init_unavailable_range will start iterating each
> page from the page at address zero to the first available page, but it
> won't do anything for pages below ARCH_PFN_OFFSET because pfn_valid
> won't pass.
> 
> If ARCH_PFN_OFFSET is very large (e.g., something like 2^64-2GiB if the
> kernel is used as a library and loaded at a very high address), the
> pointless iteration for pages below ARCH_PFN_OFFSET will take a very
> long time, and the kernel will look stuck at boot time.
> 
> This commit sets the initial value of pfn_hole to ARCH_PFN_OFFSET, which
> avoids the problematic and useless iteration mentioned above.
> 
> This problem has existed since commit 907ec5fca3dc ("mm: zero remaining
> unavailable struct pages").
> 
> Signed-off-by: Ruihan Li <lrh2000@pku.edu.cn>
> ---
> Link to v1:
>  - https://lore.kernel.org/linux-mm/20250418162727.1535335-1-lrh2000@pku.edu.cn/
> Changes since v1:
>  - Removed the unnecessary Fixes tag.
>  - Fixed the build issue for CONFIG_SPARSEMEM.
> 
>  mm/mm_init.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/mm/mm_init.c b/mm/mm_init.c
> index 84f14fa12..a697a83ff 100644
> --- a/mm/mm_init.c
> +++ b/mm/mm_init.c
> @@ -969,6 +969,15 @@ static void __init memmap_init(void)
>  	unsigned long hole_pfn = 0;
>  	int i, j, zone_id = 0, nid;
>  
> +#ifdef CONFIG_FLATMEM
> +	/*
> +	 * Pages below ARCH_PFN_OFFSET are invalid as far as pfn_valid is
> +	 * concerned, so don't waste time iterating on them when looking
> +	 * for holes.
> +	 */
> +	hole_pfn = ARCH_PFN_OFFSET;
> +#endif
> +

I'd prefer a solution for both FLATMEM and SPARSMEM. 

David Woodhouse proposed a for_each_valid_pfn() a while ago:

https://lore.kernel.org/all/20250404155959.3442111-1-dwmw2@infradead.org

It can be used in init_unavailable_range() and will essentially skip the
unpopulated memory map.

>  	for_each_mem_pfn_range(i, MAX_NUMNODES, &start_pfn, &end_pfn, &nid) {
>  		struct pglist_data *node = NODE_DATA(nid);
>  
> -- 
> 2.49.0
> 

-- 
Sincerely yours,
Mike.
