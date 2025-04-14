Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5230413D531
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 16:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744647908; cv=none; b=RIHEixeWYtfydzl8LZLH6wxuaSmNNdF+pnJiJmqU7KzADaiPzvICU5UMV4WZpERH+LKEIUS4/+hMY9ZQXoBIj+Jap1NaLsXASW3xjRISH5o7PWLnMRKK7ezVDsJ880QW6Qk97zmvpgYPnZnXtdSI3jlnwvDJaRp26svlbDBIsdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744647908; c=relaxed/simple;
	bh=1UWhJ7dUMsXc7aOy1Cpk1vWzghBcYJn+Uiqsc1hIraI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GJh9ZWMOSPzMoN2iSBlX40Io2yvAW6EeomVHcDzsKe1WD9vIQsKZQmjiKZWGLw1m4+5yQGCU5SeStaUfJY+tyItEbKlHT/5sPtWU/kqqVHPZ4enmbVvPnWmeezxx5ivcQNi/8IJdp7E0DSnns4iQF+CBiFD9LAC8O4dxmQo47i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E2FEC4CEE2;
	Mon, 14 Apr 2025 16:25:05 +0000 (UTC)
Date: Mon, 14 Apr 2025 17:25:02 +0100
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
Subject: Re: [PATCH v3 04/11] arm64/mm: Refactor __set_ptes() and
 __ptep_get_and_clear()
Message-ID: <Z_023iswKD9NO3uH@arm.com>
References: <20250304150444.3788920-1-ryan.roberts@arm.com>
 <20250304150444.3788920-5-ryan.roberts@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304150444.3788920-5-ryan.roberts@arm.com>

On Tue, Mar 04, 2025 at 03:04:34PM +0000, Ryan Roberts wrote:
> +static inline void set_ptes_anysz(struct mm_struct *mm, pte_t *ptep, pte_t pte,
> +				  unsigned int nr, unsigned long pgsize)
>  {
> -	__sync_cache_and_tags(pte, nr);
> -	__check_safe_pte_update(mm, ptep, pte);
> -	__set_pte(ptep, pte);
> +	unsigned long stride = pgsize >> PAGE_SHIFT;
> +
> +	switch (pgsize) {
> +	case PAGE_SIZE:
> +		page_table_check_ptes_set(mm, ptep, pte, nr);
> +		break;
> +	case PMD_SIZE:
> +		page_table_check_pmds_set(mm, (pmd_t *)ptep, pte_pmd(pte), nr);
> +		break;
> +	case PUD_SIZE:
> +		page_table_check_puds_set(mm, (pud_t *)ptep, pte_pud(pte), nr);
> +		break;
> +	default:
> +		VM_WARN_ON(1);
> +	}
> +
> +	__sync_cache_and_tags(pte, nr * stride);
> +
> +	for (;;) {
> +		__check_safe_pte_update(mm, ptep, pte);
> +		__set_pte(ptep, pte);
> +		if (--nr == 0)
> +			break;
> +		ptep++;
> +		pte = pte_advance_pfn(pte, stride);
> +	}
>  }

I thought I replied to this one but somehow failed to send. The only
comment I have is that I'd add a double underscore in front of the anysz
functions to imply it's a private API. Otherwise it looks fine.

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
