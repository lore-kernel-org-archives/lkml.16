Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C074207F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 08:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743496355; cv=none; b=rO06qNldLb3LKGK9pkWvIgdPa9BCnhogjDgoZtrrxMfOSFkZb3g8PIbD6M89pjtKYQjvQCrAumYm8dIuVPZwU5+MZyLnIQNM7fy2436yWUhfpcY89aMsZidRozLy8UfW+AVSGQQFPz2qXPhNzL2kmqGN+GFA0gM3ntDSiaG5xaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743496355; c=relaxed/simple;
	bh=+IeMsyYHgojZkFiAHUA5/qujZHsw48CXJaC75pqZO2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EWRl4p5lfHHzubYsDDOotQnYnTPQYEhpPsTC0sx2mUTyjax6syMttt5YpbBt5uoOXbfOzP2ojCfHyMvmx7iarNhESft2/SiP7SykDQmmZJoAb8mTVivmRSzd3WdSaWjsSzKr+qghvfe6KJpFNwkW2WnJBLE1lmTvqcz6LUAeXiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K3T/FrSm; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K3T/FrSm"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-227a8cdd241so14658465ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 01:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743496353; x=1744101153; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dNRcQhgu6XyiZbmSNQ5S9+29mIU+LPTMUt4TXKg2XTs=;
        b=K3T/FrSmTGXdXSFF+ti1KI2wxm1biUjXefI2f4v6l6mI2bFRiAbcY3wI5uaX1bqjgy
         h5nuZPHnFwxP21abBa1z5NHXAg7lItcFqcMeJc2bkuheT2wwVGcqSyg5tC7exlt3RJnh
         +jtaGTPPAvD1UmTdUz0JWEnG0XAA0JBQcLMED8atqZ9WFJzl/8kvcqhIO/C2uBeLqpaN
         vYS2Yl81tP9dNjawAKpKP7PJz99J7BTmD4qeGQJFYtm4UrXrHdi9aoz0yyVa4x+pwlDW
         BrvXIYnjNmurImZ1cI3AJ/8qumDX4G3OnbxWIpM+VPnrmakJhtZEjOEp8Jo3W1H6Z+BM
         EDWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743496353; x=1744101153;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dNRcQhgu6XyiZbmSNQ5S9+29mIU+LPTMUt4TXKg2XTs=;
        b=JPtyZ1C6skEw2xW/0eE0FB/kugK+RflLn6PMjMITcyROiHpNHmJs8Qf1rk9BcVTR7Z
         0peJVjM3ktEntZLP5mJWSJCyOeLiRF+mA39CMz/kD2KB+hcEZUUjlMKOVTVBWoKF5/q/
         hC6SqQMkB0eJxRLpaH5yJX+j32+56rpvUApX450craC01b55ktK0HrEDFwPxJYQmqdyU
         fgqczsqXCo8xC3DychD+iSmXBHxZiEFptD6M99yOWzic6Ax5N1pNMkAhXLSVx7FWE+pq
         F4zr9QRnfGcLGbMY+mBcDGQAxkbe0MArHzKEVmCAoj3/vav4CAOswvATjsZquBknPDJo
         neLA==
X-Forwarded-Encrypted: i=1; AJvYcCXmQQ7T3D0NEBWz8ElSMMtc5s8XwJNfYv+dwru/SnsphefZ8SggvdASc+TYAeuSXUTeiEL0VsybNUPlVhw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxjsx02u0za02DE99TMy7t7lHA52CTjVjSr8ZLjkW+yurY7D+2l
	WVdBSXnFPRlPzqpDo9elsQ/NTkQuWrsoxRHvWrAIYwQc41IOC/lZIY4NG24jJtY=
X-Gm-Gg: ASbGncu11u5pE2+qV5ZVg4TcnZiNDBnkB586W31s+d+V1Lx+5KTQCQSiToWorLpXoQF
	d6O948sbvMOxKE/LL8qMTqAEEPrUB/Cj2uhoUAkBzCMzg3y7RyDu2i8c2LgAgXZ1xMl+eBh0C/Z
	Ern/L+b21Vd5b7e4KkhdPkBx56WSpy3PJfy96N1QWvmTgfJeTJtpxeNMAxQIrT6FuTP+4j20w5S
	mdxVn9dtG3BfQv3JDNVvC3r/RKqSOsuTngeVFTwkfTMftyLUlpG9FeTOU9objwFYj9nO/oyTqNR
	JnAli7GAmRi9NKV9oX4sTWIqbrY0K1VEQ5HdK+EXE4HqRa9iVPlKSspZ
X-Google-Smtp-Source: AGHT+IGgKUaL1ynzc20b9V1SBaeeBQH7RLhiudbNEW7GcnbbKKQ8W4iTXsHvc0b1mnlkIF4F16wd5w==
X-Received: by 2002:a05:6a20:d501:b0:1f5:889c:3cbd with SMTP id adf61e73a8af0-2009f7ee1e5mr21700143637.35.1743496352943;
        Tue, 01 Apr 2025 01:32:32 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af93ba190f2sm7594922a12.70.2025.04.01.01.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 01:32:32 -0700 (PDT)
Date: Tue, 1 Apr 2025 14:02:30 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Linux PM <linux-pm@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH v1 02/10] cpufreq: Consolidate some code in
 cpufreq_online()
Message-ID: <20250401083230.zkqy3i4uo3yeyw76@vireshk-i7>
References: <4651448.LvFx2qVVIh@rjwysocki.net>
 <13741234.uLZWGnKmhe@rjwysocki.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13741234.uLZWGnKmhe@rjwysocki.net>

On 28-03-25, 21:40, Rafael J. Wysocki wrote:
> From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> 
> Notice that the policy->cpu update in cpufreq_policy_alloc() can be
> moved to cpufreq_online() and then it can be carried out under the
> policy rwsem, along with the clearing of policy->governor (unnecessary
> in the "new policy" code branch, but also not harmful).  If this is
> done, the bottom parts of the "if (policy)" branches become identical
> and they can be collapsed and moved below the conditional.
> 
> Modify the code accordingly which makes it somewhat easier to follow.
> 
> No intentional functional impact.
> 
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> ---
>  drivers/cpufreq/cpufreq.c |   10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> --- a/drivers/cpufreq/cpufreq.c
> +++ b/drivers/cpufreq/cpufreq.c
> @@ -1306,7 +1306,6 @@
>  	init_waitqueue_head(&policy->transition_wait);
>  	INIT_WORK(&policy->update, handle_update);
>  
> -	policy->cpu = cpu;
>  	return policy;
>  
>  err_min_qos_notifier:
> @@ -1394,17 +1393,18 @@
>  
>  		/* This is the only online CPU for the policy.  Start over. */
>  		new_policy = false;
> -		down_write(&policy->rwsem);
> -		policy->cpu = cpu;
> -		policy->governor = NULL;
>  	} else {
>  		new_policy = true;
>  		policy = cpufreq_policy_alloc(cpu);
>  		if (!policy)
>  			return -ENOMEM;
> -		down_write(&policy->rwsem);
>  	}
>  
> +	down_write(&policy->rwsem);
> +
> +	policy->cpu = cpu;
> +	policy->governor = NULL;
> +
>  	if (!new_policy && cpufreq_driver->online) {
>  		/* Recover policy->cpus using related_cpus */
>  		cpumask_copy(policy->cpus, policy->related_cpus);

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
