Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB74185B5F
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 08:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738916221; cv=none; b=oACJtP+M7nTSoxseHFClYvR9lRoIAeCL1E16R8NgJG8oKjayF9w80+O+ep+oOVKHIYciAWG0W0kM/23ESSSJHrQTnY5/vsYqZNKjZqkA/AfWGiIQLgZDl99MpZm3ZNZ66sBFtYna3+rnENFxdPE455Ac0Sp1xQsmPyJ131O7NLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738916221; c=relaxed/simple;
	bh=Wj2OOlurxLD/htwnOz6jV69BQoedwPFNGdhKIomMjAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hoy21PjakagdVs7TGkgTRXfI+vVwSicL3+KWz7EzMzSKdXipX6nQm/Rv83KlLN4c0dJbjk6BrM9m05x6v1SB8wezgzrbq1cwarEmk/RGHqV8WgWxUyqoLtrPfcG+5WjBSkHpuGY3mal6DI3mYkfFYB2/uaOS/Y3z9wmbSh1mu5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=CPGVyHXF; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="CPGVyHXF"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=foxAZjV1fKwrEZXq170Tq1V8b1qGbRmWOlXA6u7EiWI=; b=CPGVyHXFKryA1L51KxIYBJS4QI
	nbPpyCKgZSlD0oZSHw1Bd2pr89gY5YVjWA05yutvPZr+7WkmzElcmvqd7Qv6FANH5Xvf/Xbg1Ss7K
	ttfgOrCiDv4QJNr0E/ZlkcIMNYijk6G4+yV3klVd8xyv41KBu7yu0J7H8TPPuJtjh3CNgSCVpOY4E
	W7o61wCWQMQXttKhkmxT8VKFYskoBjEll/4tlE/g7pQ1qm9mE3H6RX67LKW6PoNw0K8+UUx/rFvYe
	dH5C/z9n/XYBAxjLi8IE/IfD5nQ88c4xASI0uHjYAHUTFVnYJ4s01E8ERIJh2L6tj1wxQnfG5phTv
	xHDfmNhg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tgJXK-0000000H8Os-3MKS;
	Fri, 07 Feb 2025 08:16:31 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id CC214300310; Fri,  7 Feb 2025 09:16:29 +0100 (CET)
Date: Fri, 7 Feb 2025 09:16:29 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Rik van Riel <riel@surriel.com>
Cc: Oleksandr Natalenko <oleksandr@natalenko.name>, x86@kernel.org,
	linux-kernel@vger.kernel.org, bp@alien8.de,
	dave.hansen@linux.intel.com, zhengqi.arch@bytedance.com,
	nadav.amit@gmail.com, thomas.lendacky@amd.com, kernel-team@meta.com,
	linux-mm@kvack.org, akpm@linux-foundation.org, jannh@google.com,
	mhklinux@outlook.com, andrew.cooper3@citrix.com
Subject: Re: [PATCH v9 00/12] AMD broadcast TLB invalidation
Message-ID: <20250207081629.GT7145@noisy.programming.kicks-ass.net>
References: <20250206044346.3810242-1-riel@surriel.com>
 <12602226.O9o76ZdvQC@natalenko.name>
 <8111558b52cec1152746b05a9c1d657d18df0fe2.camel@surriel.com>
 <20250206142308.GR7145@noisy.programming.kicks-ass.net>
 <ad7bc8809b8501e157a6e6da3a5b5863ca56c995.camel@surriel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad7bc8809b8501e157a6e6da3a5b5863ca56c995.camel@surriel.com>

On Thu, Feb 06, 2025 at 09:48:25AM -0500, Rik van Riel wrote:
> On Thu, 2025-02-06 at 15:23 +0100, Peter Zijlstra wrote:
> > On Thu, Feb 06, 2025 at 09:16:35AM -0500, Rik van Riel wrote:
> > 
> > > This can result in flush_tlb_mm_range being called
> > > with a stride_shift for 2MB pages, but a range ending
> > > on a 4kB aligned (not 2MB aligned) boundary.
> > > 
> > > Peter, how should we solve this one?
> > 
> > I don't think that's wrong per-se, since all we really need is for
> > end
> > to be past the end, one byte, one page, or one stride don't matter
> > much.
> > 
> > Anyway, I'm in desperate need of a break, so I'm not quite sure what
> > the
> > best way forward is.
> > 
> Given that the tlb_flush() code is used only for
> page table freeing, 

mmu_gather is used for both page and page-table freeing.

> we can just round up the
> end address to the nearest stride boundary
> there, with a comment explaining why?

Well, why are we rounding at all? I don't think I've seen an explanation
for that anywhere yet.

What made you do this?

> Alternatively, we could just change the page
> sizes used in pmd_free_tlb, pud_free_tlb,
> and p4d_free_tlb, given that the functions
> called now have parameters they didn't seem
> to have back in 2014, when the linked email
> in the comment was written?

Well, it really shouldn't matter.

Notably, stride is simply the smallest size encountered during the
gather; not something that can be determined a priory.

Like I said, end is exclusive, so it doesn't really matter how much
further it is, and PAGE_SIZE is a natural enough step, seeing it is the
smallest granularity.

So start and end not being page aligned is a definite fail.
And start should be stride aligned.

But other than that, I don't see it matters much.
