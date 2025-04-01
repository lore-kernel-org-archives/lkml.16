Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E751E9B3B
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 08:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743496739; cv=none; b=cgVQvTEqcFLcqP+Dq2MSCBJke9bbfERlsl9rOWZ2Sd+43zVr9fVnscUh+fn0ak+k7ihh7LuGI5bnQDzqLc2E4fC77p9kpTFTA17UuOitzo6L/Yvd1Zvmn4+tXsaUZ+ebyEKA3IQLp7kPSiZCEk5RokmGeBkaLl/7jvVfjgxI+zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743496739; c=relaxed/simple;
	bh=+UMzpq3/VcMiqNxd76Kwpr680rC1FTuJOdadFsqvWtY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o/6ru+fd3vmaS+JLMpcKMTiy0z+dlsTczeaBBFKBbv1l7Nv0uh/ThlOqLCGlXQh1A/Co8vZ1ZIHpSmRtmOrURZIDW+QkVpoZyXSydRtyeD9pfa+oNMtrbOyP1WY3LEUjR7QPKDEy88HAMB4EYQmlQVDkxCRN3lrukOIgmMxFOOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Iecj2nKx; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Iecj2nKx"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-224171d6826so75958445ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 01:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743496737; x=1744101537; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r1Taw2b+9DYZnr4u5cKg6Ys1jliSkhsn+4gby7I7olg=;
        b=Iecj2nKx7pkwL6a5nvqnukg+FoyHOcwq1tiLJ8Bz1wnTCZahtFRXcOPBqFURSk+MA/
         FUSv6rKaKe3INIi76xAW0FLT79lXxY+QvZm+ohOuHMRL9/J194KSffnYAsI1VL4oUtSQ
         FzC8mHapRhUhKM/m0j1K52W78R8nAtsrbIM7357y0K0RLBd6z1r2OfuLf/AxpzwUdsDj
         ua2QmMnAvAFc2Lb5Z32HSwjtdd3BIcjh8AHvoYk4g/f4FAIoV+cnt9AfLojkMjJ79wix
         K+koxcn/CdRaCAeq3dmoXNHavu9LhMTFnxFsAzfDck2qu9+PuPJMR/DVI9vhlO1QQO9a
         XJ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743496737; x=1744101537;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r1Taw2b+9DYZnr4u5cKg6Ys1jliSkhsn+4gby7I7olg=;
        b=oHTQ0Hd982DuXcuSRHSt3/bD9e341tF4AZ90re4du2vPQV/oD7Ja2mM6Nofte31uXf
         dF9eyTzMoK5LUjUo9Bfj1WvxO3qfpMXrxkYff0KX6Ie5y6v7d3gZVcpdzp27dhe2zguP
         H3dTeOrjc7vum6Nf2Cw4YC/Dn6zNR2PTL4qrLB7xsqeY8iTclvtF/+kndVHTjbvLssrL
         I7w2Jkq9mkMSAmiJjm2Ow0u8/DDJVpv8X6gjPI0fBqX4m2D4Sdz+dxaKjB1HYesZOSzK
         Q7GMDE5X0JbvkE9lLXm7mJDwQIff6WuDq2HsX6PEs73Hqr7HzFFnqnXnaQnr9JVKIfnQ
         X8Tg==
X-Forwarded-Encrypted: i=1; AJvYcCVo8Xit2x0o1OKME3N40mCixgyhdECeMwWvI1fGVsAuLpEO4Pw3Mdc4Ti5bBUGa0w//u3WzxFsk31YHu/Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy00S575WyW/NJXyI+bu9ETI40OCt5O1/4EPWoLGVwh6qGZABDB
	xOEtxYYzOXTAGLN1HUoErTl0xu/H3UasPK8K/1bG8ikAVNrdXTRHuP8+VPtDt40=
X-Gm-Gg: ASbGncsfr2mKHMfdYxbmaMjOtCvZqpcKJiNC2lF+/qAnPqGJdHAEjjQ2jWj6t4so8Wd
	0sfIbNMRFcX4aOC3vmw2JzcMZcRdOBSuscL56QDIVQyA9LmqG9F0mEHlwqkQKuPeItQd0yKQyHn
	VtdXwgWj2M49162rReExBwD7xBV4OySFzyS3FDxEVKM1kTBWG4HOSkI8UaXVzFCdNeBRjqn6xzr
	fjPPXRTJObv7a4mg6RQESR8zpa+qQZDVhtyWFqFxIfWQnFaM0DTx8dto0vXgfGj+edPVimMGQZc
	qbEZtEf5WUXOFDVkNcrfvWAzlTPoab2gwEB0aqZxIcsNOA==
X-Google-Smtp-Source: AGHT+IHOoPSYd39+s2P+I5W5gcza3K7JJCd5GqnM6mc219v8oqynZ5VFgBSd9yG4NA+PxlZ6utEL3g==
X-Received: by 2002:a05:6a00:b90:b0:736:42a8:a742 with SMTP id d2e1a72fcca58-73980395331mr17654701b3a.11.1743496736959;
        Tue, 01 Apr 2025 01:38:56 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73970e4cb56sm8319319b3a.77.2025.04.01.01.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 01:38:56 -0700 (PDT)
Date: Tue, 1 Apr 2025 14:08:54 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Linux PM <linux-pm@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH v1 03/10] cpufreq: Split cpufreq_online()
Message-ID: <20250401083854.6cp2efo7wxvxjcdd@vireshk-i7>
References: <4651448.LvFx2qVVIh@rjwysocki.net>
 <3354747.aeNJFYEL58@rjwysocki.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3354747.aeNJFYEL58@rjwysocki.net>

On 28-03-25, 21:41, Rafael J. Wysocki wrote:
>  
> +out_unlock:
>  	up_write(&policy->rwsem);
>  
> +	return ret;
> +
> +out_destroy_policy:
> +	for_each_cpu(j, policy->real_cpus)
> +		remove_cpu_dev_symlink(policy, j, get_cpu_device(j));
> +
> +out_offline_policy:
> +	if (cpufreq_driver->offline)
> +		cpufreq_driver->offline(policy);
> +
> +out_exit_policy:
> +	if (cpufreq_driver->exit)
> +		cpufreq_driver->exit(policy);
> +
> +out_clear_policy:
> +	cpumask_clear(policy->cpus);
> +
> +	goto out_unlock;

Instead of jumping back to the function, won't declaring the label here and
jumping from the earlier code to the end of function more readable ?

                goto out_unlock;
        
        out_destroy_policy:
        	for_each_cpu(j, policy->real_cpus)
        		remove_cpu_dev_symlink(policy, j, get_cpu_device(j));
        
        out_offline_policy:
        	if (cpufreq_driver->offline)
        		cpufreq_driver->offline(policy);
        
        out_exit_policy:
        	if (cpufreq_driver->exit)
        		cpufreq_driver->exit(policy);
        
        out_clear_policy:
        	cpumask_clear(policy->cpus);
        
        out_unlock:
	up_write(&policy->rwsem);
	return ret;
        
Either ways:

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
