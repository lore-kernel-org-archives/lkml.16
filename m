Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3681DFF8;
	Wed,  4 Jun 2025 15:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749049231; cv=none; b=qdrjw6o0dQe7DUfa2utQcPuk87XV3fWcrfrEcTnhp43NO94IoUJKYjY+NXwkRaPfGSYYswoVqBBMzVIS+bxESfhvbgVkqzrJPdyCFkAxeYjCOe675wD6KGsr0EhxnCubM/P0NM2RFVWlel5s/pEJ+16KlU9lUq7VGg9TenUZbkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749049231; c=relaxed/simple;
	bh=tFfAHcuK1W9KZi2uebnSCQzC+lwDGxGFdWFkTKf2Z6I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hL0bLMMnQmtONhOdr7FIiR3+b8m4k6KIcFm6ONNQfJgBbGlWi0hIJmwRwNoB5SrVXj5sj7PhKI9HEkFUxD/nKLfGGBJynyHQcWwDGC41EpUBH/GtSoCrV7hLaMw64Vr++npoEcX3l4w0qGm7N1GiO+ZG7yvqXUhAOlRQH1rmkGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SBlukFFj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SBlukFFj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9152C4CEE4;
	Wed,  4 Jun 2025 15:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749049231;
	bh=tFfAHcuK1W9KZi2uebnSCQzC+lwDGxGFdWFkTKf2Z6I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=SBlukFFjpJ1mIv0NLRqQpI74YVsrOObNpomOPkCc7NlBRH9jGWvdX3wC8Nt1z6JtB
	 gJ0+N1rihS2+NMjjNr6bNhfxulu4wiJIKPMzh6MVjsPPECsidDpjepDyLS1X8Qleys
	 9iQHhQuYQ4odYKySw2Bkt+ywB5ctGUYHtedjp/LOpmmUsUS8RyjSmNIO5Jou+Itspd
	 aGNeZbJ+8bIAhIB8bySQlr8eZYenT3OvlZllsBm9bI3D53D/NnaVNbnjOqMciBQ5Z0
	 B/UewvPiREBuKskP2z5+L++/1X++z4Nowo0ZKRpIabW0pxcBum+1PqpqOcr2yh1j4q
	 UrqicyP2DUbeQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: pratyush@kernel.org,  jasonmiu@google.com,  graf@amazon.com,
  changyuanl@google.com,  rppt@kernel.org,  dmatlack@google.com,
  rientjes@google.com,  corbet@lwn.net,  rdunlap@infradead.org,
  ilpo.jarvinen@linux.intel.com,  kanie@linux.alibaba.com,
  ojeda@kernel.org,  aliceryhl@google.com,  masahiroy@kernel.org,
  akpm@linux-foundation.org,  tj@kernel.org,  yoann.congal@smile.fr,
  mmaurer@google.com,  roman.gushchin@linux.dev,  chenridong@huawei.com,
  axboe@kernel.dk,  mark.rutland@arm.com,  jannh@google.com,
  vincent.guittot@linaro.org,  hannes@cmpxchg.org,
  dan.j.williams@intel.com,  david@redhat.com,  joel.granados@kernel.org,
  rostedt@goodmis.org,  anna.schumaker@oracle.com,  song@kernel.org,
  zhangguopeng@kylinos.cn,  linux@weissschuh.net,
  linux-kernel@vger.kernel.org,  linux-doc@vger.kernel.org,
  linux-mm@kvack.org,  gregkh@linuxfoundation.org,  tglx@linutronix.de,
  mingo@redhat.com,  bp@alien8.de,  dave.hansen@linux.intel.com,
  x86@kernel.org,  hpa@zytor.com,  rafael@kernel.org,  dakr@kernel.org,
  bartosz.golaszewski@linaro.org,  cw00.choi@samsung.com,
  myungjoo.ham@samsung.com,  yesanishhere@gmail.com,
  Jonathan.Cameron@huawei.com,  quic_zijuhu@quicinc.com,
  aleksander.lobakin@intel.com,  ira.weiny@intel.com,
  andriy.shevchenko@linux.intel.com,  leon@kernel.org,  lukas@wunner.de,
  bhelgaas@google.com,  wagi@kernel.org,  djeffery@redhat.com,
  stuart.w.hayes@gmail.com
Subject: Re: [RFC v2 03/16] kho: add kho_unpreserve_folio/phys
In-Reply-To: <20250515182322.117840-4-pasha.tatashin@soleen.com>
References: <20250515182322.117840-1-pasha.tatashin@soleen.com>
	<20250515182322.117840-4-pasha.tatashin@soleen.com>
Date: Wed, 04 Jun 2025 17:00:22 +0200
Message-ID: <mafs05xhbv9fd.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, May 15 2025, Pasha Tatashin wrote:

> From: Changyuan Lyu <changyuanl@google.com>
>
> Allow users of KHO to cancel the previous preservation by adding the
> necessary interfaces to unpreserve folio.
>
> Signed-off-by: Changyuan Lyu <changyuanl@google.com>
> Co-developed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> ---
>  include/linux/kexec_handover.h | 12 +++++
>  kernel/kexec_handover.c        | 84 ++++++++++++++++++++++++++++------
>  2 files changed, 83 insertions(+), 13 deletions(-)
>
[...]
> diff --git a/kernel/kexec_handover.c b/kernel/kexec_handover.c
> index 8ff561e36a87..eb305e7e6129 100644
> --- a/kernel/kexec_handover.c
> +++ b/kernel/kexec_handover.c
> @@ -101,26 +101,33 @@ static void *xa_load_or_alloc(struct xarray *xa, unsigned long index, size_t sz)
>  	return elm;
>  }
>  
> -static void __kho_unpreserve(struct kho_mem_track *track, unsigned long pfn,
> -			     unsigned long end_pfn)
> +static void __kho_unpreserve_order(struct kho_mem_track *track, unsigned long pfn,
> +				   unsigned int order)
>  {
>  	struct kho_mem_phys_bits *bits;
>  	struct kho_mem_phys *physxa;
> +	const unsigned long pfn_high = pfn >> order;
>  
> -	while (pfn < end_pfn) {
> -		const unsigned int order =
> -			min(count_trailing_zeros(pfn), ilog2(end_pfn - pfn));
> -		const unsigned long pfn_high = pfn >> order;
> +	physxa = xa_load(&track->orders, order);
> +	if (!physxa)
> +		return;
>  
> -		physxa = xa_load(&track->orders, order);
> -		if (!physxa)
> -			continue;
> +	bits = xa_load(&physxa->phys_bits, pfn_high / PRESERVE_BITS);
> +	if (!bits)
> +		return;
>  
> -		bits = xa_load(&physxa->phys_bits, pfn_high / PRESERVE_BITS);
> -		if (!bits)
> -			continue;
> +	clear_bit(pfn_high % PRESERVE_BITS, bits->preserve);
> +}
>  
> -		clear_bit(pfn_high % PRESERVE_BITS, bits->preserve);
> +static void __kho_unpreserve(struct kho_mem_track *track, unsigned long pfn,
> +			     unsigned long end_pfn)
> +{
> +	unsigned int order;
> +
> +	while (pfn < end_pfn) {
> +		order = min(count_trailing_zeros(pfn), ilog2(end_pfn - pfn));

This is fragile. If the preserve call spans say 4 PFNs, then it gets
preserved as a order 2 allocation, but if the PFNs are unpreserved
one-by-one, __kho_unpreserve_order() will unpreserve from the order 0
xarray, which will end up doing nothing, leaking those pages.

It should either look through all orders to find the PFN, or at least
have a requirement in the API that the same phys and size combination as
the preserve call must be given to unpreserve.

> +
> +		__kho_unpreserve_order(track, pfn, order);
>  
>  		pfn += 1 << order;
>  	}
> @@ -607,6 +614,29 @@ int kho_preserve_folio(struct folio *folio)
>  }
>  EXPORT_SYMBOL_GPL(kho_preserve_folio);
>  
> +/**
> + * kho_unpreserve_folio - unpreserve a folio.
> + * @folio: folio to unpreserve.
> + *
> + * Instructs KHO to unpreserve a folio that was preserved by
> + * kho_preserve_folio() before.
> + *
> + * Return: 0 on success, error code on failure
> + */
> +int kho_unpreserve_folio(struct folio *folio)
> +{
> +	const unsigned long pfn = folio_pfn(folio);
> +	const unsigned int order = folio_order(folio);
> +	struct kho_mem_track *track = &kho_out.ser.track;
> +
> +	if (kho_out.finalized)
> +		return -EBUSY;
> +
> +	__kho_unpreserve_order(track, pfn, order);
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(kho_unpreserve_folio);
> +
>  /**
>   * kho_preserve_phys - preserve a physically contiguous range across kexec.
>   * @phys: physical address of the range.
> @@ -652,6 +682,34 @@ int kho_preserve_phys(phys_addr_t phys, size_t size)
>  }
>  EXPORT_SYMBOL_GPL(kho_preserve_phys);
>  
> +/**
> + * kho_unpreserve_phys - unpreserve a physically contiguous range across kexec.
> + * @phys: physical address of the range.
> + * @size: size of the range.
> + *
> + * Instructs KHO to unpreserve the memory range from @phys to @phys + @size
> + * across kexec.
> + *
> + * Return: 0 on success, error code on failure
> + */
> +int kho_unpreserve_phys(phys_addr_t phys, size_t size)
> +{
> +	struct kho_mem_track *track = &kho_out.ser.track;
> +	unsigned long pfn = PHYS_PFN(phys);
> +	unsigned long end_pfn = PHYS_PFN(phys + size);
> +
> +	if (kho_out.finalized)
> +		return -EBUSY;
> +
> +	if (!PAGE_ALIGNED(phys) || !PAGE_ALIGNED(size))
> +		return -EINVAL;
> +
> +	__kho_unpreserve(track, pfn, end_pfn);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(kho_unpreserve_phys);
> +
>  int __kho_abort(void)
>  {
>  	int err;

-- 
Regards,
Pratyush Yadav
