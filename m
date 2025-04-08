Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D5E1E8348
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 18:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744138190; cv=none; b=XqRE8DaivOBfDztQGlKGC+RxdxAouWEWaJAlQ3uypW1Cu2s1AbdXCGrQmIFAf9hNpyNF2WXrw6YgqvR7OO/K0e8Ykmq7GQQfPI+dBCS+xtEwzKEgOidHV/TWmVMKge6pFns/S9AXVam5vH2F0cM1et2WxyG9z/3OaSnJyAIqVAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744138190; c=relaxed/simple;
	bh=JUCB2bV+iYGyCNwUBsapZGnABiFfj1VKYKVKsbGH/zg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SfxPqf7IQWL/2KdpdfCP4SL2P49K3HFSiE/n2bf6msR2ce5AlQwHUG94BraHwnyXqHq9jlrVpGAHLvjW7dkwDHhGH8sTRL4vv+AQtbwigh9jU16m698NpMbyPle0+Sv9qLJkIAOLSyLSmCtTO8/VvcQi+vnp/JeRu5yQ4wYMm6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CoNqvkBP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CoNqvkBP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C866AC4CEE5;
	Tue,  8 Apr 2025 18:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744138190;
	bh=JUCB2bV+iYGyCNwUBsapZGnABiFfj1VKYKVKsbGH/zg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CoNqvkBP3vFgDfJdX5HyBql73FohlJRuDNvRuQMGzKxFAB+caL0nqg429qqNKUjdi
	 sUIOtwxJQ4Cv4RXAtKYPfoslTCwqJ5gR0e3zEOlPOJdethtVBJwjg9tgm80VHZ4Al/
	 HZbgg+oWX2Na/wcsAvrLXMigNawQBde8SdI/fptF56V9IGK367akIkh+ReWJ2XOT+U
	 muCiP0HGwc6xz0I3feNwoVXK/CExOe7Wg8KMeAp4MkNAoGHokYq4hyHnL8Zbwzd9YB
	 86T5QoYppsM5bvL+pZwsNTKolNQy61fVP96xchN9BFu6aUuneHAuoouaW+SbI5kO5Y
	 8bCGM26EeJGUw==
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
Subject: Re: [PATCH v2 2/4] mm/madvise: batch tlb flushes for MADV_FREE
Date: Tue,  8 Apr 2025 11:49:47 -0700
Message-Id: <20250408184947.62625-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <12a8989c-c4f3-45a5-a66e-06ef7c2ef876@lucifer.local>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 8 Apr 2025 13:58:18 +0100 Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:

> On Fri, Apr 04, 2025 at 02:06:58PM -0700, SeongJae Park wrote:
> > MADV_FREE handling for [process_]madvise() flushes tlb for each vma of
> > each address range.  Update the logic to do tlb flushes in a batched
> > way.  Initialize an mmu_gather object from do_madvise() and
> > vector_madvise(), which are the entry level functions for
> > [process_]madvise(), respectively.  And pass those objects to the
> > function for per-vma work, via madvise_behavior struct.  Make the
> > per-vma logic not flushes tlb on their own but just saves the tlb
> > entries to the received mmu_gather object.  Finally, the entry level
> > functions flush the tlb entries that gathered for the entire user
> > request, at once.
> >
> > Signed-off-by: SeongJae Park <sj@kernel.org>
> 
> Other than some nitty stuff, and a desire for some careful testing of the
> horrid edge case that err... I introduced :P this looks fine, so:
> 
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Thank you for your kind review!  I will make the next revision following your
suggestions as I answered below.

> 
> > ---
> >  mm/madvise.c | 59 +++++++++++++++++++++++++++++++++++++++++-----------
> >  1 file changed, 47 insertions(+), 12 deletions(-)
> >
> > diff --git a/mm/madvise.c b/mm/madvise.c
> > index 8bcfdd995d18..564095e381b2 100644
> > --- a/mm/madvise.c
> > +++ b/mm/madvise.c
> > @@ -799,12 +799,13 @@ static const struct mm_walk_ops madvise_free_walk_ops = {
> >  	.walk_lock		= PGWALK_RDLOCK,
> >  };
> >
> > -static int madvise_free_single_vma(struct vm_area_struct *vma,
> > -			unsigned long start_addr, unsigned long end_addr)
> > +static int madvise_free_single_vma(
> > +		struct madvise_behavior *behavior, struct vm_area_struct *vma,
> 
> This is pedantic, but elsewhere you differentiate between int behavior and
> struct madvise_behavior by referringt to the later as madv_behavior.
> 
> The naming kind of sucks in general though.
> 
> But for consistency, let's maybe rename this to madv_behavior, and we can
> maybe do a commit later to do a rename across the board?

I completely agree.  I will rename so in the next spin.

> 
> > +		unsigned long start_addr, unsigned long end_addr)
> >  {
> >  	struct mm_struct *mm = vma->vm_mm;
> >  	struct mmu_notifier_range range;
> > -	struct mmu_gather tlb;
> > +	struct mmu_gather *tlb = behavior->tlb;
> >
> >  	/* MADV_FREE works for only anon vma at the moment */
> >  	if (!vma_is_anonymous(vma))
[...]
> > @@ -953,7 +951,7 @@ static long madvise_dontneed_free(struct vm_area_struct *vma,
> >  	if (action == MADV_DONTNEED || action == MADV_DONTNEED_LOCKED)
> >  		return madvise_dontneed_single_vma(vma, start, end);
> >  	else if (action == MADV_FREE)
> > -		return madvise_free_single_vma(vma, start, end);
> > +		return madvise_free_single_vma(behavior, vma, start, end);
> >  	else
> >  		return -EINVAL;
> 
> On error paths, do we correctly finish the batched (botched? :P) TLB
> operation?

Yes, the change calls tlb_finish_mmu() and tlb_gather_mmu() as needed in the
error paths.  Of course I might forgot calling those in some edge cases.
Please let me know if you find such mistakes.

> 
> >  }
[...]
> > @@ -1841,14 +1873,17 @@ static ssize_t vector_madvise(struct mm_struct *mm, struct iov_iter *iter,
> >  			}
> >
> >  			/* Drop and reacquire lock to unwind race. */
> > +			madvise_finish_tlb(&madv_behavior);
> >  			madvise_unlock(mm, behavior);
> >  			madvise_lock(mm, behavior);
> > +			madvise_init_tlb(&madv_behavior, mm);
> >  			continue;
> 
> Have you found a way in which to test this? Perhaps force this case and
> find a means of asserting the TLB flushing behaves as expected? I think
> we're ok from the logic, but it's such a tricky one it'd be good to find a
> means of doing so, albeit in a manual way.

No, unfortunately I haven't found a good way to test this case.

> 
> >  		}
> >  		if (ret < 0)
> >  			break;
> >  		iov_iter_advance(iter, iter_iov_len(iter));
> >  	}
> > +	madvise_finish_tlb(&madv_behavior);
> >  	madvise_unlock(mm, behavior);
> >
> >  	ret = (total_len - iov_iter_count(iter)) ? : ret;
> > --
> > 2.39.5


Thanks,
SJ
