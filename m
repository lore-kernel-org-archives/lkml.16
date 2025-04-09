Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3F6155389
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 09:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744192401; cv=none; b=a6VnuuYC2UTFmFXtImhyMS/T5ZP4yXrI6I1o/hriv0D01HpiAr7uH/q07uSkzADrWZjtHRod3JnBu5aa3dVfjBVjY8B9AIP/eLzsRtzpaELf6eLewTIckWEtR9tFymQXiL6ihNBlEErlVB17N2chF96Vq4RuI1gFYja/TVOMKbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744192401; c=relaxed/simple;
	bh=tDcRVBYMmBGKFLLhH7S5pV5N14VJ2/DnFeJ4DfOqcpg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YRtODh04ryQEjAtaOPF69+E7ZENdQahnGrPlsBIp09epUWHc5lRnNIq1CkOTQCvYh3Gl//UDjZuf5A3u1XZAtQCHmd1W6nQHajO0vNN3QEyURUg+PsgS8Ezd291Qz5Bnqj2KvaQ8XzHF/uDnhvB3zRETdVOE5+cIS+bKJWPOrUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ESV7o8er; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ESV7o8er"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744192398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=AZlXGl5Aeyi6Ph72XFKY4HqVnc7Wvslh3i9yLyL0btk=;
	b=ESV7o8erLYiVCZuDpmuMtkXKwugFW4WlSw7ZtfVxI/R5uK8zz7hWiYDdzDx/2HEPGOrZIB
	DwkBqAIQEGAR6IhlexQ88tt8m88hHU1s6QilTbwhGmTN+om6ijiiRT07ocOMRkR6WQ9boF
	7zNWOsjSHpbWSshQjTEAzJAuVi3RuMw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-477-IhB4XruWPkqYCom0F3dYUw-1; Wed, 09 Apr 2025 05:53:16 -0400
X-MC-Unique: IhB4XruWPkqYCom0F3dYUw-1
X-Mimecast-MFC-AGG-ID: IhB4XruWPkqYCom0F3dYUw_1744192396
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43d51bd9b41so56340135e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 02:53:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744192396; x=1744797196;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AZlXGl5Aeyi6Ph72XFKY4HqVnc7Wvslh3i9yLyL0btk=;
        b=Cc4qjmunm76x2btH495+se+W3LRqUJK5NOqpj16HBjRtmK4vKpSEGaH0HEswj2Rkwr
         d/chscXSc/I7ki2Y0JVPFlA9DJC3AftoUADEonPsOL2Dgo+V8zpwI5jf+lpPI9E1jfUa
         ajPzAeDPi9HiAqFu5YwhjHzIxQHLAr5rN0x4FiBgmzAFx96eNRTrvOCCSUMrLuxjsZqD
         oFVWv+jMLQaehvDMcC7xrgs3c3+HpBsxcFyMcj4rNjb2+Zq+QYCuy5H9L6pPKIS68ejr
         OcTXS91/ne8aif3kkvajnzHP+wuQchp+2iawlY36rNrGR4R3/CQLzkwY5Zlva4i3gVzi
         5dHA==
X-Forwarded-Encrypted: i=1; AJvYcCVJV+og8ZA3wL3tpEBM/EraXsapymXLB2qWZxLJqxSY39RY9Iik4gdwTUb77J8iMtGbpxHhokfVA4kgo/8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwENC87gASkoDyWXYCJqQqaWC91eCZWvr73hwx0CPsfp3I4Pz+L
	z6S7a/Kti6TZEsRE11Nhxp5gskwxY4MuBoCULODX/0Z1Cv7t6No46XSL4lKdFQBa0iYC8P/eWUr
	EvOJ0uQFP7GzAEqUHjFUlRQoNKftEmtqAnmrIjR4ywRXSHGGhqAcJJFoapMDi+Q==
X-Gm-Gg: ASbGncsCPMXo/wFuew7prjKsihYHSVP+xN5htutrOziXbhf5gYXZNh3QbDNE5Ti40AY
	1YvCz0q1Xhj+w4aQ+R3/cNQ482O0Ccf0GzJIcBzh2Y1J03TXvTWQ4HzqM41rBlkEfdBUSvhqgyk
	uju2WfFG71s1MI5mzg7VyAvWnB/AtEGiOXApsIOZlsolV+RbCTfN3JTXyHzimONRaxD33Y5SWHM
	DStnP4fhMAD589z97dJti7ZY+zQFkrHqD5Dvttg2Ad4LfI9kJK3lx+SFMvRSrKqUJvFmtoLqCQi
	c/R9wk79wXro67mPc2NVdBmQxq/sy/qWXYJwDTgkIQW229/Z1wFUfKD/M4xjZcOCsZbFaItza87
	bOYyip6t1aghvsQ5lgJ1LeYIQJirT2J8sdg==
X-Received: by 2002:a05:600c:4f4f:b0:43c:fe5e:f03b with SMTP id 5b1f17b1804b1-43f1ed4d93cmr24376145e9.30.1744192395776;
        Wed, 09 Apr 2025 02:53:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEs+6zHtnYJwGSOuzb/4Xnp7XP4mgSOdIliGWk/qv+sy0a3Gd4ZZZfy5ZGVG33b67NVrNXNFw==
X-Received: by 2002:a05:600c:4f4f:b0:43c:fe5e:f03b with SMTP id 5b1f17b1804b1-43f1ed4d93cmr24375845e9.30.1744192395422;
        Wed, 09 Apr 2025 02:53:15 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70d:8400:ed9b:a3a:88e5:c6a? (p200300cbc70d8400ed9b0a3a88e50c6a.dip0.t-ipconnect.de. [2003:cb:c70d:8400:ed9b:a3a:88e5:c6a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f20625592sm14523295e9.10.2025.04.09.02.53.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 02:53:14 -0700 (PDT)
Message-ID: <cb8fee50-4dd2-4362-b716-bf1e921bdfa2@redhat.com>
Date: Wed, 9 Apr 2025 11:53:13 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: huge_memory: add folio_mark_accessed() when zapping
 file THP
To: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org
Cc: willy@infradead.org, hannes@cmpxchg.org, 21cnbao@gmail.com,
 ryan.roberts@arm.com, ziy@nvidia.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <fc117f60d7b686f87067f36a0ef7cdbc3a78109c.1744190345.git.baolin.wang@linux.alibaba.com>
 <39176ab9-33d5-4919-b368-2fd2467f08fe@redhat.com>
 <0e294c56-d924-4d40-aa24-584235e8c923@linux.alibaba.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <0e294c56-d924-4d40-aa24-584235e8c923@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 09.04.25 11:49, Baolin Wang wrote:
> 
> 
> On 2025/4/9 17:46, David Hildenbrand wrote:
>> On 09.04.25 11:38, Baolin Wang wrote:
>>> When investigating performance issues during file folio unmap, I
>>> noticed some
>>> behavioral differences in handling non-PMD-sized folios and PMD-sized
>>> folios.
>>> For non-PMD-sized file folios, it will call folio_mark_accessed() to
>>> mark the
>>> folio as having seen activity, but this is not done for PMD-sized folios.
>>>
>>> This might not cause obvious issues, but a potential problem could be
>>> that,
>>> it might lead to reclaim hot file folios under memory pressure, as quoted
>>> from Johannes:
>>>
>>> "
>>> Sometimes file contents are only accessed through relatively short-lived
>>> mappings. But they can nevertheless be accessed a lot and be hot. It's
>>> important to not lose that information on unmap, and end up kicking out a
>>> frequently used cache page.
>>> "
>>>
>>> Therefore, we should also add folio_mark_accessed() for PMD-sized file
>>> folios when unmapping.
>>>
>>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>>> Acked-by: Johannes Weiner <hannes@cmpxchg.org>
>>> Acked-by: Zi Yan <ziy@nvidia.com>
>>> ---
>>> Changes from RFC:
>>>    - Update the commit message, per Johannes.
>>>    - Collect Acked tags from Johannes and Zi. Thanks.
>>> ---
>>>    mm/huge_memory.c | 4 ++++
>>>    1 file changed, 4 insertions(+)
>>>
>>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>>> index 2a47682d1ab7..955781b4e946 100644
>>> --- a/mm/huge_memory.c
>>> +++ b/mm/huge_memory.c
>>> @@ -2260,6 +2260,10 @@ int zap_huge_pmd(struct mmu_gather *tlb, struct
>>> vm_area_struct *vma,
>>>                    zap_deposited_table(tlb->mm, pmd);
>>>                add_mm_counter(tlb->mm, mm_counter_file(folio),
>>>                           -HPAGE_PMD_NR);
>>> +
>>> +            if (flush_needed && pmd_young(orig_pmd) &&
>>> +                likely(vma_has_recency(vma)))
>>> +                folio_mark_accessed(folio);
>>
>> So the flush_needed check is really just a pmd_present() check. (the
>> latter would be clearer, but I don't mind)
> 
> Yes, we've already checked pmd_present() before, so I assume the
> flush_needed check is cheaper:)

Maybe :)

-- 
Cheers,

David / dhildenb

