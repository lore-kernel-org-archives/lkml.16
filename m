Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C5B212B04
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 02:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738724150; cv=none; b=NEgxTqs32/9ijY0NldSvGNBXF+unXFpihx2Tb6wImYWhAqcg1jdpoyJqyMtxD4vMpkRwfsuILHetvJ/6rJWjixXpLlq5WonWifTtaNo4nlrKnYaEM2p0iIC+fj31oRUJOj4q0OfurLPow6OTt9yPyMI99UunpVxbIZE2rPHGcLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738724150; c=relaxed/simple;
	bh=Iy98cYZmlM0zfKAVbhzprR+xN12zDSTDaNyVInZr9pA=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=gw+5LsSoge0TiH8Qbb5CASPl/nICKYyx14BmfC7f77eK4pJ1SC5uZF7f7ZZyILsv0ZPBDOVs/0stwYAuvyRv56W7NVcUR5zmEaXrTmwcgiS5M06BPL3W/UEKfquZQSYulicBwJos77HpS5vPWZoQsdyDfyyz6kGRnk7RM9WzdaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=zp2t+0QT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="zp2t+0QT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A18A8C4CEDF;
	Wed,  5 Feb 2025 02:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1738724149;
	bh=Iy98cYZmlM0zfKAVbhzprR+xN12zDSTDaNyVInZr9pA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=zp2t+0QT8fNkRMUZvjHBFUUNdBviJZg+np/oXvDgPQB2Id6m6syhV6Frr1GroNoJ4
	 uoGcXvZooe6z2E8NBDcwL48m5lS3DlFhfRPcrIsU3bhN+0XKfX3CI8s755s77aVDIC
	 j5qhOGfvc7gwTaoMXV96zWvGvu0CB42PLVCNzKgo=
Date: Tue, 4 Feb 2025 18:55:48 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: David Hildenbrand <david@redhat.com>
Cc: Barry Song <21cnbao@gmail.com>, linux-mm@kvack.org,
 baolin.wang@linux.alibaba.com, chrisl@kernel.org, ioworker0@gmail.com,
 kasong@tencent.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, v-songbaohua@oppo.com,
 x86@kernel.org, ying.huang@intel.com, zhengtangquan@oppo.com
Subject: Re: [PATCH v3 3/4] mm: Support batched unmap for lazyfree large
 folios during reclamation
Message-Id: <20250204185548.75d95ac35aacccbc3982e935@linux-foundation.org>
In-Reply-To: <0785a15e-29fb-4801-9743-3d08e381d506@redhat.com>
References: <20250115033808.40641-1-21cnbao@gmail.com>
	<20250115033808.40641-4-21cnbao@gmail.com>
	<0785a15e-29fb-4801-9743-3d08e381d506@redhat.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 4 Feb 2025 12:38:31 +0100 David Hildenbrand <david@redhat.com> wrote:

> Hi,
> 
> >   	unsigned long hsz = 0;
> >   
> > @@ -1780,6 +1800,16 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
> >   				hugetlb_vma_unlock_write(vma);
> >   			}
> >   			pteval = huge_ptep_clear_flush(vma, address, pvmw.pte);
> > +		} else if (folio_test_large(folio) && !(flags & TTU_HWPOISON) &&
> > +				can_batch_unmap_folio_ptes(address, folio, pvmw.pte)) {
> > +			nr_pages = folio_nr_pages(folio);
> > +			flush_cache_range(vma, range.start, range.end);
> > +			pteval = get_and_clear_full_ptes(mm, address, pvmw.pte, nr_pages, 0);
> > +			if (should_defer_flush(mm, flags))
> > +				set_tlb_ubc_flush_pending(mm, pteval, address,
> > +					address + folio_size(folio));
> > +			else
> > +				flush_tlb_range(vma, range.start, range.end);
> >   		} else {
> 
> I have some fixes [1] that will collide with this series. I'm currently 
> preparing a v2, and am not 100% sure when the fixes will get queued+merged.
> 
> I'll base them against mm-stable for now, and send them out based on 
> that, to avoid the conflicts here (should all be fairly easy to resolve 
> from a quick glimpse).
> 
> So we might have to refresh this series here if the fixes go in first.
> 
> [1] https://lkml.kernel.org/r/20250129115411.2077152-1-david@redhat.com

It doesn't look like "mm: fixes for device-exclusive entries (hmm)"
will be backportable(?) but yes, we should aim to stage your fixes
against mainline and ahead of other changes to at least make life
easier for anyone who chooses to backport your fixes into an earlier
kernel.

