Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E2F22A1D5
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 15:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747064314; cv=none; b=D9gmXODVzDyNQiv8hCsbemUGcuCWaR4bvqGeW8AG+RoWZtTof49w1qge1XKAzLojPi/+FDsN4jXUjYnKU0gLeuZcNIBdG+Irh0qLU9yRu39W7+1wqc5x0p7Ynog1tBJaOQnO0ami48ckSIZjv0jAv3/B/RHpznonZjWbYn4lul4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747064314; c=relaxed/simple;
	bh=c7VadYlSEsuqBTdIq8kkgiDUoIo6e9SXKJfB7bLi/gk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S6I11iQHVEQnl3gTOhGJ5SDR/3jtuv9NhG3YbhpyJcabCaEyeDPz9aGMQCBLtttOfhTlUAh8Kq1CcBs9aG2jE+uQ/oQk/bFjUk0x7/JFThpYdOExE1Aw9cs9TzTqi5A9V+cLgxKwMmVO3H1jOMb9IApxS3VvxD+ISSV24ZXcGco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=upJKcuaW; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="upJKcuaW"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-74251cb4a05so2840538b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 08:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747064311; x=1747669111; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GX/eBcEChE0E34AcneN6L6Wm+rbDwi9Vmr1xiNc+L8g=;
        b=upJKcuaWWxd/fKgm8lg/Bcs/bJzFa4ZAQ9s7jl1Jm2WuttuF4c7bqT4ECJsePjt4Vq
         Kf96FfWXwr+oFo9E7PJ2Hjv1oTMulJRRLMMe5Tu3VznzjBdwZwXTt8O4UKR01A5NV6uk
         6uPc8T4azaLbOtnqpckc2JNku6rMl5DHVtmlM7bAqVDdqluKLoxX5n/PbnH4nWzHmY5+
         e/brhNvrzW6ja5jLSA6do9+bxOoIDFZdMLsYs9HntwzztJuefPgYWtnZKkTma21KieB7
         5wQQ3UhffZ6FVQxh9KhRqECQc7ZcqFLitRw5DAddYV3SPnbeJXXcpQVh8wiY7o4HmTu2
         s94A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747064311; x=1747669111;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GX/eBcEChE0E34AcneN6L6Wm+rbDwi9Vmr1xiNc+L8g=;
        b=bPxMti4SwHEDLW9YQ4Si/AQt5hNMF+CzPCz62X88/yBKa25SbPwlQrW5jzPl58uYbL
         ua8RA26qLKZHGJ6+5G7mWyBVSPMo0t1I4qe7re0Cv7NPakP3e0m2wKDV3GUHNZbQcis9
         KY8U00aelph7Vn5vsO+U9sxhU84sfYY5h7FeyFdjEa8V4ukNDS8B4kpPvQxfO1IP+4xF
         /GG7KH85iUMkG0ZA/nWo3nsQcRAXhJW9SFFC8d/owOuj1MAQCLcEyLjbG2IqNMtiafkt
         ew++W2t2xqKk6pLKH13pTb4+mtXbSuP7R+525nG933SnG9MfjYXJsvVHHx0/0zDbw+yF
         gE7w==
X-Forwarded-Encrypted: i=1; AJvYcCU7Snf3qWeV757vFnBBRbWiqNaoUKgccAHdtsBfg4Ys2Duzwl3DLWOxDv1qBEcTDmy2dEfwP3UgM7chqMw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUeshTiD1GswCFAxibghbxwNX+6YbDIflKD1LctktzArsoDmQw
	Zm7RvbXGOVp8oxdvELg6M3nJGn28wNpa39dfqFIore7CGvm13GuFzJdwmIQpwbc=
X-Gm-Gg: ASbGncvBvRPcK/+Vc/9CR9NJ6eoJgLSrqET9BnSLc/ceydqTuz17dFCLBdPedaRWhWL
	O/6i3bLKp+rKh/vkaH9NTyUjcD1lo72oubzLrSx0CSlnOd/+v692GINB2gIdHupcfND8gEU8IIO
	1q6WT/d19hgMR6G+Qz2hcE9AnkQfeczeuj1BeiyUjSUYUedKM1NuxPS6Ef8IdnvzXSgA2xW6rm/
	ysll00YncVTEF8tCbQ+BhdasH3s+dIkBnszYoQlVgxETYfL7T6NX75WXITFOt/hYMp5dWguKCY2
	hYXXBv2mQSUibKBJwVp4g35kR3EyqOW1ePCVfePI6zTgpcNqVM4JEp8=
X-Google-Smtp-Source: AGHT+IHgmuXfm+4ff1pkZtxwN/V2i999rOI889ddQtZJPLCTUGcGf7+EJOjlZmWF+IGtP6CWuzsvRA==
X-Received: by 2002:a05:6a00:4148:b0:740:921a:3cb4 with SMTP id d2e1a72fcca58-7423bd57d80mr20337967b3a.13.1747064311520;
        Mon, 12 May 2025 08:38:31 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:3e0c:79f5:c193:3289])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a0cfc5sm6409040b3a.91.2025.05.12.08.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 08:38:31 -0700 (PDT)
Date: Mon, 12 May 2025 09:38:29 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] remoteproc: xlnx: avoid RPU force power down
Message-ID: <aCIV9UJkxZAdKPE-@p14s>
References: <20250506165944.1109534-1-tanmay.shah@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506165944.1109534-1-tanmay.shah@amd.com>

On Tue, May 06, 2025 at 09:59:44AM -0700, Tanmay Shah wrote:
> Powering off RPU using force_pwrdwn call results in system failure
> if there are multiple users of that RPU node. Better mechanism is to use
> request_node and release_node EEMI calls. With use of these EEMI calls,
> platform management controller will take-care of powering off RPU
> when there is no user.
> 
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> ---
> 
> Changes in v2:
>   - Add comment on why version check is needed before calling EEMI call
>     to fw.
> 
>  drivers/remoteproc/xlnx_r5_remoteproc.c | 34 ++++++++++++++++++++++++-
>  1 file changed, 33 insertions(+), 1 deletion(-)
> 

I have applied this patch.

Thanks,
Mathieu


> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> index 5aeedeaf3c41..1af89782e116 100644
> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> @@ -380,6 +380,18 @@ static int zynqmp_r5_rproc_start(struct rproc *rproc)
>  	dev_dbg(r5_core->dev, "RPU boot addr 0x%llx from %s.", rproc->bootaddr,
>  		bootmem == PM_RPU_BOOTMEM_HIVEC ? "OCM" : "TCM");
>  
> +	/* Request node before starting RPU core if new version of API is supported */
> +	if (zynqmp_pm_feature(PM_REQUEST_NODE) > 1) {
> +		ret = zynqmp_pm_request_node(r5_core->pm_domain_id,
> +					     ZYNQMP_PM_CAPABILITY_ACCESS, 0,
> +					     ZYNQMP_PM_REQUEST_ACK_BLOCKING);
> +		if (ret < 0) {
> +			dev_err(r5_core->dev, "failed to request 0x%x",
> +				r5_core->pm_domain_id);
> +			return ret;
> +		}
> +	}
> +
>  	ret = zynqmp_pm_request_wake(r5_core->pm_domain_id, 1,
>  				     bootmem, ZYNQMP_PM_REQUEST_ACK_NO);
>  	if (ret)
> @@ -401,10 +413,30 @@ static int zynqmp_r5_rproc_stop(struct rproc *rproc)
>  	struct zynqmp_r5_core *r5_core = rproc->priv;
>  	int ret;
>  
> +	/* Use release node API to stop core if new version of API is supported */
> +	if (zynqmp_pm_feature(PM_RELEASE_NODE) > 1) {
> +		ret = zynqmp_pm_release_node(r5_core->pm_domain_id);
> +		if (ret)
> +			dev_err(r5_core->dev, "failed to stop remoteproc RPU %d\n", ret);
> +		return ret;
> +	}
> +
> +	/*
> +	 * Check expected version of EEMI call before calling it. This avoids
> +	 * any error or warning prints from firmware as it is expected that fw
> +	 * doesn't support it.
> +	 */
> +	if (zynqmp_pm_feature(PM_FORCE_POWERDOWN) != 1) {
> +		dev_dbg(r5_core->dev, "EEMI interface %d ver 1 not supported\n",
> +			PM_FORCE_POWERDOWN);
> +		return -EOPNOTSUPP;
> +	}
> +
> +	/* maintain force pwr down for backward compatibility */
>  	ret = zynqmp_pm_force_pwrdwn(r5_core->pm_domain_id,
>  				     ZYNQMP_PM_REQUEST_ACK_BLOCKING);
>  	if (ret)
> -		dev_err(r5_core->dev, "failed to stop remoteproc RPU %d\n", ret);
> +		dev_err(r5_core->dev, "core force power down failed\n");
>  
>  	return ret;
>  }
> 
> base-commit: afc760ba751c289915fe10c12d836c31d23f6ddd
> -- 
> 2.34.1
> 
