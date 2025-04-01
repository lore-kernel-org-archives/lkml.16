Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F2B1DA617
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 08:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743496218; cv=none; b=h+MTwrEnB7Py3hsQQEpYFWxR8G2ouxx6zpjF/YIevwwvfuDv9cvT/frqTChoyfsg+T80rWVVdIVBCiCz69fv/vfipzH6fj0chtO76E26caqeW7xKShEatKgKX/SzFHf85NHQvqc3a8eMT72wava5G9yWE2YwaXw7VCjq5gAGPrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743496218; c=relaxed/simple;
	bh=+PdOQY9G4Z+V6nM+cOHShiUAWSWzkcANFdjWh390aHk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QQotHt1x0ZY+h5eAxiHj1J04YF8tcDazlgqYQdbv6jTmJZOOjnGNa+UdjDSJGgc2PMJ0qKdUbjCc/RGWpFsRN+T5p6YaTHAWoieDjI2UNBLnlXH48etxZKFj5k3gCu+WgcWV31ynww8k5W+qcC5v2EJF8IzGUztzhqNXoci6/1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RdB9YS7V; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RdB9YS7V"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-227cf12df27so74571285ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 01:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743496215; x=1744101015; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NVkJHao0eWoC+KfJ0cgjojVWmT2IzBUFiYW5OYDGp1w=;
        b=RdB9YS7VqY2nHJqeUpRh2TAMJKw4VGicu5mNDVuCviRPu1ma2upOejqYQUai7YNQY0
         K7ZUM8y/Xb0qDyUGFRhnANWqfKc+7SO4CQxkhNUNSM15A7gCoRKtIVNufogbjd67JKut
         V2QfKHo3GPLfQCmGtnD/59vwl+1mpC67Oz22wCugFxd9vamJ16rC1rzP/2OTSWLLEGL4
         r1Cc5rrobh1juqPBNNWkrWkC78q6Q+W9kIxVHFf4r6iEkpU7aE1VgIo82jnp0nCz2hqe
         OVl3zCm8QtuzbfiaU5WRuwug4c2WOM8uYV8vmMHHD7AwGyVMIpZ1u5FVYDICuuxO5VDV
         08aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743496215; x=1744101015;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NVkJHao0eWoC+KfJ0cgjojVWmT2IzBUFiYW5OYDGp1w=;
        b=jF29YnHmj1EvWZ0R8Y+3zRq5Pyjuaie1Nn7M1xuk+hMgUjHmvVkj/pFzw0sSmpaEQy
         7oApMuDufyMxn/iNLb/hcZgkF/YoSNsNPBFPuub3WJlkv4XcGYn7lP+xV6YxiIRLpLJ1
         G2V38I8g4r51KilfTytGjHsdwi/xtDKZD1kfDVslSQDNpR4lYuMbe/qi7WpdyxUIN/tX
         13ezMDczVmCA3C+VFar6dDt3df1JKodU2tMfByPb9Mtad+YV9SB3rEk9kIssAeYEDAob
         E6PUkj/pv3WkwsxucCx0BnfNHjNMH9Nki/hwqTQg4FgXE/VQRtvmh2HBFEuFf0v4tlpT
         SAlg==
X-Forwarded-Encrypted: i=1; AJvYcCU7hNil9y1ng16m2YB/uAAbWzs7Y9cosEnUSX9X16+/iDxEWSCBpdfd6cGPGwKCwZXOP/48l26lFq0AgIg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwGeROH6FXD34p4Fykn+DCzqgK8EUn98jV2UZi9LlIpkpBMPlH
	EcWr8NkuU2epMoVq9gmt8eMByYbwoxoLmWDbf3ArAiaQgGOfFQdgNVMVWCQfjnw=
X-Gm-Gg: ASbGncucxDcTE5dm8WcEMhgf2PEZJ9G6eGa57QRsAgzAwjD8v9jMpzxQMksFz++UACk
	2ysRXIf+q1IT7QxRN0c4zlTPaanl2Z+pmFFAcMnoPqyR8z9kgtxsp8apoAuWTBD0gOUf31WCivZ
	QVH+L4/cVsiIlm4MrS9pIuvC9gsSJd5dUaB+HUCYwl1k3VbbwjlPGk3pIvyJiaQTTCvzwCUyhp5
	Sz+0qegJJJfjxJJKu7p2EuKLA28Ty47YCl8CXU8rPgJTASKI5kQOQJgwe3J/dWzFy1eP82JrwRL
	FdWRI8kuXcggVBFRjMnjLgBw5maVT1wWl78xfE0eVQsll4Y/3fz/Gito
X-Google-Smtp-Source: AGHT+IFcco3jmVd5+UMh72jl4ZYzaglj69gHooBlOcDmi7HxtLW7NW9Xm2Hy0zPWOtCvcc2s0O+1tg==
X-Received: by 2002:a17:903:40cc:b0:21f:40de:ae4e with SMTP id d9443c01a7336-2292ee6363dmr168754105ad.9.1743496215410;
        Tue, 01 Apr 2025 01:30:15 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1df12csm82615935ad.191.2025.04.01.01.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 01:30:14 -0700 (PDT)
Date: Tue, 1 Apr 2025 14:00:12 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Linux PM <linux-pm@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v1 01/10] cpufreq: Reference count policy in
 cpufreq_update_limits()
Message-ID: <20250401083012.vjwkxjkmd5afyqjt@vireshk-i7>
References: <4651448.LvFx2qVVIh@rjwysocki.net>
 <1928789.tdWV9SEqCh@rjwysocki.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1928789.tdWV9SEqCh@rjwysocki.net>

On 28-03-25, 21:39, Rafael J. Wysocki wrote:
> From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> 
> Since acpi_processor_notify() can be called before registering a cpufreq
> driver or even in cases when a cpufreq driver is not registered at all,
> cpufreq_update_limits() needs to check if a cpufreq driver is present
> and prevent it from being unregistered.
> 
> For this purpose, make it call cpufreq_cpu_get() to obtain a cpufreq
> policy pointer for the given CPU and reference count the corresponding
> policy object, if present.
> 
> Fixes: 5a25e3f7cc53 ("cpufreq: intel_pstate: Driver-specific handling of _PPC updates")
> Closes: https://lore.kernel.org/linux-acpi/Z-ShAR59cTow0KcR@mail-itl
> Reporetd-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com> 
> Cc: All applicable <stable@vger.kernel.org>
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> ---
>  drivers/cpufreq/cpufreq.c |    6 ++++++
>  1 file changed, 6 insertions(+)
> 
> --- a/drivers/cpufreq/cpufreq.c
> +++ b/drivers/cpufreq/cpufreq.c
> @@ -2781,6 +2781,12 @@
>   */
>  void cpufreq_update_limits(unsigned int cpu)
>  {
> +	struct cpufreq_policy *policy __free(put_cpufreq_policy);
> +
> +	policy = cpufreq_cpu_get(cpu);
> +	if (!policy)
> +		return;
> +
>  	if (cpufreq_driver->update_limits)
>  		cpufreq_driver->update_limits(cpu);
>  	else

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
