Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3199204683
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 20:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743713255; cv=none; b=KmMbU2bd5uoySvAlUjYboS+uJFKTDhO+F2BV9MfM29UFCgZa0H2DPwT67iXzc1gD7M9/T9ToaIJo2ULwdlns2OOsJqR3Snd0loJOxZNVeteZbz6BpfVEAgjd5hdvkMeDp+Qvb5H5r/hZ8s3f4wEM/KPhCFDrduC3MGv6JrylF4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743713255; c=relaxed/simple;
	bh=Ie0PmPpy1vuBO9+b5GNtSA5V6mtQSL8iiRSdXYJZ2Kg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qA15w9KO4HuFj7kNl2u7zXwHyl4ykqYYUzJy1kxvO6jHwCRGxsoxp4LSRu0+k8wxcf6bwkc+2tO1rp/7Kfdb1cdQRhW5Dahhyy9Gs80UFp1Pp9WrLDfs3h6QiuRWz6Rfil001I/5REsBu86IDRQhHtnTanPl6eo+cB2egkD7bmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CFFAC4CEE3;
	Thu,  3 Apr 2025 20:47:31 +0000 (UTC)
Date: Thu, 3 Apr 2025 21:47:29 +0100
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
Subject: Re: [PATCH v3 05/11] arm64: hugetlb: Use set_ptes_anysz() and
 ptep_get_and_clear_anysz()
Message-ID: <Z-7z4ZFGIZCrNq6h@arm.com>
References: <20250304150444.3788920-1-ryan.roberts@arm.com>
 <20250304150444.3788920-6-ryan.roberts@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304150444.3788920-6-ryan.roberts@arm.com>

On Tue, Mar 04, 2025 at 03:04:35PM +0000, Ryan Roberts wrote:
> Refactor the huge_pte helpers to use the new common set_ptes_anysz() and
> ptep_get_and_clear_anysz() APIs.

Nitpick: maybe add underscores to this new API to suggest it's private.
Up to you.

> This provides 2 benefits; First, when page_table_check=on, hugetlb is
> now properly/fully checked. Previously only the first page of a hugetlb
> folio was checked. Second, instead of having to call __set_ptes(nr=1)
> for each pte in a loop, the whole contiguous batch can now be set in one
> go, which enables some efficiencies and cleans up the code.
> 
> One detail to note is that huge_ptep_clear_flush() was previously
> calling ptep_clear_flush() for a non-contiguous pte (i.e. a pud or pmd
> block mapping). This has a couple of disadvantages; first
> ptep_clear_flush() calls ptep_get_and_clear() which transparently
> handles contpte. Given we only call for non-contiguous ptes, it would be
> safe, but a waste of effort. It's preferable to go straight to the layer
> below. However, more problematic is that ptep_get_and_clear() is for
> PAGE_SIZE entries so it calls page_table_check_pte_clear() and would not
> clear the whole hugetlb folio. So let's stop special-casing the non-cont
> case and just rely on get_clear_contig_flush() to do the right thing for
> non-cont entries.
> 
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
