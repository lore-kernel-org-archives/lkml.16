Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2298920C485
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 05:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745214297; cv=none; b=LWwax/54DOs4hpSEf0W2HovP/LJktH3gsuM6VuBAjLbrcedjSyPjtgf/w/CgjseDyBlkhAMVeg8GVGy+rozN29z2YwBsu7x3eIoI2LVJUi6ehNGkeuTS1+f0sb1SmQiCAcNArKPMoTCMnITReZ/GGv5gCMSzWCai+bGvrJLKQ5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745214297; c=relaxed/simple;
	bh=eBG1slbqTRw8vsbgYrWTwEorbArUGPZrqx8A3p4gBj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZShmnOn5YMO2ryGV2b6LEgkjiC6XOi52/XtwBCyVCzqrkphkHrG2eiPYMA98/vl/RCCNKvtC/HVBLBVNLKKPYO6383d7VTQKOofWGCggA/ss6IhaIH313PtaAwnBn65K9flp+9/U+QryGhXsIeh/Av2Lhm+3uH4H7Xwg9hLv48I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v977lrKk; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v977lrKk"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-22622ddcc35so53992875ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 22:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745214295; x=1745819095; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IyOTo7rnTJ1HQMNMgNbpA3SfQ6Ks6YJstKsXKdKshu8=;
        b=v977lrKk8VNZnHgjNCWgZcKvluYqucgQMqsBUL9hoHL74ez4tx98oJCsDI63kFTpDO
         ctgAGV1cdhyEWYlBGSsgM08ycWsKY9uZwDL5JjyBBaCAEmwLQkBSoNCumeyeVvW6XLBe
         QIzp3whntcplHQPwhS+IuJVwQ9gyjqXHfHI8e4rTHbTU4q7NV6w4aPWQQvUwOp41gSdX
         zeWzwBwqwc4G0K2XlPZI3jGPfzTjTT8Hv/2rl9V23Ah767XNZuztZncJuzD49Te5Q9p2
         gSF5ccjRbhUnxd43S2noCBb52fNaOXFDJSVuedkzQUcu1UNtIcF1hvRn+JUyAy86XqIM
         ldiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745214295; x=1745819095;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IyOTo7rnTJ1HQMNMgNbpA3SfQ6Ks6YJstKsXKdKshu8=;
        b=uAeALB5jiH497RRaat2W/DpGaV/Hj+qISfJkWatDHzuwkvAEEqgNRfcjEGlAj1bdzV
         5DNjZj8avERHv6XpzC7PX3XfBal6k+S57akiq0VNi4peTYAliWcyLgb8//g1+Gqx6Z05
         lHkLytCK9rzlcf23mNrrbK65ZOXlDWAas5xKJG729pN+FzBzTUIk73kIN0mD71xq9dLt
         kw/5bwI6+TIzvxTzw/RA5XzI3ndVikvjThz4DockIdX4cJfEr52hDB/iZ3GurZf3ow2W
         3Jy0nF6r+aF7mXpg44q6+1eofCwqv46xeB6y/16BNdCay4ZgPLZjZ6RiAYxq2ZP9Q947
         0U/w==
X-Forwarded-Encrypted: i=1; AJvYcCWhJwQ8DaV7q7/5LCYJIK9NTgJp8opDghEH0oAmf++vyqvje1/ZcFLmqdoU7YwH1Ovhj1mdf1fGwnA73es=@vger.kernel.org
X-Gm-Message-State: AOJu0YzprPOXIaSanyhevsPPbc7faqLZ1CgpEKs+3GVhU5OLFhzYd5o5
	cioUfyzl6DXvpR0Cw3FXmBqD8HZ+tn4YvYmgKd8rNCQ8zOoyDF0+xgyjjm24m2Y=
X-Gm-Gg: ASbGncu+7xwIbgp067sN8oawGzuW/kszuLqM73xun9v1YplxE8G5HxllsSpAuAwibvF
	uJYlC7E287pEeEX//MvB/l5gQR79dZx0GgU/dktBmvHZrl0ZtHsiKS4vg97OJp4l6ncW/U7ApAD
	HXBp+7GYtvQ9BdpvRAwRQb0w3xUERtZ/UHpVmn3AnpP7NqB/V/CNFT+OG5a9D/efbsMltn7quN+
	C4LbDoQ1FvV6X30erJFPdRIcpMDvC91jgtsy++xf08cGgTHcPYAwCzb6u6uWXKurAG/TsjREuAh
	nvY5hv09tPeE2IH1f/dy12uw1ZLvBKqEPiWlrueUlA==
X-Google-Smtp-Source: AGHT+IFhnaa0z+ayVrcmvAvIxkBt8wrJ3nfuin/kbU7E0Vx+ZE9g1E7PEVYhPkwAR5/xTaisUcIpCA==
X-Received: by 2002:a17:903:2ca:b0:224:ff0:4360 with SMTP id d9443c01a7336-22c53654c0fmr157873595ad.53.1745214295413;
        Sun, 20 Apr 2025 22:44:55 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50bdaca6sm57336995ad.9.2025.04.20.22.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 22:44:54 -0700 (PDT)
Date: Mon, 21 Apr 2025 11:14:52 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: webgeek1234@gmail.com
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 1/2] cpufreq: Export disable_cpufreq()
Message-ID: <20250421054452.fdlrrhtsimyucbup@vireshk-i7>
References: <20250420-tegra124-cpufreq-v1-0-0a47fe126091@gmail.com>
 <20250420-tegra124-cpufreq-v1-1-0a47fe126091@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250420-tegra124-cpufreq-v1-1-0a47fe126091@gmail.com>

On 20-04-25, 15:42, Aaron Kling via B4 Relay wrote:
> From: Aaron Kling <webgeek1234@gmail.com>
> 
> This is used by the tegra124-cpufreq driver.
> 
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>  drivers/cpufreq/cpufreq.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> index 0cf5a320bb5e864709b259249fb1af8bfbc0b04b..78cddc78ee98630f99ccc332c64c94f437297177 100644
> --- a/drivers/cpufreq/cpufreq.c
> +++ b/drivers/cpufreq/cpufreq.c
> @@ -109,6 +109,7 @@ void disable_cpufreq(void)
>  {
>  	off = 1;
>  }
> +EXPORT_SYMBOL_GPL(disable_cpufreq);
>  static DEFINE_MUTEX(cpufreq_governor_mutex);
>  
>  bool have_governor_per_policy(void)

I didn't realize earlier that tegra124 uses this call directly. I
think this call was rather meant for other parts of the kernel
(non-cpufreq drivers) to disable the frequency switching. It may not
fit really well here.

Instead what Tegra's driver could do is remove cpufreq_dt_pdev, which
shall lead to unregistering the cpufreq driver completely.

-- 
viresh
