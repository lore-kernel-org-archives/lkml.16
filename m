Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1090417BA1
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 05:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745214360; cv=none; b=KWzpjRItd9N6LUT3izw1TYL9Wcdj3WNXyEEDNv+NoOytBGqnh5LuxAmXshvSvkezgmIyV4KiX0w5GX6Zo0BciAnYiS9aYEmGZfuDTNq/RJR7pkQ0glYuCIAO83gX6xEZF03QNfSlduNCP2YdPKERlH5VktNn3S1dY+qx+7kN008=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745214360; c=relaxed/simple;
	bh=2HE3Fe8IS8uFDje1uEcxrNcaW/qTGc8B5ZKasfwqE2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rT9LDBq2skm0/JohOFHKb5F8KWz4wsrRxzpMW6Eoi84DzrrHlXSTliom3TAOZsEd2v9/ag7YWKsMYn54sy706237siG4E44praBIr5H0viBD2oay4SJfKh//y7PNgOytuLKzedvEcPJjoOvrTrtz9BlX4JTpP0QqVm47K+BO/vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h4OHjofw; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h4OHjofw"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22438c356c8so38687445ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 22:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745214358; x=1745819158; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JiF5vLWEUSl9osYTKQPJJdhSYAYke1l1I5dNHOP/gJw=;
        b=h4OHjofwCuvE4SRB0k+9qg1hGYC5F6wSvsGf6Jqn+HG9nS5RdcXIYIi0V2WI6MDy4B
         ITKFwwHo0k836OZj9YbxzqqQM+fgLWQxyLLSsJYRlCC2lttOCd/RX234shkjnG/MNUH1
         gQn9VuJwbmaVPonT8DqOvVGOkrjPh4oSzm6npGT4eUiOc/kBl+Ao+iM3o5x6sfMwSSGR
         lURqiwbUXFuJIun8+kSkju9UcaJ0srX/KrYzdIZXP4r2PC9fGQzMIfuw1kiXZMSQoPoj
         RR7YEXfenD/t1TSIlzX503xX+/wdn7InmdztBeIGs+KGHm9DUeUsHe9fTKb7XrvOvh6/
         SRVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745214358; x=1745819158;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JiF5vLWEUSl9osYTKQPJJdhSYAYke1l1I5dNHOP/gJw=;
        b=KW7GL9LCAfzL10TS9VZlmCj/fN+X2ixZr+GRHPow4LHgvu8HquXCk5HVaB8QX+Hr2a
         nw5I2n3EdGkSQJXWbsmkWkB63dU6tOGDYUAL1EqJBaageaPkmZ2T+BZxEepuVBigEIRV
         AvgwdEagPP6pdAeMz8QRcwh9ECFqzZxAgJtLFZr1tiKT2V7QMYiU69wIhTbYtT7j1O/Q
         pbfWWPJEdHbQO3u/vCGoCmsq1sUSoJRxSt935ZGuyouNtjg+lqnEanM6/DXlS55X9pOW
         ChRDWrYVI9tWS2YErctoh1u2/kmmUj7vEzbG/Bo5ETeQykfS2hPozW8YCn/6vgn52otK
         tCaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfXPv73dicnnzQacBQ50G1MPmZRy34Z3UvpI2CueWQHxmQRwrH4gVT6rjENKr/2zxPisCpDImE+KjgD+8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMRbavJFzWSxXi9pThBLANsyNJDsoiw5L5Bx6kMUyyejm6Bcuy
	a2QekE4GC+JlaXdJgIqlTETmCb2F63rsfUWodNNwldiGOiXa5npJZpxIcHSf0ic=
X-Gm-Gg: ASbGncvPXJyRi4zQBJwvb5oxfMjhMIt2lt2tjtUAB7zGCgUP76uDhm4FjwNBMcjQSTf
	YnQpNjC3M4ApwhQkB1scWIrH/maV8i1v+b9ebAgwv5IDXOrjRbrWvUC5MfV3NLevGyKfxE0AAv9
	oUeJJm4VQpbjCfNnpbTgzbUZ7UBc2lTODVYlCKcaBk59m2BZLZYwlQgYiTNr1UrDmEO/RuF2Xu9
	5KPd/Or2xDMFGjh/gxbyBdimKgJm9h6k4lcEhPP1Nz1DiqIXHmQsxZMfuMUoEkWM/wZNmVSC0G4
	Lj+kbrL39eM3fHMyih2F6PKHh/B9iiqZFnF7jSUMwimO6ihh4NUH
X-Google-Smtp-Source: AGHT+IGeUEeBb47V0Nh+BOpd5dfBayregAGfFePL9F/iw96tYSPsNEJrFFau88SK8PPVPGJCOb95dA==
X-Received: by 2002:a17:903:2352:b0:227:e74a:a066 with SMTP id d9443c01a7336-22c535c058bmr161892545ad.28.1745214358282;
        Sun, 20 Apr 2025 22:45:58 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50bdaaf2sm57260765ad.13.2025.04.20.22.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 22:45:57 -0700 (PDT)
Date: Mon, 21 Apr 2025 11:15:55 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: webgeek1234@gmail.com
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 2/2] cpufreq: tegra124: Allow building as a module
Message-ID: <20250421054555.oavale3xjqlrc236@vireshk-i7>
References: <20250420-tegra124-cpufreq-v1-0-0a47fe126091@gmail.com>
 <20250420-tegra124-cpufreq-v1-2-0a47fe126091@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250420-tegra124-cpufreq-v1-2-0a47fe126091@gmail.com>

On 20-04-25, 15:42, Aaron Kling via B4 Relay wrote:
> From: Aaron Kling <webgeek1234@gmail.com>
> 
> This requires a soft dependency on cpufreq-dt as this driver only
> handles power management and cpufreq-dt does the real operations. Other
> than that, this works fine as a module, so allow building as such.
> 
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>  drivers/cpufreq/Kconfig.arm        | 2 +-
>  drivers/cpufreq/tegra124-cpufreq.c | 2 ++
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/cpufreq/Kconfig.arm b/drivers/cpufreq/Kconfig.arm
> index 4f9cb943d945c244eb2b29f543d14df6cac4e5d4..625f6fbdaaf5fd774e3b0bb996eb7ce980da41ee 100644
> --- a/drivers/cpufreq/Kconfig.arm
> +++ b/drivers/cpufreq/Kconfig.arm
> @@ -238,7 +238,7 @@ config ARM_TEGRA20_CPUFREQ
>  	  This adds the CPUFreq driver support for Tegra20/30 SOCs.
>  
>  config ARM_TEGRA124_CPUFREQ
> -	bool "Tegra124 CPUFreq support"
> +	tristate "Tegra124 CPUFreq support"
>  	depends on ARCH_TEGRA || COMPILE_TEST
>  	depends on CPUFREQ_DT
>  	default y
> diff --git a/drivers/cpufreq/tegra124-cpufreq.c b/drivers/cpufreq/tegra124-cpufreq.c
> index 514146d98bca2d8aa59980a14dff3487cd8045f6..9e46b53487fafdc1e9e95e765b9b490d9c95f2c6 100644
> --- a/drivers/cpufreq/tegra124-cpufreq.c
> +++ b/drivers/cpufreq/tegra124-cpufreq.c
> @@ -211,5 +211,7 @@ static int __init tegra_cpufreq_init(void)
>  }
>  module_init(tegra_cpufreq_init);
>  
> +MODULE_SOFTDEP("pre: cpufreq-dt");
>  MODULE_AUTHOR("Tuomas Tynkkynen <ttynkkynen@nvidia.com>");
>  MODULE_DESCRIPTION("cpufreq driver for NVIDIA Tegra124");
> +MODULE_LICENSE("GPL");

Can you try inserting/removing/and inserting the driver again ? I
believe it will lead to some failures as no cleanup is being done by
the driver.

-- 
viresh
