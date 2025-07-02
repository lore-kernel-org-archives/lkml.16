Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C672236431
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 08:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751443933; cv=none; b=Ct2dYLMCASIAfFe/ZXFW+uDu+u2jlCpb1zVnBJipCMQ0ZElwLCCq2RSa0diO70b/8d9ZcAHLmJgMwPJKKSZLBhwyltj1o0k8uIbMyQMUdbVAWcc0BPZtlr3IL9GtX1s4aD9ctMvjOeAgFqFUYrHCu3v+97NoarPbXZMzklHrld4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751443933; c=relaxed/simple;
	bh=z0Z5jvK6xUvtBK4jnkZkseYCrZ79UTYnTdxbGRs6ZSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SjWrZT5n+3E+neLX72VPzQr20GZRET3TnsBzE5HPZRv30+MvLXwn8aUVMGeACGnijIQT7gEs3wRQledLYyShCxPBXTTgwJ92Ecy/5dHP5Mukiyh4K532hgDK8FxgyKTmA9xQ+iknZKI9IVr+jtg+qoOj/AuRV5MDgbwKKwTPcgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i2TeDSNG; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i2TeDSNG"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-23636167b30so38393955ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 01:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751443930; x=1752048730; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Uy53KgmSlwJ+OJKWpNvJE3andfzWWOVCz+777PvTMw4=;
        b=i2TeDSNGtUgm+EL+XAnsMEId4NkbW1o96T2UmskStRLoLd/liWptHY13il2s8bhgBh
         CK7ANf4kJq4QMBGPwkkTstGujdvVwzhLrd1gmiseMNW6CxzYOQIyiEiPSXWqgOFs4phM
         PoZ8gPbmenJeXNHvqEx5XpXzKvSxePdXbMjuePNWqs9hxEKOxdtmK1PHBI9sqHCHkLIq
         28SOoBNWmn6Np/lfVzeV+WsPngwZ26yPB45TwgAFhHyGcbtdL9EFnTkSCfJLpbj6E9wr
         NY0SC1q87IQqJpJ2KMR6DVZd8P5RbgV2CnLCBGtb6DvLtFp3PCIqyiQmOrfXCtmZT6/N
         xM4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751443930; x=1752048730;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uy53KgmSlwJ+OJKWpNvJE3andfzWWOVCz+777PvTMw4=;
        b=GXePyJ4rEm1h7Zt3w2m+1LUbvCAXlvt5ybLWK9ENZK6LtRkTGRaYcN/re18z3nfAfD
         4GKdBWcihS/BijK9hNoM3nCxsCuxleItjf9GKf2xiXvIRDlKo1fXqaRlSzSZ8oqJvLpt
         FjucSOjPgXmHlxRQZzP0IQn64dhZ9zMK4ftrHDti6qY9r0tuku2gg25T9uWcF2AYX+2H
         fbmGobMfZJ77dn1seQZAj3NjXIeUcuoH9OLZip3TENOx9iUSH5eQu9+LP5pcFpPScm2H
         MvIVdIA2v2i9gP4XS7gxi3fhHtkXZMpPilegFboDHu/CA/s6Q4LajlD9PgfDcxzucPyN
         zhVA==
X-Forwarded-Encrypted: i=1; AJvYcCX8LbB4qAgKn8YdGwpiI4gZlwPzRuQzOfflyuGoueWGZVIpkVit5zSo+hmZryP3tuGDam12hg+ShaxnayU=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf46tGexlPha/6zj+5IVnfFWg1MaSPF/Kck6b2LS8Tz3UkJt/c
	bCbfoa9N2Ygj5vvF68WHt+W4diMPMiWpxyoTj7uWSEpkZgxJ9r3wjqKRx5vy4vlCWqY=
X-Gm-Gg: ASbGncsv9ARmSwdlgOGpn6qutRdz8tbjVqEWXuU+GiqXH5BiZuZRF6c9JX682ZCDdrg
	JxOIpNMDiCJukwG5Ib8K5StFW0v3lklei5ycO260wIZr+sVjO4joVGwk+LitAcJe2tA0w2hC0y7
	6gqz/AZG9IyStlR55BdnwviR872czwsQj4nMwuxlPS9Z1yrn7FTdR8LCK1qjymrmydjW8E+r2mO
	uDY2lNzp20CJB2rHX4NAeQkhCzCF3OL2hJ0rB67e4XQlS67Y/yCm6G9017azZMvpaqAXus92djc
	8ag+H680YJej6JNaS8H29hYT3B/8lv36mVxDAWprp6baccuIiWlfpD7z7z0NSB8=
X-Google-Smtp-Source: AGHT+IE7wcE0iwVAH1jLYj4z9nMQShh8CBuXC3Zk4EQNxjP7Cck5KCN98jBFqey7FxfNbCfChiLb2Q==
X-Received: by 2002:a17:903:3c6b:b0:234:9670:cc73 with SMTP id d9443c01a7336-23c6e490fc1mr32796355ad.5.1751443930566;
        Wed, 02 Jul 2025 01:12:10 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2e1bc3sm121786925ad.28.2025.07.02.01.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 01:12:10 -0700 (PDT)
Date: Wed, 2 Jul 2025 13:42:07 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: webgeek1234@gmail.com
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v5 3/3] cpufreq: tegra124: Allow building as a module
Message-ID: <20250702081207.bzru3mtl56ns372v@vireshk-i7>
References: <20250702-tegra124-cpufreq-v5-0-66ab3640a570@gmail.com>
 <20250702-tegra124-cpufreq-v5-3-66ab3640a570@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702-tegra124-cpufreq-v5-3-66ab3640a570@gmail.com>

On 02-07-25, 02:46, Aaron Kling via B4 Relay wrote:
> +static struct platform_device *platform_device;

Maybe initialize this to an error value...

> +static void __exit tegra_cpufreq_module_exit(void)
> +{
> +	if (platform_device && !IS_ERR(platform_device))

... and then this could be simplified ?

Or use !IS_ERR_OR_NULL .

-- 
viresh
