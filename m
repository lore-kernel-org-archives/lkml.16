Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9701D1A5B86
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 20:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743713210; cv=none; b=g0upZPVUrEboAaGcfWiRjKG/yAGYtByX2fOJbjK6MVWEl9j3stUO6WiucahRjXAxNNeCiW1lJHil/Pbd9Jf9dGx9GbHS6vYB6zo9mkbYPeYvxU+fp2xP1EN8iZeitOFU+zsZnTzLSBSc/hKtnieKoQsTttOCQgKGFlpqEhdD+n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743713210; c=relaxed/simple;
	bh=j8jLG1Fsrf1ghnBULyk0JUQHajd8Z8qlpFLLo/mP0RI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y0URBP82sHKhNizFFr6+hZFJQn9vVNgORQgp09NoFyT7vR4D5MOgN1SE6qAeFk3O3Wqz1+efyiVg70SpRP5ksDDgOr7rwNCUU5uPivhkFL1zMr4NFeGpUGZHpQDAYpD6m9SX3E7X3ChC0H6WQ8LNMPq8BkqKZ3x/V7+X8XV7Qhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D979BC4CEE3;
	Thu,  3 Apr 2025 20:46:46 +0000 (UTC)
Date: Thu, 3 Apr 2025 21:46:44 +0100
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
Subject: Re: [PATCH v3 06/11] arm64/mm: Hoist barriers out of
 set_ptes_anysz() loop
Message-ID: <Z-68yPBh1FbRvCoS@arm.com>
References: <20250304150444.3788920-1-ryan.roberts@arm.com>
 <20250304150444.3788920-7-ryan.roberts@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304150444.3788920-7-ryan.roberts@arm.com>

On Tue, Mar 04, 2025 at 03:04:36PM +0000, Ryan Roberts wrote:
> set_ptes_anysz() previously called __set_pte() for each PTE in the
> range, which would conditionally issue a DSB and ISB to make the new PTE
> value immediately visible to the table walker if the new PTE was valid
> and for kernel space.
> 
> We can do better than this; let's hoist those barriers out of the loop
> so that they are only issued once at the end of the loop. We then reduce
> the cost by the number of PTEs in the range.
> 
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>  arch/arm64/include/asm/pgtable.h | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index e255a36380dc..1898c3069c43 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -317,13 +317,11 @@ static inline void __set_pte_nosync(pte_t *ptep, pte_t pte)
>  	WRITE_ONCE(*ptep, pte);
>  }
>  
> -static inline void __set_pte(pte_t *ptep, pte_t pte)
> +static inline void __set_pte_complete(pte_t pte)
>  {
> -	__set_pte_nosync(ptep, pte);
> -
>  	/*
>  	 * Only if the new pte is valid and kernel, otherwise TLB maintenance
> -	 * or update_mmu_cache() have the necessary barriers.
> +	 * has the necessary barriers.

Thanks for removing the stale comment.

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
