Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59272594
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 14:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745935258; cv=none; b=IKp0zH4nopj+PHnvprfb5DMYgSMcA0O8iYd3CYkittjpTvzWbMse9sZ/Me/QUeUO+IYqiBeO4/sJW+rtAYYmoSABcKChOqgluXUfYq8/5mbSlyHbkJZbwTT3Zfm0CdzAwyI0yXs8PKxX/G+fumq7IonXbzraqfD2t60o8CyiHpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745935258; c=relaxed/simple;
	bh=QYr6h2XOFIe4mC9/QnHU0xlz9g7hlHkmy3ep+irTepY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ttwGhnl0Ro+AvwRWvVmpTYYPfgCpOsiDP7YOa31XqFVBSmHOGcgJEP0t6outxm0dl2rl8ynLCBU9dWT62V1gW+bmJAY4iWvNvWWjD3atwCToW6HS/crqW7JyP42qIV4nyFRvcd40XUEQTAEY1qE8wUMyIEpXBOkPVAJHOY4E4NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OYNKq2Na; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OYNKq2Na"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745935255;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=rPuSP7rL/M6eQxF/T0CIz+v7BklLeO0LdTlpgvoVmcw=;
	b=OYNKq2Na5aUq3klQOZvTgabrya2fu8ZYuxBQLQH46NySwibPKY2h1o2l5yudwRAHT056h9
	R+IO0iW3Bw7m7CeQhXxnvEt7WLFH463GMO5URPiRShXw+9awkmhGkL71UgRVNObzkXf+uo
	XpXO0CkySqiJR9LfDcZ0H87WQE0eQ5I=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-251-ga2LjpIsMN6hb_L9OyM7JA-1; Tue, 29 Apr 2025 10:00:54 -0400
X-MC-Unique: ga2LjpIsMN6hb_L9OyM7JA-1
X-Mimecast-MFC-AGG-ID: ga2LjpIsMN6hb_L9OyM7JA_1745935253
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43e9b0fd00cso27103355e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 07:00:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745935253; x=1746540053;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rPuSP7rL/M6eQxF/T0CIz+v7BklLeO0LdTlpgvoVmcw=;
        b=gWPWArmyHIt0uHCrYmrCqujwhVUFCnurR+XWmBtf13iNH/y8+333PUAAJaPDrWm7op
         MtZWb6/eWd2S3aOWrn8+Dch6sYnUH/6iOKcYHgKuKGtN5zwnp8OaRrvTa9qHw+up+jjT
         StxeNLst+jgn/hn0ktSVM0aJaIPWUxuDDHXtsKmPLO7q4IIX3DngJ/qplGqflGp2p1+I
         F8GMU87fDdZQzwXm0KdPN7smjPVrxI7cxHMqo5LuVyxtMtP2WCLmB7lQvP8UWJf273KI
         UA4/f+z1+V2/gvE4yujK6Cl/xQErTEG91UwJDyJQ6ZvkSxliO5mnmwtRpDf4uDQZehOZ
         MoNA==
X-Forwarded-Encrypted: i=1; AJvYcCWWHvfeclOrFS3zAlcZM+FRLnWs6vlTP7OREPZ2c4YzAKQuRkDvJ84i996RLB34VbBJubNRHXCoOz9JkA0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkeY2id7HMOJXXI4QSqW7qeT4+edJmV6gV8zYagIABb8N6DEiL
	d7rIYt6XUbzvYTpRYjMxeHxLUHoI7708FCAmlkPqjGfnHkUkSoZOi5ncErg8EuwwJOd40BWD/PS
	x223On4KHqfgNHmA4NJwMMaRySgYOcIg1aePR3rLye99O3XWz/TdAufTuc9aYVw==
X-Gm-Gg: ASbGncvQKiMbuT15XiMdHwPEwS1yFIpWW2G9qB3nh7yxyUuVvwjTcrRY2wql6v1eDK9
	dLVawEYrsw6LBx+QJZR+BcYaQaLNzNFh1S6secHtVOH1LGfUNTSk/A/lXSOH4zcpHC3TuILZ/KU
	wprNRIBvhj6F2zfb74+Al1WP5owk8hk+0aSNc5mfN/EUEI2ermFb04+tzcG77K2Gi6RKLn+udPf
	4nMNU7wdOrhnLFrHg/YwS/Zsx4OHdeu5xGoIVOjMnr4fku1CwIBG0jHHhroN+rUOPaA7/G1NUwW
	p2Y+UJqj/fCL0VxTS0AU/PuBDzYGkFsw/nR/8Olzg21f11n8tTRzUE/e0504pa3ApWzsGpKc84E
	BwRGD78pZ2i0m6m8idaV+YldJFJa/reRCSYIMuoo=
X-Received: by 2002:a05:600c:19c7:b0:43d:fa5f:7d30 with SMTP id 5b1f17b1804b1-441acb5bb33mr23651235e9.16.1745935252588;
        Tue, 29 Apr 2025 07:00:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEC5+jkoc1JUziXqrIgQ+fR1hmKrKcNVkEatdSDCSmI8IokLNHuGLQJS3hly2YAp/zkXdCxpA==
X-Received: by 2002:a05:600c:19c7:b0:43d:fa5f:7d30 with SMTP id 5b1f17b1804b1-441acb5bb33mr23650395e9.16.1745935251585;
        Tue, 29 Apr 2025 07:00:51 -0700 (PDT)
Received: from ?IPV6:2003:cb:c73b:fa00:8909:2d07:8909:6a5a? (p200300cbc73bfa0089092d0789096a5a.dip0.t-ipconnect.de. [2003:cb:c73b:fa00:8909:2d07:8909:6a5a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2a13bdsm189398195e9.9.2025.04.29.07.00.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 07:00:51 -0700 (PDT)
Message-ID: <a427092f-3179-4397-a5c2-e13561706dbd@redhat.com>
Date: Tue, 29 Apr 2025 16:00:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] mm: Batch around can_change_pte_writable()
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org,
 ryan.roberts@arm.com, willy@infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org,
 Liam.Howlett@oracle.com, vbabka@suse.cz, jannh@google.com,
 anshuman.khandual@arm.com, peterx@redhat.com, joey.gouly@arm.com,
 ioworker0@gmail.com, baohua@kernel.org, kevin.brodsky@arm.com,
 quic_zhenhuah@quicinc.com, christophe.leroy@csgroup.eu,
 yangyicong@hisilicon.com, linux-arm-kernel@lists.infradead.org,
 hughd@google.com, yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250429052336.18912-1-dev.jain@arm.com>
 <20250429052336.18912-7-dev.jain@arm.com>
 <25dcf969-e479-4d4a-a95c-0e83706af99e@redhat.com>
 <9a770aec-a020-4199-a53e-eddda657999d@redhat.com>
 <7cf8235e-21f7-4643-82c4-82ad57d99b98@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <7cf8235e-21f7-4643-82c4-82ad57d99b98@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29.04.25 15:57, Lorenzo Stoakes wrote:
> On Tue, Apr 29, 2025 at 11:27:43AM +0200, David Hildenbrand wrote:
>> On 29.04.25 11:19, David Hildenbrand wrote:
>>>
>>>>     #include "internal.h"
>>>> -bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
>>>> -			     pte_t pte)
>>>> +bool can_change_ptes_writable(struct vm_area_struct *vma, unsigned long addr,
>>>> +			      pte_t pte, struct folio *folio, unsigned int nr)
>>>>     {
>>>>     	struct page *page;
>>>> @@ -67,8 +67,9 @@ bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
>>>>     		 * write-fault handler similarly would map them writable without
>>>>     		 * any additional checks while holding the PT lock.
>>>>     		 */
>>>> -		page = vm_normal_page(vma, addr, pte);
>>>> -		return page && PageAnon(page) && PageAnonExclusive(page);
>>>> +		if (!folio)
>>>> +			folio = vm_normal_folio(vma, addr, pte);
>>>> +		return folio_test_anon(folio) && !folio_maybe_mapped_shared(folio);
>>>
>>> Oh no, now I spot it. That is horribly wrong.
>>>
>>> Please understand first what you are doing.
>>
>> Also, would expect that the cow.c selftest would catch that:
>>
>> "vmsplice() + unmap in child with mprotect() optimization"
>>
>> After fork() we have a R/O PTE in the parent. Our child then uses vmsplice()
>> and unmaps the R/O PTE, meaning it is only left mapped by the parent.
>>
>> ret = mprotect(mem, size, PROT_READ);
>> ret |= mprotect(mem, size, PROT_READ|PROT_WRITE);
>>
>> should turn the PTE writable, although it shouldn't.
> 
> This makes me concerned about the stability of this series as a whole...
> 
>>
>> If that test case does not detect the issue you're introducing, we should
>> look into adding a test case that detects it.
> 
> There are 25 tests that fail for the cow self-test with this series
> applied:
> 
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with base page
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with PTE-mapped THP (16 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with single PTE of THP (16 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with partially shared THP (16 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with PTE-mapped THP (32 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with single PTE of THP (32 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with partially shared THP (32 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with PTE-mapped THP (64 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with single PTE of THP (64 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with partially shared THP (64 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with PTE-mapped THP (128 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with single PTE of THP (128 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with partially shared THP (128 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with PTE-mapped THP (256 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with single PTE of THP (256 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with partially shared THP (256 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with PTE-mapped THP (512 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with single PTE of THP (512 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with partially shared THP (512 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with PTE-mapped THP (1024 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with single PTE of THP (1024 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with partially shared THP (1024 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with PTE-mapped THP (2048 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with single PTE of THP (2048 kB)
> # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with partially shared THP (2048 kB)

As expected ... :)

-- 
Cheers,

David / dhildenb

