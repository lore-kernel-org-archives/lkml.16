Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1FD919E98C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 22:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750286701; cv=none; b=h4p0laufRnIa2m4To0GVD8z5iRtVQGscPdgTdJs8M6Pe1Iae1oxsXJ7x+/SNBZBaJNyeF8fSPErxE+nVcRpGFrlHndAw5ttIW7BDKtwPOX39jEVWXGLvQ4dhIuESMluXyZ/DvnjGl/HPErUSjarXRFshLnEo5Br12rkXW1plhYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750286701; c=relaxed/simple;
	bh=0ED5HZjv3WSWzpJDL2MNE3DxJKC3CPCwd3eAHubf36Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S/YBvz7tjrW3hA6bIHgG84FiKTtPM3USDkc9CG/wD0/dG/MwVfVgS7Lyf6UnN18Zx3JnntdOC878FR/6x64uucIAee4HYGEt1vk+g3qvh8UtadSAtDlnTntX8Yg4o1OO7/TQp842RoyEeZHxm81wdhriVGATjwbvFj7NZwknqMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DyLDCb/I; arc=none smtp.client-ip=209.85.166.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DyLDCb/I"
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-86efcef9194so4172339f.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 15:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1750286698; x=1750891498; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2n2SQNFGQmtENFVzE8cjN4n7LHc1Thph1pphR4bfrBo=;
        b=DyLDCb/IX7UnllW+r/78Jb4q3P+abine8Ont+KUC9P/QKLC5qMg3bgX4yJXh8FRCAg
         U/BLPSTeFUfky+VoucW2+VNdnZY7/MDqGqoj3ksqp+ngiiz0biNGn8NATUoOLL5Oz5gd
         5KTqPdsZcn7oTCwkp+gLPYLw8B5wzih91h+Y8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750286698; x=1750891498;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2n2SQNFGQmtENFVzE8cjN4n7LHc1Thph1pphR4bfrBo=;
        b=MRdo9tddGgogIyjcIb7Fgl8ItVTkLLqX+gzlZ5kANWXwRsLMXC/GF+4xN83v+NjaW2
         cWgBkX9o/qmx8lKrPl/l+iEJF+3VI0ax5HE/oPiitf1nFcoMm7UZccblUNPfyVdCMsYs
         Y1c5AKCzfUOMuv77FulQQBMKRgSw3PO+tUIEn5fJtvkqssdIO5inhz82MWOQqjpBOkW1
         0Xn1qcHIouTKiNFAfkQE3QGwOA+W/+KA7mQlEUVlgTdsSvPrjtk/F42X6n2a2r1MbKpz
         tOQuj9UZbH2oMpiKz6QcgNephsF0bmvv1SrjIBka/8QNzH5RTv9Ix0n/fdE5Dit0dtEI
         S0Tw==
X-Forwarded-Encrypted: i=1; AJvYcCVbmyPIx+bWNcQUNDWGepozWHNnL+mtOVQCbzCBGvRwynTxt5YYS5BxEKkHCakLCGHYepDp62W7USQjauA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJrrln99SxI886SBZ3C+qsyvo3S/6uS35UThI/1mO9FnkLdp4g
	dA0lvXblnaSxI/5x+XsaKH82IDAvULGEibbXmF88vQnvUFNKg1pegXglPFNLneLCd+Y=
X-Gm-Gg: ASbGncvL/j4NHfJQTIaZsReQOb+jc9RFwZ4/u5urgEAKzuVfafd/EyolnRA2jS9RlE7
	1VD0jpKl8acXi7eRpdBtOZFBav0tu8HPjHb31xewsm5mCAS+o62FJCDa2HYr0W/0gv6mdfw1Zk+
	PxMyG1fzEfjPIhwb3kE34ZWbINGYCkKlug/1djfQF46qLR+Gd1ALgHEtSnmGDlrB7BL1M5XTduU
	XYRZGRnb8nLl798NKSjR5eqF2JiD9IwCto6GwOCXyICWAq7um4aQBFbbhf+sPamFDb47WRsBWg3
	ELwEICZueuhdufrd/RCvCtj00y+2GGuX0gGYYDPEchD+77dTK7svnPRl+0l81dZghTMDdyEIMw=
	=
X-Google-Smtp-Source: AGHT+IHXsSSQld9y7WIQoRaIUbFW+s42HR4KGpA2t3mpOt2Rr+gELKUrlxZAvg3wyi0Rm3o7nfKxfA==
X-Received: by 2002:a05:6602:1612:b0:861:6f49:626 with SMTP id ca18e2360f4ac-875ded13886mr2568261539f.6.1750286695900;
        Wed, 18 Jun 2025 15:44:55 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-875d57ff0fesm281953239f.26.2025.06.18.15.44.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 15:44:55 -0700 (PDT)
Message-ID: <6e1fe001-dd21-43fd-ba7b-aae6df819fdd@linuxfoundation.org>
Date: Wed, 18 Jun 2025 16:44:54 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cpupower: Add cpu_start()/cpu_stop() callbacks for
 monitors
To: Rohan Lambture <rohanlambture13@gmail.com>, trenn@suse.com,
 shuah@kernel.org, jwyatt@redhat.com, jkacur@redhat.com
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <94c3faee898b5436cc0b837c6778011a060b8468.1749480264.git.rohanlambture13@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <94c3faee898b5436cc0b837c6778011a060b8468.1749480264.git.rohanlambture13@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/9/25 08:49, Rohan Lambture wrote:
> Move per-CPU logic from inside individual monitors to the main
> monitoring framework by adding cpu_start() and cpu_stop() callback
> functions to the cpuidle_monitor structure.
> 
> This refactoring allows the framework to handle per-CPU scheduling
> and gives higher priority to fork_it operations as mentioned in
> the TODO. Individual monitors now only need to implement per-CPU
> initialization and cleanup logic without managing the CPU iteration
> themselves.
> 
> Changes made:
> - Add cpu_start()/cpu_stop() function pointers to cpuidle_monitor struct
> - Update monitoring framework to call per-CPU callbacks for each CPU
> - Refactor cpuidle_sysfs and mperf monitors to use new callback pattern
> - Maintain backward compatibility for monitors without per-CPU callbacks
> 
> This addresses the TODO item: "Add cpu_start()/cpu_stop() callbacks
> for monitor -> This is to move the per_cpu logic from inside the
> monitor to outside it."

Please share details on how this changes has been tested.
Also run checkpatch - there are a few warnings.

> 
> Signed-off-by: Rohan Lambture <rohanlambture13@gmail.com>
> ---

thanks,
-- Shuah
