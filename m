Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 518BC2E62BC
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 09:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743760009; cv=none; b=dfhDi6OFU6yYLz7u+7zHDsNjgEAZW5dv6i5fRxG0rg2SjAzZ6wVwcZfKaw9oJ1VE+ieIv0GPWdw2ouywnLEVwRNZ8paj+7kjJH6Ora9ZNm/TuWLl77CXPmTJXzMcysJsh2DYGvxqXQuIb+r0NyJ2uh5D7TDnvbFtj8sqvNHYMFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743760009; c=relaxed/simple;
	bh=4vcuXbWePBB/fL1w+vdZnSlLMmRJFzfc5SznNyXcUbY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=SZvpNr8TGuKhtPXbwhkClJYXDRo1MKgRs9TnUtZsA4nqSJarZzfVFvRidK5lkGRBK9iZ9Gafe+0rblrzWaGAd7Pitm784ZP6K4AKFmcLyq1zbWPtaKkUNbIzC7Y0MU+5Txgm4sU1qch4FsUe6CkZ/hylFg06eQeOuozI73nnwzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9072A1515;
	Fri,  4 Apr 2025 02:46:49 -0700 (PDT)
Received: from [10.1.29.21] (unknown [10.1.29.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 06A633F59E;
	Fri,  4 Apr 2025 02:46:45 -0700 (PDT)
Message-ID: <69f3429a-57ba-4c02-b1a7-bbf95b2b19db@arm.com>
Date: Fri, 4 Apr 2025 10:46:24 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: Re: [PATCH v2 1/3] coresight: catu: Introduce refcount and spinlock
 for enabling/disabling
To: Yabin Cui <yabinc@google.com>, Leo Yan <leo.yan@arm.com>
Cc: Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250402011832.2970072-1-yabinc@google.com>
 <20250402011832.2970072-2-yabinc@google.com>
 <CALJ9ZPNBGBd9OTBgedoQStXh3d2oGDGi6fUF7PXbU5qTEBRHew@mail.gmail.com>
 <20250402130145.GI115840@e132581.arm.com>
 <CALJ9ZPMx7vqjgkn8OApLBAPwF35v=enHc07A==LXG0C+922rag@mail.gmail.com>
Content-Language: en-GB
In-Reply-To: <CALJ9ZPMx7vqjgkn8OApLBAPwF35v=enHc07A==LXG0C+922rag@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 03/04/2025 18:53, Yabin Cui wrote:
> On Wed, Apr 2, 2025 at 6:01 AM Leo Yan <leo.yan@arm.com> wrote:
>>
>> Hi Yabin,
>>
>> On Tue, Apr 01, 2025 at 06:21:59PM -0700, Yabin Cui wrote:
>>
>> [...]
>>
>>>> @@ -486,12 +491,17 @@ static int catu_disable_hw(struct catu_drvdata *drvdata)
>>>>
>>>>   static int catu_disable(struct coresight_device *csdev, void *__unused)
>>>>   {
>>>> -       int rc;
>>>> +       int rc = 0;
>>>>          struct catu_drvdata *catu_drvdata = csdev_to_catu_drvdata(csdev);
>>>> +       guard(raw_spinlock_irqsave)(&catu_drvdata->spinlock);
>>>>
>>>> -       CS_UNLOCK(catu_drvdata->base);
>>>> -       rc = catu_disable_hw(catu_drvdata);
>>>> -       CS_LOCK(catu_drvdata->base);
>>>> +       if (--csdev->refcnt == 0) {
>>>> +               CS_UNLOCK(catu_drvdata->base);
>>>> +               rc = catu_disable_hw(catu_drvdata);
>>>> +               CS_LOCK(catu_drvdata->base);
>>>> +       } else {
>>>> +               rc = -EBUSY;
>>
>> This is not an error if the decremented reference counter is not zero.
>> It should return 0.  Otherwise, the change looks good to me.
> 
> In coresight_disable_helpers(), the return value of catu_disable()
> isn't checked.
> The -EBUSY return was used for consistency with other refcounted
> disable functions
> like tmc_disable_etf_sink() and tmc_disable_etr_sink(). I'm happy to
> change it back
> to 0 if you believe that would be the more accurate return value here.

Please stick to 0 here. This indicates there was no errors w.r.t the 
current session. This is similar to what we do for TMC ETR for e.g.

Suzuki


> 
>>
>> Thanks,
>> Leo

