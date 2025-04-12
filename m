Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A277D3F4;
	Sat, 12 Apr 2025 06:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744440984; cv=none; b=ufS0EhuXTSeAnMwzZWVs2eJ4uZGdjUaRpn7Vey3/Rlau7KoZrqjI61k3h73/auU+vx6aEODKhonZ8AoD9ZRnUZKVm3ozy2YkPdBR7JEWInr4JdbhjrAZLUPnOuc0s8GMeNaZskvufqhirNquiVDsNlz+Uz9XkFNo9cuIs2UoGrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744440984; c=relaxed/simple;
	bh=p9DrxSAgrFyIsM7PCRkzMoU+bndVBOOf5VxKWx2OAX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YVuuT1oBk1C4La6oN3thSph03Wv5GAOvPluZCCq5qdR9+i/8xe545+R5arjA4sp+EAUJ5S/ouxs15O4cAwo9KcC4EvAVptu9tKxOg5OchV0M4ULcZ3nOhsGIL308EuQL5BclF9j7Cx4cauhUlaQKUY9r+ki71sOPfa7uR8P4x4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M2jtq4NE; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M2jtq4NE"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5499614d3d2so3099627e87.3;
        Fri, 11 Apr 2025 23:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744440980; x=1745045780; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=okI1oMZoAJl0uNnUw8I5uIoWPFzKiOpsfd4AfgQHT44=;
        b=M2jtq4NERo7yIKBn66wGlS3Co2kY/FxsvNW8xukl0BT/OseErDBzeFMz5nOgdJTX9W
         1r9Krur90Jyrmj3vdpUvwJmeCiUoLVv7R0EnMKl9FmQ6VxI5cuxB4rOyXQtfEhKooBVb
         aEM+2cqwvP+aIhUyC0UoQA7gqq+VDL7BhRZZgqageDOTXtnpkqR0tq23uIlekfwdf037
         tJaPK7HBZKG9Ko4XZbAsxVFK8UUadrLEb924hDHLiDp0h+IwxZ1EGIuVQ/OiqMedV6Fw
         uKd/b8uuSnhoAQqzKAh79P7NNLcNNK1PmxZnDWUZhq64Ei8fDHFMp4WCTSXmEYqjzPgJ
         47xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744440980; x=1745045780;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=okI1oMZoAJl0uNnUw8I5uIoWPFzKiOpsfd4AfgQHT44=;
        b=GSAICcfAxzun7mYpqXpufZihfv3rezGVVKMBO/ajBuHsrR2VJI9l0F23d3k3Cq3xzs
         G6Tg2okPGBVpZIEQiYay+rPFDiRJYh87Mjpp+yZA2nLFuDJ2uzy+AAaenCoYGCqWeBcW
         vEnORSv94Jr8ARo6Wpj2RbkaZdI0XM8fga5+HQX/Tk8xdaspjL9akz44/lvJEpgOOqoh
         Y0i55FTFFfdzhzFNeCwY+4OZKkqSQ5g0dTXfZ1RtGVbH7+24XfW46R0NSrPBzc0wO8LM
         JcGjc7gBwcZNhHE1LR4pjA5LjpFBELpqvGjMLvw9S5yT+FPyMUZEacZRskVLqMgGoGDn
         7nkw==
X-Forwarded-Encrypted: i=1; AJvYcCV13IPXdRW08lihv7HotWWqg8rTsQDSBGJxVaAOA5K6JRdDSvK7ZAwzdAycAaecFCD5yOw50byqq2d7@vger.kernel.org, AJvYcCWIvijftikraSsN26DrLNxNLmu8cytA0PUcYJfKu08IgC7tCcGRIX1U1cYO1DdlSurwRm8I0liabK5KtEg0@vger.kernel.org
X-Gm-Message-State: AOJu0YxwZmxrDRQAw5mJ/ZaR1wK8DOl1MGqb5FzmVGp5th0vS0dg1f88
	Zc8qIIWm1CaqMYE+PxBsBLFLN/2BKG2Ete9xbXx5g6Ek8vnBRLLD
X-Gm-Gg: ASbGnctBMypIbiawWpAGrUapNhtqbIzxd5AWDqTj8HyGulAkSdmXTkGg5ddcrg12ySs
	ddWNmnFPZo4LEZmFADnlaIWmbodejZOdaZEu1soexgCJOVAB9xzRvo/VJTdf0sE4GrcyYBMzyv6
	J0r1tgXbM69Fcs0Jp07D68i0EZEBcNKVptuHjVPwnSqVYRfo5HpR2/+v7fGEvWSWhGH1yuTkOUS
	Dh6vnv+c4krHsflOR5AttAeYYo8gO27ut/xHxEi3hz0Md0BY1+b8AyxjNy9wNbOsSVmRaU6AJyC
	Hj1CGST3isVx1fZPnw9+HWhAN+NzwWZ71D5B/x6rnKJQhCSNnMlKlWewvQhY7fTtt6lQc36KfE1
	i1A==
X-Google-Smtp-Source: AGHT+IGVugW8G8nF9ACQpqPJ8sK7GJ9KkuNywioJrsCnO/nXG+tvSMmegSLyXfF7TWPCIM+UIaFYbw==
X-Received: by 2002:a05:6512:10d4:b0:545:2f0c:a29c with SMTP id 2adb3069b0e04-54d452ca0cdmr1785017e87.36.1744440980045;
        Fri, 11 Apr 2025 23:56:20 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d5026d5sm579000e87.155.2025.04.11.23.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 23:56:19 -0700 (PDT)
Date: Sat, 12 Apr 2025 08:56:17 +0200
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
Subject: Re: [PATCH v3 2/3] drm/st7571-i2c: add support for Sitronix ST7571
 LCD controller
Message-ID: <Z_oOkb2Lx3HNhnSK@gmail.com>
References: <20250408-st7571-v3-0-200693efec57@gmail.com>
 <20250408-st7571-v3-2-200693efec57@gmail.com>
 <87cydn9bkx.fsf@minerva.mail-host-address-is-not-set>
 <Z_Uin2dvmbantQU4@gmail.com>
 <87ecy1g8z8.fsf@minerva.mail-host-address-is-not-set>
 <Z_YWq4ry6Y-Jgvjq@gmail.com>
 <87bjt5fz51.fsf@minerva.mail-host-address-is-not-set>
 <Z_iwspuiYAhARS6Y@gmail.com>
 <875xjb2jeg.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="a59oPMzr2RlFIqL/"
Content-Disposition: inline
In-Reply-To: <875xjb2jeg.fsf@minerva.mail-host-address-is-not-set>


--a59oPMzr2RlFIqL/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 11, 2025 at 10:26:47AM +0200, Javier Martinez Canillas wrote:
> Marcus Folkesson <marcus.folkesson@gmail.com> writes:
>=20
> Hello Marcus,
>=20
> [...]
>=20
> >> static const struct of_device_id st7571_of_match[] =3D {
> >> 	/* monochrome displays */
> >> 	{
> >> 		.compatible =3D "sinocrystal,sc128128012-v01",
> >> 		.data =3D monochrome_formats,
> >> 	},
> >> ...
> >>         /* grayscale displays */
> >> 	{
> >> 		.compatible =3D "foo,bar",
> >> 		.data =3D grayscale_formats,
> >> 	},
> >> };
> >
> > A comment for v4:
> >
> > I think I will go for a property in the device tree. I've implemented
> > board entries as above, but I'm not satisfied for two reasons:
> >
> > 1. All other properties like display size and resolution are already
> >    specified in the device tree. If I add entries for specific boards,
> >    these properties will be somehow redundant and not as generic.
> >
> > 2. I could not find a ST7571 with a grayscale display as a off-the-shelf
> >    product.
>=20
> Sure, that makes sense to me.
>=20
> Can I ask if you could still add reasonable default values that could be =
set
> in the device ID .data fields ?
>=20
> As mentioned, I've a ST7567 based LCD and a WIP driver for it. But I could
> just drop that and use your driver, since AFAICT the expected display data
> RAM format is exactly the same than when using monochrome for the ST7571.
>=20
> But due the ST7567 only supporting R1, it would be silly to always have to
> define a property in the DT node given that does not support other format.

Sure!
I've looked at the ST7567 datasheet and it seems indeed to be a very simila=
r.
Both in pixel format and registers are the same.

I think specify a init-function (as those will differ) and constraints will
be enough to handle both chips.

I will prepare .data with something like this

struct st7571_panel_constraints {
	u32 min_nlines;
	u32 max_nlines;
	u32 min_ncols;
	u32 max_ncols;
	bool support_grayscale;
};

struct st7571_panel_data {
	int (*init)(struct st7571_device *st7571);
	struct st7571_panel_constraints constraints;
};

struct st7571_panel_data st7571_data =3D {
	.init =3D st7571_lcd_init,
	.constraints =3D {
		.min_nlines =3D 1,
		.max_nlines =3D 128,
		.min_ncols =3D 128,
		.max_ncols =3D 128,
		.support_grayscale =3D true,
	},
};

static const struct of_device_id st7571_of_match[] =3D {
	{ .compatible =3D "sitronix,st7571", .data =3D &st7571_data },
	{},
};


I can add an entry for the ST7567 when everything is in place.
The chip does not support the I2C interface, so it has to wait until
I've split up the driver though, which will be right after this series.

>=20
> --=20
> Best regards,
>=20
> Javier Martinez Canillas
> Core Platforms
> Red Hat

Best regards,
Marcus Folkesson
>=20

--a59oPMzr2RlFIqL/
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmf6DosACgkQiIBOb1ld
UjLZpw//e8HTYyVwbaasjf+olyexFFC3ePEHHkexM2bisHpFzK0hMD6npqWHkF/n
Ne/hGnfqQux/jqFnZTAI4gfsCZZ6BAhU6ak9jXGez5NxGuYniQ0BegWoDqLVkQS5
NwAky11Cxftxica2om5156VlcMs/WWzjfIQ3QWsLiRa/xAYcoUGbAgB8MBSrmFq1
/vJjaWw/M0eIzMAkpCQKJVfkwbtZ7TzllsNLqeiRjGVLIQbGKFzly9ENY6Ygvozo
VXicfLQKwcjRZqBJDEajT5QzeFvSJLgNAySTYeRcpCeyqym2uNuqdV3sPYl6cn/+
ep7auk9/lh1rR6dtmZiIQ5W4iLsDgOKQRx3I9YifDQ79CliX5GsmKvFDfwGAhB/e
NXZso2ipP2TD5flAwVSz00NV2EHjiLhnIvZle2F8qERAvgPpKNFCnd0wlWBr3nlM
MQ79+w9yHPYkNNTbDOrKXajonf+DaVoc/D0ll1uMtxqlTdMXhmBkRUU4npHdCxp8
LaQGbhsAoC1jy75seD8ajPvlD9kWjvxBwNwSi7IqYX1UHYQixfN6NKE6+HBMiEbG
atb1ePsdOTgbns8n541gbBJ+2wGEYeO9PxHlu9PxH7rlEFyePkrvadjukVVHFjeQ
KU9PcndFRB6/H1EqRl/20eXIeHJ/+ELVs/orOB8aGHjkwOaMGDw=
=elUN
-----END PGP SIGNATURE-----

--a59oPMzr2RlFIqL/--
