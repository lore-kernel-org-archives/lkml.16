Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A671519A4
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 14:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738765041; cv=none; b=kVa+f5+RVN07HXY5M0P//reqORxwDdHK5Gg+dIDrmZg9+gjZth4PRMNFreYr2D8dYTDoV7pHPzsOjiCm1gTYYxWum8ZduDd9hvtIOqSFgt6IivSgYd9DljXk8ifFwj3eGxHc3OK/8prWKRhtqyxLzL+G6JO8BbmbczJCPvkNlY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738765041; c=relaxed/simple;
	bh=lUrrMogt8i1esa6CXtvJBZWmC6rSM6DJVUX2mQhZ73U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pc5TjA5X6Iz8HsziAqzPGZZ6ahyHWa5gU4tMfONZq6Z2cASPzVQL4tT2qbZpS8jqZdZHPyPW1CRDYKZZ0BuzVaFNmlwpBSPmYgUgMTN8GWl2/04RtYGp1KYo/SN1g5PoGePiF9H9wmhqgieQ51DS6LWnT4uAhKXGnDh10BsAiFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=i1mNhH51; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="i1mNhH51"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Yacrfr+qgYECGhPMAq6+rkNVgjaProQvP0wgFeX9IaE=; b=i1mNhH51YMwBWjQoafvZFZhuU8
	3craX5Ylu69GraNMYs0XIUU2h1biMnl5vOAQzMUHAuEehov/6VA0BEodBmYpTagAnjO6bK0n4dR0M
	xVGcRMwWLL/9TXBJ/kLL5lfPiYN6Eh8dCrDMokeCoAVXtBLKopAZtkMaFEgl1vz+P+peh8Ax5uTG0
	j76ASy6BsA5OY/NaOZD7hzLmfj76WVF/gPET+OaUPRp8FuKxkxUmson+FyZGENa2AH6lBev5sH763
	KEf3Jwy+ApVAh2D5w07CH7xNgR8tGY+BLhjh3GFiE8Dl8I7cY+ynW81hNfQTEp384oxVxkJsCkMo4
	YDlhDzJw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tfgD7-0000000Geye-3eUD;
	Wed, 05 Feb 2025 14:17:02 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 45E3330050D; Wed,  5 Feb 2025 14:00:46 +0100 (CET)
Date: Wed, 5 Feb 2025 14:00:46 +0100
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
Message-ID: <20250205130046.GB31462@noisy.programming.kicks-ass.net>
References: <20250205014033.3626204-1-riel@surriel.com>
 <20250205014033.3626204-4-riel@surriel.com>
 <20250205122007.GH14028@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205122007.GH14028@noisy.programming.kicks-ass.net>

On Wed, Feb 05, 2025 at 01:20:07PM +0100, Peter Zijlstra wrote:
> On Tue, Feb 04, 2025 at 08:39:52PM -0500, Rik van Riel wrote:
> 
> > diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
> > index 6cf881a942bb..02e1f5c5bca3 100644
> > --- a/arch/x86/mm/tlb.c
> > +++ b/arch/x86/mm/tlb.c
> > @@ -1000,8 +1000,13 @@ static struct flush_tlb_info *get_flush_tlb_info(struct mm_struct *mm,
> >  	BUG_ON(this_cpu_inc_return(flush_tlb_info_idx) != 1);
> >  #endif
> >  
> > -	info->start		= start;
> > -	info->end		= end;
> > +	/*
> > +	 * Round the start and end addresses to the page size specified
> > +	 * by the stride shift. This ensures partial pages at the end of
> > +	 * a range get fully invalidated.
> > +	 */
> > +	info->start		= round_down(start, 1 << stride_shift);
> > +	info->end		= round_up(end, 1 << stride_shift);
> >  	info->mm		= mm;
> >  	info->stride_shift	= stride_shift;
> >  	info->freed_tables	= freed_tables;
> 
> Rather than doing this; should we not fix whatever dodgy users are
> feeding us non-page-aligned addresses for invalidation?

That is, I feel this is worthy of WARN_ONCE at the very least.
