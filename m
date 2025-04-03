Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1442C19E806
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 20:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743713194; cv=none; b=IK7YK0C70vX5O1YuGYzFTubok/6FSxSJLegTs+g+2X7VkVrdULkRFDzd3Yd27GsBPFotaITOOZAnDykx7GJTkXFzrXCY+NZmr8EtndkkpUvWOLFbEUVxkOGHd1VGsk6FWnmcM2dYsBDbd0ES6SolHuu6cMusPUAjoF0LhJNTzgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743713194; c=relaxed/simple;
	bh=pQI2Sx6hjzfs7N++F3llg3rmxqFtMvl/NyjMvkx2tOM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n1n32XPraSR/fuF/kXAQq/tWmsxB96aab2uKJ/D3x4Y4+emMdwm2FDETawdicbTEaB0C8ryjXOla9FtpWbqNqTs4OOQcfdlg+t2Yj1x2eYrqhemIVTrvXWQUQ1TY1cQSor3ud5Mep7m+LHCGe6QAjWJVxnBOwYBVvD/tWH2JweE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43CF8C4CEE3;
	Thu,  3 Apr 2025 20:46:30 +0000 (UTC)
Date: Thu, 3 Apr 2025 21:46:27 +0100
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
Subject: Re: [PATCH v3 03/11] mm/page_table_check: Batch-check pmds/puds just
 like ptes
Message-ID: <Z-7zo5ahsqLaKxUX@arm.com>
References: <20250304150444.3788920-1-ryan.roberts@arm.com>
 <20250304150444.3788920-4-ryan.roberts@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304150444.3788920-4-ryan.roberts@arm.com>

On Tue, Mar 04, 2025 at 03:04:33PM +0000, Ryan Roberts wrote:
> Convert page_table_check_p[mu]d_set(...) to
> page_table_check_p[mu]ds_set(..., nr) to allow checking a contiguous set
> of pmds/puds in single batch. We retain page_table_check_p[mu]d_set(...)
> as macros that call new batch functions with nr=1 for compatibility.
> 
> arm64 is about to reorganise its pte/pmd/pud helpers to reuse more code
> and to allow the implementation for huge_pte to more efficiently set
> ptes/pmds/puds in batches. We need these batch-helpers to make the
> refactoring possible.
> 
> Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
