Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947DF28FFF9
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 15:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745337557; cv=none; b=G5OSIJKRFQHz5fi5wQlZ2lC3heQT9brcPJFu0S7ZeChidBYWhQXQIyiIgfXKprl92uEPNRVu/5EflRV/eJzwyvTgFpTAFVFfhyE3U8CJbr+tVbGurC8Che3yNqLResToA37x7Kwx0YtXTIsUqSDIjb6t9oFejMuO/Ai4hHPBEVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745337557; c=relaxed/simple;
	bh=HQV8/s3MO8vLxFYXBVQ6piuZyGOJElN3s6SVibdonDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N7gmRt9Talx3+MCMwd8QlMk9TgbmvxXZ2ccEzDs1yXxUu48uWuYZbj/aV0sAmVTtghlLtuPJImS7MKdYf+oD9vwLTVJakJEIn0oI9OAql6GK39alm2MdY1PdNPb4j1c09JcM1fNCFayqxATYGyHY2zbZkDYPdE0ecVu1QFEkF64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k/Ofr8AG; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k/Ofr8AG"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-739525d4e12so4456862b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 08:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745337555; x=1745942355; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aecmyYU0mgfFbgzJIy5piTLE8wnsuVnJZHQ1a6G22Vc=;
        b=k/Ofr8AGBhY66d4pmlzRZeJVhs4/t8Vl/8mAReUbywOskHvhhwQz/VL5w6PCgNji5e
         4qtIbxtCZBlk/b9ymfwnWPx2TlYEJ2BLj6UVDKa6gaJOMgEvJXPAhSpb41RDymQ7Wrpk
         lTTTQK6yP1jxhy7zRDGTCHIkTVOGPkmu98NFS5m2YstNOEj1LNzDmkdR4AdyIvFKgeR4
         0RGdBXBiRtbits+UdPeU7G/phCWWN3Ix5FhCSFssaPyBIv4wiC42khqPZ4itS9hQNdQp
         2Kjftix2RKolRB0G6vOuD6BPBpfGNHJGhGXzz0sv/pGTXmVY98vxNLdPud+N7UvVDOUc
         pHOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745337555; x=1745942355;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aecmyYU0mgfFbgzJIy5piTLE8wnsuVnJZHQ1a6G22Vc=;
        b=IKfQLYyY1punv2qkg7+CiW1hYzOfKeSAVHmHraYExPZI3DCtyxf/UqgYiRGVmH6wCl
         XGO30EqJUnBQHnn8Cod2Pn0Ao/TBALyUnl6d6UaBPivv5hEuASIY+UUUpIceBsty7B7L
         LHsrgHqVL0kakbWgArRMxhL5m60Iu80LUUKrR/eCV94/jIGWfydx2QboW4s/YNoBoDVn
         nzaXanVeHS11JYA6TR7/bKOSHdYq1xTvfjesmsnd7YsXF7qpDCeD2fc/crEldV66t0ZU
         ZsJDsXZqX+O1rd9ftpBT/iYN10f5t8++NYFRa6EOzWnr/LN8DwN8X8aN6MsKMMO+tYo0
         q0RQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsy8GgMBnKza7jzSZyJcSMZLare6+wdSJgVF5VXn6Z0tEK+YRa3ZqETkuyIHxQhK3XKqflH6FdtEKxc64=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2Rikm+goXeniNQ++Z5oPQTf9JaDrhO1HZwyBMszRrDJ63dEfM
	PHeS+aLR7WoZ6lSRZCrFcGVb/pOZRaMRmfv8qCZKgtcToLpI7C83DC9L4rGJGQCKS6L4YEbYRyz
	v
X-Gm-Gg: ASbGncvRldIugEDOEhW1xzNDgYhNouA3YIj6mFEXu+qIzT5Iofb2QbIz5f2FVhnXHRw
	zRm2zsycGxWFPYFUC9PCDA6rVyh50roCPqfK4C7Rap3RdtyJUFRd+lc691cnz7YLJReiz+p+xAT
	KWTbDeOoUIf7crpCue6e4zCB1aV2+qOB6AFLcGYfTH5GXl8Ro3dhNuKfOuExPwY0MRQk4E66F5P
	bvCciW/sEmAnbZST10Pfaxx9j4oBIg1kwn+1owab0928QLqc4ECf0FWR/s4O9wI5vo/8qvkZkzi
	yToCbz4PejBiy+mlsZfeLWku9AGZg6u4NhvRaBCCgE/V
X-Google-Smtp-Source: AGHT+IHkfTtnEINHJek/OCHJcLUAIf7NrdLhcB1CQ7ZVxC+zdwuj46Sk1WSbEpMfzAxmSwwyNZWGtQ==
X-Received: by 2002:a05:6a00:1309:b0:736:3c6a:be02 with SMTP id d2e1a72fcca58-73dc14d0d88mr21162039b3a.11.1745337554820;
        Tue, 22 Apr 2025 08:59:14 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:2e83:e5cb:87bf:4641])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfaace0dsm8804916b3a.126.2025.04.22.08.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 08:59:14 -0700 (PDT)
Date: Tue, 22 Apr 2025 09:59:12 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: xlnx: avoid RPU force power down
Message-ID: <aAe80OlwWENHI2I9@p14s>
References: <20250414184600.1166727-1-tanmay.shah@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414184600.1166727-1-tanmay.shah@amd.com>

Good morning,

On Mon, Apr 14, 2025 at 11:46:01AM -0700, Tanmay Shah wrote:
> Powering off RPU using force_pwrdwn call results in system failure
> if there are multiple users of that RPU node. Better mechanism is to use
> request_node and release_node EEMI calls. With use of these EEMI calls,
> platform management controller will take-care of powering off RPU
> when there is no user.
> 
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> ---
>  drivers/remoteproc/xlnx_r5_remoteproc.c | 29 ++++++++++++++++++++++++-
>  1 file changed, 28 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> index 5aeedeaf3c41..3597359c0fc8 100644
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
> @@ -401,10 +413,25 @@ static int zynqmp_r5_rproc_stop(struct rproc *rproc)
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
> +	if (zynqmp_pm_feature(PM_FORCE_POWERDOWN) < 1) {
> +		dev_dbg(r5_core->dev, "EEMI interface %d not supported\n",
> +			PM_FORCE_POWERDOWN);
> +		return -EOPNOTSUPP;
> +	}

Here I have to guess, because it is not documented, that it is the check to see
if zynqmp_pm_force_pwrdwn() is available.  I'm not sure why it is needed because
zynqmp_pm_force_pwrdwn() returns and error code. 

Thanks,
Mathieu

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
> base-commit: 8532691d0a85ab2a826808207e904f7d62a9d804
> -- 
> 2.34.1
> 
