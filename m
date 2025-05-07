Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7A772639;
	Wed,  7 May 2025 23:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746662078; cv=none; b=A/JVPGc7mlOwKYDMP8lrsxj6r7/rMEHz8sPwqzxT2hDkn959b6MHhpN+o1coz0FrxsYc0Bq+3dq4/I1oJhRr/PBg3cq6oKtzS8pezv4820ByPFzcq9SP0kuMlyREst7j+uV8XLWFn9XX0ih39e4cpX9OgG+57hxGX8h+V15lYV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746662078; c=relaxed/simple;
	bh=g1r6Qe9eIk8+GS22cqSMpwIr7XLsfn4fjWJPz5N5e2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NOijVpVhgzJhHE3oLm9fZGxZaBfxk6h/47rUbvoIBQBqVr2ofmQytfGek+wH7FGrpGYInVMwm8NSCsrd3ruVsfCnjs1+kKLqL4va/Wc1XDmSKVfKbLeCs/PWM2vMhdGihf8wv728r0MiNciJVSJgAij8LP2GA9JElL57oC+WDpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HAJN6U1x; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HAJN6U1x"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-af52a624283so458006a12.0;
        Wed, 07 May 2025 16:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746662076; x=1747266876; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fLNwEV8SgZJkGHrUBzZ9lp1C8q+dL6Ko3cbg0++18Zo=;
        b=HAJN6U1xggh8ot7kxRCrkNkjhdjebPUq8y8dCSUzE5j85gGRYQkPS9jmpNltEVzX0Q
         creJ3HlPIMUvfbDgj4h+STF/W8EBqzJC41wGmp4z7H5rafI1IfycN+nkeHJBwve6/jOw
         eUrJAVRWoLk3g0JDGvx8VxlohBQCgzQzydsm472b6a+rW1LFD4G1sEYyIRrjAoNf3FqE
         GD5KaALxYisxJ0OIOy77EPaNPVzIDoSOtcQXZjns7BP2j3CAbpH/gCZLrSEzboY8RjQH
         gNAGAt42nDM5ky89j9J406DpH0PNS5mpyk0n3sTnr/07swm7/T+7SwvwnmbcauVxCMGB
         jKVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746662076; x=1747266876;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fLNwEV8SgZJkGHrUBzZ9lp1C8q+dL6Ko3cbg0++18Zo=;
        b=MaK8ZzgZucbX4k2cgg8dlYsKH/IGRDumFrUXhRtG1x3BEhCujaA7paRERfQ/edGgao
         jl168/ci8XYTZeI050Ud1mHpQ+33f/R/IaLiT3Vj0sHfApN0Q7erdG4LFYAY7chHjtHk
         GAVD5SIH8J5ZuxKMNQ7NHdgNPzCWxdndQQshC6JqIujFh61UlsZ5BNq3bpDm/gk9TKeY
         GaEl0s4/vFGGzb0PUWti8rMSQkvYJnor8zPcPg4w0zm6ThZKtlaqETE+v7x1W8wRGKhY
         GpqhmzZk3WV5Q98ceHrAFvKIXiAsnHcSsWQB5NFFhuW9unqwEjVd7MpGKbHoPzBt52Nz
         xUvw==
X-Forwarded-Encrypted: i=1; AJvYcCVRDLKiEXpR6acbCMKHqufi/H8EN++6irf1Vs5PwC3JBXh45NQbuEvAY9IgURvXEvBieXfq4VGH3xK7LY4r@vger.kernel.org, AJvYcCVX0g7IWrs1pDcgxfIcya1TM0f+87jTDdAcYkTZ7Tt5ofBGk7N+Qrcw5whgHb2MdAY7vMcaBnvr6I1p@vger.kernel.org, AJvYcCWRsEXBNiptRbEBesmXDGW71MQUrofRuaPlSotpiGsigdjWKwA8SKc574fbHa6hZZYVVhJkCrG8tGSV@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7T/4O9t6yEDd2L+mI0eZYf987qNXTcJ+7vdIviAtpAeTUnzme
	hTpovyzHj2UgCGgsA8zCHBRUTAfahpA5oHxNW/O3wcvScZz5GQKi
X-Gm-Gg: ASbGncvP/KtN57u8MG1khVvgGjCOuOJlRqbZPom0+3riuxeV+nd11PBjDPEvD4d8bt/
	eHDp/ILSay6icImJ7cTTuRWgFTONbtX5Vxfmo9hXB3ERjIal0/G4+RnR/KPQ1tu+hwOh+ErKZ9m
	nIpiV1kZPuGg3BHiG4O8+1NmvowTa4gKlHQWkYVYBv7c6YjUWI1VCEuFzoyyESC7uVESYlNgHda
	Bl1zqnveHcqrTk33skVYwb1dsveqjWwzZ6FiZB3zTsWon2sGCRxQjgt84mtUAnGskqy0y89WgGL
	CnzEFbuwaO7D5Ah6slTVO9sLXQnP/Z0ycPKrF6/r
X-Google-Smtp-Source: AGHT+IHhK4fQ0eXffxWp3og4eay8JmyRcAaEmd9mi0QFw/ybw320/zjs9kUfsYWXYw9PozpDfctKkQ==
X-Received: by 2002:a05:6a21:32a6:b0:20a:942:47e9 with SMTP id adf61e73a8af0-21599fcc6admr2320890637.6.1746662075529;
        Wed, 07 May 2025 16:54:35 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058d7a225sm11870093b3a.23.2025.05.07.16.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 16:54:34 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 5AB6041E8D47; Thu, 08 May 2025 06:54:32 +0700 (WIB)
Date: Thu, 8 May 2025 06:54:32 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Changyuan Lyu <changyuanl@google.com>, akpm@linux-foundation.org
Cc: anthony.yznaga@oracle.com, arnd@arndb.de, ashish.kalra@amd.com,
	benh@kernel.crashing.org, bp@alien8.de, catalin.marinas@arm.com,
	corbet@lwn.net, dave.hansen@linux.intel.com,
	devicetree@vger.kernel.org, dwmw2@infradead.org,
	ebiederm@xmission.com, graf@amazon.com, hpa@zytor.com,
	jgowans@amazon.com, kexec@lists.infradead.org, krzk@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, luto@kernel.org,
	mark.rutland@arm.com, mingo@redhat.com, pasha.tatashin@soleen.com,
	pbonzini@redhat.com, peterz@infradead.org, ptyadav@amazon.de,
	robh@kernel.org, rostedt@goodmis.org, rppt@kernel.org,
	saravanak@google.com, skinsburskii@linux.microsoft.com,
	tglx@linutronix.de, thomas.lendacky@amd.com, will@kernel.org,
	x86@kernel.org
Subject: Re: [PATCH v7 17/18] Documentation: add documentation for KHO
Message-ID: <aBvyuKI3i4z_3xSG@archie.me>
References: <aBl0kUIKryH5AUD5@archie.me>
 <20250507173840.2541517-1-changyuanl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zRFld30/pgx52G1k"
Content-Disposition: inline
In-Reply-To: <20250507173840.2541517-1-changyuanl@google.com>


--zRFld30/pgx52G1k
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 07, 2025 at 10:38:40AM -0700, Changyuan Lyu wrote:
> From: Changyuan Lyu <changyuanl@google.com>
> Date: Wed, 7 May 2025 10:14:34 -0700
> Subject: [PATCH] fixup! Documentation: add documentation for KHO
>=20
> Signed-off-by: Changyuan Lyu <changyuanl@google.com>
> ---
>  Documentation/admin-guide/mm/kho.rst    | 29 ++++++++++---------------
>  Documentation/core-api/kho/concepts.rst |  4 ++--
>  Documentation/core-api/kho/fdt.rst      |  2 +-
>  3 files changed, 15 insertions(+), 20 deletions(-)
>=20
> diff --git a/Documentation/admin-guide/mm/kho.rst b/Documentation/admin-g=
uide/mm/kho.rst
> index c64aa7aadb300..6dc18ed4b8861 100644
> --- a/Documentation/admin-guide/mm/kho.rst
> +++ b/Documentation/admin-guide/mm/kho.rst
> @@ -8,14 +8,14 @@ Kexec HandOver (KHO) is a mechanism that allows Linux t=
o preserve memory
>  regions, which could contain serialized system states, across kexec.
>=20
>  This document expects that you are familiar with the base KHO
> -:ref:`concepts <concepts>`. If you have not read
> +:ref:`concepts <kho-concepts>`. If you have not read
>  them yet, please do so now.
>=20
>  Prerequisites
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> -KHO is available when the ``CONFIG_KEXEC_HANDOVER`` config option is set=
 to y
> -at compile time. Every KHO producer may have its own config option that =
you
> +KHO is available when the kernel is compiled with ``CONFIG_KEXEC_HANDOVE=
R``
> +set to y. Every KHO producer may have its own config option that you
>  need to enable if you would like to preserve their respective state acro=
ss
>  kexec.
>=20
> @@ -29,7 +29,7 @@ Perform a KHO kexec
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
>  First, before you perform a KHO kexec, you need to move the system into
> -the :ref:`KHO finalization phase <finalization_phase>` ::
> +the :ref:`KHO finalization phase <kho-finalization-phase>` ::
>=20
>    $ echo 1 > /sys/kernel/debug/kho/out/finalize
>=20
> @@ -43,7 +43,7 @@ use the ``-s`` parameter to use the in-kernel kexec fil=
e loader, as user
>  space kexec tooling currently has no support for KHO with the user space
>  based file loader ::
>=20
> -  # kexec -l Image --initrd=3Dinitrd -s
> +  # kexec -l /path/to/Image --initrd /path/to/initrd -s
>    # kexec -e
>=20
>  The new kernel will boot up and contain some of the previous kernel's st=
ate.
> @@ -89,20 +89,15 @@ stabilized.
>      as input file for the KHO payload image.
>=20
>  ``/sys/kernel/debug/kho/out/scratch_len``
> -    To support continuous KHO kexecs, we need to reserve
> -    physically contiguous memory regions that will always stay
> -    available for future kexec allocations. This file describes
> -    the length of these memory regions. Kexec user space tooling
> -    can use this to determine where it should place its payload
> -    images.
> +    Lengths of KHO scratch regions, which are physically contiguous
> +    memory regions that will always stay available for future kexec
> +    allocations. Kexec user space tools can use this file to determine
> +    where it should place its payload images.
>=20
>  ``/sys/kernel/debug/kho/out/scratch_phys``
> -    To support continuous KHO kexecs, we need to reserve
> -    physically contiguous memory regions that will always stay
> -    available for future kexec allocations. This file describes
> -    the physical location of these memory regions. Kexec user space
> -    tooling can use this to determine where it should place its
> -    payload images.
> +    Physical locations of KHO scratch regions. Kexec user space tools
> +    can use this file in conjunction to scratch_phys to determine where
> +    it should place its payload images.
>=20
>  ``/sys/kernel/debug/kho/out/sub_fdts/``
>      In the KHO finalization phase, KHO producers register their own
> diff --git a/Documentation/core-api/kho/concepts.rst b/Documentation/core=
-api/kho/concepts.rst
> index f1826ac10da75..36d5c05cfb307 100644
> --- a/Documentation/core-api/kho/concepts.rst
> +++ b/Documentation/core-api/kho/concepts.rst
> @@ -1,5 +1,5 @@
>  .. SPDX-License-Identifier: GPL-2.0-or-later
> -.. _concepts:
> +.. _kho-concepts:
>=20
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  Kexec Handover Concepts
> @@ -56,7 +56,7 @@ for boot memory allocations and as target memory for ke=
xec blobs, some parts
>  of that memory region may be reserved. These reservations are irrelevant=
 for
>  the next KHO, because kexec can overwrite even the original kernel.
>=20
> -.. _finalization_phase:
> +.. _kho-finalization-phase:
>=20
>  KHO finalization phase
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> diff --git a/Documentation/core-api/kho/fdt.rst b/Documentation/core-api/=
kho/fdt.rst
> index 4a5d53c670d4b..62505285d60d6 100644
> --- a/Documentation/core-api/kho/fdt.rst
> +++ b/Documentation/core-api/kho/fdt.rst
> @@ -32,7 +32,7 @@ KHO process will be bypassed.
>  Property ``fdt``
>  ----------------
>=20
> -Generally, A KHO user serialize its state into its own FDT and instructs
> +Generally, a KHO user serialize its state into its own FDT and instructs
>  KHO to preserve the underlying memory, such that after kexec, the new ke=
rnel
>  can recover its state from the preserved FDT.
>=20

Looks good.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--zRFld30/pgx52G1k
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaBvyuAAKCRD2uYlJVVFO
o38OAP0S2nuy3loMuC8zH7tkpPoIY66aWe/gz0KYX9I9KbADyAEAiwNKd6K9jY8l
qW+w4NnoiMRcH659o8/VFU3sEV3Tegw=
=bbPy
-----END PGP SIGNATURE-----

--zRFld30/pgx52G1k--
