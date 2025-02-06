Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2A61ACEDD
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 19:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738871958; cv=none; b=i7QnGNhs8/S8Lhj+KT0on8299BSti+5DhPAiPxVOzvt4itegxO4nl1470s+vK/GrMpmIq630+5w6OUTAmKE3BxqKV+uai2bUun3TxANRGerPuxgttaH2KmTpuS6PhQQ21ZYyrOS0B+9WPd8ymnOjHKRJwBhY/rGQvjrzx7O5x7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738871958; c=relaxed/simple;
	bh=dfvp7/wJ9NAu6o86rq8NRInEkCuRWxQylkrsa0t5vhc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AKm1SYI/Y1z753uPZ0JquBrsrhg6mrue+r4jZ/stKhDdphVAASCV0ohKbtGnE2A2X6J/4v3D40AOea/4fzf5b2dSPTUZRyR8CD3cqJs1N/Tow72NDAwy20liZk8Sj9xSFBwu/lZM78U03qhKHusflcTOXnE8VBb+QiyyW+Pd/Eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=blCZbG42; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="blCZbG42"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0E04C4CEDD;
	Thu,  6 Feb 2025 19:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738871957;
	bh=dfvp7/wJ9NAu6o86rq8NRInEkCuRWxQylkrsa0t5vhc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=blCZbG428UpOR9IUePXKuqfBThPjyoWBO3XYMFix7XoYSg/dIMAV19xodBemz5uQj
	 E7F+torGplS/GXyWaffkWo4DLNv0TvWNduahMExNYaqlefb9eUq1fFdZ/Z22dMeZOd
	 H1jSBUDE23qZ+3h50BY1Z9FVAv87NRm+jfqO5QaKIaCY5SP/IStHhBesPwzLpclBCI
	 aJdWZw390+dWPoQzMWg74Zb5UjEptE0fz9VVplWWod844TQ9fVsXa1aVCozKB6fmPG
	 VilliOgmHiBQqOT32H2+xTE4gsE0vbdvA4rrLITqYuIQPzhJIRYN5Le63hDONG08s/
	 IV493WrFc6tag==
Date: Thu, 6 Feb 2025 11:59:17 -0800
From: Kees Cook <kees@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Balbir Singh <balbirs@nvidia.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org, apopple@nvidia.com, jgg@nvidia.com,
	jhubbard@nvidia.com, Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH] x86/kaslr: Revisit entropy when CONFIG_PCI_P2PDMA is
 enabled
Message-ID: <202502061145.8AFAF053E4@keescook>
References: <20250206023201.1481957-1-balbirs@nvidia.com>
 <20250206081058.GH7145@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206081058.GH7145@noisy.programming.kicks-ass.net>

On Thu, Feb 06, 2025 at 09:10:58AM +0100, Peter Zijlstra wrote:
> On Thu, Feb 06, 2025 at 01:32:01PM +1100, Balbir Singh wrote:
> > When CONFIG_PCI_P2PDMA is enabled, it maps the PFN's via a
> > ZONE_DEVICE mapping using devm_memremap_pages(). The mapped
> > virtual address range corresponds to the pci_resource_start()
> > of the BAR address and size corresponding to the BAR length.
> > 
> > When KASLR is enabled, the direct map range of the kernel is
> > reduced to the size of physical memory plus additional padding.
> > If the BAR address is beyond this limit, PCI peer to peer DMA
> > mappings fail.
> > 
> > Fix this by not shrinking the size of direct map when CONFIG_PCI_P2PDMA
> > is enabled. This reduces the total available entropy, but it's
> > better than the current work around of having to disable KASLR
> > completely.

So, just to restate my understanding: this is about only the direct map
(i.e. kaslr_region[0]). The notes (which I think should be left in the
commit log) say that the entropy dropped from 49 TiB (46 bits) to 20 TiB
(45 bits). If I'm reading right, the offset granularity is in PUD_SIZE
(30 bits) steps, so the entropy is going from 16 bits to 15 bits. I don't
see any general problem with that. Especially if the alternative is 0
bits of entropy. :)

> I'm thinking this CONFIG is going to be on by default for pretty much
> all distro kernels? As such, does it make sense to have this depend on
> this config symbol?

If checking the CONFIG means we get back the 1 bit of entropy, I'd say
keep the check. Some folks will want that bit over P2PDMA.

> Also +Kees

Thanks for CCing me! :)

-Kees

-- 
Kees Cook
