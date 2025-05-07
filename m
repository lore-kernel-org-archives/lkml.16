Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D03831C84BF
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 05:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746597585; cv=none; b=BjOcE3BtxAp27yCnp7cHl+3f7mNtDKpgrATU9Y6m33itb7BG4UqZTzJAhBqFlO56CbSagOEXa6Y2r88LSOlcO2sUaIl5dli/ZzreWyi20P9ZdqvzCxuE4iZ4oALfQciiJuHNKz6fhoqQt0GsWS6+xDoQ2PCpOWn/4KZwHkV9v2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746597585; c=relaxed/simple;
	bh=6Kn8YsyQvfoTP4YCbsIyH75roaDzrVHBXDJb4ih2S+A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fdTvgQpunHBijuvfWV76NIqS/Qtszj5rXKaV7dLOCnPWwX2pJcGEYmPsj+HmABzve8AqUxrapNM1Yf4f1oQNsf0Ec1Y4WfsPbgK+yjKEqvD1xR9SQQJM0BP5Zb7SOhbTQZ4wtGWVkDWDfbo8/dJiiGIpBiKzGtgBvtir6VdwIhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E7D32F;
	Tue,  6 May 2025 22:59:33 -0700 (PDT)
Received: from [192.168.0.12] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1F6C93F5A1;
	Tue,  6 May 2025 22:59:38 -0700 (PDT)
Message-ID: <5db14757-fd7b-441e-99b3-786f11df372b@arm.com>
Date: Wed, 7 May 2025 11:29:36 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/9] coresight: Disable programming clock properly
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20250423151726.372561-1-leo.yan@arm.com>
 <20250423151726.372561-5-leo.yan@arm.com>
 <f56a73a4-ae63-4a46-a493-322c4806b3a2@arm.com>
 <20250506095428.GB177796@e132581.arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250506095428.GB177796@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/6/25 15:24, Leo Yan wrote:
> On Fri, May 02, 2025 at 11:40:31AM +0530, Anshuman Khandual wrote:
>> Even though this might seem to be being bike shedding, the subject
>> line above could be re-organized something like the following for
>> better clarity.
>>
>>  coresight: Properly/Appropriately disable programming clocks
> 
> Sure.  I will change the subject to this.
> 
> [...]
> 
>>> @@ -725,8 +723,6 @@ static void debug_platform_remove(struct platform_device *pdev)
>>>  
>>>  	__debug_remove(&pdev->dev);
>>>  	pm_runtime_disable(&pdev->dev);
>>> -	if (!IS_ERR_OR_NULL(drvdata->pclk))
>>> -		clk_put(drvdata->pclk);
>>>  }
>> Should not these IS_ERR_OR_NULL() here be changed to IS_ERR() ?
> 
> For the case above, after changed to devm_clk_get_enabled() for the
> enabling programming clocks, we don't need any special handling and
> leave the clock disabling and releasing to the device model layer.

So it can be left unchanged for now and cleaned up later ?

> 
>> Because now there could not be a NULL return value.
>>
>> drvdata->pclk = coresight_get_enable_apb_pclk(&pdev->dev)
>>
>> #ifdef CONFIG_PM
>> static int debug_runtime_suspend(struct device *dev)
>> {
>>         struct debug_drvdata *drvdata = dev_get_drvdata(dev);
>>
>>         if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
>>                 clk_disable_unprepare(drvdata->pclk);
>>         return 0;
>> }
>>
>> static int debug_runtime_resume(struct device *dev)
>> {
>>         struct debug_drvdata *drvdata = dev_get_drvdata(dev);
>>
>>         if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
>>                 clk_prepare_enable(drvdata->pclk);
>>         return 0;
>> }
>> #endif
> 
>> There might more instances like these as well.
>> 	
>> git grep IS_ERR_OR_NULL drivers/hwtracing/coresight/ | grep "drvdata->pclk"
>> drivers/hwtracing/coresight/coresight-cpu-debug.c:      if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
>> drivers/hwtracing/coresight/coresight-cpu-debug.c:      if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
>> drivers/hwtracing/coresight/coresight-funnel.c: if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
>> drivers/hwtracing/coresight/coresight-funnel.c: if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
>> drivers/hwtracing/coresight/coresight-replicator.c:     if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
>> drivers/hwtracing/coresight/coresight-replicator.c:     if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
>> drivers/hwtracing/coresight/coresight-stm.c:    if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
>> drivers/hwtracing/coresight/coresight-stm.c:    if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
>> drivers/hwtracing/coresight/coresight-tpiu.c:   if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
>> drivers/hwtracing/coresight/coresight-tpiu.c:   if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
> 
> I would like the current patch to focus on the issue of disabling /
> releasing the programming clocks.
> 
> Though the IS_ERR_OR_NULL() check is redundant, it does not cause
> issue or regression.  The refactoring is left in patch 09 for removing
> IS_ERR_OR_NULL() checks.
> 
> Does this make sense?

Yes, it does now.
