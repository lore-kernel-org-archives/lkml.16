Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11792E11D8
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 14:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749824555; cv=none; b=PnE62EyUhtdo5+J6GIKF3oJzlaPfIMoSEeEBDc0tuFZK0tqrwhn3RjyENkkl/ggN+th7VcMw4yBNCulipD796DB/hA6jzCh8RsQi+Fn6fAME0Wmm2gqER85/D/EMqn0h58o2O1HibvjmUizb21N+H7rmEUTwnh6790+2fULUTOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749824555; c=relaxed/simple;
	bh=mFrrGfLemhIJ3f/aDQPvUYUk++CNfebL5xpQeoqtlTo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=AXgbBQLwY52vUFLtyJNH7G5Ri7yKdbD8O1J10cGKi/tw6ZAHcCsrvlBqK87aqhPK0jGtQ5/TRKP8tsytjMphOLeD1051xR3xgGdQNV6ntzeTW3loo7apxij6JaKe1QF6OTEGv6rwQ5DfYwamG3p/ynp8F8DYsUeKs0cMiH2AlTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J9dzXAFE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J9dzXAFE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57FF2C4CEF1;
	Fri, 13 Jun 2025 14:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749824555;
	bh=mFrrGfLemhIJ3f/aDQPvUYUk++CNfebL5xpQeoqtlTo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=J9dzXAFEnZgd4nf1M5o7aWGcV/gX9j/9MDOyEwxli67WfOelfJk0qeCctddCBj6Bj
	 hGgEfzIZVVzzJukrthsoZZQoRGrvdse7kXhvO4BcjdqRyoYT2/GQq1XoFkbpJ8jycx
	 MAhYZ+Q8XLztkCx2EP0kJ3ii0ZIHICr7KAFcExYM24G8f8gY4BIALSggI6X85EDwED
	 LCSuyA9la02D+RsIX1PRMMLN2s6AsUR4gDRjjiG196yP4HZWJM/bhC5Zb6V/+MzF07
	 JenuoVPQL6pTTm5mRI4GV5y11lqDMOMVFCxUYdorgZFftJxWZHbz9DSwSTL4LaoLA1
	 dtEewPyS5Wz8w==
From: Pratyush Yadav <pratyush@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Pasha Tatashin
 <pasha.tatashin@soleen.com>,  Alexander Graf <graf@amazon.com>,  Changyuan
 Lyu <changyuanl@google.com>,  Andrew Morton <akpm@linux-foundation.org>,
  Baoquan He <bhe@redhat.com>,  kexec@lists.infradead.org,
  linux-kernel@vger.kernel.org,  linux-mm@kvack.org,  Michal Clapinski
 <mclapinski@google.com>
Subject: Re: [PATCH] kho: initialize tail pages for higher order folios
 properly
In-Reply-To: <aEmUU4L3eStEsYQM@kernel.org>
References: <aEc30BoLE9HRxiZm@kernel.org>
	<CA+CK2bAAbZjS2Og79xxLcDtNf-eM0up-8fwhd4fg_dp0j_TahA@mail.gmail.com>
	<aEfGTXrsEL5-DuF1@kernel.org>
	<CA+CK2bDXOWzrTsNtbCCK2rabNysf0JFQT5VfAjYrX5oSoiLmSQ@mail.gmail.com>
	<aEhgNU80Dr9iRwoD@kernel.org>
	<CA+CK2bD3n=JDuSsMGvsyMnVbPhGdhdf6zWFDa3KpzRGEXygdgQ@mail.gmail.com>
	<mafs0qzzqo2bg.fsf@kernel.org>
	<CA+CK2bBoMfJuUCV6sL80kwzYPnENnt7fDk2jRMPV0iPn1jCJdw@mail.gmail.com>
	<aEmGMNL9v9djgrGz@kernel.org> <mafs0ikl2nzqn.fsf@kernel.org>
	<aEmUU4L3eStEsYQM@kernel.org>
Date: Fri, 13 Jun 2025 16:22:32 +0200
Message-ID: <mafs0wm9fn2l3.fsf@kernel.org>
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

> On Wed, Jun 11, 2025 at 04:01:52PM +0200, Pratyush Yadav wrote:
>> On Wed, Jun 11 2025, Mike Rapoport wrote:
>>=20
>> > On Wed, Jun 11, 2025 at 09:14:55AM -0400, Pasha Tatashin wrote:
>> >> On Wed, Jun 11, 2025 at 9:06=E2=80=AFAM Pratyush Yadav <pratyush@kern=
el.org> wrote:
>> >> >
>> >> > On Tue, Jun 10 2025, Pasha Tatashin wrote:
>> >> >
>> >> > >> > > I think it should be the other way around, KHO should depend=
 on
>> >> > >> > > !DEFERRED_STRUCT_PAGE_INIT.
>> >> > >> >
>> >> > >> > Agreed, and this is what I first tried, but that does not work=
, there
>> >> > >> > is some circular dependency breaking the build. If you feel
>> >> > >> > adventurous you can try that :-)
>> >> > >>
>> >> > >> Hmm, weird, worked for me :/
>> >> >
>> >> > Worked for me as well.
>> >> >
>> >> > >
>> >> > > I am super confused, it did not work for me over weekend, and now=
 it
>> >> > > is working. Even `make menuconfig` would not work. Anyways, I wil=
l put
>> >> > > it in the appropriate place.
>> >> > >
>> >> > >>
>> >> > >> > > > We will need to teah KHO to work with deferred struct page=
 init. I
>> >> > >> > > > suspect, we could init preserved struct pages and then ski=
p over them
>> >> > >> > > > during deferred init.
>> >> > >> > >
>> >> > >> > > We could, but with that would mean we'll run this before SMP=
 and it's not
>> >> > >> > > desirable. Also, init_deferred_page() for a random page requ=
ires
>> >> > >> >
>> >> > >> > We already run KHO init before smp_init:
>> >> > >> > start_kernel() -> mm_core_init() -> kho_memory_init() ->
>> >> > >> > kho_restore_folio() -> struct pages must be already initialize=
d here!
>> >> > >> >
>> >> > >> > While deferred struct pages are initialized:
>> >> > >> > start_kernel() -> rest_init() -> kernel_init() ->
>> >> > >> > kernel_init_freeable() -> page_alloc_init_late() ->
>> >> > >> > deferred_init_memmap()
>> >> > >> >
>> >> > >> > If the number of preserved pages that is needed during early b=
oot is
>> >> > >> > relatively small, that it should not be an issue to pre-initia=
lize
>> >> > >> > struct pages for them before deferred struct pages are initial=
ized. We
>> >> > >> > already pre-initialize some  "struct pages" that are needed du=
ring
>> >> > >> > early boot before the reset are initialized, see deferred_grow=
_zone()
>> >> > >>
>> >> > >> deferred_grow_zone() takes a chunk in the beginning of uninitial=
ized range,
>> >> > >> with kho we are talking about some random pages. If we preinit t=
hem early,
>> >> > >> deferred_init_memmap() will overwrite them.
>> >> > >
>> >> > > Yes, this is why I am saying that we would need to skip the KHO
>> >> > > initialized "struct pages" somehow during deferred initialization=
. If
>> >> > > we create an ordered by PFN list of early-initialized KHO struct
>> >> > > pages, skipping during deferred initialization could be done
>> >> > > efficiently.
>> >> >
>> >> > Or keep things simple and don't use any KHO struct pages during ear=
ly
>> >> > init. You can access the page itself, just don't use its struct pag=
e.
>> >> >
>> >> > Currently the only user of kho_restore_folio() during init is
>> >> > kho_memory_init(). The FDT is accessed by doing
>> >> > phys_to_virt(kho_in.fdt_phys) anyway, so there is really no need for
>> >> > restoring the folio so early. It can be done later, for example whe=
n LUO
>> >> > does the finish event, to clean up and free the folio.
>> >>=20
>> >> Good suggestion, however, KHO does not have any sophisticated users
>> >> that we are going to be adding as part of the live update work in the
>> >> future: IR, KVM, early VCPU threads, and so on. So, while today, this
>> >> might work, in the future, I am not sure if we should expect struct
>> >> pages are not accessed until after deferred initialization or simply
>> >> fix it once and for all.
>> >
>> > KHO already accesses stuct page early and uses page->private for order.
>> > Since preserved memory is reserved in memblock, deferred init of struct
>> > pages won't touch those pages, we just need to make sure they are prop=
erly=20
>>=20
>> Not strictly true. Some of them might have been initialized from
>> free_area_init() -> memmap_init() (the ones not eligible for deferred
>> init), which happens before KHO makes its memblock reservations.
>>=20
>> > initialized at some point. If we don't expect many kho_restore_folio()
>> > before page_alloc_init_late() we can use init_deferred_page() for early
>> > accesses.
>>=20
>> I tried doing this when looking into this initially, but it doesn't work
>> for some reason.
>>=20
>>     static void kho_restore_page(struct page *page, unsigned int order)
>>     {
>>     	unsigned int i, nr_pages =3D (1 << order);
>>=20=20=20=20=20
>>     	/* Head page gets refcount of 1. */
>>     	init_deferred_page(page_to_pfn(page), NUMA_NO_NODE);
>
>
> This would do
>
> 	if (early_page_initialised(pfn, nid))
> 		return;
>
> 	__init_page_from_nid(pfn, nid);
>
> and I'm really surprised it didn't crash in early_page_initialised()
> because of NUMA_NO_NODE :)

Oh, right. Using the wrong node completely throws
early_page_initialised() off.

>
> What might work here is=20
>
> 	pfn =3D page_to_pfn(page);
> 	__init_page_from_nid(pfn, early_pfn_to_nid(pfn));

Yep, that works. Although this would do early_pfn_to_nid() for each page
so it isn't very efficient. And we also need to make sure memblock does
not go away.

>
>>     	set_page_count(page, 1);
>>=20=20=20=20=20
>>     	/* For higher order folios, tail pages get a page count of zero. */
>>     	for (i =3D 1; i < nr_pages; i++) {
>>     		init_deferred_page(page_to_pfn(page + i), NUMA_NO_NODE);
>>     		set_page_count(page + i, 0);
>>     	}
>>=20=20=20=20=20
>>     [...]
>>=20
[...]

--=20
Regards,
Pratyush Yadav
