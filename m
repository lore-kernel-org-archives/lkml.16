Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88FC210F9;
	Wed, 23 Apr 2025 05:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745386873; cv=none; b=WP+t21qDxfWsVWdG1mQbIxAry8YCz2jyLGMssUT99eZ9V+LTfphEyh5Id7XUqcD0O19fEn1iuGJKvkYz3B9fm0hhvLzuExkaziTHPTixyqv1dyT9J1Y6fAff6t8xHKldbgT4zdZ4DwpCgwDMR27GXjIQvpAyaotivLMrzPjJOnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745386873; c=relaxed/simple;
	bh=zsPRY0TiBWxpnqSZaAUdwhWJKup+BPdS4MnfScC1suQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YNyV4lf5QnFjaUD0BabwCBD0EgGBA4eEjGERilepnq+6OvAodl2/bVNF/I9oTgLsHWScoTvmfYlFLpWgU9+UkhrwYXSOUzdDn8jRie8vjGU9l1uh/b9gIOCq750amQdEC5e+dgEYdzIF14mVLJqY4NvgghtUsAiOc6i4aI2JuhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GPdYm5XM; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GPdYm5XM"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3104ddb8051so53972821fa.1;
        Tue, 22 Apr 2025 22:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745386869; x=1745991669; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DR1efZenm2P7g4aFt/2B/58uRm9sc+D/LgJ45nCb2q4=;
        b=GPdYm5XMcTdDOmipL41gjU8iDK/n2zI7VKbTAF6C4T8H613ccpMfbwMKEkhsL1q3DD
         4tyYMrw14zPEkB9bw3TRoB2YmANiAV9892ElPNJuFdVK2oYJf9yVIXE25TfPZgBjpgPF
         nez5q32IzkiDWHSsL+JBWwphtCDQ7Kn1A/xa4y6RgXsxH2kmN0h5yXmzjm1jFVmdD3xH
         Cfkv3A/t9pGzHxDYMFfAXQrDIOh8+jSzYJ1dBoQ8WV/zFoMOHygS2nCHUGe9DSJ5FyB7
         i0AEFY4zuP8XoljYmiADak7dh2qVDrneDtztPgINMhl7THp2SBy/h/Of1NyJozdPwqn6
         DHTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745386869; x=1745991669;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DR1efZenm2P7g4aFt/2B/58uRm9sc+D/LgJ45nCb2q4=;
        b=UdEXrglmxx1m5WdMDo3l2mtYeWatY6g7e51bAMYT7niAPYEwfk/lhwdWqml/pOA6vj
         /lEGj/LFvqqeULzVHbCngQmPLDbsstKm6tlriAThn5aQl5wQyM3yGktBxa0eqSXmHotV
         28DXN8j8JkpQMVsi8Sp1+rOIKpmWux00FiMEQx72MSeKsN9bAE65V9YO4Dc4EguEY0iu
         WBLZ3PkrCLSm37+5rUxFrH8+7+JdHWRNMKrrEBc/w19K5RZH+yGIUIvuJtzlp6d2xU8N
         6gtpKuw0yiZEfqk3qNKmd+Q1PvlymoqkFohoXTdYU3ole2GG11uglXYBcRTadiSXOFSF
         2nJw==
X-Forwarded-Encrypted: i=1; AJvYcCViVPZaF8XM1V5kUfhPFDVi+jeTc7VU3dxwqy3FlAnq9Ry3Txv+Up+On+R7bqC6vlll+etLNEAHqHOU@vger.kernel.org, AJvYcCWUTPzfiT91VEToJAZYLZHd3n141ZwjYrbOUStIH+XauaVZop1v9baE7DLjM+eLWJRQM5+C/TpjUMSC12Mp@vger.kernel.org
X-Gm-Message-State: AOJu0YwT2eljts/QE34+TuRkrrzJlu8t9q4GCgl3E44gC2FV9B7G/Xou
	iAkohphJWQqgO+4qM96Bfk4Z5pihQWRnLhypZeKAidCcBsvo7xn6IAC6dN0uIck=
X-Gm-Gg: ASbGncsNvSdYV3JB5vvw+3qlBq8BKwIfWP6xglmuBwmP7d+YrtrAcu1i4gxIbwGmWYH
	Q09Hxw3mslMpuxrauOq0Yq9yfqP0dWuTlVDdwixqas1zDrEXaQApE0JMhBnGUpKEg0LksQ7lFes
	PeTyfvc+gIAhX7tXCdFSRVSdPo1n4aUOorKPeeB2QGrA+4w2EZfPT4nvOvgb0Cg9PTrqIrJSSMd
	bLCz7uI1Ht3k3DBqjhvtEQ3SkWEZ6nnR+G1Ojq2/KKx7SGhx0SeXifLYtnAuFGUrpaQk2q/FjdZ
	cldlEYFDg8OzYaoKzVCt88jmnuRnwevfp/Pdl/z7xBf+KPpGGGaUOFM4PUpJMPBEbscAo0VxPNn
	SlQ==
X-Google-Smtp-Source: AGHT+IHQHfQNMReW4DBewS6Oyk/+hyQARniOvNCBPWBnCxlka5W1mb3oSEgjNK+uMq63AFolkjntOQ==
X-Received: by 2002:a05:6512:2206:b0:545:48c:6352 with SMTP id 2adb3069b0e04-54d6e658dadmr4907975e87.43.1745386869149;
        Tue, 22 Apr 2025 22:41:09 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e54144esm1388050e87.93.2025.04.22.22.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 22:41:08 -0700 (PDT)
Date: Wed, 23 Apr 2025 07:41:06 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Thomas Zimmermann <tzimmrmann@suse.de>
Subject: Re: [PATCH v4 2/3] drm/st7571-i2c: add support for Sitronix ST7571
 LCD controller
Message-ID: <aAh9ckXlJcXyB3BA@gmail.com>
References: <20250415-st7571-v4-0-8b5c9be8bae7@gmail.com>
 <20250415-st7571-v4-2-8b5c9be8bae7@gmail.com>
 <871ptjbxr8.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vlQ/Rf3bjfEdQ8vd"
Content-Disposition: inline
In-Reply-To: <871ptjbxr8.fsf@minerva.mail-host-address-is-not-set>


--vlQ/Rf3bjfEdQ8vd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Javier,

On Wed, Apr 23, 2025 at 01:08:11AM +0200, Javier Martinez Canillas wrote:
> Marcus Folkesson <marcus.folkesson@gmail.com> writes:
>=20
> Hello Marcus,
>=20
> > Sitronix ST7571 is a 4bit gray scale dot matrix LCD controller.
> > The controller has a SPI, I2C and 8bit parallel interface, this
> > driver is for the I2C interface only.
> >
> > Reviewed-by: Thomas Zimmermann <tzimmrmann@suse.de>
> > Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> > ---
>=20
> [...]
>=20
> > +#define ST7571_SET_COLUMN_LSB(c)		(0x00 | ((c) & 0xf))
> > +#define ST7571_SET_COLUMN_MSB(c)		(0x10 | ((c) >> 4))
> > +#define ST7571_SET_COM0_LSB(x)			((x) & 0x7f)
> > +#define ST7571_SET_COM0_MSB			(0x44)
> > +#define ST7571_SET_COM_SCAN_DIR(d)		(0xc0 | (((d) << 3) & 0x8))
>=20
> You could also use the GENMASK() and FIELD_PREP() macros for these, e.g:
>=20
> #define ST7571_SET_COLUMN_LSB(c)		(0x00 | FIELD_PREP(GENMASK(3, 0), (c)))
> #define ST7571_SET_COLUMN_MSB(c)		(0x10 | FIELD_PREP(GENMASK(3, 0), (c) >=
> 4))
> #define ST7571_SET_COM0_LSB(x)			(FIELD_PREP(GENMASK(6, 0), (x)))
> #define ST7571_SET_COM0_MSB			(0x44)
> #define ST7571_SET_COM_SCAN_DIR(d)		(0xc0 | FIELD_PREP(GENMASK(3, 3), (d)=
))

That looks better, I will change to use those macros.
>=20
> [...]
>=20
> Maybe a comment here that this function only exists due regmap expecting
> both a .write and .read handler even for devices that are write only, e.g:

Sure

>=20
> /* The st7571 driver does not read registers but regmap expects a .read */
> > +static int st7571_regmap_read(void *context, const void *reg_buf,
> > +			       size_t reg_size, void *val_buf, size_t val_size)
> > +{
> > +	return -EOPNOTSUPP;
> > +}
> > +
>=20
> [...]
>=20
> > +static int st7571_fb_update_rect_grayscale(struct drm_framebuffer *fb,=
 struct drm_rect *rect)
> > +{
>=20
> [...]
>=20
> > +	for (int y =3D rect->y1; y < rect->y2; y +=3D ST7571_PAGE_HEIGHT) {
> > +		for (int x =3D x1; x < x2; x++)
> > +			row[x] =3D st7571_transform_xy(st7571->hwbuf, x, y);
> > +
> > +		st7571_set_position(st7571, rect->x1, y);
> > +
> > +		/* TODO: Investige why we can't write multiple bytes at once */
> > +		for (int x =3D x1; x < x2; x++) {
> > +			regmap_bulk_write(st7571->regmap, ST7571_DATA_MODE, row + x, 1);
> > +
> > +			/* Write monochrome formats twice */
>=20
> Why this is needed ?

If the display is 4bit grayscale it still expect each pixel to be
written as two bits. The mapping is as follows:
0 0 =3D> White
0 1 =3D> Light gray
1 0 =3D> Dark gray
1 1 =3D> Black

So here I write the data twice to get a black&white image for monochrome
formats.
This is not tested though, I only have a monochrome display to test
with.

I will extend the comment to explain this.

>=20
> > +			if (format =3D=3D DRM_FORMAT_R1 || format =3D=3D DRM_FORMAT_XRGB888=
8)
> > +				regmap_bulk_write(st7571->regmap, ST7571_DATA_MODE, row + x, 1);
> > +		}
> > +	}
> > +
> > +	return 0;
> > +}
> > +
>=20
> The driver looks great to me now, thanks a lot for taking my comments int=
o account!

Thanks!

>=20
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>=20
> --=20
> Best regards,
>=20
> Javier Martinez Canillas
> Core Platforms
> Red Hat
>=20

Best regards,
Marcus Folkesson

--vlQ/Rf3bjfEdQ8vd
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmgIfWsACgkQiIBOb1ld
UjJrOBAAsndlQ6aC/cblkWzinnmx1bnC6BYv17GBy0hFpsliau7s7sIDAYLiGqgu
U4qqJSrH3Gre8GMEnLVcPpomtng37c/JzZyl3+a+rt07kfaV1Fiq5u8gUi/aV6pm
n7tD0ILy5rTecfYNzdsux062TzkQhu2KhuQPwgx+9oox5op1sY+EwF0Edm89xVZJ
ajYOmmAernVvLSBLhRkwSLFaAWpyDVJ07tpWgkeYqRezaRum8PpzAobIhnVcQEOP
vGtqZrTS7IO59u+J3q3W9l8i9ne+QrWI/6gPwKkNB8BrMz2mm8KEUaLkERW9dLNO
yLumUxkSRzRsimDyfooL9eMqDUaHsUuhN1PEgZfrQhdYGdSgUrhgvKXqODWF/aAx
BPCZxB43ctXXqt15CC9f74u/KzD7lsAvgf6WAasxYnmwkpdhjHnX03vJEkVSvnMb
Rf9UyrLFuMGadiObsikIqPGWlkUM3l90S+zVNBFhTmuYB72lReyFsK8x8PsB99kg
84PIEhg607jKSoKh02Q5QdIFzhhOErTntBR7qnQSLfaDTf+4lsIurzDzmt7XH4fM
phxBpj9WSPJkIt7X4A9QpYnc6olkQ+iCCunywkpFPYJZg7uJmx4HkxI9jCTGXgWJ
rkY2AbyZwykY4UX2N9i3R4R1rrsvsxi2n+JB7TsucVzsZiB3nNU=
=Olpq
-----END PGP SIGNATURE-----

--vlQ/Rf3bjfEdQ8vd--
