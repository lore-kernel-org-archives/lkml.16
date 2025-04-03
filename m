Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E43C19E806
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 20:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743713181; cv=none; b=IFOYMuSz6j7n/yjsHXa3vTKimPW3Rbhuk20jRHssgpos3Enx6OUxBcRPwvhnPqxSAMD1WGfZ7GP0y5Ti0fxleKXsIt864XlVY4qvTv/vLKNHOq1IxPQ91vjEMyPff+HeEBKUO+r1FpbXGQF5veT3DdpbfURnVgzZUEanT5DoYvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743713181; c=relaxed/simple;
	bh=Szc8VnwQoP4VqpeVJiUuu+aMgDMRlaq2GQXDBHTkSfE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a71G31ZluKAEuAo5imBF87xAjCiQ/RkkLflCDUSnVEkCPlbvVqZ0F/2IYrYqczXVNVrLByNsrg7pGOsHpRtx1L0lbnwxI4CprazON5b19/1XOXc/V2qTX4VIgjBR1DFY9LV3U2xa3OkFl1rmaHwnpUElzpFv6AF/+9DA0d43CJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A795EC4CEE3;
	Thu,  3 Apr 2025 20:46:16 +0000 (UTC)
Date: Thu, 3 Apr 2025 21:46:13 +0100
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
Subject: Re: [PATCH v3 01/11] arm64: hugetlb: Cleanup huge_pte size discovery
 mechanisms
Message-ID: <Z-7zlcVCrsw4SkwX@arm.com>
References: <20250304150444.3788920-1-ryan.roberts@arm.com>
 <20250304150444.3788920-2-ryan.roberts@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304150444.3788920-2-ryan.roberts@arm.com>

On Tue, Mar 04, 2025 at 03:04:31PM +0000, Ryan Roberts wrote:
> Not all huge_pte helper APIs explicitly provide the size of the
> huge_pte. So the helpers have to depend on various methods to determine
> the size of the huge_pte. Some of these methods are dubious.
> 
> Let's clean up the code to use preferred methods and retire the dubious
> ones. The options in order of preference:
> 
>  - If size is provided as parameter, use it together with
>    num_contig_ptes(). This is explicit and works for both present and
>    non-present ptes.
> 
>  - If vma is provided as a parameter, retrieve size via
>    huge_page_size(hstate_vma(vma)) and use it together with
>    num_contig_ptes(). This is explicit and works for both present and
>    non-present ptes.
> 
>  - If the pte is present and contiguous, use find_num_contig() to walk
>    the pgtable to find the level and infer the number of ptes from
>    level. Only works for *present* ptes.
> 
>  - If the pte is present and not contiguous and you can infer from this
>    that only 1 pte needs to be operated on. This is ok if you don't care
>    about the absolute size, and just want to know the number of ptes.
> 
>  - NEVER rely on resolving the PFN of a present pte to a folio and
>    getting the folio's size. This is fragile at best, because there is
>    nothing to stop the core-mm from allocating a folio twice as big as
>    the huge_pte then mapping it across 2 consecutive huge_ptes. Or just
>    partially mapping it.
> 
> Where we require that the pte is present, add warnings if not-present.
> 
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
