Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8E5204598
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 20:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743713238; cv=none; b=K9McjVeqnpdj6bqmT0VWGauL3cf0mtYCIx9H7ofzrCSwlJaXWk4gXfDSiP0bcPqAO9LiiVE91KtOlan/dmiayDpTjkHYA0gPUAuPXR+KvN5E1b4jS0wGF9i99qACV1xkSreJvtRIpQUM5tMu39LL01HaaPUn2hRWoEJ+P93A5Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743713238; c=relaxed/simple;
	bh=W0XbDU2ClWwDgGLKcBLdaZLrDW9guPw9/6q6PamdSJs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kgEcZ/YEjTtADa6CrXPEOghth92pEC5q28qDoksltZm9m8LX7DUDsEe0gfhUBHlYlEaqUCrCNg4wcb/TNYx7M/bMzlg1v9z9pTZgv520NVyDRMuWMo1qvFozLVaR00IGaH4g4A75OUGh9C/AytPG3x0hDnzEX3tT+D7+FhwLb1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94C91C4CEE3;
	Thu,  3 Apr 2025 20:47:13 +0000 (UTC)
Date: Thu, 3 Apr 2025 21:47:10 +0100
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
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 02/11] arm64: hugetlb: Refine tlb maintenance scope
Message-ID: <Z-7zznsJ91ZCCTeS@arm.com>
References: <20250304150444.3788920-1-ryan.roberts@arm.com>
 <20250304150444.3788920-3-ryan.roberts@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304150444.3788920-3-ryan.roberts@arm.com>

On Tue, Mar 04, 2025 at 03:04:32PM +0000, Ryan Roberts wrote:
> When operating on contiguous blocks of ptes (or pmds) for some hugetlb
> sizes, we must honour break-before-make requirements and clear down the
> block to invalid state in the pgtable then invalidate the relevant tlb
> entries before making the pgtable entries valid again.
> 
> However, the tlb maintenance is currently always done assuming the worst
> case stride (PAGE_SIZE), last_level (false) and tlb_level
> (TLBI_TTL_UNKNOWN). We can do much better with the hinting; In reality,
> we know the stride from the huge_pte pgsize, we are always operating
> only on the last level, and we always know the tlb_level, again based on
> pgsize. So let's start providing these hints.
> 
> Additionally, avoid tlb maintenace in set_huge_pte_at().
> Break-before-make is only required if we are transitioning the
> contiguous pte block from valid -> valid. So let's elide the
> clear-and-flush ("break") if the pte range was previously invalid.
> 
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
