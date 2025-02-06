Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B473E22331B
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 05:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738819679; cv=none; b=PrCEknEfAZcxPJZsA5RKIOitinyMe/Eh+L8DKDqvIo/WUoX+fisZbl0cQeNQRZateBEKAgbN1SQG0084R0DNt00YcdMGRW4U6YQNPaB/CufJAHMwt25fQiIeQfM5qR6d2bF9VR8QavIbo75yPWLjTfnfcvIsbCTQYvfCO0Tm+sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738819679; c=relaxed/simple;
	bh=UjMdMXdzfY8FA3OIjvPbpQ2pM3XdG3LmxQG3cALELwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H3Ws7f2HMOECH0u/hQaDFz+TSqQlPBGBOVhb8U6240QHDLPGrdtWFk8XemULLtpiE/ayEgEVqozU5hAmvN+IbeAdK5GdXb3hvP/yGWfiibwSJZILbWvpw+S+6KT5Fqk9PnjHdQ9HkeMJlEOI9n68puXSoE1vlAmtIhFmqZ9843I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z218f1wG; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z218f1wG"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2165cb60719so9897095ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 21:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738819677; x=1739424477; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N5TuaKcHCHKRHmy6UIoV5V210kvNYMZbMQRWf3DAlzE=;
        b=z218f1wG/yYIELH4Evon3ardntw/HbbfDmkBaHBNfH78gchqYsDZu4vCA5vqJ5vUQU
         KDGGPJn/L+31A67q2Dk2vHk/RRu9SoPfvokHLXWjclj+wv7EC0AZrrawXR/1VOuS9RT8
         TwS2QrI/n2ISsnknDGvoordQbVVOCO6Y/WQic8oUzGe3TBbV6atrXRJQmGY8ALOC3aLQ
         wAJElvpZLmmoX3WdmBX/qzj3C3Jm1u2yaYZxbEJdDC+nxsfc7XWpW/pHbRQCA5yEbGLk
         MZVbigje0PDD3D9Z/p7ZCTDCO8L+yMMujgoM7lH1s3hp29DMWgQBJrgAULD94ewi48jQ
         mprA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738819677; x=1739424477;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N5TuaKcHCHKRHmy6UIoV5V210kvNYMZbMQRWf3DAlzE=;
        b=wf5vNlwu2SnlKPVJrc91ghykBtnVr8S1fWmztzAXfZMKG0x5gRshFp0MzXI3UKUP2v
         IAnBbW2VOi8gevfNytaQT1eIJ51HSPrIeZICyu55qkiVdGDEI3R1q2y5mcanK7HIq1t4
         G0iIXJye7ip9PDdXvTr7xPqKoqbhpnxef8CxYV41swlhnSjQB//u+VgPwTSEp45ewgwU
         FOZq5ta3GH3GKEirHVxGT83Rzv3Km/zS53oRwMUZeK3FHoTXEyBn2AKVNTgmD/RNTXWx
         75rG8K514kdC4Np1m4zTv29miasdUQk1m5MGWYkM5L4vgE1Rkoni9cLggf3+skoB4YmQ
         JRUg==
X-Forwarded-Encrypted: i=1; AJvYcCXf/R5j3rKFiGtg+EmILgkAZzH9ojchimxsLCezN6q46fjlr5nX2yaoMd0G7wM3Uk1/+1sR4+AXJDmzwY0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtXI/HNObdJwnjA8Li1UPJgp9BX+6qqQ5yxvUT7KCt6L8dM1Dz
	Dwwey/Ie/FF5vhSByLDUf7aGqzfFgZji+PQYmS5hmD3DI9BaWbbMttdQCSmh/bQ=
X-Gm-Gg: ASbGncuHh+hhCapfiaE5fYLCvhXyr61G4SbHRGCeMkYyYy+RxHczGSAVE/su6V9FRfb
	5dUZmfGyju55PC19zv+VhM1psaHhsx3uG4QaedcKW5elVd+PsGkxloKu2RPDfGHtpyaG+da35/7
	6NpEqajzDBcZPx5Jd8yJrNT2DydX56kPtAT7ryEKzWTbdEj/mjdeEaKZ6Y84JfZlE95mbb7Y4pL
	ZqSJ3Wqly8hEI3tLFw1U8xGziH6FOeNCTKeShkgZa3zDQOLUKReJzuCvuEHrEY9KQAjawRjozM0
	33Ve97ZuSxm3nxOE3g==
X-Google-Smtp-Source: AGHT+IHOn7iWRBNscDl6r4DQ+HQlP4sycPSn7NOLs7VrTo4POwB3zeP6AMKOQs+Jwf8U4Z2smBr7vQ==
X-Received: by 2002:a17:902:da85:b0:216:1543:195d with SMTP id d9443c01a7336-21f17e46190mr100438965ad.25.1738819676962;
        Wed, 05 Feb 2025 21:27:56 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3689e280sm3312565ad.219.2025.02.05.21.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 21:27:56 -0800 (PST)
Date: Thu, 6 Feb 2025 10:57:54 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "zhenglifeng (A)" <zhenglifeng1@huawei.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/15] cpufreq: cppc: Set policy->boost_supported
Message-ID: <20250206052754.3p5axkd4tsz5knhe@vireshk-i7>
References: <cover.1737707712.git.viresh.kumar@linaro.org>
 <c744751c8f61cae509959270176ebdef77326ba2.1737707712.git.viresh.kumar@linaro.org>
 <d7acce9e-fafc-4b1d-80f9-2ddc46b5a28d@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d7acce9e-fafc-4b1d-80f9-2ddc46b5a28d@huawei.com>

On 06-02-25, 11:58, zhenglifeng (A) wrote:
> On 2025/1/24 16:58, Viresh Kumar wrote:
> > diff --git a/drivers/cpufreq/cppc_cpufreq.c b/drivers/cpufreq/cppc_cpufreq.c
> > index 7fa89b601d2a..08117fb9c1eb 100644
> > --- a/drivers/cpufreq/cppc_cpufreq.c
> > +++ b/drivers/cpufreq/cppc_cpufreq.c
> > @@ -34,8 +34,6 @@
> >   */
> >  static LIST_HEAD(cpu_data_list);
> >  
> > -static bool boost_supported;
> > -
> >  static struct cpufreq_driver cppc_cpufreq_driver;
> >  
> >  #ifdef CONFIG_ACPI_CPPC_CPUFREQ_FIE
> > @@ -653,7 +651,7 @@ static int cppc_cpufreq_cpu_init(struct cpufreq_policy *policy)
> >  	 * is supported.
> >  	 */
> >  	if (caps->highest_perf > caps->nominal_perf)
> > -		boost_supported = true;
> > +		policy->boost_supported = true;
> >  
> >  	/* Set policy->cur to max now. The governors will adjust later. */
> >  	policy->cur = cppc_perf_to_khz(caps, caps->highest_perf);
> > @@ -791,11 +789,6 @@ static int cppc_cpufreq_set_boost(struct cpufreq_policy *policy, int state)
> >  	struct cppc_perf_caps *caps = &cpu_data->perf_caps;
> >  	int ret;
> >  
> > -	if (!boost_supported) {
> > -		pr_err("BOOST not supported by CPU or firmware\n");
> > -		return -EINVAL;
> > -	}
> > -
> >  	if (state)
> >  		policy->max = cppc_perf_to_khz(caps, caps->highest_perf);
> >  	else
> 
> I have a little question. With the old boost_supported flag as false, it
> will fail when you operate the global boost flag. But if you replace it
> with the per-policy boost_supported flag, the global boost_enabled flag can
> be set to true without any error, even no policy's boost_enabled flag
> changed. Is this interface behavior change OK?

Right, so earlier even if a single policy didn't support boost, the code disabled
boost for all of them. Or it was rather racy, as the last policy to be
initialized will decide if boost will be supported or not. This is surely
incorrect.

The global boost flag can be enabled disabled without worrying about any
individual policy. If the policy supports boost, it will follow the global boost
here, else it shouldn't take part in the change.

So yes, the new interface does the right thing here.

-- 
viresh
