Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51CC71917CD;
	Fri,  4 Apr 2025 23:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743810961; cv=none; b=jlGZCaVArcQP4B0uKia9HQphRdaoT7Tyj+M6ZwbRjKWQNPufGU5T4PtCyZWwQZJZTF3Zo2N6xSQXSXwlkEKcDK9RauxdJRpvGXAefUMqWPlCW++JiRj4hIDODTFaCrPz/DGUvCj0yo2vXBV1LUiaN8Fsidfqgwh/QWM8JmOCc3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743810961; c=relaxed/simple;
	bh=AX/YYsl0Uu354FlrKcpzn234fsPZcHAP77j6aDninNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LrRV5+RkkjZ3HHjRv9zKhY0yKJk8G2AuT4woz7aq3gWtVv0t4yqcKFUkMeOUBIiodZahHkjnjABSrHIYgxVzv8gJM233SvY8I5++uqfOGOPTyt/r1I0WJw/UB0XkZLsqAAmx74JbxF215eQtP+w2BMvUYEVkHCIZZZlRpCnZ5m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fqfwvCVx; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fqfwvCVx"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2260c91576aso21944825ad.3;
        Fri, 04 Apr 2025 16:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743810959; x=1744415759; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2Qbcg7beoc6Xu96NsYniUdclE5DhDfitSzlmmppCwV8=;
        b=fqfwvCVxGLKTbhJQyq+knS1Lak3VGqTpyEdZYIl9rERjHNhAKX+D8T5SSlt9/srg6C
         UB/2saG6IHnhFVxQPXFT7JgPL0SmTzdVObiGoRwYNEqIfb/bOWoNtmUcbOL7VA9wxzOt
         g5ddwUaII60/22cB5y8G59EfAWrdEP10lrDoO/dk8k839Q6pmPFOVAdAJvh/DHIYF7Iu
         I7vUFs6tpMO+1olaGpiajwDtE1VsCd+s+W0If6S4SviqC4YR+OL45hMJ8g/PzdENuSdI
         eLX9Yu0XzVLy83Iqxr17o5MMuep/ZI2cW2wG1TD0YAFEVQowhza8rNeRmjVpQFDxGFx9
         AReQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743810959; x=1744415759;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Qbcg7beoc6Xu96NsYniUdclE5DhDfitSzlmmppCwV8=;
        b=oDllmEkSbGGXV0HjVFt62s9w62gLIsx55ct+uKTL1m6C7cZu7L8UtdH9Ho1eCTd+ly
         Qv7YZQHAmxvn4RQj/d6WdPwMkvyduYg3QfasKg5uH9aP+nax/y5G8YGQi7xYtpEq5xXh
         vCpgjSI5s96XbFwiYl2211lqTMX9S/XVQPoDOYWuelaLyNeFBKHORN483Q8TEItfQblJ
         aiB3G3860C10fSEI2KS71ueN6CfuAtnWUcAq82jdbovupbG/VnGtYHLLJkj30rDCsF1W
         0oIAv4ZOeK25IswVwfoz7CgSjd+ylvWI7VqvQuDR7gV+y9pZVNq2AekciLlCgVAB+lHj
         fJdA==
X-Forwarded-Encrypted: i=1; AJvYcCWRQtsoCFCvwYUIc24XR6pdIztHKOQnRocRJ63/OGWUKxO5czx8LrzC38qXSpe0m+hYsksVL+zhj+Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoIpNS8GWVKXhY2yLV77AqxxH0e3cmERafaygUZ4W2RT6BH88Z
	dkCmL9OQcjmA2LyFZk11sCmdW27PeqEyzOIfxduHZ6TR10LH4qKS
X-Gm-Gg: ASbGnctEui2Lqe8nrr5tf3mZFlQTyn6ZK3pz0tHbZWldnjKShFnK2rc+qxbEth56lSq
	i2USxVXNr0jSoXO9O4IMGTbBe7uN64Vteei9QChdIOzM4W/E6C8YzWPFEPD3qQ3L89Nn+gJ3NEz
	alGugme11J5AFUgowjPMsu7XK+S68DSc0+r8HyKd8h928CxKpvmrDhRd/hTHxkYyrUZ6FQpxBZR
	1q1CRdK2X0vpzzni34vJjnzljQm3kYgRcZ6qvO5CXoPl7X1crMk/KOgS94gINodMiOjVIEQeziv
	z6xbhsaz/e7crayttz8gsGRU7ryVhIen28otZHvSt7P1
X-Google-Smtp-Source: AGHT+IGDHqCIcWJ1VVlBQCJ3ZYjTMz19C+w7npPLNO4tkDkiZoOk24haQWGTKLstZl1LKwOpDtISBA==
X-Received: by 2002:a17:903:1b6d:b0:21f:68ae:56e3 with SMTP id d9443c01a7336-22a8a1b8c79mr64850695ad.39.1743810959244;
        Fri, 04 Apr 2025 16:55:59 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22978772861sm38459045ad.234.2025.04.04.16.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 16:55:58 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id B5471420A696; Sat, 05 Apr 2025 06:55:55 +0700 (WIB)
Date: Sat, 5 Apr 2025 06:55:55 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: "Pankaj Raghav (Samsung)" <kernel@pankajraghav.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org, willy@infradead.org, linux-mm@kvack.org,
	David Hildenbrand <david@redhat.com>, da.gomez@kernel.org,
	mcgrof@kernel.org, gost.dev@samsung.com, linux-doc@vger.kernel.org,
	Pankaj Raghav <p.raghav@samsung.com>
Subject: Re: [PATCH v3] docs: update THP admin guide about non-tmpfs
 filesystem support
Message-ID: <Z_Bxi-w8dhMLesKy@archie.me>
References: <20250404140657.29285-1-kernel@pankajraghav.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hE7iKIIkiNutKzNZ"
Content-Disposition: inline
In-Reply-To: <20250404140657.29285-1-kernel@pankajraghav.com>


--hE7iKIIkiNutKzNZ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 04, 2025 at 04:06:57PM +0200, Pankaj Raghav (Samsung) wrote:
> diff --git a/Documentation/admin-guide/mm/transhuge.rst b/Documentation/a=
dmin-guide/mm/transhuge.rst
> index dff8d5985f0f..f8aae64e38d0 100644
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
> @@ -463,11 +463,19 @@ fields for each mapping. (Note that AnonHugePages o=
nly applies to traditional
>  PMD-sized THP for historical reasons and should have been called
>  AnonHugePmdMapped).
> =20
> -The number of file transparent huge pages mapped to userspace is availab=
le
> -by reading ShmemPmdMapped and ShmemHugePages fields in ``/proc/meminfo``.
> -To identify what applications are mapping file transparent huge pages, it
> -is necessary to read ``/proc/PID/smaps`` and count the FilePmdMapped fie=
lds
> -for each mapping.
> +The number of PMD-sized transparent huge pages currently used by
> +filesystem data (page cache) is available by reading the FileHugePages f=
ield
> +in ``/proc/meminfo``. The number of these huge pages that are mapped to =
userspace
> +is available by reading FilePmdMapped field in ``proc/meminfo``. To iden=
tify
> +what applications are mapping these huge pages, it is necessary to read
> +``/proc/PID/smaps`` and count the FilePmdMapped fields for each mapping.
> +
> +In similar fashion, the number of PMD-sized transparent huge pages curre=
ntly
> +used by tmpfs/shmem is available by reading the ShmemHugePages field
> +in ``/proc/meminfo``. The number of these huge pages that are mapped to =
userspace
> +is available by reading ShmemPmdMapped field in ``proc/meminfo``. To ide=
ntify
> +what applications are mapping these huge pages, it is necessary to read
> +``/proc/PID/smaps`` and count the ShmemPmdMapped fields for each mapping.
> =20
>  Note that reading the smaps file is expensive and reading it
>  frequently will incur overhead.
>=20

Looks good, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--hE7iKIIkiNutKzNZ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZ/BxhgAKCRD2uYlJVVFO
o9aXAQDXeJRYL8Ql9rfKPgO01q0Tg4hKcR91PSCos74scWsqWwD6Agz+YSUSGRTU
ms/KfqjUA3brhTaTnV90IE6gDmf0yQA=
=e6Cl
-----END PGP SIGNATURE-----

--hE7iKIIkiNutKzNZ--
