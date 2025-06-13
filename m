Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2532E11D2
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 16:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749831674; cv=none; b=J1O6NJs13Bx5U5K09FLQhyHGC4uDMCzzMaPkapgUFxAltVFfzS2t2m0e2ol2YfU9rRoFJXnYDOtGMkjy4aFOdXVX0pDX62ipTzjOVrS5X+5dfdihliGblj+0i9KoLra1ViReRw+UMN/n09B+Fd5nIf7yjKcog10sbN6rmnDEgD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749831674; c=relaxed/simple;
	bh=uZe79v3PpuM209FTqzpTU2PdWlQToBmu2a+dDo0xnGw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ujWIy08aV4W4E3TZ8JAW+x41grEFDDt/KA0yIl9wCI5RYpFCwO9gd9d/vjmcQ6ll1u919BmWMRJmBFnWNEUnyMHY4/DC8B664yqcKnyJzflkuhZzInFQzHfUM443cF47NM6HUqnpiOUR73+kiiN9f0jtsGlHnfIscv1pl6etybE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gTZR9j5v; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gTZR9j5v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04966C4CEE3;
	Fri, 13 Jun 2025 16:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749831674;
	bh=uZe79v3PpuM209FTqzpTU2PdWlQToBmu2a+dDo0xnGw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gTZR9j5vUqxTX+FdLcZFAkTMOQfxstLgp22Cxmz9jWmrsYp/Q2QVv0q0NTu/1cVox
	 upey4uHrvINKd8Fmd8BBQu5Rw6uDMc+wlBYYCI0G1Hqc13TFps7Sd3r0kG3x4nhG94
	 2vVSIH+6au2xFh9ZvPO3SlSEop0sRdZRyCqvSls/p0j4Uf4ssbIKr54+NvCeRePjVo
	 Xyv7dnFhwAsDU54g7BoA7zB7YhhG+eqnw2knkrnjxNw+aWLqp5DlS1l8WAhAKDynSU
	 oOG7JYhu6L82a+15Z/0v3xrKBGf0KdailLX2QNtpL7tYe8OvxZTAeudamFhjpbFT5v
	 s1HITNvZrCOpg==
Date: Fri, 13 Jun 2025 19:21:07 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Alexander Graf <graf@amazon.com>,
	Changyuan Lyu <changyuanl@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>, kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Michal Clapinski <mclapinski@google.com>
Subject: Re: [PATCH] kho: initialize tail pages for higher order folios
 properly
Message-ID: <aExP8_WRsWsUhncy@kernel.org>
References: <aEfGTXrsEL5-DuF1@kernel.org>
 <CA+CK2bDXOWzrTsNtbCCK2rabNysf0JFQT5VfAjYrX5oSoiLmSQ@mail.gmail.com>
 <aEhgNU80Dr9iRwoD@kernel.org>
 <CA+CK2bD3n=JDuSsMGvsyMnVbPhGdhdf6zWFDa3KpzRGEXygdgQ@mail.gmail.com>
 <mafs0qzzqo2bg.fsf@kernel.org>
 <CA+CK2bBoMfJuUCV6sL80kwzYPnENnt7fDk2jRMPV0iPn1jCJdw@mail.gmail.com>
 <aEmGMNL9v9djgrGz@kernel.org>
 <mafs0ikl2nzqn.fsf@kernel.org>
 <aEmUU4L3eStEsYQM@kernel.org>
 <mafs0wm9fn2l3.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <mafs0wm9fn2l3.fsf@kernel.org>

On Fri, Jun 13, 2025 at 04:22:32PM +0200, Pratyush Yadav wrote:
> On Wed, Jun 11 2025, Mike Rapoport wrote:
> 
> > On Wed, Jun 11, 2025 at 04:01:52PM +0200, Pratyush Yadav wrote:
> >> On Wed, Jun 11 2025, Mike Rapoport wrote:
> >> 
> >> > On Wed, Jun 11, 2025 at 09:14:55AM -0400, Pasha Tatashin wrote:
> >> >> On Wed, Jun 11, 2025 at 9:06 AM Pratyush Yadav <pratyush@kernel.org> wrote:
> >> >> >
> >> >> > On Tue, Jun 10 2025, Pasha Tatashin wrote:
> >> >> >
> >> >> > >> > > I think it should be the other way around, KHO should depend on
> >> >> > >> > > !DEFERRED_STRUCT_PAGE_INIT.
> >> >> > >> >
> >> >> > >> > Agreed, and this is what I first tried, but that does not work, there
> >> >> > >> > is some circular dependency breaking the build. If you feel
> >> >> > >> > adventurous you can try that :-)
> >> >> > >>
> >> >> > >> Hmm, weird, worked for me :/
> >> >> >
> >> >> > Worked for me as well.
> >> >> >
> >> >> > >
> >> >> > > I am super confused, it did not work for me over weekend, and now it
> >> >> > > is working. Even `make menuconfig` would not work. Anyways, I will put
> >> >> > > it in the appropriate place.
> >> >> > >
> >> >> > >>
> >> >> > >> > > > We will need to teah KHO to work with deferred struct page init. I
> >> >> > >> > > > suspect, we could init preserved struct pages and then skip over them
> >> >> > >> > > > during deferred init.
> >> >> > >> > >
> >> >> > >> > > We could, but with that would mean we'll run this before SMP and it's not
> >> >> > >> > > desirable. Also, init_deferred_page() for a random page requires
> >> >> > >> >
> >> >> > >> > We already run KHO init before smp_init:
> >> >> > >> > start_kernel() -> mm_core_init() -> kho_memory_init() ->
> >> >> > >> > kho_restore_folio() -> struct pages must be already initialized here!
> >> >> > >> >
> >> >> > >> > While deferred struct pages are initialized:
> >> >> > >> > start_kernel() -> rest_init() -> kernel_init() ->
> >> >> > >> > kernel_init_freeable() -> page_alloc_init_late() ->
> >> >> > >> > deferred_init_memmap()
> >> >> > >> >
> >> >> > >> > If the number of preserved pages that is needed during early boot is
> >> >> > >> > relatively small, that it should not be an issue to pre-initialize
> >> >> > >> > struct pages for them before deferred struct pages are initialized. We
> >> >> > >> > already pre-initialize some  "struct pages" that are needed during
> >> >> > >> > early boot before the reset are initialized, see deferred_grow_zone()
> >> >> > >>
> >> >> > >> deferred_grow_zone() takes a chunk in the beginning of uninitialized range,
> >> >> > >> with kho we are talking about some random pages. If we preinit them early,
> >> >> > >> deferred_init_memmap() will overwrite them.
> >> >> > >
> >> >> > > Yes, this is why I am saying that we would need to skip the KHO
> >> >> > > initialized "struct pages" somehow during deferred initialization. If
> >> >> > > we create an ordered by PFN list of early-initialized KHO struct
> >> >> > > pages, skipping during deferred initialization could be done
> >> >> > > efficiently.
> >> >> >
> >> >> > Or keep things simple and don't use any KHO struct pages during early
> >> >> > init. You can access the page itself, just don't use its struct page.
> >> >> >
> >> >> > Currently the only user of kho_restore_folio() during init is
> >> >> > kho_memory_init(). The FDT is accessed by doing
> >> >> > phys_to_virt(kho_in.fdt_phys) anyway, so there is really no need for
> >> >> > restoring the folio so early. It can be done later, for example when LUO
> >> >> > does the finish event, to clean up and free the folio.
> >> >> 
> >> >> Good suggestion, however, KHO does not have any sophisticated users
> >> >> that we are going to be adding as part of the live update work in the
> >> >> future: IR, KVM, early VCPU threads, and so on. So, while today, this
> >> >> might work, in the future, I am not sure if we should expect struct
> >> >> pages are not accessed until after deferred initialization or simply
> >> >> fix it once and for all.
> >> >
> >> > KHO already accesses stuct page early and uses page->private for order.
> >> > Since preserved memory is reserved in memblock, deferred init of struct
> >> > pages won't touch those pages, we just need to make sure they are properly 
> >> 
> >> Not strictly true. Some of them might have been initialized from
> >> free_area_init() -> memmap_init() (the ones not eligible for deferred
> >> init), which happens before KHO makes its memblock reservations.
> >> 
> >> > initialized at some point. If we don't expect many kho_restore_folio()
> >> > before page_alloc_init_late() we can use init_deferred_page() for early
> >> > accesses.
> >> 
> >> I tried doing this when looking into this initially, but it doesn't work
> >> for some reason.
> >> 
> >>     static void kho_restore_page(struct page *page, unsigned int order)
> >>     {
> >>     	unsigned int i, nr_pages = (1 << order);
> >>     
> >>     	/* Head page gets refcount of 1. */
> >>     	init_deferred_page(page_to_pfn(page), NUMA_NO_NODE);
> >
> >
> > This would do
> >
> > 	if (early_page_initialised(pfn, nid))
> > 		return;
> >
> > 	__init_page_from_nid(pfn, nid);
> >
> > and I'm really surprised it didn't crash in early_page_initialised()
> > because of NUMA_NO_NODE :)
> 
> Oh, right. Using the wrong node completely throws
> early_page_initialised() off.
> 
> >
> > What might work here is 
> >
> > 	pfn = page_to_pfn(page);
> > 	__init_page_from_nid(pfn, early_pfn_to_nid(pfn));
> 
> Yep, that works. Although this would do early_pfn_to_nid() for each page
> so it isn't very efficient. And we also need to make sure memblock does
> not go away.

Yeah, that's far from ideal. Let's just gate KHO on
!CONFIG_DEFERRED_PAGE_STRUCT_INIT for now.

> >>     	set_page_count(page, 1);
> >>     
> >>     	/* For higher order folios, tail pages get a page count of zero. */
> >>     	for (i = 1; i < nr_pages; i++) {
> >>     		init_deferred_page(page_to_pfn(page + i), NUMA_NO_NODE);
> >>     		set_page_count(page + i, 0);
> >>     	}
> >>     
> >>     [...]
> >> 
> [...]
> 
> -- 
> Regards,
> Pratyush Yadav

-- 
Sincerely yours,
Mike.
