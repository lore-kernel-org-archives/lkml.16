Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E869A2135CB
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 10:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747824517; cv=none; b=ZEbBkY6d5sRYOqAGpmPIDeiC9aWUm8HpI4kKtdKtgcH8l206ZtFdZzD4cgNHH2CBCdussXXJPhx8iaBY5ahS9SN2YrYWJZQTderK3Xs4ljeieVJOvh6bPomp9h8uCkEld0ewUZSuz3G88YlC9h1EKTKymw/BgqIGZZ5rU4Qyf1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747824517; c=relaxed/simple;
	bh=zPVzcQ0wTxrrLosGxnFrsJYeTgPP4pLFOuxsLK0tQi4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U0/NAmcptCIhkKuaojTGvJKh/eX28dvlY2mayuI+221TAJmE7e/vrJIPAtvNDpSH0DSuv81Xt2VoX4WVHKXm3G0edzYW93gZDspFb/47uJlUhw7YPFUVOTp19EeVOx3Cxprzt+zh6hciLxc99Z314EyVzhXxAdRDhTQ4Ijq/aAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TWmo0PFb; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TWmo0PFb"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b26c5fd40a9so6134631a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 03:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747824514; x=1748429314; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KCVWhmhVUwvSreyj85yNDnhSC1O4ImPSH+cKpWIfIvs=;
        b=TWmo0PFbGW/+u+YBHCF0aIFcD79Rxb6H/XY7PWwXeUbdec5sxkaJvoyXvyXr+lT+Vt
         xmOc4laQaTr/iPFU2fdf56pr/sHvDM0Xk2Oxr89sswftvo/viMQDgyGL5MirLcsSKrRI
         0zAEIdHpxD1gNVWwvWFUXrECi6P+tkwI4qBay4zmlEg08chOHHuNYXqykR6iVpE9zXn9
         2v3A0+bgfjm+PjYXOT2g7A7IhJwDIUJCoWKrlkIhbjdaQcIuKVWEKZLUNlKsDlEvBuvl
         b1IJ8bLihi6PqIpAkb5+Li4l99bv+kizHXQkPRuTbIz34SKps6Hg7c0V3oTdmltl+NdA
         gSpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747824514; x=1748429314;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KCVWhmhVUwvSreyj85yNDnhSC1O4ImPSH+cKpWIfIvs=;
        b=ICu5naJ1ZhDHC26RTgL0HhOUQqZ/U0yfcbJCIkjum1FPNX1H1p3K33TSZFAIY0ZTz7
         nCHBunQsmRnEcSFiINpLWClIKocqli2NmZ5tEYd3PEAPgqVtjlrO/D3nhMTTurD69urO
         lBWIWgoYVRykJGcH2H2EzEVKkFQ8RXG4b7AqPGVdoA8wZd026dK1faHjQnyJRLX6hMRi
         dT9MH9KKqAA1araLduD8dSX2alfhQSoFQy2RhS3lvJL2+05al+xDETUiavJo4k+5jN+5
         jcQwq9u5ItUsMuRq/l52F3PXAs15T5s2rDao4/WHcPbBXZzFgQiUqrkkyDiWkJicvqFf
         K9Wg==
X-Forwarded-Encrypted: i=1; AJvYcCXKahF7m3PQ3gHuT13PYn6BwPQXklR+2VUvJYmIvi9fxrZmj4BfqeejglmdOCMyhPxgHNbgb/tIeWa7bcA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQmPAoiuScknZZ8SK9qiOZnTd2S8mocy/zV+Gxy7ezajGyzbqL
	dq6EDvWjbUHFxlMikUT9FEOUNWJ7YmXi5eqegNrEyaMK604iziocfXcIo9nWrPiPhaM=
X-Gm-Gg: ASbGnctWrabFA7AJiY1L0Fp7A8txPyi5UwjmwFCtyn1iX3CqxDne0qOY2+jG70eyupv
	FHb5X157cuoq2LVp6glnkjelB35Mx8SxTDgS+PGaVjuGdx0bhCMrd5zsHbj9qRYwg5dV98D6JFi
	NMbPC2dr9EhITvIRtD3VzN3aQwih24hmODniwSKsarvr4h5HaImEs0T1uNKaf/90L85XVkMGO/e
	peJeH9dpMnrPhoSeApXnczWOb9LCeOl95QV6GA6VlGT/fRNZ61kxvjt/RGb8nHuUtNZOdpgz7UI
	1U1vCPJDsXz5mFY32McPKY2aZZ7SIoiC565+ejFojFY/nXB7sTfq
X-Google-Smtp-Source: AGHT+IGdd5dXeRvluDlCSAr/KcDBCCa0Jpvf2y620qpFkldBXh7b0d+mATtYjpGqsll1Ytp7og51QA==
X-Received: by 2002:a17:903:2ec3:b0:215:a2f4:d4ab with SMTP id d9443c01a7336-231d4b05c54mr265369065ad.7.1747824514174;
        Wed, 21 May 2025 03:48:34 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ac94a0sm90907755ad.2.2025.05.21.03.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 03:48:33 -0700 (PDT)
Date: Wed, 21 May 2025 16:18:31 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: rafael@kernel.org, Sumit Gupta <sumitg@nvidia.com>
Cc: Lifeng Zheng <zhenglifeng1@huawei.com>, pierre.gondois@arm.com,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linuxarm@huawei.com, mario.limonciello@amd.com,
	yumpusamongus@gmail.com, srinivas.pandruvada@linux.intel.com,
	jonathan.cameron@huawei.com, zhanjie9@hisilicon.com,
	lihuisong@huawei.com, cenxinghai@h-partners.com,
	yubowen8@huawei.com, hepeng68@huawei.com,
	linux-tegra <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH] cpufreq: CPPC: Support for autonomous selection in
 cppc_cpufreq
Message-ID: <20250521104831.6a3qfhzrwf2mcnyu@vireshk-i7>
References: <20250507031941.2812701-1-zhenglifeng1@huawei.com>
 <98c87824-2c77-4ae3-b466-badd8e8187ad@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <98c87824-2c77-4ae3-b466-badd8e8187ad@nvidia.com>

On 21-05-25, 16:13, Sumit Gupta wrote:
> 
> 
> On 07/05/25 08:49, Lifeng Zheng wrote:
> > External email: Use caution opening links or attachments
> > 
> > 
> > Add sysfs interfaces for CPPC autonomous selection in the cppc_cpufreq
> > driver.
> > 
> > Signed-off-by: Lifeng Zheng <zhenglifeng1@huawei.com>
> 
> Looks good to me.
> 
> Reviewed-by: Sumit Gupta <sumitg@nvidia.com>

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

Rafael, since I have already sent the pull request, can you please
take it directly ? Thanks.

-- 
viresh
