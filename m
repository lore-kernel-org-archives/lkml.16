Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265104C74;
	Thu, 26 Jun 2025 01:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750902472; cv=none; b=lA+2JqPpEFBDvROdPGx8LgUHd6UhlVS+ePQ5bxwx4Iik8kTX6Ws+vPWGHxfWsracGXdaD1NZ7HOnm1QjGCRgIiB3292HdPFZY7eFI3cfFBXYdhpF+TNdWEhjkfW38SEP20k8aJQpID7F5xdl1x+rFBUqXZgB+bCOexbdTmCHpnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750902472; c=relaxed/simple;
	bh=yse0S93gaz/snfwu4NSc3Kiq0itbOcpq8FTI+UMzEGw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pqYJAF3fgilA5Q4t2Dv/TSXt4z7+Lalfxtu9JJV9/XOEx1BnHbC4VlGcm8bzUY7FHbhrYOb5R+t/99owHrN6E85cxcLQoJthD6YpEMxLuqRpIipi7Nmvi87LXyL94PbWslnkF2UnMzFxRP2Fbf/DafEKTwpelqlsR7SE0o4Qj0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MZLOf9VF; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MZLOf9VF"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-23633a6ac50so7223555ad.2;
        Wed, 25 Jun 2025 18:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750902470; x=1751507270; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oeEe2xDl4J3QKXU3s6+5yOfkNnMzI/iOfTI3SJ90Emg=;
        b=MZLOf9VFd9rOveuErKsiiJQjHco/o8SfetDSdY9Yi1/yuf/B/g+5QgIY4ZCrmuuwGB
         K/XrwymHwRHfy3fyDR3GEnk+WRGP1L4ULGs4NK2PVVyb713y0hu6b8CpKw3aeto/+BPn
         Z5Ku5cSujr+db70OOGmfwsTdUfk+RJ3gL21Rs7xR55X3F4FeNMTsP2PSAMrVCt5XV8oD
         143JIwf5h/lZudJGGCVq0EM/dxQzUrmWUgqOelCBOq5DzdgWWJkE9rbGd3P/zEbkObMl
         9MTyVP38TpVOQpXTwoh2CLj7xD7xKnIQcVpxKje304nphFR0VkSxA2uVQrzCyJ/Zy5mD
         glWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750902470; x=1751507270;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oeEe2xDl4J3QKXU3s6+5yOfkNnMzI/iOfTI3SJ90Emg=;
        b=ALUPe93MtgaamxKrPZtlJ8oueZ4PC5sPgEIgStkozlS1Exs9npjheZBvf141ptpLu6
         5L8BCHsNwn4W3o1jIzc8WBLQrrbTg9BKiyxuJiWp6fz9fYy8TS3YA4bKzvIjSbkGkO/s
         xgD8Iy1SdAFMYla4lS0LOH6kD9w5DnjfUr/xi7cuRtAT335/DRG7FyFtUUwCi0y70ZgV
         ji6tTYKNeesOqfnuf13TdA4TYE5aw5UYh33/9hss08SOsHdZC0RKKbkBZ6m9ivSN8EkU
         0oybtv/QyzFnd8Lpw9cCPG39bJqxy2uPfkvFrChZAsQkfRzW5XlozCfSpWsGp9Twu3sT
         iAZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhxRnqy0EFk+wFRmWNktjcMLj1J5IrM4is2aB7T+8r0nIui5dt76thTNu1aHbSKXtGtjavJ735rQs=@vger.kernel.org, AJvYcCWnR1SbHwHF0jBlI9NiQHQMrwxliucL6BKeMh8UckqQiCAy0gf4TCsOIKKpV5Dcuj4jk10rqcERobclGIb5@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9H2XpGbBnSuccWJ+hsz062zFrDVgCedasT+qbNNO9Vx1+QCB7
	oD9kM+4MvGYJxeL9/QGVKA7pYXSCd57Lx6rSNGcTpA54ffUckr2TCl3t
X-Gm-Gg: ASbGncvPFwDr+cZgkPcOw5M4Vv20Nz5GvabTXmlOrazcwX2SIAckD9cQGB0fjATeJZz
	JAehBawXt7riPTaVISUfFPhq+b9cLcm6k7V9+OBMJDoXafF1I8h/xyxRhnCPXuskHPe3ZsM8SmP
	h5+BJtPDhZFDxVRke8xRILV4CzXqjPI/koOLHoGNkg9v5DFb7kEba3i5j+ypG2ayLPtj/jXes6B
	SSa80lE7uXINuRKj1RmA8coP9umvsjHYTuMFMfX5ukP7uU/GsEggqXa3UIknDdb9Fv5TDDcBV1W
	VEg0qjqreOtjBPVbNTmRgR2XFbVZunaK/qd/QcUdHjfWt9pGEFjkkhL8FEI6cw==
X-Google-Smtp-Source: AGHT+IHUyuL8SGf3zYTOKdOAHOCLsm1QeirLg59dt/DDUrPTSwKLQ+Bt6deh6FLvwy83L6KVHx7/Qw==
X-Received: by 2002:a17:902:dacf:b0:234:8e54:2d53 with SMTP id d9443c01a7336-2382406d49bmr84147085ad.45.1750902470390;
        Wed, 25 Jun 2025 18:47:50 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8398dcbsm143408545ad.48.2025.06.25.18.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 18:47:49 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id BB6FC420A9A6; Thu, 26 Jun 2025 08:47:46 +0700 (WIB)
Date: Thu, 26 Jun 2025 08:47:46 +0700
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
Subject: Re: [PATCH 6/8] docs: dma-api: clarify DMA addressing limitations
Message-ID: <aFymwvL5vcfWBy73@archie.me>
References: <20250624133923.1140421-1-ptesarik@suse.com>
 <20250624133923.1140421-7-ptesarik@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BITuZ8ddHLuJ6SPc"
Content-Disposition: inline
In-Reply-To: <20250624133923.1140421-7-ptesarik@suse.com>


--BITuZ8ddHLuJ6SPc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 03:39:21PM +0200, Petr Tesarik wrote:
> diff --git a/Documentation/core-api/dma-api.rst b/Documentation/core-api/=
dma-api.rst
> index f7fddaf7510c..cd432996949c 100644
> --- a/Documentation/core-api/dma-api.rst
> +++ b/Documentation/core-api/dma-api.rst
> @@ -90,13 +90,20 @@ description of the DMA pools API.
>  Part Ic - DMA addressing limitations
>  ------------------------------------
> =20
> +DMA mask is a bit mask of the addressable region for the device. In othe=
r words,
> +if applying the DMA mask (a bitwise AND operation) to the DMA address of=
 a
> +memory region does not clear any bits in the address, then the device can
> +perform DMA to that memory region.
> +
> +All the below functions which set a DMA mask may fail if the requested m=
ask
> +cannot be used with the device, or if the device is not capable of doing=
 DMA.
> +
>  ::
> =20
>  	int
>  	dma_set_mask_and_coherent(struct device *dev, u64 mask)
> =20
> -Checks to see if the mask is possible and updates the device
> -streaming and coherent DMA mask parameters if it is.
> +Updates both streaming and coherent DMA masks.
> =20
>  Returns: 0 if successful and a negative error if not.
> =20
> @@ -105,8 +112,7 @@ Returns: 0 if successful and a negative error if not.
>  	int
>  	dma_set_mask(struct device *dev, u64 mask)
> =20
> -Checks to see if the mask is possible and updates the device
> -parameters if it is.
> +Updates only the streaming DMA mask.
> =20
>  Returns: 0 if successful and a negative error if not.
> =20
> @@ -115,8 +121,7 @@ Returns: 0 if successful and a negative error if not.
>  	int
>  	dma_set_coherent_mask(struct device *dev, u64 mask)
> =20
> -Checks to see if the mask is possible and updates the device
> -parameters if it is.
> +Updates only the coherent DMA mask.
> =20
>  Returns: 0 if successful and a negative error if not.
> =20
> @@ -171,7 +176,7 @@ transfer memory ownership.  Returns %false if those c=
alls can be skipped.
>  	unsigned long
>  	dma_get_merge_boundary(struct device *dev);
> =20
> -Returns the DMA merge boundary. If the device cannot merge any the DMA a=
ddress
> +Returns the DMA merge boundary. If the device cannot merge any DMA addre=
ss
>  segments, the function returns 0.
> =20
>  Part Id - Streaming DMA mappings
> @@ -205,16 +210,12 @@ DMA_BIDIRECTIONAL	direction isn't known
>  	this API should be obtained from sources which guarantee it to be
>  	physically contiguous (like kmalloc).
> =20
> -	Further, the DMA address of the memory must be within the
> -	dma_mask of the device (the dma_mask is a bit mask of the
> -	addressable region for the device, i.e., if the DMA address of
> -	the memory ANDed with the dma_mask is still equal to the DMA
> -	address, then the device can perform DMA to the memory).  To
> -	ensure that the memory allocated by kmalloc is within the dma_mask,
> -	the driver may specify various platform-dependent flags to restrict
> -	the DMA address range of the allocation (e.g., on x86, GFP_DMA
> -	guarantees to be within the first 16MB of available DMA addresses,
> -	as required by ISA devices).
> +	Further, the DMA address of the memory must be within the dma_mask of
> +	the device.  To ensure that the memory allocated by kmalloc is within
> +	the dma_mask, the driver may specify various platform-dependent flags
> +	to restrict the DMA address range of the allocation (e.g., on x86,
> +	GFP_DMA guarantees to be within the first 16MB of available DMA
> +	addresses, as required by ISA devices).
> =20
>  	Note also that the above constraints on physical contiguity and
>  	dma_mask may not apply if the platform has an IOMMU (a device which
=20
LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--BITuZ8ddHLuJ6SPc
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaFymwgAKCRD2uYlJVVFO
o7rxAP0ZAy7lZM118PZvIR9Mzi0gfM5j+SZoiRLHRS/Zy5z1kAEAn7A9H4kowyXC
g8MS770xUyWQOX9UL6zHv1qIaH95ZwA=
=2Td5
-----END PGP SIGNATURE-----

--BITuZ8ddHLuJ6SPc--
