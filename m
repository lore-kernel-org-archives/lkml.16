Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCEB820DF4
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 09:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748857533; cv=none; b=ksZCyIomTY07fejJzO51y34mbnRhFSlAVoIMXn8dRnrZ/SwLyl//zPDGRbVGbyjXnSTI6cKIRK8dC9UZfJJeO3RMoGDWOh4owdoYVizu34Qx3tnksZF+iDnjxjfwrYmC8zvI1C811jqlujcMctMq6mbh3AxAE+xuicsX6LR5tvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748857533; c=relaxed/simple;
	bh=Nn+ovUN+eo2RAdkKZosYkpGwR94TOa708SfgIOsgDbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EFoJakXsUHvrOJmIO78zg3gRf4AFOhwpRpLtTwx/LsMSRUz1/fG+VSsPaORtff2L7HJPk4iHhOmtSpDCLZpXV9aR5Tn84fGPD1/1aaiUOb/TF5nyq8uD8MYdOYAAE+HqlRf1RdxeUGgAr8svxZK/Qu5In7190IalU8heGuVK+jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i1vYtOdE; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i1vYtOdE"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a4ef2c2ef3so3368763f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 02:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748857530; x=1749462330; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xbKU9W5xheDX9GZKVqgHJ+55CDve1/9ll10Ovwv/o7A=;
        b=i1vYtOdEZmAEXSy1DxBkRf8BLFvbQyxa91vzcAUpVl77qrELZtkJBqH2BIV36fafsX
         MwtpgsDaBIAX0hSiK1RkVTnwiLlc3APsc2lg/VHLH8l1mPcc2MobfOEQ26J7ieQvIDHD
         gGMGV68CaL2a0DTyMNmy6ou2ogLrEszit7ucY6hAOHaBMhTLI2mDGhLUfEx17u1wBdg/
         EqkwevOwQ382bz++1TRAcv48RffpdJ4+fJ2BrZ4D8F6cp8T/TgWxRTRHaLUUZ8T1Bs5F
         R7TyPy5SnPnnfEgIIUYQjPqVse3oMQIykAhZT7ucEO5E3GR36JFFtOJR2UhgpfaZgAw8
         xLkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748857530; x=1749462330;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xbKU9W5xheDX9GZKVqgHJ+55CDve1/9ll10Ovwv/o7A=;
        b=ZP1cMs6qEYNyEC5cLHm1AswLyhdrj1ax7y7a1+ap5J145cIY/w5s6Xw6oX21Iao481
         ncAMyODkW4jupox+qWQYfLcSrIN6dgq330TrBh7X1dAnEswqkl0IbKKbtkg5jbxSYY9+
         7mgbrpELeX3PlhzFpGAxjLp94aC/c2ycTIMm3QNg40mvmiEuOf+DRsgKkz9SSUwpnPc3
         N2GuSEwOWbOWS+AGQnf1bPTr9weRUtWTc4W7h2xPkQqDNIdPvkbFO7XIylz2gBGOLwRB
         8kpaFdcCM/WF3zRDsMDhObnM0ZWF69/ocMwUd7K0Qfx8HPrp44+PzD10KHwCKMVuVSaj
         P8yA==
X-Forwarded-Encrypted: i=1; AJvYcCVvewtlodo1plzh+mWIyjQqeXX2pwqRdmNb5y1M95tUTdVPCktntXYZpeYC4nfhz299yqF4PNoKWpmLB7E=@vger.kernel.org
X-Gm-Message-State: AOJu0YybO7+Kxc5M5aZ3tY0izUP4N9LbeYa9yrE5a715jqyHDX7sG9e4
	Wchqhdqkxyb47TmkkUIXI7CXg04JWdHL6xXKL40ORBkUmqyT3FJApAwS1rdTAHVLeCL3XeJOpD8
	Rq5Wx
X-Gm-Gg: ASbGncuHnrjTWeXEp97GB/rAJxV5J/o1WcreeJvjKeze4PKGfGf27ANRO9VnbgU/26v
	l83mpexjamq4ryBMuO+7txr+Zd5J7zUjclcLpVRHIWnn6hbnuNqsBOIZGvuoO9yX3rdSK0HQQOk
	KD6cmEjiLcGMxMC3CYeyyzn9yyLZlLUeDAoPglYs7qKUR8aPPrdraJT56KnakipDxTkKzVrVnx2
	B9p13hMh9MzObCuYLKquS0RwQbbpHuOqhbPH/AqtHUCeZCNpS26C2LLgXR368cCz53dmsEMt7xt
	zcI3A49q254SWJKElZJHelDGBWtfAthZtqzw8Gt1ZpSGVR60jQ8u/kg=
X-Google-Smtp-Source: AGHT+IHPnVtWrDel++vKl3QQEDHSr/37CxtTyJhCw23iebOkRyXNSgDsVfvNb1+gbFuTQxbT8lg0KQ==
X-Received: by 2002:a05:6000:25c4:b0:3a3:648d:aa84 with SMTP id ffacd0b85a97d-3a4fe154c68mr6288485f8f.5.1748857529926;
        Mon, 02 Jun 2025 02:45:29 -0700 (PDT)
Received: from localhost ([41.210.143.146])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-450d7fc1a84sm117403015e9.35.2025.06.02.02.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 02:45:29 -0700 (PDT)
Date: Mon, 2 Jun 2025 12:45:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Raju Rangoju <Raju.Rangoju@amd.com>
Cc: broonie@kernel.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, miquel.raynal@bootlin.com,
	Krishnamoorthi M <krishnamoorthi.m@amd.com>,
	Akshata MukundShetty <akshata.mukundshetty@amd.com>, cve@kernel.org,
	Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Subject: Re: [PATCH] spi: spi-mem: Add fix to avoid divide error
Message-ID: <aD1ytV8kiWP9ssuv@stanley.mountain>
References: <20250424121333.417372-1-Raju.Rangoju@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424121333.417372-1-Raju.Rangoju@amd.com>

On Thu, Apr 24, 2025 at 05:43:33PM +0530, Raju Rangoju wrote:
> 
> Fixes: 226d6cb3cb79 ("spi: spi-mem: Estimate the time taken by operations")
> Suggested-by: Krishnamoorthi M <krishnamoorthi.m@amd.com>
> Co-developed-by: Akshata MukundShetty <akshata.mukundshetty@amd.com>
> Signed-off-by: Akshata MukundShetty <akshata.mukundshetty@amd.com>
> Signed-off-by: Raju Rangoju <Raju.Rangoju@amd.com>
> ---
>  drivers/spi/spi-mem.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
> index a31a1db07aa4..5db0639d3b01 100644
> --- a/drivers/spi/spi-mem.c
> +++ b/drivers/spi/spi-mem.c
> @@ -596,7 +596,11 @@ u64 spi_mem_calc_op_duration(struct spi_mem_op *op)
>  	ns_per_cycles = 1000000000 / op->max_freq;
>  	ncycles += ((op->cmd.nbytes * 8) / op->cmd.buswidth) / (op->cmd.dtr ? 2 : 1);
>  	ncycles += ((op->addr.nbytes * 8) / op->addr.buswidth) / (op->addr.dtr ? 2 : 1);
> -	ncycles += ((op->dummy.nbytes * 8) / op->dummy.buswidth) / (op->dummy.dtr ? 2 : 1);
> +
> +	/* Dummy bytes are optional for some SPI flash memory operations */
> +	if (op->dummy.nbytes)
> +		ncycles += ((op->dummy.nbytes * 8) / op->dummy.buswidth) / (op->dummy.dtr ? 2 : 1);
> +

Hi,

We were reviewing "CVE-2025-37896: spi: spi-mem: Add fix to avoid divide
error" which was issued for this patch, but this patch is a no-op.

If op->dummy.nbytes is zero then the original code does:

	ncycles += 0;

We don't divide by op->dummy.nbytes.  Was something else intended?

regards,
dan carpenter

>  	ncycles += ((op->data.nbytes * 8) / op->data.buswidth) / (op->data.dtr ? 2 : 1);
>  
>  	return ncycles * ns_per_cycles;
> -- 
> 2.34.1
> 
