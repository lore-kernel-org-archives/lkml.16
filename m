Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D78922339
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747649062; cv=none; b=CkEGc3B8hwpbc39Ui8Ez+DgOMO/Q1vBE48ANSTRmrDiAmHeH8UzXa+ShRjYdkLcM8bx1BhwjGbtGvTNPK5jqWDcWAm2J5CW2PWvbunuxk4QWLHMu4SB8tFaLkynPcS07crFbePgLGtmHquYRp2o0gTfvFNLt6S3pjBeUaF8tWSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747649062; c=relaxed/simple;
	bh=A2dpHN2sEArEhvFdNCYfmCtLjsUgITLXWvLvTrLuVBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bduaoVm9O9XPglceEGLJc5R9BpI1F6XiYHkpmluu3avCJXZgeoErh6EuNLGAABkv4F6lccA8DXNlL9KqBGlbckRfa8T3QE0NcCt76EPVIOyeFanvbXaacWeD1i0oHYDDuwNDVY7w+Ia77EgnwMM9smLus4QFNs6ju+gTvHdeamA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WvZNcLbX; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WvZNcLbX"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so3346596b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 03:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747649059; x=1748253859; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6YtPqJD96+AiahoiLJUfGwNDiBMARBZnTBQnE7bF3oI=;
        b=WvZNcLbXhzvZMpHu2RQSADGOOFz2wJsI1vwDb/Eeqo1Th0ZuvMr64BU/PtzN+7khSc
         feWXkTwtELhjB10GcJueP4le41gB+eLzQIazeVhEYTSAATAHPN1B5CmgqaaMfj3cO+/g
         W/B+JdaslYpdQ72Ci8zvrbNLVjbpBWeWlsXnxqWQTp9Tyx/ewTrZSYGh39cvQup3b9gx
         xTm15MTrodAzsq6cekciQ0pb74Dbjw7A3pkvjm7HGBVFrQFGY8Nd0RxjuxidSLoDsKKa
         iFYWXB6KQbrRN+7/+VLBFJo4bhqje6j/PHCvHkrih14EOoziGyBYpFlHlNXESzNu0If8
         YHCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747649059; x=1748253859;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6YtPqJD96+AiahoiLJUfGwNDiBMARBZnTBQnE7bF3oI=;
        b=WrudUzi49ksZGMJ+KyUDitwKI5N9tT2NQmOfDvnVZjIVG8pKf8p2rfQo2uVX4ftSTU
         CbP4n01u2wye1/v0PZwYKe5mAg8ubXuqzEfP/jZyO+6hx1FM5znwZdbwwz3qRHlC0slU
         ugYwOXOZ9s7D2s+edJT2c4y56LfHutStxN0R5sV73FfpVbwHUE7D6JM2yM1LtINAQ+y5
         seoK8QEDDiBD0lDvxNpwXp7aO28kdjz/tibQFxehtK0DkONBl1Pwjr5aR+hJ00M1FDNr
         A+TssocDiAJDl3qJW/NmA5a4B2/W6Cpqxa0b0/ihGYfJyUXV0yGNUiIEP5tg4AnZreft
         MBbg==
X-Forwarded-Encrypted: i=1; AJvYcCWpoqN/vat1R9iipUOvVpkxnI+jjWO7GY42miR5z0IglTxz2rMcyZVuQ5GsA4WeehnoWpIQfj4EbAlh/x4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7RJxx7RweZoj64zLuZMRQiQza9ZKi/ns+PjCWx89Lkvp6xWMt
	69ngLefd/GGRJajOXO3Hs9WvW4DGOyAdV5Hoqyjq8L9HUYEq20ZO2VMP+WVvxSRCV8g=
X-Gm-Gg: ASbGncsW1y+34RwWN7LQBjzbWWxPx7aO3Yfob4Ss2e3K2Ycr00WJ1tA3vkuPS6pef2r
	7etw7fSdhHZHUPCibAQFwOGc3jhIEBuVdaWZL1AhUOtPxrtlC8vlcR6PNQKAw+9OMqaiqInbyR1
	YvF+BBciaYerwLmWF/M4G9IBe3fap9Y+k7Wb3YMPi+B88Wwo9cqWXfDoe7hs0tavwLBBwmk1toV
	ERFEMPhMMkUog8xuVGnAcpMVxC0wxerho4vSp6yvKUgrSpnI4TOjn4zF/aBgjWcngacZnCrlc/U
	t+iawXp3QyReHVQTAp2+GeVXSvYKMLU0kj/TJqSFYeawSZbarcia+3Rz7CMdvo8=
X-Google-Smtp-Source: AGHT+IGEnvVwZRiTsCwUsGjKmnNCAfKCTA6Ra5Mk20OfWP5M786bdcXDJyaBb9y/Cv6azGJ88xUN1w==
X-Received: by 2002:a05:6a00:91d3:b0:73e:2d7a:8fc0 with SMTP id d2e1a72fcca58-742a9786a79mr15783828b3a.1.1747649059593;
        Mon, 19 May 2025 03:04:19 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9877030sm6014959b3a.148.2025.05.19.03.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 03:04:19 -0700 (PDT)
Date: Mon, 19 May 2025 15:34:16 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Bowen Yu <yubowen8@huawei.com>
Cc: rafael@kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxarm@huawei.com,
	zhanjie9@hisilicon.com, jonathan.cameron@huawei.com,
	lihuisong@huawei.com, zhenglifeng1@huawei.com,
	cenxinghai@h-partners.com
Subject: Re: [PATCH] cpufreq: Update sscanf() to kstrtouint()
Message-ID: <20250519100416.fjixyqgbgk44pgps@vireshk-i7>
References: <20250519070938.931396-1-yubowen8@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250519070938.931396-1-yubowen8@huawei.com>

On 19-05-25, 15:09, Bowen Yu wrote:
> In store_scaling_setspeed(), sscanf is still used to read to sysfs.
> Newer kstrtox provide more features including overflow protection,
> better errorhandling and allows for other systems of numeration. It
> is therefore better to update sscanf() to kstrtouint().
> 
> Signed-off-by: Bowen Yu <yubowen8@huawei.com>
> ---
>  drivers/cpufreq/cpufreq.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> index be727da0be4d..0c842edd1a76 100644
> --- a/drivers/cpufreq/cpufreq.c
> +++ b/drivers/cpufreq/cpufreq.c
> @@ -920,9 +920,9 @@ static ssize_t store_scaling_setspeed(struct cpufreq_policy *policy,
>  	if (!policy->governor || !policy->governor->store_setspeed)
>  		return -EINVAL;
>  
> -	ret = sscanf(buf, "%u", &freq);
> -	if (ret != 1)
> -		return -EINVAL;
> +	ret = kstrtouint(buf, 0, &freq);
> +	if (ret)
> +		return ret;
>  
>  	policy->governor->store_setspeed(policy, freq);

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
