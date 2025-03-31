Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A8A43172
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 20:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743452656; cv=none; b=CRc59YMqZp7QyPoDmTy7x8Y+U/aO8X5N4h+pcodMDoQ+oqn5y/pEdT4v/ld/WAJIYgdzr006pNg8lCxFktsK820xzYiqDK30xNeNj6at6oCLLojJOHrEqz4yhmB+VZFJEr2DDu49PNDW8lx2jjUJp2FyrjRk1oIBf/jYq5dmQGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743452656; c=relaxed/simple;
	bh=RaV+ftD7id0HINAlA10aBvlHKJlS/GQxAi1hYTsniAQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=K4a04WV2TANMQZ32k3l0Wpia6ZTal0B8FEb4tLZWa4xmshqhzSYSZJTJkjQ3+yIHXPPL9k+b1OhlRGl2ej3aOIT0HaXIYZub42uIv23vudAIt6Db7S/TbvVU2pyrt70qI4Hu69ZbRrRYfk4+EKc63kpWas7x49YreF4ECleTTd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gMfBA8R0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gMfBA8R0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 416F7C4CEE3;
	Mon, 31 Mar 2025 20:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743452655;
	bh=RaV+ftD7id0HINAlA10aBvlHKJlS/GQxAi1hYTsniAQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gMfBA8R0TJsT4T//dtoFdQjOPnDS96w6ahGBc6Wbt1lGYFKbIH03ZtbTT4eVqK5WU
	 2hqXcK7X4noNDLdKW9toC+tPgl4dWj3oc6pRyYxFnxk7rXNc5B3NwtAJQ2FMq80i/F
	 TgsVUMuVlFEN5hgcFTam6iHZFBeFghz+n+qmukRBIcEF5zLceiUJk14okMA8ees38+
	 17QUU7Op+prjqCHq16MZyr2rfHNYbnRUamT8mkb1/DdsYdgrIL8BDQe1ljGyE0o3j1
	 EXeXKVaMu+R/qa05jlTDgOcgiEA/cOX2/8+W9+WdZYfm/cnTFJVl++srYcK5f5ZrDS
	 /2GjPL/rlmGrA==
From: SeongJae Park <sj@kernel.org>
To: SeongJae Park <sj@kernel.org>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <howlett@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Vlastimil Babka <vbabka@suse.cz>,
	kernel-team@meta.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Rik van Riel <riel@surriel.com>
Subject: Re: [PATCH 6/9] mm/memory: split non-tlb flushing part from zap_page_range_single()
Date: Mon, 31 Mar 2025 13:24:11 -0700
Message-Id: <20250331202411.1221-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250311205801.85356-1-sj@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 11 Mar 2025 13:58:01 -0700 SeongJae Park <sj@kernel.org> wrote:

> On Tue, 11 Mar 2025 12:45:44 +0000 Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:
> 
> > On Mon, Mar 10, 2025 at 10:23:15AM -0700, SeongJae Park wrote:
> > > Some of zap_page_range_single() callers such as [process_]madvise() with
> > > MADV_DONEED[_LOCKED] cannot batch tlb flushes because
> > > zap_page_range_single() does tlb flushing for each invocation.  Split
> > > out the body of zap_page_range_single() except mmu_gather object
> > > initialization and gathered tlb entries flushing parts for such batched
> > > tlb flushing usage.
> > >
> > > Signed-off-by: SeongJae Park <sj@kernel.org>
> > > ---
> > >  mm/memory.c | 36 ++++++++++++++++++++++--------------
> > >  1 file changed, 22 insertions(+), 14 deletions(-)
> > >
> > > diff --git a/mm/memory.c b/mm/memory.c
> > > index 78c7ee62795e..88c478e2ed1a 100644
> > > --- a/mm/memory.c
> > > +++ b/mm/memory.c
> > > @@ -1995,38 +1995,46 @@ void unmap_vmas(struct mmu_gather *tlb, struct ma_state *mas,
> > >  	mmu_notifier_invalidate_range_end(&range);
> > >  }
> > >
> > > -/**
> > > - * zap_page_range_single - remove user pages in a given range
> > > - * @vma: vm_area_struct holding the applicable pages
> > > - * @address: starting address of pages to zap
> > > - * @size: number of bytes to zap
> > > - * @details: details of shared cache invalidation
> > > - *
> > > - * The range must fit into one VMA.
> > > - */
> > > -void zap_page_range_single(struct vm_area_struct *vma, unsigned long address,
> > > +static void unmap_vma_single(struct mmu_gather *tlb,
> > > +		struct vm_area_struct *vma, unsigned long address,
> > >  		unsigned long size, struct zap_details *details)
> > >  {
> > >  	const unsigned long end = address + size;
> > >  	struct mmu_notifier_range range;
> > > -	struct mmu_gather tlb;
> > >
> > >  	mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, vma->vm_mm,
> > >  				address, end);
> > >  	hugetlb_zap_begin(vma, &range.start, &range.end);
> > > -	tlb_gather_mmu(&tlb, vma->vm_mm);
> > >  	update_hiwater_rss(vma->vm_mm);
> > >  	mmu_notifier_invalidate_range_start(&range);
> > >  	/*
> > >  	 * unmap 'address-end' not 'range.start-range.end' as range
> > >  	 * could have been expanded for hugetlb pmd sharing.
> > >  	 */
> > > -	unmap_single_vma(&tlb, vma, address, end, details, false);
> > > +	unmap_single_vma(tlb, vma, address, end, details, false);
> > >  	mmu_notifier_invalidate_range_end(&range);
> > > -	tlb_finish_mmu(&tlb);
> > >  	hugetlb_zap_end(vma, details);
> > 
> > Previously hugetlb_zap_end() would happen after tlb_finish_mmu(), now it happens
> > before?
> > 
> > This seems like a major problem with this change.
> 
> Oh, you're right.  This could re-introduce the racy hugetlb allocation failure
> problem that fixed by commit 2820b0f09be9 ("hugetlbfs: close race between
> MADV_DONTNEED and page fault").  That is, this patch can make hugetlb
> allocation failures increase while MADV_DONTNEED is going on.
> 
> Maybe a straightforward fix of the problem is doing hugetlb_zap_end() for all
> vmas in a batched manner, similar to that for tlb flush.  For example, add a
> list or an array for the vmas in 'struct madvise_behavior', let
> 'unmap_vma_single()' adds each vma in there, and call hugetlb_zap_end() for
> gathered vmas at vector_madvise() or do_madvise().  Does that make sense?
> 
> Also Cc-ing Rik, who is the author of the commit 2820b0f09be9 ("hugetlbfs:
> close race between MADV_DONTNEED and page fault") for a case that I'm missing
> something important.

I now think the straightforward fix I mentioned in the previous message might
be unnecessarily big change.  Maybe letting the unmap_vma_single() caller does
hugetlb_zap_end() and tlb_finish_mmu() on their own in a correct sequence could
be another way?  Then zap_page_range_single() can do the calls for each
invocation as it did before.  process_madvise() could do batched tlb flushes
only for non-hugetlb case.  That is, do the tlb entries gathering as this
version of patch series proposes in usual.  But see if the address range is for
hugetlb and therefore require hugetlb_zap_end() call in real.  If so, flush the
so far gathered tlb entries, call hugetlb_zap_end(), and then start next batch?

In other words, I'm proposing to split the batched flushes when a hugetlb is
encountered.  This means that tlb flush overhead reduction might be smaller
than expected if process_madvise() for unmapping hugetlb pages is intensively
invoked.  But I 't think that's not a common use case.  Having the benefit for
non-hugetlb pages with simple change first, and revisiting hugetlb case later
once the problem comes out might be a way, in my opinion.

For example, my idea could implemented like below, on top of this entire patch
series.

diff --git a/mm/madvise.c b/mm/madvise.c
index 4021db51aeda..e6a74e7ef864 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -861,6 +861,20 @@ static long madvise_dontneed_single_vma(struct madvise_behavior *behavior,
 	};
 
 	unmap_vma_single(behavior->tlb, vma, start, end - start, &details);
+	/*
+	 * hugetlb_zap_end() should be called after tlb_finish_mmu() to avoid
+	 * hugetlb faults for the tlb-flushing memory hanppen before freeing of
+	 * the memory.  If not, the fault will fail memory allocation.
+	 *
+	 * If hugetlb_zap_end() really need to be called, flush so-far gathered
+	 * tlb entries, invoke hugetlb_zap_end(), and start another batch of
+	 * tlb flushes for remaining unmap works.
+	 */
+	if (is_vm_hugetlb_page(vma)) {
+		tlb_finish_mmu(behavior->tlb);
+		hugetlb_zap_end(vma, &details);
+		tlb_gather_mmu(behavior->tlb, vma->vm_mm);
+	}
 	return 0;
 }
 
diff --git a/mm/memory.c b/mm/memory.c
index add8d540cb63..4431630d3240 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -2023,7 +2023,6 @@ void unmap_vma_single(struct mmu_gather *tlb, struct vm_area_struct *vma,
 	 */
 	unmap_single_vma(tlb, vma, address, end, details, false);
 	mmu_notifier_invalidate_range_end(&range);
-	hugetlb_zap_end(vma, details);
 }
 
 /**
@@ -2043,6 +2042,7 @@ void zap_page_range_single(struct vm_area_struct *vma, unsigned long address,
 	tlb_gather_mmu(&tlb, vma->vm_mm);
 	unmap_vma_single(&tlb, vma, address, size, details);
 	tlb_finish_mmu(&tlb);
+	hugetlb_zap_end(vma, details);
 }
 
 /**

Any concern or something I'm missing?


Thanks,
SJ

[...]
