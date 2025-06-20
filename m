Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD3D27FB2E;
	Fri, 20 Jun 2025 13:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750425780; cv=none; b=PzTWTBZYyGVFzuKwDQbBAoDtQah2s6J+N9kjwlrvDOoxd6uUsEibWpoYbbzU20H+vniO3oYsRfCNqJyQgcD01NTkNUsD0OT3YnWrBlQg27UrR9w5Z+qHpFwG9RGDqDXIyGD9Bwj3uE/aImudvKtVAXK+5Sy8t/LrPApTpS5jC1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750425780; c=relaxed/simple;
	bh=Z6dI34PcadSBWUnLgNmXpeFHxLpXpIZw6+7HRtJHV2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bFTwy+hPrCp10RN0C6D+njKhg5v7Kk1MfO8e/WAsKL4CCbT4HaUe99px1ZTF0yxc1sniDxttDTX04bOprANVyurAOvNeLY6CwidcA5YiJiej20L0l7UUUUisEvLQFBzvr8pNOk3W8cBdas+rfi6RiKI1L0wkyP0mHBD5mjPLsoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pyO6LwBt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pyO6LwBt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A037C4CEE3;
	Fri, 20 Jun 2025 13:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750425779;
	bh=Z6dI34PcadSBWUnLgNmXpeFHxLpXpIZw6+7HRtJHV2Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pyO6LwBtgw7jw8L70hqKhL1+YTv1N+Tb5pwNIC0/7O8MSXibzB0V4nFJo4uud7L2G
	 fU91tIwxjQpVeau+JHeT3IiwgkjFBZ7iIPDyN0B4HcSlVzo3udmv/G8zx2eFoC9uGU
	 o5vBH0eQOzjARsO6kzxVlho5KL2vnOK1VaLhqxYrfp38AyBMWjhGiiK8BuPIFYlVXV
	 lc6kJw5hOnfccT+i26Q0dsOT5gPpvJkcWE2rR13y1NLy6QprFqE6dTcEDZmy1jSp4s
	 mMWLKLk0laBwHR1YzLS8d5AbIbZ/KOoRqwv3NaY+/jmDzTMaIdS+R/KBmX2uIsYG8F
	 eyRM10wUKV/BA==
Date: Fri, 20 Jun 2025 14:21:25 +0100
From: Mark Brown <broonie@kernel.org>
To: wangweidong.a@awinic.com
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	zhujun2@cmss.chinamobile.com, colin.i.king@gmail.com,
	thorsten.blum@linux.dev, u.kleine-koenig@baylibre.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	yijiangtao@awinic.com
Subject: Re: [PATCH V2] ASoC: codecs: Add calibration function to aw88399 chip
Message-ID: <aFVgVTIe5oT0MkZy@finisterre.sirena.org.uk>
References: <20250620110845.379383-1-wangweidong.a@awinic.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Bkpw4VTHetYg4Sqx"
Content-Disposition: inline
In-Reply-To: <20250620110845.379383-1-wangweidong.a@awinic.com>
X-Cookie: Do not cut switchbacks.


--Bkpw4VTHetYg4Sqx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 20, 2025 at 07:08:44PM +0800, wangweidong.a@awinic.com wrote:

> +static int aw_cali_svc_dev_cali_re(struct aw88399 *aw88399)
> +{
> +	struct aw_device *aw_dev = aw88399->aw_pa;
> +	int ret;
> +
> +	mutex_lock(&aw88399->lock);
> +	aw_cali_svc_run_mute(aw_dev, CALI_RESULT_NORMAL);
> +
> +	ret = aw_cali_svc_cali_re_mode_enable(aw_dev, true);
> +	if (ret) {
> +		dev_err(aw_dev->dev, "start cali re failed\n");
> +		goto re_mode_err;
> +	}
> +
> +	msleep(3000);

Callibration takes 3s which is a fairly long time.

> @@ -1588,6 +1968,13 @@ static int aw88399_re_get(struct snd_kcontrol *kcontrol,
>  	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
>  	struct aw88399 *aw88399 = snd_soc_component_get_drvdata(codec);
>  	struct aw_device *aw_dev = aw88399->aw_pa;
> +	int ret;
> +
> +	if (aw_dev->status) {
> +		ret = aw_cali_svc_dev_cali_re(aw88399);
> +		if (ret)
> +			return -EPERM;
> +	}

AFAICT it's triggered if the device is powered on and userspace reads
the control that reports the callibration value.  That seems like it's a
bit too easy to trigger - something like running amixer would read the
control and lock the CODEC up for 3s, and I'm guessing that if the CODEC
is powered due to audio playing that'd result in disruption to users
listening to that audio.  I think it'd be better to have another write
only control (or volatile one which reads 0 always) that triggers the
calibration when userspace writes to it ("Calibrate Now Switch" or
something).  Since the calibration is also directly writable from
userspace we can't just use a write to this control.  In general it
should always be possible to read controls without disrupting anything
else that's going on.

BTW since the calibration is dynamically done the control should be
flagged as volatile.

--Bkpw4VTHetYg4Sqx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhVYE4ACgkQJNaLcl1U
h9A/hwf/bguUOO3SrOs8tjjJIB6GtlJBftWgDaeiWdOB+YqnMWkkTs+q+vzx9jjG
at2vCZKLX8GLeBNR8Tm6RPQTfyJ1j8Rt6Y1ZWsEqujBrheP2g4d3KHDT3FUMLUhW
XJvT9W4g3HIOEjOXFzeRYojtxiMFZGMkl00za+Bi/cz7HYuJJvl7lkFGcUMuLzwi
4oXBu6QsS58jIxHTsi+mZ1hBT2WH1JpS+s4uq7J1Bn8njziFqUtCaCi65m87ktgY
N0Tkt1me0JTEP9CKaLc7mNzcYftQ0Tkdz8OZ1dtr6z4z5M76R0PwjIQMv9j3cz3I
TsvRw0NVxe29pwUGiGnb/sCVuF7IcQ==
=Gb+J
-----END PGP SIGNATURE-----

--Bkpw4VTHetYg4Sqx--
