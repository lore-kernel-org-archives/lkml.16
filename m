Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C6A20E707;
	Mon,  7 Apr 2025 09:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744017626; cv=none; b=mHkTvKyatGuglmrXwHmqiId0893oA8HD5RH1vQl2dmlTOa/i1EN/uG1rfSQMxZikx75IGHty4wKnsL95h5bNe/DFpaAv4VyGERKvrr8Vz/Wz6VVwtcAGIo6l2Vt2aGWPSj3+05ejHPV2WSNW6AuiIkJv73uxa3aTXS3HuMuxHfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744017626; c=relaxed/simple;
	bh=y9U1D9qlHUEV9F9nqPPlLVm1CHUJLLyD+Ts0JUungdg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hyHTZnh2daMmeQQyppeSVKNXoue5lxiSy6Pzy/c01ySkGv6dUWDKlqMLRPIfc+d11dcCYFVdDuCcFBGvII6X2pcbhYeYEybCfmOHwiUgfle8oYWlbozhL0yW1MujH46Y0567ieoemJMNt2PNv1fAlIUwCdiaSPPNvlpXdyhEGUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ndIj8+EA; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ndIj8+EA"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5499c5d9691so4657599e87.2;
        Mon, 07 Apr 2025 02:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744017622; x=1744622422; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZInrB3Ls4YV/Mfm7E0ylLvdy7KDFCeYJzkY6HN0tOlw=;
        b=ndIj8+EAxe/1SCH70tkLHedLQbIIZydkkXZnVa/Y7l09380xFnt1GwOp1chZDmuoWo
         FFWLzVQDH0nrmxHrjzffHAxEu/7QjOW6kh74BTuubVMFgCjNUG+ieDuzoiGcz8p9yF5m
         uMRmFtJgTmiddkGlOxnh0DAQV2pPhIYyUBuFcI+p5IClWgDdueY0/syYJPHQu/z/0YLM
         UEUAP0wmaKv2TVLsZvRdqelsq9C/eIsXkIyh3zTjXeyl5+WkthGkCMkewFY8LLFsyA/q
         ZKAaogNaNTYGhFC5R3L0iZ5nCGVnUqRSEi39Uuld3jL2ytTObTI2KNi/s6v0WXWOahsq
         2GJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744017622; x=1744622422;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZInrB3Ls4YV/Mfm7E0ylLvdy7KDFCeYJzkY6HN0tOlw=;
        b=BUJMKUTXDwztZ3A27b5E+uz9TzEVml6MJCuULQau9/U4q0sKu8OFkr9DilpclEAIQR
         GysPeRpMO9Gjpo/233/lZDI4k5tQg4K+Nhhi4bi38KYQDfkP32qFUCP8yeljAOeqiZ05
         3OogHh4grhfuJOXwfFocS92kFDA1t85EE6uPNEP9SCGcC70PZ3JKf3E4sTsR0YrlWCsm
         f+O1wcIYwVaOPH8sTHe/CKuVb+wdQzhL0dadmr+pW/yiP6RIIjuxt4WdZJL1f72rm9am
         NMVlDlPJpv3LcZ+k/o4UHuvyve4/citD2gBWW0t2BUyWEJdOn/KEw7WrG4iU4Hu2NGra
         JH0w==
X-Forwarded-Encrypted: i=1; AJvYcCU2rwewgZ692w+yjE62q8JG/aVpFcjo3BCk6zvyNWGgCQ3mEFn0h8nZCI2Qa+k7Fj7QH2DIKPLeAFlBYnfw@vger.kernel.org, AJvYcCUU5d0R2oJxIC4NuYhg6DyHlAR0YKEs7c6aQkRrd+hf6pBbwDfcN0UlWTMpCuUfFpTU1ZhuTTTmTpG+@vger.kernel.org
X-Gm-Message-State: AOJu0YzGmOiBrKFErtJlkS50e/PxMwn1J/GNoOp6ci3A7nYhFl9IhfkO
	BJI3IgYEdgOFO8nIfuvOfvpvR++IN/lSnKNkLPyp9SLMzhO5sxLb0tiqAYIAviQ=
X-Gm-Gg: ASbGncu4ctRNCZORW+0xTGRPZl/HKacbe3OIdCkWCEWsLP5pFZqaQrkGtdqiotmPrw2
	GsS8rIVOfUEaiwUQTVinGiSndM0YWlhycLQA7otK6k+mjPRTpJi9y7w8GjiiLUC+imKK+bUVFYb
	yqhxNsRpj5i+wPuKqh8kwZ2vCceR3UPSITSE7mKRrpk7pKiT3lNCP9EhYlkaxr46RBtvRmZMumo
	dqyyGcgp4tKN9R83C4GyBNcy7h5pe2nUAyOcyI27Uydrfe2ogRuyj9Sd/nlJJ+eX9ormcspAm6F
	E4DTIRcuJPvsrbWzzzaxTMSkRacwzJhX/RpT+454efzaRdGlkxEQU1Rzkc9le0xA/AQMGGIWDa+
	M/UMeprQA/yjSzS1u
X-Google-Smtp-Source: AGHT+IG7tnpLCT0wyuRQt3chQrPazJI6YzwgbJzEYleAi1C76C44AZuh9E7JXDe8BNAti+nEr5nE2Q==
X-Received: by 2002:a05:6512:3b83:b0:549:903a:1b3 with SMTP id 2adb3069b0e04-54c227dc834mr3394592e87.42.1744017622057;
        Mon, 07 Apr 2025 02:20:22 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e65d6d5sm1158583e87.181.2025.04.07.02.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 02:20:21 -0700 (PDT)
Date: Mon, 7 Apr 2025 11:20:19 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] drm/st7571-i2c: add support for Sitronix ST7571
 LCD controller
Message-ID: <Z_OY0z05Ejdz6T5W@gmail.com>
References: <20250404-st7571-v2-0-4c78aab9cd5a@gmail.com>
 <20250404-st7571-v2-2-4c78aab9cd5a@gmail.com>
 <f9312b61-4fe2-4fd6-a7f5-b20392c7c338@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="j0p2bLMOkZcckCIM"
Content-Disposition: inline
In-Reply-To: <f9312b61-4fe2-4fd6-a7f5-b20392c7c338@suse.de>


--j0p2bLMOkZcckCIM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

Thank you for your review and feedback!

On Mon, Apr 07, 2025 at 10:30:28AM +0200, Thomas Zimmermann wrote:
> Hi
>=20
> Am 04.04.25 um 15:50 schrieb Marcus Folkesson:
> > Sitronix ST7571 is a 4bit gray scale dot matrix LCD controller.
> > The controller has a SPI, I2C and 8bit parallel interface, this
> > driver is for the I2C interface only.
> >=20
> > Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
>=20
> Reviewed-by: Thomas Zimmermann <tzimmrmann@suse.de>
>=20
> I have a few points below, but it's all minor details. The driver looks g=
ood
> overall.
>=20
> > ---
> >   drivers/gpu/drm/tiny/Kconfig      |  11 +
> >   drivers/gpu/drm/tiny/Makefile     |   1 +
> >   drivers/gpu/drm/tiny/st7571-i2c.c | 720 +++++++++++++++++++++++++++++=
+++++++++
> >   3 files changed, 732 insertions(+)
> >=20


[...]
>=20
> > +	select REGMAP_I2C
> > +	help
> > +	  DRM driver for Sitronix ST7571 panels controlled over I2C.
> > +
> > +	  if M is selected the module will be called st7571-i2c.
>=20
> Is there a reason why it is called _i2c? There's another interface, I
> assume?

Yes exactly, the ST7571 has a SPI and 8bit parallel interface as well. All
common parts has been written so that it could easily be put into a
common file later on.
It should pretty much just be to create a new driver with another regmap
interface to support other interfaces then.

I only have the I2C interface to test with for now, so I leave it to the
future.

[...]

> > +static const struct drm_connector_helper_funcs st7571_connector_helper=
_funcs =3D {
> > +	.get_modes =3D st7571_connector_get_modes,
> > +};
> > +
> > +static const uint32_t st7571_primary_plane_formats[] =3D {
> > +	DRM_FORMAT_C1,
> > +	DRM_FORMAT_C2,
> > +};
>=20
> I assume that you only get fbcon output for now. Some ancient X11window
> managers might also work. Today's GUIs usually need something like XRGB to
> work. We do have DRM helpers to convert from XRGB to Cn, but they current=
ly
> don't support formats with multiple pixels per byte. It's on my TODO list
> and you driver could add XRGB support at some point.

Yes I do.
Oh, sounds good. I will keep myself updated.


[...]

> > +	ret =3D st7571_lcd_init(st7571);
> > +	if (ret)
> > +		return ret;
> > +
>=20
>=20
> > +	ret =3D st7571_mode_config_init(st7571);
> > +	if (ret) {
> > +		dev_err(&client->dev, "Failed to initialize mode config\n");
> > +		return ret;
> > +	}
> > +
> > +	ret =3D st7571_plane_init(st7571);
> > +	if (ret) {
> > +		dev_err(dev->dev, "Failed to initialize primary plane\n");
> > +		return ret;
> > +	}
> > +
> > +	ret =3D st7571_crtc_init(st7571);
> > +	if (ret < 0) {
> > +		dev_err(dev->dev, "Failed to initialize CRTC\n");
> > +		return ret;
> > +	}
> > +
> > +	ret =3D st7571_encoder_init(st7571);
> > +	if (ret < 0) {
> > +		dev_err(dev->dev, "Failed to initialize encoder\n");
> > +		return ret;
> > +	}
> > +
> > +	ret =3D st7571_connector_init(st7571);
> > +	if (ret < 0) {
> > +		dev_err(dev->dev, "Failed to initialize connector\n");
> > +		return ret;
> > +	}
> > +
> > +	drm_mode_config_reset(dev);
>=20
> No need for all these individual _init functions. For such simple drivers,
> it might be easier to put all pipeline setup here. Or put everything
> including (drm_mode_config_reset()) into st7571_mode_config_init(). Just =
an
> advise; your choice.

Yeah I know. It's partly to make it easier for me separate things
in my head since I'm new to this subsystem, and partly as I plan to move
these functions to a common file later when I add support for the
other interfaces.

When I started to dig into the code of other drivers, clear lines as
this would have helped me, so I think I would like to keep it as it is if it
doesn't hurt too many eyes.

[...]

>=20
> > +
> > +	ret =3D drm_dev_register(dev, 0);
> > +	if (ret) {
> > +		dev_err(dev->dev, "Failed to register DRM device\n");
> > +		return ret;
> > +	}
> > +
> > +	drm_client_setup(dev, NULL);
> > +	return 0;
> > +}
> > +
> > +static void st7571_remove(struct i2c_client *client)
> > +{
> > +	struct st7571_device *st7571 =3D i2c_get_clientdata(client);
> > +
> > +	drm_dev_unplug(&st7571->dev);
>=20
> > +	drm_atomic_helper_shutdown(&st7571->dev);
>=20
> This would disable the mode-setting pipeline. But as the device has been
> unplugged already, it won't really do anything. You can leave it out.
>=20
> Best regards
> Thomas


Best regards,
Marcus Folkesson

--j0p2bLMOkZcckCIM
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmfzmM4ACgkQiIBOb1ld
UjIbHxAAvJQI4p/Up9M6BNDaJqi2s//V0VbRWeRBBZ4T6TTA5YsGUkD6xcBQDrQE
92WT4pAv1VvU0qRf338GzLEdBm9iSiWXqsrhT/swa2MPpOcbxZGDO4oIp/wOswqy
PYhAQACqp42hvTCxnx2kS8fqVsN0UHsPEBxvx5alO1RfJUb1RcehQhM0oQSgXWoU
y/mT8gxAKXkZ482Jm6MZqbk8dYBKOD5fodWdrdh3ZyuW3DPHD5b6wUzAFRKLCtO5
1SDwf1b1yfYaBZhHFjv4VfZlpXsxsO8TNvgsiiuDk2pw+RshRC5pFZScfVeQNIgj
yAEBoAsMbEyEIXDOhlkciuv6BDy3uZ/UxfvAi+L/vCOI41S9mLIuxAZj7H2vrWHg
DGNRH21Ik6u1bvHwoUmfNz0hbziPHJ5ANebfzLJrzKmN0Gm5tRvFkqK53L9ISykk
V5ET0gYBLT74hzlFs/zwg/TCSW7GAj3JhSPKdRUznKs2MJpN5/h+RLR5ZJ7UqhOB
4D7ydZjSmhTdnGfzyk+lVupbTw8C02qzGDhchVW2dwq+X/xakqfG3/pAfsX6sAhN
/9tM5eBrZ9pMUSZWbKbXa7lQyC2zShroCEDzYn85AZXlv9LH9W7Rzz8JaPmicIXE
vhYPu5AJnsrW8mX85FpkzXrtV45FRkPph16F6+2vlwssGL+87j0=
=HKTr
-----END PGP SIGNATURE-----

--j0p2bLMOkZcckCIM--
