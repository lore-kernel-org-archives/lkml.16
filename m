Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2A22376FC
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 12:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747137906; cv=none; b=l8LX3l9xiDHZIo0SfTTWOZ7U4Q9r5EMFH2njKq8MKeFhlvBwFy2KrNNLAAzLlOA/ntntaNs4LZjORAOtZIxuQD4hdK6GZg6SPFnZ9mT6G15lvks1oLcNDNpB/P4lnl/Q38GcOu82+g2YDHn+ty+tNZ09aqYKW0fc3d7FY6kHKR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747137906; c=relaxed/simple;
	bh=ayE5yaDJcFWQ1CRsu6iAnv1gk66PPFeRH6En8Ip6L3Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C/vsCft357jOPPlmremZWLpVJpnxhWpMUrty3PPlkqSGCI5zL0pDw7WXDGGdRSoMJi39HWIPeYmhc9zVuBna8fgIYEWlg+6HXUPDsZyNDg2ErJE8dAJASi05lMY2Jt7FZTQLu6sSea5ysgyBji2aNcT+IDHBaqcyk1Wgg+NgjrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Wtc9ASoN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Wtc9ASoN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747137903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=RcBbTWk1MmR2T0AlKxvTo8Y8PbTzTSaPXQ4qigT09M8=;
	b=Wtc9ASoNqK9Eq+QwOC0CbTl+X7Ar3Nf1vx1tGxm1yr5BIuRgvl4y+hQiL32Uj7ptoUIt1X
	XvMbv2Ep5wl0qbjALGGxSi300ke92QWZ8JHHEdIBOBN7ORjoUL6HZpfFH3y01YnG0btA6X
	pjc6ixvAGlaMFPYVpE2zCVysDetAdz8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-35-LRM6E1XaM2qol4n0nb9QaQ-1; Tue, 13 May 2025 08:05:01 -0400
X-MC-Unique: LRM6E1XaM2qol4n0nb9QaQ-1
X-Mimecast-MFC-AGG-ID: LRM6E1XaM2qol4n0nb9QaQ_1747137901
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43d4d15058dso40026665e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 05:05:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747137901; x=1747742701;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RcBbTWk1MmR2T0AlKxvTo8Y8PbTzTSaPXQ4qigT09M8=;
        b=mG5O4/BSdwRfLEI19mvsJazG3k/FjbX/+cMVWf8IuMe9+crhMcK6Im4baCeghb8B9B
         G5mPyjuMqHRLX28AI3Xw+8dOidgcdz7fc7hBZCZS1PrqxeK83CSFBXLQeGQHNKIL2TOB
         25QccsuszffhnJ5JZ6UkDppRF1XhRxmVnWpnI7m7x8FFDbcNqha268aXi3HX73iHEXSu
         9ZF7WizIAaTg7I/q4VPtZczgTmEW3JQTJ70eYmyOq5RKOxUUX/iQp6dzw8UIq6FVzhyA
         KQ9y0Svk3OcBNhu+s6P8g7Ib3VFfX8vOZHsHRdeSi0jmYNsawsUQ8IaLvxyvWi2fYNRy
         XiEw==
X-Forwarded-Encrypted: i=1; AJvYcCWD/z0i9JwvC7/xPm0S9RJSMpHDSEx/2DNdG15PzlnWnmSJTAIMqwJUPCcdf1oQFCIh4e5umYQeICWK8gQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YydsIJgOOlNgRXcUQSZCNTPiUbOjlYs1eFwuANteIRNDZHpDysg
	r3Hkkr51ttjGzqzBAiIgytiQOSreFxE4H0f2Av67CDusZUQGqDxPRC57xpZhb3e833bRXI5ZCmE
	sf4jXycPSdsWL2I1MaKUzFZm5GrPiFKB+0LN7PeWjGcqTmRN4HxIOjnkq2VkZ5Q==
X-Gm-Gg: ASbGnctIJOdjYEdX67MsyBZK2CvXOjmMu2ZD0T8RR2OGfURJJx1IlyPoVSZ0CglpsFb
	LDc/d7PHVLKFiyY5bRkvMtdHMrFccMG2jVFQigvcyvGlRU4mIVx/9u7KrKPmkdQUNyqRJqP7lIW
	dcKq/CMcGTUxFT8eg5HQdrHl+LF22LDGpu39zU6lkGLjud3ibhtzGUd4q791lcQoUMV0kK53qYi
	69mIwaDHqlMkzsy8Gx0zrp2sdxNhZ/3b+FbaXFl3X1omxFgdHC9ubo7KwiwWdBrPTW4ldwpdWAo
	x4I9b/sH0aaSVa96AuxDM8dmILfXVbTCAPEZfsDD+K0CDZsRmmEI92TqWphmmz+O/c951tsdAEw
	75UgET6A7ApECZnOZOfmAV4HwixaJSAvJLyEok0Q=
X-Received: by 2002:a05:600c:1d1c:b0:442:e9ec:4654 with SMTP id 5b1f17b1804b1-442eaadc756mr27756715e9.8.1747137900557;
        Tue, 13 May 2025 05:05:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuirvefTSz3ZYGRTt8umYT7eIPBBaBLXqUzBE+NVqEiT//WFW0c+DSxeGJEPKg3eOIEgWJUQ==
X-Received: by 2002:a05:600c:1d1c:b0:442:e9ec:4654 with SMTP id 5b1f17b1804b1-442eaadc756mr27756015e9.8.1747137899943;
        Tue, 13 May 2025 05:04:59 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4d:1a00:4fdf:53e2:1a36:ba34? (p200300d82f4d1a004fdf53e21a36ba34.dip0.t-ipconnect.de. [2003:d8:2f4d:1a00:4fdf:53e2:1a36:ba34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d67efd26sm165164545e9.23.2025.05.13.05.04.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 05:04:59 -0700 (PDT)
Message-ID: <97702ff0-fc50-4779-bfa8-83dc42352db1@redhat.com>
Date: Tue, 13 May 2025 14:04:58 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/1] prctl: allow overriding system THP policy to always
To: Usama Arif <usamaarif642@gmail.com>, Zi Yan <ziy@nvidia.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Yafang Shao <laoar.shao@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 shakeel.butt@linux.dev, riel@surriel.com, baolin.wang@linux.alibaba.com,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, linux-kernel@vger.kernel.org, kernel-team@meta.com
References: <96eccc48-b632-40b7-9797-1b0780ea59cd@gmail.com>
 <8E3EC5A4-4387-4839-926F-3655188C20F4@nvidia.com>
 <279d29ad-cbd6-4a0e-b904-0a19326334d1@gmail.com>
 <CALOAHbCxhL=VM=E5UzNvQYZsrF4zdcQ1-49iEJ1UYvLsurtxCw@mail.gmail.com>
 <ebfca8f2-40e5-485a-a060-621aa3a22376@gmail.com>
 <CALOAHbDesDGyokKFSSr3hA1_WnFciQPXe_nboPq9v8OUPLv47g@mail.gmail.com>
 <20250509051328.GF323143@cmpxchg.org>
 <CALOAHbA617417UtcwMBJ9Zm_8BbAth57=ngN=tknw8h7nvCwNw@mail.gmail.com>
 <41e60fa0-2943-4b3f-ba92-9f02838c881b@redhat.com>
 <CALOAHbAvQDee2=5vsDqj77g5gAGdGpXFBbsC7tpKnCYEDZS3vw@mail.gmail.com>
 <20250509164654.GA608090@cmpxchg.org>
 <f691d2e0-5919-4581-8a24-1b543d798ae4@redhat.com>
 <8A18FB29-CC41-456F-A80E-807984691F0F@nvidia.com>
 <913bdc9b-a3c2-401c-99d0-18799850db9e@redhat.com>
 <13b68fa0-8755-43d8-8504-d181c2d46134@gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 xsFNBFXLn5EBEAC+zYvAFJxCBY9Tr1xZgcESmxVNI/0ffzE/ZQOiHJl6mGkmA1R7/uUpiCjJ
 dBrn+lhhOYjjNefFQou6478faXE6o2AhmebqT4KiQoUQFV4R7y1KMEKoSyy8hQaK1umALTdL
 QZLQMzNE74ap+GDK0wnacPQFpcG1AE9RMq3aeErY5tujekBS32jfC/7AnH7I0v1v1TbbK3Gp
 XNeiN4QroO+5qaSr0ID2sz5jtBLRb15RMre27E1ImpaIv2Jw8NJgW0k/D1RyKCwaTsgRdwuK
 Kx/Y91XuSBdz0uOyU/S8kM1+ag0wvsGlpBVxRR/xw/E8M7TEwuCZQArqqTCmkG6HGcXFT0V9
 PXFNNgV5jXMQRwU0O/ztJIQqsE5LsUomE//bLwzj9IVsaQpKDqW6TAPjcdBDPLHvriq7kGjt
 WhVhdl0qEYB8lkBEU7V2Yb+SYhmhpDrti9Fq1EsmhiHSkxJcGREoMK/63r9WLZYI3+4W2rAc
 UucZa4OT27U5ZISjNg3Ev0rxU5UH2/pT4wJCfxwocmqaRr6UYmrtZmND89X0KigoFD/XSeVv
 jwBRNjPAubK9/k5NoRrYqztM9W6sJqrH8+UWZ1Idd/DdmogJh0gNC0+N42Za9yBRURfIdKSb
 B3JfpUqcWwE7vUaYrHG1nw54pLUoPG6sAA7Mehl3nd4pZUALHwARAQABzSREYXZpZCBIaWxk
 ZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT7CwZgEEwEIAEICGwMGCwkIBwMCBhUIAgkKCwQW
 AgMBAh4BAheAAhkBFiEEG9nKrXNcTDpGDfzKTd4Q9wD/g1oFAl8Ox4kFCRKpKXgACgkQTd4Q
 9wD/g1oHcA//a6Tj7SBNjFNM1iNhWUo1lxAja0lpSodSnB2g4FCZ4R61SBR4l/psBL73xktp
 rDHrx4aSpwkRP6Epu6mLvhlfjmkRG4OynJ5HG1gfv7RJJfnUdUM1z5kdS8JBrOhMJS2c/gPf
 wv1TGRq2XdMPnfY2o0CxRqpcLkx4vBODvJGl2mQyJF/gPepdDfcT8/PY9BJ7FL6Hrq1gnAo4
 3Iv9qV0JiT2wmZciNyYQhmA1V6dyTRiQ4YAc31zOo2IM+xisPzeSHgw3ONY/XhYvfZ9r7W1l
 pNQdc2G+o4Di9NPFHQQhDw3YTRR1opJaTlRDzxYxzU6ZnUUBghxt9cwUWTpfCktkMZiPSDGd
 KgQBjnweV2jw9UOTxjb4LXqDjmSNkjDdQUOU69jGMUXgihvo4zhYcMX8F5gWdRtMR7DzW/YE
 BgVcyxNkMIXoY1aYj6npHYiNQesQlqjU6azjbH70/SXKM5tNRplgW8TNprMDuntdvV9wNkFs
 9TyM02V5aWxFfI42+aivc4KEw69SE9KXwC7FSf5wXzuTot97N9Phj/Z3+jx443jo2NR34XgF
 89cct7wJMjOF7bBefo0fPPZQuIma0Zym71cP61OP/i11ahNye6HGKfxGCOcs5wW9kRQEk8P9
 M/k2wt3mt/fCQnuP/mWutNPt95w9wSsUyATLmtNrwccz63XOwU0EVcufkQEQAOfX3n0g0fZz
 Bgm/S2zF/kxQKCEKP8ID+Vz8sy2GpDvveBq4H2Y34XWsT1zLJdvqPI4af4ZSMxuerWjXbVWb
 T6d4odQIG0fKx4F8NccDqbgHeZRNajXeeJ3R7gAzvWvQNLz4piHrO/B4tf8svmRBL0ZB5P5A
 2uhdwLU3NZuK22zpNn4is87BPWF8HhY0L5fafgDMOqnf4guJVJPYNPhUFzXUbPqOKOkL8ojk
 CXxkOFHAbjstSK5Ca3fKquY3rdX3DNo+EL7FvAiw1mUtS+5GeYE+RMnDCsVFm/C7kY8c2d0G
 NWkB9pJM5+mnIoFNxy7YBcldYATVeOHoY4LyaUWNnAvFYWp08dHWfZo9WCiJMuTfgtH9tc75
 7QanMVdPt6fDK8UUXIBLQ2TWr/sQKE9xtFuEmoQGlE1l6bGaDnnMLcYu+Asp3kDT0w4zYGsx
 5r6XQVRH4+5N6eHZiaeYtFOujp5n+pjBaQK7wUUjDilPQ5QMzIuCL4YjVoylWiBNknvQWBXS
 lQCWmavOT9sttGQXdPCC5ynI+1ymZC1ORZKANLnRAb0NH/UCzcsstw2TAkFnMEbo9Zu9w7Kv
 AxBQXWeXhJI9XQssfrf4Gusdqx8nPEpfOqCtbbwJMATbHyqLt7/oz/5deGuwxgb65pWIzufa
 N7eop7uh+6bezi+rugUI+w6DABEBAAHCwXwEGAEIACYCGwwWIQQb2cqtc1xMOkYN/MpN3hD3
 AP+DWgUCXw7HsgUJEqkpoQAKCRBN3hD3AP+DWrrpD/4qS3dyVRxDcDHIlmguXjC1Q5tZTwNB
 boaBTPHSy/Nksu0eY7x6HfQJ3xajVH32Ms6t1trDQmPx2iP5+7iDsb7OKAb5eOS8h+BEBDeq
 3ecsQDv0fFJOA9ag5O3LLNk+3x3q7e0uo06XMaY7UHS341ozXUUI7wC7iKfoUTv03iO9El5f
 XpNMx/YrIMduZ2+nd9Di7o5+KIwlb2mAB9sTNHdMrXesX8eBL6T9b+MZJk+mZuPxKNVfEQMQ
 a5SxUEADIPQTPNvBewdeI80yeOCrN+Zzwy/Mrx9EPeu59Y5vSJOx/z6OUImD/GhX7Xvkt3kq
 Er5KTrJz3++B6SH9pum9PuoE/k+nntJkNMmQpR4MCBaV/J9gIOPGodDKnjdng+mXliF3Ptu6
 3oxc2RCyGzTlxyMwuc2U5Q7KtUNTdDe8T0uE+9b8BLMVQDDfJjqY0VVqSUwImzTDLX9S4g/8
 kC4HRcclk8hpyhY2jKGluZO0awwTIMgVEzmTyBphDg/Gx7dZU1Xf8HFuE+UZ5UDHDTnwgv7E
 th6RC9+WrhDNspZ9fJjKWRbveQgUFCpe1sa77LAw+XFrKmBHXp9ZVIe90RMe2tRL06BGiRZr
 jPrnvUsUUsjRoRNJjKKA/REq+sAnhkNPPZ/NNMjaZ5b8Tovi8C0tmxiCHaQYqj7G2rgnT0kt
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <13b68fa0-8755-43d8-8504-d181c2d46134@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>>> This means process level control overrides VMA level control, which
>>> overrides global control, right?
>>>
>>> Intuitively, it should be that VMA level control overrides process level
>>> control, which overrides global control, namely finer granularly control
>>> precedes coarse one. But some apps might not use VMA level control
>>> (e.g., madvise) carefully, we want to override that. Maybe ignoring VMA
>>> level control is what we want?
>>
>> Let's take a step back:
>>
>> Current behavior is
>>
>> 1) If anybody (global / process / VM) says "never" (never/PR_SET_THP_DISABLE/VM_NOHUGEPAGE), the behavior is "never".
> 
> Just to add here to the current behavior for completeness, if we have the global system setting set to never,
> but the global hugepage level setting set to madvise, we do still get a THP, i.e. if I have:
> 
> [root@vm4 vmuser]# cat /sys/kernel/mm/transparent_hugepage/enabled
> always madvise [never]
> [root@vm4 vmuser]# cat /sys/kernel/mm/transparent_hugepage/hugepages-2048kB/enabled
> always inherit [madvise] never
> 
> And then MADV_HUGEPAGE some region, it still gives me a THP.

Yes. These "global" / "system" toggles are to be considered "one 
setting". If you set a per-size toggle to something that is not 
"inherit", then you're telling the system that you want more fine-grain 
control.

In retrospective, we could maybe have made 
"/sys/kernel/mm/transparent_hugepage/enabled" a symlink to 
/sys/kernel/mm/transparent_hugepage/hugepages-2048kB/enabled, but we 
didn't think of that option back then and decided for the "inherit" 
solution.

> 
>>
>> 2) In "madvise" mode, only "VM_HUGEPAGE" gets THP unless PR_SET_THP_DISABLE is set. So per-process overrides per-VMA.
>>
>> 3) In "always" mode, everything gets THP unless per-VMA (VM_NOHUGEPAGE) or per-process (PR_SET_THP_DISABLE) disables it.
>>
>>
>> Interestingly, PR_SET_THP_DISABLE used to mimic exactly what I proposed for the other direction (change default of VM_HUGEPAGE), except that it wouldn't modify already existing mappings. Worth looking at 1860033237d4. Not sure if that commit was the right call, but it's the semantics we have today.
>>
>> That commit notes:
>>
>> "It should be noted, that the new implementation makes PR_SET_THP_DISABLE master override to any per-VMA setting, which was not the case previously."
>>
>>
>> Whatever we do, we have to be careful to not create more mess or inconsistency.
>>
>> Especially, if anybody sets VM_NOHUGEPAGE or PR_SET_THP_DISABLE, we must not use THPs, ever.
>>
> 
> 
> I thought I will also summarize what the real world usecases are that we want to solve:
> 
> 1) global system policy=madvise, process wants "always" policy for itself: We can have different types of workloads stacked on the same host, some of them benefit from always having THPs,
> others will incur a regression (either its a performance regression or they are completely memory bound and even a very slight increase in memory will cause them to OOM).
> So we want to selectively have "always" set for just those workloads (processes). (This is how workloads are deployed in our (Metas) fleet at this moment.)

Agreed.

Similar to the process setting VM_HUGEPAGE on all VMAs where we do want 
VMAs.

> 
> 2) global system policy=always, process wants "madvise" policy for itself: Same reasoning as 1, just that the host has a different default policy and we don't want the workloads (processes) that regress with always getting THPs to do so.
> (We hope this is us (meta) in the future, if a majority of workloads show that they benefit from always, we flip the default host setting to "always" and workloads that regress can opt-out and be "madvise".
> New services developed will then be tested with always by default. Always is also the default defconfig option upstream, so I would imagine this is faced by others as well.)
> 

Understood.

Similar to the process setting VM_NOHUGEPAGE on all VMAs where we don't 
want THPs.

> 3) global system policy=never, process wants "madvise" policy for itself: This is what Yafang mentioned in [1]. sysadmins dont want to switch the global policy to madvise, but are willing to accept certain processes to madvise.
> But David mentioned in [2] that never means no thps, no exceptions and the only way to solve some issues in the past has been to disable THPs completely.

Yes.

Similar to setting on all processes where we don't want any THPs 
PR_SET_THP_DISABLE.

> 
> Please feel free to add to the above list. I thought it would be good to list them out so that the solution can be derived with them in mind.
> 
> In terms of doing this with prctl, I was able to make prototypes for the 2 approaches that have been discussed:
> 
> a) have prctl change how existing and new VMAs have VM_HUGEPAGE set for the process including after fork+exec, as proposed by David. This prototype is available at [3]. This will solve problem 1 discussed above, but I don't think this
> approach can be used to solve problems 2 and 3? There isnt a way where we can have a process change VMA setting so that after prctl, all future allocations are on madvise basis and not global policy (even if always). IOW we will need
> some change in thp_vma_allowable_orders to have it done on process level basis.

Let's assume we change PR_SET_THP_DISABLE to per-VMA handling as well, 
we could have for the use cases

1) system policy=madvise. Set (new) PR_SET_THP_ENABLE on the process.

Afterwards, MADV_NOHUGEPAGE could be used to fine-tune the VMAs. (e.g., 
explicitly temporarily disable on some areas, for example, required with 
some uffd scenarios)

2) system policy=always. Set PR_SET_THP_DISABLE, then only enable it for 
the VMAs using MADV_HUGEPAGE.

3) system policy=madvise/always. Set PR_SET_THP_DISABLE on all processes 
where we don't want THPs.


In case of 3) nothing would stop the process from re-enabling THPs 
either using the prctl or madvise(). If that's a problem, 
PR_SET_THP_DISABLE_LOCKED or sth. like that could be used.


But again, just a thought on how to work with what we already have, 
trying not to create an absolute mess.

> 
> b) have prctl override global policy *only* for hugepages that "inherit" global and only if global is "madvise" or "always". This prototype is available at [4]. The way I did this will achieve usecase 1 and 2, but not 3 (It can very easily be modified to get 3, but didn't do it as there maybe still is a discussion on what should be allowed when global=never?). I do prefer this method as I think it might be simpler overall and achieves both usecases.


I'm afraid that will create a mess. :/


-- 
Cheers,

David / dhildenb

