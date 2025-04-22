Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D388D1F09A8
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 10:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745316658; cv=none; b=lme4FeHpUXNlmUQXRLlCZzcJdIVAF1oB9SCZOcPqrasDZbbi2TIMFEIzOwL+vae8/kpKips3cKz7ZuS4qMi8sk/qWd0UVAHxnXYl4LQ9Y3LZ6+d/v6C2prYoYcbi3BNuSeAoyW/8UUC1t/b/00PBJl4v+jy73I7Ylnl9ZecNQhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745316658; c=relaxed/simple;
	bh=Cjd17WZaONmrhVw68jD6Qssqs4daHsX5Hz8FTe6t92s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vtj2iBI7Q2wXuN2R/pciml4U1qrnd1gEZCz/Vo+gIlkc18dXxB2e2O2lf/ZNbzF3nYQtuKN4SZeZuvyM0D9HrUeYaZE/ScqDJ5OI95iWmHHcxpcLMkPj+fH4014cZ3LFV9FLXRbD+GDGD0+K6+mG+DkGBU/EJbvQ4G/oqFCMmA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aVyXQnha; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aVyXQnha"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2254e0b4b79so73746215ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 03:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745316656; x=1745921456; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t95g/lR8j0dWt1fCMqN6PrwRyQPmObNHmaTJOEuO6uc=;
        b=aVyXQnhaqVhH3PtOucaprdub1ikDAdigUlH7ixSEnwQFlYvdoK4v1Mg/3O6cBkKJgj
         p961DjeUbiHqJC+Net8qOOt/ftkt1YgBZXeMDOSUaeipipf0TSc4r2R2vfgUDr66VU/N
         fKCBIYx7TBd2VG3IQ9VCFsnYvbqqjLIlf6uawAtw7CZqJpQbxKzQbGdl4rIwlUz8XqCq
         E4p60bWpKKWb89KvAWUGvOKh9ioue5UsiwDs1rw01zAGP1NgOw+Kx3cjmEnWBcZ7Cbrw
         PJ4UHH0F1i4sm7akyk60oqXpIe4v6PpDJ2W1LNcnENnu+SE03FEQeeb4itdrq2d4Iey1
         3qvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745316656; x=1745921456;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t95g/lR8j0dWt1fCMqN6PrwRyQPmObNHmaTJOEuO6uc=;
        b=rI+yYVQnZQNymOaDMqx9jvdxr4KsNnydHm9wgzbf8XoQ7I6zioP0bqm4L6lVEc8dJ2
         +HCMn6BddXFJkfLDWvdCYeH345AKmNoHF2U6PV6U1SnSdFt/dY9PrDzjFUvqkECSKRdi
         WmZuCFa4uav0tZeHAp3vjrp8TzywjwrxMxL4XMox/VltrjhfUTqdbdTi5QH8se87SKgH
         Qk7tAZ8yVs73bRloCFmtsBhNqvd3y/6UHCjQ6IZ+2MzcfMCO7itf/0N+hk5oFxhvy2h1
         SlmwKppA+/mfbA6IKQy7zyCdPuJbDEeJ77zoqIT6t+KUpdtiSIHfsxX7bVCC7AQ95BuR
         P4Gg==
X-Forwarded-Encrypted: i=1; AJvYcCVBMTBbLZUur4MiLkL6WZyrzMuNVQjsZoV7fPrFMqUzy05yNJbBwDIyFURuDeLSs37GPHpPSQ6iUvpchnw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQeU1Ai+weWyzzsNfstuFRxdmHgupYvI2C66KaUk24Btt1OQeP
	vkgdHfH0piJPS+uzf+z+YvgDoH3PS9DeHG2Kr1FAmLxmCLDh9zzn7An1ZrrLiGI=
X-Gm-Gg: ASbGncuZtcXOhJEwY0u3zeuApgxGruWMsm1wH4I2gYRHxe5mNWATYCT8nBX5bAOhjtS
	zPT5l0QtvrE/+IHdWw32QJHj4+m9dm7xOla/pdoay5qSPYMDqsVsImvEPcWyXJLpyS1VlQDanyV
	dANUY5MtPrf7d9Y/tr/OnMZfQCZmx4qegPejN9zFir/8SsWtg5zaChfqktcxgnInShG0caTlNKo
	44qLeq/WP3Jczmy7I/Qr8hoQvTp63hOA5RPpcnFZI+PS1Oo+PBAgYQd1dmM07KnS8uNwXg2in1u
	+Wkec3fmICUB2Fc8AzrGww/J08jqSB47ZDGufcZaZw==
X-Google-Smtp-Source: AGHT+IHx3LxCoR15j6pU7YV6La/DWIC9xool04WI58xGPvEE97FATAcHmmOW/Bqbgnnhga/h2+yG3g==
X-Received: by 2002:a17:903:22c9:b0:220:e5be:29c7 with SMTP id d9443c01a7336-22c53607de7mr229581345ad.39.1745316656093;
        Tue, 22 Apr 2025 03:10:56 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50ecec0esm80925705ad.163.2025.04.22.03.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 03:10:55 -0700 (PDT)
Date: Tue, 22 Apr 2025 15:40:53 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: webgeek1234@gmail.com
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 2/2] cpufreq: tegra124: Allow building as a module
Message-ID: <20250422101053.kjg4dctendvcg3hv@vireshk-i7>
References: <20250421-tegra124-cpufreq-v3-0-95eaba968467@gmail.com>
 <20250421-tegra124-cpufreq-v3-2-95eaba968467@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421-tegra124-cpufreq-v3-2-95eaba968467@gmail.com>

On 21-04-25, 12:33, Aaron Kling via B4 Relay wrote:
> +static void __exit tegra_cpufreq_module_exit(void)

Shouldn't name be tegra_cpufreq_exit() ? Just like
tegra_cpufreq_init().


> +{
> +	struct tegra124_cpufreq_priv *priv;
> +
> +	if (platform_device && !IS_ERR(platform_device)) {
> +		priv = dev_get_drvdata(&platform_device->dev);
> +
> +		clk_put(priv->pllp_clk);
> +		clk_put(priv->pllx_clk);
> +		clk_put(priv->dfll_clk);
> +		clk_put(priv->cpu_clk);

Shouldn't this be done from remove() as the resources were acquired in
probe() ? tegra_cpufreq_exit() should only revert what's done
by tegra_cpufreq_init().

-- 
viresh
