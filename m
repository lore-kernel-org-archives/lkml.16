Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A678F1E1A3F;
	Tue,  8 Apr 2025 14:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744124288; cv=none; b=chM83X335qpngRdYRSHb5Lo1LKbvwVadvz5R14GFY/E3HeQg+4oacPpVhGHHIyxDptHNRvA0s2qRJYvzudlv2tfa27nycAJGpHEi32YZZ5A1ff1loDa7yXZfaoCAzpFogHMljYrX1WbKCEuLjKXVw2OHqbbw2aIODRhNEplZG3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744124288; c=relaxed/simple;
	bh=8H5Xn3sQovWkd+GJDu5CdgqtheWeaa0IPtY2GnP1Q0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n+GlTq/HArWK8TOc7yMNcR5wdoSeSSmwOa1WZhm/BxXB3Yxe4hLoRASmunhJaxJLElJ/jKuWwkS/C5EPGxeXAcsmQ06/hNKN9Bd7aRLqAuVPJmX6edOFn7Jt2Q3gC6Gk33auaB20ch9/HT4AYHYWbpIX1df0F3kvj0tyyxXmAGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lQL+qfsv; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lQL+qfsv"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54996d30bfbso2790547e87.2;
        Tue, 08 Apr 2025 07:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744124285; x=1744729085; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0jIrA3mx6C6mZy2tnJofkxitpjJevE8nbzOCRz8TRh8=;
        b=lQL+qfsvXJTnNDdV5ufNF6G/iyOwwwT6x+Qh77ul2LikAOxvrlQkoIZtzKwvy3pttL
         cTOmrr+GqdgZHnP9u27AO3dJHnSh0t9m6UWBh4QXFPJftKpbNjiAA+6e9vqcr1bEcuDQ
         I1NU+SiLiQ0qrmY9sOWMPetQjoQl/HfetPEw5gf14yY7Ha5PI6mmHd9XosBefYWIhYzT
         qfBk2jzEsmoCAjwu/CZfcImmNqGnNVIqCAaIuSlX++13ZS2tt9yETw+Q6x8Xf3gvgVMK
         d5KiUa1mGHg+1GiTIyjJnVfJCxkHlWyPyt/6KIOTQ9R5CbqF/z9BDMJ4tQLLR/x9Log2
         fO1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744124285; x=1744729085;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0jIrA3mx6C6mZy2tnJofkxitpjJevE8nbzOCRz8TRh8=;
        b=gHNxgOY9T9nw/AVzkmnCActoMpcVC3hgNTUciM65NnX414oB5Skv6nE/1KXtJscHSW
         wqmsKPiqqZDuDCYcGwvBjD6LM/bkuLpmY5Kzto5HYL/Rz62HRGHN0zRyhCQnVQek+vcd
         0ypP57giP89CqOxbAg1WeBC7LQWW3ZxjNgoQc7FJdrkFoj/myYSAlFbL+CBZ5iHndWTG
         vO0gyrxPErgYrpQPqN6ipQRWINuIzkyfmBaqcLaFfQra/8yImYJADaaueBlJYxCkh0jT
         1+rluXcx9Cml2w1Yl+OvwWNJAu0usJZs0agmPOWrhBhMbnr2pITU41yeOh3QPbehfVze
         Gqbg==
X-Forwarded-Encrypted: i=1; AJvYcCUq7mbyb49UuTp2ACdlr9dJuZ+36nVgErMCO2ibugq2v0C0SjyTXqgrKpa62cjZz0XhJrqiMidSgOaE@vger.kernel.org, AJvYcCXcnXyRjmDhG1KSoR4swlgnv8/0or2a0YH+o0T3x/3U6X/1nC8/TBn11OAqSKHf0GMpFfAVLync1V34LMug@vger.kernel.org
X-Gm-Message-State: AOJu0Yxoo4HQaMhl/SCK4LkWfNBKtNt4YuUb078sOVZQul50Folpn8zp
	YWDSdFdDkHpErM2L6RdJysVXjqcMy91E878SgxfmIitdCnYlMdaQ
X-Gm-Gg: ASbGncsCC64PDI+YxXMEP2enwW8clLtQa4A1VD1lsfwvp5CYl/UBpBg9Vc+rZ4FC8J8
	1ZYqUlCumS72pGZ4picFtzgBlbxTnk/Z/Om5da2gGTp+jL3/M/wHC8TtfUhGfqzE2kw/Mgd8N20
	7yIHGqvzY+8gKq04nho9mpoUhJpA90VRHEVKg3K1z+hMmwIA3GjT3C0KfkuscAFzwpA2hD4/XG9
	AuD100MgzWJL1tABa8fSFjW2mctXBLglo+T+5YqdgNXMLpa3jiBIuPBka0Zch2MM8y8Qoyprsmx
	XQE1JQaLnn7+GbXjKTwfDQDkhmMNyiw8+w0oOnc4oVw5AHhVH9/lOGPcuYNY3e+CPGp4RHCwiYx
	FSb6Xjg==
X-Google-Smtp-Source: AGHT+IH7AfCDvYI4ulQvJiioz+8wMgXMRFnMBvJTApo51eq7l+wLWCNH4RztQpIl6uGPT7+sa6FzgA==
X-Received: by 2002:a05:6512:e92:b0:549:8d16:7267 with SMTP id 2adb3069b0e04-54c2276aba5mr4772259e87.10.1744124284349;
        Tue, 08 Apr 2025 07:58:04 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e65d6d5sm1510577e87.181.2025.04.08.07.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 07:58:02 -0700 (PDT)
Date: Tue, 8 Apr 2025 16:58:00 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Javier Martinez Canillas <javierm@redhat.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Thomas Zimmermann <tzimmrmann@suse.de>
Subject: Re: [PATCH v3 2/3] drm/st7571-i2c: add support for Sitronix ST7571
 LCD controller
Message-ID: <Z_U5eGy3vLgHZmz1@gmail.com>
References: <20250408-st7571-v3-0-200693efec57@gmail.com>
 <20250408-st7571-v3-2-200693efec57@gmail.com>
 <87cydn9bkx.fsf@minerva.mail-host-address-is-not-set>
 <Z_Uin2dvmbantQU4@gmail.com>
 <05fa4ac7-db09-401d-8680-0d71112d2239@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lMPor8puCNzndVuT"
Content-Disposition: inline
In-Reply-To: <05fa4ac7-db09-401d-8680-0d71112d2239@suse.de>


--lMPor8puCNzndVuT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Apr 08, 2025 at 03:57:22PM +0200, Thomas Zimmermann wrote:
> Hi
>=20
> Am 08.04.25 um 15:20 schrieb Marcus Folkesson:
> [...]
> > >=20
> > > > +static int st7571_set_pixel_format(struct st7571_device *st7571,
> > > > +				   u32 pixel_format)
> > > > +{
> > > > +	switch (pixel_format) {
> > > > +	case DRM_FORMAT_C1:
> > > > +		return st7571_set_color_mode(st7571, ST7571_COLOR_MODE_BLACKWHIT=
E);
> > > > +	case DRM_FORMAT_C2:
> > > > +		return st7571_set_color_mode(st7571, ST7571_COLOR_MODE_GRAY);
> > > > +	default:
> > > > +		return -EINVAL;
> > > > +	}
> > > These should be DRM_FORMAT_R1 and DRM_FORMAT_R2 and not C{1,2}. The f=
ormer
> > > is for displays have a single color (i.e: grey) while the latter is w=
hen a
> > > pixel can have different color, whose values are defined by a CLUT ta=
ble.
> > >=20
> > I see.
> > Does fbdev only works with CLUT formats? I get this error when I switch
> > to DRM_FORMAT_R{1,2}:
> >=20
> > [drm] Initialized st7571 1.0.0 for 0-003f on minor 0
> > st7571 0-003f: [drm] format C1   little-endian (0x20203143) not support=
ed
> > st7571 0-003f: [drm] No compatible format found
> > st7571 0-003f: [drm] *ERROR* fbdev: Failed to setup emulation (ret=3D-2=
2)
>=20
> For testing purposes, you can add the _R formats to the switch case at
>=20
> https://elixir.bootlin.com/linux/v6.13.7/source/drivers/gpu/drm/drm_fb_he=
lper.c#L1246
>=20
> and see how it goes.

Still no penguin (same error as above).

The problem is that drm_mode_legacy_fb_format(), which is called from
drm_fbdev_shmem_driver_fbdev_probe -> drm_driver_legacy_fb_format -> drm_mo=
de_legacy_fb_format

Sets the pixel format DRM_FORMAT_C{1,2} when bpp is 1 or 2.
So I don't think it is possible to use the _R formats with fbdev.
But I'm not sure?

>=20
> Best regards
> Thomas

Best regards,
Marcus Folkesson

--lMPor8puCNzndVuT
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmf1OXQACgkQiIBOb1ld
UjITCBAAnmJ67WKzefUaDAR0UVVZ3Bc/0DD0kDE1HD0PNw44h8PIW3Tw+fQB0OQP
LqPs0Vi33D4Zf81iutlO/hfS2L57bkdPBVFvQckWyeA6fomaQYIprdi4U9bE9T/x
0/e1IfZQ1+AkgjuXaba6Hw4t8P8fDCqSFIqvZ+PEuizgJEA+aLrk2Sav1+xucRhi
R0vAzjmJk4MKIONG1ZhHMxCP1WgduGfwA9z7rpB2sMkT/sAg2+ydrTXIEEBZAe1C
7ippzhsChYflIiAG5VWqS5WetIZOumzvxe5lbPEiQa22n6D8lgtTXnxOEt8H3254
lDeOCuklGlC6zNr6vr7B6I2AhkKxHI60tNM9C2ZzRZCx7fgmjh32XZTqlS9Ux9CF
UdP5bmSJwn0I1KgwfCTouCNtAK4OwPHeqRipT6/0ADPcAL4Cvs39CdwErBmpEkQk
KsdrZ4ALHHVrSX7mTMNQKQnpgByZqJep4/y2Y5aTd63x3+UC8Kabnob46xgDlMJq
pIaV0qsoshSHxyF2xDqQBWSCfC4L4WDbQzuhZhQZ8E7pAInv72MC/l7tvFTk3OSK
pOdCim/LJ8p3wF0bpBQb54uaV0S72lL65CIJ2qOoZvZSrF1sm7Y2PDKwridY3Spi
IPNO8mHiN8BIRcVtigKkSS0aAoCYmRbWwIUAPws4c4kw2TXeE2o=
=fljt
-----END PGP SIGNATURE-----

--lMPor8puCNzndVuT--
