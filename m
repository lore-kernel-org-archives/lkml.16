Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF42A288503
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 13:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749648951; cv=none; b=DVRQtbnttIWA0DJ6oQ1DlVLeq5KqJwfgddpDmX5p1Iy/ttXaV53lSaqhqAicpuRk9Sagu0kfgzubH+VeiBeJDfju5D42IoZkAH2a4+EIifSRlYKupEbuIsenT4Y0gvMg8B3F0FHUaXpCirL4iIQpr6HV6bA9YBLj4O8G714MKBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749648951; c=relaxed/simple;
	bh=8X+6Dpb2majUF6w6aZsaAegNKHMP2ANt2g25xsiSY54=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=exEm6BtSP28VFiYLD6iJV9IykBi8l++98T+CyHo+PzrR4C9m+GojC3LXc14NDSrjbet+u6Zjkq8Zk0SBmm9ufK+8A/yYxP7d1TD2AKd2CUpDG+vuyKG1M/Z2rLzRtD1IKbk+xU21HUUr+a7M6mNqKxjyuY6dFGCEX+tCvuDXCZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a2b7VoG4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a2b7VoG4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01C02C4CEEE;
	Wed, 11 Jun 2025 13:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749648951;
	bh=8X+6Dpb2majUF6w6aZsaAegNKHMP2ANt2g25xsiSY54=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a2b7VoG4KVqWAF+icCE2Z4hRUFIlu5OHHqYJ3oHZFr4R7WyyXukCtW9n+ox3tMs5a
	 fBKESZmb07rlHHttjx1F4xhBLi+GI/wjGbkMeDrKI9rhP6MkomwzA7VRwrN/QQAcTB
	 18NWQhj68drd91qGaVTUU24Kd4QLQ0SSQPFgT1cJ6yKyOWVUVLiCOwjzZHfDwrTaDu
	 GGefcMkhiQ048C3/8M4NKoKylVohrYJ0mtxNcWkUhJ18XM6qc+9JDpkMF3+lcZz1Wx
	 rGza2+RMTw7fo4GZRCPMqNE5CyCp3I5GFLIh/OIOpSRTDapMEIYZYTexFKBFUE205v
	 1d6RTTMYa8e0A==
Date: Wed, 11 Jun 2025 16:35:44 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, Alexander Graf <graf@amazon.com>,
	Changyuan Lyu <changyuanl@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>, kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Michal Clapinski <mclapinski@google.com>
Subject: Re: [PATCH] kho: initialize tail pages for higher order folios
 properly
Message-ID: <aEmGMNL9v9djgrGz@kernel.org>
References: <aEKhF3HcrvG77Ogb@kernel.org>
 <mafs0jz5osutx.fsf@kernel.org>
 <aEc30BoLE9HRxiZm@kernel.org>
 <CA+CK2bAAbZjS2Og79xxLcDtNf-eM0up-8fwhd4fg_dp0j_TahA@mail.gmail.com>
 <aEfGTXrsEL5-DuF1@kernel.org>
 <CA+CK2bDXOWzrTsNtbCCK2rabNysf0JFQT5VfAjYrX5oSoiLmSQ@mail.gmail.com>
 <aEhgNU80Dr9iRwoD@kernel.org>
 <CA+CK2bD3n=JDuSsMGvsyMnVbPhGdhdf6zWFDa3KpzRGEXygdgQ@mail.gmail.com>
 <mafs0qzzqo2bg.fsf@kernel.org>
 <CA+CK2bBoMfJuUCV6sL80kwzYPnENnt7fDk2jRMPV0iPn1jCJdw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+CK2bBoMfJuUCV6sL80kwzYPnENnt7fDk2jRMPV0iPn1jCJdw@mail.gmail.com>

On Wed, Jun 11, 2025 at 09:14:55AM -0400, Pasha Tatashin wrote:
> On Wed, Jun 11, 2025 at 9:06 AM Pratyush Yadav <pratyush@kernel.org> wrote:
> >
> > On Tue, Jun 10 2025, Pasha Tatashin wrote:
> >
> > >> > > I think it should be the other way around, KHO should depend on
> > >> > > !DEFERRED_STRUCT_PAGE_INIT.
> > >> >
> > >> > Agreed, and this is what I first tried, but that does not work, there
> > >> > is some circular dependency breaking the build. If you feel
> > >> > adventurous you can try that :-)
> > >>
> > >> Hmm, weird, worked for me :/
> >
> > Worked for me as well.
> >
> > >
> > > I am super confused, it did not work for me over weekend, and now it
> > > is working. Even `make menuconfig` would not work. Anyways, I will put
> > > it in the appropriate place.
> > >
> > >>
> > >> > > > We will need to teah KHO to work with deferred struct page init. I
> > >> > > > suspect, we could init preserved struct pages and then skip over them
> > >> > > > during deferred init.
> > >> > >
> > >> > > We could, but with that would mean we'll run this before SMP and it's not
> > >> > > desirable. Also, init_deferred_page() for a random page requires
> > >> >
> > >> > We already run KHO init before smp_init:
> > >> > start_kernel() -> mm_core_init() -> kho_memory_init() ->
> > >> > kho_restore_folio() -> struct pages must be already initialized here!
> > >> >
> > >> > While deferred struct pages are initialized:
> > >> > start_kernel() -> rest_init() -> kernel_init() ->
> > >> > kernel_init_freeable() -> page_alloc_init_late() ->
> > >> > deferred_init_memmap()
> > >> >
> > >> > If the number of preserved pages that is needed during early boot is
> > >> > relatively small, that it should not be an issue to pre-initialize
> > >> > struct pages for them before deferred struct pages are initialized. We
> > >> > already pre-initialize some  "struct pages" that are needed during
> > >> > early boot before the reset are initialized, see deferred_grow_zone()
> > >>
> > >> deferred_grow_zone() takes a chunk in the beginning of uninitialized range,
> > >> with kho we are talking about some random pages. If we preinit them early,
> > >> deferred_init_memmap() will overwrite them.
> > >
> > > Yes, this is why I am saying that we would need to skip the KHO
> > > initialized "struct pages" somehow during deferred initialization. If
> > > we create an ordered by PFN list of early-initialized KHO struct
> > > pages, skipping during deferred initialization could be done
> > > efficiently.
> >
> > Or keep things simple and don't use any KHO struct pages during early
> > init. You can access the page itself, just don't use its struct page.
> >
> > Currently the only user of kho_restore_folio() during init is
> > kho_memory_init(). The FDT is accessed by doing
> > phys_to_virt(kho_in.fdt_phys) anyway, so there is really no need for
> > restoring the folio so early. It can be done later, for example when LUO
> > does the finish event, to clean up and free the folio.
> 
> Good suggestion, however, KHO does not have any sophisticated users
> that we are going to be adding as part of the live update work in the
> future: IR, KVM, early VCPU threads, and so on. So, while today, this
> might work, in the future, I am not sure if we should expect struct
> pages are not accessed until after deferred initialization or simply
> fix it once and for all.

KHO already accesses stuct page early and uses page->private for order.
Since preserved memory is reserved in memblock, deferred init of struct
pages won't touch those pages, we just need to make sure they are properly 
initialized at some point. If we don't expect many kho_restore_folio()
before page_alloc_init_late() we can use init_deferred_page() for early
accesses.
 
> Pasha
> 
> >
> > --
> > Regards,
> > Pratyush Yadav

-- 
Sincerely yours,
Mike.
