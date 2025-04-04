Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786671DFD96;
	Fri,  4 Apr 2025 15:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743779043; cv=none; b=iKKQ/pouTzVnd4NLsPbZDVL7OKqSa9dzFN24agfRIodgzR2NaKmFB7zxyKHjkY3/CwmvLqkQwk0LlVEcLPi8EcjA0H1diKM7pq94GwbfShDuMAr4PVz9IQvILqaf44/uzYP8J7eWrjudcAxbXtQVrSXqP5sEHMZ3JKeY0QUdjBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743779043; c=relaxed/simple;
	bh=QPrHjyTmnw1oxbazLvOfezLw+h3xmJo0djczSohsNGg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XhBKM587kQzBIb22FvDb2Du1tcmgDCVFEWkp7CAEfkQCaaEkb/wLtyRt7HOeyxYXm1bV8Slh+iaZE1/2C72X6UVysmizPpBa1YE9DmjePIG6bbt462IzITsTepj4k/DRO9rKSQXjb8XPF722dxPpgOccwLlCgFLIubLSEncMLu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O60FUz4o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O60FUz4o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD5ABC4CEDD;
	Fri,  4 Apr 2025 15:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743779043;
	bh=QPrHjyTmnw1oxbazLvOfezLw+h3xmJo0djczSohsNGg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O60FUz4ou2nv3ARuxUkzieRZBAB/V5prNyCqWNzm7R7FEqTB7G7HjaZAAgbXu/iE5
	 kXTtDMaRU8KY9AKE57lrSehhTusQLTSmA7imwwbAigIusWY0mML9kDG8vYtCpbiB4B
	 kaXqDduVUt0wy5gjzystflZrEsiT3IqqY0onCryI/wNhwOK5PZXbdKsnZZsb8vCneb
	 vIkb3KXXC7s5Mfhy92zxfCuKij6tnjUSghRLRUUdu6kx0KW9NtmKOGGtcuOve4VDdU
	 3nnqBnPxalvDT1M+NHFbMXwu+5MEw7PPowlhDnmWAsk9p5auK4fT41P1a/s+GAn9G1
	 8FArP7ZNdaTcQ==
Date: Fri, 4 Apr 2025 16:03:57 +0100
From: Mark Brown <broonie@kernel.org>
To: cy_huang@richtek.com
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Otto lin <otto_lin@richtek.com>, Allen Lin <allen_lin@richtek.com>,
	devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] ASoC: codecs: Add support for Richtek rt9123
Message-ID: <4e966f68-527e-4e2c-9043-0795ff094031@sirena.org.uk>
References: <cover.1743774849.git.cy_huang@richtek.com>
 <cff65757c4665a81397ef5f559b277f96d4236c3.1743774849.git.cy_huang@richtek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9628Pw6gulXwsFcV"
Content-Disposition: inline
In-Reply-To: <cff65757c4665a81397ef5f559b277f96d4236c3.1743774849.git.cy_huang@richtek.com>
X-Cookie: You will soon forget this.


--9628Pw6gulXwsFcV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 04, 2025 at 10:22:12PM +0800, cy_huang@richtek.com wrote:

> +static int rt9123_enable_event(struct snd_soc_dapm_widget *w, struct snd_kcontrol *kcontrol,
> +			       int event)
> +{

> +	ret = pm_runtime_resume_and_get(dev);
> +	if (ret)
> +		return ret;
> +
> +	snd_soc_component_write_field(comp, RT9123_REG_AMPCTRL, RT9123_MASK_AMPON, enable);
> +
> +	pm_runtime_mark_last_busy(dev);
> +	pm_runtime_put_autosuspend(dev);

What's going on with the runtime PM stuff here?  Especially for the DAPM
widget usually the ASoC core will be able to keep devices runtime PM
enabled so long as they are in use so I'd expect this not to have any
impact.  Why not just use a normal DAPM widget?

> +static int rt9123_xhandler_get(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
> +	struct device *dev = comp->dev;
> +	int ret;
> +
> +	ret = pm_runtime_resume_and_get(dev);
> +	if (ret)
> +		return ret;
> +
> +	if (rt9123_kcontrol_name_comp(kcontrol, "SPK Gain Volume") == 0)
> +		ret = snd_soc_get_volsw(kcontrol, ucontrol);
> +	else
> +		ret = snd_soc_get_enum_double(kcontrol, ucontrol);

This is even more unusual - it'll runtime PM enable the device every
time we write to a control, even if the device is idle.  The driver does
implement a register cache so it's especially confusing, we'll power up
the device, resync the cache, write to the hardware then power the
device off again.  Usually you'd just use the standard operations and
then let the register writes get synced to the cache whenever it gets
enabled for actual use.  Again, why not just use standard controls?

> +static const struct snd_kcontrol_new rt9123_controls[] = {
> +	SOC_SINGLE_TLV("Master Volume", RT9123_REG_VOLGAIN, 2, 511, 1, dig_tlv),
> +	SOC_SINGLE_EXT_TLV("SPK Gain Volume", RT9123_REG_AMPCTRL, 0, 10, 0, rt9123_xhandler_get,
> +			   rt9123_xhandler_put, ana_tlv),

Speaker Volume.

> +static const struct regmap_config rt9123_regmap_config = {
> +	.name			= "rt9123",
> +	.reg_bits		= 8,
> +	.val_bits		= 16,
> +	.val_format_endian	= REGMAP_ENDIAN_BIG,
> +	.readable_reg		= rt9123_readable_reg,
> +	.writeable_reg		= rt9123_writeable_reg,
> +	.volatile_reg		= rt9123_volatile_reg,
> +	.cache_type		= REGCACHE_RBTREE,
> +	.num_reg_defaults_raw	= RT9123_REG_COMBOID + 1,
> +};

Generally _MAPLE is a better cache type for most devices - unless you
have a strong reason to use _RBTREE it's preferred.

> +	/* Trigger RG reset before regmap init cache */
> +	ret = i2c_smbus_write_word_data(i2c, RT9123_REG_AMPCTRL, RT9123_MASK_SWRST);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to trigger RG reset\n");
> +
> +	regmap = devm_regmap_init_i2c(i2c, &rt9123_regmap_config);
> +	if (IS_ERR(regmap))
> +		return dev_err_probe(dev, PTR_ERR(regmap), "Failed to init regmap\n");
> +
> +	ret = regmap_read(regmap, RT9123_REG_COMBOID, &venid);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to read vendor-id\n");
> +
> +	if ((venid & RT9123_MASK_VENID) != RT9123_FIXED_VENID)
> +		return dev_err_probe(dev, -ENODEV, "Incorrect vendor-id 0x%04x\n", venid);

It seems nicer to verify the device ID before doing the reset in case
anything went wrong.  Who knows what some other device did with the
reset?

--9628Pw6gulXwsFcV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfv9N0ACgkQJNaLcl1U
h9CpLAf+PrLvvo9HrBkAxc7COS0E+N3WeNtfmUpPtg64UCe9Ht5ZF4yPXcV110lf
cQ2G/vvou3f1jiEMX8QW2Yvr8flocvlq9YtHoZNdpNDro4Maq0EaANv9M4p8xYeu
PG4S6ddAea6mH8JQ54fjIcHkwjX2OFPdhoLuqQ+zDnKWCFxoFdn81CJ9OKALwxAX
+RkbO5/ck/0ZjVuBKUaMQgYKx5V/JatGUR5oZlClXVCJrioXzJGy4Xm6lhZK/vIt
vnEQkd/oY2rI5vwF5zmogQ0pbAxMUmEsDz1nEbXRmtJX8uB0UXllopMlMIoh3dhG
wVroyGzwdiI7xJgAWLCta79eJMSAbw==
=TRlR
-----END PGP SIGNATURE-----

--9628Pw6gulXwsFcV--
