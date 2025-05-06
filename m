Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABCF92701B0
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 09:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746523662; cv=none; b=nnGsvilbAUAT00KuX0eWgepoFtj79ZjgkwLHApb4siVkzJ0Xp02AN7W7BKTl3XO49pGj7x2bxX/gCvkzgi9A5jsJe2Jkg6MtY3LdBmFzrZ4UepMLgDv7yd+ATXVgp1PwaaAsF4XBnqEX0HwUY30Ye2fxtR7ktjrdC9veGVU74e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746523662; c=relaxed/simple;
	bh=59fLnBCbLMt0EoN3hzyJFoVv5FBzON1jFP3ajP1Qw80=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=pMIXj5fdRwM/TocB9cGuzLBjrJcb/W1tyBon/bZd9hMbFtcHCtu25hFiNaTIj3p29l3wOMGf1KUJT/GfIXeHpoh90kWcl8hou7wlENvrptK9/ZWZPPnEaQR5eWnmdszo7L6Deh2GHJ92Ok1Jh3T/wot+uorh2l9UIyU9MELt/9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I5R2xjE9; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I5R2xjE9"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso33807465e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 02:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746523659; x=1747128459; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j+WrS+ZGF7ajKhUyNAGyOnZkGrNQsEpRwCZdg328c+s=;
        b=I5R2xjE9HOObNXQr/nU0Yhnl68phDR7xhxOkZUrLeBsNGxaDCzOlx2nGACDWu9bkZ9
         t1cFBNXs+SBXycRZDU/Y0aTnvXCnBn1Gj5f4zXTTLDoCOnganIGkYB+1m80N+MveNnVn
         TCSJruFhyVWxfap/Q5z2Mef6JdB5+oAcH47yELSrCKc8uNxh6Q7sbWXL+8vgPQ/sayqX
         0LmsNvBcMFLXM4qf+g/5uRJQK07iR1huUhJaijuKuLxGSrd5xIr6oW5N6N3F6lX572tk
         YFVrj0OOBRlA92nEgPQohH+Y6STiuzT1RsuAa/VQ6s+I0AJ1sIezP1iYlR09d6o3LdQ8
         T20w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746523659; x=1747128459;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j+WrS+ZGF7ajKhUyNAGyOnZkGrNQsEpRwCZdg328c+s=;
        b=J2LIOw3Bs+nkOmGxbF3gOVwLbO0HNOeIZWkC4PigvpJWhfebY/AxDYcy9QFzprTp/J
         sdEc7QeA80Iys2S7SWSfpJh3hvB4iCygx5xZOMWYD1Npp0lIlNUEAR3c3IshlyWebsEq
         XXLUP/2aLEaZLsNzV5hfZDitF6/li17PyUSbHSHmwUp8tCTAzqmCxguNxDMPRVSF3hg4
         ukd4bw3tzoWIfBELHsXvGAN/sw+vcAFq1dnHtgH/E0BZGlFhDpNxmQcobcu9Grd6b+9t
         miGQjdQVW5yi8UYp5qOeVfvDu4ZtQjBMbpFWnFDe6u0u07DowVI1/bREie6ZmHIXflZw
         d4Tw==
X-Forwarded-Encrypted: i=1; AJvYcCVIR9JTLBzDjNuif3Ulup/ccRbkxxNlgwl2Li5NQtl7XHzwsgdGy7nXxm/mFqzSQN9LeW+tj6RcLmKmvHg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwhnQH6WfMghUrZ8Ef2PGaNVwDZAM5VjgrauS3+PIP89r61cUN
	VFpvZxlS3kDwQJWgvKGL68vaklPyAp6dEKexT0ZPjeQ89gUN3D+JySpkNHQNruw=
X-Gm-Gg: ASbGncuO8NA2VLnKTBx6nu82OOuSZuDRTRHKcdLqXEOSoYsP2dMxHKbDsimtLPc4tyq
	pYEgZ7wNBrBeP1TPZAw6Nd7lewxdXcdT6sb8KT0iRyo9yFAmOj6aIW77PD437z5te7Om4xBBs0I
	UybVnpifd7XAKZ53zW2ERw3z+CBbBw+j9IG+M37644hnOSFUKSGpdtVkafRksHdK0rtouqX8Gli
	1eWJ52Zar83zg4dUYIBCRurRZAeBRCSw3W7wbY1Qgre+oeuak0CVkdcua8udFQe/3gE+g5ncyIw
	v5VBWVlf7HLqmtP8ABhVN86+lu+g3B7fozfRxyRn/FM=
X-Google-Smtp-Source: AGHT+IG5XXvRCx9XeVrs9fzQmCZyz79wKWVTD/0n1rorDH8LiUb2mKCXxid8ZfYYsDBB7YNr/KB5yg==
X-Received: by 2002:a05:600c:a409:b0:43b:cd0d:9466 with SMTP id 5b1f17b1804b1-441d0a909b9mr19936035e9.9.1746523658914;
        Tue, 06 May 2025 02:27:38 -0700 (PDT)
Received: from [192.168.1.3] ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b89cc441sm165112065e9.3.2025.05.06.02.27.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 02:27:38 -0700 (PDT)
Message-ID: <6f9346a0-03c5-4b00-85f9-0d54e24d0657@linaro.org>
Date: Tue, 6 May 2025 10:27:37 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: replicator: Fix panic for clearing claim tag
To: Leo Yan <leo.yan@arm.com>
References: <20250502111108.2726217-1-leo.yan@arm.com>
Content-Language: en-US
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Yeoreum Yun <yeoreum.yun@arm.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250502111108.2726217-1-leo.yan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 02/05/2025 12:11 pm, Leo Yan wrote:
> On platforms with a static replicator, a kernel panic occurs during boot:
> 
>    [    4.999406]  replicator_probe+0x1f8/0x360
>    [    5.003455]  replicator_platform_probe+0x64/0xd8
>    [    5.008115]  platform_probe+0x70/0xf0
>    [    5.011812]  really_probe+0xc4/0x2a8
>    [    5.015417]  __driver_probe_device+0x80/0x140
>    [    5.019813]  driver_probe_device+0xe4/0x170
>    [    5.024032]  __driver_attach+0x9c/0x1b0
>    [    5.027900]  bus_for_each_dev+0x7c/0xe8
>    [    5.031769]  driver_attach+0x2c/0x40
>    [    5.035373]  bus_add_driver+0xec/0x218
>    [    5.039154]  driver_register+0x68/0x138
>    [    5.043023]  __platform_driver_register+0x2c/0x40
>    [    5.047771]  coresight_init_driver+0x4c/0xe0
>    [    5.052079]  replicator_init+0x30/0x48
>    [    5.055865]  do_one_initcall+0x4c/0x280
>    [    5.059736]  kernel_init_freeable+0x1ec/0x3c8
>    [    5.064134]  kernel_init+0x28/0x1f0
>    [    5.067655]  ret_from_fork+0x10/0x20
> 
> A static replicator doesn't have registers, so accessing the claim
> register results in a NULL pointer deference.  Fixes the issue by
> accessing the claim registers only after the I/O resource has been
> successfully mapped.
> 
> Fixes: 6f4c6f70575f ("coresight: Clear self hosted claim tag on probe")
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-replicator.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
> index f1d2f764e898..06efd2b01a0f 100644
> --- a/drivers/hwtracing/coresight/coresight-replicator.c
> +++ b/drivers/hwtracing/coresight/coresight-replicator.c
> @@ -262,6 +262,7 @@ static int replicator_probe(struct device *dev, struct resource *res)
>   		drvdata->base = base;
>   		desc.groups = replicator_groups;
>   		desc.access = CSDEV_ACCESS_IOMEM(base);
> +		coresight_clear_self_claim_tag(&desc.access);
>   	}
>   
>   	if (fwnode_property_present(dev_fwnode(dev),
> @@ -284,7 +285,6 @@ static int replicator_probe(struct device *dev, struct resource *res)
>   	desc.pdata = dev->platform_data;
>   	desc.dev = dev;
>   
> -	coresight_clear_self_claim_tag(&desc.access);
>   	drvdata->csdev = coresight_register(&desc);
>   	if (IS_ERR(drvdata->csdev)) {
>   		ret = PTR_ERR(drvdata->csdev);

Oops. The other occurrence of this is the funnel, but I got that one right.

Reviewed-by: James Clark <james.clark@linaro.org>

