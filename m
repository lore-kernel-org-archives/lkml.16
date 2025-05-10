Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30751DE2B4;
	Sat, 10 May 2025 07:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746863896; cv=none; b=tei9jnGyN7RG/MDtFWKVTRWejm6wKLzNfNrxEopto7y/t19zoEaiuSlcn3sOF2cJSv7t56IkarTp0r6XUZcNKS0oPvAltwHA6SeQlngcLkdJ9aioKAh/f6kc5CRAMJkTR3afUnN/k446FQfYmNnAKzO54JIC0OFYEA3SWNqSrJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746863896; c=relaxed/simple;
	bh=kftq25OgRn+R8pj3LPI+z7IFsfDRBzwEA5nhTmffpLs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dpZMCdul1+TQ0J8AoITVSG39b3KkrtNg5ry/rRtt5c2xzQby/Ik7uUyL8dqqfkesZSIFAGMEF6AqzsR2dQnmtfLjrj8kIDwcDyjZjrhslaHDLY7sPTqsMgqtDAHIF2cEaQ52UpPHyHARoyy8GXd7fdq31QCgKCquKjv0RC34Q0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=FPctQsuF; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="FPctQsuF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1746863891;
	bh=kftq25OgRn+R8pj3LPI+z7IFsfDRBzwEA5nhTmffpLs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FPctQsuF2cP0Y2uBS7Z+3vDaP592VwNqZo/rxicMFNj2jfjQ3TIWa3vxSRwWX+MQM
	 OZdS7hywOyIlfx4g5FVtB6cWoExBFItpNozHjy9wNOmxNjRHB8RtJRvYJMW4Feb0to
	 n5PpfhMylUQuiygTAVtJ3wdbzOKEZoBtgJdZTzXQ=
Date: Sat, 10 May 2025 09:58:10 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Sung-Chi Li <lschyi@chromium.org>
Cc: Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Jean Delvare <jdelvare@suse.com>, 
	Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 3/3] hwmon: (cros_ec) register fans into thermal
 framework cooling devices
Message-ID: <ad81f125-90e1-4033-8037-10be83088b12@t-8ch.de>
References: <20250502-cros_ec_fan-v2-0-4d588504a01f@chromium.org>
 <20250502-cros_ec_fan-v2-3-4d588504a01f@chromium.org>
 <b2432c5c-2589-4cfe-821f-47e5128af2d0@t-8ch.de>
 <aBl4wcX889otz_ms@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aBl4wcX889otz_ms@google.com>

On 2025-05-06 10:49:37+0800, Sung-Chi Li wrote:
> On Sat, May 03, 2025 at 09:27:18AM +0200, Thomas Weißschuh wrote:
> > On 2025-05-02 13:34:47+0800, Sung-Chi Li via B4 Relay wrote:
> > > From: Sung-Chi Li <lschyi@chromium.org>

<snip>

> > > diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
> > > index c5e42e2a03a0c8c68d3f8afbb2bb45b93a58b955..abfcf44fb7505189124e78c651b0eb1e0533b4e8 100644
> > > --- a/drivers/hwmon/cros_ec_hwmon.c
> > > +++ b/drivers/hwmon/cros_ec_hwmon.c
> > > @@ -13,6 +13,7 @@
> > >  #include <linux/platform_device.h>
> > >  #include <linux/platform_data/cros_ec_commands.h>
> > >  #include <linux/platform_data/cros_ec_proto.h>
> > > +#include <linux/thermal.h>
> > 
> > Needs a dependency on CONFIG_THERMAL.
> > 
> 
> I think adding the `if (!IS_ENABLED(CONFIG_THERMAL))` you suggested is
> sufficient, and turning on or off CONFIG_THERMAL both can compile, so I'll only
> add the guarding statement in the `cros_ec_hwmon_register_fan_cooling_devices`.

Agreed.

> > > +
> > > +	if (!priv->fan_control_supported)
> > > +		return;
> > > +
> > > +	for (i = 0; i < EC_FAN_SPEED_ENTRIES; i++) {
> > > +		if (!(priv->usable_fans & BIT(i)))
> > > +			continue;
> > > +
> > > +		cpriv = devm_kzalloc(dev, sizeof(*cpriv), GFP_KERNEL);
> > > +		if (!cpriv)
> > > +			return;
> > > +
> > > +		cpriv->hwmon_priv = priv;
> > > +		cpriv->index = i;
> > > +		devm_thermal_of_cooling_device_register(
> > > +			dev, NULL, devm_kasprintf(dev, GFP_KERNEL, "cros-ec-fan%zu", i), cpriv,
> > 
> > What happens for multiple/chained ECs? If both provide sensors the
> > thermal device names will collide.
> > 
> 
> How about changing the "cros-ec-fan%zu" to "%s-fan%zu", which prefixes the
> `dev_name()`? Here is an example from a device: cros-ec-hwmon.12.auto-fan0.

Sounds good in general.
It should match what a potential future HWMON_C_REGISTER_TCD would do.
Which in turn should mirror HWMON_C_REGISTER_TZ, if that has a specific
naming scheme.

> > Error handling for devm_kasprintf() is missing.
> > 
> 
> Thank you for catching this, I will skip registering that device if the
> devm_kasprintf() fails.

This should also mirror what HWMON_C_REGISTER_TZ is doing on errors.
If I read the code correctly, probing is aborted there.

> 
> > > +			&cros_ec_thermal_cooling_ops);
> > 
> > Error handling for devm_thermal_of_cooling_device_register() is missing.
> > 
> 
> I think we should continue registering other fans, so maybe we add a warning
> here if the registration fails?

Same as above.

<snip>
