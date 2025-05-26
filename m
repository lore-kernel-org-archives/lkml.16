Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F7C72607
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 18:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748285179; cv=none; b=rP6hA+DslofrEL8BPUnOM7w+RCNsu62HmH1wmhAcetVI0t/wb+rkNptoaYA4Wtydu3cakZ+AVFJOHCpKP9a76KIN/DUrypW+4fsN9alkHSF7XgipUjA2eWsqhrHQumy5gWY9JqKSrFC4OVW9BtnQu8cnwE/j0vlqm0Z6gxr/qp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748285179; c=relaxed/simple;
	bh=REc4EDS0rRfhUd3ou7FWlbV9jITmoMcWPhLdL180KIY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mMWjMpnkCE44POtrNCgsMkI4xDj9KvIBNDZhJ5gjY8hi4psq00QoqDqaSxBTt+KGY4U2vNEUKNQKyK7/MK4I5Cs+EAgXEK3f8+ZuMtY5HM2/O6K1QbCGD/jUD8zvyH8RRQRQnW6pbYss0OgIC9qei4bGrGHy+10hPPbzNAq5pS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EcJL/MQj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EcJL/MQj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748285174;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=r0wrAGbKfgNPge+QLngCDIyXG06Y+Nj4r1j/sDPY3Hw=;
	b=EcJL/MQjJxwpKJPaRTQojBEroOR4qg/XIddi/9/zUybxrWaut1q1jqvgWikCGvnR89/es9
	knDwUmYtC6QyJJkxF/UaSzKCPPpazelAVuRegCcf4Zpr8LXdaUm/VKgU5JHRAMRs/hPfiJ
	GgStLOnlVUriibOkjMiw3MzhDnhtQPA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-248-0qZSQY-_O3yp8BJoG3InCw-1; Mon, 26 May 2025 14:46:10 -0400
X-MC-Unique: 0qZSQY-_O3yp8BJoG3InCw-1
X-Mimecast-MFC-AGG-ID: 0qZSQY-_O3yp8BJoG3InCw_1748285169
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43cfda30a3cso14828585e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 11:46:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748285169; x=1748889969;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=r0wrAGbKfgNPge+QLngCDIyXG06Y+Nj4r1j/sDPY3Hw=;
        b=IxKt7ZbLean5E/V5OT7xJtDryZjtHX8W44fhO7xHHAXITYAtnZXAn+TgBvcbyylrIa
         2kLHwPzzmBe4VcSr+/i7iRm2P1P5pMSTSRUD1/OqBZNgsCGhOPShnJHlH8+vQxMjLviY
         Jp+70yqtx1aq6iQr4A307vHRt3UNGFHM04GIhyJQk0CpJTzHCTQLyHP6jC9uyn6ssMcg
         ZJZ7x6MgyKie+bcVv8HmFHzG2U4uA5HPkQ1yOQhaUuM0o8r4zyHrUMI2r/V1xQTGko6i
         inI8ugJU744kZyvC1SRrDlWaClvwubhJh9XZmscqrmnwdrdz5uYDMR8/i/aDgfPyHf1k
         E/Rg==
X-Forwarded-Encrypted: i=1; AJvYcCVV71JJN5UNp7OgambYF7EMVc8MSx8bcVmr690mcgcTCWhPuzmIM4IVGdncvyPUyqEjvGbJpNoCkHvMiFo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2RNg6OGrsQ26vwRwdURc2Hek3XUro4s2/f6eF2w9flOnUoRFD
	xKwNejwKhqrC28bIM2/1WAvhyQq2ZmVjzwSxF0flnGL/6xNcg4C/tUapF2BnJSatE1eroBVBPiC
	ZyjrMEyy1VDMbk6RNKjGRYag+tV7Hc+om5eh73UDgBQqfoEo3oA0TerznuLsLPDxnCw==
X-Gm-Gg: ASbGncvkxtZu+GzlAB6/HHiCYkhZzL68SiiLyYokil4iI6SSoWOvYNkCK2WkyoOAeyo
	xQygOMc+9x3oLUtrk4Ma+qw+ujxaHaGJkJD51FSc6IlY1hAnhOYtut4hNCQRWqVzebST/FQuh6g
	3iHvvXOjOOl5TWMZtUQJPhXJypBHqlYrLrsv0R7UfIObO/694JxM34dycgJa656zlujDzNsod4S
	TeehnHKS1CFSxKcd+Sl/eTH6Ml24J//mzs9V82p/EOhJu2/Zatu+OERXJv4G5gMWtEkhLvQUDQB
	aCbAawMy7wns674hqQgNzECamSdn2ni+s1n4NvKDcKzlozRLeXWLr8AOIjioSv7EY1JlN7DoZ3q
	3p8CMf2OAGCNEjXkoIpsi5U+vMAPWMlzgc7Ah28E=
X-Received: by 2002:a05:600c:64ca:b0:43d:46de:b0eb with SMTP id 5b1f17b1804b1-44c935dcaecmr85740595e9.12.1748285169313;
        Mon, 26 May 2025 11:46:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/H5vIlhV++umDeTkiqXdCiaBKX8srPktzZSs96d1P07b78bBoARsDB2sebK95KU0nqf+o2g==
X-Received: by 2002:a05:600c:64ca:b0:43d:46de:b0eb with SMTP id 5b1f17b1804b1-44c935dcaecmr85740475e9.12.1748285168928;
        Mon, 26 May 2025 11:46:08 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f19:6500:e1c1:8216:4c25:efe4? (p200300d82f196500e1c182164c25efe4.dip0.t-ipconnect.de. [2003:d8:2f19:6500:e1c1:8216:4c25:efe4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4d3332c01sm5832129f8f.92.2025.05.26.11.46.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 11:46:08 -0700 (PDT)
Message-ID: <06bd94c0-fefe-4bdc-8483-2d9b6703c3d6@redhat.com>
Date: Mon, 26 May 2025 20:46:07 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] mm/mmap: Fix uprobe anon page be overwritten when
 expanding vma during mremap
To: Oleg Nesterov <oleg@redhat.com>, Pu Lehui <pulehui@huaweicloud.com>
Cc: lorenzo.stoakes@oracle.com, mhiramat@kernel.org, peterz@infradead.org,
 Liam.Howlett@oracle.com, akpm@linux-foundation.org, vbabka@suse.cz,
 jannh@google.com, pfalcato@suse.de, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, pulehui@huawei.com
References: <20250521092503.3116340-1-pulehui@huaweicloud.com>
 <62b5ccf5-f1cd-43c2-b0bc-f542f40c5bdf@redhat.com>
 <afe53868-5542-47d6-8005-71c1b3bec840@huaweicloud.com>
 <13c5fe73-9e11-4465-b401-fc96a22dc5d1@redhat.com>
 <4cbc1e43-ea46-44de-9e2b-1c62dcd2b6d5@huaweicloud.com>
 <20250526154850.GA4156@redhat.com>
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
In-Reply-To: <20250526154850.GA4156@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26.05.25 17:48, Oleg Nesterov wrote:
> Hi Lehui,
> 
> As I said, I don't understand mm/, so can't comment, but...
> 
> On 05/26, Pu Lehui wrote:
>>
>> To make things simpler, perhaps we could try post-processing, that is:
>>
>> diff --git a/mm/mremap.c b/mm/mremap.c
>> index 83e359754961..46a757fd26dc 100644
>> --- a/mm/mremap.c
>> +++ b/mm/mremap.c
>> @@ -240,6 +240,11 @@ static int move_ptes(struct pagetable_move_control
>> *pmc,
>>                  if (pte_none(ptep_get(old_pte)))
>>                          continue;
>>
>> +               /* skip move pte when expanded range has uprobe */
>> +               if (unlikely(pte_present(*new_pte) &&
>> +                            vma_has_uprobes(pmc->new, new_addr, new_addr +
>> PAGE_SIZE)))
>> +                       continue;
>> +
> 
> I was thinking about
> 
> 	WARN_ON(!pte_none(*new_pte))
> 
> at the start of the main loop.
> 
> Obviously not to fix the problem, but rather to make it more explicit.

Yeah, WARN_ON_ONCE().

We really should fix the code to not install uprobes into the area we 
are moving.

Likely, the correct fix will be to pass the range as well to 
uprobe_mmap(), and passing that range to build_probe_list().

Only when growing using mremap(), we want to call it on the extended 
range only.

-- 
Cheers,

David / dhildenb

