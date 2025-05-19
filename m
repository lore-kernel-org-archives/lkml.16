Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530A6154BE2
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 08:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747642735; cv=none; b=TxHq8VoAP3lwb3MRtUqPyCT21Hq9rzDt9evm0ZX8nZ15ZuIyh2OLtpGRWwmXTldeL0v6rjG4NHdpZKWqmYBil+MpUaXik4h9sMSYXNROn5veotyA8jFm3Skm5AVjJPA2hjtMu4lytsnRcw/e1rs55s1g8441qr/ZnbnQy6Mi8Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747642735; c=relaxed/simple;
	bh=Wn681Xv/yqYOMFas1Vd76gEewSHlCuTtlwxSjiwuLNo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g6dwu/Vk6cHNr1kgcWtAj8eoPOorvBxrPag82GzkP75KV4kJYAgr5blD5+6ebcFA6Qj3T0RJT5mN5TdMEYWrlxXpqBRRly7NbdTXvvqxuMnHRREz4/zLDnya/eV1FT/ps+mwqndVeIF/TMa9mxGJZiwuIYpnPBubPU6uxCeRms4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OI5+jU52; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OI5+jU52"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2322f8afe02so5872835ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 01:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747642733; x=1748247533; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L/jRk1lKTYKxjfzB0d/5fmN7ISMp4AsTVyPahE4uA88=;
        b=OI5+jU52G9/bHw4sAe702FX6t4MYpHkFlJWM5A56vu64csTOqaCcNd6Ry/CXGJANzr
         Sbxf+PtY7M3MHhDuU0N25zTSggPEXVwv/ByRAyRW/ebQV0t7mOvQrgeasGLdGmnzcies
         vxogiii8JCZTLZTHt3MvReDEWnDCML5UUU6COTaEhYLbjQUPPORFFBzcr7/wjztUMqi/
         mZ8DqOYTtLxjoTazrTzP2gCeiW4bAtOv8lDyUK9DEWBSk0ix27Ml3FoHXhp95ACA7uEa
         PTyY2sespdCUTqLPpDUXu8X58QkdzfeHP0dVdmi/KuLUwCgOjAy/+51SsNfWKffT+IeU
         AZYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747642733; x=1748247533;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L/jRk1lKTYKxjfzB0d/5fmN7ISMp4AsTVyPahE4uA88=;
        b=JgGx8ru/Lg2sLfef2CEXJGba68lK4EOTtNbui/++NGAB1CadY6zW3TYPThIdanQykT
         42n8mZjJVG1HS0Ltv8R06fk+EUcl6FULmMirKbEj+24tb+8QOWoiUmcMM5yC2QDp99sa
         v+wMMyvcN/QxM/s5RV+BkHzjotyTW/uoXd8OEBBgQvuD6kTsE2ePDUYScAem3EwqHB55
         a2xBDR6U+fDP/fU1fz00P0hr6IeA0ScCrweXPaXNoTkn3u0VuUjmB1lZmAjSyHMwmPpu
         V1U6nVwkZiPibNjs3gD53SuNnLLgUeJ+ogpoQG/6qorXERNxB7KqKEfC6q9GYOgmO+iT
         VGMg==
X-Forwarded-Encrypted: i=1; AJvYcCV2/sTIvjJaoLy7qMIZl9BskF3dGYBXUKrI6nPI9rCyn70x20++cOIf9bWyAfLwMD5b29KzAA1WtJee9O0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjWGUCo2aAEIPjY+D0VS5PxsWJgWXr/MC3nor7BER5a2wYsEeC
	Yo4fOiKl93MwIVSu+iAZMF3kDgFFPo4qA5EkZqxEtRVwWC8zvFqPynJWVxGe8G+GsPE=
X-Gm-Gg: ASbGncvCbJItz7iu2hUHqyuAw01h6kzF2BbtUrjv5+O1lYJJSGYOIrr9ABqufqhfVBn
	dHy+uq8p0yU+h8OmVJioGgaYeTbUl16uJpfNiLZR8sIRYOsq3da7Us8Z8oR58Xnh6s9h6/XWVKN
	YjjMc7oPXg+XAbSAdlFP0Ru8U7ESXk77VewGQADDoqcWlGwK+nXlAvj+qCKIOUd+uCN2bCncfit
	SAG1eG/WtJSj+T7Q1iixSBYonh5YBmqMecIodJ0SgU+xgxqPdPWeywUwxAZYDMeJR4O8VbpXP0+
	M0Jj+5l6yt/+MCRO2mtOBpmBHjUXF0EMUDjDcs4LrwAL2Pbybiea
X-Google-Smtp-Source: AGHT+IFABa+b5/H3kNq1B5GdqG8U1MHI7NF5+thziNBuElvttoR7p0nq2thgnZn01iOd4ND/LFuwhA==
X-Received: by 2002:a17:903:2ec8:b0:224:1943:c65 with SMTP id d9443c01a7336-231d44e64e6mr171158295ad.14.1747642733567;
        Mon, 19 May 2025 01:18:53 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e97dadsm54603105ad.141.2025.05.19.01.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 01:18:52 -0700 (PDT)
Date: Mon, 19 May 2025 13:48:50 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Lifeng Zheng <zhenglifeng1@huawei.com>
Cc: rafael@kernel.org, pierre.gondois@arm.com, sumitg@nvidia.com,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linuxarm@huawei.com, mario.limonciello@amd.com,
	yumpusamongus@gmail.com, srinivas.pandruvada@linux.intel.com,
	jonathan.cameron@huawei.com, zhanjie9@hisilicon.com,
	lihuisong@huawei.com, cenxinghai@h-partners.com,
	yubowen8@huawei.com, hepeng68@huawei.com
Subject: Re: [PATCH] cpufreq: CPPC: Support for autonomous selection in
 cppc_cpufreq
Message-ID: <20250519081850.7ycbcw56jzpiwkth@vireshk-i7>
References: <20250507031941.2812701-1-zhenglifeng1@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507031941.2812701-1-zhenglifeng1@huawei.com>

On 07-05-25, 11:19, Lifeng Zheng wrote:
> Add sysfs interfaces for CPPC autonomous selection in the cppc_cpufreq
> driver.
> 
> Signed-off-by: Lifeng Zheng <zhenglifeng1@huawei.com>

Sumit, can you provide your tag if it looks fine to you ?

> diff --git a/Documentation/ABI/testing/sysfs-devices-system-cpu b/Documentation/ABI/testing/sysfs-devices-system-cpu
> index 206079d3bd5b..37065e1b8ebc 100644
> --- a/Documentation/ABI/testing/sysfs-devices-system-cpu
> +++ b/Documentation/ABI/testing/sysfs-devices-system-cpu
> @@ -268,6 +268,60 @@ Description:	Discover CPUs in the same CPU frequency coordination domain
>  		This file is only present if the acpi-cpufreq or the cppc-cpufreq
>  		drivers are in use.
>  
> +What:		/sys/devices/system/cpu/cpuX/cpufreq/auto_select

Is the path correct? Should this be cpufreq/policyN/auto_select ?

> diff --git a/drivers/cpufreq/cppc_cpufreq.c b/drivers/cpufreq/cppc_cpufreq.c
> index b3d74f9adcf0..3c3d00cec298 100644
> --- a/drivers/cpufreq/cppc_cpufreq.c
> +++ b/drivers/cpufreq/cppc_cpufreq.c
> @@ -808,10 +808,119 @@ static ssize_t show_freqdomain_cpus(struct cpufreq_policy *policy, char *buf)
>  
>  	return cpufreq_show_cpus(cpu_data->shared_cpu_map, buf);
>  }
> +
> +static ssize_t show_auto_select(struct cpufreq_policy *policy, char *buf)
> +{
> +	bool val;
> +	int ret;
> +
> +	ret = cppc_get_auto_sel(policy->cpu, &val);
> +
> +	/* show "<unsupported>" when this register is not supported by cpc */

s/cpc/cppc/ ?

-- 
viresh
