Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781532505AF
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 20:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744143171; cv=none; b=NOp1RXaFVX+JpLfekV9vw93mtGOuydYKhC73votfDdlvxumJpBzTxvHTaZrT/2R/rcftkWPZmGQ8MoTIG+MQQFA7kskmsmsV0bhy9KFXb/IqReImMlEydwyNox5DFBT73lSr0oJz8bYZ56+/U+erTIWU/d4T6QnMH5jWqugkwjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744143171; c=relaxed/simple;
	bh=P3KWCOTDid2P74uDKVMxyQ07KZxWbqExJx3LbL13i8I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=A2yIeHgI+hVOibfsAVAP0R6H9k7b8gl/8+DNhPyTPMNwB6z5nkl37G3t4gACoC8RwQrPkuLHYF6b4ZZaZd7sGBN5mwBGmtSGmB229R2eLwRrH/QVxjnaDMUqR7gFTuswGQ4gZwLmDt9MqIS8KoDvRYYGa3TnVLZCjyTQ2R8WBE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pc3C9ZNh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pc3C9ZNh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B49F4C4CEE5;
	Tue,  8 Apr 2025 20:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744143171;
	bh=P3KWCOTDid2P74uDKVMxyQ07KZxWbqExJx3LbL13i8I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Pc3C9ZNhu2OsczFzUKrha6qBFvj8rL3JaJ7ckdjFU5DIjkG934gOabPgCK2VGWn/L
	 Pp7bk6u/bTn8v7YLmyATZ8HK4ms36phDaWW1QnfO/j5hGlEecxH3dtfZ4O26Bsiu2e
	 X/Ek5cvS7jnXUFxnqxnfrhUAlNw9W47/NSAo8EYA1UfouJBSYvgbPG3Ca0y9aVivh7
	 yAdcRntQUtLqa0Pe1wBa/f9YndX7pNZp6tErkasgionYglkGCDJSuFV02ygi6lqPXv
	 ijDU/cfy4+sici3sQYAtRaaYYHtewClQcKZgMBBj2UZ3K7vFi8Tu+Jipw6Lm+t6ovy
	 MaC8xSXeruIWQ==
From: SeongJae Park <sj@kernel.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: SeongJae Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R.Howlett" <howlett@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Rik van Riel <riel@surriel.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Vlastimil Babka <vbabka@suse.cz>,
	kernel-team@meta.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v2 3/4] mm/memory: split non-tlb flushing part from zap_page_range_single()
Date: Tue,  8 Apr 2025 13:12:48 -0700
Message-Id: <20250408201248.63244-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <8e79ba42-a229-4a55-ae26-cd049bf85144@lucifer.local>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 8 Apr 2025 14:29:41 +0100 Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:

> On Fri, Apr 04, 2025 at 02:06:59PM -0700, SeongJae Park wrote:
> > Some of zap_page_range_single() callers such as [process_]madvise() with
> > MADV_DONTNEED[_LOCKED] cannot batch tlb flushes because
> > zap_page_range_single() flushes tlb for each invocation.  Split out the
> > body of zap_page_range_single() except mmu_gather object initialization
> > and gathered tlb entries flushing for such batched tlb flushing usage.
> >
> > To avoid hugetlb pages allocation failures from concurrent page faults,
> > the tlb flush should be done before hugetlb faults unlocking, though.
> > Do the flush and the unlock inside the split out function in the order
> > for hugetlb vma case.  Refer to commit 2820b0f09be9 ("hugetlbfs: close
> > race between MADV_DONTNEED and page fault") for more details about the
> > concurrent faults' page allocation failure problem.
> 
> Good lord, I really hate how we do hugetlb.
> 
> >
> > Signed-off-by: SeongJae Park <sj@kernel.org>
> > ---
> >  mm/memory.c | 49 +++++++++++++++++++++++++++++++++++++++----------
> >  1 file changed, 39 insertions(+), 10 deletions(-)
> >
> > diff --git a/mm/memory.c b/mm/memory.c
> > index 8669b2c981a5..8c9bbb1a008c 100644
> > --- a/mm/memory.c
> > +++ b/mm/memory.c
> > @@ -1989,36 +1989,65 @@ void unmap_vmas(struct mmu_gather *tlb, struct ma_state *mas,
> >  	mmu_notifier_invalidate_range_end(&range);
> >  }
> >
> > -/**
> > - * zap_page_range_single - remove user pages in a given range
> > +/*
> > + * notify_unmap_single_vma - remove user pages in a given range
> > + * @tlb: pointer to the caller's struct mmu_gather
> >   * @vma: vm_area_struct holding the applicable pages
> > - * @address: starting address of pages to zap
> > - * @size: number of bytes to zap
> > + * @address: starting address of pages to remove
> > + * @size: number of bytes to remove
> >   * @details: details of shared cache invalidation
> >   *
> > - * The range must fit into one VMA.
> > + * @tlb shouldn't be NULL.  The range must fit into one VMA.  If @vma is for
> > + * hugetlb, @tlb is flushed and re-initialized by this function.
> >   */
> > -void zap_page_range_single(struct vm_area_struct *vma, unsigned long address,
> > +static void notify_unmap_single_vma(struct mmu_gather *tlb,
> > +		struct vm_area_struct *vma, unsigned long address,
> >  		unsigned long size, struct zap_details *details)
> 
> Don't love this name. It seems to imply that the primary thing here is the MMU
> notification bit.
> 
> This is like unmap_vmas() but for a single VMA, that is - contains the
> logic unmap_vmas() does for mmu notifier stuff and hugetlb stuff (vom in
> mouth), deferring heavy lifting to unmap_single_vma().
> 
> I think it might be better to just go with the brainless
> '__zap_page_range_single()' here honestly. Then we at least reduce the mess
> of confusion in this function naming here.
> 
> Of course you intend to un-static this shortly... so maybe that's not so
> great.
> 
> zap_page_range_single_batched()?

Sounds good to me.  I will rename the function so, unless we get other
opinions.

> 
> >  {
> >  	const unsigned long end = address + size;
> >  	struct mmu_notifier_range range;
> > -	struct mmu_gather tlb;
> > +
> > +	VM_WARN_ON_ONCE(!tlb);
> 
> Maybe pedantic, but we probably want to ensure not only that tlb is set but
> also has had tlb_gatehr_mmu() performed upon it. Then again probably a bit
> much given this is a static function called only from
> zap_page_range_single().
> 
> Hm actually you intend to un-static this shortly right? So I guess in that
> case we do want some kind of check like this, perhaps absracting this bit
> of tlb_flush_mmu_tlbonly():
> 
> 	if (!(tlb->freed_tables || tlb->cleared_ptes || tlb->cleared_pmds ||
> 	      tlb->cleared_puds || tlb->cleared_p4ds))
> 		return;

This code is to see if there are tlb entries to flush.

In this function, valid 'tlb' can either have such entries or not.  So this
code could be good reference but couldn't be used as is.  I think most fields
of mmu_gather can be arbitrarily updated depending on use cases, so making a
perfect but simple check wouldn't be easy.

I think tlb->mm shouldn't be changed after the initialization, though.  So
(tlb->mm == vma->vm_mm) could be a good enough additional check.

> 
> Into a separate is_tlb_flushable() helper function or something. Then this
> warning can become:
> 
> /* tlb should be initialised for a new gather operation. */
> VM_WARN_ON_ONCE(!tlb || is_tlb_flushable(tlb));

If you agree (tlb->mm == vma->vm_mm) is sufficient check, this could be

VM_WARN_ON_ONCE(!tlb || tlb->mm != vma->vm_mm)

> 
> >
> >  	mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, vma->vm_mm,
> >  				address, end);
> >  	hugetlb_zap_begin(vma, &range.start, &range.end);
> 
> Is it a problem that we invoke this function now _after_ tlb_gather_mmu()
> has begun?

I think it is not a problem since I find no requirements of the ordering.
Please let me know if I'm missing seomthing.

> 
> > -	tlb_gather_mmu(&tlb, vma->vm_mm);
> >  	update_hiwater_rss(vma->vm_mm);
> >  	mmu_notifier_invalidate_range_start(&range);
> >  	/*
> >  	 * unmap 'address-end' not 'range.start-range.end' as range
> >  	 * could have been expanded for hugetlb pmd sharing.
> >  	 */
> 
> Oh GOD I HATE THAT WE HANDLE HUGETLB THIS WAY!!!
> 
> Anything where you have to open-code concerns about how a specific use case
> uses something like this is just asking to be broken.
> 
> Obviously this is nothing to do with your series and is just a grumble to
> the sky, but still! *shakes fist at cloud*
> 
> > -	unmap_single_vma(&tlb, vma, address, end, details, false);
> > +	unmap_single_vma(tlb, vma, address, end, details, false);
> >  	mmu_notifier_invalidate_range_end(&range);
> > +	if (is_vm_hugetlb_page(vma)) {
> > +		/*
> > +		 * flush tlb and free resources before hugetlb_zap_end(), to
> > +		 * avoid concurrent page faults' allocation failure
> 
> Nit: add a full stop (or for those residing in North America 'period' :>)
> at the end of this sentence. This is very bikesheddy I know, and can only
> apologise.

Thank you for kindly suggesting this, I will update as you recommended in the
next spin.

> 
> > +		 */
> > +		tlb_finish_mmu(tlb);
> > +		hugetlb_zap_end(vma, details);
> > +		tlb_gather_mmu(tlb, vma->vm_mm);
> > +	}
> 
> OK, so as far as I can tell, after this change, we are still ensuring that
> the tlb is flushed _prior_ to the invocation of hugetlb_zap_end(), only we,
> in order to later export this function, need do it here instead... I mean
> this is horrid, but it's sort of unavoidable really.
> 
> So I guess this just undoes the optimisation in the case of hugetlb, which
> probably doesn't really matter all that much at huge page size
> anyway... and plus it's hugetlb so.

Yes, that's the intended behavior.

> 
> Yeah fine, just kind of horrid.

I agree this is not clean, and thank you for understanding the situation.
Hopefully we will find a chance to revisit for cleanup later.

> 
> > +}
> > +
> > +/**
> > + * zap_page_range_single - remove user pages in a given range
> > + * @vma: vm_area_struct holding the applicable pages
> > + * @address: starting address of pages to zap
> > + * @size: number of bytes to zap
> > + * @details: details of shared cache invalidation
> > + *
> > + * The range must fit into one VMA.
> > + */
> > +void zap_page_range_single(struct vm_area_struct *vma, unsigned long address,
> > +		unsigned long size, struct zap_details *details)
> > +{
> > +	struct mmu_gather tlb;
> > +
> > +	tlb_gather_mmu(&tlb, vma->vm_mm);
> > +	notify_unmap_single_vma(&tlb, vma, address, size, details);
> >  	tlb_finish_mmu(&tlb);
> > -	hugetlb_zap_end(vma, details);
> >  }
> >
> >  /**
> > --
> > 2.39.5

Thank you for taking your time for reviewing this.  If you have no other
opinions, I will make the next spin as mentioned above.


Thanks,
SJ
