Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8AA7261597
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 10:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745233014; cv=none; b=povOU8Eiv/V9lI9HBAsWnUd3EwVbpc0qt09hoj59CN6DpJtu8vIByEBksR+8seqspiSBqq1GsFfoL7Ek5MN0VUBayPoWNr+ow43yXK4R6O5wRGpxCEbJ0I82VpyDs8Z6WEcnXfsyQ3l0CrT/44TdkrwlUCK8HV3Z2e1Ix56ECx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745233014; c=relaxed/simple;
	bh=dFtUabfKRAAvW3M57Y2XYLhbkoWV/xW0t/A/tPJhfWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R4x/D6Flxadz8nJ4hTN2z2iCKrqdkge4jLmAN57t77zEctuLdn5mbPRkZMnPxFEo2WoQ9Uc4mqHTghuKeQlNaHNWyEwWuBS1rCewWFNr56XWAooaCgiA+LevKoYQcxBL8wkzstVTWk8TBbr6TE/3DqRSGl8Fp9ULxVvgk7taDS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YzCMSwCo; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YzCMSwCo"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-224100e9a5cso44406045ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 03:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745233012; x=1745837812; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4JOjjs/eTu6BI/Opf5A56OhMZjn4Z0iGykFeuQ+2ztA=;
        b=YzCMSwCocFe3W439FJIscVBnSPun2NsIOKjGKfmr+947evOncKJEi/dIqt0A6pVUqz
         ZNdFj4e2poSSnikA92L9xVTxKA7j7vgmbkIljIMKi6bQ2hjr5NbhbUWzIExRSLFCyuT4
         Ac6U9lJf9mtMoner4ERbvZCyLe6ryoPUyoLNM9YbRtZS9fbVGZVffiAItfIx+RR9DaR5
         AMr76ZI+Qzo3Fj9osVJWQSF7Dc4rSBnJ1VGC2lWpeGumXLLS57Nk0c+YXmSHC0xVse3H
         /xcsNPZcW0RhEIKqdHZcb7eVK6PGuPh71swhBrTuuc/K1YM3JkFtlib3nZ+WsHwykMNp
         2QzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745233012; x=1745837812;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4JOjjs/eTu6BI/Opf5A56OhMZjn4Z0iGykFeuQ+2ztA=;
        b=ehk9aY0ia18BFs0eifAm0S05FrDG4gmnT6s7Gfx7z9+E7EI/U7WSuUe7lffPSriMRS
         9M+Ph59M8MAYzOME9BjuyOijlFquUzYyaBcGwJBWDo0qIekzaBC9dDfLE4iSdINTlu/D
         +xsBvgvg4itAIdsA7vJiNxSI1fna3fEl3w0mvnnGpThU0m7R6tQt9Twz1UytzXvxCaQV
         g/be/py7cj1fRFq9p3LL+llYWggjAyFmTpHyBsDTQu+Z9hNB/xEdccFDyM6IeZ8aJSZx
         gFFvGdlbkJH+dkO4q2CND6Ec8Ah9rOIE0msSapXWBEuRDETtnNSntx0NWkN+cFqVIyyo
         /5lQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaH7AQGwEaDePRyTlDduZeoAQOaeklARwnvAyDNYSB4nnFnBEZSr3PfSPzbj4VuxiaG98RuND/J6OXzvM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8vFR3bDky2iCIpoU2tBlqrg0hkKAlZHfr9UC86pUBy01xEDdt
	xHidIVkkCVpZqD+CndrSUrGXoBhRsaU/t2TeMceqBr+V4yPuPpAmgidihCDQ44A=
X-Gm-Gg: ASbGncsGoYVc69iGSKKVx4KueVQavz4XlZh/CuJtqIi3j6D+0BpBg7vKfECCzCeFJTX
	vLNAvAyIKmzdM1a9sPv4/8e1urRKRa/EtKwsX/HYLhLUTY38uXmVmfw8ioF82PGVKjqLptoVg8x
	QJ/8IK91d676YlXZPo20k1JYZrGASqArAkfbdMHCfXcW/sbjnZ88/F+IOy5WS+OMd9BovAgmdKH
	LqIHvyS+VAWBjiDZqstYIplMCbKmMeFatwnWDvAh4/BYOKK6DlLIToYTAkz/BkGsc57zI2N9qmH
	NXHMpnAW1xiURmI8eJvlYPhIbGW9Ao34AsDQOXt/gw==
X-Google-Smtp-Source: AGHT+IEEJ39NGYkYIENofGn5suL4OvuuiPwgjONjMHmL2nMj73P7QiaKLxsJqccgMDffLqh52LWmCg==
X-Received: by 2002:a17:902:f788:b0:223:4816:3e9e with SMTP id d9443c01a7336-22c5357ecfamr153311135ad.13.1745233012094;
        Mon, 21 Apr 2025 03:56:52 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50bda75asm62750465ad.18.2025.04.21.03.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 03:56:51 -0700 (PDT)
Date: Mon, 21 Apr 2025 16:26:49 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: webgeek1234@gmail.com
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 1/2] cpufreq: tegra124: Remove use of disable_cpufreq
Message-ID: <20250421105649.g4xpkimbu6q77fxq@vireshk-i7>
References: <20250421-tegra124-cpufreq-v2-0-2f148cefa418@gmail.com>
 <20250421-tegra124-cpufreq-v2-1-2f148cefa418@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421-tegra124-cpufreq-v2-1-2f148cefa418@gmail.com>

On 21-04-25, 03:13, Aaron Kling via B4 Relay wrote:
> From: Aaron Kling <webgeek1234@gmail.com>
> 
> Instead, unregister the cpufreq device for this fatal fail case.
> 
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>  drivers/cpufreq/tegra124-cpufreq.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/cpufreq/tegra124-cpufreq.c b/drivers/cpufreq/tegra124-cpufreq.c
> index 514146d98bca2d8aa59980a14dff3487cd8045f6..dc83b1631b13ec428f3b6bbea89462448a62adb4 100644
> --- a/drivers/cpufreq/tegra124-cpufreq.c
> +++ b/drivers/cpufreq/tegra124-cpufreq.c
> @@ -168,7 +168,8 @@ static int __maybe_unused tegra124_cpufreq_resume(struct device *dev)
>  disable_dfll:
>  	clk_disable_unprepare(priv->dfll_clk);
>  disable_cpufreq:
> -	disable_cpufreq();
> +	if (!IS_ERR(priv->cpufreq_dt_pdev))
> +		platform_device_unregister(priv->cpufreq_dt_pdev);

What if someone tries to remove the module after this ? Won't we try
this again ? Shouldn't we set the cpufreq_dt_pdev to some sort of
error to skip doing that ?

-- 
viresh
