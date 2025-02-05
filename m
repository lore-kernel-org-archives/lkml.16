Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD022165F3
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 07:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738738869; cv=none; b=PVCtuFf7VrY/MQQLXziVPVor+mXQmrzhybsp0iYSdcnJmYea8DETvEDiV7oB1Rgfq+K858p8JKOwUOWAVDXtgLsb2fOSIHDRY/ci7h4cZaCsYVUiOnEH3UXuM54iQ92fNAMLbockw1jBn1OuisJhH7tivW1qwGLtOXGDL75BVqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738738869; c=relaxed/simple;
	bh=aD/NIW5FUnM9KNWUYbfUMGjaLngniGnrcJF+wI6pOuk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VLMU/q4Sglv8/CS5YzBIu2dacbqIl7tMFDAS3Q5aOGUVDOn2yeLjvDvvJVbxJPMR1IG62YXJcSuWlYFjCIc5xJ35kcrTT2VczMH4eFc4KnaZ4rLHZ0jpzRl7qGPXV1juj/J7Rb3B103mQszgjemgy1XjPSBGE6DGBivP7y9Cijg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dO+s0RYT; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dO+s0RYT"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2f9d74037a7so1851848a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 23:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738738867; x=1739343667; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6N/xvMPywVw8Ta/fzMCKBPH/2e9AxLxEOg5T5Sofx6w=;
        b=dO+s0RYTJNP9wUMtR0QLLgc1OOesLMB2lodX4zejPIG+1W0oaKf6PxlmH2Y7Z4aNkk
         dCtQN+rhskNJ5H3XavcjRGrKbTAlHfah7vTjJvR/GY6tJIokskLNNgvdK4ZTiMiIYbej
         SR6D4VX7vxhV4XRuuaTlOVqhjMgv5M7cVj09l0Xzwyd/9L4E7mQ+ZkTZ2fvBN0QkmyfY
         KTWbasf1vWJjul3l5GNekOc6VwsiSLKN91bD0GB25DdhC9My+Hem5V5gtasIJXY/LE/4
         Q1bmeqAf/aPKbLlkwr0uqcs9oDHKjE+TUfgqrqeUy8Xk6R8zJw412rp/GCv+U3Sua2bq
         kMsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738738867; x=1739343667;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6N/xvMPywVw8Ta/fzMCKBPH/2e9AxLxEOg5T5Sofx6w=;
        b=voPBeXQoCuyB7WUQYHNdpVF6Bm6bFEyE4H/ACxWREK/gwXxfCpOI01zOXbXxm2Evuw
         Li5IQjOdMwyUz2kvLDxJk3cBuYAOPvVJbOiN39AcliSRpHJNbXXs82btiF83pOy8Xm8r
         IZtlQ1QeoYvTGRZKC9x0kuSGp2Wj7uVmIZOOeYmfCXlgKoDwrOfX75LAO+6zk5a329YW
         LtvwPa4tHZUdpKg5hfbHsYann5oekjbg+72c9r3MmTBvHMHPsmuZxWkxjtg2CrrvAOxE
         qFgi4zMwznUhAxZvFNQTf/QQhNM8Sqm+9iG6blLsl8++OuaKByMX7ETo96Ts+aXEZWPo
         fhAw==
X-Gm-Message-State: AOJu0YzCCOt+sXMAoS+U7pyMTSXUP+GbI7t8AawLIpamS7A7feGjUOD2
	dpB3uPdL4FszlFtKsSOL1jvQSPHnaRS/5quy5ofO7IKXEKcn+O1+Y3bJrF9WkEM=
X-Gm-Gg: ASbGncvA31+MTaRKgcdfks2UFN37Z6jPHeZQuMxS5B90DqJkkL7In4b4/zkGaviQeoB
	BEjer/uSjhVyZrR4XGDmsg72tO9ISthgPKJNFVtEhqma25GMNTdivfY9mITCxQlj+nSFZKJgHfv
	3uSgPBTVQcIc0HqQ5sFebyjnVq4Lh82JWSD0qy7FMHPUgqhThoCyYgL7SSi3GPmLnHAamjUG7dK
	mqJl4cJnKMwXeR3OgiS5o+KSbpMwET2iKyHgZ4FwfgDGXiTzZ3Br+vdM4WymHuM9kPeVnUPrUbu
	uySsj17oRIKFTUiG6w==
X-Google-Smtp-Source: AGHT+IEu7fqxtK7w5SoEhI6cbco/xUvu7X3eM4no2kX0m2LQwZj0KIS55DISe84WBXdk8tWZ91sBcg==
X-Received: by 2002:a17:90b:38c3:b0:2ea:3d2e:a0d7 with SMTP id 98e67ed59e1d1-2f9e0792de0mr2925113a91.15.1738738866797;
        Tue, 04 Feb 2025 23:01:06 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f9e1e4253bsm762453a91.49.2025.02.04.23.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 23:01:06 -0800 (PST)
Date: Wed, 5 Feb 2025 12:31:04 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Beata Michalska <beata.michalska@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, ionela.voinescu@arm.com,
	sudeep.holla@arm.com, will@kernel.org, catalin.marinas@arm.com,
	rafael@kernel.org, sumitg@nvidia.com, yang@os.amperecomputing.com,
	vanshikonda@os.amperecomputing.com, lihuisong@huawei.com,
	zhanjie9@hisilicon.com, ptsm@linux.microsoft.com,
	Jonathan Corbet <corbet@lwn.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>, Phil Auld <pauld@redhat.com>,
	x86@kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v10 2/4] cpufreq: Introduce an optional cpuinfo_avg_freq
 sysfs entry
Message-ID: <20250205070104.6k4n3zcyuki366am@vireshk-i7>
References: <20250131162439.3843071-1-beata.michalska@arm.com>
 <20250131162439.3843071-3-beata.michalska@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250131162439.3843071-3-beata.michalska@arm.com>

On 31-01-25, 16:24, Beata Michalska wrote:
> Currently the CPUFreq core exposes two sysfs attributes that can be used
> to query current frequency of a given CPU(s): namely cpuinfo_cur_freq
> and scaling_cur_freq. Both provide slightly different view on the
> subject and they do come with their own drawbacks.
> 
> cpuinfo_cur_freq provides higher precision though at a cost of being
> rather expensive. Moreover, the information retrieved via this attribute
> is somewhat short lived as frequency can change at any point of time
> making it difficult to reason from.
> 
> scaling_cur_freq, on the other hand, tends to be less accurate but then
> the actual level of precision (and source of information) varies between
> architectures making it a bit ambiguous.
> 
> The new attribute, cpuinfo_avg_freq, is intended to provide more stable,
> distinct interface, exposing an average frequency of a given CPU(s), as
> reported by the hardware, over a time frame spanning no more than a few
> milliseconds. As it requires appropriate hardware support, this
> interface is optional.
> 
> Note that under the hood, the new attribute relies on the information
> provided by arch_freq_get_on_cpu, which, up to this point, has been
> feeding data for scaling_cur_freq attribute, being the source of
> ambiguity when it comes to interpretation. This has been amended by
> restoring the intended behavior for scaling_cur_freq, with a new
> dedicated config option to maintain status quo for those, who may need
> it.
> 
> CC: Jonathan Corbet <corbet@lwn.net>
> CC: Thomas Gleixner <tglx@linutronix.de>
> CC: Ingo Molnar <mingo@redhat.com>
> CC: Borislav Petkov <bp@alien8.de>
> CC: Dave Hansen <dave.hansen@linux.intel.com>
> CC: H. Peter Anvin <hpa@zytor.com>
> CC: Phil Auld <pauld@redhat.com>
> CC: x86@kernel.org
> CC: linux-doc@vger.kernel.org
> 
> Signed-off-by: Beata Michalska <beata.michalska@arm.com>
> Reviewed-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
> Reviewed-by: Sumit Gupta <sumitg@nvidia.com>

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
