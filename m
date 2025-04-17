Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B9717A2E5
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 04:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744864265; cv=none; b=aPJhDH00seNPvEJHVZ6N+/Nus3qx4XBCmjUtVyMVJExBRRQCT3aRRZiVI3+gEGbWLKmGgyC5zxZob+qZeSIQdeCu7HtZM9yqa43adyU8uuJax24BDchD8CpKwp8TXD1m00KAeoOUYQHSJ4MQ1xoXAqtpHc7cDhMt/kc8htAvJLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744864265; c=relaxed/simple;
	bh=+sk7hb8P47bWgI1AKQvmM/ONosvVBAHXLTSOV6y0dT8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CeHXKpYf1nZduzc54TY6p+cf96TZRH9q/JVA8cTXEBKK/tWeej6TfsCR/asZ8kPDBJ9Z5WdXqbmGwf5NWPGzfus7n68UailKOwEdhTl4UQ1lECgNrI/SVs3Rgqx3K8HH6nhTDinVXstQrMqIXyCJQSc5ZVn6rzvxXU6v/VZ5Dek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Sk4wdvgL; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Sk4wdvgL"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so272320b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 21:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744864263; x=1745469063; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZlaUAntWl+FAG4ssmQ8ExU+LE+kWPisBX4TPYFCKWz8=;
        b=Sk4wdvgLxh7t8CnDvpPrsGOBwWqDUGeCuhEaERDm0wi+2YMM9Ddou6atk9/CW2vwjs
         yYsQFzViefx/70pcNDEnWx8s93az7hA24r6uGwr5aj5BdYf5Dx0+pcDANpelOrjzwrSw
         wByuo35f1in7gBts/M+sebAu4lfHEEO8EQyT8VdIxRTxA6ZdaYxlpnWzbY9IgZrSLs9v
         wXnhC+v0V0sd6kY5ofbbV6hy+Aw/zhD52xwL2Zq050VYUgxcrtz8L3blXzLvAHQ7MUys
         GxEQFFXU2lOH9Zgh8e4NM4ROsR6c1tjHGhyPOmH4jeZvqgU3x9+6qMTk22o1kTCJ/vKB
         KPpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744864263; x=1745469063;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZlaUAntWl+FAG4ssmQ8ExU+LE+kWPisBX4TPYFCKWz8=;
        b=DWLtsxN2FtwuxvUxiEcJcFS/tdewDd48qyDkXPaotO4Z0HGKP9KcW5QhUOiv7CyZtx
         HYC9uLBT8EiQ32oQuKHZyMGRKdWsc5064MTM3cc7KXOY6dPQKsEyJGLs2t2jszBhJIY4
         tIFYnIbSBKdzdCi/CclltOH/H+q32Ux/MWX3hZB3UZd8ZZcdotvCaLbSF3VbWEAtZtLY
         aDEowDGkzIFitDiipcIHg/NuSE1iwG1PfnRQvC4dDckZmTORI6f2e/Hyw+DhqiKPwoBQ
         SOXrPui/hONuCSZEs3V5XxMlSujcKFeYg5TE3pRJffPSMRdYMYtPtXjkOI9HiiY5L2s/
         VlzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnFbJBfSdyAhenPeMyF67AW6LrxxzaJx/aM+5YVebRWPxs80Oua7uahD3h6BeZjwj8iJCFeCHmI/eMnqw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKPSa7MZY3XAUIZrNfMibc/9I7Se5EZ0LSPTDTW8w8AFxG+H01
	PuEmd/YGElIXwmlMMDnl76VUjHC6g2Dbk+hrbVfQ7cioIK8ilwMeh6EDI+/Kbo0=
X-Gm-Gg: ASbGnctcShsuEMBcE8M2WyFi0WYZefDoUjNw9PTY2Oms7LOlbx2tLurRl1oLs9A5gHI
	xsfwRBArFhX3YH0d591pYdhtb8jqwduiClpyQBtxJdk2y5exq12DvaPBo+DxHxddfzXqk5PcGE3
	ayGKmPXptpu+6jm+k+QMTeY+O6Vb0egUCnCDjWkWWUTGQ/tJffJ4HAaeeQQ6cpFInaSilCsBpbW
	WcbkqL9W6COcK5O4pMJTgqwZ/kEHn5v5OdghOYYrnu2rRT53hELCXC58oKoczyQkhBTHMX4ywAn
	BvsMp/Dfl6ZmL+ck5Ql1eokhW03BPmbOHeGaR0Trzw==
X-Google-Smtp-Source: AGHT+IEg1IOSKx3TC5x7KXjPRVc1J+SeCE9LoLwfSMtCe4XckXlEc0yAzy5LghooDosu7gaIzIG1lQ==
X-Received: by 2002:a05:6a00:240c:b0:736:a8db:93bb with SMTP id d2e1a72fcca58-73c266b9927mr6133644b3a.5.1744864262953;
        Wed, 16 Apr 2025 21:31:02 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd22f120csm11306099b3a.85.2025.04.16.21.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 21:31:02 -0700 (PDT)
Date: Thu, 17 Apr 2025 10:01:00 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Linux PM <linux-pm@vger.kernel.org>,
	Christian Loehle <christian.loehle@arm.com>,
	LKML <linux-kernel@vger.kernel.org>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Sultan Alsawaf <sultan@kerneltoast.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Valentin Schneider <vschneid@redhat.com>,
	Ingo Molnar <mingo@redhat.com>
Subject: Re: [PATCH v3] cpufreq: Avoid using inconsistent policy->min and
 policy->max
Message-ID: <20250417043100.dq6yw4ktbimms2au@vireshk-i7>
References: <5907080.DvuYhMxLoT@rjwysocki.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5907080.DvuYhMxLoT@rjwysocki.net>

On 16-04-25, 16:12, Rafael J. Wysocki wrote:
> From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> 
> Since cpufreq_driver_resolve_freq() can run in parallel with
> cpufreq_set_policy() and there is no synchronization between them,
> the former may access policy->min and policy->max while the latter
> is updating them and it may see intermediate values of them due
> to the way the update is carried out.  Also the compiler is free
> to apply any optimizations it wants both to the stores in
> cpufreq_set_policy() and to the loads in cpufreq_driver_resolve_freq()
> which may result in additional inconsistencies.
> 
> To address this, use WRITE_ONCE() when updating policy->min and
> policy->max in cpufreq_set_policy() and use READ_ONCE() for reading
> them in cpufreq_driver_resolve_freq().  Moreover, rearrange the update
> in cpufreq_set_policy() to avoid storing intermediate values in
> policy->min and policy->max with the help of the observation that
> their new values are expected to be properly ordered upfront.
> 
> Also modify cpufreq_driver_resolve_freq() to take the possible reverse
> ordering of policy->min and policy->max, which may happen depending on
> the ordering of operations when this function and cpufreq_set_policy()
> run concurrently, into account by always honoring the max when it
> turns out to be less than the min (in case it comes from thermal
> throttling or similar).
> 
> Fixes: 151717690694 ("cpufreq: Make policy min/max hard requirements")
> Cc: 5.16+ <stable@vger.kernel.org> # 5.16+
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> ---
> 
> This replaces the last 3 patches in
> 
> https://lore.kernel.org/linux-pm/6171293.lOV4Wx5bFT@rjwysocki.net/
> 
> v2 -> v3:
>    * Fold 3 patches into one.
>    * Drop an unrelated white space fixup change.
>    * Fix a typo in a comment (Christian).
> 
> v1 -> v2: Cosmetic changes
> 
> ---
>  drivers/cpufreq/cpufreq.c |   32 +++++++++++++++++++++++++-------
>  1 file changed, 25 insertions(+), 7 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
