Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8A9306CCB;
	Tue,  6 May 2025 02:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746498712; cv=none; b=SrFMG6XSOVjZEaf3plbzK9ZURqYuNglGBKetouX5PJkEUVYeKB7Vl9WxmAsWtyZKrhqwRDzuYmyKx8cvkDcAG2RjMhYjE1xcosz5VJOVglRYyPbahf+iyVFWdLKZ1i0wm4XP4xBEstmqf2I7gxR8HwCZaz6omWEsmZCa9MFX4Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746498712; c=relaxed/simple;
	bh=wYBErgk59yRPYTKpFOXAiimpZRl4DE2BrEA04HijqEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XwOiXxbyYtZ5bUxTyzohr3k7LHaofIxhINzmX1tc1G0+e7BEFnwoNiC3IGwn/f9M9e4vvV53tUwL5bICuf03xD51ZQ9TmDs00V9uIexAJNIt7f+r73t04P1ayvTuQEqzMxAxiIbYbTdvTCyMDeeGI7vClQrr5c76UXnWB09uXkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HBiMS0kC; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HBiMS0kC"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-739525d4e12so5009852b3a.3;
        Mon, 05 May 2025 19:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746498710; x=1747103510; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=poh4flnsblOTuXQPZPNN2P3hxWXnOplQoLoK9Oy5wOo=;
        b=HBiMS0kCDr0na03K2B6HG6M/yJzGpk/ipa3ed6WvtQQS/mjXljmZaGB0v3ecm/hu6G
         BjOiHEDPQginwuHomuENFlOVI3xA4F/D3w9NKVfsnEMNg9cgn2X+PT2xN+8VDUwylG0n
         V6Wfv/HChRkSrKKOvvIVqEKK+8pv/zW2MEbNM9EPAYGCMD0p6f187IsKSKge/S3kFSag
         9kFCgrpmDfpPSv69qUZMazcbjsEk+0lOF3CmjL03sfut0QxlMKa/aF4Gm1DeZND7Cm5U
         kQeN3tWP5Kpot0hA+V1SZyd0HT9/Xe9AbCxFrircct00f7NwcLhGZJ+SUsWiTSXpdnGH
         Z9zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746498710; x=1747103510;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=poh4flnsblOTuXQPZPNN2P3hxWXnOplQoLoK9Oy5wOo=;
        b=urwcifXifzEXqSFLaPDb8MYLCbZOGQpHlhZYCgn8puGUlQlvBZXCn/cVJ+NeKUX1fk
         ghMQYjqYmmRO4m7J8+XMfjFghZawZ+8e6FNUfPVZhOT+WyqRF5hsz+apWKwAk/3hyBAO
         qkOjZUbJkDl7cB+HLC5p/NZxC2DDyvX09Fs2Bu+kRucquNyJ4+KfQLjdQh9kXPLA+WS9
         joov7+FMC0qOejE0uocf6zyC8XMRmbYArCN+RfpCTDbqku8XYnq/1eaLXJXpcrkJwiJE
         IiBg8H6+L8QaHLs1gvXxXAwwbbEK+MBDqb+WbszKS0eDqmPQiLhfrrZ0bxI7YPDibXTK
         1dEw==
X-Forwarded-Encrypted: i=1; AJvYcCW/Y3Xb6O9CyoCmfQlLd1+ieGKo3HLz5/Ah34cihugQ+s4L3n17Mh3pWnDYm6sftrjLC9++FzpxMzOK@vger.kernel.org, AJvYcCWfB91Ae8fv2O5NeAUBtcHJCpX56zzFHqLYbNn81I9RbuXxhGV30srk0fG6uVyYST0hUVDmDVrPZvCZ@vger.kernel.org, AJvYcCXochhPSuScBjofzh7oz2v5dbqw0LF+2gv/zFwGXNtcEow0y0ny9g4POUqsLQjqb9riPK1HvAU2x+iQ2fn9@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf8cbwmU3IrnqVrMmeoVafviK/+9tMDBATLb19vo244AnBhlFk
	x/VdiHF+53NQxXHDQI133SUy+xdUHE0oVKf6A1a9zF0D0aiIaqRu
X-Gm-Gg: ASbGncs9SLOJBDNPGVNC8Q8fht2MkoqWeB4GzAH3NJLwC8B6HGESnKnoRgmwMHl4+wm
	/6mY3nrPmBWHsVWwDDHTYmpCGgCaV9rXYl9AkNtdKzRX+Rz4Qq/58AEYC4dP4RuUq5HN+XQGvwa
	C0XgTrukfmAmDpWCHpcgTI8FxfhF4Yef7UOYgTaPd4vxO0ZKrnGU18ViEGIvjM5gAtLoA1ittIZ
	jyERcWFQz1isA4eYd9l16M7WCI1iZYi2179/uEqWsjWTtCDnj2EOUGai2wizCzSZzO1VDzB+bGO
	degWnb4umytQ19aR7GZudhX4mZ+LPkXJfDPhXvR/
X-Google-Smtp-Source: AGHT+IFm2DxJzuwGUz6BKAo8aCcTy5T+PX1t2f2NG17JtptJTbCdw+A9Vy7/npC+48IEhStxuhVLiA==
X-Received: by 2002:a05:6a00:4294:b0:736:6ecd:8e32 with SMTP id d2e1a72fcca58-74058b23ef3mr18912149b3a.21.1746498710367;
        Mon, 05 May 2025 19:31:50 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058dbbb15sm7939011b3a.58.2025.05.05.19.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 19:31:49 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 3FFBD42439E4; Tue, 06 May 2025 09:31:45 +0700 (WIB)
Date: Tue, 6 May 2025 09:31:45 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Changyuan Lyu <changyuanl@google.com>, linux-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org, anthony.yznaga@oracle.com, arnd@arndb.de,
	ashish.kalra@amd.com, benh@kernel.crashing.org, bp@alien8.de,
	catalin.marinas@arm.com, corbet@lwn.net,
	dave.hansen@linux.intel.com, devicetree@vger.kernel.org,
	dwmw2@infradead.org, ebiederm@xmission.com, graf@amazon.com,
	hpa@zytor.com, jgowans@amazon.com, kexec@lists.infradead.org,
	krzk@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-mm@kvack.org, luto@kernel.org,
	mark.rutland@arm.com, mingo@redhat.com, pasha.tatashin@soleen.com,
	pbonzini@redhat.com, peterz@infradead.org, ptyadav@amazon.de,
	robh@kernel.org, rostedt@goodmis.org, rppt@kernel.org,
	saravanak@google.com, skinsburskii@linux.microsoft.com,
	tglx@linutronix.de, thomas.lendacky@amd.com, will@kernel.org,
	x86@kernel.org
Subject: Re: [PATCH v7 17/18] Documentation: add documentation for KHO
Message-ID: <aBl0kUIKryH5AUD5@archie.me>
References: <20250501225425.635167-1-changyuanl@google.com>
 <20250501225425.635167-18-changyuanl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7/7+Tnuu7kTtOC0+"
Content-Disposition: inline
In-Reply-To: <20250501225425.635167-18-changyuanl@google.com>


--7/7+Tnuu7kTtOC0+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 01, 2025 at 03:54:24PM -0700, Changyuan Lyu wrote:
> +This document expects that you are familiar with the base KHO
> +:ref:`concepts <concepts>`. If you have not read
The reference label is generic and can collide with future patches.
It should've been disambiguated as kho_concepts instead.
> +them yet, please do so now.
> +
> +Prerequisites
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +KHO is available when the ``CONFIG_KEXEC_HANDOVER`` config option is set=
 to y
> +at compile time. Every KHO producer may have its own config option that =
you
when the kernel is compiled with ``CONFIG_KEXEC_HANDOVER`` set to y.
> +need to enable if you would like to preserve their respective state acro=
ss
> +kexec.
> +
> <snipped>...
> +First, before you perform a KHO kexec, you need to move the system into
> +the :ref:`KHO finalization phase <finalization_phase>` ::

kho_finalization_phase to disambiguate label.

> +Next, load the target payload and kexec into it. It is important that you
> +use the ``-s`` parameter to use the in-kernel kexec file loader, as user
> +space kexec tooling currently has no support for KHO with the user space
> +based file loader ::
> +
> +  # kexec -l Image --initrd=3Dinitrd -s
> +  # kexec -e

Use full paths to kernel and initramfs image.

> +``/sys/kernel/debug/kho/out/scratch_len``
> +    To support continuous KHO kexecs, we need to reserve
> +    physically contiguous memory regions that will always stay
> +    available for future kexec allocations. This file describes
> +    the length of these memory regions. Kexec user space tooling
> +    can use this to determine where it should place its payload
> +    images.

"Length of KHO scratch region, which is a physically contiguous memory regi=
ons
that will always available for future kexec allocations. Kexec user space
tools can use this file to determine where it should place its payload imag=
es."

> +
> +``/sys/kernel/debug/kho/out/scratch_phys``
> +    To support continuous KHO kexecs, we need to reserve
> +    physically contiguous memory regions that will always stay
> +    available for future kexec allocations. This file describes
> +    the physical location of these memory regions. Kexec user space
> +    tooling can use this to determine where it should place its
> +    payload images.

"Physical location of KHO scratch region. Kexec user space tools can use th=
is
file in conjunction to scratch_phys to determine where it should place its
payload images."

> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +.. _concepts:

The label can be ambiguous. It should've been _kho_concepts instead.

> +.. _finalization_phase:

The label should be _kho_finalization_phase.

> +Generally, A KHO user serialize its state into its own FDT and instructs
"Generally, a KHO user ..."
> +KHO to preserve the underlying memory, such that after kexec, the new ke=
rnel
> +can recover its state from the preserved FDT.
> +

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--7/7+Tnuu7kTtOC0+
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaBl0iQAKCRD2uYlJVVFO
oy/8AP48Fa7VB0kwt+kqGg4VMR/+tEgBDGxzTX5HXZWYD5fZLQEAm6XrPJBViu5A
Mpce1oumgUOmlwq+sRSgixha15i4eAo=
=lxMZ
-----END PGP SIGNATURE-----

--7/7+Tnuu7kTtOC0+--
