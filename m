Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1F820A5F3;
	Mon,  3 Feb 2025 17:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738603260; cv=none; b=Naw4cys1AFV6JgftWD7VYCHGMX70xhqRImJekkEWi8NFMtpijgZz2aQec/zO6/QjmCEJtnEhiEq/SdaejPoEw1U2HSCg3jUpLfKRB67IdQOU3Ox3QoJtORQcOTPP7QBrBDqlway3QXO/iPNu/TeTTgCUb4C37d0Vgx7vrKsmW9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738603260; c=relaxed/simple;
	bh=P2dS8GHtqYrlLqUONRfpPwLacv4SW0pS7ajQGuRV60c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ELviuzooIR2Fi5mVFhE8avmJ30Fl1teaINLruqxhPGIN8y9+79QHMrI7+N9t0INc6er75KbayOFUrNftKjqwF+meUyFganDjgqfaK+B/c//NeBx+U2fsuMMa6PAZKn/zrW8TyC3XAxk61Ivlq+bQwrZ8GfQ6U7PUNLuAPFwIz8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bd0N0r7l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bd0N0r7l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4919C4CEEF;
	Mon,  3 Feb 2025 17:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738603259;
	bh=P2dS8GHtqYrlLqUONRfpPwLacv4SW0pS7ajQGuRV60c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bd0N0r7lRdJH3EOLVz0vXqPd6ULZMMIDqxyHjFiIfvlXWHPVd2JzGXwi/GA1HIuq6
	 HHkRyoeWgV7FIbmdK13UzmFqfNFoCRoE4xSVxKOhNyVpcOFAvO4MdDcW7WFg6AVJ1x
	 QB+Jxi4Cb+IcZMcEDYLXfOojBc15UXT1e9VBqY0dqu4XobE4hNoYAHeSjFxbec9O11
	 SrE/ZeFEDKnFvizfZ4VxSXGno3D+2NHiLoFKLkIG3bgmAgZ/P4aeX2SmkA/ooZ+TvZ
	 6Pkads2h9ctpUvdy+kqsyomY+x8ZynDCf0B/MkNdwRq05SRnuOQyhQjLV8nDogSVMF
	 9eWuiaaclBIPQ==
Date: Mon, 3 Feb 2025 17:20:54 +0000
From: Mark Brown <broonie@kernel.org>
To: Nikola Jelic <nikola.jelic83@gmail.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, rwalton@cmlmicro.com
Subject: Re: [PATCH 2/2] ASoC: codecs: cmx655: Add CML's CMX655D codec
Message-ID: <177e0b6d-e8e0-41e1-bccf-0b84b178678d@sirena.org.uk>
References: <20250203170117.12004-1-nikola.jelic83@gmail.com>
 <20250203170117.12004-2-nikola.jelic83@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uURq+iX14aolRxxP"
Content-Disposition: inline
In-Reply-To: <20250203170117.12004-2-nikola.jelic83@gmail.com>
X-Cookie: May your camel be as swift as the wind.


--uURq+iX14aolRxxP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 03, 2025 at 06:01:17PM +0100, Nikola Jelic wrote:

This looks like a new version of:

   https://lore.kernel.org/linux-sound/20250121230903.89808-2-nikola.jelic83@gmail.com/

but it's not identified as v2 (nor does it have a changelog of any
kind, inter-version or otherwise).

> +static int cmx655_i2c_probe(struct i2c_client *client)
> +{
> +	int ret;
> +
> +	ret =
> +	    cmx655_common_register_component(&client->dev,
> +					     devm_regmap_init_i2c(client,
> +								  &cmx655_regmap),
> +					     client->irq);

This would be more legible if you used a temporary variable to store the
regmap.

> +	cmx655_common_unregister_component(&client->dev);
> +	gpiod_set_value_cansleep(cmx655_data->reset_gpio, 1);

Why isn't the GPIO set in the common unregister function?

> +	*ndiv = 0;
> +	*pll_ctrl = 0;
> +	switch (clk_id) {
> +	case (CMX655_SYSCLK_RCLK):
> +	case (CMX655_SYSCLK_LPO):
> +	case (CMX655_SYSCLK_LRCLK):

The brackets around the constants here are weird.

> +	ret = cmx655_get_sys_clk_config(cmx655_dai_data->sys_clk,
> +					primary_mode, srate_setting,
> +					&clk_src, &rdiv, &ndiv, &pll_ctrl);
> +	if (ret < 0) {
> +		dev_err(component->dev,
> +			"Failed to get system clock settings %i\n", ret);
> +	}

We then proceed to use the configuration?

> +	} else {
> +		cmx655_dai_data->best_clk_running = true;
> +	}
> +	if (snd_soc_component_test_bits(component, CMX655_CLKCTRL,

Some blank lines between blocks would help a lot with legibility
throughout the driver.

> +		/* Wait for filters to settle */
> +		if (snd_soc_component_test_bits
> +		    (component, CMX655_RVF, CMX655_VF_DCBLOCK,
> +		     CMX655_VF_DCBLOCK) == 0) {

Please try to follow the kernel coding style more, here just putting one
parameter per line with normal indentation is probably better.

> +static const unsigned int cmx655_rate_vals[] = {
> +	8000, 16000, 32000, 48000
> +};
> +
> +static const struct snd_pcm_hw_constraint_list cmx655_rate_constraint = {
> +	.count = ARRAY_SIZE(cmx655_rate_vals),
> +	.list = cmx655_rate_vals,
> +};
> +
> +static int cmx655_dai_startup(struct snd_pcm_substream *stream,
> +			      struct snd_soc_dai *dai)
> +{
> +	int ret = 0;
> +
> +	ret = snd_pcm_hw_constraint_list(stream->runtime, 0,
> +					 SNDRV_PCM_HW_PARAM_RATE,
> +					 &cmx655_rate_constraint);
> +	return ret;
> +}

If the driver just supports a constant set of constraints why set them
dynamically - set them in the rates for the DAI.

> +	SOC_SINGLE_TLV("ALC Gain Playback Volume", CMX655_ALCGAIN, 0, 12, 0,
> +		       cmx655_alc_gain),

A gain is a volume.

> +	SOC_SINGLE("Companding Switch", CMX655_SAIMUX, 4, 1, 0),
> +	SOC_ENUM("Companding Type Enum", cmx655_companding_enum),

No Enum, the control is for Companding Type.

> +	/* Custom widgets for Mics to get them to turn on before switches */
> +	{.id = snd_soc_dapm_mic,
> +	 .name = "Left Mic",
1
> +	{.id = snd_soc_dapm_mic,
> +	 .name = "Right Mic",

Define a macro for the repated pattern if one is really needed.

--uURq+iX14aolRxxP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmeg+vYACgkQJNaLcl1U
h9CbsQf7BCs+95QxVhm7B3ze3hoq8Rvu5+GsuuMm48L2o/UOLD6lGMEZDudLdeFM
F4MLULBjL3bQHldpZCfi/aFohUn/5VYirlCa06Xh8iWoXyESzyW799Uj9xbJ6bqc
l33JjhSc5H7XH6fLuRS6eBfuZBj3wickOmiygwvM9LtsO6CZZ58qwJMiaC+QJJHR
XsxiH/bu/Q8XzwRX/pq0yPSBI+sKOkJoP8j9cqtFnckMprhsambiVoTxStjjYzvY
UZUy0mfyR6GSKQ/HmgGct+ob1LCygX1Gc8RcGhd7mm+rgn4F0iQPwtc/qQLvgW9K
9rXk6FdaQuqvY2xtSVr/42JbDyhMTw==
=r05U
-----END PGP SIGNATURE-----

--uURq+iX14aolRxxP--
