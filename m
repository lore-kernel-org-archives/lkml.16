Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C016A26ACB
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 04:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750740215; cv=none; b=NQtJm6igDxRPqJlGy7o8zW6YKSKUrgKLczVi2vxQbMuAQErjHtg7q/0wOmUPtUnbvqs3jAjGOsdLmtfNR8t5h7S9T4Xn6OckEG1e5K0HQC0JO7B/os5K/kPLrWF/Ks+5aDj307Ul6IYJ6v3u56CeMhxVYgIykV1F13b81ngjhLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750740215; c=relaxed/simple;
	bh=P/hb+u0LXYiGNwqlZgqoX+m6SX48etU2JZChcifo1Dw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BbBaKscWNq71goF6fWjN5Ni7tza+X/nXMrEcGYFmn20J6Jas9AL7auavMnayCrhvw1vvn0YtvCnvDOnUOx4Z4IEJ6uaKl1xLkoQSv/zMBqum7/GE0UduOE4haF8BRZY2iaiCheJpx3hjhVr24eykcx4s6QIpu/BRJr89Dq7YXcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 304D5106F;
	Mon, 23 Jun 2025 21:43:15 -0700 (PDT)
Received: from [10.163.36.19] (unknown [10.163.36.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EC0CC3F63F;
	Mon, 23 Jun 2025 21:43:29 -0700 (PDT)
Message-ID: <291dae35-af69-4fa5-abca-f0a36e1c47d2@arm.com>
Date: Tue, 24 Jun 2025 10:13:26 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/9] coresight: Avoid enable programming clock
 duplicately
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250609-arm_cs_fix_clock_v3_public-v3-0-423b3f1f241d@arm.com>
 <20250609-arm_cs_fix_clock_v3_public-v3-6-423b3f1f241d@arm.com>
 <b30fc361-a04f-4a48-b8e2-f7c2da213e6c@arm.com>
 <20250609171413.GO8020@e132581.arm.com>
 <b20a6309-ae31-496d-a1ad-61ea358ad7a9@arm.com>
 <20250610120351.GQ8020@e132581.arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250610120351.GQ8020@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/06/25 5:33 PM, Leo Yan wrote:
> On Tue, Jun 10, 2025 at 04:09:32PM +0530, Anshuman Khandual wrote:
>>
>>
>> On 09/06/25 10:44 PM, Leo Yan wrote:
>>> On Mon, Jun 09, 2025 at 05:58:34PM +0100, Suzuki Kuruppassery Poulose wrote:
>>>
>>> [...]
>>>
>>>>>   static inline struct clk *coresight_get_enable_apb_pclk(struct device *dev)
>>>>>   {
>>>>> -	struct clk *pclk;
>>>>> +	struct clk *pclk = NULL;
>>>>> -	pclk = devm_clk_get_enabled(dev, "apb_pclk");
>>>>> -	if (IS_ERR(pclk))
>>>>> -		pclk = devm_clk_get_enabled(dev, "apb");
>>>>> +	if (!dev_is_amba(dev)) {
>>>>> +		pclk = devm_clk_get_enabled(dev, "apb_pclk");
>>>>> +		if (IS_ERR(pclk))
>>>>> +			pclk = devm_clk_get_enabled(dev, "apb");
>>>>
>>>> AMBA driver doesn't handle "apb" clock ? So we may need to retain that here
>>>> ?
>>>
>>> Here checks the condition "if (!dev_is_amba(dev))", it means the device
>>> is not an AMBA device (e.g., a platform device), the APB clock is
>>> enabled at here.
>>
>> Just exit early for AMBA devices when 'pclk' clock is still NULL ?
>>
>> 	if (dev_is_amba(dev))
>> 		return pclk;
> 
> If it is an AMBA device, we should return a NULL pointer, as this
> indicates that the APB clock is not managed by the CoreSight driver.
> 
> In this patch, I did not perform any refactoring and simply made a
> straightforward changed.  The refactoring is done in the patch 07, as
> you suggested, where the function is refined as:
> 
>     if (dev_is_amba(dev)) {
>         return NULL;
>     } else {
>         pclk = devm_clk_get_enabled(dev, "apb_pclk");
>         ...
>     }
> 
> Would it be acceptable to keep this patch as it is?

Agreed. Let's avoid the churn here as the refactoring happens
later anyway.

