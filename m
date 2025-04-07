Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6632135B1
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 16:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744044651; cv=none; b=goGf7Fy1OVqdidIyMPJ3HKdYEpNgp6Z1wr8NeYoKzYQz/rl+0O447t8XQZAWVNNtjSgZQphGAlKGQcz37u10scUYGnDEp1Xjs9M14Cfcsc9DyQMhPhuhv6PAMamHZgOP3x3oo+hElAzRKooL7SSP/F0J1aEgJfbJRB/1djqo8U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744044651; c=relaxed/simple;
	bh=upra86Slk5LmnBFaEkpdCTezFQg4f71K0J7SoROuknw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uFs0eWF/pNHSxf+75+23vFEZfGl9hdtXHQ4Vmoc/YiwPLpSRzLxnhEMWI77Jr1ZtGNyew+ChK/8jGRfcfrYnBG7QiNAO4l995nOpY1jyhQT0PmJv9UMwQDuDJRS1fDNe5s+A00S2McdjEw0kruE6ckeBrGQuo4fLy1bF8R5yhM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qfgq5ZRH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qfgq5ZRH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97598C4CEE7;
	Mon,  7 Apr 2025 16:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744044650;
	bh=upra86Slk5LmnBFaEkpdCTezFQg4f71K0J7SoROuknw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qfgq5ZRHaW/bjR5KwsTKcQlk1IyPleTw08ENsTFbqSXFBSVPtu/4KPTmksc+kXcjS
	 wyGjWGmpXvj9WkjGqaIM6cbXLIMN0QSnB+wnBrfbL0SeDRjQ2PHXwWE8UGFVjzD/2G
	 knmPSZ6mhVT603/pTTzBkoeI1fE1QRLKLnZYuK4LY1wlnZZShwDlOPqTb3NcCaShDR
	 ytxPTRB1DFFoVSSou9PhNHBd8Z0KLXXbdgIKoxBgPC7q9cCPjWZAapvfJhuQEYRSGK
	 8kdqhpvcZz1dSkZ4Qlxb850nt1cDA+vKr/R4uvYYhoFRQOoaKUqn7i5TZKsoh2euZa
	 HzVuUsxVR3Cvw==
Date: Mon, 7 Apr 2025 18:50:43 +0200
From: Ingo Molnar <mingo@kernel.org>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
	kernel test robot <lkp@intel.com>,
	Dan Carpenter <error27@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Rik van Riel <riel@surriel.com>, "H. Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v1] x86/mm/pat: (un)track_pfn_copy() fix + improvements
Message-ID: <Z_QCYzEJXTnd97Sf@gmail.com>
References: <20250404124931.2255618-1-david@redhat.com>
 <Z_K5uW2eu7GInRxs@gmail.com>
 <630caa8e-2ee2-4895-9e4e-8bf2fa079100@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <630caa8e-2ee2-4895-9e4e-8bf2fa079100@redhat.com>


* David Hildenbrand <david@redhat.com> wrote:

> On 06.04.25 19:28, Ingo Molnar wrote:
> > 
> > * David Hildenbrand <david@redhat.com> wrote:
> > 
> > > We got a late smatch warning and some additional review feedback.
> > > 
> > > 	smatch warnings:
> > > 	mm/memory.c:1428 copy_page_range() error: uninitialized symbol 'pfn'.
> > 
> > > -	if (!(src_vma->vm_flags & VM_PAT))
> > > +	if (!(src_vma->vm_flags & VM_PAT)) {
> > > +		*pfn = 0;
> > >   		return 0;
> > > +	}
> > 
> > >   static inline int track_pfn_copy(struct vm_area_struct *dst_vma,
> > >   		struct vm_area_struct *src_vma, unsigned long *pfn)
> > >   {
> > > +	*pfn = 0;
> > >   	return 0;
> > >   }
> > 
> > That's way too ugly. There's nothing wrong with not touching 'pfn' 
> > in the error path: in fact it's pretty standard API where output 
> > pointers may not get set on errors.
> 
> We're not concerned about the error path, though.

Sorry, indeed, not an error path, but the !VM_PAT path above - but 
still a similar argument applies IMHO.

> > If Smatch has a problem with it, Smatch should be fixed, or the false
> > positive warning should be worked around by initializing 'pfn' in the
> > callers.
> 
> We could adjust the documentation of track_pfn_copy, to end up with the
> following:
> 
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index e2b705c149454..b50447ef1c921 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -1511,8 +1511,9 @@ static inline void track_pfn_insert(struct vm_area_struct *vma, pgprot_t *prot,
>  /*
>   * track_pfn_copy is called when a VM_PFNMAP VMA is about to get the page
> - * tables copied during copy_page_range(). On success, stores the pfn to be
> - * passed to untrack_pfn_copy().
> + * tables copied during copy_page_range(). Will store the pfn to be
> + * passed to untrack_pfn_copy() only if there is something to be untracked.
> + * Callers should initialize the pfn to 0.
>   */
>  static inline int track_pfn_copy(struct vm_area_struct *dst_vma,
>                 struct vm_area_struct *src_vma, unsigned long *pfn)
> @@ -1522,7 +1523,9 @@ static inline int track_pfn_copy(struct vm_area_struct *dst_vma,
>  /*
>   * untrack_pfn_copy is called when a VM_PFNMAP VMA failed to copy during
> - * copy_page_range(), but after track_pfn_copy() was already called.
> + * copy_page_range(), but after track_pfn_copy() was already called. Can
> + * be called even if track_pfn_copy() did not actually track anything:
> + * handled internally.
>   */
>  static inline void untrack_pfn_copy(struct vm_area_struct *dst_vma,
>                 unsigned long pfn)
> diff --git a/mm/memory.c b/mm/memory.c
> index 2d8c265fc7d60..1a35165622e1c 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -1361,7 +1361,7 @@ copy_page_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma)
>         struct mm_struct *dst_mm = dst_vma->vm_mm;
>         struct mm_struct *src_mm = src_vma->vm_mm;
>         struct mmu_notifier_range range;
> -       unsigned long next, pfn;
> +       unsigned long next, pfn = 0;

Ack.

I hate it how uninitialized variables are even a thing in C, and why 
there's no compiler switch to turn it off for the kernel. (At least for 
non-struct variables. Even for structs I would zero-initialize and 
*maybe* allow a non-initialized opt-in for cases where it matters. It 
matters in very few cases in praxis. And don't get me started about the 
stupidity that is to not initialize holes in struct members ...)

Over the decades we've lived through numerous nasty bugs for very 
little tangible code generation benefits.

Thanks,

	Ingo
