Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F7A21AF0B4
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 04:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750738990; cv=none; b=UO+JMz71zq76cNgi1snqO34u/4OyFOXov6DgEtYmCM3DTwxNsggB90UhHJZoRj8az94TGYWHVAXUo1V76EviV2HX0/zPESwnPfkQ7hpKPb3WRyjIN/RYP/rS6eN0lhdKOiG3+zvzTt+l4EaVLOostpZ+LYfF1Wim/dOUL90HEzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750738990; c=relaxed/simple;
	bh=jEHsntUX9cHfo/BuaTSMz7iCtGH6IPgw9BdOjQ1J3bY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RXHMCndkx/FllxXLFPRgVG2WSUD3TOx5RmajZTHK9UHdqvbEPU6/VAwvRYyjY0Z75LNd56VFdm2KFQGgtfUAoKz00LItl9CEvpuU3iLufpZ0Rzl7+9JvND98rLVB/3FshWlbNUkTL5A5TL8I6jfW3aa5935iLgs0i/Tcv0EUvJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A58E6106F;
	Mon, 23 Jun 2025 21:22:48 -0700 (PDT)
Received: from [10.163.36.19] (unknown [10.163.36.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9BD8A3F63F;
	Mon, 23 Jun 2025 21:23:03 -0700 (PDT)
Message-ID: <f565a64e-62d8-4cb3-b1b1-6de981b1052a@arm.com>
Date: Tue, 24 Jun 2025 09:53:00 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/9] coresight: Appropriately disable programming
 clocks
To: Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250609-arm_cs_fix_clock_v3_public-v3-0-423b3f1f241d@arm.com>
 <20250609-arm_cs_fix_clock_v3_public-v3-4-423b3f1f241d@arm.com>
 <e18507cb-bcbf-4cdd-8364-9bce0ea016d5@arm.com>
 <20250609163840.GL8020@e132581.arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250609163840.GL8020@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 09/06/25 10:08 PM, Leo Yan wrote:
> On Mon, Jun 09, 2025 at 05:11:21PM +0100, Suzuki Kuruppassery Poulose wrote:
>> On 09/06/2025 17:00, Leo Yan wrote:
>>> Some CoreSight components have programming clocks (pclk) and are enabled
>>> using clk_get() and clk_prepare_enable().  However, in many cases, these
>>> clocks are not disabled when modules exit and only released by clk_put().
>>>
>>> To fix the issue, this commit refactors coresight_get_enable_apb_pclk()
>>> by replacing clk_get() and clk_prepare_enable() with
>>> devm_clk_get_enabled() for enabling APB clock.  Callers are updated
>>> to reuse the returned error value.
>>>
>>> With the change, programming clocks are managed as resources in driver
>>> model layer, allowing clock cleanup to be handled automatically.  As a
>>> result, manual cleanup operations are no longer needed and are removed
>>> from the Coresight drivers.
>>>
>>> Fixes: 73d779a03a76 ("coresight: etm4x: Change etm4_platform_driver driver for MMIO devices")
>>
>> This looks suspicious. This patch covers a lot of components, but the
>> above commit is only affecting ETMv4 ?
> 
> Since commit 73d779a03a76 is the earliest patch that introduced the
> issue, it has been selected as the fix tag. We assume this will cover
> any subsequent changes that have the same issue.

Although I am not still sure about this patch actually requiring a
'Fixes:' tag as it just transitions into the device managed clocks
rather than fixing an existing issue. But choosing the first commit
makes sense as Leo has explained.

> 
>> The patch as such looks good to me.
> 
> Thanks for review!
> 
>> Suzuki
> 

