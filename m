Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517D78460
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 11:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744889810; cv=none; b=QAhh6FXTKz4l25Yye2W9fz+OOD34Dq51ZlsjNlc9V9ENnQmsbDd/XzuMxFeDED2uK7f6NiaUAY22578RDiGRaq5FYy9VdULtyoqFTb7zb+mxkxj5y7xAn185nASf01/yHxt8dV4i/3aTy0sPTSzBo3ic8LT8YZOCsVNMBRVyrf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744889810; c=relaxed/simple;
	bh=vj6jVvjxRWyCw3NbQk75w2STyREng0KgAnwpjs4u1zw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I7k3oxBdw5HSGz1F/UFWNlpFhCSns8gZLjHm2Jac266zvDdKuszoxv4xWyeDW33dMbd5Uo4EhvvgYXVCibk8dvXcL4rjJEjWgzZWt8KGYYTdV32CCm9JA+N3DQ9tsyMBWuYmgGTsCopFmh1ixDp1ww/sGFzXqLMqPxaTStFJZdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iV5qhPDS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iV5qhPDS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744889807;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=kzx9Eu/WeFq19jl2vTkSNZswgKYF5RL3vB3YRfJwvFQ=;
	b=iV5qhPDSwACWwpqhlNBPlgkokCLBDxUInDXdoeIoOxgbxATE2jIiABzD4aWl4M2Phe1zPb
	TBzps8RgWBPCbrq15b/l9pPb9cMwK+KscRiVrLx1mcdHzXkpY9TJ9FtfPvMFb29LKcPVYJ
	1rWfanYnPvAPYk1+5e0XX9QVEuGHQyI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-vjEZZRCTNiW7TRyvOKaZAg-1; Thu, 17 Apr 2025 07:36:44 -0400
X-MC-Unique: vjEZZRCTNiW7TRyvOKaZAg-1
X-Mimecast-MFC-AGG-ID: vjEZZRCTNiW7TRyvOKaZAg_1744889803
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43941ad86d4so2773155e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 04:36:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744889803; x=1745494603;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kzx9Eu/WeFq19jl2vTkSNZswgKYF5RL3vB3YRfJwvFQ=;
        b=hWm5XCfjDzl+RNKSvgJ4XMPZnqzssklRnyTzjKH18YIZOOchzQLWDLM4assd1kzVDC
         ZAELz3WOKsyxlT9NJVEUWJq/KgXu9xWxGMpN6DacKq3xoXfkyCpYkgIpJa340SJcPJvJ
         s0lGjPrIcQ+MELTluyx8wcBZ7rIdx70B270b0MMViMFXu22yySLlsgrvs1cfxQLdhq86
         0/zUPEpq6YIeV4G6OuHTpCyGya5loIU+8RKbde3x24E2FOD9wF+7voZrDML+mCHCteQU
         +VNxPnLztLSUOzukAsPPHAe5FZUuqtedGbOOcmVuILatEwKRl2Rcr2T8SU8j1eDlPNjl
         61nQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfHplblZjlDFWrzMdH+pjEx+GMHL9OWOpNye1beQlB09KD6qtex3vn/Y+AWXXD5tWgHQ/+Z/pJTNZ8oSE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywsebhy+rboFuCMMiIjs4PjFZCiYav7KBFOFzONnocXH6bw5COQ
	3vd3myqwIpF+cFu79wGVBcvGcdJbZXarNN4yY5qxuyyZpzjbd6YLxVZDuMCYM062wfOeL5qb0E/
	+P1GuqARjMia5qP4gwXVW25M1O5loShibbTYHnuJ94AjyirU+tynqhXaoT2jpKg==
X-Gm-Gg: ASbGncvYWcrORkGE2/odE7F9QqX+b+YAtJJbfTLotpmoUSY9xrbFI96wUPesiHSOHsm
	pR1yOOqmJKEOTTMuq2KU/oZTKbvnKz+tCsa0qkcDe2TPLBZTMBL+FY3iQpKhi3mYtcElybzuhai
	4qbiRu4OttyWPIojWX2IbxqRbIGzwrq4vaLTZUyH4RL4oAaWdIBYD1yOkWZrXLJtpwCq7LmZQZZ
	ZM5VqddO5uq0yyZo3unexp8GD1gTvPBXNZ0t4A/9jvElBT5JOxlmqVzbEmqekOa4RJWRyHNbMEd
	C0mDOHrcvkhgMKP4YAHZYH+O6NnGoQRr587lqQDk3a4Dxu9iskSoeq7JZS5BsXGAFOwA6Qadwse
	ZaiTUoZvMORvbunuDERu0aTlg7jxlf9JXfazOASA=
X-Received: by 2002:a05:6000:1a8a:b0:391:3094:d696 with SMTP id ffacd0b85a97d-39ee5ba0571mr5429299f8f.54.1744889803401;
        Thu, 17 Apr 2025 04:36:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGe/gNkqzmEXTARV/xkcy3k35IanjkSyZQslxVkUk7XlP0HTpe4AK8oiUQDFWYHHUGHEY/5qA==
X-Received: by 2002:a05:6000:1a8a:b0:391:3094:d696 with SMTP id ffacd0b85a97d-39ee5ba0571mr5429264f8f.54.1744889802860;
        Thu, 17 Apr 2025 04:36:42 -0700 (PDT)
Received: from ?IPV6:2003:cb:c706:2700:abf9:4eac:588c:adab? (p200300cbc7062700abf94eac588cadab.dip0.t-ipconnect.de. [2003:cb:c706:2700:abf9:4eac:588c:adab])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae97b249sm20040789f8f.58.2025.04.17.04.36.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 04:36:42 -0700 (PDT)
Message-ID: <4828e28d-eb56-449b-83c3-b5b2dc2ac6e2@redhat.com>
Date: Thu, 17 Apr 2025 13:36:41 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/huge_memory: fix dereferencing invalid pmd migration
 entry
To: Gavin Guo <gavinguo@igalia.com>, Hugh Dickins <hughd@google.com>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, willy@infradead.org,
 ziy@nvidia.com, linmiaohe@huawei.com, revest@google.com,
 kernel-dev@igalia.com, linux-kernel@vger.kernel.org
References: <20250414072737.1698513-1-gavinguo@igalia.com>
 <27d13454-280f-4966-b694-d7e58d991547@redhat.com>
 <6787d0ea-a1b9-08cf-1f48-e361058eec20@google.com>
 <83f17b85-c9fa-43a0-bec1-22c8565b67ad@redhat.com>
 <98d1d195-7821-4627-b518-83103ade56c0@redhat.com>
 <7d0ef7b5-043b-beca-72a9-6ae98b0d55fb@google.com>
 <05a7d51e-f065-445a-af0e-481f3461a76e@redhat.com>
 <f344d741-962c-48d3-84b7-ce3de5619122@igalia.com>
Content-Language: en-US
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <f344d741-962c-48d3-84b7-ce3de5619122@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 17.04.25 13:21, Gavin Guo wrote:
> On 4/17/25 17:04, David Hildenbrand wrote:
>> On 17.04.25 10:55, Hugh Dickins wrote:
>>> On Thu, 17 Apr 2025, David Hildenbrand wrote:
>>>> On 17.04.25 09:18, David Hildenbrand wrote:
>>>>> On 17.04.25 07:36, Hugh Dickins wrote:
>>>>>> On Wed, 16 Apr 2025, David Hildenbrand wrote:
>>>>>>>
>>>>>>> Why not something like
>>>>>>>
>>>>>>> struct folio *entry_folio;
>>>>>>>
>>>>>>> if (folio) {
>>>>>>>    if (is_pmd_migration_entry(*pmd))
>>>>>>>        entry_folio = pfn_swap_entry_folio(pmd_to_swp_entry(*pmd)));
>>>>>>>    else
>>>>>>>     entry_folio = pmd_folio(*pmd));
>>>>>>>
>>>>>>>    if (folio != entry_folio)
>>>>>>>          return;
>>>>>>> }
>>>>>>
>>>>>> My own preference is to not add unnecessary code:
>>>>>> if folio and pmd_migration entry, we're not interested in entry_folio.
>>>>>> But yes it could be written in lots of other ways.
>>>>>
>>>>> While I don't disagree about "not adding unnecessary code" in general,
>>>>> in this particular case just looking the folio up properly might be the
>>>>> better alternative to reasoning about locking rules with conditional
>>>>> input parameters :)
>>>>>
>>>>
>>>> FWIW, I was wondering if we can rework that code, letting the caller
>>>> to the
>>>> checking and getting rid of the folio parameter. Something like this
>>>> (incomplete, just to
>>>> discuss if we could move the TTU_SPLIT_HUGE_PMD handling).
>>>
>>> Yes, I too dislike the folio parameter used for a single case, and agree
>>> it's better for the caller who chose pmd to check that *pmd fits the
>>> folio.
>>>
>>> I haven't checked your code below, but it looks like a much better way
>>> to proceed, using the page_vma_mapped_walk() to get pmd lock and check;
>>> and cutting out two or more layers of split_huge_pmd obscurity.
>>>
>>> Way to go.  However... what we want right now is a fix that can easily
>>> go to stable: the rearrangements here in 6.15-rc mean, I think, that
>>> whatever goes into the current tree will have to be placed differently
>>> for stable, no seamless backports; but Gavin's patch (reworked if you
>>> insist) can be adapted to stable (differently for different releases)
>>> more more easily than the future direction you're proposing here.
>>
>> I'm fine with going with the current patch and looking into cleaning it
>> up properly (if possible).
>>
>> So for this patch
>>
>> Acked-by: David Hildenbrand <david@redhat.com>
>>
>> @Gavin, can you look into cleaning that up?
> 
> Thank you for your review. Before I begin the cleanup, could you please
> confirm the following action items:
> 
> Zi Yan's suggestions for the patch are:
> 1. Replace the page fault with an invalid address access in the commit
>      description.

Yes, that makes sense.

> 
> 2. Simplify the nested if-statements into a single if-statement to
>      reduce indentation.
> 
> David, based on your comment, I understand that you are recommending the
> entry_folio implementation. Also, from your discussion with Hugh, it
> appears you agreed with my original approach of returning early when
> encountering a PMD migration entry, thereby avoiding unnecessary checks.
> Is that correct? If so, I will keep the current logic. Do you have any
> additional cleanup suggestions?

Yes, the current patch is okay for upstream+stable, but we should look 
into cleaning that up.

See the cleanup RFC patch I posted where we remove the folio check 
completely. Please let me know if you need more information.

-- 
Cheers,

David / dhildenb

