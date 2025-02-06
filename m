Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ADF322540F
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 08:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738829469; cv=none; b=X5x6mKpPVuusdxxSDIIKBWTzXSU/numBKRk43BEiudeRUdxDzNNJH6n6I9XZggxMNXshYdM7Wrh0dwkq5MIlXOGKZCQDtztZGTpGbnbeMCq9VTT46CyEWr3/JtHJe1QoJVGJHA1JiSL42nq6nt7yCPuCIXgrVEROxierqt/E0NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738829469; c=relaxed/simple;
	bh=23PLg7x3f9I4D0qFtrueAQuE42z5YYE8S+g4ogZgPpg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kE1n3UETszbLtbGgTWPIwDlVbzFkravgGiz0SileyPYVFUPNUmCZF72Aks7p/i24PU3GRsJF+1mL16KEG87nN03hfgAFD+CZs0EK00yBJPvW1n/uYgB7ihwnQYpZju26QR1sYn/aEZflOMgTZ2lsTCG1GmypXtZG+r+ngRwxVF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=vi/3cQck; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="vi/3cQck"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=eGOJC9Bw4SE9JPvsgsAz/j9HV0PyIllmTizVCsdmwTk=; b=vi/3cQckQ36qv4d2B7SNA4SYp/
	jhFUA0yCMaw+kREEk5mBiGcthGa+18H0UxRtDqwm0miviUxLg6ntswfI1Car5LsApil5qGWqhgL8c
	4ofNLDtS00gi1IaVBqiZ0PpiksvV0zU5ypJOnHiVkA0Jqww3wHzNUHm0youAtFqsov50MQAKgtrOq
	Mb6lt/0JYSmPPIqOVLlV7hySabU+JpbuXL2u+3HoLVmZ0pyX+P0lJZwHNOvnyk5sXR/4oDkQUQZNb
	8407hzVSoRVbiB8Grdem3zzvxaBWH9bQ/6wC/wl24iwjB1Qj+agyyA9cAMqphnXYUBYudgbY/0kwO
	38YO4mng==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tfwyR-00000005gCB-0Efs;
	Thu, 06 Feb 2025 08:10:59 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 77B3E30031C; Thu,  6 Feb 2025 09:10:58 +0100 (CET)
Date: Thu, 6 Feb 2025 09:10:58 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Balbir Singh <balbirs@nvidia.com>, Kees Cook <keescook@chromium.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, apopple@nvidia.com,
	jgg@nvidia.com, jhubbard@nvidia.com,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH] x86/kaslr: Revisit entropy when CONFIG_PCI_P2PDMA is
 enabled
Message-ID: <20250206081058.GH7145@noisy.programming.kicks-ass.net>
References: <20250206023201.1481957-1-balbirs@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206023201.1481957-1-balbirs@nvidia.com>

On Thu, Feb 06, 2025 at 01:32:01PM +1100, Balbir Singh wrote:
> When CONFIG_PCI_P2PDMA is enabled, it maps the PFN's via a
> ZONE_DEVICE mapping using devm_memremap_pages(). The mapped
> virtual address range corresponds to the pci_resource_start()
> of the BAR address and size corresponding to the BAR length.
> 
> When KASLR is enabled, the direct map range of the kernel is
> reduced to the size of physical memory plus additional padding.
> If the BAR address is beyond this limit, PCI peer to peer DMA
> mappings fail.
> 
> Fix this by not shrinking the size of direct map when CONFIG_PCI_P2PDMA
> is enabled. This reduces the total available entropy, but it's
> better than the current work around of having to disable KASLR
> completely.

I'm thinking this CONFIG is going to be on by default for pretty much
all distro kernels? As such, does it make sense to have this depend on
this config symbol?

Also +Kees

> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: Andy Lutomirski <luto@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Link: https://lore.kernel.org/all/1462225276-106993-1-git-send-email-thgarnie@google.com/
> 
> 
> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
> ---
> 
> Testing:
> 
>   commit 0483e1fa6e09d ("x86/mm: Implement ASLR for kernel memory regions") mentions the
>   problems that the following problems need to be addressed.
> 
>   1 The three target memory sections are never at the same place between
>     boots.
>   2 The physical memory mapping can use a virtual address not aligned on
>     the PGD page table.
>   3 Have good entropy early at boot before get_random_bytes is available.
>   4 Add optional padding for memory hotplug compatibility.
> 
>   Ran an automated test to ensure that (1) holds true across several
>   iterations of automated reboot testing. 2, 3 and 4 are not impacted
>   by this patch.
> 
>   Manual Testing on a system where the problem reproduces
>   
>   1. With KASLR
> 
>      Hotplug memory [0x240000000000-0x242000000000] exceeds maximum addressable range [0x0-0xaffffffffff]
>      ------------[ cut here ]------------
>   2. With the fixes
> 
>      added peer-to-peer DMA memory 0x240000000000-0x241fffffffff
> 
>      KASLR is still enabled as seen by kaslr_offset() (difference
>      between __START_KERNEL and _stext)
>   3. Without the fixes and KASLR disabled
> 
>      added peer-to-peer DMA memory 0x240000000000-0x241fffffffff
> 
>      KASLR is disabled, kaslr_offset() is 0.
> 
> On my system with 46 bits physical address and 4 level page tables (no
> LA57), the remaining entropy dropped from 49 TiB to 20 TiB
> 
>  arch/x86/mm/kaslr.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/mm/kaslr.c b/arch/x86/mm/kaslr.c
> index 11a93542d198..3c306de52fd4 100644
> --- a/arch/x86/mm/kaslr.c
> +++ b/arch/x86/mm/kaslr.c
> @@ -113,8 +113,14 @@ void __init kernel_randomize_memory(void)
>  	memory_tb = DIV_ROUND_UP(max_pfn << PAGE_SHIFT, 1UL << TB_SHIFT) +
>  		CONFIG_RANDOMIZE_MEMORY_PHYSICAL_PADDING;
>  
> -	/* Adapt physical memory region size based on available memory */
> -	if (memory_tb < kaslr_regions[0].size_tb)
> +	/*
> +	 * Adapt physical memory region size based on available memory,
> +	 * except when CONFIG_PCI_P2PDMA is enabled. P2PDMA exposes the
> +	 * device BAR space assuming the direct map space is large enough
> +	 * for creating a ZONE_DEVICE mapping in the direct map corresponding
> +	 * to the physical BAR address.
> +	 */
> +	if (!IS_ENABLED(CONFIG_PCI_P2PDMA) && (memory_tb < kaslr_regions[0].size_tb))
>  		kaslr_regions[0].size_tb = memory_tb;
>  
>  	/*
> -- 
> 2.48.0
> 
