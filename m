Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA8E1EE00C;
	Thu, 22 May 2025 10:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747910643; cv=none; b=KWzZrMx3yBXczdCX/G4tC8zbprHTA/gRi2R+0TU9bdXLbBdOpR7IF5FbGev9U3vfOA/EMcP+0cr5ryUGHZetLxFTRA9jWSJToYa1PLjuMGNXxpXJhZhs/u7WLwe9gzXaiLZXvJvxk/TEZH5FH7g321/whOfXYWFcqz8o9y08xWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747910643; c=relaxed/simple;
	bh=jIBLbrJNbFW5+cBchpdOmbCCFAN+XTjVDBtCezNfQao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CxYugsJ+WZQqnl3bUpVW66kdrERiBoWZ+MsSYVB7a/P24AMqjOZkeZijTOw16Puh8melmxFTfwSLamH7feS9VgQNMb3kirWFqNihNyXL2sslglIscVVhYZtJn5O7LB7h1v8EaikgfAJ087e20Uiq46sTULfC2k9ErK4vlgSQeIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GJYn3TIu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GJYn3TIu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDC58C4CEE4;
	Thu, 22 May 2025 10:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747910642;
	bh=jIBLbrJNbFW5+cBchpdOmbCCFAN+XTjVDBtCezNfQao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GJYn3TIu2GF9127WjsKmktvw+xS0uQFMzjcfUBVPLrD12oyiGHmYFFgrfcb/xG0+u
	 OQTw7s86DOoQ22a8FkcPzcBrx69I6RaV6z6BKXDcUAXeTHt9efjmLUmIqdgUWlxt4B
	 E0aYtnr0kupnezyjyMSFubfBs/TMKPyLDEThcDTXMxBzerR3XURBYSSs4VbZFkAzHm
	 jnkPdekX4J2lgXUKCqAToWCjJp76PTSjDupspBF2vYHimO58ML7fMfvlLo6kh9zJvj
	 kgn0mSWIGf6tJlaJga4sJjPzVeU5abewcHc+DEey6+eGr1b0f5/GhLezGsblimbMcf
	 CmPXUG/JL+g6w==
Date: Thu, 22 May 2025 11:43:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Zhang Yi <zhangyi@everest-semi.com>
Cc: robh@kernel.org, tiwai@suse.com, devicetree@vger.kernel.org,
	conor+dt@kernel.org, lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
	perex@perex.cz, krzk+dt@kernel.org,
	amadeuszx.slawinski@linux.intel.com, krzk@kernel.org
Subject: Re: [PATCH v1 2/2] ASoC: codecs: add support for ES8375
Message-ID: <77a6952e-5dc7-4889-9cb3-2d2ced48768e@sirena.org.uk>
References: <20250522103548.20134-1-zhangyi@everest-semi.com>
 <20250522103548.20134-3-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VznGu2V/SgMVAfcS"
Content-Disposition: inline
In-Reply-To: <20250522103548.20134-3-zhangyi@everest-semi.com>
X-Cookie: Beware of dog.


--VznGu2V/SgMVAfcS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 22, 2025 at 06:35:48PM +0800, Zhang Yi wrote:

Only a few very small things here:

> +static const struct snd_kcontrol_new es8375_snd_controls[] = {
> +	SOC_SINGLE_TLV("ADC OSR GAIN Volume", ES8375_ADC_OSR_GAIN,
> +			ADC_OSR_GAIN_SHIFT_0, ES8375_ADC_OSR_GAIN_MAX, 0,
> +			es8375_adc_osr_gain_tlv),

Probably just ADC OSR Volume.

> +	SOC_SINGLE_TLV("DMIC Gain Volume", ES8375_ADC1,
> +		DMIC_GAIN_SHIFT_2, ES8375_DMIC_GAIN_MAX,
> +		0, es8375_adc_dmic_volume_tlv),

Same here.

> +	SOC_SINGLE("ADC Automute Enable", ES8375_ADC_AUTOMUTE,
> +			ADC_AUTOMUTE_SHIFT_7, 1, 0),
> +
> +	SOC_SINGLE("DAC DSM Mute", ES8375_DAC1, DAC_DSMMUTE_SHIFT_7, 1, 0),
> +	SOC_SINGLE("DAC DEM Mute", ES8375_DAC1, DAC_DEMMUTE_SHIFT_6, 1, 0),

> +	SOC_SINGLE("DAC Automute Enable", ES8375_DAC_AUTOMUTE1,
> +			DAC_AUTOMUTE_EN_SHIFT_7, 1, 0),

These are all on/off switches so should be Switch.

> +	SOC_SINGLE_TLV("DAC Automute Attenuation", ES8375_DAC_AUTOMUTE,
> +			DAC_AUTOMUTE_ATTN_SHIFT_0, ES8375_DAC_AUTOMUTE_ATTN_MAX,
> +			0, es8375_dac_automute_attn_tlv),

This is also a Volume ("DAC Automute Volume").

> +	if (es8375->mclk_src == ES8375_BCLK_PIN) {
> +		if (es8375->mastermode) {
> +			dev_err(component->dev, "no mclk, cannot as master\n");
> +			return -EINVAL;
> +		}

Still got the outdated clocking terminology here.

--VznGu2V/SgMVAfcS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgu/+wACgkQJNaLcl1U
h9DSsAf9EBoyk7v0hri4tOAUYflrbgdcDEaO3ib/L6D158aKwVkCKZ+0VjMoxp/x
1RGFJczxTQmySdFzOZ9Zoy2wSfkEA1qPpKRxHOaDsX2QpaNXZ8YpV5hgx7CDhZKw
uP+8nQqDpwBJ023ArMDDa76LIr3NGQ9zAD9uMLakzBJrHhDsaZNzOLO/6inwJ8H+
pcayRYd5CiwJ3eIlS+FUe2cUSvvlR2H/TE4/7XdvbGrphxYLz/YK/JebDSEV0ORs
S2hErOGE14paKBdP8bCbQa0Qc1Y8ZhBNE9P3BSLS7TfEU3+PvlgZFfMCh9youy6d
KnAyaPhephecCWve8V5oZt8ZlQhASg==
=Pkfe
-----END PGP SIGNATURE-----

--VznGu2V/SgMVAfcS--
