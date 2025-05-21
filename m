Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150692641CA;
	Wed, 21 May 2025 11:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747827731; cv=none; b=KZtdqTewf0weoCgSa4nPCp0cdhY8Xv61XVioORfAjAF4UU4HnUzhMp204hHZYxN2eZpQaeY2I2obQWnVOuZYVFS/9kWkJzIEVaSsukYmDvyoLKWjvCuYBmwxtkoW7k34f/ca0HHxDPWYSwQz8rOlsot5oC7h1Mf4yL27XX42PJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747827731; c=relaxed/simple;
	bh=Zw+TKFicrrKtHrjbsa8cd432V4AF5B886PS2gtCuXDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QLFXgniKc8cCZyhEXVg11xU+Pi7XQn7yqtb438XQx81Htcr0NerBcWTD5EVzI1MxDSUvb2Q8umXyDdMdO9pgUtRFmnFZxaUTjA9EZJaCkvBsUYXu0m+m20JhVVCCli2Ru3pADtCUUyHhGDXUPfOdBmiCD7/BKzA11gjlCookcNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ve7uB5cp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ve7uB5cp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE0BFC4CEE4;
	Wed, 21 May 2025 11:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747827729;
	bh=Zw+TKFicrrKtHrjbsa8cd432V4AF5B886PS2gtCuXDM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ve7uB5cpkMejtbTP48PGKNCt0yG6Oknh0B+xdFBmS+SlmSRwZawSGo/CQWG9H/2KI
	 /q03K0t+NrGtnoY5hHawe8JAd+sYYlNpkhWeWFtBQdbM9tYBfCfD9xccflDezoRZc1
	 FqFvoTBYqixOWe/Q9XKgAqyVbX7neQJYaPGfCkOeuHBAbtvvY50tRLvcanAlA4uu+H
	 sdHoxCyjYjk8uH153i/b9gsPaDx/+HM8G7rzomTMTjZ5NVoCyD3j2u705If+vstQy+
	 WmJQnF0iGNjrQZfSRmK1/bEHRT3bbnjse/ElN6LudTm1Zmk4xBjfCa9SH9uCCJefvl
	 mc4H+u4ZPv46A==
Date: Wed, 21 May 2025 12:42:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Zhang Yi <zhangyi@everest-semi.com>
Cc: robh@kernel.org, tiwai@suse.com, devicetree@vger.kernel.org,
	conor+dt@kernel.org, lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
	perex@perex.cz, krzk+dt@kernel.org,
	amadeuszx.slawinski@linux.intel.com, krzk@kernel.org
Subject: Re: [PATCH 2/2] ASoC: codecs: add support for ES8375
Message-ID: <42d25977-8975-4c6e-b8a4-a733e62875b2@sirena.org.uk>
References: <20250521104247.6595-1-zhangyi@everest-semi.com>
 <20250521104247.6595-3-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l/wPuf0Gh4F1TiXx"
Content-Disposition: inline
In-Reply-To: <20250521104247.6595-3-zhangyi@everest-semi.com>
X-Cookie: 42


--l/wPuf0Gh4F1TiXx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 21, 2025 at 06:42:47PM +0800, Zhang Yi wrote:

> The driver is for codec es8375 of everest

This looks mostly fine, a few small nits below but nothing major.

> +static int es8375_dmic_set(struct snd_kcontrol *kcontrol,
> +	struct snd_ctl_elem_value *ucontrol)
> +{

> +	if (val) {
> +		regmap_update_bits_check(es8375->regmap, ES8375_ADC1, 0x80, 0x80, &changed1);
> +		es8375->dmic_enable = 0x01;
> +	} else {
> +		regmap_update_bits_check(es8375->regmap, ES8375_ADC1, 0x80, 0x00, &changed1);
> +		es8375->dmic_enable = 0x00;
> +	}

Instead of overriding this you could just read the register value when
you need it, you've got a register cache so it should be fast enough and
it's a lot less code.

> +static const struct snd_kcontrol_new es8375_snd_controls[] = {
> +	/* Capture Path */
> +	SOC_SINGLE_TLV("ADC OSR GAIN", ES8375_ADC_OSR_GAIN,
> +			ADC_OSR_GAIN_SHIFT_0, ES8375_ADC_OSR_GAIN_MAX, 0,
> +			es8375_adc_osr_gain_tlv),

Gain/volume controls should end in Volume as covered in control-names.rst.

> +	SOC_SINGLE("ADC Invert", ES8375_ADC1, ADC_INV_SHIFT_6, 1, 0),

On/off switches should end in Switch.

> +	ret = regulator_get_voltage(es8375->core_supply[0].consumer);

Might be nicer to have something better than a magic number to ensure
that the supplies are in order, or use a specific variable.

> +	case SND_SOC_DAIFMT_CBC_CFP:    /* MASTER MODE */
> +		es8375->mastermode = 1;
> +		regmap_update_bits(es8375->regmap, ES8375_RESET1,
> +				0x80, 0x80);
> +		break;
> +	case SND_SOC_DAIFMT_CBC_CFC:    /* SLAVE MODE */

Please avoid using outdated terminologoy for clock provider and
consumer.

> +static void es8375_init(struct snd_soc_component *component)
> +{

> +	regmap_write(es8375->regmap, ES8375_ADC_VOLUME, 0xBF);
> +	regmap_write(es8375->regmap, ES8375_DAC_VOLUME, 0xBF);

Some of these settings look like they are (or should be) user
controllable and should be left at the chip defaults, the volumes above
really stand out.  We use chip defaults to avoid having to decide which
use cases to configure for.

> +static struct regmap_config es8375_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.max_register = ES8375_REG_MAX,
> +	.cache_type = REGCACHE_RBTREE,

Unless you've got a really strong reason for using _RBTREE new drivers
should use _MAPLE, it's a more modern underlying data structure and
makes choices more suitable for current systems.

--l/wPuf0Gh4F1TiXx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgtvAoACgkQJNaLcl1U
h9ASBAf/eLdMTsi9PZ3JgRRRMpDx6XYr/4fXIfTVtIipqg8Hsroaez8op6qGaXBq
brm4lSZTnrdkkT2zd94UyZTR2q/AacniET2qU+3XKP3oHuTJthabnH+sm78rkYEA
eJFFrcNfNiz//6EBFLgmzKHHMCvaNjRMoxjmVOWI5n+xmOsrmWZG64aCDgwXCFye
Ndp0phFkhNvvRwh3AcJEFUCUNwQsIEjcQkSYZfDA0yDUSoRkioBrvEXQhsFv73Dt
4OROp3oBo/WvX8L+9TGM/qALNWI8RvVcPYNIHauL8u3JY32UZvdoB9f1W12NH5Hw
x54ap7Z3CTMFHKK/yiGBxwdsz2LVhQ==
=m2rf
-----END PGP SIGNATURE-----

--l/wPuf0Gh4F1TiXx--
