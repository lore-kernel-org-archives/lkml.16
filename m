Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F352E7F1A;
	Thu,  3 Jul 2025 14:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751554779; cv=none; b=QfGq91Ev2lTw+VbQBNe3A1vD6gLPNqlGIhhdYGeC2aLGzL4OLO2N+0UyEaSdX5EbWkAqwKNWZl7LE//WZeQ/gQ8BzbJ9Bz4PMySVSAIExYFIbuuCnJaFKztk6bNvv91ckyzq6lxNAFIXQ8a+eOjbJc7mPB/GhuuW8D9iIuJ0Cpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751554779; c=relaxed/simple;
	bh=QUqOb2EebDHsVYYpyfbnfXwvdk8FD5an+MmZU/lo/7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XcZjmiIGrpX4j6rk5tuDHxRnHMXOJ+yJrquBvPknOXDdklQA0GtI40o5JEDa4YfFXU8LgjLuhBYHcjmyCLGY2ej+Rcj5C/MES4whGn8j+A5r5qWLGvODfqw8QnuOvBGk8yxeb7EPyOHLG0XCEbNrBg1IEtKXliiTO/CSdQfiGF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M6KjGOSY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M6KjGOSY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F9DCC4CEEE;
	Thu,  3 Jul 2025 14:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751554779;
	bh=QUqOb2EebDHsVYYpyfbnfXwvdk8FD5an+MmZU/lo/7k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M6KjGOSYVeNiEoPZzNx85oCn9zLKnXQksNBGNAJ/RLGS3JzqDtcK20caOH721jLMD
	 nXCTZTjUCKIN4vyimlGVwxjxDCyRJ3Vcigzgw9vPjTbspkG9tP3gYKN5Qql64abkGj
	 it3WisQPe369wDiXVR+4Zszxyb0sUtIi/mI0Y74D5a+BPuZXDIL/hB+wKYid/baARt
	 6uUBhsoowBsNrskFp83wflaCUU/RZnz2/7Zdk82m4039Th8/tJiCVBidbXtFvNLfLl
	 rdfauIiieB2zaRR/N5X9Uob2LRkVtt397KU+pXfuXGw7bvyFAaevFmxA6KjW2ZfqKy
	 fles3uOvKgyew==
Date: Thu, 3 Jul 2025 15:59:34 +0100
From: Mark Brown <broonie@kernel.org>
To: Nick <nick.li@foursemi.com>
Cc: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, perex@perex.cz, tiwai@suse.com,
	like.sin@gmail.com, xiaoming.yang@foursemi.com,
	danyang.zheng@foursemi.com, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/4] ASoC: codecs: Add FourSemi FS2104/5S audio
 amplifier driver
Message-ID: <b1ad15d1-bf9f-4b94-abb8-1e9c6d512987@sirena.org.uk>
References: <20250703035639.7252-1-nick.li@foursemi.com>
 <20250703035639.7252-3-nick.li@foursemi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KQuaR0oO00aYQzSl"
Content-Disposition: inline
In-Reply-To: <20250703035639.7252-3-nick.li@foursemi.com>
X-Cookie: Uh-oh!!  I'm having TOO MUCH FUN!!


--KQuaR0oO00aYQzSl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 03, 2025 at 11:56:37AM +0800, Nick wrote:

> +++ b/sound/soc/codecs/fs210x.c
> @@ -0,0 +1,1616 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * fs210x.c -- Driver for the FS2104/5S Audio Amplifier
> + *
> + * Copyright (C) 2016-2025 Shanghai FourSemi Semiconductor Co.,Ltd.

Please make the entire comment a C++ one so things look more
intentional.

> +#define FS210X_DRV_VERSION		"v1.0.6"

We generally don't do versions for components within the kernel, nobody
is going to update it going forward.

> +static int fs210x_reg_read(struct fs210x_priv *fs210x,
> +			   u8 reg, u16 *pval)

> +	if (pval)
> +		*pval =3D (u16)val;
> +

If this cast is needed that's a bit worrying.

> +	dev_dbg(fs210x->dev, "RR: %02x %04x\n", reg, val);

We do have a lot of logging support in regmap which is more
controllable.

> +static int fs210x_reg_dump(struct fs210x_priv *fs210x)
> +{

This is duplicating regmap's debugfs.

> +	} else if (pkg->cmd =3D=3D FS_CMD_DELAY) {
> +		if (pkg->regv.val > FS_CMD_DELAY_MS_MAX)
> +			return -ENOTSUPP;
> +		delay_us =3D pkg->regv.val * 1000;
> +		usleep_range(delay_us, delay_us + 50);

Just use fsleep(), it'll use the most sensible delay type for the delay.
In general this applies to all delays in the driver, but especially with
a variable delay like this.

> +static int fs210x_set_pcm_volume(struct fs210x_priv *fs210x)

> +	ret  =3D fs210x_reg_write(fs210x, FS210X_39H_LVOLCTRL, vol[0]);
> +	ret |=3D fs210x_reg_write(fs210x, FS210X_3AH_RVOLCTRL, vol[1]);
> +

This looks pretty generic, why is it not using a standard control type?

> +	ret =3D fs210x_set_pcm_volume(fs210x);

The driver should use the device defaults rather than having to=20

> +static void fs210x_sdz_pin_set(struct fs210x_priv *fs210x, bool active)
> +{
> +	if (!fs210x || !fs210x->gpio_sdz)
> +		return;

Shouldn't this be integrated with the chip init/reset?

> +static int fs210x_mute(struct fs210x_priv *fs210x, bool mute)
> +{
> +	int ret;
> +
> +	if (mute) {
> +		cancel_delayed_work_sync(&fs210x->fault_check_work);
> +		cancel_delayed_work_sync(&fs210x->start_work);
> +		mutex_lock(&fs210x_mutex);
> +		ret =3D fs210x_dev_stop(fs210x);
> +		mutex_unlock(&fs210x_mutex);
> +		return ret;
> +	}

Mute is expected to be a really fast operation, this is stopping the
device entirely and fiddling about with locks (which were held where?).
This looks like the device just doesn't support mute.

> +	/*
> +	 * According to the power up/down sequence of FS210x,
> +	 * the FS210x requests the I2S clock has been present
> +	 * and stable(>=3D 2ms) before it playing.
> +	 */
> +	if (fs210x->clk_bclk) {
> +		mutex_lock(&fs210x_mutex);
> +		ret =3D fs210x_dev_play(fs210x);
> +		mutex_unlock(&fs210x_mutex);
> +	} else {

This is definitely not appropriate for mute, it should be in the power
management flow - either set_bias_level() or a DAPM widget.

> +	case SND_SOC_DAIFMT_CBC_CFC:
> +		/* Only supports slave mode */

consumer mode.

> +static int fs210x_dai_hw_params(struct snd_pcm_substream *substream,
> +				struct snd_pcm_hw_params *params,
> +				struct snd_soc_dai *dai)

> +	dev_info(fs210x->dev, "hw params: %d-%d-%d\n",
> +		 fs210x->srate, chn_num, fs210x->bclk);

No dev_info() prints in the normal playback/record flow, that just spams
the logs too easily.

> +	/* The FS2105S can't support 16kHz sample rate. */
> +	if (fs210x->devid =3D=3D FS2105S_DEVICE_ID && fs210x->srate =3D=3D 1600=
0)
> +		return -ENOTSUPP;

This should be reported in constraints too.

> +	if (!(status & FS210X_05H_AMPS_MASK))
> +		dev_err(fs210x->dev, "Amplifier unready\n");

Does this get triggered during the normal start/stop flow?

> +	schedule_delayed_work(&fs210x->fault_check_work,
> +			      msecs_to_jiffies(FS210X_FAULT_CHECK_INTERVAL_MS));

Might be good to have this tunable from sysfs.

> +static int fs210x_pcm_volume_put(struct snd_kcontrol *kcontrol,
> +				 struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct fs210x_priv *fs210x;
> +	long *pval;
> +	int ret;
> +
> +	ret =3D fs210x_get_drvdata_from_kctrl(kcontrol, &fs210x);
> +	if (ret || !fs210x->dev) {
> +		pr_err("pcm_volume_put: fs210x is null\n");
> +		return -EINVAL;
> +	}
> +

_put() callbacks should return 1 when the control changes values, though
as indicated above I'm not clear this needs to be a custom control at
all.  Please run mixer-test against your driver, it will check for this
and other issues.

> +static int fs210x_effect_scene_put(struct snd_kcontrol *kcontrol,
> +				   struct snd_ctl_elem_value *ucontrol)
> +{

> +	/*
> +	 * FS210x has scene(s) as below:
> +	 * init scene: id =3D 0(It's set in fs210x_init_chip() only)
> +	 * effect scene(s): id =3D 1~N (optional)
> +	 * scene_id =3D effect_index + 1.
> +	 */
> +	scene_id =3D ucontrol->value.integer.value[0] + 1;
> +	if (fs210x->is_suspended) {
> +		fs210x->scene_id =3D scene_id;
> +		mutex_unlock(&fs210x_mutex);
> +		return 0;
> +	}

This doesn't validate the passed value at all.

> +static int fs210x_probe(struct snd_soc_component *cmpnt)
> +{
> +	struct fs210x_priv *fs210x;
> +	int ret;

> +	INIT_DELAYED_WORK(&fs210x->fault_check_work, fs210x_fault_check_work);
> +	INIT_DELAYED_WORK(&fs210x->start_work, fs210x_start_work);
> +
> +	fs210x_get_bclk(fs210x, cmpnt);

This sort of initialisation and resource acquisition that doesn't
require any audio stuff should be done at the bus level so that we don't
register with ASoC until all the inputs are ready.

> +#ifdef CONFIG_PM
> +static int fs210x_suspend(struct snd_soc_component *cmpnt)
> +{
> +	struct fs210x_priv *fs210x;
> +	int ret;
> +
> +	fs210x =3D snd_soc_component_get_drvdata(cmpnt);
> +	if (!fs210x || !fs210x->dev)
> +		return -EINVAL;
> +
> +	cancel_delayed_work_sync(&fs210x->start_work);
> +	cancel_delayed_work_sync(&fs210x->fault_check_work);
> +
> +	mutex_lock(&fs210x_mutex);

We don't need to prevent new work being scheduled?

--KQuaR0oO00aYQzSl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhmmtUACgkQJNaLcl1U
h9CKsQf8D+qLrVWj/VZbGjfaCCepR4/GW/OibRLspA/NKkdIR6BHl5kHr0bDp38w
ZWF3t0eUnwL/tFXN1csAT3zhMBe5HNnXF7zSX50aLKqlsPGTskGZaGzG9Wv7ViXr
xIgsIUzwRcVYOWREqksYR4v5zrRt4eHe1BO84UYAL56EwRrJthtjX4qcUKxO1iyd
tqKua+9wHLvVpVYlF4NoXFso5ECLN5fkLO8+7YLee4Z9lk6sR4M/07zHLae9F2/c
b5+3inorreAkGDcw6tXb5zpi6+/KbkQbWnF+eJZ47477seDK9VIQXTs+dgRlGI2E
rqJeqY0L48dkrMdthrh5vaM3RO+Hpw==
=e24l
-----END PGP SIGNATURE-----

--KQuaR0oO00aYQzSl--
