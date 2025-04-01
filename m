Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F7F81E9B1D
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 08:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743495752; cv=none; b=hJEIo4wKoPjEWGoY8YaFHutBViui4qCLRX2GYWiCq9ilCrV+W1SfGHCi/m/gaZnH6IJZcZNEidlLVyhAgATwVB8SUy/LL1dnXe99mcG7ReeF58tHcUxODE8CaW32Im/Z1i8MToKuUyRyyFZu3AEtp0WLPtTVxhxWzdjdb3MQMP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743495752; c=relaxed/simple;
	bh=AKdBPvjYOjc/lPydVrGT16flMXEBjQo54pybvf7KCD8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B5RG4nBBHmlOVXqj3tnkISiGg+UZAaYwPMz/UVxtla08l98tDRe3SrhoEZkxp7SqdEMv/6l4/9KPRyKwnnKFmlbDwR3jWoiykng9YuFAlKeXCsWGw4T1N1XtRApvLfM4ykFV2vNjGtzDRszRehxaoN6riD1a91H20FVoMsEGqaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 91ABB14BF;
	Tue,  1 Apr 2025 01:22:32 -0700 (PDT)
Received: from [10.162.16.153] (unknown [10.162.16.153])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 204D03F63F;
	Tue,  1 Apr 2025 01:22:26 -0700 (PDT)
Message-ID: <c5d835bc-883d-449f-afd3-16a09e418e1b@arm.com>
Date: Tue, 1 Apr 2025 13:52:24 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: Don't call NULL in do_compat_alignment_fixup
To: Angelos Oikonomopoulos <angelos@igalia.com>,
 linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, will@kernel.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com
References: <20250331085415.122409-1-angelos@igalia.com>
 <17de4426-8263-4ccb-8420-f6913d478ae9@arm.com>
 <D8V3VKNJJI1Z.27C32MUQ1OLYF@igalia.com>
 <c1dc28a9-7a36-4303-a8eb-0e227d866c37@arm.com>
 <D8V5E7FT19GH.3EUO3I50GYF8J@igalia.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <D8V5E7FT19GH.3EUO3I50GYF8J@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/1/25 13:39, Angelos Oikonomopoulos wrote:
> On Tue Apr 1, 2025 at 9:47 AM CEST, Anshuman Khandual wrote:
>>
>>
>> On 4/1/25 12:28, Angelos Oikonomopoulos wrote:
>>> On Tue Apr 1, 2025 at 8:05 AM CEST, Anshuman Khandual wrote:
>>>> On 3/31/25 14:24, Angelos Oikonomopoulos wrote:
> [...]
>>>>>  arch/arm64/kernel/compat_alignment.c | 2 ++
>>>>>  1 file changed, 2 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm64/kernel/compat_alignment.c b/arch/arm64/kernel/compat_alignment.c
>>>>> index deff21bfa680..b68e1d328d4c 100644
>>>>> --- a/arch/arm64/kernel/compat_alignment.c
>>>>> +++ b/arch/arm64/kernel/compat_alignment.c
>>>>> @@ -368,6 +368,8 @@ int do_compat_alignment_fixup(unsigned long addr, struct pt_regs *regs)
>>>>>  		return 1;
>>>>>  	}
>>>>>  
>>>>> +	if (!handler)
>>>>> +		return 1;
>>>>
>>>> do_alignment_t32_to_handler() could return NULL, returning 1 seems to be
>>>> the right thing to do here and consistent. Otherwise does this cause a
>>>> kernel crash during subsequent call into handler() ?
>>>
>>> Yes. We call a NULL pointer so we Oops.
>>
>> Then the commit message should have the kernel Oops splash dump and also
>> might need to have Fixes: and CC: stable tags etc ?
> 
> Sure, I can add those. Thanks for the suggestions!
> 
>> Also wondering if handler return value should be checked inside the switch
>> block just after do_alignment_t32_to_handler() assignment.
>>
>> 	handler = do_alignment_t32_to_handler()
>> 	if (!handler)
>> 		return 1
> 
> I can see the appeal of that, but I think placing the check right before
> the single dereference is a more future-proof fix, in that it reduce the
> chances that a later patch will re-introduce a potential NULL pointer
> dereference.

Makes sense. A small nit - just wondering if the following restructuring
here would make things bit more readable ? Regardless, your decision.

	if (handler)
        	type = handler(addr, instr, regs);
        else
                return 1;
> 
> Angelos
> 
