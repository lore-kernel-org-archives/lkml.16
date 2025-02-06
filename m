Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D185323716E
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 22:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738882268; cv=none; b=Q9pVMYY16yaxCmiw1yXxd0eVjm6ZFK/ClTCwtoPQD30xDE1i/+AfNw1Gl7mMDL+pUgAOvxNRNm8h8eiyFPlGd+UqbqVR9eTkgDc+B1jGENqz4NzNjPl7vEYl3L42tGsAv05bMEFZyeV7b5pW63KzA5QuUuxF2bktZ8uadzSD1nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738882268; c=relaxed/simple;
	bh=xm+FIbOibdj3SnNMdO85V07gJt2mpbO7LhliIXK/nbk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dpNYFmsCKbNwCSKRweF/gY4vTPerF58Rsb/d3idEAQ1oK6DAWAu0npTk9nu4hGwUhYjDRVuD6yHPx9fv0TjuNsqZl4TPspChRhxz8A/dHWZGav34Sskt5iKHPdjXnsWvmaly1I+C0u8k3q/OxaNx3EWpAhkq4GAAEHoTlaa7fWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rMmlXNDb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rMmlXNDb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54B5BC4CEDD;
	Thu,  6 Feb 2025 22:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738882268;
	bh=xm+FIbOibdj3SnNMdO85V07gJt2mpbO7LhliIXK/nbk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rMmlXNDbTsukSq4JX0SjAXT37s/y/7eVxu6aVNk0TGBbtIZdvVx6lRi42/IntcoOK
	 gpTTFNiZjaGo2fbw+Rbj8nquFYJhxvH92Pw0hsyU5BMHOAEA6xDc2FunHuouimDpqI
	 vyhz/oM0Rl0pD1PhUYWxjnaGSbqS8j5Lhx1BN+iN70PBApLoFTSHnDA4Nt4OkVoQwu
	 1GUDvX5CaoMyDE0Ka+LiMaQXxKukV8zqwzrn/e4dSoxEDXMlRL1D1k1vk5KBwAHlUB
	 FHwXJe9lB7HXzeKv9c8nFhkVLRlGGTzsCEu7FKExcNty7S/ntk094dLfKuWAGAYQrX
	 2kN278y2UzUIw==
Date: Thu, 6 Feb 2025 14:51:08 -0800
From: Kees Cook <kees@kernel.org>
To: Balbir Singh <balbirs@nvidia.com>
Cc: Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
	linux-kernel@vger.kernel.org, apopple@nvidia.com, jgg@nvidia.com,
	jhubbard@nvidia.com, Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH] x86/kaslr: Revisit entropy when CONFIG_PCI_P2PDMA is
 enabled
Message-ID: <202502061450.0935BB9@keescook>
References: <20250206023201.1481957-1-balbirs@nvidia.com>
 <20250206081058.GH7145@noisy.programming.kicks-ass.net>
 <202502061145.8AFAF053E4@keescook>
 <47db7421-c796-4592-b223-d50277625dbd@nvidia.com>
 <202502061343.44A6657E@keescook>
 <08746633-d844-4dc1-90c7-7c3d63b5f4b2@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <08746633-d844-4dc1-90c7-7c3d63b5f4b2@nvidia.com>

On Fri, Feb 07, 2025 at 09:23:50AM +1100, Balbir Singh wrote:
> On 2/7/25 08:46, Kees Cook wrote:
> > On Fri, Feb 07, 2025 at 08:22:23AM +1100, Balbir Singh wrote:
> >> On 2/7/25 06:59, Kees Cook wrote:
> >>> On Thu, Feb 06, 2025 at 09:10:58AM +0100, Peter Zijlstra wrote:
> >>>> On Thu, Feb 06, 2025 at 01:32:01PM +1100, Balbir Singh wrote:
> >>>>> When CONFIG_PCI_P2PDMA is enabled, it maps the PFN's via a
> >>>>> ZONE_DEVICE mapping using devm_memremap_pages(). The mapped
> >>>>> virtual address range corresponds to the pci_resource_start()
> >>>>> of the BAR address and size corresponding to the BAR length.
> >>>>>
> >>>>> When KASLR is enabled, the direct map range of the kernel is
> >>>>> reduced to the size of physical memory plus additional padding.
> >>>>> If the BAR address is beyond this limit, PCI peer to peer DMA
> >>>>> mappings fail.
> >>>>>
> >>>>> Fix this by not shrinking the size of direct map when CONFIG_PCI_P2PDMA
> >>>>> is enabled. This reduces the total available entropy, but it's
> >>>>> better than the current work around of having to disable KASLR
> >>>>> completely.
> >>>
> >>> So, just to restate my understanding: this is about only the direct map
> >>> (i.e. kaslr_region[0]). The notes (which I think should be left in the
> >>> commit log) say that the entropy dropped from 49 TiB (46 bits) to 20 TiB
> >>> (45 bits). If I'm reading right, the offset granularity is in PUD_SIZE
> >>> (30 bits) steps, so the entropy is going from 16 bits to 15 bits. I don't
> >>> see any general problem with that. Especially if the alternative is 0
> >>> bits of entropy. :)
> >>>
> >>
> >> Yes, this is about the direct map (kaslr_region[0]) and the data is from my
> >> system which has 46 bits of physical address. On larger systems with LA57
> >> the drop might be higher. I am happy to repost the patch with my testing notes
> >> in the commit log, if you think it's useful to have in the commit log.
> > 
> > Actually, it might be more useful to note it in the CONFIG help
> > text? "This may reduce direct map ASLR entropy by 1 bit with 46 physical
> > bits, X bits with YY physical bits, [etc...]"
> > 
> 
> I worded it as follows in drivers/pci/Kconfig
> 
> 	  Enabling this option will reduce the entropy of x86 KASLR memory
> 	  regions. For example - on a 46 bit system, the entropy goes down
> 	  from 16 bits to 15 bits. The actual reduction in entropy depends
> 	  on the physical address bits, on processor features, kernel config
> 	  (5 level page table) and physical memory present on the system.
> 
> Does that seem reasonable?

Yeah, I like it. Thanks!

-- 
Kees Cook
