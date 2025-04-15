Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF20274644
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 11:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744718348; cv=none; b=QBfo6A9qgbatEXN3/OPv9OVZNSzCGxdHJQ/OMm4Dzb5gCXnAFB8AhOIdRGClwQHAYoi6QZi0xdmFbQfsE76I7nS3C4F0ozasAlKdLtFjDdDqDM6zO/eP9Atf/JC/pQYSBvpzlvZBeXEhIGsMgc7gytKXNZwjLKYE6N7XFLizYng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744718348; c=relaxed/simple;
	bh=y6cOjFPygFTFDk3Aal+DMLyCz3p5CwGC+zQYfoHWv4U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gTG/QdH2OJDN8Gl0KQ98eRHYPkWHIH4jgUiZ4AgeptGMaXbwkcgubhUcB12HbjLhmJ9r/+AcFLyM+X2yAN8/7zEZ0Ivgl1BDs/S9YKrSNgqjiguf/Zhfy5pRKpJ11joKE9MimG1a6MhGDKGJa97dNxduY7GhsZwtkenE0/L1Csc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OQBhlClk; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OQBhlClk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744718345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=+Mi/91mBv72StnXvyA1x2lnvqmn28dTKebhBXFXg0RM=;
	b=OQBhlClkhOzq3ASv1ayI9/G3nn5maGltn3hz8eWWMnyHbZO1DZbu/O001tBDQA4WZWVAHr
	xOEEAhSjsDH0JL4EEqna9LeHD9vdwAoUAq/k9lyRcRjcN7A0j7ZEHJT8aGPZxFwDoqc2pF
	1tuD+Z2L3E7wvV2ib9tSI1Fn7A02FnY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-614-tt7rBcNZOY6GFZLEZffcXA-1; Tue, 15 Apr 2025 07:59:04 -0400
X-MC-Unique: tt7rBcNZOY6GFZLEZffcXA-1
X-Mimecast-MFC-AGG-ID: tt7rBcNZOY6GFZLEZffcXA_1744718343
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43efa869b19so38016265e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 04:59:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744718343; x=1745323143;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+Mi/91mBv72StnXvyA1x2lnvqmn28dTKebhBXFXg0RM=;
        b=Z5Y/Y52X8gwn8KaEODa0xFJ37+BBrv0Tn7vwi14BV1/NnQgpZZIe3/Pz9hWtVE2bav
         tSgRSowdWZD+gCULMlcOn0hk8TyfSALUi67qYvaze37p5ByFyyb48bwyab7M7fMqTokj
         pVN2T/uY3/GhAC9vYT54wDTUGfGlOZWdjA6cyoD3CIdXciG+cNYMHCPSaTag9+pKzHy7
         aEStU6S3hd5bYwLMy4YkgTDSQjjR6bmayTbYfahkI8t5CwLcztJNyCtnBqWBSmH/qY5d
         x8zdcStS6NVZEvlwjOyLky02mMf3UyhEtzBxMg3bOh1Jh/LTwe3NtHDRuST1OQ6i86gM
         cImg==
X-Forwarded-Encrypted: i=1; AJvYcCX5LPLiuXZ0pM8cZOMYc+1es91LjMbXWRVpkfbb3EqxT9MvkDabnsLm7equvNCx0W3a4aiolH19UJ7uD9M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRwh6oKXJgBe4QXi9XTsezQvWEdWd5mfR0rtQYRKQK/ubQAIiw
	zinalR4nKwrQ3WHTvI/54fcNx2qTGxWzNb7rwH2B9jTGoraJ+tKqoVw1lek7igrilaeKqhPsHo/
	xNoaTtKz4hQ3slKpHDPctbNACzI8JV7mQV38XNRVMbSS6Y67Il4vv/+iGB5P/OA==
X-Gm-Gg: ASbGncsb4XhnrQF0AdHAYkYFUr5IKhh4U1VeLrY9vV9dSJyhZLWIZZF4Kh7BNGsDa65
	8eV/1te2TOrGpPnGRrkmw5zk3doSkJ5R3fzgFeTeWdXPaKzHhAPbit6CtyiNeVpKFWRb1yWZFt5
	3SczzVOxRNTGIa/4tBryRN24w1CHdjjplsByMs1Wg6KLmX/m6XkgOIvaT5D6Tf4eaVWnRgdXF2c
	4jU0HQ2z89xSwfuxxFHxYhyD+7znb2FRXURbcqLSt94Yz6c8KEcuhzWU+YCWtn36yxLfEwixoNl
	A3VbRH3yIOzQjQWgOhpdXRvMQ+p54ZjqiesrMgVyKQ89OgJc8S0epgLU2JhVKNlnyZwv917yDP7
	hXq7FWXuwGMvO42yWOzkKdhLPV81PUtFsN8uMCw==
X-Received: by 2002:a05:600c:4ed1:b0:43c:fbe2:df3c with SMTP id 5b1f17b1804b1-43f3a9aa716mr107063235e9.26.1744718343006;
        Tue, 15 Apr 2025 04:59:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEiRliOAR9ZrYPVSoqJMIFTS0cfhSB5mZfvE14FhS180K/yYxYbWOQwsTj31vmpR75C9FRAkA==
X-Received: by 2002:a05:600c:4ed1:b0:43c:fbe2:df3c with SMTP id 5b1f17b1804b1-43f3a9aa716mr107063075e9.26.1744718342652;
        Tue, 15 Apr 2025 04:59:02 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f02:2900:f54f:bad7:c5f4:9404? (p200300d82f022900f54fbad7c5f49404.dip0.t-ipconnect.de. [2003:d8:2f02:2900:f54f:bad7:c5f4:9404])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f206332d9sm207208725e9.13.2025.04.15.04.59.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 04:59:01 -0700 (PDT)
Message-ID: <1d6d7842-1700-40d2-9d5b-e044fbc242de@redhat.com>
Date: Tue, 15 Apr 2025 13:59:00 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mempolicy: Optimize queue_folios_pte_range by PTE
 batching
To: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org
Cc: ryan.roberts@arm.com, willy@infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, hughd@google.com, vishal.moola@gmail.com,
 yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250411081301.8533-1-dev.jain@arm.com>
 <09c77ab5-65fc-4bca-a7e5-2b11bba9330d@redhat.com>
 <9ed4c113-37eb-4e3d-98a1-f46f786aaea9@arm.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <9ed4c113-37eb-4e3d-98a1-f46f786aaea9@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 15.04.25 13:47, Dev Jain wrote:
> 
> 
> On 15/04/25 3:47 pm, David Hildenbrand wrote:
>> On 11.04.25 10:13, Dev Jain wrote:
>>> After the check for queue_folio_required(), the code only cares about the
>>> folio in the for loop, i.e the PTEs are redundant. Therefore, optimize
>>> this
>>> loop by skipping over a PTE batch mapping the same folio.
>>>
>>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>>> ---
>>> Unfortunately I have only build tested this since my test environment is
>>> broken.
>>>
>>>    mm/mempolicy.c | 12 +++++++++++-
>>>    1 file changed, 11 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/mm/mempolicy.c b/mm/mempolicy.c
>>> index b28a1e6ae096..b019524da8a2 100644
>>> --- a/mm/mempolicy.c
>>> +++ b/mm/mempolicy.c
>>> @@ -573,6 +573,9 @@ static int queue_folios_pte_range(pmd_t *pmd,
>>> unsigned long addr,
>>>        pte_t *pte, *mapped_pte;
>>>        pte_t ptent;
>>>        spinlock_t *ptl;
>>> +    int max_nr;
>>> +    const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>>> +    int nr = 1;
>>
>> Try sticking to reverse xmas tree, please. (not completely the case
>> here, but fpb_flags can easily be moved all he way to the top)
> 
> I thought that the initializations were to be kept at the bottom.

Not that I am aware of.

> Asking for future patches, should I put all declarations in reverse-xmas
> fashion (even those which I don't intend to touch w.r.t the patch
> logic), or do I do that for only my additions?

We try to stay as close to reverse-xmas tree as possible. It's not 
always possible (e.g., dependent assignments), but fpb_flags in this 
case here can easily go all the way to the top.

...

> 
>>
>>   >       ptl = pmd_trans_huge_lock(pmd, vma);>       if (ptl) {
>>> @@ -586,7 +589,8 @@ static int queue_folios_pte_range(pmd_t *pmd,
>>> unsigned long addr,
>>>            walk->action = ACTION_AGAIN;
>>>            return 0;
>>>        }
>>   > -    for (; addr != end; pte++, addr += PAGE_SIZE) {> +    for (;
>> addr != end; pte += nr, addr += nr * PAGE_SIZE) {
>>> +        nr = 1;
>>>            ptent = ptep_get(pte);
>>>            if (pte_none(ptent))
>>>                continue;
>>> @@ -607,6 +611,11 @@ static int queue_folios_pte_range(pmd_t *pmd,
>>> unsigned long addr,
>>>            if (!queue_folio_required(folio, qp))
>>>                continue;
>>>            if (folio_test_large(folio)) {
>>> +            max_nr = (end - addr) >> PAGE_SHIFT;
>>> +            if (max_nr != 1)
>>> +                nr = folio_pte_batch(folio, addr, pte, ptent,
>>> +                             max_nr, fpb_flags,
>>> +                             NULL, NULL, NULL);
>>
>> We should probably do that immediately after we verified that
>> vm_normal_folio() have us something reasonable.
> 
> But shouldn't we keep the small folio case separate to avoid the
> overhead of folio_pte_batch()?

Yes, just do something like

if (folio_test_large(folio) && end - addr > 1)
	nr = folio_pte_batch(folio, addr, pte, ptent, end - addr,
			     max_nr, fpb_flags, ...);

before the folio_test_reserved().

Then you'd also skip the all ptes if !queue_folio_required.

> 
>>
>>>                /*
>>>                 * A large folio can only be isolated from LRU once,
>>>                 * but may be mapped by many PTEs (and Copy-On-Write may
>>> @@ -633,6 +642,7 @@ static int queue_folios_pte_range(pmd_t *pmd,
>>> unsigned long addr,
>>>                qp->nr_failed++;
>>>                if (strictly_unmovable(flags))
>>>                    break;
>>> +            qp->nr_failed += nr - 1;
>>
>> Can't we do qp->nr_failed += nr; above?
> 
> I did not dive deep into the significance of nr_failed, but I did that
> to keep the code, before and after the change, equivalent:

And I question exactly that.

If we hit strictly_unmovable(flags), we end up returning "-EIO" from
queue_folios_pte_range().

And staring at queue_pages_range(), we ignore nr_failed if 
walk_page_range() returned an error.

So looks like we can just add everything in one shot, independent of 
strictly_unmovable()?

-- 
Cheers,

David / dhildenb

