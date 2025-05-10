Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B89B1E1E13;
	Sat, 10 May 2025 07:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746863449; cv=none; b=h5omqafuPnSCXcZvtiev/XqByfBVmWyq7baGvV5r4KYeIcsddXFRhXtEvuUzo5dx8e5YOUb1KtV2LccojVuSEciUpkOP067zzlALZ8dhZ6vRiTsJ3YY5OKcikllTQletsVLRyKN1H5YQRTjrfL/lrcKsYuc6crtj/5UegpuwaGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746863449; c=relaxed/simple;
	bh=rq3+R8KxgRQTbXSQTHcwopUOhKrrc6gxWrgWlboK0+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xh12hacEasFTHzNxm6Fw2bmBudxmXeKD319ChlYKh1mBGjqmIj9ZrQ2pUYOwTMXMRBrmYo4wvLsNGbpfGSF5F0GCUTxyTr1DnQxwgde/4+hYSMe7yTgVG0nFR3vvITwLvqgEMQjOomPe9on3rjWKbwEWWqTJ4+ohJJ2ccSHOc7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=UerPiPgR; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="UerPiPgR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1746863443;
	bh=rq3+R8KxgRQTbXSQTHcwopUOhKrrc6gxWrgWlboK0+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UerPiPgR2zXRGr3J4NW4UklryCK1zkrNBaFP6nlXrkDX1DXXDGyOzFq825xtmnLKu
	 I7dteRFqiNm7ddMS5jsg4rBXNsku3c0ezlNb7diFcdqBOshkVUtf5fEJzriPPB5tew
	 ZXRjYLMEgfipJWg1ZiajS/c0IFN5JfYqAAIC9nhw=
Date: Sat, 10 May 2025 09:50:43 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Sung-Chi Li <lschyi@chromium.org>
Cc: Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Jean Delvare <jdelvare@suse.com>, 
	Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 2/3] hwmon: (cros_ec) add PWM control over fans
Message-ID: <a07adf23-8073-4c07-ae4a-0fdd4feb9f2a@t-8ch.de>
References: <20250502-cros_ec_fan-v2-0-4d588504a01f@chromium.org>
 <20250502-cros_ec_fan-v2-2-4d588504a01f@chromium.org>
 <a89ee43f-79d9-405a-a099-7ce90fe6eb55@t-8ch.de>
 <aBgpepY29tFUGVYm@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aBgpepY29tFUGVYm@google.com>

On 2025-05-05 10:59:06+0800, Sung-Chi Li wrote:
> On Sat, May 03, 2025 at 09:36:39AM +0200, Thomas Weißschuh wrote:
> > On 2025-05-02 13:34:46+0800, Sung-Chi Li via B4 Relay wrote:
> > > From: Sung-Chi Li <lschyi@chromium.org>

<snip>

> > >  static int cros_ec_hwmon_read_temp(struct cros_ec_device *cros_ec, u8 index, u8 *temp)
> > >  {
> > >  	unsigned int offset;
> > > @@ -76,6 +114,8 @@ static int cros_ec_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
> > >  	struct cros_ec_hwmon_priv *priv = dev_get_drvdata(dev);
> > >  	int ret = -EOPNOTSUPP;
> > >  	u16 speed;
> > > +	u8 control_method;
> > > +	u8 pwm_value;
> > 
> > Ordering.
> > 
> 
> I thought you are talking about only the u8 variables, or do you mean the
> ordering should be applied with different types (and the declarations of
> different types are mixed)?

The ordering was for the whole declaration block.
If you want to keep variables of the same type together, declare them in
a single line (and sort that).

<snip>

> > > +static int cros_ec_hwmon_resume(struct platform_device *pdev)
> > > +{
> > > +	const struct cros_ec_hwmon_priv *priv = platform_get_drvdata(pdev);
> > > +	size_t i;
> > > +
> > > +	if (!priv->fan_control_supported)
> > > +		return 0;
> > > +
> > > +	/* EC sets fan control to auto after suspended, restore to settings before suspended. */
> > > +	for (i = 0; i < EC_FAN_SPEED_ENTRIES; i++) {
> > > +		if (!(priv->manual_fans & BIT(i)))
> > > +			continue;
> > > +
> > > +		/*
> > > +		 * Setting fan PWM value to EC will change the mode to manual for that fan in EC as
> > > +		 * well, so we do not need to issue a separate fan mode to manual call.
> > > +		 */
> > > +		cros_ec_hwmon_set_fan_pwm_val(priv->cros_ec, i, priv->manual_fan_pwm_values[i]);
> > 
> > Error handling?
> > 
> 
> I removed the error checking in the v2 version because after second thought, I
> think even if we failed at the i th fan, we should do our best to restore these
> fan settings, thus continuing on the (i+1) th fan and so on rather than stop the
> process immediately. Is adding a warning log for the failure sufficient?

A warning sounds good here.
