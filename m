Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9543A2E9742;
	Fri,  4 Jul 2025 11:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751627636; cv=none; b=X+eP0S4MeAOq7Z2LqmQC1LXaJggR9YRwUHqJV4AB3UFyTLVfqkpQvoaVLfH4Z2IewSYljjHNV3k5eCgfMMtNf5OI3BQrGKy3PZqi2dbvHqjHRPvYifGFkBsxR/dx9RUzBOQKvZ9OZzuNlwo5Fh73N+dELfa6TEJFEpv7xusSSu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751627636; c=relaxed/simple;
	bh=TLjgjAKejhWnQQrBZuOEj0t8hkGOC2g238gXlgd2e4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qqQLgr4xPxnlgyXnIqR75cwk3/U+KaNeRcZlGczNtdbcb6oAvLbPJPbHXG9DS5ZIRCzpRTvohhykWZ0CPqv1o8cmVQ3WcgxyoZc+40MTLNVN5lzFFGExfhwU2wPW4iiLM9ugWG2Gh2ShU2CojPKblK8crgS9aDyZ+TsmJ+MmK/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foursemi.com; spf=pass smtp.mailfrom=foursemi.com; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foursemi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foursemi.com
X-QQ-mid: zesmtpgz8t1751627568tf11212fc
X-QQ-Originating-IP: DyyCLDr/VddxgWOyG6FtBM3EuCWAmFKBNj6PFHf6uvs=
Received: from localhost ( [183.17.231.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 04 Jul 2025 19:12:47 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7044233768972954240
EX-QQ-RecipientCnt: 12
Date: Fri, 4 Jul 2025 19:12:47 +0800
From: Nick Li <nick.li@foursemi.com>
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, perex@perex.cz, tiwai@suse.com,
	xiaoming.yang@foursemi.com, danyang.zheng@foursemi.com,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/4] ASoC: codecs: Add FourSemi FS2104/5S audio
 amplifier driver
Message-ID: <1C4720AC50797830+aGe3L70OToh6txmC@foursemi.com>
References: <20250703035639.7252-1-nick.li@foursemi.com>
 <20250703035639.7252-3-nick.li@foursemi.com>
 <b1ad15d1-bf9f-4b94-abb8-1e9c6d512987@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b1ad15d1-bf9f-4b94-abb8-1e9c6d512987@sirena.org.uk>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:foursemi.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: Nr5N425iK0yrrbPt1Ur/z62sh7k24J83ypD9WyxpXv0brnfcnktEh1Ym
	76hvkRpdcJNFSR1GaM8zxGh+albknYSxuieVdWGGWZyOdQGgpu2RH1a5PaQ9FHUE4+DvJKU
	VW++t+144A877EvroqOOf5PIceUMDgBSgm4aUDvcE9+QUoGPMklwXDwkVyTmKi5rwnTZuI3
	nMC1mV0zar/mSmSjxd7D5sTwV3ETrFKdJfaf63HwNUcLH7AxoncmzRHMeNFO+jzMhja1HLG
	1paOo63RSUUTPH4gon4RGNhBAsb081zTwJDhXDB39BSzyZSR/J/ydI8lyOU178MTB6DCrsR
	UdfiRQkd0QQdVL1TrJsPUhrXR7VNH2LBjL9vttD6MRuEdg3EF8shBVeIYR+BQoJTF5pwNfa
	2oHH8BTiFzyT8Dkd1ixcyWJ74aMbmFKb+XyixI240aQZ0GRtXbMlKuy15Hl5t0zu7lM0BNV
	gu7Km5u/sbVYnEnbdUFJiJw03V5r7gYv30Ikmou4Scj0S7K9GsKu24AqZItKI0iR465RN5V
	7oypCifzrexWykzBdSmUXiASpLnLEfiESEKlcqbVP4cVXAywZAjjD4OkmTXfSoC6fUGzRy5
	EPplX4MsqT0PlGfBu1EX4UbBXv7Kd4Pd2DhdlsJXtpXhlb6/gSDknznaIJla8gdyW1RmLN8
	/Ynb+0xY3vLHp7v+RIsLiYC3q3N2YNzzVuzOXFQkjm6FrKocJ+Bz0MKnDzJWQVLiiiLK6ST
	lARmA2/3Piy+sT/+drbKd2HrmDAn4GqXIZa6QweFYKs1lg+z4i0DH7E6Tp4ASSPfTA/8z6w
	SHeRJUG5LOsDAfT2BDGTQRUvoDgrPWQyZVQGiicqXXnPt1vz/MXS3NeGqmL1g6cAXX0lUKM
	EdgYxmXpxfotWLEm1vyYRpmqJSVPXldPQhy/P/Tc4RHS3tAJHFsIkm9Ru3G86vY2yFmByc+
	U2JZnnHOQ0dG4I5X00iIJ7qqgc1QF46LIDvncva3uFwV5Q6JYeX8Ama7FRoNQu8/SY7+COu
	H9kAnQ5XNlOzK8W+OU4E3Wvj/NqS0=
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0

On Thu, Jul 03, 2025 at 03:59:34PM +0100, Mark Brown wrote:
> On Thu, Jul 03, 2025 at 11:56:37AM +0800, Nick wrote:
> 
> > +++ b/sound/soc/codecs/fs210x.c
> > @@ -0,0 +1,1616 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * fs210x.c -- Driver for the FS2104/5S Audio Amplifier
> > + *
> > + * Copyright (C) 2016-2025 Shanghai FourSemi Semiconductor Co.,Ltd.
> 
> Please make the entire comment a C++ one so things look more
> intentional.

OK, we will update to use // istead of /**/

> 
> > +#define FS210X_DRV_VERSION		"v1.0.6"
> 
> We generally don't do versions for components within the kernel, nobody
> is going to update it going forward.

OK, we will delete the version and related calls

> 
> > +static int fs210x_reg_read(struct fs210x_priv *fs210x,
> > +			   u8 reg, u16 *pval)
> 
> > +	if (pval)
> > +		*pval = (u16)val;
> > +
> 
> If this cast is needed that's a bit worrying.

OK, we will delete the judgement.

> 
> > +	dev_dbg(fs210x->dev, "RR: %02x %04x\n", reg, val);
> 
> We do have a lot of logging support in regmap which is more
> controllable.

OK, we will remove this debug log, it's for test.

> 
> > +static int fs210x_reg_dump(struct fs210x_priv *fs210x)
> > +{
> 
> This is duplicating regmap's debugfs.

We use it to print reigsters when the device accors a fault in the checking
monitor, especially for dealing with probabilistic issues,
these logs are beneficial for analyzing the problem.

> 
> > +	} else if (pkg->cmd == FS_CMD_DELAY) {
> > +		if (pkg->regv.val > FS_CMD_DELAY_MS_MAX)
> > +			return -ENOTSUPP;
> > +		delay_us = pkg->regv.val * 1000;
> > +		usleep_range(delay_us, delay_us + 50);
> 
> Just use fsleep(), it'll use the most sensible delay type for the delay.
> In general this applies to all delays in the driver, but especially with
> a variable delay like this.

OK, we will replace usleep_range to fsleep

> 
> > +static int fs210x_set_pcm_volume(struct fs210x_priv *fs210x)
> 
> > +	ret  = fs210x_reg_write(fs210x, FS210X_39H_LVOLCTRL, vol[0]);
> > +	ret |= fs210x_reg_write(fs210x, FS210X_3AH_RVOLCTRL, vol[1]);
> > +
> 
> This looks pretty generic, why is it not using a standard control type?

1. We use regmap as REGMAP_NONE, because most of the registers settings
   are in the firmware, if we use a standard control,the driver shouldn't
   cache the registers after suspending the device(it will be reset).
2. The volume registers of FS2104 and FS2105S are different,
   if we us a stardard control, we need two controls,
   and register it by checking the device type.
so we customize the volume control.

> 
> > +	ret = fs210x_set_pcm_volume(fs210x);
> 
> The driver should use the device defaults rather than having to 

The volume contorl can be used to set different volumes,
the volume will be masked in fs210x->vol[2],
we restore the volume when the driver resumes(reinitializes) the deivce.

> 
> > +static void fs210x_sdz_pin_set(struct fs210x_priv *fs210x, bool active)
> > +{
> > +	if (!fs210x || !fs210x->gpio_sdz)
> > +		return;
> 
> Shouldn't this be integrated with the chip init/reset?

1. We implement this function(reset and wait times) to clarify that
   pulling up/down the SDZ/reset pin must to wait enougth delay time.

> 
> > +static int fs210x_mute(struct fs210x_priv *fs210x, bool mute)
> > +{
> > +	int ret;
> > +
> > +	if (mute) {
> > +		cancel_delayed_work_sync(&fs210x->fault_check_work);
> > +		cancel_delayed_work_sync(&fs210x->start_work);
> > +		mutex_lock(&fs210x_mutex);
> > +		ret = fs210x_dev_stop(fs210x);
> > +		mutex_unlock(&fs210x_mutex);
> > +		return ret;
> > +	}
> 
> Mute is expected to be a really fast operation, this is stopping the
> device entirely and fiddling about with locks (which were held where?).
> This looks like the device just doesn't support mute.

To avoid the pop noise, the device will fade out when we mute/stop it,
and the power down sequence of FS210x requests the driver to wait
enougth times before the BCLK is off or starting device in next time.

> 
> > +	/*
> > +	 * According to the power up/down sequence of FS210x,
> > +	 * the FS210x requests the I2S clock has been present
> > +	 * and stable(>= 2ms) before it playing.
> > +	 */
> > +	if (fs210x->clk_bclk) {
> > +		mutex_lock(&fs210x_mutex);
> > +		ret = fs210x_dev_play(fs210x);
> > +		mutex_unlock(&fs210x_mutex);
> > +	} else {
> 
> This is definitely not appropriate for mute, it should be in the power
> management flow - either set_bias_level() or a DAPM widget.

1. Because the device uses BCLK clock as the clock source,
   we need to start the device in the life cycle of the clock,
   also we need to start device after the PLL setting(set in dai->hw_params)
   so we start the device in here: dai->mute_stream(unmute)
2. If the SOC(s) doesn't have the clock(bclk) for us to configure,
   It meams no clock bclk defined in the DTS,
   and the clock is activated in dai->trigger start usually,
   so we will use a delay work to start the device in here.

Any good ideas about satisfying this power up/down sequence?

> 
> > +	case SND_SOC_DAIFMT_CBC_CFC:
> > +		/* Only supports slave mode */
> 
> consumer mode.

OK.

> 
> > +static int fs210x_dai_hw_params(struct snd_pcm_substream *substream,
> > +				struct snd_pcm_hw_params *params,
> > +				struct snd_soc_dai *dai)
> 
> > +	dev_info(fs210x->dev, "hw params: %d-%d-%d\n",
> > +		 fs210x->srate, chn_num, fs210x->bclk);
> 
> No dev_info() prints in the normal playback/record flow, that just spams
> the logs too easily.

OK.

> 
> > +	/* The FS2105S can't support 16kHz sample rate. */
> > +	if (fs210x->devid == FS2105S_DEVICE_ID && fs210x->srate == 16000)
> > +		return -ENOTSUPP;
> 
> This should be reported in constraints too.

OK.

> 
> > +	if (!(status & FS210X_05H_AMPS_MASK))
> > +		dev_err(fs210x->dev, "Amplifier unready\n");
> 
> Does this get triggered during the normal start/stop flow?

It will get triggered when:
1. BCLK clock is closed before stoping device
2. BCLK clock is opened after starting device
We should avoid these power up/down sequence, it may cause pop noise,
If they happens, it should be reported and fixed?

> 
> > +	schedule_delayed_work(&fs210x->fault_check_work,
> > +			      msecs_to_jiffies(FS210X_FAULT_CHECK_INTERVAL_MS));
> 
> Might be good to have this tunable from sysfs.

Good idea, or set the interval times by the DTS property.
We are considering adding a DTS property:
foursemi,monitor-period-ms

> 
> > +static int fs210x_pcm_volume_put(struct snd_kcontrol *kcontrol,
> > +				 struct snd_ctl_elem_value *ucontrol)
> > +{
> > +	struct fs210x_priv *fs210x;
> > +	long *pval;
> > +	int ret;
> > +
> > +	ret = fs210x_get_drvdata_from_kctrl(kcontrol, &fs210x);
> > +	if (ret || !fs210x->dev) {
> > +		pr_err("pcm_volume_put: fs210x is null\n");
> > +		return -EINVAL;
> > +	}
> > +
> 
> _put() callbacks should return 1 when the control changes values, though
> as indicated above I'm not clear this needs to be a custom control at
> all.  Please run mixer-test against your driver, it will check for this
> and other issues.

OK, will fix it in next version.

> 
> > +static int fs210x_effect_scene_put(struct snd_kcontrol *kcontrol,
> > +				   struct snd_ctl_elem_value *ucontrol)
> > +{
> 
> > +	/*
> > +	 * FS210x has scene(s) as below:
> > +	 * init scene: id = 0(It's set in fs210x_init_chip() only)
> > +	 * effect scene(s): id = 1~N (optional)
> > +	 * scene_id = effect_index + 1.
> > +	 */
> > +	scene_id = ucontrol->value.integer.value[0] + 1;
> > +	if (fs210x->is_suspended) {
> > +		fs210x->scene_id = scene_id;
> > +		mutex_unlock(&fs210x_mutex);
> > +		return 0;
> > +	}
> 
> This doesn't validate the passed value at all.

OK, I will fix it.

> 
> > +static int fs210x_probe(struct snd_soc_component *cmpnt)
> > +{
> > +	struct fs210x_priv *fs210x;
> > +	int ret;
> 
> > +	INIT_DELAYED_WORK(&fs210x->fault_check_work, fs210x_fault_check_work);
> > +	INIT_DELAYED_WORK(&fs210x->start_work, fs210x_start_work);
> > +
> > +	fs210x_get_bclk(fs210x, cmpnt);
> 
> This sort of initialisation and resource acquisition that doesn't
> require any audio stuff should be done at the bus level so that we don't
> register with ASoC until all the inputs are ready.
> 

OK, we will do these work in i2c probe

> > +#ifdef CONFIG_PM
> > +static int fs210x_suspend(struct snd_soc_component *cmpnt)
> > +{
> > +	struct fs210x_priv *fs210x;
> > +	int ret;
> > +
> > +	fs210x = snd_soc_component_get_drvdata(cmpnt);
> > +	if (!fs210x || !fs210x->dev)
> > +		return -EINVAL;
> > +
> > +	cancel_delayed_work_sync(&fs210x->start_work);
> > +	cancel_delayed_work_sync(&fs210x->fault_check_work);
> > +
> > +	mutex_lock(&fs210x_mutex);
> 
> We don't need to prevent new work being scheduled?

Could you please explain more details to help me understand and test this case?
Thanks.

Best regards,
Nick

