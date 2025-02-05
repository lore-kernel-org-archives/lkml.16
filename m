Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE1C21C19F
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 12:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738758034; cv=none; b=eAo7UaaTJey6M1jQvDqsv/qq1eHfIGqg3/TjjIUaieAITMT50EVulST9iqzyJnnmiJdXmAlMaquGaJA1R0ctjNq0hL+4qwHqSnMA2RoaO5oF1WkgoPvlzUIMC6Ts/fgVKKMBGG53xOOhEO6ysLUScSBa44lVzLzPQNa97VzGj5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738758034; c=relaxed/simple;
	bh=udc5zK3HHqXk8xycO1bZRzrq/X/oslqdyAt9WR1YptY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hzbL/2N71Qn06Ryzbnb5EwO1Dnwc9RWhurUlDszyZNbudIirZ9+6VUZuADvHykPpOzhDYu7pIDWrmvuR88gy30ZsFHSZ5YEGSzaZsHJL3nIy7Rp+N4iQ2r/GlpKJxeqfumhUa/OSvjFLi0MefUkgxTnt5vmSVsQrGoiJ/xwme7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=QW8RK1/s; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="QW8RK1/s"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=2GD2f1+ZqTw4GQl694a5GY73mFn35yZd9oLR3uVjd78=; b=QW8RK1/sH/tIlWsBK5Nz2B+l4X
	+5fkPTkQQmi15x9IO3gEp+aTPCgMZ+AsvzSJ8geKw3um3x6HeOjuMeTQmQx+cjSGcLSNmNe/ocvFs
	+ysIqBpjRhn8QxiggjiEC1sQdEC24+R45iCWscbFA5m1cP1p1hlYtNQDB6p0AY/l9bYcIXxdOu2CS
	IqywF31+klqkOsC9L8IBCVFm8pveJ5jp3hWVgDPSxN3Xmikr6b5AvwKrWJqBEc+9zNbdGRfAxgTDF
	RizMLtOUwV0MKhZXaDDx56dCrxfe5LEOLT97yGUHIK9plZUiUSut/f1ig61ATrOYm8rrO41v+czzo
	OYO+4oAQ==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tfeO1-00000004Omx-09ru;
	Wed, 05 Feb 2025 12:20:09 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id C8AC83002F0; Wed,  5 Feb 2025 13:20:07 +0100 (CET)
Date: Wed, 5 Feb 2025 13:20:07 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Rik van Riel <riel@surriel.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, bp@alien8.de,
	dave.hansen@linux.intel.com, zhengqi.arch@bytedance.com,
	nadav.amit@gmail.com, thomas.lendacky@amd.com, kernel-team@meta.com,
	linux-mm@kvack.org, akpm@linux-foundation.org, jannh@google.com,
	mhklinux@outlook.com, andrew.cooper3@citrix.com,
	Dave Hansen <dave.hansen@intel.com>
Subject: Re: [PATCH v8 03/12] x86/mm: consolidate full flush threshold
 decision
Message-ID: <20250205122007.GH14028@noisy.programming.kicks-ass.net>
References: <20250205014033.3626204-1-riel@surriel.com>
 <20250205014033.3626204-4-riel@surriel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205014033.3626204-4-riel@surriel.com>

On Tue, Feb 04, 2025 at 08:39:52PM -0500, Rik van Riel wrote:

> diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
> index 6cf881a942bb..02e1f5c5bca3 100644
> --- a/arch/x86/mm/tlb.c
> +++ b/arch/x86/mm/tlb.c
> @@ -1000,8 +1000,13 @@ static struct flush_tlb_info *get_flush_tlb_info(struct mm_struct *mm,
>  	BUG_ON(this_cpu_inc_return(flush_tlb_info_idx) != 1);
>  #endif
>  
> -	info->start		= start;
> -	info->end		= end;
> +	/*
> +	 * Round the start and end addresses to the page size specified
> +	 * by the stride shift. This ensures partial pages at the end of
> +	 * a range get fully invalidated.
> +	 */
> +	info->start		= round_down(start, 1 << stride_shift);
> +	info->end		= round_up(end, 1 << stride_shift);
>  	info->mm		= mm;
>  	info->stride_shift	= stride_shift;
>  	info->freed_tables	= freed_tables;

Rather than doing this; should we not fix whatever dodgy users are
feeding us non-page-aligned addresses for invalidation?


