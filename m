Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98EA7275847;
	Tue, 29 Apr 2025 06:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745907353; cv=none; b=WAeOHUBetn2TdKYLYTcL3+1vVPSXbX3JydSTu/ncPdmL8wAPeUlQ9b3jfwiUmU/x5fJoYHv7+ZVqHqOnyC7yJ5qsBS5iMGYDfjIgMef/XByTL/suTXVQoq8agQrhUcND496ZbKrVmQHX/6nKtB/RKg77qKeHAjrh381Qt7KUQ/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745907353; c=relaxed/simple;
	bh=V/05QUKokA9PLStiHO9AjC4yP/5vMfqTiNrPgfV3/cQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VmOyUsWYUJlCRdChC8oBYG00ealTSV11ZeIdvMrJDJ0qbOlLFeBz9f1MqN0yRbbEpRyF2zsx91ZftyeXomIa7mxg2LEODdftsqnt4LRUI8NY3q0KAC+phTfLKCVpDQtgMr4XPj/OKaPp8Iw7aGvZCfOmmEzLB3/xCOZYcnOOU0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TZoGxGQE; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TZoGxGQE"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5498d2a8b89so6178475e87.1;
        Mon, 28 Apr 2025 23:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745907349; x=1746512149; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vdeBVGMv3EeHNQcfEmg6IWrksh7MnxsHjLGKMctwm1Y=;
        b=TZoGxGQEXZcoHJeWvSLI0Uu2yViWT6Q+0Z6psFadqFd2hMOirKL+mUKtM/QSNEwe2g
         sCNsMSiHzvFNY5A9BwOt/Hi2DXAHOSOMdHXNoxGnLPT9s0V4Lr8i1a1OQtxcLzX/XGCz
         sL8r5xXKQ8DEkIlYUA9troNEAxSxUvbDUp5QEaoQhX43YJ/DK3ioC96WCMArfCB8RbOy
         33r8leCnQp9aRO6sQkNr179ZeRJKiTraiIIkupdnH5Gg7pQyvx3AMyHa0nl0POetyhsd
         4ULXBILvIT/av8JeKaqlgZhZinIr4extK6qEH9SoYdj5sDq8vOz/DijjshdNPmMxOjGl
         zDyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745907349; x=1746512149;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vdeBVGMv3EeHNQcfEmg6IWrksh7MnxsHjLGKMctwm1Y=;
        b=KkJUo24nna4nUoRlOwdhvrbIcnb95kKWoNGq2NbjXUJZDh27+iHfj5t1B5TFlC7T15
         hZxWvKkiCz/KKHpiJBOd9MujH2dmC2lydhwPTuyi7WnHkNt6+Nrp2Pq8BLI1pSu32xxl
         nfFtysbPxZFp21MM+8pr4fzLPnvHCVI+2MoivT+20VplKgbpdtJLaqa94gNv5/pBMJ87
         wrorEKo5ymusuVoiWsv33DqJV0OMooZetjdFChn+rdgil+6djMcTHESioTOWojmj2kPe
         Mpk2CXhl/z+eCa32LPsB/sQgUdIbEkG1DzPCpEtfU/wj+C6DPRHWmx9A9EBtDbWtgfsk
         Krsw==
X-Forwarded-Encrypted: i=1; AJvYcCU9eCwcmco9xHix0swgpGC28maXlqcF6S3B121jLKck5nxpSh+UscD1QKQO1j3sj3TiSfHuG5/dZ9LJ@vger.kernel.org, AJvYcCX7eV9tZRkArA9a3TllLWu1VE+Q6c6P1KwIdH0tKvwc0PgUwp8MLEiSvV9U/jwfHnH8WC1m3gxDQAprmBZH@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx9dd8UxdXI/9f50GWm6ZcPw5ygaWCNcWP7MZfVashPT7Y/mZp
	4MFqzqnx06CwsNHGx8cuZqTTSg3jyxw0k1T/t+/nyy6gj0sOn4HZ
X-Gm-Gg: ASbGncu3iqm+2AHUJg3YgzQuZbx55NgVFgiXQRtaon01M2AfHwrpMH5MZW9pr9bBziE
	/6Gf/EOgSEK+GXeMeEgbZiDD56e9MQMwfNO4N9JlbUbbEumVwYqsUEoY+70bmK6SsbIJvcAs5li
	vxwvRwDgkM322XliM6tmeKcN/qazDEPj0v0P2toK8IIHHkfHd7En7+lVqm/hbAq4pMLuYI6XI+P
	CtymZxj7PA4uJkgRd1KHnqkawa8vXNVJ+cCsFXKZz4rdcYwPKEm1Fh1DAba+l/oNDsZfU9aoUBw
	H9IxN4LHYNkDfAhaJ6SJpsSZyr7deH7f0gyPqg1DqBM/JzG4d06dQ1wT0pOm9W5K/dCDAX69kez
	geg==
X-Google-Smtp-Source: AGHT+IGHq680Q/yIwZxRZ6SNR21MxIbxN6Ov+BKDr4VxC9RTincmJ2pI9pWeYdHHGigYUqe2fr18CQ==
X-Received: by 2002:a05:6512:1094:b0:54e:819a:8323 with SMTP id 2adb3069b0e04-54e9000c35amr3096126e87.42.1745907349282;
        Mon, 28 Apr 2025 23:15:49 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e903aa6dcsm1141164e87.236.2025.04.28.23.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 23:15:47 -0700 (PDT)
Date: Tue, 29 Apr 2025 08:15:44 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Thomas Zimmermann <tzimmrmann@suse.de>,
	Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v6 2/3] drm/st7571-i2c: add support for Sitronix ST7571
 LCD controller
Message-ID: <aBBukAqH3SKV9_Gl@gmail.com>
References: <20250423-st7571-v6-0-e9519e3c4ec4@gmail.com>
 <20250423-st7571-v6-2-e9519e3c4ec4@gmail.com>
 <CAMuHMdUsP5gcTyvqJM4OUFL3VutzDrX-V23uYRfnfgzotD8+rg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="QDuqjw5mtcb8cj4X"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUsP5gcTyvqJM4OUFL3VutzDrX-V23uYRfnfgzotD8+rg@mail.gmail.com>


--QDuqjw5mtcb8cj4X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Geert,

On Thu, Apr 24, 2025 at 10:38:33AM +0200, Geert Uytterhoeven wrote:

[...]

> > +                       /*
> > +                        * As the display supports grayscale, all pixel=
s must be written as two bits
> > +                        * even if the format is monochrome.
> > +                        *
> > +                        * The bit values maps to the following graysca=
le:
> > +                        * 0 0 =3D White
> > +                        * 0 1 =3D Light gray
> > +                        * 1 0 =3D Dark gray
> > +                        * 1 1 =3D Black
>=20
> That is not R2, but D2?
> include/uapi/drm/drm_fourcc.h:
>=20
>     /* 2 bpp Red (direct relationship between channel value and brightnes=
s) */
>     #define DRM_FORMAT_R2             fourcc_code('R', '2', ' ', ' ')
> /* [7:0] R0:R1:R2:R3 2:2:2:2 four pixels/byte */
>=20
>     /* 2 bpp Darkness (inverse relationship between channel value and
> brightness) */
>     #define DRM_FORMAT_D2             fourcc_code('D', '2', ' ', ' ')
> /* [7:0] D0:D1:D2:D3 2:2:2:2 four pixels/byte */
>=20
> So the driver actually supports D1 and D2, and XRGB8888 should be
> inverted while converting to monochrome (and grayscale, which is not
> yet implemented).

The display supports "reverse" grayscale, so the mapping becomes
1 1 =3D White
1 0 =3D Light gray
0 1 =3D Dark gray
0 0 =3D Black
instead.

So I will probably add support for D1 and D2 formats and invert the
pixels for the R1, R2 and XRGB8888 formats.

Could that work or are there any side effects that I should be aware of?

Best regards,
Marcus Folkesson

--QDuqjw5mtcb8cj4X
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmgQbosACgkQiIBOb1ld
UjJ8hBAA0PylSTjAVScRP2Rlx1rrCav8iBWJi/3/qrUdk0pKJiMyibtLJkx8M6VK
1CgpOTPMOdMvoeoBdqqQfUMdQX2V3uW6NUHSJizQEVuUPIRklwahRg3jI0BlnE1o
QVcSCbBr527o9jItXC0B0bNlBmKUbqa1v0jKaAtH/+ZU7KsTjr+jI7HVvUdHwcpP
gSdpWn5f+hw3GnlAP9JzGvDddPmniwjTNxJbaUEqxWsQCidsHLNicSne4kFCifZ6
5JVZki7KIkIjW2czWyZxmlBUqvVZX5Yxskmgdq4pjZ8MwAL8xtT2zorZmwIJJtGc
MoRTcPPuMMzIAhwUQow6DWTx+AAwVadn+1wdsnEHHJzBVTRsiWn3K0pMciCDQF4C
mr641j8DNfMBK8bzOT87T6gu9BNn4abR7asSG1n8L3Cvil0xQRXmZ1tgD6s6cxBy
2e1LzVekrwwLQy2Zo8jxFxwvBApLDLDeXnfxyhJj9hDUvqIzQzp0YAk29JiIJsoh
Eer3TWAvq6bpWA014nyidG2I87zejonG1W4zL67Je4toNjSmmraz5msX9vLv9dd5
gtGddzJKt9MH5GPzHPaByPWuKySv2PpIs7j0VTenDEfoCYGEJ67yXKIdXfkyhf44
yDWrPIN/JnRcjR6xPQLCXI8w/C8MHGFz1ynR03yJ5ZvILssPTaY=
=iaUe
-----END PGP SIGNATURE-----

--QDuqjw5mtcb8cj4X--
