Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE931EE006
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 03:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744254404; cv=none; b=CFWcmgzC+OVm7U0IukDNuAM0tSo3ihrHGc8zfo5HGYI5K4gDEEg5MU2y1JNXB/F9ZsK0Md8BKN6+PYRJbF6NCuLAYeYqT6buldGsJXrLbaykZIEykCeqFkcTxM0gHpdbx0tVaar37wgVUN5TXKGSLK2c9Pe7tYTIUTYQk8APRE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744254404; c=relaxed/simple;
	bh=tksNHgHRCsEVxjpDPPHElpCkWFpoa1+G8XyxUdBsxXY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n61N/oMP/U0nlJPMzPelxDbwGjisUpkeiZlzs8Socshcy39RiQryFfuhsVqTdEGVqkxvVjXJLVlx2uOaLJFWiDB3tk/hU4dGLfFhnw6oqK1Xnzb1PgND7RdfJnaXJq9/Ug/K5TK5d0+LmHr/8kbZYvWCNr3rodnhS0iz9VoY3KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SE5Wemep; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SE5Wemep"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744254402;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9XMr/eO0DdnkcMTouhh5uGqjIuVE+H+9lNMnsptGCrs=;
	b=SE5Wemepkq767cKZxrxC6mQBflshzA+XVbnI7Y8exDS9gMTVA1aVzwBez536UaZ9g3cQCU
	Va9kuALwIt5cD1dwXd/YP4psNlgOX1GiKqRDskfN9kxMrJuYr0Eu0yuD3N1sfV1VtR5/GE
	wZru7VGK33QTL8ppwSpGw2fV3OGrSEs=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-blAt_6_vMJ-xTAML0MktEw-1; Wed, 09 Apr 2025 23:06:41 -0400
X-MC-Unique: blAt_6_vMJ-xTAML0MktEw-1
X-Mimecast-MFC-AGG-ID: blAt_6_vMJ-xTAML0MktEw_1744254400
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-af5310c1ac1so260116a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 20:06:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744254398; x=1744859198;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9XMr/eO0DdnkcMTouhh5uGqjIuVE+H+9lNMnsptGCrs=;
        b=W2y0+bDW6SHOSEHeHbVx2/zB2dcPOgwY4PBpURcazhTvfOEYQ3gyVLcrW1qXh3SHBY
         T1KLezt6Io+xMEatHCZnr4JQaI7mDxfM2MvSoJ4L7Re60lmCf1w4DmHHJzTUtzsTvKx1
         7Ai0pKOzcWZCqlpzGp4uYS78Sl7zEe0184xhmxLuzVJUjPyBDXRfo5edrZKd/A2Uzwcw
         2jcm/AI0u3IlqJonRjOptbXcS/tHs6dovSiH0ARPGxR2+FIfvRByvNFSJlQnlPPRo8Vt
         yuJv867eUaPjDbIkBkKvTtmbxMr5j4apJiL2awlBYpfsl9XZEs+YdflEe7JSEWD/4kBT
         N0uw==
X-Forwarded-Encrypted: i=1; AJvYcCWVqOznlN7b5AquYcSJdMr/TlVFCC6npy3nYzfFCxsxcsh7wxC2UucqCo65xWHcZM759F25P6kjmxT26zM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrrJsYF/byLMFGIajqnwzUHClC8AYRZj6uZ1Wx7tjILYBvoP0s
	x0dRksNslHXbfiGMy7lf2CxbxvV/8rjbxB3oW6MiPN8kqHZjdsl3eKk1EEQX1L+jpdLLTyTRW/x
	+FwbEyerL6HL/JhSdFZM7VeGWkfWu8tu59UH+IshcG6M63GAtzbjiOX16HtsZzBBKlhuf3w==
X-Gm-Gg: ASbGnctgaKbbmXRKS+OD+j2Lx5TR7YUjJZtenJXpuQR4kJiDDYb+/IDwuiH1R7tH7wv
	S4TM8I1WR2Di4DT5TOyThLJ6G1NPUWPezubzc3G0yw1moi6nvjyagX0ujsvJXL561ZfQpsMbwik
	awy6VgPYKKbYa5kbLMnKqIgp0ujg++4NRE7YVvXWLmIH+f6JJt1bkCyD9XQVYsECoghpU48iDTB
	vjd10qgUf974zbtlRH12am28xnHSYM5vVGE2l7IHZ6hlH3psBHG6DWMjv95//2VfWyOJPW8GXu8
	omUGMwcq765h
X-Received: by 2002:a17:902:d4ca:b0:223:2630:6b82 with SMTP id d9443c01a7336-22b2edad4damr17421965ad.10.1744254398099;
        Wed, 09 Apr 2025 20:06:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzlBkyEQFpu9vtQ/YjmuNT9je8xNQcOB1fjPDsW03Tq7GevZn8h8JQCXraYTcFA36FNyc+tA==
X-Received: by 2002:a17:902:d4ca:b0:223:2630:6b82 with SMTP id d9443c01a7336-22b2edad4damr17421675ad.10.1744254397748;
        Wed, 09 Apr 2025 20:06:37 -0700 (PDT)
Received: from [192.168.68.55] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccb57fsm19847395ad.229.2025.04.09.20.06.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 20:06:37 -0700 (PDT)
Message-ID: <343c26b4-285d-404b-a397-2b5785cfe18e@redhat.com>
Date: Thu, 10 Apr 2025 13:06:31 +1000
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
 <3a9c1db1-7598-4f71-be62-f6005e3fec72@redhat.com>
 <32828be7.3220.1961d9e3cc3.Coremail.xavier_qy@163.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <32828be7.3220.1961d9e3cc3.Coremail.xavier_qy@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Xavier,

On 4/10/25 12:53 PM, Xavier wrote:
> At 2025-04-10 08:58:46, "Gavin Shan" <gshan@redhat.com> wrote:
>>
>> On 4/10/25 1:10 AM, Xavier wrote:
>>>
>>> Thank you for carefully reviewing this patch and raising your questions.
>>> I'll try to explain and answer them below.
>>>
>>
>> Not a problem :)
>>
>>>
>>> At 2025-04-09 12:09:48, "Gavin Shan" <gshan@redhat.com> wrote:
>>>> Hi Xavier,
>>>>
>>>> On 4/8/25 6:58 PM, Xavier wrote:
>>>>> This commit optimizes the contpte_ptep_get function by adding early
>>>>>     termination logic. It checks if the dirty and young bits of orig_pte
>>>>>     are already set and skips redundant bit-setting operations during
>>>>>     the loop. This reduces unnecessary iterations and improves performance.
>>>>>
>>>>> Signed-off-by: Xavier <xavier_qy@163.com>
>>>>> ---
>>>>>     arch/arm64/mm/contpte.c | 22 ++++++++++++++++++++--
>>>>>     1 file changed, 20 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
>>>>> index bcac4f55f9c1..034d153d7d19 100644
>>>>> --- a/arch/arm64/mm/contpte.c
>>>>> +++ b/arch/arm64/mm/contpte.c
>>>>> @@ -152,6 +152,18 @@ void __contpte_try_unfold(struct mm_struct *mm, unsigned long addr,
>>>>>     }
>>>>>     EXPORT_SYMBOL_GPL(__contpte_try_unfold);
>>>>>     
>>>>
>>>> I'm wandering how it can work. More details are given below.
>>>>
>>>>> +#define CHECK_CONTPTE_FLAG(start, ptep, orig_pte, flag) \
>>>>> +	do { \
>>>>> +		int _start = start; \
>>>>> +		pte_t *_ptep = ptep; \
>>>>> +		while (_start++ < CONT_PTES) { \
>>>>> +			if (pte_##flag(__ptep_get(_ptep++))) { \
>>>>> +				orig_pte = pte_mk##flag(orig_pte); \
>>>>> +				break; \
>>>>> +			} \
>>>>> +		} \
>>>>> +	} while (0)
>>>>> +
>>
>> nit: the variable _start and _ptep can be dropped since the caller is going to
>> bail after CHECK_CONTPTE_FLAG(). However, I'm wandering it's going to introduce
>> burden to contpte_ptep_get() for its readability, much more complex than I
>> thought.
> 
> Not adding these two variables in the current code has no impact. The main purpose
> of adding them is to improve maintainability and prevent the external code from
> continuing operations unknowingly after the macro has modified the variables.
> 
>>
>>>>
>>>> CONT_PTES is 16 with the assumption of 4KB base page size. CHECK_CONTPTE_FLAG()
>>>> collects the flag for ptep[start, CONT_PTES].
>>>>
>>>>>     pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte)
>>>>>     {
>>>>>     	/*
>>>>> @@ -169,11 +181,17 @@ pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte)
>>>>>     	for (i = 0; i < CONT_PTES; i++, ptep++) {
>>>>>     		pte = __ptep_get(ptep);
>>>>>     
>>>>> -		if (pte_dirty(pte))
>>>>> +		if (pte_dirty(pte)) {
>>>>>     			orig_pte = pte_mkdirty(orig_pte);
>>>>> +			CHECK_CONTPTE_FLAG(i, ptep, orig_pte, young);
>>>>> +			break;
>>>>> +		}
>>>>>     
>>>>> -		if (pte_young(pte))
>>>>> +		if (pte_young(pte)) {
>>>>>     			orig_pte = pte_mkyoung(orig_pte);
>>>>> +			CHECK_CONTPTE_FLAG(i, ptep, orig_pte, dirty);
>>>>> +			break;
>>>>> +		}
>>>>>     	}
>>>>>     
>>>>>     	return orig_pte;
>>>>
>>>> There are two issues as I can see: (1) The loop stops on any dirty or young flag. Another
>>>> flag can be missed when one flag is seen. For example, when ptep[0] has both dirty/young
>>>> flag, only the dirty flag is collected. (2) CHECK_CONTPTE_FLAG() iterates ptep[i, CONT_PTES],
>>>> conflicting to the outer loop, which iterates ptep[0, CONT_PTES].
>>>
>>> No flags will be missed. The outer loop is used to check for the first flag,
>>> which could be either the dirty or young flag.
>>> Once this flag (let's assume it's the dirty flag) is found in the i-th PTE,
>>> the dirty flag of orig_pte will be set, and the code will immediately enter
>>> the inner loop, namely CHECK_CONTPTE_FLAG. This inner loop will continue
>>> to check only for the young flag starting from the i-th position, and we needn't
>>> concern about the dirty flag anymore.
>>> If CHECK_CONTPTE_FLAG finds the young flag in the j-th PTE, the young flag
>>> of orig_pte will be set. At this point, both the young and dirty flags of
>>> orig_pte have been set, and there's no need for further loop judgments, so
>>> the both the inner and outer loops can be exited directly. This approach
>>> reduces unnecessary repeated traversals and judgments.
>>>
>>
>> Thanks for the explanation. I missed that the subsequent young bit is collected
>> on pte_dirty(). Similarly, the subsequent dirty bit is collected on pte_young().
>> Now I can see all (dirty | young) bits are collected with a lost.
>>
>>>>
>>>> Besides, I also doubt how much performance can be gained by bailing early on (dirty | young).
>>>> However, it's avoided to cross the L1D cache line boundary if possible. With 4KB base page
>>>> size, 128 bytes are needed for ptep[CONT_PTES], equal to two cache lines. If we can bail
>>>> early with luck, we don't have to step into another cache line. Note that extra checks needs
>>>> more CPU cycles.
>>>
>>> Compared to the previous function, this code doesn't add any extra checks.
>>> Even in the worst-case scenario, where neither a dirty nor a young flag is
>>> found among the 16 PTEs, the number of checks is the same as in the original
>>> function. If any flag is found earlier, the optimized patch will reduce the
>>> number of subsequent checks for that flag compared to the original code.
>>>
>>
>> There are 32 checks in the original code (assuming we have 4kb base page size
>> and CONT_PTES == 16) and the number of checks is fixed. With your patch applied,
>> the number becomes 32 + (number from CHECK_CONTPTE_FLAG) if all PTEs have
>> pte_dirty() and none of them has pte_young(), if I don't miss anything here.
>>
> 
> If all PTEs are dirty and none are young, the code will enter CHECK_CONTPTE_FLAG
> when it encounters the first dirty PTE. Inside CHECK_CONTPTE_FLAG, it only checks
> for the young bit (16 - 0) times and then exits all loops. In this case, the total number
> of checks is 1 + 16, which is less than the original 32.
> 

You're correct. The outer loop is going to stop on pte_dirty() or pte_young(). Well,
you can see the code becomes hard to be understood, at least to me :)

[...]

Thanks,
Gavin

