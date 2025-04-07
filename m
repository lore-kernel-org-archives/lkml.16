Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDEB5206F15
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 16:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744042772; cv=none; b=A8jbedohoCAruJUuC0gkGL1oLr9ko8iv0RIijl17NEjYoT7FV1wpdCk3AzLVONq3W9BrKUgEpi3OVqbT0/g8pwM1dggknGHRjemT9xGMcqaUTAj7rz5fq68kx4PCrbPsI1ykCbXCdDBVnnqdCGb5q9WGfPWXlt1+cppg0Qb54ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744042772; c=relaxed/simple;
	bh=4UC/rgfRBB7IjSpqVVak6OnBM5vwAuWy08QCMNXJA7w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aksDVUcywSSGIaLtrdu76fpEOn8RuZT7YLaZocjk8hhpZT5UVLT5vkBg1OEpXkfCAREEi0VVDHo7+LZAESCrznuzRUr80ejVK4DUXDEfgDfVPbMhWcHcadogFO5h/aK+NIZgPC3ratXLlrR73CAXL46kTqp1vgDAk6jNS3v3NfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 10A2B106F;
	Mon,  7 Apr 2025 09:19:31 -0700 (PDT)
Received: from [10.163.47.133] (unknown [10.163.47.133])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DAEE03F694;
	Mon,  7 Apr 2025 09:19:25 -0700 (PDT)
Message-ID: <027cc666-a562-46fa-bca5-1122ea00ec0e@arm.com>
Date: Mon, 7 Apr 2025 21:49:21 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] mm/contpte: Optimize loop to reduce redundant
 operations
To: Lance Yang <ioworker0@gmail.com>, Xavier <xavier_qy@163.com>
Cc: akpm@linux-foundation.org, baohua@kernel.org, catalin.marinas@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 ryan.roberts@arm.com, will@kernel.org
References: <20250407092243.2207837-1-xavier_qy@163.com>
 <20250407112922.17766-1-ioworker0@gmail.com>
 <5e3f976f.bca1.19610528896.Coremail.xavier_qy@163.com>
 <CAK1f24=hwXCg6K8a=qoWi2DGEWFGBcenSGRoKXtJEo=iR4DtDw@mail.gmail.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <CAK1f24=hwXCg6K8a=qoWi2DGEWFGBcenSGRoKXtJEo=iR4DtDw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Hi Xavier,

On 07/04/25 7:01 pm, Lance Yang wrote:
> On Mon, Apr 7, 2025 at 8:56 PM Xavier <xavier_qy@163.com> wrote:
>>
>>
>>
>> Hi Lance,
>>
>> Thanks for your feedback, my response is as follows.
>>
>> --
>> Thanks,
>> Xavier
>>
>>
>>
>>
>>
>> At 2025-04-07 19:29:22, "Lance Yang" <ioworker0@gmail.com> wrote:
>>> Thanks for the patch. Would the following change be better?
>>>
>>> diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
>>> index 55107d27d3f8..64eb3b2fbf06 100644
>>> --- a/arch/arm64/mm/contpte.c
>>> +++ b/arch/arm64/mm/contpte.c
>>> @@ -174,6 +174,9 @@ pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte)
>>>
>>>                if (pte_young(pte))
>>>                        orig_pte = pte_mkyoung(orig_pte);
>>> +
>>> +              if (pte_young(orig_pte) && pte_dirty(orig_pte))
>>> +                      break;
>>>        }

Quite the coincidence, I was thinking of doing exactly this some days 
back and testing it out : ) Can you do a microanalysis whether this gets 
us a benefit or not? This looks like an optimization on paper but may 
not be one after all because CONT_PTES is only 16 and a simple loop 
without extra if-conditions may just be faster.

>>>
>>>        return orig_pte;
>>> --
>>>
>>> We can check the orig_pte flags directly instead of using extra boolean
>>> variables, which gives us an early-exit when both dirty and young flags
>>> are set.
>> Your way of writing the code is indeed more concise. However, I think
>>   using boolean variables might be more efficient. Although it introduces
>>   additional variables, comparing boolean values is likely to be more
>>   efficient than checking bit settings.
>>
>>>
>>> Also, is this optimization really needed for the common case?
>> This function is on a high-frequency execution path. During debugging,
>>   I found that in most cases, the first few pages are already marked as
>>   both dirty and young. But currently, the program still has to complete
>>   the entire loop of 16 ptep iterations, which seriously reduces the efficiency.
> 
> Hmm... agreed that this patch helps when early PTEs are dirty/young, but
> for late-ones-only cases, it only introduces overhead with no benefit, IIUC.
> 
> So, let's wait for folks to take a look ;)
> 
> Thanks,
> Lance
> 
>>>
>>> Thanks,
>>> Lance
> 

