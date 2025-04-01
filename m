Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18E81EB5FF
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 08:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743497190; cv=none; b=VdcWnA3rAtEK+tIsiLRcJmN+zBhL6AUwFUFjYgTbyE/ELjIRtqTb7Uqvm/tHqTbqzw6oZ4kNTUlDUseXIbvU1ra0r8xTw8xRs/H6Pcr/qKC5Z4R3oeVOnRPYQK4tq0uAOxduhTxVfMB1iSKnOYRmrf4Do/Ulk/jK9aLAbDF2IKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743497190; c=relaxed/simple;
	bh=jYTMleR7Ay+QQ7lAUsFQ64KOu1yivaOup+V8UXlNpz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bS/174Mhth+naiTdifqlZ3SG+w/4EauqZo6QqjIQdMor1iVQ3kYk4vx9O+Yk7UxpQZ9d86YUJyL+GWyU87oChhwF+f+syJS5rDyixqQDJYNjffhmIdKYBEwwQJGqzoWtEFpav8AoFILAciwJ2qKyq/CCt7YF9QQ3ApykDtU8FBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kRleiFrJ; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kRleiFrJ"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-227914acd20so94508335ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 01:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743497188; x=1744101988; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XozM0CCyV10lC+wImIi1YcJS/akvrYLRSmneKXC6Cy0=;
        b=kRleiFrJHbPtNQwzYLtTVQAI4LrtxfZwDIWRCpOAYzSF7q5X8YVU88qG+z1hLtAAP0
         r8oBAhy1aUOceip2O5RNlLObyvGgpxVAxRZ3c9gZTE2Xp+xycqu4Y277BdvymZNStIOW
         gL09G2rknZxEr36r8ydHiAQ/0LR1fj/4qOCPC+ECvqlHAN9vRkmlq0bfw0AniE/VvlLi
         gp8xi2dy/I9h0Blyn9FG1OggirRlOAj8rISYwG8rvkrSrTqKzJlzDLeYCFXDYBHBrurS
         u+krl7wH/eariQrZMDU2S1XQEe4NGIHFFlciStYMea83J7Zyu5Ns8aqmduoDrxQQ7Eb3
         uRkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743497188; x=1744101988;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XozM0CCyV10lC+wImIi1YcJS/akvrYLRSmneKXC6Cy0=;
        b=f9mBQkwst95hKjqePZdx6d8EEQc+a0OFd4TEohEE4dBsBGBJgQZe88a1H63f3lm3XV
         u1+pUOU7u25IOIs3wkA1zLlwDip8ZH/T7zPEpnOANBEiErKbcIcvR5zUew+mIQCrSmJH
         M52tLSjx8fR788KEv/5MR6GiSKFFQmzigDW4MdWIn413YlTc7a7AIXZA7suYL0Uc4Umo
         WQp3LK35Z06KVmG/+NOAjWYES59m7QxNXGPaUraOoipL6iCe52BhHO+JUUMhw8CG8cm/
         MK+xPDF68ReX+HR+FpNvynOrksANewUG7Ebv2uAN5ZpxMrvGwLJcIXFx85gHIOMYsvbE
         T+qw==
X-Forwarded-Encrypted: i=1; AJvYcCXuOsP0BelExHDbAnKKr3JVRIbCb0vCIBbhNhmhvQR3o9c6iUqJ4sqg3Gmcu5CAyQfBhESE6aYOaXw5YN8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhi1FZ1LwVJDV/fF7t5isBk5JjWIYSGOZuwmxK4HSD3j27FNUE
	1SWvnvcekQEjSmUeGPH79Y95BYBbIMo49VKiJI576KkWlFNbJKwFDpp6JTQtBY8=
X-Gm-Gg: ASbGncuqMcSP/ofJ7NR5IsdaLV4k0RNlYkKqKOJm4c+eGU7MKqo4zdUxX1SEfH8NDQa
	Yt652JYyVDEg+iBkFUiMER3xFilI68hYT/vgB6EFY5eyoIWAjzv+6lsTL1ZhqWs8rlT3jJVQ2Ai
	mhOZAFiLUYTKBAN3idDmqhKwG+mrB6bOzGfBVFvcbRZh5F4IXJ9mmF+PKGg+yX5Up030DyUjzc7
	PcdWZehzLKr7bo8PXYpYIcVnJk1LRMBE7y9YJFVdgKfd05EWCYYDQa3mchl8J75j7qkHV5STEQB
	fGseXVMtrZKQZahY4lRh21ETpluiSq6uykQeokxEJ1hYhw==
X-Google-Smtp-Source: AGHT+IGTR4wfStg9S5pIl9j/JxdC5b+eTT2mPr3uguseLR8curBfhIHr6YRDgq9NQTeIEzJFW6BzNA==
X-Received: by 2002:a05:6a20:3d81:b0:1ee:c830:abdc with SMTP id adf61e73a8af0-1feb5cd5886mr23599755637.15.1743497188314;
        Tue, 01 Apr 2025 01:46:28 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af93ba10da3sm7579145a12.66.2025.04.01.01.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 01:46:27 -0700 (PDT)
Date: Tue, 1 Apr 2025 14:16:25 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Linux PM <linux-pm@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH v1 06/10] cpufreq: Use locking guard and __free() in
 cpufreq_update_policy()
Message-ID: <20250401084625.345sbknbhslzagzu@vireshk-i7>
References: <4651448.LvFx2qVVIh@rjwysocki.net>
 <22654186.EfDdHjke4D@rjwysocki.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22654186.EfDdHjke4D@rjwysocki.net>

On 28-03-25, 21:44, Rafael J. Wysocki wrote:
> From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> 
> Instead of using cpufreq_cpu_acquire() and cpufreq_cpu_release() in
> cpufreq_update_policy(), which is the last user of these functions,
> make it use __free() for policy reference counting cleanup and the
> "write" locking guard for policy locking.
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
> @@ -2752,23 +2752,23 @@
>   */
>  void cpufreq_update_policy(unsigned int cpu)
>  {
> -	struct cpufreq_policy *policy = cpufreq_cpu_acquire(cpu);
> +	struct cpufreq_policy *policy __free(put_cpufreq_policy);
>  
> +	policy = cpufreq_cpu_get(cpu);
>  	if (!policy)
>  		return;
>  
> +	guard(cpufreq_policy_write)(policy);
> +
>  	/*
>  	 * BIOS might change freq behind our back
>  	 * -> ask driver for current freq and notify governors about a change
>  	 */
>  	if (cpufreq_driver->get && has_target() &&
>  	    (cpufreq_suspended || WARN_ON(!cpufreq_verify_current_freq(policy, false))))
> -		goto unlock;
> +		return;
>  
>  	refresh_frequency_limits(policy);
> -
> -unlock:
> -	cpufreq_cpu_release(policy);

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
