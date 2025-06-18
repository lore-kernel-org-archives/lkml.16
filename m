Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439BF1E25F8
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 07:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750231605; cv=none; b=jLdk9ytxTMJWFuo14kYlkRHvcO3tfn7MegFdBR3XDE0379ZiPo/dFAuk4iyVE9KlxoAy1/0mWOfGi8ZJQnr/fwUuPuRfKJWcCHvi5WSzDC/S+YPRNAx7+8FcHMANtmYAE5VdyHKF6izLAr2VZj73th+ctOwdZJtVtPTEFbFFa9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750231605; c=relaxed/simple;
	bh=+KzNV4oOOMx38wmOYSChoYo8E3X2rejrMJIv37ZNqsk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R+wHdZXcjZyI4EZTuRvlK525jEOxFz+m9M2UAxg7Tj+DwYMDpQUDc567M8xHKaSoVCvpofsb5CY8zdlch+NS846h+7kOAJswzmVu4e3uJlQXQ0ychWwHYR6pWER5YVsIcGiJBST08q1oBgiay4r5dLqjOCcJUKefTlpakWXSRk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GDAIoRop; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GDAIoRop"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3134c67a173so7738933a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 00:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750231602; x=1750836402; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hM1UhMnYVhQUG4NEkfTsgeOJp+Ekml0puj+o8yaatbQ=;
        b=GDAIoRopxPuU4liapuSYuXmAxZFhE+u/eQR9Kcpbz64AFGCXJFrYJoH4IWI8mOEw4X
         0px/HVqYJ3ZgIaGOXm9rkOp5oR3SFArAKvE9IYo4zT4P3I6BwM8FwGw43TmS/PRKtQWA
         OzE+0jB2KLmI+ZDDNS8Kf5H0mYlXuD5FCq9G4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750231602; x=1750836402;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hM1UhMnYVhQUG4NEkfTsgeOJp+Ekml0puj+o8yaatbQ=;
        b=we9TSOc2Na3SURwrNLECPfJBozF2+HssyFJzdhSE8gNwLOnJI0oTGGxxUUuKcetb9c
         3QxGBOMyIfgeewlngdQcaIQn2wn06qMWRlSNC0lmv4wiKEF3GbYi6OCyFYKcde7iAqPn
         UmUF/ZDpkD3VSOYQhcPgugMTlLwunzL7hN4AmUSgpf05rskLXlqX/cRrMGQKUVWphuVz
         CuZ3CxYS0OsCBRQ2DlY8a6eIOHzaL9sLOtKEgtoAP6ekngb+SdqvL+X1vhN91WVYOl6z
         SAXum2YI+q6B+S18WY7OyvjNlLSeAfJ0dA0qgNo/Epy15iPNLgU/vGeRKRIAevQnDEtx
         Qs/w==
X-Forwarded-Encrypted: i=1; AJvYcCWhaHqIdtpBfeBXEucLxEeyv8ZAYpeLvwvR8pQnWfOdkwNyR96vcEsU78Wsh2gYoAUZg5ZvRygSvBTirJk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqzWpXg5xTAZMZ23iHPr8DoJPw5z9UDn2hvq1l/SO/du13264B
	WghSQFYFiu7u+VC27hc271EnCJM5V6r79CSnZhlifgvjRRhEXxmsLpZguiyHcqbi3g==
X-Gm-Gg: ASbGncuDDQDFjduRD/RqEKsxb9dvWF8yoUW0DiQFYzy/f3yb4lpzz6G/HijmOjlSjlQ
	BIG18RkD+/5ccsKLPPs5eY13Ylx635JV0HbDb0lDnnVmOdYV4lIJQe+UpOAA/2/KU0LB6AnFiAR
	CJLrjNGuyPV/6tG09PLxEmwuaQSYXdFoJWgLFFUU55Z8lzqM3i287G3oOAqBylWALr3e+0mC7HA
	Rl1bPTWmg+/bDArM1pKmWyPCIqQOAI/ehNRfzv7KoKkrptqPhCHHZavnkvI5o/nN9jdlWhMCV2H
	ZclNqTRb68+gL/Ofn7a2Gf+/WRPNulIjdHwzW0mLHqDcu/2SRXMQ0HbA/2RrihLUCUs=
X-Google-Smtp-Source: AGHT+IGmlF2R53aG5doFh6Ww/jme75FfKP3jQE6NmFAaZ7BCSPsq9zGRmtfVZXCsvQQaCwhcGykC3g==
X-Received: by 2002:a17:90b:38c5:b0:311:da03:3437 with SMTP id 98e67ed59e1d1-313f1d05d1bmr23596610a91.27.1750231602456;
        Wed, 18 Jun 2025 00:26:42 -0700 (PDT)
Received: from google.com ([2401:fa00:1:10:50f9:5771:52a9:eef9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2369ebca745sm13850295ad.100.2025.06.18.00.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 00:26:42 -0700 (PDT)
Date: Wed, 18 Jun 2025 15:26:38 +0800
From: Sung-Chi Li <lschyi@chromium.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 2/3] hwmon: (cros_ec) add PWM control over fans
Message-ID: <aFJqLkkdI86V3fM9@google.com>
References: <20250512-cros_ec_fan-v3-0-a9f2b255f0cd@chromium.org>
 <20250512-cros_ec_fan-v3-2-a9f2b255f0cd@chromium.org>
 <ca2c10be-3dc4-45e1-b7fc-f8db29a1b6a0@t-8ch.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ca2c10be-3dc4-45e1-b7fc-f8db29a1b6a0@t-8ch.de>

On Mon, May 12, 2025 at 09:30:39AM +0200, Thomas Weißschuh wrote:

Sorry for the late reply, I missed mails for this series.

> On 2025-05-12 15:11:56+0800, Sung-Chi Li via B4 Relay wrote:
> > From: Sung-Chi Li <lschyi@chromium.org>
> >  static int cros_ec_hwmon_read_temp(struct cros_ec_device *cros_ec, u8 index, u8 *temp)
> >  {
> >  	unsigned int offset;
> > @@ -73,7 +117,9 @@ static long cros_ec_hwmon_temp_to_millicelsius(u8 temp)
> >  static int cros_ec_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
> >  			      u32 attr, int channel, long *val)
> >  {
> > +	u8 control_method;
> >  	struct cros_ec_hwmon_priv *priv = dev_get_drvdata(dev);
> > +	u8 pwm_value;
> >  	int ret = -EOPNOTSUPP;
> >  	u16 speed;
> >  	u8 temp;
> 
> Ordering again.
> 
> This should be:
> 
> struct cros_ec_hwmon_priv *priv = dev_get_drvdata(dev);
> int ret = -EOPNOTSUPP;
> u8 control_method;
> u8 pwm_value;
> u16 speed;
> u8 temp;
> 
> or:
> 
> struct cros_ec_hwmon_priv *priv = dev_get_drvdata(dev);
> u8 control_method, pwm_value, temp;
> int ret = -EOPNOTSUPP;
> u16 speed;
> 
> <snip>
> 

Would you mind to share the sorting logic, so I do not bother you with checking
these styling issue? Initially, I thought the sorting is based on the variable
name, but after seeing your example (which I am appreciated), I am not sure how
the sorting works. Is it sorted along with the variable types (
"u8 control_method", "u16 speed", etc)? If that is the case, why "u16 speed" is
in the middle of the u8 group variables?

> > +static inline bool is_cros_ec_cmd_fulfilled(struct cros_ec_device *cros_ec,
> > +					    u16 cmd, u8 version)
> 
> "fulfilled" -> "available" or "present"
> 
> > +{
> > +	int ret;
> > +
> > +	ret = cros_ec_get_cmd_versions(cros_ec, cmd);
> > +	return ret >= 0 && (ret & EC_VER_MASK(version));
> > +}
> > +
> > +static bool cros_ec_hwmon_probe_fan_control_supported(struct cros_ec_device *cros_ec)
> > +{
> > +	if (!IS_ENABLED(CONFIG_PM))
> > +		return false;
> 
> Why? This should generally work fine without CONFIG_PM.
> Only the suspend/resume callbacks are unnecessary in that case.
> 

I treat fan control should include restoring the fan setting after resume, so
I think if no CONFIG_PM, the fan control is not complete. I am good with
removing this check, and if you have any thoughts after this explanation, please
share with me, otherwise I will remove it in the next series.

