Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369871A2396
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747648978; cv=none; b=EI4kBVddNFyCqi+S4aZusH6A2kkD7kXJh4/SW9fz+2hz3ENKilQjcsDrZBecBEkE0c9vaDm5/y5q+fXm9DJ2RJFc5bAa+0jHbsDUVXdf/v0p0CWtk/2Z3Yhom/P8M1uYnW2u7DctGZHCYeoHMXEEcT6GzsbRrOHMfHkokVoR+5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747648978; c=relaxed/simple;
	bh=rYj7MqOM64QRmp+/C5FKJsL9QHVa0o1AU7Ui2HtSwIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gFfj1lWeByFQBGIR3i59vekJkpeJPBzqx7rYBF7gxR/jwHiyoeZu6VG48pk6eRa0LDxxtgSZg6yWCuvtuLvE1Hbyt6XepHq+lYBdoeai/lw2O/0PgWPK/i3KgTD5aaUwyOGD2qo+4b3+baRvCmPGv5a4qLMkJov/feFCbwYYs6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JvTsOyYy; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JvTsOyYy"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7390d21bb1cso3646355b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 03:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747648975; x=1748253775; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y+A3f4LcWplGbhyssnSLFwJnEojTcFJ9ydF25cRQg1M=;
        b=JvTsOyYyeBHy+Z8psOYPni99Opw7W5+uAkXVAyB3qU9FRQsmBdcOecfNE2FcJ51brz
         7VM0SEgT9GU0+ppXc6JeZ+H+OVpXTrcQNjl9ZUanqGkErvjp3lWUh9A7VPVR5gqECaOk
         v0hhopDFwG6K8dWvzcy9AdfwHtXE+b6BRGjyKOeOsFSYT+OUmOTSyFoqywooFjvzn3ZQ
         0HdnTIR1yv8o0tMEbM2mk3yg5v14SFIbisdbCd6FLFQeW47TdmWC4OjGHGV3DozUM+Ai
         yA5cS0DShG5cqH6XupAg5oTuCrfNcMMpiZEwVyz9vt1LydAls11bOhWm4f2jpJHzUixS
         Spzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747648975; x=1748253775;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y+A3f4LcWplGbhyssnSLFwJnEojTcFJ9ydF25cRQg1M=;
        b=HuM26RkMoGUMJWbYYHtG6LBciRLR4lm2N5fAkxVbSHFhBLJpcJ4UBTpb+9skYSY1fu
         HesjTzvxtPddkKBVh0Snwq/3oCgangy9ECTn1SbmMGlJJvngPIZgIW/UgQG9kMr4g4NT
         ozaK3dKS5yQeKJIxQurJf8/ezSW9SmGgVx31rijGJDrEdgQZcYwYuhgkBuJIETysHs3/
         ctjXEzmFAVStYSnfM+GL8+0+Bqc+mp92u1rN3hqgRo5orjs+GU8wpD9Zq0muB87mbTDd
         8GsDpycIIijokjs7qS8u3V/f0ltv6K/DbyKE+fkuGOi9+iVwuCyiWcRRVJ/vsZLRZNFQ
         hRww==
X-Forwarded-Encrypted: i=1; AJvYcCWix0Vgo/MpCkRaGKB+hdEyr1rJLSfIEO7Ral2JtAGbYbYrF/KQi2gpQxlQCREL+31TPYWhQZdZYX4c2VU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOM2IrgBxvcSQcMCl42wCuFB33Yiqd7wyeahdZNgUq2FpJt3Oq
	euYoicbCTS6Yg1DkiBMB5v+Fr8fual81bNarDSlBokIbEg6BvKm2oAfLuqvuVhM2N5g=
X-Gm-Gg: ASbGnctKiGVjirMmlL5nbow0YJIjv6F5Gz2LzqBxElvUzv3b5/SgdjGmOBMFlF8+SXc
	vMDO3B9AT7vIM3R8Z++oaGcXGzXrvtOi7yUbSDTQd/1eg73z/W9g5eMKq6QHfGkbarrfDEEZRjI
	AJF+sJetn0UUSAkUJSCjVK/4RZzJm1SlxOV+zIL+HrM44ukvyNSedts1n0TysDsKoPCLLNHaOHN
	YphtYwxaWQAbvvqkcgDc3/py7epbJq6RPaedIdy49ztVpoeU/A/+XVGHdxUiYieaZE4qneM5vvj
	3s6BJnVwA0nMRZyQf5f8f4bRX1pU2hldJkzu4mLOXdI/nX5IvkUl
X-Google-Smtp-Source: AGHT+IEJdanszISLWDbmYOQ7WlA7HzgrJl8GG9AsDfB8VFNBB0tqhXCjynngqe+PSU3JARtFE7Mqpg==
X-Received: by 2002:a05:6a20:728e:b0:1ee:b8bc:3d2e with SMTP id adf61e73a8af0-21621882819mr19035889637.8.1747648975483;
        Mon, 19 May 2025 03:02:55 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf5a34bsm5044895a12.4.2025.05.19.03.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 03:02:54 -0700 (PDT)
Date: Mon, 19 May 2025 15:32:52 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Bowen Yu <yubowen8@huawei.com>
Cc: rafael@kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxarm@huawei.com,
	zhanjie9@hisilicon.com, jonathan.cameron@huawei.com,
	lihuisong@huawei.com, zhenglifeng1@huawei.com,
	cenxinghai@h-partners.com
Subject: Re: [PATCH] cpufreq: Replace magic number
Message-ID: <20250519100252.wme2gfdvl752efe2@vireshk-i7>
References: <20250519070908.930879-1-yubowen8@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250519070908.930879-1-yubowen8@huawei.com>

On 19-05-25, 15:09, Bowen Yu wrote:
> Setting the length of str_governor with a magic number could cause
> overflow when max length increases, it is better to use the defined
> macro in this case.
> 
> Signed-off-by: Bowen Yu <yubowen8@huawei.com>
> ---
>  drivers/cpufreq/cpufreq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> index 0c842edd1a76..a3a376f030f0 100644
> --- a/drivers/cpufreq/cpufreq.c
> +++ b/drivers/cpufreq/cpufreq.c
> @@ -809,7 +809,7 @@ static ssize_t show_scaling_governor(struct cpufreq_policy *policy, char *buf)
>  static ssize_t store_scaling_governor(struct cpufreq_policy *policy,
>  					const char *buf, size_t count)
>  {
> -	char str_governor[16];
> +	char str_governor[CPUFREQ_NAME_LEN];
>  	int ret;
>  
>  	ret = sscanf(buf, "%15s", str_governor);

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
