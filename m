Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE0324886C;
	Thu,  3 Apr 2025 10:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743677430; cv=none; b=WHGyJ8vGMd4M7CAnCna21froRY7lce8albT6CAS7J/IVi4DqSoRnl1nFNhR8aLZp4Ko6YLpulWEmcu7fU2vVV9fBKuHmqyDMNZqOagdA3q8Vk852/YGYFy7z0Jo7/nF0RjIHKByueFQhe1DvdUCJLtfdPBOhqZV6IqVpnE7iPDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743677430; c=relaxed/simple;
	bh=ZNO5bwpJb3f0B518+WAple7GtPmZqWrIMq2S88tSb2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WGHEA9zsQJB09T4Wrc4nNy24okTMA69tbcrw9YmEhAmp5onjOqDmlh207KOd0AihYSd3dbH4mpz2O8D8HsC030jZoaXyqZ21VWOYmEHUPDq5KbkkRd7qo7+vR5dYkZ7GH9QIB7jmVYMZOYFeVjcw4l09yXhN9UFBVrQXcViIvwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jXwyQWXU; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jXwyQWXU"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-af6b02d9e5eso545832a12.0;
        Thu, 03 Apr 2025 03:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743677428; x=1744282228; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iI92r4BXcQyxk5mWJamKRDECY89Mdefw5GbImf8nwOw=;
        b=jXwyQWXU3KJxG1QBc8vBs5ZLJbAYLNVOPHpZA5H2/2gBXVF2J3d9p8MjNNbdpUkfC5
         ZEec7AwHOPPtrhAJB+W1bGNtCIvs0JYfAmQuspTnzT1qFrEVCJiQQenNQVvjk70NLFHF
         SDLxenRcgpwjuW0Q+BGV/GLyaA0VWnFb9F29HlyUIvu4oPRGxW39qdnfzBLufBOmDEac
         KjPKm5/rRiwooNfr1nRcZ0FHJeNfDiMP0h7uhudujNp18fk8iisxstyWJeakl5eYM8Qi
         px/Gj8g3YuO7jrGf5LsuiLotJ9AoYiQPmlIjLo8G1qEdC8cjyh1pwdo3E/6z9G7laMil
         pJBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743677428; x=1744282228;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iI92r4BXcQyxk5mWJamKRDECY89Mdefw5GbImf8nwOw=;
        b=f9266lR1k8pgakGtWEyb6G9PoXynHAkAijkmQUQtVlK5KWJWmg39yTHFvi9DeuJnMn
         z1gVhj7zvblTqWRNEkiWbpW0iQ3p9amAAEY3yZDp1x8oK7c1MGtXy2OfzrpfW14Jrr4E
         6Rg5MxCE0juo7x0KpCkScMlhdtlVxQPZRL4tK6Yqj/liuCBH6LG2kKB7F2aVoG+SQbaA
         ZMoBr9iiwFD9xEpHYP6Rri8KEEMqQQUKVl+R1MrZBceY6eZrEDz5qtz0RJID+/rMf5uO
         VhEteAGi4cX6VPwLVfQheg2VxfVgbTIyzRzVNFZfeWaAmEZlF7fy77GzgW4upsGBzFqB
         BnTA==
X-Forwarded-Encrypted: i=1; AJvYcCUX7N8LUsiXdUWPckkyaJCMNHDU1B6ZXfXSuSn5IcpAhq7MScXGn+SymnAyQzlX/YxRbOWAzGAZyv0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+B1gk+J8nWcCYAS/AXHC3ugU5lv0TtfQRHHiKHh4m5LVrRSVY
	FAkQvK3+soxQdT+pkrvgEiQwSSJxsNqRn74TdSxg/Jyhu+1lwD0N
X-Gm-Gg: ASbGncu0sYBblo3I36doC3tAdH9XtBvB4mMIMRUWjtF+zsP/PF5WPNiLOzGaMkejfCp
	WdKKRhIE2s0qzkfsvFQo3pqS5Fuo0AFcTjfb89l9kZj4lFX2EUgEobqogJgL5eNCRIa3DhlcDdJ
	T4laRgzvz0Z74hWUzEUKUeGdam/o5f4zu1vizdlMaZSATctVeqtu/RrnyuZlp5SDlQoblwexQP5
	VCZ/sfiOk+2DqFcZowkpaIWzsBxrFVETD+JScWXNRSh56cv8xAomfI8atWipxVa13dKake/OSc/
	AzPYwn9jRoremytL/cO0LcC97plEHYqLpVCs9l/ls72w
X-Google-Smtp-Source: AGHT+IHdAqc9zUyInFF/NAewX2BPd1vIY9WYwM/V3+DZBr+gvzKsHpLJ/UeaL6SUIeQTZGFOZ6JK4Q==
X-Received: by 2002:a17:90a:d643:b0:2eb:140d:f6df with SMTP id 98e67ed59e1d1-3057cbcf195mr2872640a91.1.1743677428330;
        Thu, 03 Apr 2025 03:50:28 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785adaeesm11442735ad.41.2025.04.03.03.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 03:50:27 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 74F7D4208F7B; Thu, 03 Apr 2025 17:50:25 +0700 (WIB)
Date: Thu, 3 Apr 2025 17:50:25 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: "Pankaj Raghav (Samsung)" <kernel@pankajraghav.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org, willy@infradead.org, linux-mm@kvack.org,
	David Hildenbrand <david@redhat.com>, da.gomez@kernel.org,
	mcgrof@kernel.org, gost.dev@samsung.com, linux-doc@vger.kernel.org,
	Pankaj Raghav <p.raghav@samsung.com>
Subject: Re: [PATCH] docs: update THP admin guide about non-tmpfs filesystem
 support
Message-ID: <Z-5n8XrUIAV4r_tG@archie.me>
References: <20250403103805.173761-1-kernel@pankajraghav.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ROtX3L22Pq/ipLSv"
Content-Disposition: inline
In-Reply-To: <20250403103805.173761-1-kernel@pankajraghav.com>


--ROtX3L22Pq/ipLSv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 03, 2025 at 12:38:05PM +0200, Pankaj Raghav (Samsung) wrote:
> diff --git a/Documentation/admin-guide/mm/transhuge.rst b/Documentation/a=
dmin-guide/mm/transhuge.rst
> index dff8d5985f0f..01b7ce90d693 100644
> --- a/Documentation/admin-guide/mm/transhuge.rst
> +++ b/Documentation/admin-guide/mm/transhuge.rst
> @@ -12,8 +12,8 @@ using huge pages for the backing of virtual memory with=
 huge pages
>  that supports the automatic promotion and demotion of page sizes and
>  without the shortcomings of hugetlbfs.
> =20
> -Currently THP only works for anonymous memory mappings and tmpfs/shmem.
> -But in the future it can expand to other filesystems.
> +Currently, THP only works for anonymous memory mappings, tmpfs/shmem and
> +filesystems that support large folios.
> =20
>  .. note::
>     in the examples below we presume that the basic page size is 4K and
> @@ -463,6 +463,10 @@ fields for each mapping. (Note that AnonHugePages on=
ly applies to traditional
>  PMD-sized THP for historical reasons and should have been called
>  AnonHugePmdMapped).
> =20
> +The number of PMD-sized transparent huge pages currently used by
> +filesystem data (page cache) is available by reading the FileHugePages f=
ield
> +in ``/proc/meminfo``.
> +
>  The number of file transparent huge pages mapped to userspace is availab=
le
>  by reading ShmemPmdMapped and ShmemHugePages fields in ``/proc/meminfo``.
>  To identify what applications are mapping file transparent huge pages, it
>=20
> base-commit: f0a16f5363325cc8d9382471cdc7b654c53254c9

The wording looks good, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--ROtX3L22Pq/ipLSv
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZ+5n7AAKCRD2uYlJVVFO
owUdAP4vLlJhDJZ5rVo9cdiT2DV/pwdfcfDeN78Zy4hB+YtgnAEAmoXODzvzfppp
4AyylZuDquYZcut8Ck+4DaYmufGV8QU=
=jaiS
-----END PGP SIGNATURE-----

--ROtX3L22Pq/ipLSv--
