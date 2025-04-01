Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4551EB5C9
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 08:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743497488; cv=none; b=McpKObrQJtvfYKCiDFhjhb33qzu8Z/CdWrxhkdWdLjy9Q4IJAWroyLEkrrEtyTZT0c5R4efVsZWN9Y08YSjll0h2103yS/M6jRtynkagu0qv2ee9eanQMYCDW+V1FGLw/WxcgRGDlToOnzjX+muzP+UCeIbsFF4uo+UHy0ZP+2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743497488; c=relaxed/simple;
	bh=G99hNLJKz2dRSajkAKgFMaa6+sm7X49mSBNVSpQtIfI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fQ2Q+BIMARZTBF0jwuLttOGnatPo9yhCbs4O0D/XbS+N3RlYzLZ8BJmXRHoyNAhpk4WB1Oa5KZCZ55vrWZMWv8PbCzKYCmX/SpHZlC3J7cQlks0/HmlFBNWp9vcwMUMuxn87izuaLL8hQLwBm5DD1A5HdpYn+i1slwL/5ngehQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sXpaiDHU; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sXpaiDHU"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2241053582dso82901285ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 01:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743497486; x=1744102286; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ncijtObpu3H+yOpWt/VEJ921wbH0VWxIH+2QTCuuyAI=;
        b=sXpaiDHUV2ZGomiKl59LfW6ewNlNBYeJfERBHAqO/Hqlw+h7/UcrsAaxmpu4jmXZj3
         LdVSRBtnPtUV9lcQP1MUqC45yYVtrn+Kf1wYKpaKWIxhkZhKfHyMr91PBG7LOxvJ2SLm
         a1u9V80S/nnbr8n+P41vC6wYsd9gvGI2F/Z9pUv7najzk3dTaYlo3aqWATlfVWyA4zjV
         d+6hNdff3O8feWgqWKLRE8opSUua9zvS/TWXIW4Swv5SgIfThHL2E/AtkoaIrZqDxtKO
         LG6NkgcpFT3cg/BqUAB3rFbVWqyjnEHlAP9wOLGNcc3AFXGpub73p7Nk3zssJAJSY4Hn
         oSkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743497486; x=1744102286;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ncijtObpu3H+yOpWt/VEJ921wbH0VWxIH+2QTCuuyAI=;
        b=GM0qCMM4tiZ7tsbD2PFeQqpK+JussmHwIJKdJpDYgDTNewlms+TCjM0MRnftSNk9mn
         yHiFW1qfAx77U53KN6r52yRujRM6uLwrv4W8hLkWyfbEpWve2vZ8gXJbDx0BEKLw3rty
         d4vPM5ktFx9zCyc3LfunwArgQy5uodxW3zKFd2kUwOoPJomUtikbaya6/H0d5k3OGBCR
         JXtRaheDe0Y/4vFAqnTMixRBtX+Hzn4xkTRBDcVqIePxGD02ctn1zmk/6gVCCvl5Uviw
         NP/Pr+0Olk58T+U2L+t6Pv51n5mVqMZbJZvWk6p9E+Wsd1RMttsM0G7y1Abttffgt6Dd
         ZHFA==
X-Forwarded-Encrypted: i=1; AJvYcCUuzsXG/gFgkRiOi7HvSZvV1hniEsMZdPF0FH4ZR9hixFuvByqXXSHTcRkXGFFAxH0bl90VJ00G/vCnYXc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm9iABIBwlWm7/qIvi5WKZJ6/8LIBQmqkqaIBDwzOnkTgUnLDY
	CCW9tZw2j3t/JubzB8pB7BZcnc/qPt7rk1TEH2F7HIlGyn6ZB7W4KHeFNmZ0ghs=
X-Gm-Gg: ASbGncvveFWwd/1p+BLAfmNtgAdxU4Cr0aXQr/zTOSrmmP4i0EMzQX+vb6S1GUCbI2S
	DNtb/sYHYruvCowUenBWpf/vA8hkaW6Ld8YCTLMxnI/k9y4Q8f2z9/B4qSjivFvWFqj1eEh3I2r
	s0I7I9fw7WE6D7PvJ7tUa57YCnrQPpWtoE7eCI0XGvNe3iYMuiLC3PXxvPH9Jgn2dLX9ruH6zQE
	WsncwBwVckX8OrCJ5/I7v129y5F6ooqpUiSgGKLZBHClvZd5l548DS6R898pQDb91KO+8xNT7cM
	OdtwwpU5Sz/+0pBDTyukWTylx+GjhYeX63KQEinBxzpjC2S+g5MqqiBJ
X-Google-Smtp-Source: AGHT+IHgchxjNjfgbmWfX0yWlNGPZh3KlahObrW01+mzCOlyj2vk0k8E3QdDKBm62ZGwBUaavsQHwg==
X-Received: by 2002:a05:6a21:3a8a:b0:1ee:ef0b:7bf7 with SMTP id adf61e73a8af0-2009f640527mr17276648637.19.1743497486103;
        Tue, 01 Apr 2025 01:51:26 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af93b6a02cdsm6393119a12.26.2025.04.01.01.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 01:51:25 -0700 (PDT)
Date: Tue, 1 Apr 2025 14:21:23 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Linux PM <linux-pm@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH v1 09/10] cpufreq: Introduce cpufreq_policy_refresh()
Message-ID: <20250401085123.e6cr7nkmzoqzuptj@vireshk-i7>
References: <4651448.LvFx2qVVIh@rjwysocki.net>
 <6047110.MhkbZ0Pkbq@rjwysocki.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6047110.MhkbZ0Pkbq@rjwysocki.net>

On 28-03-25, 21:47, Rafael J. Wysocki wrote:
> From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> 
> Since cpufreq_update_limits() obtains a cpufreq policy pointer for the
> given CPU and reference counts the object pointed to by it, calling
> cpufreq_update_policy() from cpufreq_update_limits() is somewhat
> wasteful because that function calls cpufreq_cpu_get() on the same
> CPU again.
> 
> To avoid that unnecessary overhead, move the part of the code running
> under the policy rwsem from cpufreq_update_policy() to a new function
> called cpufreq_policy_refresh() and invoke that new function from
> both cpufreq_update_policy() and cpufreq_update_limits().
> 
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> ---
>  drivers/cpufreq/cpufreq.c |   31 ++++++++++++++++++-------------
>  1 file changed, 18 insertions(+), 13 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
