Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02BCF4C74;
	Thu, 26 Jun 2025 01:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750902563; cv=none; b=cm/fzMqeYGii9RUtehq4GY+YNb64+zvY4WtoAq343TOivny1jGka/N10+43SeLqU3+jQK1JSxZFgUZv9M71p38CdLEITj8Ya/83iYbLUS6vJ1zKRCvULKgPEEn4rozJg5J+vj6UiuHsTUBEx7aBR8/ayUUDK9JtVRq2ODa4lH6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750902563; c=relaxed/simple;
	bh=kZ6AMlV9WeM2pteaznTz0onKDebM7jP34kpT+4YidjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oxaJjCn4uUySRcsrEj4TVaKoBApmbyzL67Y2o8OrPq3wn8uHafuKDOrS+08VZ6HUq3/teK/yzM5VXTM2fxRFFEWGQg6O+5OrYTaNmjbcMHT3BN3ybpxWMXvL1Q2GRJw70ykOj7IrUdpfP+AXqsZOD9fcoItLX8ZdD9c5L48q0b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fifh2/mp; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fifh2/mp"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2352400344aso5513025ad.2;
        Wed, 25 Jun 2025 18:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750902561; x=1751507361; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+Nz6gceMsEAjGJ9EuhScUNZ07PGuYbVAvvgZ2k08rxc=;
        b=fifh2/mphpDDGrN6CEc5gLKQk0HdAispvzalsoZioRmIZ4t88MMrHyX0o0RS7LWtMD
         xt4tolRnummQfngmH2tu82U+QqirrtDuVM41XzpNtdyOWR8bvhTOaAsp7QuepiJokz09
         O/4G18nYmA6J59T2zEHDNoOcuSk1AHoltRLLGXgMkeq3jnoQCxproNCUqtm9Gdh/cwU6
         +QITFBr/ITBS6w+GgtgJjy+71TU5N79pfXI5b6DCBxWPeivsFAhOu5ZCa7mw1OaI/71L
         kkgJAXP56v0m84tvTtX6hasnO7Ka9t6pFLPkcajlm08vqwsT65WSizIbevcXRlrw1kzr
         Uk/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750902561; x=1751507361;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Nz6gceMsEAjGJ9EuhScUNZ07PGuYbVAvvgZ2k08rxc=;
        b=q49BSBhRZ22eau84wsBRaXCyHV69vGpVKz/ZEv0fF9NH9N8Ck2WicCToJjHqc8gkE6
         nZF1kR7jaXb2l8TTOrKho5FoBmbAVfNmrJcHztrbdy0wcXdjdDfR+PsxfxHluvx4LsDk
         za2HyI6outAJzis2aOFiSFJcR36jOwwL6T12bjuDbjak0uZV+oDgBQ7vb2bOvGZ2fDfz
         tDe72kqhOrwBZEnaLBa1+F5FK1sFWzXKOFeQVaZE7zv3Z+4AZ50HdGfVOjvrr0qWIWDu
         NGmlLzd1Tcv5pZqNUNDAdesBeM3pP7baHjaOz5Qnx8iswnZ4Yp2yFI8Q8+3w7ZQLMV6Z
         QMJA==
X-Forwarded-Encrypted: i=1; AJvYcCW9W0lIKRLQLJYL+4Lud+pn2ijlv8dpl6Lghe2YGjkKivUZ2Z9Qh7GlVOoUYYpkC1PRwbYMNY/ZRfk=@vger.kernel.org, AJvYcCWerpB9LOE87JOBbW2GgiuKY1wkl/ERJ8GW5o1fR6x4RBOBTHKEGqnCvewbvSZWjjj/LS6fIw4xpmCrYOfw@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9GoR/aIbPkQgkXY+HGr+NDx7c6dLfp1b0WJX8A7weCjk9hlCv
	kjXs1HUBlOmut6xA/JwXYBRVPZN0yFGiZp2s95n7RmAWJ20oZpKwx+jT
X-Gm-Gg: ASbGncvmKqBzZnZ7SH+QbWXAq8wzvMy6dURj8NQCmXeWDVu4zpwySQ/vgfPAddsxM3t
	JOltrCYLrlI7wNbiMlq3Bn9ENcVIOJo68g+leSHEAciWZ8X6o6fiHYcnvJVkCn0mU7FKbT5pG8B
	nUNsYBFAeFWgF4ryjGaAmljg7OBNgCmViQQCMxI6Oa1Z6PS2Jq3UZkYBYrwxhTSoHMPrKAuxh7P
	nHWu2/WXxCT3/GPzZL4n6bPLNVcwgUe/mSfTiP1Uy+fx75m8VaKduqx5US0bbUgDwiwPBVYCE5+
	KZXYW72K6jBHxXk8jMB7fK3hmrQXCB3qLNyuPoFFP7jECTOOxM+ffY4cXEywuQ==
X-Google-Smtp-Source: AGHT+IHXr54nVYRwcPKxGrk70SCFElkQ98A/GfmX+sR0hW3/0w1cdSyA/LFCaOPKMrHSSlSRW5YyxQ==
X-Received: by 2002:a17:902:d492:b0:224:76f:9e4a with SMTP id d9443c01a7336-238c8725bcfmr18693275ad.14.1750902561243;
        Wed, 25 Jun 2025 18:49:21 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8393292sm143565065ad.13.2025.06.25.18.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 18:49:20 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 1E7A0420A9A6; Thu, 26 Jun 2025 08:49:17 +0700 (WIB)
Date: Thu, 26 Jun 2025 08:49:17 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Petr Tesarik <ptesarik@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Morton <akpm@linux-foundation.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Leon Romanovsky <leon@kernel.org>, Keith Busch <kbusch@kernel.org>,
	Caleb Sander Mateos <csander@purestorage.com>,
	Sagi Grimberg <sagi@grimberg.me>, Jens Axboe <axboe@kernel.dk>,
	John Garry <john.g.garry@oracle.com>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>
Subject: Re: [PATCH 7/8] docs: dma-api: update streaming DMA API physical
 address constraints
Message-ID: <aFynHWAYtKPFT55P@archie.me>
References: <20250624133923.1140421-1-ptesarik@suse.com>
 <20250624133923.1140421-8-ptesarik@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uuwR7Yn/uQf6oyy6"
Content-Disposition: inline
In-Reply-To: <20250624133923.1140421-8-ptesarik@suse.com>


--uuwR7Yn/uQf6oyy6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 03:39:22PM +0200, Petr Tesarik wrote:
> diff --git a/Documentation/core-api/dma-api.rst b/Documentation/core-api/=
dma-api.rst
> index cd432996949c..65132ec88104 100644
> --- a/Documentation/core-api/dma-api.rst
> +++ b/Documentation/core-api/dma-api.rst
> @@ -210,18 +210,12 @@ DMA_BIDIRECTIONAL	direction isn't known
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
> +	Mapping may also fail if the memory is not within the DMA mask of the
> +	device.  However, this constraint does not apply if the platform has
> +	an IOMMU (a device which maps an I/O DMA address to a physical memory
> +	address), or the kernel is configured with SWIOTLB (bounce buffers).
> +	It is reasonable to assume that at least one of these mechanisms
> +	allows streaming DMA to any physical address.
> =20
>  .. warning::
> =20

LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--uuwR7Yn/uQf6oyy6
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaFynHQAKCRD2uYlJVVFO
owLhAPwNWaolM6tIUBgUQIggjkqtrYfI7Vp3IWaC9LRBQIbVqQEA882rDH9Q47Ao
rabejogHBB+Mow82kYXL+8TfZ0CCfgE=
=bn24
-----END PGP SIGNATURE-----

--uuwR7Yn/uQf6oyy6--
