Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF094A33;
	Thu, 26 Jun 2025 01:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750902616; cv=none; b=mG5iFhbqSYg0JbL4VMOdfq5+QQoHokw7Egyku2neuTM6y4mgFOg6tOz5dpAVqYmq69/CGsPC3Ybd8q7MEDssh0fA+XSfXz+jb9hM4VUA6P1A+UO2fniLTlbugpy0w54LpZGQW8wGHmy1X70VqiRW05KWVSKKynyXY4nSdq9we8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750902616; c=relaxed/simple;
	bh=A5Gi+HWAU+4clSFEyBHmvjcq8Yv6+tedfoPau9+1cwk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OJMkD8MYDcZG5d7L1Iw4YghTUMNekDMs9m6xbowSk+frnhvSS+9U5iPndJyRW2YTXxWJfm5+OA//Ck/n5wO20u1DOIkZ1MEiTU/2NTTytKVgCos4BVrjQ0MqFPHG/qFCb0M4mZSII6i/OGQ0IAol0iPsPsA4vYhdUxTJi0HdRG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YIC6Mh1I; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YIC6Mh1I"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7426c44e014so580205b3a.3;
        Wed, 25 Jun 2025 18:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750902615; x=1751507415; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=menFF1U22OaGLYsBSwHqWWPm6awV466wbz9FvtD4mjw=;
        b=YIC6Mh1ItNaIRdqJZzJ0dmxbocHjeOHJgeO8DDrffVxis9z/cq6x23cLPC5Cf/N3Os
         DRDGzY7htfm3l8Otrl774zhf9LxYWroNkm/LvngYOqRoUzGng0jfT+CgQXvGYWZA9t1l
         4zUftDqBrf/mgnfhh37fL6Ws/VXuxlWIe9o5eGdVbcGxtLQj0vmpGwxp+J4dJhrrYWkA
         1P6rDFgRopZtpz2UAfDViWqrcpL6fboSWH2iLlo4pYM11AIEFZB2+Up/EnaytNdu6Olv
         d7E8UBuuFU+JGyPWQ9u8WSmTnUk3z3qTnmlk/MVLDIaiyDIySUN31kuPIM/hjmWb1k08
         WDSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750902615; x=1751507415;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=menFF1U22OaGLYsBSwHqWWPm6awV466wbz9FvtD4mjw=;
        b=HlvHsvEXsKvLngYds0r0osbmv9QSyFiyIbkufwDHD85f6EhZQcMvgKj7FWMlQ6zCnr
         HBrFkShcKypkkZkq/B/FW3nxoHAz2CIkakTPAKgmJ7omKzIWBbFQ72S+fS/1uWLjBzYl
         6LoW/Wiyp0hfs0IDdDLUTWBfyrKiFO4tDLmN3tMv8ni9JxFJCKCjJQwmlDATmVxiXgra
         BpHMx/kTZdiy4EhpjBeUt11IVbIw5GR1e50orzPK2rCg2QG9ax/nOF5z3x4N1/2ejvxH
         FAp9F7dUVv6WEQW7BSo2SNBCJ149ZCxajDbAlzueTvwcjcr+x6mtHmiTBPD78A9OYTpe
         4spQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYTUKG+StwhawC8D1igYUkFTGdKv6UEd+ZRls8uzlo+PdspLM19JvbSxjZfGdwHT0B5BlLKFeicB02QEJw@vger.kernel.org, AJvYcCXwzcHk++1Cf6Nr42B+m6tNZt9z+eA5Q2jhgZz6kfVbD1ygg0fAo1kMftNuLKyA+qBaeBV1rnUGZc0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbvmcHAC/jYF2j/mwItqW+Nai3Si7R/gzXAgx/E/Q6PL0p7b0v
	UEj2VukGqNDNW1KzM/FUidT9xyP2ZmX4C6BFzDAeJR3pYoEY6R7ywCKj
X-Gm-Gg: ASbGnctbsIFrsJXdzDKosfZgw1hyVtJYZUm26b1RHTarMspb2/KX0OrwnaBC2CokFTB
	150NaSX9BM3zyZnFSgTQDgd3+dCXJnv3dHB8ZnlkYlD6v88WYiXRJjx7wS2OvU0nXcRmTJPJeVj
	gt1sPPq0pfb4LmpB5gjf350uFaAKur1YKsoIJDxDVe4/1Rko4VUZiy9aQR6KZj36nzkp8KfR2gW
	vVtbwC0d4Zq9f8I9BbgWDYl36nAO4d4IWuQWD/YrvL9JZ0gw3zRJoEnIPAo/j3YLjpdnIk11khw
	ZPYWnXHUv5OHuCDXP5A6wIqs/Uroj6CJLMbzc1MyXbWQwX+fBmDJJ99gkgyrpHQvHXcg94rH
X-Google-Smtp-Source: AGHT+IEeN+uIadKUTDZZKdBuJ8RBOTI4uF/P18CZw/f2cxNloJ7IHom8c66u6sCMY9pzvzuIs+bwCQ==
X-Received: by 2002:a05:6a00:3a1f:b0:748:3849:e790 with SMTP id d2e1a72fcca58-74ae2dc4064mr2702982b3a.0.1750902614558;
        Wed, 25 Jun 2025 18:50:14 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-749c88722e7sm5559739b3a.166.2025.06.25.18.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 18:50:13 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 2A535420A9A6; Thu, 26 Jun 2025 08:50:09 +0700 (WIB)
Date: Thu, 26 Jun 2025 08:50:09 +0700
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
Subject: Re: [PATCH 8/8] docs: dma-api: clean up documentation of dma_map_sg()
Message-ID: <aFynUS7nVnlhvlv8@archie.me>
References: <20250624133923.1140421-1-ptesarik@suse.com>
 <20250624133923.1140421-9-ptesarik@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VYv0BG3dP8FK4nmn"
Content-Disposition: inline
In-Reply-To: <20250624133923.1140421-9-ptesarik@suse.com>


--VYv0BG3dP8FK4nmn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 03:39:23PM +0200, Petr Tesarik wrote:
> diff --git a/Documentation/core-api/dma-api.rst b/Documentation/core-api/=
dma-api.rst
> index 65132ec88104..f5aadb7f8626 100644
> --- a/Documentation/core-api/dma-api.rst
> +++ b/Documentation/core-api/dma-api.rst
> @@ -308,10 +308,10 @@ action (e.g. reduce current DMA mapping usage or de=
lay and try again later).
>  	dma_map_sg(struct device *dev, struct scatterlist *sg,
>  		   int nents, enum dma_data_direction direction)
> =20
> -Returns: the number of DMA address segments mapped (this may be shorter
> -than <nents> passed in if some elements of the scatter/gather list are
> -physically or virtually adjacent and an IOMMU maps them with a single
> -entry).
> +Maps a scatter/gather list for DMA. Returns the number of DMA address se=
gments
> +mapped, which may be smaller than <nents> passed in if several consecuti=
ve
> +sglist entries are merged (e.g. with an IOMMU, or if some adjacent segme=
nts
> +just happen to be physically contiguous).
> =20
>  Please note that the sg cannot be mapped again if it has been mapped onc=
e.
>  The mapping process is allowed to destroy information in the sg.
> @@ -335,9 +335,8 @@ With scatterlists, you use the resulting mapping like=
 this::
>  where nents is the number of entries in the sglist.
> =20
>  The implementation is free to merge several consecutive sglist entries
> -into one (e.g. with an IOMMU, or if several pages just happen to be
> -physically contiguous) and returns the actual number of sg entries it
> -mapped them to. On failure 0, is returned.
> +into one.  The returned number is the actual number of sg entries it
> +mapped them to. On failure, 0 is returned.
> =20
>  Then you should loop count times (note: this can be less than nents time=
s)
>  and use sg_dma_address() and sg_dma_len() macros where you previously

Looks good, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--VYv0BG3dP8FK4nmn
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaFynUAAKCRD2uYlJVVFO
ozs9AP9v8cUUS98Sbhde8tPcqpCwp86Kt5pFDUY5hgpDgUsAuwD9H6AqxbL7efqQ
Ww2laLAW0niZvOyAeuqIxZai8PAdAw8=
=aUqm
-----END PGP SIGNATURE-----

--VYv0BG3dP8FK4nmn--
