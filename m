Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9241754B
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 00:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744246739; cv=none; b=p6pSOe1Eny9aNLzr4u+cnGrTRZI6JtKm2NPf3v/UpfgOUp4NNjyEw9FNF/qBDUcz1XFLc7gcl4q6o+FgVXGMamZfx1KG3/eNXUwXEsOAEMyE41nbKLsL3Bv/qIlpudQnoZAGLMMYcWz2cR4vV+BbR0jeItsY5SN1GHcd3sF5FB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744246739; c=relaxed/simple;
	bh=4arc1njgRnca5DoPKQQcWANVL3el80t9sGf5m5CWUco=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qXunYbzX+1zmzGARaPljWmjx/MdrOV/0cu6snNjYyr8Qq2J8+mTzzCaqLJN9pB4jl1berD5B2BkndR76oqqs2bsq83QgDIah/x48BFjMpLgsfQ6qj02gIBdS/P7qhz66Ge3bEPTBt8eoNCCiUUB2TQxHGQyoz3RmCLpcZLU4a4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Tj+VaqME; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Tj+VaqME"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744246736;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jPMbdDQCy877Twejqn2c7U/+9GGeSPvDHf2gAJVOtu4=;
	b=Tj+VaqMEml56YoFgbwyc17ooq+ZLYQ7abB4Ba4M99ejdT/qQTzjc7KCxgbbEHzwhr+Lw9g
	Fx1Apa498HHQpVXiW+JA0CLzHEHsSY5vYC+PCyF91n9XQtTajF5SOYdoBCTKALI+ug4Qyb
	s8eiTPWifIAOF9KNq/S2EsFyjjfW9ug=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-_4HZCxc1MEqWT1EO-Ht8_w-1; Wed, 09 Apr 2025 20:58:53 -0400
X-MC-Unique: _4HZCxc1MEqWT1EO-Ht8_w-1
X-Mimecast-MFC-AGG-ID: _4HZCxc1MEqWT1EO-Ht8_w_1744246733
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-224192ff68bso2210995ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 17:58:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744246732; x=1744851532;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jPMbdDQCy877Twejqn2c7U/+9GGeSPvDHf2gAJVOtu4=;
        b=pAvMPt0i9MNP4TGauQII/1UvyaoGYvAW0LReW7xx2GrHLeeMFQpRNZKZayTHbbJ4fg
         k3iVQKKr/FX4OiYwoU5t1eB/AxGgl0nmDBzH8d4VYKKCJaMD7K/Zf4piaUBveOY+stc2
         hlU6Qdl+is5iSI+nK4jwBIoeMFmAHAqc+KlBNIgjhn+9eZTAl/8XnoNbXsh4xFqPGSYO
         WuLED7pS0psUrMqnMgy4zCVBSfwtfCWvhM6/ePCcRWmWW/gl+xHyv3hFQy0YOVoJ6y2T
         9waL7PDZM9PsEJupiGxJCnEQqqJj65HQBr7gOTb43GVBfhSaBeBGmLjDb6ryavknR5fC
         VjFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmzUV64jOYP6bQSwinh9VxtWkFB4MAMuN7obTGimMEr7b0Nbijb3irgtOYq8VRw8EVDqFyJR21JU2lSjM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZEq95xA3tfcYDQMWmbAuyn9tRXNEKUQA2GM1228eDLKjj/Uv6
	ZSG+gYV/sHBjBVr8VPr8cIP/jowAddT0FxgQcfpfzS9wg7W7oaAIGNQNZJ54978tnon+QWwmacF
	qklmfvARDe84T9jgoV+AW+C0QhA6cSyCuLiIWaaIzeL+O6ziylToLNSTOuO/hcg==
X-Gm-Gg: ASbGncvkbfjXiz2xwPHZHgWlq887khI352JT+9ux9LXiHV72vdJXdnJ8CohhcBMiEuB
	kPx8GAaKoXgL9IY5z8leaVXgbiCkWVvFUsHkLvFpg/5s+RI19GWrjDKrEP5iicxtA+GJVFJuViu
	sB0w5/fhajrxzv8bXSwlHg+2ztqirM+3xEoICpGHlEBnXlmmjzDb58Ol7RM3Yo8bD5IYxJkrRZv
	qx1b8vu/tAWV90kszFcxSJNtSvaxMaRTN5Jr1k4+H5/cLxgacZcIJhm1eQGtP4KBCToyQCSc6qI
	Ge5lLm9lekHi
X-Received: by 2002:a17:902:f60b:b0:227:e980:919d with SMTP id d9443c01a7336-22b42c2d722mr13182245ad.47.1744246732600;
        Wed, 09 Apr 2025 17:58:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IER3K6q+KgZNHdXcPwt0+rY/1N6mq4yTEK+NRxfJiUeeJBOWfelPSBqxXdcgQCSVYvoNet3jw==
X-Received: by 2002:a17:902:f60b:b0:227:e980:919d with SMTP id d9443c01a7336-22b42c2d722mr13182115ad.47.1744246732259;
        Wed, 09 Apr 2025 17:58:52 -0700 (PDT)
Received: from [192.168.68.55] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccbf2bsm18663945ad.245.2025.04.09.17.58.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 17:58:51 -0700 (PDT)
Message-ID: <3a9c1db1-7598-4f71-be62-f6005e3fec72@redhat.com>
Date: Thu, 10 Apr 2025 10:58:46 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] mm/contpte: Optimize loop to reduce redundant
 operations
To: Xavier <xavier_qy@163.com>
Cc: dev.jain@arm.com, akpm@linux-foundation.org, baohua@kernel.org,
 ryan.roberts@arm.com, catalin.marinas@arm.com, ioworker0@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 will@kernel.org
References: <027cc666-a562-46fa-bca5-1122ea00ec0e@arm.com>
 <20250408085809.2217618-1-xavier_qy@163.com>
 <20250408085809.2217618-2-xavier_qy@163.com>
 <34a4bf01-6324-482b-a011-32974d68e02f@redhat.com>
 <711cf430.b25d.1961b1a1b0e.Coremail.xavier_qy@163.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <711cf430.b25d.1961b1a1b0e.Coremail.xavier_qy@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Xavier,

On 4/10/25 1:10 AM, Xavier wrote:
> 
> Thank you for carefully reviewing this patch and raising your questions.
> I'll try to explain and answer them below.
> 

Not a problem :)

> 
> At 2025-04-09 12:09:48, "Gavin Shan" <gshan@redhat.com> wrote:
>> Hi Xavier,
>>
>> On 4/8/25 6:58 PM, Xavier wrote:
>>> This commit optimizes the contpte_ptep_get function by adding early
>>>    termination logic. It checks if the dirty and young bits of orig_pte
>>>    are already set and skips redundant bit-setting operations during
>>>    the loop. This reduces unnecessary iterations and improves performance.
>>>
>>> Signed-off-by: Xavier <xavier_qy@163.com>
>>> ---
>>>    arch/arm64/mm/contpte.c | 22 ++++++++++++++++++++--
>>>    1 file changed, 20 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
>>> index bcac4f55f9c1..034d153d7d19 100644
>>> --- a/arch/arm64/mm/contpte.c
>>> +++ b/arch/arm64/mm/contpte.c
>>> @@ -152,6 +152,18 @@ void __contpte_try_unfold(struct mm_struct *mm, unsigned long addr,
>>>    }
>>>    EXPORT_SYMBOL_GPL(__contpte_try_unfold);
>>>    
>>
>> I'm wandering how it can work. More details are given below.
>>
>>> +#define CHECK_CONTPTE_FLAG(start, ptep, orig_pte, flag) \
>>> +	do { \
>>> +		int _start = start; \
>>> +		pte_t *_ptep = ptep; \
>>> +		while (_start++ < CONT_PTES) { \
>>> +			if (pte_##flag(__ptep_get(_ptep++))) { \
>>> +				orig_pte = pte_mk##flag(orig_pte); \
>>> +				break; \
>>> +			} \
>>> +		} \
>>> +	} while (0)
>>> +

nit: the variable _start and _ptep can be dropped since the caller is going to
bail after CHECK_CONTPTE_FLAG(). However, I'm wandering it's going to introduce
burden to contpte_ptep_get() for its readability, much more complex than I
thought.

>>
>> CONT_PTES is 16 with the assumption of 4KB base page size. CHECK_CONTPTE_FLAG()
>> collects the flag for ptep[start, CONT_PTES].
>>
>>>    pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte)
>>>    {
>>>    	/*
>>> @@ -169,11 +181,17 @@ pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte)
>>>    	for (i = 0; i < CONT_PTES; i++, ptep++) {
>>>    		pte = __ptep_get(ptep);
>>>    
>>> -		if (pte_dirty(pte))
>>> +		if (pte_dirty(pte)) {
>>>    			orig_pte = pte_mkdirty(orig_pte);
>>> +			CHECK_CONTPTE_FLAG(i, ptep, orig_pte, young);
>>> +			break;
>>> +		}
>>>    
>>> -		if (pte_young(pte))
>>> +		if (pte_young(pte)) {
>>>    			orig_pte = pte_mkyoung(orig_pte);
>>> +			CHECK_CONTPTE_FLAG(i, ptep, orig_pte, dirty);
>>> +			break;
>>> +		}
>>>    	}
>>>    
>>>    	return orig_pte;
>>
>> There are two issues as I can see: (1) The loop stops on any dirty or young flag. Another
>> flag can be missed when one flag is seen. For example, when ptep[0] has both dirty/young
>> flag, only the dirty flag is collected. (2) CHECK_CONTPTE_FLAG() iterates ptep[i, CONT_PTES],
>> conflicting to the outer loop, which iterates ptep[0, CONT_PTES].
> 
> No flags will be missed. The outer loop is used to check for the first flag,
> which could be either the dirty or young flag.
> Once this flag (let's assume it's the dirty flag) is found in the i-th PTE,
> the dirty flag of orig_pte will be set, and the code will immediately enter
> the inner loop, namely CHECK_CONTPTE_FLAG. This inner loop will continue
> to check only for the young flag starting from the i-th position, and we needn't
> concern about the dirty flag anymore.
> If CHECK_CONTPTE_FLAG finds the young flag in the j-th PTE, the young flag
> of orig_pte will be set. At this point, both the young and dirty flags of
> orig_pte have been set, and there's no need for further loop judgments, so
> the both the inner and outer loops can be exited directly. This approach
> reduces unnecessary repeated traversals and judgments.
> 

Thanks for the explanation. I missed that the subsequent young bit is collected
on pte_dirty(). Similarly, the subsequent dirty bit is collected on pte_young().
Now I can see all (dirty | young) bits are collected with a lost.

>>
>> Besides, I also doubt how much performance can be gained by bailing early on (dirty | young).
>> However, it's avoided to cross the L1D cache line boundary if possible. With 4KB base page
>> size, 128 bytes are needed for ptep[CONT_PTES], equal to two cache lines. If we can bail
>> early with luck, we don't have to step into another cache line. Note that extra checks needs
>> more CPU cycles.
> 
> Compared to the previous function, this code doesn't add any extra checks.
> Even in the worst-case scenario, where neither a dirty nor a young flag is
> found among the 16 PTEs, the number of checks is the same as in the original
> function. If any flag is found earlier, the optimized patch will reduce the
> number of subsequent checks for that flag compared to the original code.
> 

There are 32 checks in the original code (assuming we have 4kb base page size
and CONT_PTES == 16) and the number of checks is fixed. With your patch applied,
the number becomes 32 + (number from CHECK_CONTPTE_FLAG) if all PTEs have
pte_dirty() and none of them has pte_young(), if I don't miss anything here.


> I'm not sure if my explanation is clear. If you have any further questions,
> feel free to communicate with me again.
> 

Thanks for the explanation, helped me to understand how all (dirty|young) bits
are collected without a lost.

Thanks,
Gavin

