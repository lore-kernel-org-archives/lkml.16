Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C069426B2A3
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 13:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751378321; cv=none; b=j0VzXNIBHN0nrZWsw0oCx8Z5H5MGuQje21wNfaF+pScnJiYeTew3tQveMHlDxwiiwq70sgkzt7wR6IucLNHDAefkLD5IODGwAhiw7nP3ReRObPYsQtFPCB+uMqnXYqDlA0nF4gVwCRGoXt8qOawVsHCLYInNTLq8bnUQwWRS4TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751378321; c=relaxed/simple;
	bh=LAJx6orkCDOYtySCgavN0b29eXKWDYf2ZDwlrOBZFWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OiJCG2bF11rk9Tmf5cXyZspQjZpGs2XnCV3GCrTVmw83uBuK9v1QCWei+5+hz891XIra9qoFmDWCHvy8st+mwM0WQzImb6omls5HRM+5hH206SHvR0QW2BTve50Gn6SaaRjf9ROeR56EiR4SkkbtC/fMMGhkM/Y5yDW4kJrA6z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=HfD9ep41; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="HfD9ep41"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ae0a0cd709bso1325720866b.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 06:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751378318; x=1751983118; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LAJx6orkCDOYtySCgavN0b29eXKWDYf2ZDwlrOBZFWg=;
        b=HfD9ep41EZ2K48tldagWmkSGYZYIGZE84ao+oDsMUHHqKv7lyHop2RhOfB4D6ZKV+y
         sHN+z6sR8MMkYzZDc0GZybPWwniHXsCsSU/yMTHWPyfri4flsbsCojulCFGHpqSeOJZz
         7f07XLEdts83gojGJNRl9YgNjQTt12qTL7bzQ2r32q1EY6JJLXCVeaHEt7yrssNEAhDU
         1ybGv5TAv/PSpwVzMV9RkTrAMKS2u3HUSDZLWp8JngxGw6RjWrBKEkmPev0I2AIAmaLS
         Mi30E+GrjtW3VCKEkT9vbAaqxTdVOCrvdfEtg09wlr006KPUp+w7KQjBYNf+25199HUI
         HQJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751378318; x=1751983118;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LAJx6orkCDOYtySCgavN0b29eXKWDYf2ZDwlrOBZFWg=;
        b=fJ6cIO8N4T+isDE6gz8KK5dEa5PMktoGGaoLgp5XUChXpLTHQxxZVMPdTBxemLqeAj
         jduPhgicpr1j6zie+OIxdowI4LPUxTZKozjzblMdBKozQz12s98Q/IokvljFaktjJ6aQ
         40og1CysVX3OtxSMAVx0gk5ddDQMYxOs/MW+Q/s1Juy83tUn4dkpP/9ZuShDk1wOETc9
         HwRqxkSzZZq4Bs25vB2t86U6AjPUdAzMMuCgBN8/UbM/3pPMSESpzqq+aE9VdR+nSqwh
         MyGO0m0pGHnMZd+9cHTPcWv2qWAxZU3FGn4i2yH7sdbGWkaxzZkW/m8DLlbKmVFkwfKq
         +zjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhZqej2B0YctxNaIaky/tGJJttPtFvyB/FyvYxAfJFiR9zGadcaseCSBUZ1zYD/k68wgwgGXMjdvUIwPQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ88JjVm9KDQgnzalpTgKqRMDrWuYjbeNkhQ/xGXDmDwAclXYz
	FDOooAwb76QY8ntT4dBBreMvIAnh2zc4TwhG3Nn5nDvoPHSvmIXhOiI7YomqCDAje2Y=
X-Gm-Gg: ASbGnctAN50bC9Cs/xNpExFxOmCJWLb6hciC5R4SIhRkN865nN2W9NOCSEQxceF0sL5
	ISdAEPsvwdX51oQqFWh2QZN3jQRLx6TLNPwbeqKAimQchKpJofTCkFyEOIOy9YzYZN+xwtAgI/u
	7qFdtnYdG0CKtYSKOcjil1B3xkYk2dPdxlND2QApgD1IcmH+ZhXF+gxSlVuHuWByDksh8dfOteX
	T2NrPkb89O6Rkz5OlWvB3grzMN5QLltlZ8Aa2/JyMfli5fIgNoyncQAEjlovRKBZfXdwnLbU0Xd
	hanqnP+E1XD48FrH8gaIrQlFI4lmHhuC07zpmAD+EZFhYbWQU7tRQrl/2IuK7ilrMBrb3ryUXvv
	5mF/M31e39GMqr4yaysxk7rMyAUT9
X-Google-Smtp-Source: AGHT+IEErW/1m6kWJI/QUl1/GgPvWkXJOdlssf+ecP9RtQLtNt2Q/z8dOm0v3kXyntLM7RrDaEuzZQ==
X-Received: by 2002:a17:907:6089:b0:ae0:c092:ee12 with SMTP id a640c23a62f3a-ae3b0b3b182mr228151766b.22.1751378317932;
        Tue, 01 Jul 2025 06:58:37 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ae353ca2159sm895363066b.178.2025.07.01.06.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 06:58:37 -0700 (PDT)
Date: Tue, 1 Jul 2025 15:58:35 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Agustin Vega-Frias <agustinv@codeaurora.org>, 
	Marc Zyngier <maz@kernel.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Markus Schneider-Pargmann <msp@baylibre.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] irqchip/qcom-irq-combiner: Rename driver struct to end
 in _driver
Message-ID: <53ugz6qg3rfgpcokrre6sqfr73tdjwiz67dvgvlnbiu6kkyc5u@bapjxdheqrzt>
References: <20250630172333.73614-2-u.kleine-koenig@baylibre.com>
 <87ldp9m7la.ffs@tglx>
 <gbjim7wxszmwfvm523bgyfxf5mk5773pafdxnf2wf4mgaebsmz@qfeejv4ilwxv>
 <877c0smgip.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ew7zmkwgcjmemgph"
Content-Disposition: inline
In-Reply-To: <877c0smgip.ffs@tglx>


--ew7zmkwgcjmemgph
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] irqchip/qcom-irq-combiner: Rename driver struct to end
 in _driver
MIME-Version: 1.0

On Tue, Jul 01, 2025 at 11:01:18AM +0200, Thomas Gleixner wrote:
> On Mon, Jun 30 2025 at 21:40, Uwe Kleine-K=F6nig wrote:
> > On Mon, Jun 30, 2025 at 08:01:53PM +0200, Thomas Gleixner wrote:
> >> On Mon, Jun 30 2025 at 19:23, Uwe Kleine-K=F6nig wrote:
> >> > The modpost section mismatch checks are more lax for objects that ha=
ve a
> >> > name that ends in "_probe". This is not justified here though, so re=
name
> >>=20
> >> That's a truly bad design or lack of such.
> >>=20
> >> Why can't this muck use foo_driver(name) foo_probe(name) annotations to
> >> make it entirely clear what is tested for instead of oracling it out of
> >> the name itself. That would make it too easy to understand and analyse.
> >
> > I don't understand what you're suggesting here. Either I got it wrong or
> > it is insufficient because every object is checked, not only the driver
> > structs. That would result in more exceptions/special cases than we have
> > now.
> >
> > Anyhow, I agree that depending on the name is unfortunate, maybe we can
> > come up with something more clever?
>=20
> That's what I was referring to. Doing checks based on struct names is a
> bad idea. Having distinct '...driver_probe(name)' and ...driver(name)'
> macros to distinguish the functionality is the proper thing to do and
> way simpler to analyse than names.

A driver struct should have no reference to .init.text (i.e. no callback
to a function marked with __init) no matter if it is registered using
module_platform_driver_probe() or module_platform_driver(). But even if
the requirements for those were different, how do you signal in the
binary if the driver was registered using the normal (i.e
platform_driver_register()) or the platform_driver_probe() way? Or do
you want to check the source file?

And note that if you have that, you covered only platform drivers, with
a bit of luck mostly all drivers (note that console drivers are special
and are allowed to have an __init callback). modpost checks all objects,
not only driver structs.

Best regards
Uwe

--ew7zmkwgcjmemgph
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmhj6YgACgkQj4D7WH0S
/k6Usgf/VQP7NM8MPg+CfR2etODmmBWc4JfKDQlAng0P/qelWDhiNY9LzE3y8ApZ
Gxx6fIqmcBIU1xHF0+ti0JuOdYyn0baF6SWauNZ+ALSRAYA4HmCJHnnvXzAfWIe8
OzeOfxSjgQLVmfuG2SWsRpjTwYZdQpVBIp6yZVNcf05vBHJfSq8Gywu7kYXCPAs4
0wgGcYfav+7ZadCczVuDd5P5rW2cQzpoSoFaAyGm8Gw3rKu5xEBxUfIATfxWBjTc
nlwkteyoUWXwp3xfWOK5UvKFgg4HA0YaoL5+X3bpn70tVLld/0lp1OWEGEnJvdn9
Fseh/gg5shlM22YYWg5a/+OnxHZLag==
=HqPr
-----END PGP SIGNATURE-----

--ew7zmkwgcjmemgph--
