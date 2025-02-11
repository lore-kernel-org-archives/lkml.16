Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6741F190F
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 10:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739269948; cv=none; b=h6RJshkoFh8lUEUrJTp7XuSMTswhMuaF0CPN4KKWUf+Tv6af6Az0mNUCDVgTD4OyvqithsThm/NO7uLIYwrclqHjuJgmwMrmzCkLXGlreoTNC/QcJQR3VKQ8x8no6p2HIUajav7CN0RsYD9DqYsCTpC0h/Oy53XcK7BtRCNCt9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739269948; c=relaxed/simple;
	bh=w63Y7CdySXiNEBrlXLpVDv44ltZ/eunR/96BkjIzWl8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EXHiuBmauLf/NSw+FTMdoNQk/m7cjhsCkuh2Rg8hRcJTYGROMKGLKueumb5pSXbCZxsrPF0qr46P+jZakUBnrzQut39uYvQmSJLImsiejV0G2jwMpo/RUEhqP3b6xparUFvmgejwHmg0lNS0vPfQxCCEsKzigxtgiS5GtO1QyyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=E5gZY1Os; arc=none smtp.client-ip=209.85.218.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="E5gZY1Os"
Received: by mail-ej1-f67.google.com with SMTP id a640c23a62f3a-ab7cc0c1a37so275269966b.0
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 02:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739269944; x=1739874744; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M0yLasoamk0iZKc/1URT52HRA1WbzmjHTzzeFRUfCcY=;
        b=E5gZY1Os651frAidogXScvoRhhTseaSx2LrGW0fpt/NQ4Nti02Z/NoGBOkzcMr4vw+
         6ficVC1kPpCVlhvVtVMfDjG2SO8WqyQzS2v1662kMJhO3tmXXHApXnCHNuCJ6ToY6l+i
         0wkXvTP3CZ6eSRao+57FfxxzUW2mkKxu1FJez2Uti0Sg1L8dD6w5di1FnR5kKuwD6IwW
         e5ogPFwKPTHrVLBeMKX0WZqeEqJdA+osC9yrh2nGptwTLgXOFpgbAk9egyr8ITfmG4eM
         3tTdBoSHYA1POZ4V0Vr22Bxs7iGdsONAzfUlNUCJTOOsbhtVtWwK96LT3xuqvPboJLVK
         gjwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739269944; x=1739874744;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M0yLasoamk0iZKc/1URT52HRA1WbzmjHTzzeFRUfCcY=;
        b=NwXm99oW9ccchR6VcRYKYWyfWKLodUdB2IwkiSxbiaNCXCUs031ONM09Y/BUwGCYlI
         fa6JFhpxbVg0Al9fnYlbvmINkgrhsNN5hWJL8du7Drcffv/3Du8UXl83L53s1m4CAxgG
         hZlTbBbBoD+/j+lx7mQgQInhUiTOq3qDGYmGgHoYY62sJtmSwDabV7jgejtA+Acuya9X
         c96HQqJu0dlE78az9ct2O+2qFD287CbY+RlBwVrcnUQqg1fqCjLnsKuHx14ERD7kEsu1
         Pgadd8YTnisqJbHXaFqTZjDXpCi94FM54pdYDlwIoncm6m7/njCgbwDFisR0iB9bs6G6
         mQVA==
X-Forwarded-Encrypted: i=1; AJvYcCUw8wzzkwekGtEPaqtACTOsd0Ng53XH0D+9KuFGUgfV2KPnDu/dw9JTxlFKlxD8VFUGqbtsduEgZcTmLqA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPhVez6DUbmywNSvh0ZP2tdwYzpAcX7imNxa/nMG/8Wxdg5viK
	ZuFlXCJgrfDn7Ae9vA7p1I18YLCUXrypVtrYME6dPu49SVyleQdz90un/qz80pw=
X-Gm-Gg: ASbGncsNz0g4nt8lUrPRG4Htu9L78xFySVxQwCY6maozitMvSyvpPU+CDY9bMr5fg/i
	jsN3aVanoWfAH0LP+fpB2J/L0Oh2xThwqVsPaySYVv43PfsvR7QRZkUnOYY2mYJEJhwhgMVgrUH
	m2vf87IsruIz5NHF6yfCbpxWVWjcYRnVH2B7Jwbhy1sVtQYnAEpTbiOx6Y2aCgq91SzEl0PUG0P
	+Ze73ZSh8a0ueMCSWMbqDTHZgnpUM8ZVHBdkt/jGJ4VDg5w+tn21KkpnUG/+iej+n4nKjRMZp3k
	6OxbzmV1D+fmtKpX5eizGO3gFkhbBoT/DKL2svzndc07mGNsGiWBmfTfPw==
X-Google-Smtp-Source: AGHT+IGMf65w2KZ71XB7DG3+IsqQbafXRMHudaXgA2XcbRe3nKeXX4+v4pxIqUh75A9POaOb6Z8Wvg==
X-Received: by 2002:a17:907:3da7:b0:ab3:a18f:fe7f with SMTP id a640c23a62f3a-ab789aeacd7mr1759262266b.28.1739269943684;
        Tue, 11 Feb 2025 02:32:23 -0800 (PST)
Received: from localhost (p200300f65f018b0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f01:8b04::1b9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7ced6fe0dsm254720166b.179.2025.02.11.02.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 02:32:23 -0800 (PST)
Date: Tue, 11 Feb 2025 11:32:21 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Joe Perches <joe@perches.com>, 
	Andrew Morton <akpm@linux-foundation.org>, workflows@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Thorsten Leemhuis <linux@leemhuis.info>, 
	Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [PATCH v2 1/2] get_maintainer: add --substatus for reporting
 subsystem status
Message-ID: <7aodxv46lj6rthjo4i5zhhx2lybrhb4uknpej2dyz3e7im5w3w@w23bz6fx3jnn>
References: <20250203-b4-get_maintainer-v2-0-83ba008b491f@suse.cz>
 <20250203-b4-get_maintainer-v2-1-83ba008b491f@suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oui4r6js4wl7mw6b"
Content-Disposition: inline
In-Reply-To: <20250203-b4-get_maintainer-v2-1-83ba008b491f@suse.cz>


--oui4r6js4wl7mw6b
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/2] get_maintainer: add --substatus for reporting
 subsystem status
MIME-Version: 1.0

Hello,

On Mon, Feb 03, 2025 at 12:13:16PM +0100, Vlastimil Babka wrote:
> The subsystem status is currently reported with --role(stats) by
> adjusting the maintainer role for any status different from Maintained.
> This has two downsides:
>=20
> - if a subsystem has only reviewers or mailing lists and no maintainers,
>   the status is not reported (i.e. typically, Orphan subsystems have no
>   maintainers)
>=20
> - the Supported status means that someone is paid for maintaining, but
>   it is reported as "supporter" for all the maintainers, which can be
>   incorrect. People have been also confused about what "supporter"
>   means.
>=20
> This patch introduces a new --substatus option and functionality aimed
> to report the subsystem status separately, without adjusting the
> reported maintainer role. After the e-mails are output, the status of
> subsystems will follow, for example:
>=20
> ...
> linux-kernel@vger.kernel.org (open list:LIBRARY CODE)
> LIBRARY CODE status: Supported
>=20
> In order to allow replacing the role rewriting seamlessly, the new
> option works as follows:
>=20
> - it is automatically enabled when --email and --role are enabled
>   (the defaults include --email and --rolestats which implies --role)
>=20
> - usages with --norolestats e.g. for git's --cc-cmd will thus need no
>   adjustments
>=20
> - the most common Maintained status is not reported at all, to reduce
>   unnecessary noise
>=20
> - THE REST catch-all section (contains lkml) status is not reported
>=20
> - the existing --subsystem and --status options are unaffected so their
>   users will need no adjustments
>=20
> Signed-off-by: Vlastimil Babka <vbabka@suse.cz>

This patch is in next as c1565b6f7b53ea1ea3e757538832e12d7d13d949. It
breaks one of my scripts that I use to semi-automatically determine
recipents for patch series.

It works as follows:

	$ batch-add-recipents audin-patch-v1/0001-ASoC-meson-HACK-let-AIU-export-i=
ts-clocks-through-cl.patch
	#!/bin/sh

	addrecipent \
	-t "Rob Herring <robh@kernel.org>" $(: maintainer:OPEN FIRMWARE AND FLATTE=
NED DEVICE TREE BINDINGS) \
	-t "Krzysztof Kozlowski <krzk+dt@kernel.org>" $(: maintainer:OPEN FIRMWARE=
 AND FLATTENED DEVICE TREE BINDINGS) \
	-t "Conor Dooley <conor+dt@kernel.org>" $(: maintainer:OPEN FIRMWARE AND F=
LATTENED DEVICE TREE BINDINGS) \
	-t "Neil Armstrong <neil.armstrong@linaro.org>" $(: maintainer:ARM/Amlogic=
 Meson SoC support) \
	-t "Kevin Hilman <khilman@baylibre.com>" $(: maintainer:ARM/Amlogic Meson =
SoC support) \
	-c "Jerome Brunet <jbrunet@baylibre.com>" $(: reviewer:ARM/Amlogic Meson S=
oC support) \
	-c "Martin Blumenstingl <martin.blumenstingl@googlemail.com>" $(: reviewer=
:ARM/Amlogic Meson SoC support) \
	-t "Liam Girdwood <lgirdwood@gmail.com>" $(: supporter:SOUND - SOC LAYER /=
 DYNAMIC AUDIO POWER MANAGEM...) \
	-t "Mark Brown <broonie@kernel.org>" $(: supporter:SOUND - SOC LAYER / DYN=
AMIC AUDIO POWER MANAGEM...) \
	-t "Jaroslav Kysela <perex@perex.cz>" $(: maintainer:SOUND) \
	-t "Takashi Iwai <tiwai@suse.com>" $(: maintainer:SOUND) \
	-c "devicetree@vger.kernel.org" $(: open list:OPEN FIRMWARE AND FLATTENED =
DEVICE TREE BINDINGS) \
	-c "linux-arm-kernel@lists.infradead.org" $(: moderated list:ARM/Amlogic M=
eson SoC support) \
	-c "linux-amlogic@lists.infradead.org" $(: open list:ARM/Amlogic Meson SoC=
 support) \
	-c "linux-kernel@vger.kernel.org" $(: open list) \
	-c "linux-sound@vger.kernel.org" $(: open list:SOUND - SOC LAYER / DYNAMIC=
 AUDIO POWER MANAGEM...) \
	audin-patch-v1/0001-ASoC-meson-HACK-let-AIU-export-its-clocks-through-cl.p=
atch

the output is usually redirected to a file that I edit before running
it. The additional line in the output of

	scripts/get_maintainer.pl audin-patch-v1/0001-ASoC-meson-HACK-let-AIU-expo=
rt-its-clocks-through-cl.patch

with your change breaks that script.

#regzbot introduced: c1565b6f7b53ea1ea3e757538832e12d7d13d949
#regzbot title: get_maintainer's subsystem status output breaks custom scri=
pt

I can cope with it, but still wanted to let you know that people use
get_maintainers for `git --cc-cmd`-like usages without --norolestats.

Given that I use scripts/get_maintainer.pl from the tree I currently
work at and sometimes that is based on next, sometimes on linus/master
or -rc1 and sometimes even older trees (e.g. stable), the introduced
`--no-substatus` option doesn't help me because when run from a tree
without your change I get:

	$ scripts/get_maintainer.pl --no-substatus audin-patch-v1/0001-ASoC-meson-=
HACK-let-AIU-export-its-clocks-through-cl.patch
	Unknown option: no-substatus
	scripts/get_maintainer.pl: invalid argument - use --help if necessary

so I cannot use that option easily until all the trees I care about get
your change. :-\

Best regards
Uwe

--oui4r6js4wl7mw6b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmerJzIACgkQj4D7WH0S
/k5YVQf7BAdWhLgXujonyzFFsaUOISFGzCkJyJvs50VgUIBiTkZ5JbdWlS1L7qmB
N7/9b+VwK0Kl2lDY29kaVk7VmzfcragO919FOrNdHBXl3oWArj164euH0v4lNo1S
8K3jL3QbFxcqzih2MlBzZh8kzwYhs6A8C9sfbh7XVsb1KmFddS5v3+CbUsZXYiUl
dDDID96hhkyXN3Vbfray7mYCfHbRcdEUSTLEYhOFjNf0/opHNYVnqGA4zGJq01n1
opI/4grFdZ+hHKQbFhT/e9cqRNg5UO71bE14kmGCJsJS/NKKTQjSdv4Y68Zv+taS
IZRag81HuVa6dcm3OnFUf6Q4P5bA1A==
=/Bv0
-----END PGP SIGNATURE-----

--oui4r6js4wl7mw6b--
