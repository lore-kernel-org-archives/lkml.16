Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A093D69;
	Mon, 30 Jun 2025 01:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751247146; cv=none; b=Y6dWhGeCYP7LcYvjGvaXV6TjTvFCnQvsP3spBrgd7yD2JuWibz1oCtJ0sdCH95k88juxJGN9HR21Wf36ytI/1Uz5Q03BbBdKQBhOme3NFOCXC9Ak5V0sSMmlkOriinosNf6yAIRpDKOSASZRS2gCqj+Q8LM6LdYl5zOB2+kmUcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751247146; c=relaxed/simple;
	bh=PdbmSrnBaljKSjVuz2OmgriJvaxALYThsxW+O8GzZqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HMw0p+B3fc5hf80w1W27BMsFrcUEOiE/T7bP49A+2u23qwJf8SzrcatzoEqhm4Sz4BtHbOierwC6HNq7vahIXCphqPQJhI0cAYg4SietWFtfiabmaYnSoOTfik7kIVsa9zoTV0QE7Dl4llQMbkblAkPBY6bNc4XbS2QE1Uyjiyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KnozMG6E; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KnozMG6E"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3139027b825so892696a91.0;
        Sun, 29 Jun 2025 18:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751247145; x=1751851945; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Gwxo+Mz3IvrzaosTpE+nrtogxa++aPCEgx5JYVoi1DE=;
        b=KnozMG6Egt8WY3dIL0wXRy/MwwpoKYAwBMYqhs8N9iyGKee8JXHOZjJbrgO5+ataf9
         nhSGF1oMSKxdTrpKNxOG0PCgqtOmx/r2wurLg2jFwMz22Ds03J34rToaTJVYhvpWjrOQ
         h69akDLK6bgCEAfj5Hx4ESzsHSMMMEH82fFwiozOKLyx8c/oRzgQZkVwqgnPy+wyesIE
         dZOL0fmGB2Azsh1zDUNBp8Ay4OZruvZxtf8Qcl3yfIoGrfjGcKfIixiXxgvrtGW2nY8L
         o7YpkpTpT5R9gyyrktXfFtL98fZQ+0cm+LRdlWViS0Rs32cyYOlDs641cEb1szvcT3k7
         AC0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751247145; x=1751851945;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gwxo+Mz3IvrzaosTpE+nrtogxa++aPCEgx5JYVoi1DE=;
        b=OhQv9442suVhdn/YS+dLCdKufPo/4rfj5sgDWhgcBQuYBZfnGtbdSlgLwPYP80BwjQ
         GQHGkaSgyHZk3PaKrLpCHenEZabEJU90E7XRH4xWmNJPDdfmLU8k8mViO9v0LrwarRVD
         ONfdkWVpKAdG01AsRjqLsHIFwvZ98YJl25N1l2BOaeGmt3QGnfmnZHsT9dGe4g/EukZe
         M5WjoOwcqPQZYK0YF0T25j8n0hjeZElDJ8E9F3EnxEYFscG8P9z8khI5lgqwarRYqQK0
         cryGOehj3WxjVXm2cMk2fNKtA1taTem5VVbQfAFPasX4JhQLwkw1A5adESIbCN65koSY
         fFNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGtncTGdRjeT2Pow3eJjAlYsJ3w7aITng2P8476b8pFmZ0W/58pbbFXMOb2ZnKmJ7LAfo6N4Pk4rmzPcUc@vger.kernel.org, AJvYcCVmUpI1E2Bnz0kF2Ol2i9jXk5AWTUTLFU2uVPBCeVB6XpbLNMDGm8/Cwf4Mmxygu4H//uNajfmLmtw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz44YJ+OxdTGgPLuNhvbrD/I9OKkK+w75WRRjWuntnxibrDUExB
	Q8+u2URPWkvGj506Jim0011OnrHrZT0yEDfW6yAGr77SQb+6JC0nSWY9
X-Gm-Gg: ASbGnctjXWcfmsEOoeqlun0zvIEVa27ID9Rxp9cQ64dg3A8ALuhQvbKy1nRWt/HpBxQ
	zVefv3T7ElVdNiiY/7lg83UnoHwkC8u75/10aNsfmIr4Mh+RXzz/DlG//uN6yyk7GroqGMPOpp7
	i1MAsS1D+u2J1WCjPRZABcK22kx3CRUCDdPj9qkmjk2nYYGLavDwvmvxus+WAxQkZNLm9Ze6rTG
	pVjyZGeHYrFkdu5BaNRyhEJzXh4uZcI7LhP0I2idXuKH0CmpzPLIH+qf5lo7KtL2rVM+EjrhaN4
	+K4PuJtjiMoq3F7bXxnwNvgjCDy5ojUF8PnRKMj1aptmM8fprWFDLEdkk7GsF9fYw7pycg6O
X-Google-Smtp-Source: AGHT+IFZCO9JUwt3uc3yB0stvOczNjE1Z46dM+SWxPKuf+S1ol8ZiAtkuzHavPc/X4mafB35eylK+Q==
X-Received: by 2002:a17:90b:1dd2:b0:311:b0ec:1360 with SMTP id 98e67ed59e1d1-318c92f26abmr15843348a91.29.1751247144552;
        Sun, 29 Jun 2025 18:32:24 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315edcfd75dsm3332769a91.1.2025.06.29.18.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 18:32:23 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 951B5420A813; Mon, 30 Jun 2025 08:32:18 +0700 (WIB)
Date: Mon, 30 Jun 2025 08:32:18 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Petr Tesarik <ptesarik@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>,
	iommu@lists.linux.dev
Subject: Re: [PATCH v2 7/8] docs: dma-api: update streaming DMA physical
 address constraints
Message-ID: <aGHpIiKWDr0T-FLN@archie.me>
References: <20250627101015.1600042-1-ptesarik@suse.com>
 <20250627101015.1600042-8-ptesarik@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HrIK/LW9hGVtLpKi"
Content-Disposition: inline
In-Reply-To: <20250627101015.1600042-8-ptesarik@suse.com>


--HrIK/LW9hGVtLpKi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 27, 2025 at 12:10:14PM +0200, Petr Tesarik wrote:
> diff --git a/Documentation/core-api/dma-api.rst b/Documentation/core-api/=
dma-api.rst
> index 9fcdb160638e0..a075550ebbb54 100644
> --- a/Documentation/core-api/dma-api.rst
> +++ b/Documentation/core-api/dma-api.rst
> @@ -184,6 +184,26 @@ segments, the function returns 0.
>  Part Id - Streaming DMA mappings
>  --------------------------------
> =20
> +Streaming DMA allows to map an existing buffer for DMA transfers and then
> +unmap it when finished.  Map functions are not guaranteed to succeed, so=
 the
> +return value must be checked.
> +
> +.. note::
> +
> +	In particular, mapping may fail for memory not addressable by the
> +	device, e.g. if it is not within the DMA mask of the device and/or a
> +	connecting bus bridge.  Streaming DMA functions try to overcome such
> +	addressing constraints, either by using an IOMMU (a device which maps
> +	I/O DMA addresses to physical memory addresses), or by copying the
> +	data to/from a bounce buffer if the kernel is configured with a
> +	:doc:`SWIOTLB <swiotlb>`.  However, these methods are not always
> +	available, and even if they are, they may still fail for a number of
> +	reasons.
> +
> +	In short, a device driver may need to be wary of where buffers are
> +	located in physical memory, especially if the DMA mask is less than 32
> +	bits.
> +
>  ::
> =20
>  	dma_addr_t
> @@ -204,27 +224,13 @@ DMA_BIDIRECTIONAL	direction isn't known
> =20
>  .. note::
> =20
> -	Not all memory regions in a machine can be mapped by this API.
> -	Further, contiguous kernel virtual space may not be contiguous as
> +	Contiguous kernel virtual space may not be contiguous as
>  	physical memory.  Since this API does not provide any scatter/gather
>  	capability, it will fail if the user tries to map a non-physically
>  	contiguous piece of memory.  For this reason, memory to be mapped by
>  	this API should be obtained from sources which guarantee it to be
>  	physically contiguous (like kmalloc).
> =20
> -	Further, the DMA address of the memory must be within the dma_mask of
> -	the device.  To ensure that the memory allocated by kmalloc is within
> -	the dma_mask, the driver may specify various platform-dependent flags
> -	to restrict the DMA address range of the allocation (e.g., on x86,
> -	GFP_DMA guarantees to be within the first 16MB of available DMA
> -	addresses, as required by ISA devices).
> -
> -	Note also that the above constraints on physical contiguity and
> -	dma_mask may not apply if the platform has an IOMMU (a device which
> -	maps an I/O DMA address to a physical memory address).  However, to be
> -	portable, device driver writers may *not* assume that such an IOMMU
> -	exists.
> -
>  .. warning::
> =20
>  	Memory coherency operates at a granularity called the cache

The wording looks good, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--HrIK/LW9hGVtLpKi
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaGHpHQAKCRD2uYlJVVFO
o7BTAQD2guhFoVk0F3IFsbTS/6Ol/17jQ8zJ8Y1DrFSsn2CrUgD8ChTz5+jY2xNj
g3nM93NHjiM4P2S06XM2BOx7i7nPXgc=
=aOWE
-----END PGP SIGNATURE-----

--HrIK/LW9hGVtLpKi--
