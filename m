Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4326D28030F
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 10:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749551982; cv=none; b=L60LqZFgKxhL16Il6NvkErdbruBJUKTQynZQtAZAylCmKFG9uw41mHdkIdcWxLKjWHLEW7o7LIZsRUFX2ewy9oiwQ81hPRDj5WJcFNzHbS3qM/0J3ptDqk42tuvXjHRyeT5JHoCvJVAztzkVrcyykaE7p02nGxMAZW2E4t/U6eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749551982; c=relaxed/simple;
	bh=cUDwS84gwYX1k3VE2aUeyen1cx0WC4M7idhBd6NbVaY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kenaxpq5MEYaNR3bhTexAO+Viave+SRFM0XI7Q/HTwHGawZmO66HnXQf/dPDjIDBjqKxB3czufL4No46mrDwq2wEfpfbcRMjUzRo3FwtYKf+BpKzV1JellaWD7By5yskaKaSVzn2ktA4op9BMMYcoTYBrqg4sadV5gm/oiGnbv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5E698169C;
	Tue, 10 Jun 2025 03:39:20 -0700 (PDT)
Received: from [10.163.32.103] (unknown [10.163.32.103])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E93173F673;
	Tue, 10 Jun 2025 03:39:35 -0700 (PDT)
Message-ID: <b20a6309-ae31-496d-a1ad-61ea358ad7a9@arm.com>
Date: Tue, 10 Jun 2025 16:09:32 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/9] coresight: Avoid enable programming clock
 duplicately
To: Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250609-arm_cs_fix_clock_v3_public-v3-0-423b3f1f241d@arm.com>
 <20250609-arm_cs_fix_clock_v3_public-v3-6-423b3f1f241d@arm.com>
 <b30fc361-a04f-4a48-b8e2-f7c2da213e6c@arm.com>
 <20250609171413.GO8020@e132581.arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250609171413.GO8020@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 09/06/25 10:44 PM, Leo Yan wrote:
> On Mon, Jun 09, 2025 at 05:58:34PM +0100, Suzuki Kuruppassery Poulose wrote:
> 
> [...]
> 
>>>   static inline struct clk *coresight_get_enable_apb_pclk(struct device *dev)
>>>   {
>>> -	struct clk *pclk;
>>> +	struct clk *pclk = NULL;
>>> -	pclk = devm_clk_get_enabled(dev, "apb_pclk");
>>> -	if (IS_ERR(pclk))
>>> -		pclk = devm_clk_get_enabled(dev, "apb");
>>> +	if (!dev_is_amba(dev)) {
>>> +		pclk = devm_clk_get_enabled(dev, "apb_pclk");
>>> +		if (IS_ERR(pclk))
>>> +			pclk = devm_clk_get_enabled(dev, "apb");
>>
>> AMBA driver doesn't handle "apb" clock ? So we may need to retain that here
>> ?
> 
> Here checks the condition "if (!dev_is_amba(dev))", it means the device
> is not an AMBA device (e.g., a platform device), the APB clock is
> enabled at here.

Just exit early for AMBA devices when 'pclk' clock is still NULL ?

	if (dev_is_amba(dev))
		return pclk;

> 
> Otherwise, for a AMBA device, the AMBA bus layer will help to enable
> APB clock.
> 
>> Otherwise looks good to me.
>>
>> Suzuki
>>> +	}
>>>   	return pclk;
>>>   }
>>>
>>


