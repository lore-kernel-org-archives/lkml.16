Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A3920D4E2
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 05:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745904289; cv=none; b=ULt02JJmawsrzqH5CE5wUBsWaw71ELV3IWJM1MGWGZNW1ER+L1TdidwR2Kebr4Moi1Fcn78ovQFGdGABNHWe+4yeaYsCITUAqIgbX40+JUT6xhmrs3F5uEFYhn4jnQsQenzVjAy0HWxE37JzdiCTfVG/GnZhqNgg5+PT+9zPxUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745904289; c=relaxed/simple;
	bh=/KC233azgY3A1MOqq8JrlK5M7xo9FxTg7CclfxXZFos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CKaFQRbDf5boIni2L/s1hsi4NTqE04P50wzgAh6UB/azSZ2NA39LHcfn6Bx4awDRkxd0ym8gpCq2cq7ywwwUmsQ2aAL20k6I7HgJ0byHrCBKbP7ef4Zotgl/eT6hVaAhK6yp38hI872OyyM5XYk/xs12glnua7kZwOL1/rvPSFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E7+Xl6FC; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E7+Xl6FC"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7376e311086so7541785b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 22:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745904287; x=1746509087; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AEG2jELXd9nNPULNYZssLdKsrgNlc7ll4A8WlMh6fPs=;
        b=E7+Xl6FCajASVSoHt0UJQwDwTAAd26NjQYqa4lw6+yg+N/lS6VEPOlbEYjbLL0CwYT
         vw9IGKxxClC9tWXo8gjw+Xw1p2oETN/rYMQvkyP5sY7hJcz7NEtcTBG+YFRKSfVWqLpE
         vcldfbrbTQrQjDdiGkLs55LJV7WfQeBNPhu5NdCS39Q09vCNmyl7YCKBWUBobWSixKCN
         8lHOogX3XMGKv6qqNDwcZ59NCJz4BRraKrlxgdex087UWOT/EWsHKImigDDZE9UESdIR
         J1qUtTuEII4f7qEv5hAsNiXZcvDBVtkh743GMINQAJGuQRjiMaPLy4aCgkotTvfzHEZ4
         3TgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745904287; x=1746509087;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AEG2jELXd9nNPULNYZssLdKsrgNlc7ll4A8WlMh6fPs=;
        b=bxjgt8nj1Mz2fyiVd6X53/nSI/qi6AADXaCJ7unJgymY8MVDfY48dcurxjkXkhjbBR
         3Olq87uMUkv75XiLpUwhMv+lsw97u3BK7CqKpI50cUC0HzUgeGZtxT5vCWObqA0jJVBp
         zLEr73qCOEoafZJXSK6/4nH0Qu5I1pRpxXx/IkQfwxIyM/Wk8DA3veaNOfV+YhiQJAm6
         AKJGglNFjnwW4Nf3YyuNltuh0leuB1Sz7uoxNzzzs5jbC3YfrYEOyXKbsxDmma5PQ+ek
         uzs+W0jnTChVLj7v6qtaCunoFt/AZvielq6cYbHwwPtFYGPhwoSKSXGvodDzjINF4VY8
         f+OQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPAX1DTbj5OVYHvLj35OGNvm/80qSz6cM5tooU9rOPaApq2kIRbSWXSM5Tk3VZOiOVHUVcVPD32HVuwnA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhMjUSZlk7pTy7OAfMS0qipA4ghNNXmbvZmXrlJaZDFPlJbFpN
	ArmhqOfJzGucoKBzyvvWBege+z2rtS5LX7WtmsVn96C3G83Oo7KSapUi+mDUe3VyCiJ+TduD09E
	E
X-Gm-Gg: ASbGncvz0ttqF7zZUgAJ/IHk5dGKAofRtexbckMCejjWEpmWeF0I+cQ0WSeGfu7VJXb
	AWC+J+OkY1J47G93e/72+Uy//e2O8lEdGuRPSI5bgitbbxW1k6onC3iDubMWTcnXMA1elCu2tgG
	YWwue7qJG/qQnVucJedaKn78pE33i5SWPAUIkg5f5FcEFU/X+XWF6WcUn3XFFBeNOqPKrcgiFxj
	5YK6qHmFr3Z4INyi41Uz21kS8+4JPoJjFW2g13fL1vkVZrjjQmdcxGHYCgjeQxU2LFivp9iGiTF
	zLWpk+GcZhIcyUwWAaHA8AIft9AVVgtOEa8tDrGFTg==
X-Google-Smtp-Source: AGHT+IGacVDQkA79I4oerLjfSwtP2EnSgzoWaq7vlyI+ukjcLDfb1uzKM/LBC1AotrtWGv/r4XmSrA==
X-Received: by 2002:a05:6a00:2410:b0:736:5e6f:295b with SMTP id d2e1a72fcca58-7402715dfc9mr3302755b3a.12.1745904287390;
        Mon, 28 Apr 2025 22:24:47 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a6b1e7sm9311484b3a.108.2025.04.28.22.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 22:24:46 -0700 (PDT)
Date: Tue, 29 Apr 2025 10:54:44 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Seyediman Seyedarab <imandevel@gmail.com>
Cc: rafael@kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v2] cpufreq: fix locking order in store_local_boost to
 prevent deadlock
Message-ID: <20250429052444.zfmfzjirkcaq3edh@vireshk-i7>
References: <20250428171931.1850-1-ImanDevel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428171931.1850-1-ImanDevel@gmail.com>

On 28-04-25, 13:19, Seyediman Seyedarab wrote:
> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> index acf19b004..5464c8487 100644
> --- a/drivers/cpufreq/cpufreq.c
> +++ b/drivers/cpufreq/cpufreq.c
> @@ -653,10 +653,7 @@ static ssize_t store_local_boost(struct cpufreq_policy *policy,
>  
>  	policy->boost_enabled = enable;
>  
> -	cpus_read_lock();
>  	ret = cpufreq_driver->set_boost(policy, enable);
> -	cpus_read_unlock();
> -
>  	if (ret) {
>  		policy->boost_enabled = !policy->boost_enabled;
>  		return ret;
> @@ -1045,11 +1042,17 @@ static ssize_t store(struct kobject *kobj, struct attribute *attr,
>  	if (!fattr->store)
>  		return -EIO;
>  
> +	if (fattr == &local_boost)
> +		cpus_read_lock();
> +

Please add a comment as well to explain why this is required here.

>  	down_write(&policy->rwsem);

And please rebase over PM tree's linux-next branch, your patch won't
apply anymore due to recent changes.

>  	if (likely(!policy_is_inactive(policy)))
>  		ret = fattr->store(policy, buf, count);
>  	up_write(&policy->rwsem);
>  
> +	if (fattr == &local_boost)
> +		cpus_read_unlock();
> +
>  	return ret;
>  }

-- 
viresh
