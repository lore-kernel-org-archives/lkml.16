Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315FB274FCF
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 11:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747047624; cv=none; b=biSL8E6MUUwUnLmTfmGe17tu6m0RVYJKCZbrdRHz/X8z+qVfSE142JYwc94Ch7GJ/shkCSciuJbgRb34mHMxEFGeCAjgJrOquKf08oQ2axitLo5hTSfpa/QdhLZniVjsylF752VoRLWmykK/7Vbcv9rn4Bi1fGGETitgV/CiNV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747047624; c=relaxed/simple;
	bh=XVqqwyPF9bgz/4cVPTQUSgv6snCVuZUFIAbCZmX8LtA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NjqeH7Bk2gPTZzqYa3dOyQzW73cwcBA09iUcEpAcV+9nNTUt0ZNjy+3Wuvs7QHWjA/ldtwK1tR2vwXv18fgNLCP08LLx2wjlYP9FAXZcWtuKlvEw94m55l+GRco1ugp0odETU3nb7U4pJJi92JM00/qbmin0CMPiUbHvqWxM62U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B7EFC4CEEF;
	Mon, 12 May 2025 11:00:20 +0000 (UTC)
Date: Mon, 12 May 2025 12:00:17 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Will Deacon <will@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	David Hildenbrand <david@redhat.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	syzbot+5c0d9392e042f41d45c5@syzkaller.appspotmail.com
Subject: Re: [PATCH] arm64/mm: Disable barrier batching in interrupt contexts
Message-ID: <aCHUwZzeI6sEbg2T@arm.com>
References: <20250512102242.4156463-1-ryan.roberts@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512102242.4156463-1-ryan.roberts@arm.com>

On Mon, May 12, 2025 at 11:22:40AM +0100, Ryan Roberts wrote:
> Commit 5fdd05efa1cd ("arm64/mm: Batch barriers when updating kernel
> mappings") enabled arm64 kernels to track "lazy mmu mode" using TIF
> flags in order to defer barriers until exiting the mode. At the same
> time, it added warnings to check that pte manipulations were never
> performed in interrupt context, because the tracking implementation
> could not deal with nesting.
> 
> But it turns out that some debug features (e.g. KFENCE, DEBUG_PAGEALLOC)
> do manipulate ptes in softirq context, which triggered the warnings.
> 
> So let's take the simplest and safest route and disable the batching
> optimization in interrupt contexts. This makes these users no worse off
> than prior to the optimization. Additionally the known offenders are
> debug features that only manipulate a single PTE, so there is no
> performance gain anyway.
> 
> There may be some obscure case of encrypted/decrypted DMA with the
> dma_free_coherent called from an interrupt context, but again, this is
> no worse off than prior to the commit.
> 
> Some options for supporting nesting were considered, but there is a
> difficult to solve problem if any code manipulates ptes within interrupt
> context but *outside of* a lazy mmu region. If this case exists, the
> code would expect the updates to be immediate, but because the task
> context may have already been in lazy mmu mode, the updates would be
> deferred, which could cause incorrect behaviour. This problem is avoided
> by always ensuring updates within interrupt context are immediate.
> 
> Fixes: 5fdd05efa1cd ("arm64/mm: Batch barriers when updating kernel mappings")
> Reported-by: syzbot+5c0d9392e042f41d45c5@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/linux-arm-kernel/681f2a09.050a0220.f2294.0006.GAE@google.com/
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>

As per the request in the original report, please also add:

Reported-by: syzbot+5c0d9392e042f41d45c5@syzkaller.appspotmail.com

I'll give it a try as well with my configurations and let you know if
there are any problems. In the meantime:

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
