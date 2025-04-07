Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB8B1A8418
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 10:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744021477; cv=none; b=WQf6LAAgaHk8TcPuQ+kVdv5maChvWmcUTdiBdzcBZf6bK6O0yUcthgTOqSaxAAuOH7hggZ42Dd+8VNmHLHFOvwBFsyJH3GVduERwSdrD6DXhJDdRvfRIxs3m5IgGtbZmhmPTNCUOBaniA6Vf6/lDpCqS+8rLFJc4F4850TyB5h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744021477; c=relaxed/simple;
	bh=DyAx4p+d4Yo6UybfGrnNrwrsaiiPORXp5nHPXkTY5XQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WauLzxkwG75ut/nknVum1eyzsm+Ppr14zjdQpglPMLT1Rdz6CX9hMlyo2wUdgs+pEbsriv4KfdEU76rrI3Mnmwez/UM1U3ZDF73NUyngqCX1FFJndO6sun4bLVJCOSJHJhnrliGaL/Hky932IXC29M+YGN0J0TZaRpwYIwu1iIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ATMJBjQD; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ATMJBjQD"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso21811205e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 03:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744021473; x=1744626273; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cHEoQFwXWeEahAsWtVrHWP+XPCjbcIBA59jvijJVzNM=;
        b=ATMJBjQDmHJ1s9N6pdIucYDun/lXZNY92fGrtTgSqgM2EZtov5/6RIdOuQ4Hf9LLGE
         7GDxjKqafcT0F0GGGTEOcQAmWG6O94pzYpdZsox6Rzfg1HzUNrnAvRXvE0bUWucGh6t1
         E2dJp2y54GBmi2GsfiGLfueA47EDVFuv9h9aAk2quJQgWt0tPSHyfy61RRvmUQDT//71
         gRt6+l/0e8FzYFwDHFF1pJEMRFoHZv/Zt6gHaZVyEyWM5uRtIgk0zPP7OR8873Q1e3JL
         FyRX2CtuTSWhzM82RKJQ+oWX22rRi/AoxBZgZUTrJtRrYv6ujK/07UZJ47MzHO+QZyUV
         Hnxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744021473; x=1744626273;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cHEoQFwXWeEahAsWtVrHWP+XPCjbcIBA59jvijJVzNM=;
        b=VaXZJfvUv/sWAZ/N3iTjHWJkbvgmD9QAN4x/h+j7O0duiozPNDE7FMb+nHv/OFMcxz
         jW/jcKoZsyT2UbQGhK1geYA2rPi7rB1E8RWt+4CXC0+yd0Z3WrcuOHCEIcAjEmqDMF+j
         i3Kex20ZBMse1NAA/NIsMOMKp/LqmWscFRvZcPjnP5aoZORJltBepGsgoBcyvWG60G1B
         2hDW5lCcDh1ctu7UomYZ8lZ090gdYSzw4Sw7APLmT13hDeme2WV7Xv582nFQAwqMmyHK
         cDVLPEncJaOLskm8wwp+K7w62NQQDAp9PDxHF7o/MDVIs92WCqcLRU0BLwMmM/dFug63
         aGTA==
X-Gm-Message-State: AOJu0Yy9upA7IQMop8uxQTSJv3pMnmjJwTk+In2HNsE3qOy9t7uEMIIv
	3nVmNsfo07TykHqxHS9zJ0VvAnHXv6nVBFru79n5MhIMsb4NYAFKGES6/wzMehw=
X-Gm-Gg: ASbGncuZlIikAudnNdmC8ATsxez1Y8L6GbDuHYC4ONDPy36DALaPU3QpdbLCUbJmVdh
	JdR5D4pv02GSMyeqHHwURIvd1S8M0J9LyKVnuH9zKFXC0VexNYZo3jHREKumgfeOo97X/rHVZnU
	sfBjzSDt2HWAVEp1aARPSPeh/EFm/GNZ+I/aTBVdCXIZhceJHgUCUcYEXZlhxkzz4D20g4ZWhNI
	NUu7mZbVoMmqBq2dw+kkp+eeJLvjALpEpOtFzVQVVziVR6jF+2WdOnZ9tAjBjnYrcQoURLezjKs
	8t/M0FTYH/Z0nFY41pHETyXqa36n/as9gZ9ubErN9r0cKY2HCa+1tPB5hVpw3hM9to+1BLM1VT1
	Jw5+PF8PnTB8=
X-Google-Smtp-Source: AGHT+IGZWuoPqI5GhADsQ3RuS88slV6GMK9gadfCiV0+cI0VoYQJ9/cpeSLu1FczN67nQ6IYvyNLEg==
X-Received: by 2002:a05:600c:4f05:b0:43d:7588:6687 with SMTP id 5b1f17b1804b1-43ee0664696mr69308895e9.12.1744021473550;
        Mon, 07 Apr 2025 03:24:33 -0700 (PDT)
Received: from localhost (p200300f65f14610400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f14:6104::1b9])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39d753e48f7sm5409639f8f.4.2025.04.07.03.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 03:24:32 -0700 (PDT)
Date: Mon, 7 Apr 2025 12:24:31 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: linux-pwm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, 
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Michael Hennerich <michael.hennerich@analog.com>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Trevor Gamblin <tgamblin@baylibre.com>
Subject: Re: [PATCH 0/6] pwm: Some fixes preparing chardev support
Message-ID: <lzwvrhmx3yqv2v2qkpiq5e542eflnnwvhm63fjmq6szh4bh47b@zk4hifurejja>
References: <cover.1743844730.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="c76mue3amd423vde"
Content-Disposition: inline
In-Reply-To: <cover.1743844730.git.u.kleine-koenig@baylibre.com>


--c76mue3amd423vde
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/6] pwm: Some fixes preparing chardev support
MIME-Version: 1.0

On Sat, Apr 05, 2025 at 11:27:11AM +0200, Uwe Kleine-K=F6nig wrote:
> Hello,
>=20
> while working on character device support for PWMs I found a few
> inconsistencies that are fixed in this series. After that I plan to work
> on getting the character device support into shape to get it into
> mainline, too.
>=20
> While some of these patches qualify as fixes I think there is no urge to
> get them into 6.15, but given there is a bunch of such changes I might
> send them to all together to Linus for inclusion to 6.15.
>=20
> Best regards
> Uwe
>=20
> Uwe Kleine-K=F6nig (6):
>   pwm: Let pwm_set_waveform() succeed even if lowlevel driver rounded up
>   pwm: stm32: Search an appropriate duty_cycle if period cannot be
>     modified
>   pwm: stm32: Don't open-code TIM_CCER_CCxE()
>   pwm: stm32: Emit debug output also for corner cases of the rounding
>     callbacks
>   pwm: axi-pwmgen: Let .round_waveform_tohw() signal when request was
>     rounded up
>   pwm: Do stricter return value checking for .round_waveform_tohw()

I applied patches #1, #2 and #5 to
https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/fixes

I still havn't made up my mind about trying to get these into v6.15, but
at least they should be included in next for now.

Best regards
Uwe

--c76mue3amd423vde
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmfzp9cACgkQj4D7WH0S
/k5h1wf/ePnI78AwsFL73hW/6a3vkcMZT1DX5QGpwIyEH62MofINXyMmZ/DLn3/E
cHpC9YmdK4KjuLW/FjdG/yxNo/Me8osVzWaMTNNbFZAtgVc5gIka3FbfznJML970
5UYLrmq4YcgT+PfECKmwQ5n2qleTpUimRIgUkSIu1GSCutJ47Z2K+SmwW2RdoDZc
ILkPr7uTh3Smp5SMXU1lIXI6p5BrbxHDTtgidp6qEbLLU56zulCqUY8Xc/BaBzQV
oPqykCt5ec5E1NdyLN6OTmQPSrQTFzsQqcuPSRj9E0RJeD12HwC/toKhG13vWAGW
w1Iu0W62/tqWEksU+l9Op9pMMa6u5w==
=PhOu
-----END PGP SIGNATURE-----

--c76mue3amd423vde--
