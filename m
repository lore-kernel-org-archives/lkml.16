Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1EB125F988
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 07:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749540011; cv=none; b=In63chiiOgrRhXzwoRFQqL+vvGfAihmCudEM8og1fpSULqacHn2Ual2tFsrctxY4IAYPGdZfVNsOxOQCZ1A+aPLAhs94oQaVG+1FHOu0nFKsy9orHWM8eDc/xHmW77b2wU97tXTFdNJLI8dLRnvJYpH4QDZjCI2brqUulhgGLis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749540011; c=relaxed/simple;
	bh=a7lPjgYTb0aRz+p4geICBOWBxSmZ75YAMAQuF8nonno=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tgnsmvJoUJG/83BI6hhTI0mCa1qmWVnJyQuo4eUjS9G8dfMFxQ7L0bHj1D0OSbWqLc1JdzEzG7HX2FwhuHYetkwIQarZSHO9sULmSGCDCb4pergEdQMEBjjB/Wd+Dbuym2EGEttrXYXHEOlZ3VSMQ+647aniqJNMutvq6hPOAGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MVAf7vZ6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MVAf7vZ6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749540007;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=lrkpWK2U6JUfo5rI7RmYsKcjVK1dhQgwY8EFVlFCij0=;
	b=MVAf7vZ6E8nyu2AzvuSrbcfKmY4HYe3WKv9pxgfiyh4zGIegUNRZMIjm8KcPiFob/V9zOf
	1JaeQVKYxlHjtOmCY3SSPFy65JAeC93RNP+O5V7Sm5X3OTu6U5jbUxDETTUEs2EakFN92T
	PPbhtzR+aPB33TdGk8hb+NAC7Ut5ncg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-15-SdDL-fiIP4CtQTSTR6dbnQ-1; Tue, 10 Jun 2025 03:20:05 -0400
X-MC-Unique: SdDL-fiIP4CtQTSTR6dbnQ-1
X-Mimecast-MFC-AGG-ID: SdDL-fiIP4CtQTSTR6dbnQ_1749540004
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-450d6768d4dso32467775e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 00:20:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749540004; x=1750144804;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lrkpWK2U6JUfo5rI7RmYsKcjVK1dhQgwY8EFVlFCij0=;
        b=osDP/QmojObFhWBoFSVnzaRw4gWF8G47XZKqMrRMg8OCECFDT28MZcNsxtBPkB1SPw
         0UNIje54IfkdMaq3efTU4yT0qsW9gP70nzzPkvcyNlMIns+zhUWFcVClTbN/6XtDu8ox
         QaMOFCCL0/7Tpm39rlrRGmprTK2auoneOCa+9yywjObqQTpCQnia3QaBABNO+pUwWcib
         RaAaUTb72tKQtqs2cInF4XE4cP8RuQQqianOQ0n4AN0F4TYze2rgjNajNV8VEmsuo2ba
         PNAC2HNC+p/i1fNiOKA/Cw8v8B5REqR8MilOudnFdUzA9LtMWj54HwhzKi229dsRAVwC
         ai9g==
X-Forwarded-Encrypted: i=1; AJvYcCXDE9ceP6rFTGz8d3p9O/qHRxu3ER3nJexDJCvZxLlj+MEf4Pj2tIPSNiWjM48GhCaHtOWd4ZEjVRnobzE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn3NuOcXsAwNb/HTAHFi62K0Tv7cVjuw6jLIE+AK8DJceEf00g
	NZ7P36Ze8AuK0oE96mkeL0G0znra7ORMnJR+RIqpqLhNPQmSfraKCqxdLybGOnbWdBezxmVHGHW
	mW7WUsy1h9tZ+uAwV57YNz31uP9rmNk+wnB91eI26XmZrpvWVz5T8yXfYLqsccoxCtQ==
X-Gm-Gg: ASbGncu6jZrsrizD+oAFJOXaMhrwCdjGkKumbEqxksqIeDisNWOAKYPjILMB5x0nwte
	PUSHjgc9K+2i32GQNI3KFYFkmYLjaV6UQXbl7a12zeK7Bbl/5VMQb/MxLBCkFW38fitWiY5cjT4
	edpyDLleae1QgKxFth0jl3UvSAwbRPNTaWzL5Rt1GmUl0ie/OY1DUCBXa/3gJYJ1+kWHhqbjCyp
	sQ9pu1ZoXuCmbVYK4qo0HGosxZi4rI7+zur5zjXEq/6avr3NVyxx82LvzJ1qpBn3ky2sCHLjdu0
	Qbz29y5WStvmi02aJn+5ZiaAZSxih/EffKnr17oD1uTAQ5oqpyq35Nc=
X-Received: by 2002:a05:600c:c119:b0:453:78f:faa8 with SMTP id 5b1f17b1804b1-453078ffbbamr61001475e9.6.1749540004217;
        Tue, 10 Jun 2025 00:20:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHViFKIB0RWSE0EdSBXJYyv2jdRztoVq/E6i/xbuG9PnxEvu7mKobFeXcECNG61rrdnCZhdAQ==
X-Received: by 2002:a05:600c:c119:b0:453:78f:faa8 with SMTP id 5b1f17b1804b1-453078ffbbamr61001235e9.6.1749540003871;
        Tue, 10 Jun 2025 00:20:03 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4521370961csm131639105e9.22.2025.06.10.00.20.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 00:20:03 -0700 (PDT)
Message-ID: <06369558-6b58-4e0f-9f5d-e50dc693d53f@redhat.com>
Date: Tue, 10 Jun 2025 09:20:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2] mm: use per_vma lock for MADV_DONTNEED
To: Qi Zheng <zhengqi.arch@bytedance.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Jann Horn <jannh@google.com>, Barry Song <21cnbao@gmail.com>,
 akpm@linux-foundation.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Barry Song <v-songbaohua@oppo.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>,
 Suren Baghdasaryan <surenb@google.com>, Lokesh Gidra
 <lokeshgidra@google.com>, Tangquan Zheng <zhengtangquan@oppo.com>
References: <20250530104439.64841-1-21cnbao@gmail.com>
 <CAG48ez11zi-1jicHUZtLhyoNPGGVB+ROeAJCUw48bsjk4bbEkA@mail.gmail.com>
 <0fb74598-1fee-428e-987b-c52276bfb975@bytedance.com>
 <c6dbfb68-413a-4a98-8d21-8c3f4b324618@lucifer.local>
 <3cb53060-9769-43f4-996d-355189df107d@bytedance.com>
 <c813c03a-5d95-43a6-9415-0ceb845eb62c@lucifer.local>
 <7cb990bf-57d4-4fc9-b44c-f30175c0fb7a@bytedance.com>
 <bfb56be6-d55e-4dcc-93a3-4c7e6faf790f@lucifer.local>
 <f0069b65-9ca8-44e5-8c98-1d377798c31e@bytedance.com>
 <d68ba9d4-5850-4b70-bbf3-00d79f19fd3f@lucifer.local>
 <5fac6f20-2643-4d98-a29a-06471f156762@bytedance.com>
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
In-Reply-To: <5fac6f20-2643-4d98-a29a-06471f156762@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09.06.25 08:40, Qi Zheng wrote:
> Hi Lorenzo,
> 
> On 6/6/25 6:44 PM, Lorenzo Stoakes wrote:
> 
> [snip]
> 
>>>
>>>>
>>>> We could in theory always add another callback .pmd_entry_sleep or
>>>> something for this one case and document the requirement...
>>>
>>> Maybe, but the SRCU critical section cannot prevent the PTE page from
>>> being freed via RCU. :(
>>
>> Idea is we'd fall back to non-RCU in this case and take locks... but then
>> ugh we'd race everything RCU and no it's all or nothing isn't it?
> 
> So maybe the RCU+refcount method is feasible. We can release the RCU
> lock after incrementing the reference count, which can ensure that the
> page table page is not freed.

I'll not that maybe after the memdesc rework, page tables will no longer 
have a refcount. Maybe.

I mean, it kind-of makes sense, because nobody should really be taking 
references on page table.

So finding something that doesn't depend on page-table refcounts might 
be better.

-- 
Cheers,

David / dhildenb

