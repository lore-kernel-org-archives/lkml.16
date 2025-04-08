Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0F2218AD2
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 20:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744143392; cv=none; b=OW7+A6i4CBqLmGsNC0LEGacSMRzioQjWI3UO8pF4md3WiU0qbzbp0bDYUrYX1HgATaEO0NQPC/5QrkDW7u43szRhOabEDBcuK1ZrlD/4qEpyuzJIJc7ZJcndPhEIL2rndFoeDCMK7G2xI36FgqKW7AOGnetVvcn+s0QivpU1P9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744143392; c=relaxed/simple;
	bh=4F2PLkKE9ucfJzfR1uPhQJZXYEmbnlCLXGg63cq/2tA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=q7+eiTZMErrNTr+v4Ov5d0GuQWmdKOPhelCIeidNDG3AerxfnDuAMjIYm7nRNgduLYvWudFYRSXzwA6TnPszU64Sij78ItC1W8GlA4lFW5Qazk03/G0UdYnxD5v4x4nzNdVGXl+ZLFnnEG709KSxyoT9i4uC8Y2nD60ZmnCdSIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iUpHJJkE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iUpHJJkE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE0A2C4CEE5;
	Tue,  8 Apr 2025 20:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744143392;
	bh=4F2PLkKE9ucfJzfR1uPhQJZXYEmbnlCLXGg63cq/2tA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iUpHJJkE/qPceoctndxDxWssPXnJD5r73Fo04+/EvTfBsFwxBqUPenxe5nxkMrVjP
	 MdOc4kZyh2H90xFnHDVwcoJespJIrka136ECo11Rx7ZANq5u4jlGj/OPKK8tgJNqh5
	 04vpMZtPtSqMUzoqklq/23qPaftB3RCXI2wsKPglKi+D9OiCSoNZm2q240WwX18L0E
	 gdkI/x5tV0+fVgp6d6wbB0Xdc2Q2uC2O/0gr241UGvfJqpTc+Z2wp1qMOQa7nsrv7j
	 y3PVeyiZuuonqj60K7q7v3H3EsDg+JOpykv5t2j4UzY49vI+6B3TUiIa6jB1aSyD6D
	 jYhowzAbfH6sg==
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
Subject: Re: [PATCH v2 4/4] mm/madvise: batch tlb flushes for MADV_DONTNEED[_LOCKED]
Date: Tue,  8 Apr 2025 13:16:29 -0700
Message-Id: <20250408201629.63324-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <fd26ba1e-9730-4288-a03b-ad07b6fe9ca5@lucifer.local>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 8 Apr 2025 14:36:18 +0100 Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:

> On Fri, Apr 04, 2025 at 02:07:00PM -0700, SeongJae Park wrote:
> > Batch tlb flushes for MADV_DONTNEED[_LOCKED] for better efficiency, in a
> > way that very similar to the tlb flushes batching for MADV_FREE.
> 
> This seems like a rather succinct commit message under the circumstances :) can
> we put some meat on the bone?
> 
> Perhaps explain why one might want to do so, propagating some of your excellent
> cover letter contents here, etc.
> 
> Also you're doing more than this, you're also exporting the (soon to be renamed,
> ideally :) notify_unmap_single_vma() function, let's mention this here please,
> and also mention why.

Good points, thank you.  I will update the commit message in the next spin
following your suggestions.

> 
> >
> > Signed-off-by: SeongJae Park <sj@kernel.org>
> > ---
> >  mm/internal.h | 3 +++
> >  mm/madvise.c  | 9 ++++++---
> >  mm/memory.c   | 4 ++--
> >  3 files changed, 11 insertions(+), 5 deletions(-)
> >
> > diff --git a/mm/internal.h b/mm/internal.h
> > index e9695baa5922..be0c46837e22 100644
> > --- a/mm/internal.h
> > +++ b/mm/internal.h
> > @@ -435,6 +435,9 @@ void unmap_page_range(struct mmu_gather *tlb,
> >  			     struct vm_area_struct *vma,
> >  			     unsigned long addr, unsigned long end,
> >  			     struct zap_details *details);
> > +void notify_unmap_single_vma(struct mmu_gather *tlb,
> > +		struct vm_area_struct *vma, unsigned long addr,
> > +		unsigned long size, struct zap_details *details);
> 
> Yeah I know I said in 3/4 but I really hate this name. We need to change it... :)

Yes, I will change the name in the next revision.

> 
> >  int folio_unmap_invalidate(struct address_space *mapping, struct folio *folio,
> >  			   gfp_t gfp);
> >
> > diff --git a/mm/madvise.c b/mm/madvise.c
> > index 564095e381b2..c7ac32b4a371 100644
> > --- a/mm/madvise.c
> > +++ b/mm/madvise.c
> > @@ -851,7 +851,8 @@ static int madvise_free_single_vma(
> >   * An interface that causes the system to free clean pages and flush
> >   * dirty pages is already available as msync(MS_INVALIDATE).
> >   */
> > -static long madvise_dontneed_single_vma(struct vm_area_struct *vma,
> > +static long madvise_dontneed_single_vma(struct madvise_behavior *behavior,
> 
> Again, let's go with madv_behavior for now please. Otherwise we have a weird
> inconsistency that sometimes behavior = the int 'behavior' value and sometimes
> it's a pointer to the helper struct.

Ye, I will do so.

> 
> > +					struct vm_area_struct *vma,
> >  					unsigned long start, unsigned long end)
> >  {
> >  	struct zap_details details = {


Thanks,
SJ

[...]
