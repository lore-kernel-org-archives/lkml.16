Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A9542A83;
	Fri,  4 Jul 2025 14:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751639860; cv=none; b=JfrJkeKOQMfHJwL3/JHw7N8eYcK7i20bfc5UNnlyMj570U50tD+TLA+5ZHuyTIFNACvEfmNbo2ox77xyHPe+8sPTbfCylMDZrvtNItSLtxREqloBJ/E53C9bAOKMktKgTOTqzsEdLRpPXAaAeavUQ05AbXOn6K5PMwwGnKqz2Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751639860; c=relaxed/simple;
	bh=b/7DF43NShQz0jj5KS0cUtXQl9ATq8leuWFS9jBryPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lIEcGIWactYokUnjussMurq7xCVRLgA9rntV2hTJg2RntuweFlpGLNLWAfdi1ADftPDnL5hebx4gRqrb2cfB4tCqJHMzVfoAwtL3YODwMyKLK5bOWWS7+tvsIGZPjbG2G71Jrck89ES0ylxNZRxR5HJlhLKw05z/QnoX0tFpf04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=azEE4WES; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="azEE4WES"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F2C2C4CEE3;
	Fri,  4 Jul 2025 14:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751639857;
	bh=b/7DF43NShQz0jj5KS0cUtXQl9ATq8leuWFS9jBryPs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=azEE4WES2NQXRB3qc3wkHQA+59XdtsTY4YediiX1ZhgNgF8rDwMXtNJQZPHUIJhwR
	 +BzLaYJiyauOFizJ0BhQCC3ulf5qXYNjU81+TOvK2uRpD226/8/Fp7BZ9a45Lgoltu
	 3NOqFTyEx5SjuR8+mhYVGivgP1T7jsTZw9tN8gD/Asr8DexTezm3vuPlZy0Tcs+R33
	 m5QwB1lXQU2Di3zBD1kfzeVgmZmyj+CDjY9ircZ/QCFadZT0iXHJoZUY7+6Kdd7D4O
	 tPn59BD38gC5405lrdPVgMBKH3Y45DAb9TGRb4W11tEGNK/QrUldRyUAqSWMhgHuSJ
	 2Sd3UvoeWeY1Q==
Date: Fri, 4 Jul 2025 15:37:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Nick Li <nick.li@foursemi.com>
Cc: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, perex@perex.cz, tiwai@suse.com,
	xiaoming.yang@foursemi.com, danyang.zheng@foursemi.com,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/4] ASoC: codecs: Add FourSemi FS2104/5S audio
 amplifier driver
Message-ID: <0370941d-63eb-4676-8a74-b8afef524376@sirena.org.uk>
References: <20250703035639.7252-1-nick.li@foursemi.com>
 <20250703035639.7252-3-nick.li@foursemi.com>
 <b1ad15d1-bf9f-4b94-abb8-1e9c6d512987@sirena.org.uk>
 <1C4720AC50797830+aGe3L70OToh6txmC@foursemi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/dy0sp4doMeEvLCg"
Content-Disposition: inline
In-Reply-To: <1C4720AC50797830+aGe3L70OToh6txmC@foursemi.com>
X-Cookie: VMS must die!


--/dy0sp4doMeEvLCg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 04, 2025 at 07:12:47PM +0800, Nick Li wrote:
> On Thu, Jul 03, 2025 at 03:59:34PM +0100, Mark Brown wrote:
> > On Thu, Jul 03, 2025 at 11:56:37AM +0800, Nick wrote:

> > > +static int fs210x_set_pcm_volume(struct fs210x_priv *fs210x)

> > > +	ret  =3D fs210x_reg_write(fs210x, FS210X_39H_LVOLCTRL, vol[0]);
> > > +	ret |=3D fs210x_reg_write(fs210x, FS210X_3AH_RVOLCTRL, vol[1]);

> > This looks pretty generic, why is it not using a standard control type?

> 1. We use regmap as REGMAP_NONE, because most of the registers settings
>    are in the firmware, if we use a standard control,the driver shouldn't
>    cache the registers after suspending the device(it will be reset).

You can exclude registers from a cache, including excluding most of
them, or manually handle registers over suspend/resume.  It's generally
better to share the userspace facing interfaces.

> 2. The volume registers of FS2104 and FS2105S are different,
>    if we us a stardard control, we need two controls,
>    and register it by checking the device type.
> so we customize the volume control.

If the different devices have different controls you should just
register different controls.

> > > +	ret =3D fs210x_set_pcm_volume(fs210x);

> > The driver should use the device defaults rather than having to=20

> The volume contorl can be used to set different volumes,
> the volume will be masked in fs210x->vol[2],
> we restore the volume when the driver resumes(reinitializes) the deivce.

You're not just restoring the values on resume, you're also overwriting
them on probe.

> > > +static void fs210x_sdz_pin_set(struct fs210x_priv *fs210x, bool acti=
ve)
> > > +{
> > > +	if (!fs210x || !fs210x->gpio_sdz)
> > > +		return;

> > Shouldn't this be integrated with the chip init/reset?

> 1. We implement this function(reset and wait times) to clarify that
>    pulling up/down the SDZ/reset pin must to wait enougth delay time.

That doesn't really answer the question?

> > > +	 * According to the power up/down sequence of FS210x,
> > > +	 * the FS210x requests the I2S clock has been present
> > > +	 * and stable(>=3D 2ms) before it playing.
> > > +	 */
> > > +	if (fs210x->clk_bclk) {
> > > +		mutex_lock(&fs210x_mutex);
> > > +		ret =3D fs210x_dev_play(fs210x);
> > > +		mutex_unlock(&fs210x_mutex);
> > > +	} else {

> > This is definitely not appropriate for mute, it should be in the power
> > management flow - either set_bias_level() or a DAPM widget.

> 1. Because the device uses BCLK clock as the clock source,
>    we need to start the device in the life cycle of the clock,
>    also we need to start device after the PLL setting(set in dai->hw_para=
ms)
>    so we start the device in here: dai->mute_stream(unmute)

All the power management happens after hw_params(), this isn't an issue.

> 2. If the SOC(s) doesn't have the clock(bclk) for us to configure,
>    It meams no clock bclk defined in the DTS,
>    and the clock is activated in dai->trigger start usually,
>    so we will use a delay work to start the device in here.

> Any good ideas about satisfying this power up/down sequence?

There's not great options here, and you're going to loose the start of
playback especially with devices that don't start clocking until audio
starts.  You really need the CPU vendors you're working with to
implement SND_SOC_DAIFMT_CONT or expose their clocks via the clock API
but not all hardware is able to do this.  I think given how limited your
hardware is here you really need something in trigger() or some new
callback that runs later than that, the delayed work you've got there is
trying to fudge things to run after trigger.

> > > +	if (!(status & FS210X_05H_AMPS_MASK))
> > > +		dev_err(fs210x->dev, "Amplifier unready\n");

> > Does this get triggered during the normal start/stop flow?

> It will get triggered when:
> 1. BCLK clock is closed before stoping device
> 2. BCLK clock is opened after starting device
> We should avoid these power up/down sequence, it may cause pop noise,
> If they happens, it should be reported and fixed?

If they don't happen in normal operation it's fine to have them, the
concern was that this would be triggered during normal operation as part
of the startup or shutdown sequence.

> > > +	schedule_delayed_work(&fs210x->fault_check_work,
> > > +			      msecs_to_jiffies(FS210X_FAULT_CHECK_INTERVAL_MS));

> > Might be good to have this tunable from sysfs.

> Good idea, or set the interval times by the DTS property.
> We are considering adding a DTS property:
> foursemi,monitor-period-ms

I suspect the DT people won't like that since it's more of a tuning
thing.

> > > +static int fs210x_suspend(struct snd_soc_component *cmpnt)
> > > +{
> > > +	struct fs210x_priv *fs210x;
> > > +	int ret;
> > > +
> > > +	fs210x =3D snd_soc_component_get_drvdata(cmpnt);
> > > +	if (!fs210x || !fs210x->dev)
> > > +		return -EINVAL;

> > > +	cancel_delayed_work_sync(&fs210x->start_work);
> > > +	cancel_delayed_work_sync(&fs210x->fault_check_work);

> > > +	mutex_lock(&fs210x_mutex);

> > We don't need to prevent new work being scheduled?

> Could you please explain more details to help me understand and test this=
 case?

What if for example playback is starting up at the same time as the
system enters suspend - the CODEC startup might get run after the
delayed work is cancelled but before the lock is taken.

--/dy0sp4doMeEvLCg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhn5ysACgkQJNaLcl1U
h9DiFAf6A7muddYRG3lx+NR9agOvs68qIJX5nnNGk/wPu/lrWK1Ud+xoyySqmb5S
6BI3TiGzt4bJxqrA3uhmPo+NnFEqy1SolCfrjknTIfnvn8MKGU6Hs+weFpSnPtHz
RZ/JBUYIwQDfcjGD0KxnM7AF68WV0sCyWObJ7JdiTjGsOHzkf6sSFau4vKzjPrpC
S3n0FXXOFDUqOThjb0l0pYo2cKZ5K0kcK258EKNMi/BXu4VH/xSfx09sdAkSBxL+
sqxD/PKjfMCQwUs+ekOzJOd1R1KNz0lBSIHS+pJxxelKibZLwcbe0x3jFVPQiEmb
Fteu2kGgWHh4nsj4peVrymTQkIpSTg==
=kaxR
-----END PGP SIGNATURE-----

--/dy0sp4doMeEvLCg--
