Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6938E28F1
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 13:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749649124; cv=none; b=iRtz9ddfh6mvVTNVMHw7T2l0t0vEWmyqjAlcrADH/aW3JBFDZ0SA1taETlUH9ZrmLMa/jgoC7Z2rL736IdAUJbS8oe5K9BGzFOv6ueXQidZPBRE1RrH6c0LcD1ZhN35oObqczC3cWfkQUP832RJhqZqOHbbdEyBfIfUrQ9RYtD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749649124; c=relaxed/simple;
	bh=ApP+He8rbDgY3eull1tpS3JNL84wa6c46rgsr+2B2rI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=pQe7HVtdzbjPvrKRvUe4QprwK8qvuPBWobjX+dapym1x+gqjOq6uW0RwFwBuQ1mRgXxjtIftvRfY8r0BVyqWSEjHHpi3uSaqJCytq0lktNAlZmVsW6C6mYgPeazl8XQOERapRGdUO/6jTU/ufe4wWUexjgMaetSN2cF5YoMUP44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H3/0dNW+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H3/0dNW+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B8E5C4CEEE;
	Wed, 11 Jun 2025 13:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749649123;
	bh=ApP+He8rbDgY3eull1tpS3JNL84wa6c46rgsr+2B2rI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=H3/0dNW+kMGwcGMHzgalbsTXgIMCO2rpJ0js9L+r0AThN/s0Eyx4qH+i17Kd4dl3F
	 qxBriuvT1ZnnD00+VWINeYWuC3MtvOwVf2fxao9E6cps2zCYCB/h4MXBozMab3NUEy
	 uHKXJKjo3HPfm+dOf1Rb4cjsWvIK29aW5bR+pjLvMZv+iSL6871EgZj1odwsQnbUOM
	 AJbYohWEZceQJotFEgGY8JrKBTx8UeaYh8Q51p+FJ7c6P1E/cw0dJCNHsyqQVsMYaJ
	 Knk1gpQRSORDWJPwkkVDgYME3NsaVSNIwK2K6TUzcKHlFCtzKGOzPEz/2scBaHfqpd
	 gn/6dHrCoAAAQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Mike Rapoport <rppt@kernel.org>,
  Alexander Graf <graf@amazon.com>,  Changyuan Lyu <changyuanl@google.com>,
  Andrew Morton <akpm@linux-foundation.org>,  Baoquan He <bhe@redhat.com>,
  kexec@lists.infradead.org,  linux-kernel@vger.kernel.org,
  linux-mm@kvack.org,  Michal Clapinski <mclapinski@google.com>
Subject: Re: [PATCH] kho: initialize tail pages for higher order folios
 properly
In-Reply-To: <CA+CK2bBoMfJuUCV6sL80kwzYPnENnt7fDk2jRMPV0iPn1jCJdw@mail.gmail.com>
References: <20250605171143.76963-1-pratyush@kernel.org>
	<aEKhF3HcrvG77Ogb@kernel.org> <mafs0jz5osutx.fsf@kernel.org>
	<aEc30BoLE9HRxiZm@kernel.org>
	<CA+CK2bAAbZjS2Og79xxLcDtNf-eM0up-8fwhd4fg_dp0j_TahA@mail.gmail.com>
	<aEfGTXrsEL5-DuF1@kernel.org>
	<CA+CK2bDXOWzrTsNtbCCK2rabNysf0JFQT5VfAjYrX5oSoiLmSQ@mail.gmail.com>
	<aEhgNU80Dr9iRwoD@kernel.org>
	<CA+CK2bD3n=JDuSsMGvsyMnVbPhGdhdf6zWFDa3KpzRGEXygdgQ@mail.gmail.com>
	<mafs0qzzqo2bg.fsf@kernel.org>
	<CA+CK2bBoMfJuUCV6sL80kwzYPnENnt7fDk2jRMPV0iPn1jCJdw@mail.gmail.com>
Date: Wed, 11 Jun 2025 15:38:40 +0200
Message-ID: <mafs0msaeo0tb.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11 2025, Pasha Tatashin wrote:

> On Wed, Jun 11, 2025 at 9:06=E2=80=AFAM Pratyush Yadav <pratyush@kernel.o=
rg> wrote:
>>
>> On Tue, Jun 10 2025, Pasha Tatashin wrote:
[...]
>> >> > > We could, but with that would mean we'll run this before SMP and =
it's not
>> >> > > desirable. Also, init_deferred_page() for a random page requires
>> >> >
>> >> > We already run KHO init before smp_init:
>> >> > start_kernel() -> mm_core_init() -> kho_memory_init() ->
>> >> > kho_restore_folio() -> struct pages must be already initialized her=
e!
>> >> >
>> >> > While deferred struct pages are initialized:
>> >> > start_kernel() -> rest_init() -> kernel_init() ->
>> >> > kernel_init_freeable() -> page_alloc_init_late() ->
>> >> > deferred_init_memmap()
>> >> >
>> >> > If the number of preserved pages that is needed during early boot is
>> >> > relatively small, that it should not be an issue to pre-initialize
>> >> > struct pages for them before deferred struct pages are initialized.=
 We
>> >> > already pre-initialize some  "struct pages" that are needed during
>> >> > early boot before the reset are initialized, see deferred_grow_zone=
()
>> >>
>> >> deferred_grow_zone() takes a chunk in the beginning of uninitialized =
range,
>> >> with kho we are talking about some random pages. If we preinit them e=
arly,
>> >> deferred_init_memmap() will overwrite them.
>> >
>> > Yes, this is why I am saying that we would need to skip the KHO
>> > initialized "struct pages" somehow during deferred initialization. If
>> > we create an ordered by PFN list of early-initialized KHO struct
>> > pages, skipping during deferred initialization could be done
>> > efficiently.
>>
>> Or keep things simple and don't use any KHO struct pages during early
>> init. You can access the page itself, just don't use its struct page.
>>
>> Currently the only user of kho_restore_folio() during init is
>> kho_memory_init(). The FDT is accessed by doing
>> phys_to_virt(kho_in.fdt_phys) anyway, so there is really no need for
>> restoring the folio so early. It can be done later, for example when LUO
>> does the finish event, to clean up and free the folio.
>
> Good suggestion, however, KHO does not have any sophisticated users
> that we are going to be adding as part of the live update work in the
> future: IR, KVM, early VCPU threads, and so on. So, while today, this
> might work, in the future, I am not sure if we should expect struct
> pages are not accessed until after deferred initialization or simply
> fix it once and for all.

Right. We might end up needing it down the line. But from a quick look,
it doesn't seem to be trivial to solve, so IMO we should solve it when
those use cases actually show up, and keep things simple for now.

--=20
Regards,
Pratyush Yadav
