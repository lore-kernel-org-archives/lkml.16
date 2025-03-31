Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D353210F44
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 14:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743431091; cv=none; b=XuL59cZmMXcXqHTd5Amr+V1Cb/aytBzNzwDs+QttluB0a/He2/Ihbe3uX5LLAr56gAIqR+G/6HyQ4MCCa/atvSEjuCBN3DhJMc5Jlju1fGJjh3ouBsCntqTC9rFAQ0dDS2P77jqcr5I5X3mJK2xuUyVoxikLh8xgNjNtf56DHRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743431091; c=relaxed/simple;
	bh=Agb7wBXeOE8Nliqm1PCYTi+c2/fblxQZxwStVuvaZdo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RL354ovd1gRXVJCGmTsNo0gJrkpDazjonTVRyjFaHgDQ2vISF/UfXNY6UtOZwsXF2gnFmswbA4JACCYKQFONL+MaGMN5hCghWSvuZpW/Hh+RL6xOi0c3OpiV/umNV6aG//NlM0sv3ADlT9Ar0EFLVJo+LY06t89lzpuIGgjC2HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N86JXREK; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N86JXREK"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4394345e4d5so28969335e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 07:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743431088; x=1744035888; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dMUDPAFU1O8xG8NCQoQQo1s0+ikZ5HYpQJjYgU1KeM8=;
        b=N86JXREK+aczPSA6yEQ3GiY9Dl6CyMmtzl4Yc3x0PaecIbk1Bh9nlOzhlPINo/0gG3
         7wgSKF78dVjTYNgM2EUzRIrlLrCfx7214Qlc9HT5XkGNKfi4i+O5bYIYtSylVckKfVWo
         Tor0Cnhe/VovxEJOyyZGhYDTgJhCxa4xrmlZGhSQ0M99tZs304tBsCFmxM1xLZipcwxC
         uzH9Yo/g3sKn3x6F0xc6VcLnjr5Gh6vGHsq4LvPMYkOv73JEig9jM0XsIpsbZPfAaLqE
         GrGMThtjbwXixaaXjS/Er1sEsjvD4tdfVpvL3eQLVbpw27Geh+3+VesrAKDwUaN6zV47
         MP4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743431088; x=1744035888;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dMUDPAFU1O8xG8NCQoQQo1s0+ikZ5HYpQJjYgU1KeM8=;
        b=A+iCUrOk6eQYCym2Ks8OqpZY/bYLRXmozNYtSoLgPiWTFky0Ye0opUyBU/Dk3J0eiQ
         b8KF83kv0AhLvxqIbn5r2gDPY/jMuCrrtO1ikbqOcIK+g/yFUpwo4QvRDwNHfGktuAPm
         NTtuYk6Ed1eLJI1qg7fsz68t2dCZQK+ieil2vE42M9rAgOQ+Unuz6gZHdiIwH3CRQLvo
         Ttx/EYzRJ3PhiyeMW8s8UcMzDroedJd7SFv6plT2jG4v1hHFj6+nU4Os+jAsPW4vGALn
         AMYHRS+gMRMCRXIQ6Po4efHSyOqUeqR8fvc2YR8XVqJACnzLzElP0wBOIZc0IqWDNeJu
         udTw==
X-Forwarded-Encrypted: i=1; AJvYcCWEY+tMdy95pS0T3UYhfRd1iSoz360D2yhqctpacSBgBSk+xXre5J/OsdQ4Mq4+VKjBUtaPsTSa48M5nFA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEVNCCRQoWjLIDZTpC9nlRmbKYHYSHUgQaCGAexAtBrKGag/1h
	Wlnk7yIXxCghjWOyT18M/0AjCR8x3vTHLT34rZ/NymH97Udj91fBFLZeQinc5mE=
X-Gm-Gg: ASbGncuRDRFaraZJjKDZEi4aoEy25qaXjTaxWI6Sl6qc1TLgdSVCyL6Xif+L2swKsvY
	JV8IIO71M7nivgU21QPE97RjQmEiYMce0VGRnUszNz2WRYLGpWopppa6wuUtScrhNlmD367Wa1L
	Xpfi4MxsfCcuy1718wFJNRXiBIuE2bLYFaXvjZLarvLQQEDHcWsYTyGOc5JvVLnN42/jgIua74d
	hMgNqyuP7hQl3ZHi3EKujzE8ivgYeDCq6GfwOJ3r7gJQBhvXWFPXrwItynR339zV9HnIkU/trYG
	vpxpqbnouyF9+T7PTG5tzRJlxqqwiAhoe+pnZ5RYiGYmyrmWSw==
X-Google-Smtp-Source: AGHT+IGHvJ94y7udCjZezUAWslORfm/B4FLHAOoJRG39KVz7X0DFlR4mCxB/y+cweClieCU7uQx6vA==
X-Received: by 2002:a05:600c:4754:b0:43c:ec28:d301 with SMTP id 5b1f17b1804b1-43db8516a10mr72004525e9.26.1743431087790;
        Mon, 31 Mar 2025 07:24:47 -0700 (PDT)
Received: from [192.168.1.247] ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82e6ab48sm169719975e9.10.2025.03.31.07.24.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 07:24:47 -0700 (PDT)
Message-ID: <ea366793-4c27-44af-9b6b-8964c4151416@linaro.org>
Date: Mon, 31 Mar 2025 15:24:46 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: catu: Introduce refcount and spinlock for
 enabling/disabling
To: Yabin Cui <yabinc@google.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Leo Yan <leo.yan@arm.com>
References: <20250328223837.2314277-1-yabinc@google.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250328223837.2314277-1-yabinc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 28/03/2025 10:38 pm, Yabin Cui wrote:
> When tracing ETM data on multiple CPUs concurrently via the
> perf interface, the CATU device is shared across different CPU
> paths. This can lead to race conditions when multiple CPUs attempt
> to enable or disable the CATU device simultaneously.
> 
> To address these race conditions, this patch introduces the
> following changes:
> 
> 1. The enable and disable operations for the CATU device are not
>     reentrant. Therefore, a spinlock is added to ensure that only
>     one CPU can enable or disable a given CATU device at any point
>     in time.
> 
> 2. A reference counter is used to manage the enable/disable state
>     of the CATU device. The device is enabled when the first CPU
>     requires it and is only disabled when the last CPU finishes
>     using it. This ensures the device remains active as long as at
>     least one CPU needs it.
> 
> Signed-off-by: Yabin Cui <yabinc@google.com>
> ---
>   drivers/hwtracing/coresight/coresight-catu.c | 29 ++++++++++++++------
>   drivers/hwtracing/coresight/coresight-catu.h |  1 +
>   2 files changed, 22 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
> index 275cc0d9f505..834a7ffbbdbc 100644
> --- a/drivers/hwtracing/coresight/coresight-catu.c
> +++ b/drivers/hwtracing/coresight/coresight-catu.c
> @@ -458,12 +458,19 @@ static int catu_enable_hw(struct catu_drvdata *drvdata, enum cs_mode cs_mode,
>   static int catu_enable(struct coresight_device *csdev, enum cs_mode mode,
>   		       void *data)
>   {
> -	int rc;
> +	int rc = 0;
> +	unsigned long flags;
>   	struct catu_drvdata *catu_drvdata = csdev_to_catu_drvdata(csdev);
>   
> -	CS_UNLOCK(catu_drvdata->base);
> -	rc = catu_enable_hw(catu_drvdata, mode, data);
> -	CS_LOCK(catu_drvdata->base);
> +	spin_lock_irqsave(&catu_drvdata->spinlock, flags);

Hi Yabin,

This needs to be a raw_spinlock since [1]. Also you might as well use 
the new guard() thing to save someone find-and-replacing it later.

But I'm wondering if this is accurate. The ETR's refcount is dependent 
on the pid of the owner of the trace session:

   /* Do not proceed if this device is associated with another session */
   if (drvdata->pid != -1 && drvdata->pid != pid) {
	rc = -EBUSY;
	goto unlock_out;
   }

   /*
    * No HW configuration is needed if the sink is already in
    * use for this session.
    */
   if (drvdata->pid == pid) {
	csdev->refcnt++;
	goto unlock_out;
   }

If the helpers get enabled first, could this mean that CATU gets 
associated with a different session than the ETR? Maybe not, but it 
would be easier to understand if the core code handled the refcounting 
and locking for linked devices.

[1]: 
https://lore.kernel.org/all/20250306121110.1647948-3-yeoreum.yun@arm.com/

Thanks
James

> +	if (csdev->refcnt == 0) {
> +		CS_UNLOCK(catu_drvdata->base);
> +		rc = catu_enable_hw(catu_drvdata, mode, data);
> +		CS_LOCK(catu_drvdata->base);
> +	}
> +	if (!rc)
> +		csdev->refcnt++;
> +	spin_unlock_irqrestore(&catu_drvdata->spinlock, flags);
>   	return rc;
>   }
>   
> @@ -486,12 +493,17 @@ static int catu_disable_hw(struct catu_drvdata *drvdata)
>   
>   static int catu_disable(struct coresight_device *csdev, void *__unused)
>   {
> -	int rc;
> +	int rc = 0;
> +	unsigned long flags;
>   	struct catu_drvdata *catu_drvdata = csdev_to_catu_drvdata(csdev);
>   
> -	CS_UNLOCK(catu_drvdata->base);
> -	rc = catu_disable_hw(catu_drvdata);
> -	CS_LOCK(catu_drvdata->base);
> +	spin_lock_irqsave(&catu_drvdata->spinlock, flags);
> +	if (--csdev->refcnt == 0) {
> +		CS_UNLOCK(catu_drvdata->base);
> +		rc = catu_disable_hw(catu_drvdata);
> +		CS_LOCK(catu_drvdata->base);
> +	}
> +	spin_unlock_irqrestore(&catu_drvdata->spinlock, flags);
>   	return rc;
>   }
>   
> @@ -550,6 +562,7 @@ static int __catu_probe(struct device *dev, struct resource *res)
>   	dev->platform_data = pdata;
>   
>   	drvdata->base = base;
> +	spin_lock_init(&drvdata->spinlock);
>   	catu_desc.access = CSDEV_ACCESS_IOMEM(base);
>   	catu_desc.pdata = pdata;
>   	catu_desc.dev = dev;
> diff --git a/drivers/hwtracing/coresight/coresight-catu.h b/drivers/hwtracing/coresight/coresight-catu.h
> index 141feac1c14b..663282ec6381 100644
> --- a/drivers/hwtracing/coresight/coresight-catu.h
> +++ b/drivers/hwtracing/coresight/coresight-catu.h
> @@ -65,6 +65,7 @@ struct catu_drvdata {
>   	void __iomem *base;
>   	struct coresight_device *csdev;
>   	int irq;
> +	spinlock_t spinlock;
>   };
>   
>   #define CATU_REG32(name, offset)					\

