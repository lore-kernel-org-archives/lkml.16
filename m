Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED06924C08D;
	Thu,  3 Apr 2025 13:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743688663; cv=none; b=Ai9/rmzdxvBInFX7T67tnlKIHBBA1TyUkmp2vmprvLb204hJrdby+DCinS2OwA8Pidh9v05ZLf0ACS9p6Ylb92FWUJdRyAG3lj8Glu2whKeVd2IQK1Oe5U4RQsh415v3ZUV238CBQOiksKRLUqul7HA4p35wmpWJAAb8il5mdwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743688663; c=relaxed/simple;
	bh=5SR2KTBI1kKtfOBINvsox0Z0ryfiIm93Ekm8MRv/a4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FsTkbb+Yij7uikSc51AhenUM4qz+wd/9N+wZwM2wFI2c/hMaB9qbWk+zFnSCHBrFwkKtOQ1cv//K2Qe6P4iKN6O6bqI2QPM5Q38DCUp1SX5C6LReluDM41pOZxV8wvJLX8e++awfHQ3jFSkbl7fJO66sBsOpteGP+4Uen4t9cCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iW7Kcl6M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iW7Kcl6M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A24EC4CEE3;
	Thu,  3 Apr 2025 13:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743688661;
	bh=5SR2KTBI1kKtfOBINvsox0Z0ryfiIm93Ekm8MRv/a4I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iW7Kcl6McmBEbJ1JPZ4u0Huxc2f6LpTnxB8SXB6QM6RbBFXxP9bN9E8qyknVSdeu+
	 l/b+SAQ0QWM3fR8hQqvYA7ZOXApBXeYHLHS2dOtEI4U4eNVuZ996rcgf9L1vOMk1VK
	 fsR+piAc8w0Tw7dC/yfcWpuGp/3Zm0/Hg6A4cnGFfj20+RRAL0D7bzGlvX7pR+TyEM
	 MNWnWibgibRxnmAdvGDG7Qxe1hwAugVpYoRsDOYU8Dz9TOIZ3hKlDJrJ32IqaHfWrO
	 0gY5wz+zFvE4o6h1f3Wor+aFDgX4QJbAEqle0OkXvoDBz/9rl4ykSomefNEMfNRYWa
	 D3h05S20MooXA==
Date: Thu, 3 Apr 2025 16:57:25 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Pratyush Yadav <ptyadav@amazon.de>
Cc: Changyuan Lyu <changyuanl@google.com>, linux-kernel@vger.kernel.org,
	graf@amazon.com, akpm@linux-foundation.org, luto@kernel.org,
	anthony.yznaga@oracle.com, arnd@arndb.de, ashish.kalra@amd.com,
	benh@kernel.crashing.org, bp@alien8.de, catalin.marinas@arm.com,
	dave.hansen@linux.intel.com, dwmw2@infradead.org,
	ebiederm@xmission.com, mingo@redhat.com, jgowans@amazon.com,
	corbet@lwn.net, krzk@kernel.org, mark.rutland@arm.com,
	pbonzini@redhat.com, pasha.tatashin@soleen.com, hpa@zytor.com,
	peterz@infradead.org, robh+dt@kernel.org, robh@kernel.org,
	saravanak@google.com, skinsburskii@linux.microsoft.com,
	rostedt@goodmis.org, tglx@linutronix.de, thomas.lendacky@amd.com,
	usama.arif@bytedance.com, will@kernel.org,
	devicetree@vger.kernel.org, kexec@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-mm@kvack.org, x86@kernel.org,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v5 09/16] kexec: enable KHO support for memory
 preservation
Message-ID: <Z-6TxZWEWbKSCqfh@kernel.org>
References: <20250320015551.2157511-1-changyuanl@google.com>
 <20250320015551.2157511-10-changyuanl@google.com>
 <mafs05xjmqsqc.fsf@amazon.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mafs05xjmqsqc.fsf@amazon.de>

On Wed, Apr 02, 2025 at 07:16:27PM +0000, Pratyush Yadav wrote:
> Hi Changyuan,
> 
> On Wed, Mar 19 2025, Changyuan Lyu wrote:
> 
> > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> >
> > Introduce APIs allowing KHO users to preserve memory across kexec and
> > get access to that memory after boot of the kexeced kernel
> >
> > kho_preserve_folio() - record a folio to be preserved over kexec
> > kho_restore_folio() - recreates the folio from the preserved memory
> > kho_preserve_phys() - record physically contiguous range to be
> > preserved over kexec.
> > kho_restore_phys() - recreates order-0 pages corresponding to the
> > preserved physical range
> >
> > The memory preservations are tracked by two levels of xarrays to manage
> > chunks of per-order 512 byte bitmaps. For instance the entire 1G order
> > of a 1TB x86 system would fit inside a single 512 byte bitmap. For
> > order 0 allocations each bitmap will cover 16M of address space. Thus,
> > for 16G of memory at most 512K of bitmap memory will be needed for order 0.
> >
> > At serialization time all bitmaps are recorded in a linked list of pages
> > for the next kernel to process and the physical address of the list is
> > recorded in KHO FDT.
> >
> > The next kernel then processes that list, reserves the memory ranges and
> > later, when a user requests a folio or a physical range, KHO restores
> > corresponding memory map entries.
> >
> > Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > Co-developed-by: Changyuan Lyu <changyuanl@google.com>
> > Signed-off-by: Changyuan Lyu <changyuanl@google.com>
> > ---
> >  include/linux/kexec_handover.h |  38 +++
> >  kernel/kexec_handover.c        | 486 ++++++++++++++++++++++++++++++++-
> >  2 files changed, 522 insertions(+), 2 deletions(-)
> [...]
> > +int kho_preserve_phys(phys_addr_t phys, size_t size)
> > +{
> > +	unsigned long pfn = PHYS_PFN(phys), end_pfn = PHYS_PFN(phys + size);
> > +	unsigned int order = ilog2(end_pfn - pfn);
> 
> This caught my eye when playing around with the code. It does not put
> any limit on the order, so it can exceed NR_PAGE_ORDERS. Also, when

I don't see a problem with this

> initializing the page after KHO, we pass the order directly to
> prep_compound_page() without sanity checking it. The next kernel might
> not support all the orders the current one supports. Perhaps something
> to fix?

And this needs to be fixed and we should refuse to create folios larger
than MAX_ORDER.
 
> > +	unsigned long failed_pfn;
> > +	int err = 0;
> > +
> > +	if (!kho_enable)
> > +		return -EOPNOTSUPP;
> > +
> > +	down_read(&kho_out.tree_lock);
> > +	if (kho_out.fdt) {
> > +		err = -EBUSY;
> > +		goto unlock;
> > +	}
> > +
> > +	for (; pfn < end_pfn;
> > +	     pfn += (1 << order), order = ilog2(end_pfn - pfn)) {
> > +		err = __kho_preserve(&kho_mem_track, pfn, order);
> > +		if (err) {
> > +			failed_pfn = pfn;
> > +			break;
> > +		}
> > +	}
> [...
> > +struct folio *kho_restore_folio(phys_addr_t phys)
> > +{
> > +	struct page *page = pfn_to_online_page(PHYS_PFN(phys));
> > +	unsigned long order = page->private;
> > +
> > +	if (!page)
> > +		return NULL;
> > +
> > +	order = page->private;
> > +	if (order)
> > +		prep_compound_page(page, order);
> > +	else
> > +		kho_restore_page(page);
> > +
> > +	return page_folio(page);
> > +}
> [...]
> 
> -- 
> Regards,
> Pratyush Yadav

-- 
Sincerely yours,
Mike.
