Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7FDC287511;
	Wed, 18 Jun 2025 10:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750243217; cv=none; b=E4655D7N1lvVZZPSpVYgr49vqorDEuYYHE4dENJt88IaZHzgLTXTFXqBfs37nTDy9KR1OgyiBYwmmtf6/A7bCzDRl83M4ysyqth/HM7Dri1okBjYJq8eVq1GAGLyGDbLJzHZ8BpcMNh1yAClIi+LrnwgMYvm3vN375lgqKQ3cBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750243217; c=relaxed/simple;
	bh=51wCRu03wox33FTIXViaidWRudb0sMds0JcAe+JfauA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UNu8vURWnBW8zCwYMUxI+rE+eAQ+1MF1KYddFGy8cQ18zqPhFncyG3qCf8XTMOo6x8soqIrF9wgd74TN/IG3fX5K3OliIdA2UdHwKfis1b9yp8tjSPou4Tqm4XLGL5ItiqlhbMhlzX4L/l9rPaRIHkStvAHwL1pho/hNs75XwiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=SKYkjvFa; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="SKYkjvFa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1750243204;
	bh=51wCRu03wox33FTIXViaidWRudb0sMds0JcAe+JfauA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SKYkjvFabhz5v3eotyH+VR33rDo8Vn6qp1HQO9AA9JrLi0WHj7nvZDXYrgE6LXftK
	 70KV5PoR5LINvJhOmMhRHxHEUqmMaYG/xizWBNR2bpgRdf862Z2Wi5ekUOCPGeBEbP
	 BHnSv0SLZTUYqb3DZBCF37EAevVXAwhzLjwp73ko=
Date: Wed, 18 Jun 2025 12:40:04 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Sung-Chi Li <lschyi@chromium.org>
Cc: Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Jean Delvare <jdelvare@suse.com>, 
	Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 2/3] hwmon: (cros_ec) add PWM control over fans
Message-ID: <179a21f9-c578-46e9-89dd-1b9e32889015@t-8ch.de>
References: <20250512-cros_ec_fan-v3-0-a9f2b255f0cd@chromium.org>
 <20250512-cros_ec_fan-v3-2-a9f2b255f0cd@chromium.org>
 <ca2c10be-3dc4-45e1-b7fc-f8db29a1b6a0@t-8ch.de>
 <aFJqLkkdI86V3fM9@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aFJqLkkdI86V3fM9@google.com>

On 2025-06-18 15:26:38+0800, Sung-Chi Li wrote:
> On Mon, May 12, 2025 at 09:30:39AM +0200, Thomas Weißschuh wrote:
> 
> Sorry for the late reply, I missed mails for this series.
> 
> > On 2025-05-12 15:11:56+0800, Sung-Chi Li via B4 Relay wrote:
> > > From: Sung-Chi Li <lschyi@chromium.org>
> > >  static int cros_ec_hwmon_read_temp(struct cros_ec_device *cros_ec, u8 index, u8 *temp)
> > >  {
> > >  	unsigned int offset;
> > > @@ -73,7 +117,9 @@ static long cros_ec_hwmon_temp_to_millicelsius(u8 temp)
> > >  static int cros_ec_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
> > >  			      u32 attr, int channel, long *val)
> > >  {
> > > +	u8 control_method;
> > >  	struct cros_ec_hwmon_priv *priv = dev_get_drvdata(dev);
> > > +	u8 pwm_value;
> > >  	int ret = -EOPNOTSUPP;
> > >  	u16 speed;
> > >  	u8 temp;
> > 
> > Ordering again.
> > 
> > This should be:
> > 
> > struct cros_ec_hwmon_priv *priv = dev_get_drvdata(dev);
> > int ret = -EOPNOTSUPP;
> > u8 control_method;
> > u8 pwm_value;
> > u16 speed;
> > u8 temp;
> > 
> > or:
> > 
> > struct cros_ec_hwmon_priv *priv = dev_get_drvdata(dev);
> > u8 control_method, pwm_value, temp;
> > int ret = -EOPNOTSUPP;
> > u16 speed;
> > 
> > <snip>
> > 
> 
> Would you mind to share the sorting logic, so I do not bother you with checking
> these styling issue? Initially, I thought the sorting is based on the variable
> name, but after seeing your example (which I am appreciated), I am not sure how
> the sorting works. Is it sorted along with the variable types (
> "u8 control_method", "u16 speed", etc)? If that is the case, why "u16 speed" is
> in the middle of the u8 group variables?

Welp, I really should have explained this, instead of assuming it to be
obvious, sorry. The sorting is based on the length of the line, AKA
the "reverse christmas tree".

While this is not a strict rule, the driver is already using it, so I'd
like to stick to it. "Bonus points" for preserving preserving
semantically useful ordering within the line-length based one.

> > > +static inline bool is_cros_ec_cmd_fulfilled(struct cros_ec_device *cros_ec,
> > > +					    u16 cmd, u8 version)
> > 
> > "fulfilled" -> "available" or "present"
> > 
> > > +{
> > > +	int ret;
> > > +
> > > +	ret = cros_ec_get_cmd_versions(cros_ec, cmd);
> > > +	return ret >= 0 && (ret & EC_VER_MASK(version));
> > > +}
> > > +
> > > +static bool cros_ec_hwmon_probe_fan_control_supported(struct cros_ec_device *cros_ec)
> > > +{
> > > +	if (!IS_ENABLED(CONFIG_PM))
> > > +		return false;
> > 
> > Why? This should generally work fine without CONFIG_PM.
> > Only the suspend/resume callbacks are unnecessary in that case.
> > 
> 
> I treat fan control should include restoring the fan setting after resume, so
> I think if no CONFIG_PM, the fan control is not complete. I am good with
> removing this check, and if you have any thoughts after this explanation, please
> share with me, otherwise I will remove it in the next series.

As far as I understand, with CONFIG_PM=n the kernel won't be able to do
any suspend/resume. So cros_ec_hwmon won't need to handle the
suspend/resume case. However even then the regular UAPI for fan duty
management is useful for users.


Thomas
