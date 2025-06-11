Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A885D286425
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 13:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749647174; cv=none; b=VMlegYI1yi/c8OmADdQ8+6YIgKtgvRx6iuApZyWW9pWIyCz7C2AVwuv5nr8UuUb1eyQh2tGOtQEWsZsKN19N7vYqEs1k3MFdMIGJKwvRMw0NxgF6aNx6OajybnLoDBQSBOySbZm9LKq3SD3ScuIKDctRNEo9Ud+koHmqAgjo/e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749647174; c=relaxed/simple;
	bh=EfalNR3PDNY/xJp/lHBiYvQkpmXJrUDUdS4YWf1xllw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TMvZIRFLhvNj8pw0gNf38CUfiJnenOLMZX2amtLVrCS7yXIWudMlJqQ+z+iN2HBNMPs8hZmbAJ2cL2Wyorxmc72RZC2+Lhi3RR6KU28km5/fw5X2nC27zAjbr7yVMEaOl200zmHy6MzWvmGArmnTOJ/XHJULE6eaabNa5g/EFMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HCRACyj6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HCRACyj6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64DD7C4CEF3;
	Wed, 11 Jun 2025 13:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749647174;
	bh=EfalNR3PDNY/xJp/lHBiYvQkpmXJrUDUdS4YWf1xllw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=HCRACyj6aEf4dnGcjywhOK8Dl8sqsXVP98Sc28D6Vp3FdXAV1yR8nV7lw2Xq0QAja
	 c6XYzCpzNS9ZFn8vfO17Ils8afPFrQjRDJXDzqot8B9PG3JQb4nilR51/eSfoqQUq8
	 jzcBKaxoeIIM1oA10ODttFxBYr4CemZQf6p9Lz7O1K8xe4G8fD9GAZ06+9yXs4ef3d
	 +jxsMLVjlRmum5eD0qYmY17wDTvTRk4A2aBbqdatoIzxv2aWO6PetwCTbTJCij1mWW
	 p/Z7phbdkdGWYVoQmMXufNhW8KqgKu+xksURZLd3BmCVgGanofNMM1Lmtv4iJTBsEA
	 /REcd+UZGNI2A==
From: Pratyush Yadav <pratyush@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Mike Rapoport <rppt@kernel.org>,  Pratyush Yadav <pratyush@kernel.org>,
  Alexander Graf <graf@amazon.com>,  Changyuan Lyu <changyuanl@google.com>,
  Andrew Morton <akpm@linux-foundation.org>,  Baoquan He <bhe@redhat.com>,
  kexec@lists.infradead.org,  linux-kernel@vger.kernel.org,
  linux-mm@kvack.org,  Michal Clapinski <mclapinski@google.com>
Subject: Re: [PATCH] kho: initialize tail pages for higher order folios
 properly
In-Reply-To: <CA+CK2bD3n=JDuSsMGvsyMnVbPhGdhdf6zWFDa3KpzRGEXygdgQ@mail.gmail.com>
References: <20250605171143.76963-1-pratyush@kernel.org>
	<aEKhF3HcrvG77Ogb@kernel.org> <mafs0jz5osutx.fsf@kernel.org>
	<aEc30BoLE9HRxiZm@kernel.org>
	<CA+CK2bAAbZjS2Og79xxLcDtNf-eM0up-8fwhd4fg_dp0j_TahA@mail.gmail.com>
	<aEfGTXrsEL5-DuF1@kernel.org>
	<CA+CK2bDXOWzrTsNtbCCK2rabNysf0JFQT5VfAjYrX5oSoiLmSQ@mail.gmail.com>
	<aEhgNU80Dr9iRwoD@kernel.org>
	<CA+CK2bD3n=JDuSsMGvsyMnVbPhGdhdf6zWFDa3KpzRGEXygdgQ@mail.gmail.com>
Date: Wed, 11 Jun 2025 15:06:11 +0200
Message-ID: <mafs0qzzqo2bg.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Jun 10 2025, Pasha Tatashin wrote:

>> > > I think it should be the other way around, KHO should depend on
>> > > !DEFERRED_STRUCT_PAGE_INIT.
>> >
>> > Agreed, and this is what I first tried, but that does not work, there
>> > is some circular dependency breaking the build. If you feel
>> > adventurous you can try that :-)
>>
>> Hmm, weird, worked for me :/

Worked for me as well.

>
> I am super confused, it did not work for me over weekend, and now it
> is working. Even `make menuconfig` would not work. Anyways, I will put
> it in the appropriate place.
>
>>
>> > > > We will need to teah KHO to work with deferred struct page init. I
>> > > > suspect, we could init preserved struct pages and then skip over them
>> > > > during deferred init.
>> > >
>> > > We could, but with that would mean we'll run this before SMP and it's not
>> > > desirable. Also, init_deferred_page() for a random page requires
>> >
>> > We already run KHO init before smp_init:
>> > start_kernel() -> mm_core_init() -> kho_memory_init() ->
>> > kho_restore_folio() -> struct pages must be already initialized here!
>> >
>> > While deferred struct pages are initialized:
>> > start_kernel() -> rest_init() -> kernel_init() ->
>> > kernel_init_freeable() -> page_alloc_init_late() ->
>> > deferred_init_memmap()
>> >
>> > If the number of preserved pages that is needed during early boot is
>> > relatively small, that it should not be an issue to pre-initialize
>> > struct pages for them before deferred struct pages are initialized. We
>> > already pre-initialize some  "struct pages" that are needed during
>> > early boot before the reset are initialized, see deferred_grow_zone()
>>
>> deferred_grow_zone() takes a chunk in the beginning of uninitialized range,
>> with kho we are talking about some random pages. If we preinit them early,
>> deferred_init_memmap() will overwrite them.
>
> Yes, this is why I am saying that we would need to skip the KHO
> initialized "struct pages" somehow during deferred initialization. If
> we create an ordered by PFN list of early-initialized KHO struct
> pages, skipping during deferred initialization could be done
> efficiently.

Or keep things simple and don't use any KHO struct pages during early
init. You can access the page itself, just don't use its struct page.

Currently the only user of kho_restore_folio() during init is
kho_memory_init(). The FDT is accessed by doing
phys_to_virt(kho_in.fdt_phys) anyway, so there is really no need for
restoring the folio so early. It can be done later, for example when LUO
does the finish event, to clean up and free the folio.

-- 
Regards,
Pratyush Yadav
