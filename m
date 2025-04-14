Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629511A2630
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 06:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744613590; cv=none; b=EHCgRlAcapWS+H8Z9l2qUHBj7MUhxGUIW+xhkNZXK4O2/2ywfrC4ASymUI1zbXhHNBjx5ePM+fqqL20koHnP1KJBIrbY52FIPjpKQKi0tS17E3hnd3ndJwmGsoS6hC2ZO8wgSxTkip75xOp1ukoVre2fkCFZK8qJCvMwjz/VTaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744613590; c=relaxed/simple;
	bh=AHvofNn5TL3U2ajIrQ9gUjfUGkeWtcbsQ1mCQPypoL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KnVFyDKca8mFloOc8Bri6mi6v/YDKjspAF1cYv55XaljOd5JmrP3LPgLqjFuNuxV0+QOop29zaJHskNxs3v2mSdtsPnAhH2kloTurdOBWKgDTWw65b8vWxPd3wX0b+UJKUkJnxv23qAPcdZNwVI6vuBdmISw0GXMMwRYMB0f/Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sWJARPmo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sWJARPmo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6374BC4CEE2;
	Mon, 14 Apr 2025 06:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744613589;
	bh=AHvofNn5TL3U2ajIrQ9gUjfUGkeWtcbsQ1mCQPypoL0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sWJARPmoJzyiLOTGOtX/2dezXvdf2fh7nhbxBkVEU6wCjtq47P+jxcr76UGmyU7g3
	 hV39/tOYkL223mfzF6NKJysn4zMGBL/251CtSYAN13XcEiyFOZJnZilkHMq49C+a2R
	 IgNIjN2tw5Ts6YjOk4EN7821v9iH/QMrJYqUZ4j9WPDtyoKLePBB5skU0+AtZhkmPn
	 5Z8i7Ml0pbSNLqqgq0wh++RoM3zXfM81xSDzXFxG1eAtio5M5gLzW11RTHHIWP6MT2
	 fHZUmDvb2vYCYEJN5je8dAOieNjfHZcrCGnZmyWmI9ovok4qmvKVGB08Pv6yOsGW6T
	 UNiAbh5vAby6g==
Date: Mon, 14 Apr 2025 08:53:02 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Ankur Arora <ankur.a.arora@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
	torvalds@linux-foundation.org, akpm@linux-foundation.org,
	bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
	mingo@redhat.com, luto@kernel.org, peterz@infradead.org,
	paulmck@kernel.org, rostedt@goodmis.org, tglx@linutronix.de,
	willy@infradead.org, jon.grimm@amd.com, bharata@amd.com,
	raghavendra.kt@amd.com, boris.ostrovsky@oracle.com,
	konrad.wilk@oracle.com
Subject: Re: [PATCH v3 4/4] x86/folio_zero_user: multi-page clearing
Message-ID: <Z_ywzkEEqUOMHcO0@gmail.com>
References: <20250414034607.762653-1-ankur.a.arora@oracle.com>
 <20250414034607.762653-5-ankur.a.arora@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414034607.762653-5-ankur.a.arora@oracle.com>


* Ankur Arora <ankur.a.arora@oracle.com> wrote:

> clear_pages_rep(), clear_pages_erms() use string instructions to zero
> memory. When operating on more than a single page, we can use these
> more effectively by explicitly advertising the region-size to the
> processor, which can use that as a hint to optimize the clearing
> (ex. by eliding cacheline allocation.)

> +#ifndef CONFIG_HIGHMEM
> +/*
> + * folio_zero_user_preemptible(): multi-page clearing variant of folio_zero_user().
> + *
> + * Taking inspiration from the common code variant, we split the zeroing in
> + * three parts: left of the fault, right of the fault, and up to 5 pages
> + * in the immediate neighbourhood of the target page.
> + *
> + * Cleared in that order to keep cache lines of the target region hot.
> + *
> + * For gigantic pages, there is no expectation of cache locality so just do a
> + * straight zero.
> + */
> +void folio_zero_user_preemptible(struct folio *folio, unsigned long addr_hint)
> +{
> +	unsigned long base_addr = ALIGN_DOWN(addr_hint, folio_size(folio));
> +	const long fault_idx = (addr_hint - base_addr) / PAGE_SIZE;
> +	const struct range pg = DEFINE_RANGE(0, folio_nr_pages(folio) - 1);
> +	int width = 2; /* pages cleared last on either side */
> +	struct range r[3];
> +	int i;
> +
> +	if (folio_nr_pages(folio) > MAX_ORDER_NR_PAGES) {
> +		clear_pages(page_address(folio_page(folio, 0)), folio_nr_pages(folio));

> +			clear_pages(page_address(folio_page(folio, r[i].start)), len);

So the _user postfix naming is super confusing here and elsewhere in 
this series.

clear_page(), and by extension the clear_pages() interface you extended 
it to, fundamentally only works on kernel addresses:

/*
 * Zero a page.
 * %rdi - page
 */
SYM_TYPED_FUNC_START(clear_page_rep)
        movl $4096/8,%ecx
        xorl %eax,%eax
        rep stosq
        RET

Note the absolute lack of fault & exception handling.

But folio_zero_user*() uses the kernel-space variants of page clearing 
AFAICT (contrary to the naming):

void folio_zero_user(struct folio *folio, unsigned long addr_hint)
{
        unsigned int nr_pages = folio_nr_pages(folio);

        if (unlikely(nr_pages > MAX_ORDER_NR_PAGES))
                clear_gigantic_page(folio, addr_hint, nr_pages);
        else
                process_huge_page(addr_hint, nr_pages, clear_subpage, folio);
}


static void clear_gigantic_page(struct folio *folio, unsigned long addr_hint,
                                unsigned int nr_pages)
{
        unsigned long addr = ALIGN_DOWN(addr_hint, folio_size(folio));
        int i;
         
        might_sleep();
        for (i = 0; i < nr_pages; i++) {
                cond_resched();
                clear_user_highpage(folio_page(folio, i), addr + i * PAGE_SIZE);
        }       
}

Which on x86 is simply mapped into a kernel-memory interface:

static inline void clear_user_page(void *page, unsigned long vaddr,
                                   struct page *pg)
{
        clear_page(page);
}

So at minimum this is a misnomer and a confusing mixture of user/kernel 
interface names on an epic scale that TBH should be cleaned up first 
before extended...

> +out:
> +	/* Explicitly invoke cond_resched() to handle any live patching necessary. */
> +	cond_resched();

What again?

Thanks,

	Ingo
