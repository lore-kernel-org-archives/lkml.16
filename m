Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6794202F62
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 14:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743519528; cv=none; b=OrC93mJT72b8uA4CUCSQlvyEaTZTU3vf25pfVHDzqDeLudwKGEnl+NT5bog/jTJyKFgDG2y08Ad+xEObuU1/7lL+E0qthig+8EjwBpLgZe/AjbvtDGivh17oGQ2vrOI8/YGQBx0d54MYbbK0Gw8i71/1P1+JgROYlP1dN18a8GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743519528; c=relaxed/simple;
	bh=rBVnj2kuzsRspIon17V404bxRfeiAFpj5cERNHMyoSA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=F5kxpfFtW7JmnllYTIzerbJHwPMDwvKI/jjPlVzJmSNSZyrKghKtAZ4djm0dUC4zIh4lx0HFKj+ZDWQsgW6K3VXKxxcOdTaLKVwe02BYtSu8xQJgBKZJu09kAGkY4KGJftQ5ICQS/ZB2Rp7HIlzH2i4tIMgNW0Unl0WeDu+G/8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gLxc3NJa; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gLxc3NJa"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39c1efbefc6so1078804f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 07:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743519524; x=1744124324; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+jl7X3iQxImIxVd58oOGBnN/Rmp3bj8jAHM40t4xGMY=;
        b=gLxc3NJazrC60Llc9KE9ta4WjoPqKUm48kB/+RVWCoBKA3CrmRhm9VhpmVvo0PrBTa
         zxKNFA/grpfSW41Y9IPdzdNAFUcLuFuoXoq26D5269kQnFtpjZqCtBoGjk1hZ8+26hP1
         +LFfYRX/IgqyivDASr8d9gC15H1+u9l1Nt74NM5WJMTzYuaRNO3TNseLQ+fpqv5dKf5C
         MwMjJ8PHC3PEvgh2xi9feF4sxXDjCaJEksvxqQvm0a/UxeoKAPACxBBu0FJl9lmjF9Xx
         scRElNKXomgK/OqUUfVwtzWzLVOcJzUIiZ/d0a9cMGnJc0/1nt7HMhb1oGRWUHjjVd3T
         a7VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743519524; x=1744124324;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+jl7X3iQxImIxVd58oOGBnN/Rmp3bj8jAHM40t4xGMY=;
        b=tGvJk08+fSia4X3DounzcjQ1b33pbiRyhAa43oClyWyS+zTw0tmex4JjbvJdLTZrwV
         jU8bYIymGFSsGFMnUz5D8DyzjB/kTZScV9B3E/lm5s64SnrWLhQtE9BjknnF6bgstSfp
         Bt/RV7RWA00fT7Ty3cavxwZCeTXQfRXz96KyH4IeA+SWylMOXNZUcedsTKwzv9AbZFHp
         lQpZsWTTYL10SErbCNMh7H4CFarbKm0rf+ZyYb1x5AHbDtSRzH+DuMcdHTi/7jdTL7ch
         Oolv9hABgrQ/lnKP/R2KDbSFnwI2ViJ30i5NFEIeEIbfWlNeHJP8QoJNCZK28HA/coGd
         WGvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXllYNNor7P8+w3gif29rbJGAXYjvrCHOxjVj5jazvqE7hWUtGheog+M3J3WYFJFHAa7m/595PE9FXC53k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8jmISzQpuiWMsa+3TwfhprfGf69n47ayVvQ5HXU7EJS2ud23m
	HeOxny+m8OHm1IWVBQeMQiTPG34lsy//z4Pvfw0LNh1+bBs5wiE8SQNo5XqMPZ0=
X-Gm-Gg: ASbGnctjv1tTPNB2k+N5OjVb+t3V/kWAHT7o1/prfoPQng3yXfHErrmmHT2MbT0RZL1
	1NdtZx0Axn6w4YcBObikZFjV1BRjlAth4Oo9JO9tlkNedzL7KkwPlG0BGyOnTbGvrIQ5y8ukhdU
	Y+iaVf5ge44Lmlabq+5wMkHq+2FPqhAT8RDvCLgvfETHGMDXIaHteT8sP899L3YSqsmRSWeM61F
	uqAECSUSJleLuuY2P+kpJyJjvZm9hKpORNRSnnARudyoGCfTXo24P8LYiDTRJY2xYcj3Velgzm/
	eOKP48eYG1RSJ7W0FLlyn/3VB1RnIBJI80LqB4RepD7fw8c=
X-Google-Smtp-Source: AGHT+IHmaBSITLZ/nWSNzRwiZLgYFNFiImcV/f5eO9VLZjha2iCbgxMcIRSjTXFGC5eZY6835gq0pA==
X-Received: by 2002:a5d:64c9:0:b0:39c:119f:27c4 with SMTP id ffacd0b85a97d-39c120e3b98mr9530355f8f.30.1743519524130;
        Tue, 01 Apr 2025 07:58:44 -0700 (PDT)
Received: from [192.168.1.3] ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b66a991sm14273812f8f.49.2025.04.01.07.58.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 07:58:43 -0700 (PDT)
Message-ID: <b9046586-c884-484f-a308-9f256d3d99f5@linaro.org>
Date: Tue, 1 Apr 2025 15:58:42 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 9/9] coresight: Consolidate clock enabling
To: Leo Yan <leo.yan@arm.com>, Jie Gan <quic_jiegan@quicinc.com>
References: <20250327113803.1452108-1-leo.yan@arm.com>
 <20250327113803.1452108-10-leo.yan@arm.com>
Content-Language: en-US
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250327113803.1452108-10-leo.yan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 27/03/2025 11:38 am, Leo Yan wrote:
> CoreSight drivers enable pclk and atclk conditionally.  For example,
> pclk is only enabled in the static probe, while atclk is an optional
> clock that it is enabled for both dynamic and static probes, if it is
> present.  In the current CoreSight drivers, these two clocks are
> initialized separately.  This causes complex and duplicate codes.
> 
> This patch consolidates clock enabling into a central place.  It renames
> coresight_get_enable_apb_pclk() to coresight_get_enable_clocks() and
> encapsulates clock initialization logic:
> 
>   - If a clock is initialized successfully, its clock pointer is assigned
>     to the double pointer passed as an argument.
>   - If pclk is skipped for an AMBA device, or if atclk is not found, the
>     corresponding double pointer is set to NULL.  The function returns
>     Success (0) to guide callers can proceed with no error.
>   - Otherwise, an error number is returned for failures.
> 
> CoreSight drivers are refined so that clocks are initialized in one go.
> As a result, driver data no longer needs to be allocated separately in
> the static and dynamic probes.  Moved the allocation into a low-level
> function to avoid code duplication.
> 
> Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-catu.c       | 30 ++++++++++--------------------
>   drivers/hwtracing/coresight/coresight-cpu-debug.c  | 29 +++++++++++------------------
>   drivers/hwtracing/coresight/coresight-ctcu-core.c  |  8 ++++----
>   drivers/hwtracing/coresight/coresight-etm4x-core.c | 11 ++++-------
>   drivers/hwtracing/coresight/coresight-funnel.c     | 11 ++++-------
>   drivers/hwtracing/coresight/coresight-replicator.c | 11 ++++-------
>   drivers/hwtracing/coresight/coresight-stm.c        |  9 +++------
>   drivers/hwtracing/coresight/coresight-tmc-core.c   | 30 ++++++++++--------------------
>   drivers/hwtracing/coresight/coresight-tpiu.c       | 10 ++++------
>   include/linux/coresight.h                          | 38 +++++++++++++++++++++++++++-----------
>   10 files changed, 81 insertions(+), 106 deletions(-)
> 
[...]
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index 26eb4a61b992..cf3fbbc0076a 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -471,25 +471,41 @@ static inline bool is_coresight_device(void __iomem *base)
>   }
>   
>   /*
> - * Attempt to find and enable "APB clock" for the given device
> + * Attempt to find and enable programming clock (pclk) and trace clock (atclk)
> + * for the given device.
>    *
> - * Returns:
> + * The AMBA bus driver will cover the pclk, to avoid duplicate operations,
> + * skip to get and enable the pclk for an AMBA device.
>    *
> - * clk   - Clock is found and enabled
> - * NULL  - Clock is not needed as it is managed by the AMBA bus driver
> - * ERROR - Clock is found but failed to enable
> + * atclk is an optional clock, it will be only enabled when it is existed.
> + * Otherwise, a NULL pointer will be returned to caller.
> + *
> + * Returns: '0' on Success; Error code otherwise.
>    */
> -static inline struct clk *coresight_get_enable_apb_pclk(struct device *dev)
> +static inline int coresight_get_enable_clocks(struct device *dev,
> +					      struct clk **pclk,
> +					      struct clk **atclk)

This function has grown a bit now, probably best to remove it from the 
header and export it instead.

>   {
> -	struct clk *pclk = NULL;
> +	WARN_ON(!pclk);
>   
>   	if (!dev_is_amba(dev)) {
> -		pclk = devm_clk_get_enabled(dev, "apb_pclk");
> -		if (IS_ERR(pclk))
> -			pclk = devm_clk_get_enabled(dev, "apb");
> +		*pclk = devm_clk_get_enabled(dev, "apb_pclk");
> +		if (IS_ERR(*pclk))
> +			*pclk = devm_clk_get_enabled(dev, "apb");
> +		if (IS_ERR(*pclk))
> +			return PTR_ERR(*pclk);
> +	} else {
> +		/* Don't enable pclk for an AMBA device */
> +		*pclk = NULL;

Now the "apb" clock won't be enabled for amba devices. I'm assuming 
that's fine if the clock was always called "apb_pclk" for them, but the 
commit that added the new clock name didn't specify any special casing 
either.

Can we have a comment that says it's deliberate? But the more I think 
about it the more I'm confused why CTCU needed a different clock name to 
be defined, when all the other Coresight devices use "apb_pclk".

>   	}
>   
> -	return pclk;
> +	if (atclk) {
> +		*atclk = devm_clk_get_optional_enabled(dev, "atclk");
> +		if (IS_ERR(*atclk))
> +			return PTR_ERR(*atclk);
> +	}
> +
> +	return 0;
>   }
>   
>   #define CORESIGHT_PIDRn(i)	(0xFE0 + ((i) * 4))

