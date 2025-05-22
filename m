Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6488B280A32;
	Thu, 22 May 2025 09:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747907150; cv=none; b=ZKg67pRZkwj5JAr3zyyRvsWCyZiY99qJDDyFTtiTFkddoj1MNilkqxAS56NySj8tE1kWiyYzVJrsk1E8ATB9GT5UEYMmqS+Xszp3VZmvDMrFDIuhyJTJWEvFvVXQcwV7//IayRweirK/N4cMq6GR5XPeFmoC1xLxudP09/VWNOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747907150; c=relaxed/simple;
	bh=JxCPB0UFr3+YKzeXORDXLh/LUUdaJntuMHarMokXu5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bLL5byMach//cdTFeG9YltwFmwrtzUQk53gncgnsBF91PygX1t5ExxGheFm6YOIbZfrhwd0l64kHS2UHt/AGDs6w4N/8guaoPC/kIKfOdQ0fxYOaBkJYRVBwtsd0but1Pm/+LVNLA1TlyMUFvC/Tydjwosgvc36E6VS+o4k+O+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Itf4v18+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Itf4v18+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FC28C4CEE4;
	Thu, 22 May 2025 09:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747907149;
	bh=JxCPB0UFr3+YKzeXORDXLh/LUUdaJntuMHarMokXu5A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Itf4v18+JkPLZp2fYPv8UHwOfLTP0TaIE7MI8WEpfoytAhGeQU3v7R9sCocSl2i73
	 BsCrVtRgHmmHSyJ/DUxfvJnvJxwEWbWka/L2vwu6hE0W+2FuVPrktrPWNYKxHiJwpj
	 uKffO/EbA8mmJd6/HvOVgSPl4Gtl9eG8s7YzlT5MdeXuCEmRk+b3jjHw5mpe1hVQGF
	 jWyJi0f2+S0VxvHDAk/B5yr8uAJXb4OfSwXF7PoJz24wHhgYD56RRQovMxW4Q4UZvW
	 BdE6mDV4OpGZd/ALCjg8Pi8u3SSvAH/QjI3JbnnDfHkT6s5LKe9yPxDBmsLuJKyv7i
	 /dEGke1BV1guQ==
Date: Thu, 22 May 2025 10:45:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Zhang Yi <zhangyi@everest-semi.com>
Cc: robh@kernel.org, tiwai@suse.com, devicetree@vger.kernel.org,
	conor+dt@kernel.org, lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
	perex@perex.cz, krzk+dt@kernel.org,
	amadeuszx.slawinski@linux.intel.com, krzk@kernel.org
Subject: Re: [PATCH 2/2] ASoC: codecs: add support for ES8375
Message-ID: <50783a85-0515-47af-8486-a343e28f960a@sirena.org.uk>
References: <20250522054619.9574-1-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KhVzUb2kf7n4U7by"
Content-Disposition: inline
In-Reply-To: <20250522054619.9574-1-zhangyi@everest-semi.com>
X-Cookie: Beware of dog.


--KhVzUb2kf7n4U7by
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 22, 2025 at 01:46:19PM +0800, Zhang Yi wrote:

> > > +	regmap_write(es8375->regmap, ES8375_ADC_VOLUME, 0xBF);
> > > +	regmap_write(es8375->regmap, ES8375_DAC_VOLUME, 0xBF);

> > Some of these settings look like they are (or should be) user
> > controllable and should be left at the chip defaults, the volumes above
> > really stand out.  We use chip defaults to avoid having to decide which
> > use cases to configure for.

> Because the default value of the chip's volume register is 0x00,
> initializing the device without setting it to 0xbf will
> cause the device to mute until the customer sets the volume.

That's normal and expected, it's totally fine and normal for the user to
have to do some configuration.

--KhVzUb2kf7n4U7by
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgu8kgACgkQJNaLcl1U
h9AyDgf8C47CTnxxWL4fdXQc/Sg4Gy6KsN8RKyO22145ty3ni0DHIrbuk4650uBM
SAeLf0K2AdW6yzE+lNh9sY+0XxeJdY0j3DOvZ0X0xo33MTtowoTkA08jvgMfMXUJ
ltI0UJfu4tQAHuxAD0S/dyVzl2l4ms4qKPnz0FOFuCETUw1HWNHoiXsMFTvPXQtZ
b8nywV8HQXV5Zmne3cTdt56DmK1fnURDwWA4pBRCsklFbWqf4zGnNExjNFRapz+L
+i9QYqaoVtsTJpKxtgcpNqb/taN9oC2xJZRxXNO2MMHZqxRNXs7RsWmeVE29ABoU
OXrO6FjIZDQargXxZBHLckvONYDw0Q==
=/eHE
-----END PGP SIGNATURE-----

--KhVzUb2kf7n4U7by--
