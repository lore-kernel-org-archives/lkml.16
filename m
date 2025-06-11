Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C58C2E6138
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 14:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749650516; cv=none; b=NN4MjCxXh48Grne0fd4YxHDyyM1TkjIIaMpQErFrfVHFMQvEbT4vhJqMTADz70Tu50Gzs+jjGn4xg45VXfXEIjH3xywob4kpYTubHtNfmkeOWxA4w8anhEusCDcvpxnQhmVBgpmm7mfYpsk5rGe2OO7LVmMdpvfTuNNdxsvtjto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749650516; c=relaxed/simple;
	bh=BAePymoebK5BBu7o01vZEw+cupxxDzaeyWOs5m+KQ88=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=pB5pskGVKXOr6m20hjPTM0BTDhob6+Z9UdRMyLQerPUJGE1pir7RVTVNR1S6xlP6Jrejq/PF2xw2bwidVlOuKWwynABWyYhBgIpD6c3P++W+lD/vkVEWseNAazpvE7J1+Z9XoKi2SuWwjPsyzZqv0B4vWSq2hyY5atoyCgBDJlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LkVVIMiP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LkVVIMiP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C5C1C4CEEA;
	Wed, 11 Jun 2025 14:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749650515;
	bh=BAePymoebK5BBu7o01vZEw+cupxxDzaeyWOs5m+KQ88=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=LkVVIMiPzy53gbOuXhKkB5rkSfCB6l8PYd0O1935ufYN+sE6BR/l5ZtC8aRX+EBfp
	 zYoEEYFmX15KBnpmwgjI8/CgvxJ5laOEhekSnSfUhKDNV7J9Xn2c4KU7ofEKZL4Ndu
	 YHcR347Nr7dzll7S6ZtAA0BO7e0cUyrs5X4LJo5ErgCskyeA9p7Cde+iGGzeInSymH
	 6xlAff7qBC3TLFz00pINbaQLC9F10uUu4hXfmdh/QVRf8tLYRaGY2zjNcVdcea5p11
	 yblDWSKZOrThyD8FdUnTWw/KFM/dPoKO+HNMFAQ2M/zf3pf6ofWt5pBlADThokceIP
	 5ULBXZsx/q3Vw==
From: Pratyush Yadav <pratyush@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>,  Pratyush Yadav
 <pratyush@kernel.org>,  Alexander Graf <graf@amazon.com>,  Changyuan Lyu
 <changyuanl@google.com>,  Andrew Morton <akpm@linux-foundation.org>,
  Baoquan He <bhe@redhat.com>,  kexec@lists.infradead.org,
  linux-kernel@vger.kernel.org,  linux-mm@kvack.org,  Michal Clapinski
 <mclapinski@google.com>
Subject: Re: [PATCH] kho: initialize tail pages for higher order folios
 properly
In-Reply-To: <aEmGMNL9v9djgrGz@kernel.org>
References: <aEKhF3HcrvG77Ogb@kernel.org> <mafs0jz5osutx.fsf@kernel.org>
	<aEc30BoLE9HRxiZm@kernel.org>
	<CA+CK2bAAbZjS2Og79xxLcDtNf-eM0up-8fwhd4fg_dp0j_TahA@mail.gmail.com>
	<aEfGTXrsEL5-DuF1@kernel.org>
	<CA+CK2bDXOWzrTsNtbCCK2rabNysf0JFQT5VfAjYrX5oSoiLmSQ@mail.gmail.com>
	<aEhgNU80Dr9iRwoD@kernel.org>
	<CA+CK2bD3n=JDuSsMGvsyMnVbPhGdhdf6zWFDa3KpzRGEXygdgQ@mail.gmail.com>
	<mafs0qzzqo2bg.fsf@kernel.org>
	<CA+CK2bBoMfJuUCV6sL80kwzYPnENnt7fDk2jRMPV0iPn1jCJdw@mail.gmail.com>
	<aEmGMNL9v9djgrGz@kernel.org>
Date: Wed, 11 Jun 2025 16:01:52 +0200
Message-ID: <mafs0ikl2nzqn.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11 2025, Mike Rapoport wrote:

> On Wed, Jun 11, 2025 at 09:14:55AM -0400, Pasha Tatashin wrote:
>> On Wed, Jun 11, 2025 at 9:06=E2=80=AFAM Pratyush Yadav <pratyush@kernel.=
org> wrote:
>> >
>> > On Tue, Jun 10 2025, Pasha Tatashin wrote:
>> >
>> > >> > > I think it should be the other way around, KHO should depend on
>> > >> > > !DEFERRED_STRUCT_PAGE_INIT.
>> > >> >
>> > >> > Agreed, and this is what I first tried, but that does not work, t=
here
>> > >> > is some circular dependency breaking the build. If you feel
>> > >> > adventurous you can try that :-)
>> > >>
>> > >> Hmm, weird, worked for me :/
>> >
>> > Worked for me as well.
>> >
>> > >
>> > > I am super confused, it did not work for me over weekend, and now it
>> > > is working. Even `make menuconfig` would not work. Anyways, I will p=
ut
>> > > it in the appropriate place.
>> > >
>> > >>
>> > >> > > > We will need to teah KHO to work with deferred struct page in=
it. I
>> > >> > > > suspect, we could init preserved struct pages and then skip o=
ver them
>> > >> > > > during deferred init.
>> > >> > >
>> > >> > > We could, but with that would mean we'll run this before SMP an=
d it's not
>> > >> > > desirable. Also, init_deferred_page() for a random page requires
>> > >> >
>> > >> > We already run KHO init before smp_init:
>> > >> > start_kernel() -> mm_core_init() -> kho_memory_init() ->
>> > >> > kho_restore_folio() -> struct pages must be already initialized h=
ere!
>> > >> >
>> > >> > While deferred struct pages are initialized:
>> > >> > start_kernel() -> rest_init() -> kernel_init() ->
>> > >> > kernel_init_freeable() -> page_alloc_init_late() ->
>> > >> > deferred_init_memmap()
>> > >> >
>> > >> > If the number of preserved pages that is needed during early boot=
 is
>> > >> > relatively small, that it should not be an issue to pre-initialize
>> > >> > struct pages for them before deferred struct pages are initialize=
d. We
>> > >> > already pre-initialize some  "struct pages" that are needed during
>> > >> > early boot before the reset are initialized, see deferred_grow_zo=
ne()
>> > >>
>> > >> deferred_grow_zone() takes a chunk in the beginning of uninitialize=
d range,
>> > >> with kho we are talking about some random pages. If we preinit them=
 early,
>> > >> deferred_init_memmap() will overwrite them.
>> > >
>> > > Yes, this is why I am saying that we would need to skip the KHO
>> > > initialized "struct pages" somehow during deferred initialization. If
>> > > we create an ordered by PFN list of early-initialized KHO struct
>> > > pages, skipping during deferred initialization could be done
>> > > efficiently.
>> >
>> > Or keep things simple and don't use any KHO struct pages during early
>> > init. You can access the page itself, just don't use its struct page.
>> >
>> > Currently the only user of kho_restore_folio() during init is
>> > kho_memory_init(). The FDT is accessed by doing
>> > phys_to_virt(kho_in.fdt_phys) anyway, so there is really no need for
>> > restoring the folio so early. It can be done later, for example when L=
UO
>> > does the finish event, to clean up and free the folio.
>>=20
>> Good suggestion, however, KHO does not have any sophisticated users
>> that we are going to be adding as part of the live update work in the
>> future: IR, KVM, early VCPU threads, and so on. So, while today, this
>> might work, in the future, I am not sure if we should expect struct
>> pages are not accessed until after deferred initialization or simply
>> fix it once and for all.
>
> KHO already accesses stuct page early and uses page->private for order.
> Since preserved memory is reserved in memblock, deferred init of struct
> pages won't touch those pages, we just need to make sure they are properl=
y=20

Not strictly true. Some of them might have been initialized from
free_area_init() -> memmap_init() (the ones not eligible for deferred
init), which happens before KHO makes its memblock reservations.

> initialized at some point. If we don't expect many kho_restore_folio()
> before page_alloc_init_late() we can use init_deferred_page() for early
> accesses.

I tried doing this when looking into this initially, but it doesn't work
for some reason.

    static void kho_restore_page(struct page *page, unsigned int order)
    {
    	unsigned int i, nr_pages =3D (1 << order);
=20=20=20=20
    	/* Head page gets refcount of 1. */
    	init_deferred_page(page_to_pfn(page), NUMA_NO_NODE);
    	set_page_count(page, 1);
=20=20=20=20
    	/* For higher order folios, tail pages get a page count of zero. */
    	for (i =3D 1; i < nr_pages; i++) {
    		init_deferred_page(page_to_pfn(page + i), NUMA_NO_NODE);
    		set_page_count(page + i, 0);
    	}
=20=20=20=20
    [...]

results in:

    [    0.644032] page:(____ptrval____) is uninitialized and poisoned
    [    0.644679] page dumped because: VM_BUG_ON_PAGE(PagePoisoned(page))
    [    0.645376] ------------[ cut here ]------------
    [    0.645883] kernel BUG at ./include/linux/mm.h:1512!
    [...]
    [    0.647924] RIP: 0010:__pageblock_pfn_to_page+0x166/0x180
    [...]
    [    0.647924]  <TASK>
    [    0.647924]  set_zone_contiguous+0x6b/0x90
    [    0.647924]  page_alloc_init_late+0x356/0x370
    [    0.647924]  kernel_init_freeable+0x12d/0x190
    [    0.647924]  ? __pfx_kernel_init+0x10/0x10
    [    0.647924]  kernel_init+0x1a/0x130

didn't dig any deeper on why it happens...

--=20
Regards,
Pratyush Yadav
