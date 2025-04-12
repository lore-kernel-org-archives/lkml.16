Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC581C5490
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 12:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744461888; cv=none; b=dbSwjvryj0MvBMoOtTfNBhNYUxlhtqh1WDh0tK6DE2l2ntNba19szfPmKSjdBvNbOmEgph3HR3auX7y5abJ7of7obVNyQg/k4sKxOsa23yKRx/U8Uxtu40qQcnqXNjYDt9SpuDe3vaLnDS2KALe8s0YXeaXf3EZTmBMhsrUTKxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744461888; c=relaxed/simple;
	bh=BXN5IJBy+U/r1XxX80UAHKirNCDRL5Ui7l8cqOrBEuI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FoUs7wLZ4QSzvUsXl246qin5w7lCTSwnzWA8eRNPIEcPPqfhqtb0nLklmkix13uWGARRJp9TaqV20HcYytoeI68HA8IURGVBMM1vPChFwjQZkYtIF1fjIeYaEn34r6r8/hqhWeQpyhKQ8/KREHdc62BXKYDXvOBt/cAzh5p/Znc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=2xxtZZA5; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="2xxtZZA5"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aaf0f1adef8so517447166b.3
        for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 05:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744461884; x=1745066684; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q9LJm9EGmJPHbvs5a7/gVifsXirV3Rhzs2NwLcaoK2Y=;
        b=2xxtZZA5dJLxz9Yy1oEQl1bCld0KpyLC9e9KlHM2PCnWkO16l8daDrJmPzTdhZzi40
         d7smgV0gTSaNWQmM9uZ9xtwsbnR6iS7LzdTSrx9x0fih3d0rBLuSO4EpnyOaJ5lOB+ai
         vPVb2t1hbAO59A9Tt3k4u0DKGGMJGEZJRxWy0I10cfr4yTXx4Hyo3OMyD87wWzkEZ8PS
         jHmP0y5x4kYy/fE6ptrCmM3tcFdC8VujyviBqG5+gqeAYzZX3r/LW4hQ8a/LQyh3PKi8
         eUnouxTnMmUBPOtF5zkm5juOHIS1thbBagXyVBbi/OagWpeYqfqhHoKywr76GmWW/qLC
         pfFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744461884; x=1745066684;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q9LJm9EGmJPHbvs5a7/gVifsXirV3Rhzs2NwLcaoK2Y=;
        b=PBLzT2lyI1W7UKiuynjQHBvOfy+Akcu1jz6p/cwAu9xmTDwTDrfnvrD0SiE66Me1BB
         DeWT5J/ZfGBa71Y+dRVdyAhwnb1UnK/b3xZ0vFAKieXbG8CiZDj2l8/WLy+Otbp+u8Dm
         d9c0QGE6ysNr1ieEyDbrMPVTXb3SBl7mnKIeqU3/oQxEzq5poDUHyOdBgysxbZqEIpIE
         NgBj1ZuJABOKAFarya6/xCWAAUeIc7Wf/Rd8zRoCThgRPqOGeZWKlExHAWboIBKFJmVP
         3ZeuOsJMEYtSHYA3zviMlJ96o73RIPWbRs62rkaCc6xf63knswRxi076UfcJikB0z32V
         Qwew==
X-Forwarded-Encrypted: i=1; AJvYcCXN/ln2hJjI47ZFgMMlvpTVQcc4+YdDhcZGP6bjVaRkxtck1ilN+81wn5/ikNGCNk9m4Qj8Af/i/nFmiZU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl4QCfhRx6NubzkRgSDjJ4LNySeE/q6J6NnG6pn734jevyQDBP
	oS3Lzz/RvG7MAUbTQUgk9CD/FsPqTWejcW5WMPgFoDsONbBJSgsJblx+e8wONNw=
X-Gm-Gg: ASbGncvGAMBxxdDKga1PmonlRfMdeR5S99OVZjiL0vuWU0J7kiuDNR+i27Cbcq1WV22
	YbpfixpA1cI6oXXXuKY+AviYyK6R0L4uQGwWRPAN18KRPjtj2fj473qwlHZMC5P+f8bq9h+Tm8E
	feYYFewU7jSu0QMRvdQAi0/NQ0N7WeHYqXBN2+yt8M2lzBQ5szuEH2DWIOcSWkwUhLfN2yO+TNX
	KYZw1EVtRMvvgP94rXhoYnuuTgoufxwL2JIlwuzzlTQeIxJjJWzqZMAB/pmXHyKDNvdHcrEAR2T
	AeuPkHApzKNCxO1qtuokgF+VXIeJb8TANZElA54xQsG/nw==
X-Google-Smtp-Source: AGHT+IFDjG6IwXL2D/vHahVH43yBABIgjB4DWpSp8xfVirmah2ldFLYOZzmBiVJ84VzE+7aHO3wzSQ==
X-Received: by 2002:a17:907:3f1d:b0:aca:d2f0:d291 with SMTP id a640c23a62f3a-acad34449acmr590784866b.5.1744461883538;
        Sat, 12 Apr 2025 05:44:43 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5f36ef562b6sm2306964a12.24.2025.04.12.05.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 05:44:42 -0700 (PDT)
Date: Sat, 12 Apr 2025 14:44:40 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Trevor Gamblin <tgamblin@baylibre.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Josh Poimboeuf <jpoimboe@kernel.org>
Subject: [GIT PULL] pwm: A set of fixes for pwm core and various drivers
Message-ID: <7ebsnb2uoriokrmxswii64fiqjmtnojq26gk3xu733bgblmcm6@4rpajnkrc723>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3i2ttvofc37ysysw"
Content-Disposition: inline


--3i2ttvofc37ysysw
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: [GIT PULL] pwm: A set of fixes for pwm core and various drivers
MIME-Version: 1.0

Hello Linus,

I was unsure if I should send a fixes PR given that the problems
addressed here are minor in each patch. But given that there are six
patches now (which is an unusually high number for pwm), I thought
bothering you for that is fine. These commits were included in next
since next-20250408, the first three patches even a tad longer (with a
different commit id though as I added a Reviewed-by tag since then).

The following changes since commit 6df320abbb40654085d7258de33d78481e93ac8d:

  dt-bindings: pwm: imx: Add i.MX93, i.MX94 and i.MX95 support (2025-03-10 =
17:13:54 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git tags/p=
wm/for-6.15-rc2-fixes

for you to fetch changes up to a85e08a05bf77d5d03b4ac0c59768a606a1b640b:

  pwm: axi-pwmgen: Let .round_waveform_tohw() signal when request was round=
ed up (2025-04-07 15:10:30 +0200)

Thanks for pulling this into 6.15-rc2.

Best regards
Uwe

----------------------------------------------------------------
pwm: A set of fixes for pwm core and various drivers

The first three patches handle clk_get_rate() returning 0 (which might
happen for example if the CCF is disabled). The first of these was found
because this triggered a warning with clang, the two others by looking
for similar issues in other drivers. Similar patches were merged earlier
for v6.15-rc1 in commit 92b71befc349 ("Merge tag
'objtool-urgent-2025-04-01' of
git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip").
The remaining three fixes address issues in the new waveform pwm API.
Now that I worked on this a bit more, the finer details and corner cases
are better understood and the code is fixed accordingly.

----------------------------------------------------------------
Josh Poimboeuf (1):
      pwm: mediatek: Prevent divide-by-zero in pwm_mediatek_config()

Uwe Kleine-K=F6nig (5):
      pwm: rcar: Improve register calculation
      pwm: fsl-ftm: Handle clk_get_rate() returning 0
      pwm: Let pwm_set_waveform() succeed even if lowlevel driver rounded up
      pwm: stm32: Search an appropriate duty_cycle if period cannot be modi=
fied
      pwm: axi-pwmgen: Let .round_waveform_tohw() signal when request was r=
ounded up

 drivers/pwm/core.c           | 13 +++++++------
 drivers/pwm/pwm-axi-pwmgen.c | 10 +++++++---
 drivers/pwm/pwm-fsl-ftm.c    |  6 ++++++
 drivers/pwm/pwm-mediatek.c   |  8 ++++++--
 drivers/pwm/pwm-rcar.c       | 24 +++++++++++++-----------
 drivers/pwm/pwm-stm32.c      | 12 +++---------
 6 files changed, 42 insertions(+), 31 deletions(-)

--3i2ttvofc37ysysw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmf6YDQACgkQj4D7WH0S
/k7LSQf/UX24apQltg4p9pW7xTxFE5hIv1Vjs1w7jLYIHMV9nT0IepC8sWVB28TS
NotRH0DToWv3KP9hINd2/WKaYpxQDjlrbnFMN7xn9CWW9g38HXZIgC5obZwrfOb0
GlfSscBOYMouqykFhgN3VxvCqMSIFMyYdJ5h268wLfXHViqTZglBy1O+S5WTXvbk
X7qeXyYVlbZJKfpHhCuadjsMEuw0zcylV1zmt1i5q1jBD5RrMzyBj6ye89GF0Dbb
HhqeyuzMnCuUeJNFGGLGYs7+gSCOtdh8OeTclJXUo3WPNvYCgOhd/6KqWJG8+Q6r
RBevPH5VrjSopbYFgmgiGifSrCH9xA==
=sQm7
-----END PGP SIGNATURE-----

--3i2ttvofc37ysysw--
