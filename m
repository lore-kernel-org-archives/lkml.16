Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A01629DB9A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 15:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749741666; cv=none; b=jRSGvcVP8nEOW6uB9dqha5C5qMJSjxWX2gzoXZYcDcWRhAL5urLSfcP7XZOFqBeoKVwMB/sdiTAr8vWRk28FaYFyrz1CAsak2zCrdj/bh8oHxbti+FpVwSRcmsvhs5uMn5PcZdn/P0gyfUeaFf4boollh4r9qpK6ixv38os4OMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749741666; c=relaxed/simple;
	bh=wshbG/vQ6UX9QKzvPFllw/wGW4HRGOaCAzXepA4wqWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FA9BWYLVmt2jVTPQzUdzF0DJAnwfu6bF5CqDJP3Xjdm9g1mW6K/sawsTo5tnRLWQ8rPgAhlx2+2opmZ7emTD1QSAB/sAgMCiSd3G6pxXpV1mcByI09VAupxDDQATkis4ITblKnFz2wIG9jmh3XdrNmVIxVScmH/jUzP7qJQE3Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XaiYzB2A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XaiYzB2A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89ACBC4CEEA;
	Thu, 12 Jun 2025 15:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749741666;
	bh=wshbG/vQ6UX9QKzvPFllw/wGW4HRGOaCAzXepA4wqWI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XaiYzB2Af7RXh0Twpx+T1OBL4I2ke8snzfvGviZYp+JvsI80bLXqv1VwQ7/bZvCAB
	 jizLTAUq6IHMdMIAuO0x67PXluwMf2ftZJNMOparAc6c+UshciGzVnPEpDNw/sVwkR
	 ZPBrUrcdppmPGKgeJQHc9UkW8StOvC7G/0cn8iK+2eVUWiLznnW74BA+2oAQ89O/Gy
	 2W0appmJNEt1/IrH8cz1kMuoc9pMa4Dl/JJPtYNlNMUDF4IZ+ek/ZgGGrjwzsj6Vzi
	 ROXQfNq1C0bDEhqoDOPCn6t75lY9Th9OUowpOVsmqGOVfe00p/d12aL3fiTFh/yqgA
	 fIK6za3tIWq5A==
Date: Thu, 12 Jun 2025 16:20:59 +0100
From: Will Deacon <will@kernel.org>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Rik van Riel <riel@surriel.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Harry Yoo <harry.yoo@oracle.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-mm@kvack.org
Subject: Re: [PATCH v1] mm: Remove arch_flush_tlb_batched_pending() arch
 helper
Message-ID: <20250612152058.GE12912@willie-the-truck>
References: <20250609103132.447370-1-ryan.roberts@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609103132.447370-1-ryan.roberts@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Mon, Jun 09, 2025 at 11:31:30AM +0100, Ryan Roberts wrote:
> Since commit 4b634918384c ("arm64/mm: Close theoretical race where stale
> TLB entry remains valid"), all arches that use tlbbatch for reclaim
> (arm64, riscv, x86) implement arch_flush_tlb_batched_pending() with a
> flush_tlb_mm().
> 
> So let's simplify by removing the unnecessary abstraction and doing the
> flush_tlb_mm() directly in flush_tlb_batched_pending(). This effectively
> reverts commit db6c1f6f236d ("mm/tlbbatch: introduce
> arch_flush_tlb_batched_pending()").
> 
> Suggested-by: Will Deacon <will@kernel.org>
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>  arch/arm64/include/asm/tlbflush.h | 11 -----------
>  arch/riscv/include/asm/tlbflush.h |  1 -
>  arch/riscv/mm/tlbflush.c          |  5 -----
>  arch/x86/include/asm/tlbflush.h   |  5 -----
>  mm/rmap.c                         |  2 +-
>  5 files changed, 1 insertion(+), 23 deletions(-)

Thank you, Ryan!

Acked-by: Will Deacon <will@kernel.org>

I assume this will go via akpm rather than the arch tree?

Will
