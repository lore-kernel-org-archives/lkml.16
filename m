Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB55F4C74;
	Thu, 26 Jun 2025 01:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750902375; cv=none; b=iI68FHcIZy6xo3Hqc6ESMMO3i5QkcDL5ZaF3xf3g1MLwEu28+cBQvWkOj3OPb8z11LVUhHIh1wDglJr699WORWxlWfYgs4OeBx9j6xI+MuBkCSDgah0wdGLR3anbU8NcpmRMdcOhE5RIeZ61uSM+BF/bzaiZb59Ozo0+CBDvCc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750902375; c=relaxed/simple;
	bh=bSn+PlAXhoSl/y3LaLVJ7aGxeWPVSPw+rfLL25K0Lc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ELMuuKjCtEKV1dYGzGG0jSdiy3x6p/xSDn+cCnP/eWM2zZEylp0mObhLGMbLNr+LmU9tiGLEV0VqJGRnvgoOjdrHflTn1VoYrQLjh5mvZmPWtHt3pUjyi4HadWXrd8GlopewbpNeCpB443QOHST38xjVpJQScIaqgeOspAQZx+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b/gN/ncd; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b/gN/ncd"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b3182c6d03bso565126a12.0;
        Wed, 25 Jun 2025 18:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750902373; x=1751507173; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lq3SiHnJ/sMr4QNwXyLgB3hBprROz+eEGhl/zVcI28w=;
        b=b/gN/ncdwm7+I7ZthP6I4l9oAr8Km84V1R+/ykta6whqgLcbxnOuaHs5ZIy64MOh5J
         IT0wYAUFAZu3xZKjriLVEJn3yqT1y/V+/grjIPsQMZmRyvV2VJ5D9767C3ih430KPd00
         WF46F9Ua39NpYFxtyN7/m0VyglkOVsad6OAPeI7lmOE4lbKsd6asssIHWEAu+FuDqXhb
         xcLKqRp9ataPAY95mk0GzXgkJJPJVSFwzNIWQBkIcgZD9xNYKzfv8G/ePxTCr+QDdVNB
         vDbUZ+Uf2zSHtmWWQCRDb+9usR/lf8nTn8mRPmcHJmhQYzm1GjQRySaoOsFVD5fwcrDe
         5r6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750902373; x=1751507173;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lq3SiHnJ/sMr4QNwXyLgB3hBprROz+eEGhl/zVcI28w=;
        b=PKD2U54QipL8BL8VbrCavJ4CyWBx8eTGb/eWAVbSOR1Yp+2KUHqFDoU0VPXy9GL1M/
         nGuZF04T95J5WpCzx71QK5+MROWVOfU5tsx6OMwA9iROHB0EDEO66pyqEsFLRamtf9AS
         ONYCEaJtwZ7f8+ujg5BBV6n0+A/AoN1lL0J3GYw4F4fILB9bVgOpHWoAj379KKWu/XtO
         seq1Usw5vpMQSyk6qjLG34cXGRhMV49yiGM+cUPFM3Grt0eCFkjF13LF7S0g0MDJI1IZ
         BAzocLlr8KlSbOqYv009f41ACvF4Cf5deL5r55wiGaz6lwuMbOrJn4loZ4c///VkTW1G
         Fc0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUUYjOuu/vqntCezDcLJrk/fP1xpdlkwxSYqkD9rpy6prZGTdWwSRQXUkNLckT9I3Ja5pIPpxL9w7U=@vger.kernel.org, AJvYcCWeZ+/Ho9vt3kd/bs6PZ3UDP9DD3i6ws6oQUPq0DZyDhu9zkqpt49oadtFtzx96hVNZLuE6DgH7RmFvcoDZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw89MSK6CrTIcIjuJc767YrJSDBaGXhgNAwgg0YroEPUYegcbFs
	WxjtnQ0mK7Sdqyq3oma1DDRI7Fdsq3gc5NC1otOVA2irqMQy8E0mfrRh
X-Gm-Gg: ASbGnctfFoyBDprCWLbRNys+BRS51b4gHVTQy1MVYhIQ1+YwXjB2Z9VX+9xqZogEb7+
	9ZnjG6nPAw0hHYp0bStnNyJw64w/vJnXoWgmYy4fpo1Fc11scGSx2awnG4krxKTyc9eJV5j/5Es
	zOE1tKvOLiENQMlJ8BkBR6ZatEvTJ6e28hRKJ5tky58/fPfAIgjToOXaluJCGGDDnejQOmwxOEf
	ZqT/VcqeCK7moOeITNGN/xqNpKtj8ldAyAjhmnQhhPjEN0BoBeU09CVTo+kA53+0ij5pB9oiRb4
	BUw//wGvNgHS0RoVRpOQ3Mevjx4AseJPzb8vwZCOBuDtihDi7JaQO5xmB5Qctg==
X-Google-Smtp-Source: AGHT+IGyr80L4eOHv3yLu/dw1hnDWmf1wAOjqnPnOOGwaeNvDeEwtPUcQtn3Lwxiua7BosRBAt1eoQ==
X-Received: by 2002:a05:6a21:1807:b0:21f:792c:dc75 with SMTP id adf61e73a8af0-2207f285d61mr9401593637.34.1750902373062;
        Wed, 25 Jun 2025 18:46:13 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34c431806fsm295313a12.31.2025.06.25.18.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 18:46:12 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 0E031420A9A6; Thu, 26 Jun 2025 08:46:08 +0700 (WIB)
Date: Thu, 26 Jun 2025 08:46:08 +0700
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
Subject: Re: [PATCH 3/8] docs: dma-api: remove remnants of PCI DMA API
Message-ID: <aFymYNdHSApXXSzy@archie.me>
References: <20250624133923.1140421-1-ptesarik@suse.com>
 <20250624133923.1140421-4-ptesarik@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/k8GDMthe5m94/ks"
Content-Disposition: inline
In-Reply-To: <20250624133923.1140421-4-ptesarik@suse.com>


--/k8GDMthe5m94/ks
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 03:39:18PM +0200, Petr Tesarik wrote:
> diff --git a/Documentation/core-api/dma-api.rst b/Documentation/core-api/=
dma-api.rst
> index c0a2cc7d0b95..3e89e3b0ecfd 100644
> --- a/Documentation/core-api/dma-api.rst
> +++ b/Documentation/core-api/dma-api.rst
> @@ -53,10 +53,9 @@ minimum allocation length may be as big as a page, so =
you should
>  consolidate your requests for coherent memory as much as possible.
>  The simplest way to do that is to use the dma_pool calls (see below).
> =20
> -The flag parameter (dma_alloc_coherent() only) allows the caller to
> -specify the ``GFP_`` flags (see kmalloc()) for the allocation (the
> -implementation may choose to ignore flags that affect the location of
> -the returned memory, like GFP_DMA).
> +The flag parameter allows the caller to specify the ``GFP_`` flags (see
> +kmalloc()) for the allocation (the implementation may ignore flags that =
affect
> +the location of the returned memory, like GFP_DMA).
> =20
>  ::
> =20
> @@ -64,13 +63,12 @@ the returned memory, like GFP_DMA).
>  	dma_free_coherent(struct device *dev, size_t size, void *cpu_addr,
>  			  dma_addr_t dma_handle)
> =20
> -Free a region of coherent memory you previously allocated.  dev,
> -size and dma_handle must all be the same as those passed into
> -dma_alloc_coherent().  cpu_addr must be the virtual address returned by
> -the dma_alloc_coherent().
> +Free a previously allocated region of coherent memory.  dev, size and dm=
a_handle
> +must all be the same as those passed into dma_alloc_coherent().  cpu_add=
r must
> +be the virtual address returned by dma_alloc_coherent().
> =20
> -Note that unlike their sibling allocation calls, these routines
> -may only be called with IRQs enabled.
> +Note that unlike the sibling allocation call, this routine may only be c=
alled
> +with IRQs enabled.
> =20
> =20
>  Part Ib - Using small DMA-coherent buffers
> @@ -246,9 +244,7 @@ Part Id - Streaming DMA mappings
>  Maps a piece of processor virtual memory so it can be accessed by the
>  device and returns the DMA address of the memory.
> =20
> -The direction for both APIs may be converted freely by casting.
> -However the DMA API uses a strongly typed enumerator for its
> -direction:
> +The DMA API uses a strongly typed enumerator for its direction:
> =20
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  DMA_NONE		no direction (used for debugging)
> @@ -325,8 +321,7 @@ DMA_BIDIRECTIONAL	direction isn't known
>  			 enum dma_data_direction direction)
> =20
>  Unmaps the region previously mapped.  All the parameters passed in
> -must be identical to those passed in (and returned) by the mapping
> -API.
> +must be identical to those passed to (and returned by) dma_map_single().
> =20
>  ::
> =20

LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--/k8GDMthe5m94/ks
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaFymWgAKCRD2uYlJVVFO
o5drAP9fXYdw6+4fZYNwvXAgGezIFB9llc5nQyNnXWPwVbdB9QEA6e7hI2YkqCD3
JGNjhBlbhEfrMD7mZTXRieoVHwpNNgQ=
=26Za
-----END PGP SIGNATURE-----

--/k8GDMthe5m94/ks--
