Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00B2154423
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 13:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744724497; cv=none; b=KEeGfDRmE82SmiCO+9ZLaYY5SdUdU0uVc3OMqjzpyoFv56/hEVu4gU3/5QVkfwTVtMAexpeW+ZhUiiIk+CFna9ChFo009ZaaCp3WfHKu99iEWsS8y9wEC2R7emOKsT22vp/4sdbT/NdpPomYeyMT8AiZ7Cnf22tuD+7ZZdoTe2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744724497; c=relaxed/simple;
	bh=acK/K+ABXlORBiRjpy5LxXDMPi99CEA2jo4mdhVYH1U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i3pXDA2nz0KLO6f6UFgopJFOGuOEoTkYXJggaAVS4UbRcXUYaihJ+3vZhb/EIUsCC5yJdqo8Y6P9StBmRDAbB/MTCa8pclZxZmggXKW7WJFRuWJAHJBNh1BJj7gYaPyqDL1QQC3SmsQYP00qxI7OiZNadiLUGQZC/NSr30QQKFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xr5P2S2x; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xr5P2S2x"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39c30d9085aso3520256f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 06:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744724494; x=1745329294; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C4yB7kQlZUb6xayWQsrmLdqiBMKXxBZBkdVERCDut1w=;
        b=Xr5P2S2xAmD4LKgmhA91Qlybm0kX124NX0sCHdQ+izLubUVYlrz4JQnt0XbYR6SyC/
         pd+yq+cCCJ7jVcypNU/7qy547ydJYWwtO4l9XMTgycoJIKEmRup0hCULSh4oEI4p8uoy
         cuJjFvSo1ZUxGHNqXzqc3VBdDC+AZX0SuhbZn+rdFqg/NJ0ngXS7Vuit3VgwrQoRkqtG
         //C9YkXmvXwnJSDFDHrL4kBcxjHVb2GT2fKOvJ02gLhK0omvzZhcL22o57f7gW1s8JiM
         5fR6UQ6urpRCkUkN//g5Xnb/e0Gz94n0sn0HcnxLcTq9eMHU27Xx+12BsaCNNe7ZgOEo
         G1qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744724494; x=1745329294;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C4yB7kQlZUb6xayWQsrmLdqiBMKXxBZBkdVERCDut1w=;
        b=P1c9evXQb65yqNs6gMbVsfzUH1rDHFuWIlM1O1SJu6oSPTOnPi4USlOC8RsWrxntLq
         Wbej35njuEW9WZip0FoL4VxGfpZyKCljFWaU0kRjodZqKOCaV7oCvRC80YTpcRHlei2K
         1WJAgQfbSaO4asJZciELnYPaZBQJ1LBz/fF2GE82Eltcg1DSRB2nvZPxSZDG5YyabLMg
         WC+RnydSn37Fqpt33ahhz0any+QPimCNx3stXnmnSbxknUXfzB5/QDdnxmnK/qNKevBo
         8agjkCqgjQQrRu0mBDOxrP7lW4OmOab68WYsnvfLifwCQSba8XFAv4JHqerC/4G9OLbR
         aZCw==
X-Forwarded-Encrypted: i=1; AJvYcCU5m99MM1KA3xXuZc+R62vJzawKP1eZjGiKSAj/yC8J/+TAa7Cbz1ZnhJ2z8Ufib8ceIhP2uW0DokFdvxo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk8dWMjQMVagGW29nA3koJVM10xpfOjWvrQwp2kq0kUqZFtuGT
	y237W2hBtSz6icH9GMa6ZpoDg28I2iFqd78FdAaqSTFG70tNPUIf8vBErcYPaSw=
X-Gm-Gg: ASbGncuv6sEcNJZnXcRHIREUTn6wt5V1AGu58NkX+KbkfRDsvgyiZu1kEJnUMMmsI/P
	78GJp9m8qGTcwN1ha6MDwhOVkzr3FoltZEQBqZNBrxV3bJgTOIgwPXGgPrkc5vHhnYSadKdW1lV
	z1GVQBtuL8xsBCsKBY9JAbvlTgrR/uoS6LUt0WqxlPbBD+2CsbUqMKIeiDkgZOJUrSoq76Q1UMc
	qeDgvtmxVBrQOke2zbLp1xJi4PTG/+9sFNPL6b8Oq0aOtCCAsmaOUSj2xemxswifKg35OVbQM98
	G+YXP3cGyDxkW4FJ3Yd12msCXkyx5+xSqXGSr2M1Xbw=
X-Google-Smtp-Source: AGHT+IGfWgdOUteKBd0Xg5+jg66EqrcGaih9n9NEZtkwhykKyItVqvzsTpM2lpnDn7APIwWUE1dwLw==
X-Received: by 2002:a5d:584f:0:b0:39c:1257:c7a1 with SMTP id ffacd0b85a97d-39eaaecaeb2mr12782034f8f.57.1744724493943;
        Tue, 15 Apr 2025 06:41:33 -0700 (PDT)
Received: from [192.168.1.3] ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae963fccsm14162453f8f.3.2025.04.15.06.41.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 06:41:33 -0700 (PDT)
Message-ID: <2e9f1ad4-d490-4c22-bcff-7d19b8a89721@linaro.org>
Date: Tue, 15 Apr 2025 14:41:32 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] coresight: catu: Introduce refcount and spinlock
 for enabling/disabling
To: Yabin Cui <yabinc@google.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@arm.com>,
 Jie Gan <quic_jiegan@quicinc.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
References: <20250408195922.770377-1-yabinc@google.com>
 <20250408195922.770377-2-yabinc@google.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250408195922.770377-2-yabinc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 08/04/2025 8:59 pm, Yabin Cui wrote:
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
>   drivers/hwtracing/coresight/coresight-catu.c | 25 +++++++++++++-------
>   drivers/hwtracing/coresight/coresight-catu.h |  1 +
>   2 files changed, 18 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
> index fa170c966bc3..30b78b2f8adb 100644
> --- a/drivers/hwtracing/coresight/coresight-catu.c
> +++ b/drivers/hwtracing/coresight/coresight-catu.c
> @@ -458,12 +458,17 @@ static int catu_enable_hw(struct catu_drvdata *drvdata, enum cs_mode cs_mode,
>   static int catu_enable(struct coresight_device *csdev, enum cs_mode mode,
>   		       void *data)
>   {
> -	int rc;
> +	int rc = 0;
>   	struct catu_drvdata *catu_drvdata = csdev_to_catu_drvdata(csdev);
> +	guard(raw_spinlock_irqsave)(&catu_drvdata->spinlock);
>   

Very minor nit only because you need to resend anyway, but there should 
be a newline between the variable definitions and the code. Not sure why 
checkpatch doesn't warn here.

> -	CS_UNLOCK(catu_drvdata->base);
> -	rc = catu_enable_hw(catu_drvdata, mode, data);
> -	CS_LOCK(catu_drvdata->base);
> +	if (csdev->refcnt == 0) {
> +		CS_UNLOCK(catu_drvdata->base);
> +		rc = catu_enable_hw(catu_drvdata, mode, data);
> +		CS_LOCK(catu_drvdata->base);
> +	}
> +	if (!rc)
> +		csdev->refcnt++;
>   	return rc;
>   }
>   
> @@ -486,12 +491,15 @@ static int catu_disable_hw(struct catu_drvdata *drvdata)
>   
>   static int catu_disable(struct coresight_device *csdev, void *__unused)
>   {
> -	int rc;
> +	int rc = 0;
>   	struct catu_drvdata *catu_drvdata = csdev_to_catu_drvdata(csdev);
> +	guard(raw_spinlock_irqsave)(&catu_drvdata->spinlock);
>   
> -	CS_UNLOCK(catu_drvdata->base);
> -	rc = catu_disable_hw(catu_drvdata);
> -	CS_LOCK(catu_drvdata->base);
> +	if (--csdev->refcnt == 0) {

Hopefully this never underflows if disable is called again after a 
failed enable. We could add a WARN_ON() but I think this is a general 
case and not specific to these patches so is probably better to do later 
as separate change.

Reviewed-by: James Clark <james.clark@linaro.org>

