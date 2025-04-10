Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4D81E9B19
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 04:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744259868; cv=none; b=A5xdXwjKmrVioApZSjVKM97BxYZm53eQCGjac7IbCB+MJhqSX5CCbHUt4wzi3gftRmwUBK5he38hzf1I/nuDMjQ9mQXrfPgDj5P7EQBJoPza4hb5uVhtq1+6CDdkTneLob7O+zm6Sp7YAdQWXkX+hBO9RK7E1rDRJ1G/yzZNikI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744259868; c=relaxed/simple;
	bh=1Xix/mO6aE19SIT5lyF30wlU6UXfyC7ZaeE7p6sIKzY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mPB5m6Ecdb2dW9H2sSaWvDIFl+kzMzy2qp26R6Y98EuzBcG9wjdJap9zcf/JuAEuRsbDZHTjL1fVTUUIvlcFr7HYhAh+bySBIQDWEeVdEMi+5Llt7qc/l6GLozOC7UoWFs8pzZ/Xy0rlvaod/fdYnLqm33sePnh7HCEWAnGN+Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ukcsbc1t; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ukcsbc1t"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7370a2d1981so256508b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 21:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744259866; x=1744864666; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dKq9kzMYsicKdtkGA5MBDLw3TZIwxRLfS0ALUoxDg9c=;
        b=Ukcsbc1tJEjKUe37Yx1xWKCw7+bC/ztgqwJNZQJ+1jbpQslcw0z9jssFrlYsPjjanl
         MLLpd8JiGo0pc+zsrM1mI+G/wr5a2d2m2rGNOfUPlUNGt/BncCB+61oyl1R3LjHcicj7
         IqAesfPeTDSSdbku0Zzhgk0uYwK8ry/mjOq0NXLIUXqw3OqzQwj90F1V+nN7JT3Azm5B
         bsCCbopKRDKJ4InUXWJ6ZSU/gQm3TukuX84BQFHqLhb4E+6+4C0UmAEXjoYMCyEInAOy
         fn/CNmfGwEbfklAtntQC8zSxS0kCtedjnWU3UmzFFzWwFU7MzVxedWvLvwgbhVwBlf50
         61SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744259866; x=1744864666;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dKq9kzMYsicKdtkGA5MBDLw3TZIwxRLfS0ALUoxDg9c=;
        b=pggtQyc8wbvEJSt3z2G+k50rM9cgOOZe8lO1wbK37cLD20WoeLdctoTVt9SX9jdbJ/
         9ihv7CHZjxf8+t6dLx+XpF7An1i1ZjGjXJvO/ksObKNeEQfLaBE4tF8e/3Pbr25Vg+Yf
         /V11TmuMiN36QK32NnlZUwMkmII+JUVH8ec52pwnXyIqm9TgO5L8oKlUgrXGdXcFQVl8
         imJdSnbhjPX4fqEuF0uapaxNuEepdonnsWzTaK5s4adHyn3rS/an1pBZX7jOrr+hWXG0
         nR4ZNZHKMSd5lxL1V7sK9gg0MKgiXwiJGdqsXN2K6iFTgdmULKq6jN1bz8bqK1W8JzZH
         uH3w==
X-Forwarded-Encrypted: i=1; AJvYcCXPAbp8LjrCQqZJBcyGKewTiQw14SvUUGtUK++j9fb2RxhNz9MWXDzXmUHTLPwfKtz0sXnMYSmBcPOe+m0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3qrXf4lylL5oH7u2ARyW4go1AlU+GzmsFqNa/MablmSmHbCCc
	Z8Sp7DQB1zQXGRyycLyJaAkmqxsPHKIiGzLffgf8E6m2/oLNM8ybmhrDrrJthq8=
X-Gm-Gg: ASbGncvmXKRZ01WKjTyFInKHUvP2+65njuqqcvH3x9l+16/cfAzzowKkmWdE1MUdYCj
	Xpmq+BL+zNxjUgVwwgP8eOaMhUqAp6d6TxIwC+YYhGdwtykYVy1rNm4QGojZBs6muwXsjrp6vDf
	rvL3ULLv1bXWzAYsifhLttnnaDsYbkiCgzTi9FMfXA5cA5OgB+XRpmVV8a7AkEpmadPSrDSptYO
	NivPFA72Q+gBuF3sUfYDNWA01yrF7Rc/F2Ld1Ss3Bpz0BR12638fNd0Mu1Fh22e6IM1atgio9dQ
	xpsX7jxHtGrt8rs3f+TFQ3++EEQhboJV+EA7b8RzdA==
X-Google-Smtp-Source: AGHT+IE5WApQf0idcPfilUjF6fBUp39jssoyHNZPfC/qpfeRdr8GHZIk0YeghJmMBYI3ABubgqhHhA==
X-Received: by 2002:a05:6a20:d528:b0:1f5:9069:e563 with SMTP id adf61e73a8af0-201694cef6fmr2822217637.21.1744259866440;
        Wed, 09 Apr 2025 21:37:46 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1e3842dsm2345076b3a.108.2025.04.09.21.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 21:37:45 -0700 (PDT)
Date: Thu, 10 Apr 2025 10:07:43 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Henry Martin <bsdhenrymartin@gmail.com>
Cc: sven@svenpeter.dev, j@jannau.net, alyssa@rosenzweig.io, neal@gompa.dev,
	rafael@kernel.org, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] cpufreq: apple-soc: Fix null-ptr-deref in
 apple_soc_cpufreq_get_rate()
Message-ID: <20250410043743.rxwixe7slr342d56@vireshk-i7>
References: <20250409124813.47193-1-bsdhenrymartin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409124813.47193-1-bsdhenrymartin@gmail.com>

On 09-04-25, 20:48, Henry Martin wrote:
> cpufreq_cpu_get_raw() can return NULL when the target CPU is not present
> in the policy->cpus mask. apple_soc_cpufreq_get_rate() does not check
> for this case, which results in a NULL pointer dereference.
> 
> Fixes: 6286bbb40576 ("cpufreq: apple-soc: Add new driver to control Apple SoC CPU P-states")
> Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
> ---
> V1 -> V2: Use `if (unlikely(!policy))` instead of `if (!policy)`
> 
>  drivers/cpufreq/apple-soc-cpufreq.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)

Applied. Thanks.

-- 
viresh
