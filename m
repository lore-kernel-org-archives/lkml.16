Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E941E204683
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 20:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743713270; cv=none; b=QCT+IbRhT4VMruZo6qzZDEJiBpe8Ee3vjQW7VzxdxwgsRTLJgx2BYMgExD8qHepdJtcJi2nDD8tzXAz1VAEXroecw/Y/wiGm5c8P5nhVTHfQrLiofNOlBakOv9pL8NvArk4B+/Z5GKIfgYpcVKHzK3mynQwlz8NCg0Mq4bKDHKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743713270; c=relaxed/simple;
	bh=N+MgUSz8CuODs/2Lre/zDuoLNuL9qHCYfGQQ48zRhX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=swMpYqVoBJcLDpSak/gMc/4MoG04D4tLVBqWcggBDo8Hc1jSbSJ2TULXmydOTdlsy1uMviyadxiXp+VTsmpE4mPt0RN2XBtYA2TaP+7ds2wNMQqSz/uM9tZUiKMox0Z2KJ3cKkbvkprJuCUVbRYD8WELZN+40Vsv8IAofu/+YvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55CD7C4CEE3;
	Thu,  3 Apr 2025 20:47:47 +0000 (UTC)
Date: Thu, 3 Apr 2025 21:47:44 +0100
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
Subject: Re: [PATCH v3 10/11] mm/vmalloc: Enter lazy mmu mode while
 manipulating vmalloc ptes
Message-ID: <Z-7z8MXWJDz3kx2j@arm.com>
References: <20250304150444.3788920-1-ryan.roberts@arm.com>
 <20250304150444.3788920-11-ryan.roberts@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304150444.3788920-11-ryan.roberts@arm.com>

On Tue, Mar 04, 2025 at 03:04:40PM +0000, Ryan Roberts wrote:
> Wrap vmalloc's pte table manipulation loops with
> arch_enter_lazy_mmu_mode() / arch_leave_lazy_mmu_mode(). This provides
> the arch code with the opportunity to optimize the pte manipulations.
> 
> Note that vmap_pfn() already uses lazy mmu mode since it delegates to
> apply_to_page_range() which enters lazy mmu mode for both user and
> kernel mappings.
> 
> These hooks will shortly be used by arm64 to improve vmalloc
> performance.
> 
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
