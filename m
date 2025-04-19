Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F472AE66
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 07:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745047000; cv=none; b=rLpfRkuNGhN2S3/mnYMv67BgGBPRbh72HCjaJhXyIaMioOkIZ+mbOu3s9Xtypgz4O1K/mbngqSjS/8qSyqiQ5Eh8fuFNHzqSDcCjBhhmsJEnhvMQ5r6qi2cE0ZDmPf+F5c87RzFhwT71R9TU75QxvOusc6qUmrrTZfb0lZcOAwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745047000; c=relaxed/simple;
	bh=Bw28gYArYATLV1gHP/CgxehsZSKdecv6AdvJGP+CGAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TbbR2h1rZFfgP5wYlZEFa6fw6sm8UuPDHqnBkp1YiH3fxaWEvLECW5asEmjnQptBaM8ZpymQ5/h3EpNDwvx95syg7Byg9WeNqDDJE/boyQc+9Zwid091ys7TNZhOiKpAb9kvD/uj7OAAo+QnyvOp2YNpyU6VckQiSePQeoyIauA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CeklMSxH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CeklMSxH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43C53C4CEE7;
	Sat, 19 Apr 2025 07:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745046999;
	bh=Bw28gYArYATLV1gHP/CgxehsZSKdecv6AdvJGP+CGAM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CeklMSxH+t1ywJYYBhorrm9NTLcePAfRB4gGZemyHWyXGP3HmFkmtHv5pqG0pBX8X
	 vh/6FezOIJX/Yt/kZj7//FmRaJ2o968Ph2A1zbK0pEc8o2RRSxvB8xhvuvzXfzCxgW
	 sLYrUmaBqvYQJilJfflRLoYBo1hyHZ+sfOhJAU0n2kAkOf9AbvXqnBrHYouplgo3pX
	 DBXA91pfKEym2+WtAbnLEIT4mgKCBgmdOQUNM+fUHqbQb7Pi2pgh4FKepIxbj7YnHm
	 BIXDemZHXJh029bvM7e4dGWfpIVbc+xdZWSBDk8vJDMh2JRxxrAFV0ZvINiW3wuaeR
	 P2scC02/RI2Hw==
Date: Sat, 19 Apr 2025 10:16:34 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Ruihan Li <lrh2000@pku.edu.cn>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/mm_init: Don't iterate pages below ARCH_PFN_OFFSET
Message-ID: <aANN0rwxcajUtFXs@kernel.org>
References: <20250418162727.1535335-1-lrh2000@pku.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418162727.1535335-1-lrh2000@pku.edu.cn>

On Sat, Apr 19, 2025 at 12:27:27AM +0800, Ruihan Li wrote:
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
> Fixes: 907ec5fca3dc ("mm: zero remaining unavailable struct pages")

I don't think it should be backported, this does not fix a bug.

> Signed-off-by: Ruihan Li <lrh2000@pku.edu.cn>
> ---
>  mm/mm_init.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/mm_init.c b/mm/mm_init.c
> index 84f14fa12..b3ae9f797 100644
> --- a/mm/mm_init.c
> +++ b/mm/mm_init.c
> @@ -966,7 +966,7 @@ static void __init memmap_init_zone_range(struct zone *zone,
>  static void __init memmap_init(void)
>  {
>  	unsigned long start_pfn, end_pfn;
> -	unsigned long hole_pfn = 0;
> +	unsigned long hole_pfn = ARCH_PFN_OFFSET;

ARCH_PFN_OFFSET is defined only for FLATMEM, this won't even build for
SPARSEMEM.

>  	int i, j, zone_id = 0, nid;
>  
>  	for_each_mem_pfn_range(i, MAX_NUMNODES, &start_pfn, &end_pfn, &nid) {
> -- 
> 2.49.0
> 
> 

-- 
Sincerely yours,
Mike.
