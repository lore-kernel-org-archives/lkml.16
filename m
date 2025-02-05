Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9478B67F;
	Wed,  5 Feb 2025 12:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738758625; cv=none; b=BVzVxjPFgtL4EDksXwOnq9+0X8U3uOzEzWX/otBb5XQSHSmTGIUrKH4se/CBx3fKL+8WC9nzoZmW78hHA88nkwiKmDXMiBW5V9fOMYz7z53Av4W3FOuDDBisTrt3qo6nDvXSMviSsei2At9iHUFHcsZYw6OR27Lf4ZtcYDkYkFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738758625; c=relaxed/simple;
	bh=mCjWIdJqwk2lQi47nbBZc9EXpDi08Psv7W0YrNqCxeY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i0M7TyfELnGJlnnRREJ2sm9vhT4uGWMVrB2Xi+yIUit5K6b7UJyYuCZUg8VJZQKIO/qsaEUdqvmbw6vUYtMvpay51sxGLguHzcQSWAjhy8Rqvof3efjpbo4fYSNPImt82xpSQxaSjdTi5ywVMnuD+gSSwdcjwWDB19urvTkh13E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sty5wfFx; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sty5wfFx"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7be8f28172dso345402085a.3;
        Wed, 05 Feb 2025 04:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738758622; x=1739363422; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mK8nmwdmhbmc1ayKJlNj2WSUqxN/1Xx63MHppM5uQLY=;
        b=Sty5wfFxgR4rGpLJymu8VO3MC2dMnJ+eQm6R2kuO6AtGXPJTmZkZoV+jeM0b+WoMfk
         R0+lDpeoEEcPlPEg78d8MTukKBrOecWFhM6SQToC1G/ARfAq3FFExifaUYMRpaxLQg2T
         iCIO9rzIypSXwpc5Rzt0wurcyFLGHI3olmAojwg+V7GBSCUAoIXd2hHjH8j0IKrgmq7z
         yo+5+2fRZSDia7zHBorIH2oytQT0DFO+sjvHV//gpebVz73l+nW3FnabT9Fh5QoBefDn
         J4LMI++oWKQRG4T3y1+fCvwLVDUNDjoUUTC90qGyyVAaQEb39CRzan01kbtfh6PbT0nG
         J1SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738758622; x=1739363422;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mK8nmwdmhbmc1ayKJlNj2WSUqxN/1Xx63MHppM5uQLY=;
        b=hHJgBOtrN1pPqtbX9NRZ0I2XjyrEaLQDVECG/yewX6OrPOwDld2ZyqcOLcJ1Ain0g1
         bfhwbmAKD9MlUqE1pMESZvjJnyToPDRvwNDYD2/vzlpvS2VPI00s0DEDWa0mouDKXXo4
         5WO9N7Q+ti0zwWbR5s6dcoiBLvlqJMlQ4bELHTyYW1LJBNV+3+NnMwZ1Xi5jZmjkPfC5
         8ARB2y8GMTViDiqn9X+VpnTKoAfjRroUKM0M771DApwYM+8+9wZSsBRx2eWTjYqBvs/b
         RyL2K8o+MOMzh8zXplDQ7pKxsBMViMKFLHyROGAphPYr/dbZ9NcQvC2hnLjaBFK8Tz+T
         H8kQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaKh+61wlZ3RhtPID51FdGpxBWaBBV7fyOopwseJgqwW59c57pQOPQXbx9nvUd/MU77CcsfuftdoB9/g==@vger.kernel.org, AJvYcCXWCqxaJshgh5Uz6Wh/ukqLzZLxEgGuQcDPwFxoag4RPf0nsE3GG9c1E2KIEzrpPNcFdL73xhJ2oBWObhdu@vger.kernel.org
X-Gm-Message-State: AOJu0Yxbd/Ta1Iw0udCPZBUPvV9h294Jtgk81E83ywG47mzlrMZzHyYA
	YQ4UyogFN8KAwKYPr6S0t8kix+ZWoDZWUKcmC6eds5fHx01hqFuI
X-Gm-Gg: ASbGncuSZW73RTyiNraYh2QXv4OcDwfxg0+KvJXt5azornBzL640W+Z1IrUz9La2jxn
	Wic4ht6lZJWZI+L9sw5Z0d26Rcd26lSAR84Sr5wJLPhEmHi9GglKXjXR3ImVgUGzFDYe6NfeX9f
	eHRH5MD8DltaKIW5xXPP4DM1rs/wEb9RRGFcKUAFK8xC4RtivuLR2rJE+kKAFxm84R7Y0bb/Bbj
	lXSLIKswH4cqWhH9OrtZ0GccHOaVemMLz0kZaE7dmRyiA095/CZXqLDCmYdUV7fEPA=
X-Google-Smtp-Source: AGHT+IEk6eLmHw43EbSWAFyU4BJH8ghdVFOWWaZUgvM/Hy/8fIVc2j6UFwztQHthI+euaXaF3SUZzA==
X-Received: by 2002:ad4:5ca1:0:b0:6d8:850a:4d77 with SMTP id 6a1803df08f44-6e42fb6b15dmr48151266d6.7.1738758622414;
        Wed, 05 Feb 2025 04:30:22 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e254814d0csm73397806d6.43.2025.02.05.04.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 04:30:22 -0800 (PST)
Date: Wed, 5 Feb 2025 20:28:56 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>, Jean Delvare <jdelvare@suse.com>, 
	Guenter Roeck <linux@roeck-us.net>, Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Arnd Bergmann <arnd@arndb.de>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, Inochi Amaoto <inochiama@outlook.com>, 
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: sg2042: add back module description/author tags
Message-ID: <kdvu3xjreyycftkbsomqzc3e3y6mkom5u25co5rqwqem4n7p47@xnmhg7mkxsmw>
References: <20250205121419.373464-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205121419.373464-1-arnd@kernel.org>

On Wed, Feb 05, 2025 at 01:14:08PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> A previous code reorganization inadvertently dropped the two tags,
> which leads to a "make W=1" warning:
> 
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hwmon/sg2042-mcu.o
> 
> Add these back.
> 
> Fixes: cd4db38c4368 ("hwmon: (sg2042) Use per-client debugfs entry")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Inochi Amaoto <inochiama@gmail.com>

> ---
>  drivers/hwmon/sg2042-mcu.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/hwmon/sg2042-mcu.c b/drivers/hwmon/sg2042-mcu.c
> index 74c35945d169..105131c4acf7 100644
> --- a/drivers/hwmon/sg2042-mcu.c
> +++ b/drivers/hwmon/sg2042-mcu.c
> @@ -355,4 +355,6 @@ static struct i2c_driver sg2042_mcu_driver = {
>  };
>  module_i2c_driver(sg2042_mcu_driver);
>  
> +MODULE_AUTHOR("Inochi Amaoto <inochiama@outlook.com>");
> +MODULE_DESCRIPTION("MCU I2C driver for SG2042 soc platform");
>  MODULE_LICENSE("GPL");
> -- 
> 2.39.5
> 
