Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D63F1B21A9
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 15:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738250818; cv=none; b=JPa8zVXnLiPtHZ20VSfBDEl9tV92YQmnoYVY7h2D3naWGAyEvjWuPcWnNh4UAY7vLOwro1j0YydXro6CLGsBUmP2ZydlaLT91PA0AojOfV/fFgKY/gq91x9Owz0c/htUnoefpFdIKRFWxexBJWJ5X1SiiUcF5K96RB60/2DPAa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738250818; c=relaxed/simple;
	bh=8PCY9ZEubysIAYZFjDqAIQfQh50CXX0ejaLffFStepw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Z15Qp8Q8kiO+qYIOw5MoQ8MUzzX6TSB/GDAHdqHdFVIalpAiCDzyy86li+1P/XpzyeeFYallBdmneYAU0VsIScGNZIsU7iTSwMY6BaBfmxtN8F/uAYwnbC0V3WnDaXbqiP33S51F84QNAJOPcQ31FoIk47Mc39V9Tc6m3yY5+/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ik+h1gMZ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ik+h1gMZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738250815;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=6EfvH24Zk4QAYrENk+aBxb1nppjMz5tPj3khOZvqEvA=;
	b=ik+h1gMZ8ka18OFOlwsoJSfer22sNF2mL1smFdO8V4uBz9g49MTJZ9tJU6xlElTFCgU8qJ
	J3EnNCCnKaGIoreZG5Es0P/mDn2n8nnARLF9OHuXwyU9c2LhXv3wGfKjyaax9FD2hSlMHP
	Y1ym/rxo8qSoO2PS76O3JRqIaGKl3Fk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-261-fulUq_qlPgejRB_XnEUBVQ-1; Thu, 30 Jan 2025 10:26:54 -0500
X-MC-Unique: fulUq_qlPgejRB_XnEUBVQ-1
X-Mimecast-MFC-AGG-ID: fulUq_qlPgejRB_XnEUBVQ
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43623bf2a83so6691315e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 07:26:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738250813; x=1738855613;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6EfvH24Zk4QAYrENk+aBxb1nppjMz5tPj3khOZvqEvA=;
        b=Z3r/lY5B5wYSt35V8kvsYKDrWz1kuyij044jevdtKE+HKwmA4sfRtYEQqSKGpXMBGE
         evYgxdVknCh+sl/8KNQ8oa+AZoLKAv20wMvzW8DS/KhsNxzY1V9qL/0h7M/pJ6mdcOPA
         iXFKUQHNk6t3JkqaY9j3ew1MW3J/Mnai+rLPHh7Q00cLtV/M7qJ+1X8aws6mCdccIWNx
         66AoIMyqC1LBOHJakeSI7ZSat9oBYU4MzWPz1GZljyAluFkf0gxQ+fSFZx0ZI0YNONYs
         omR5X/9mPri+PS6MAU+rG1gIiXi0t98zhCxBPgLSmxMIQZdk+2N1wH43+t+l3o7jiKJm
         z3qA==
X-Forwarded-Encrypted: i=1; AJvYcCVn5mpSikZR3476jflOaR/DlCVMYeb/PGBu7jrFFC1i8X+GPzZxQO7cjot3438xLLTuXxAcsUGTiIkw2CQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhSUiXZ9kdG+/Qc/c1TS4C2RH0UHmEeezatFw4QlzQvuGQBThQ
	GTblbG2AgHiRZm//wbGDJ5acR/PsQfcJv7JXz4SYQTeCSlDMc+ntpZ35DXCE48HOHRpDJR+V8ue
	/+6oQtIk6ifrUxikFdQpvNOl5sLryoLuD2cQgUmWtZre8PYnx4QXbdmzzPx/xIg==
X-Gm-Gg: ASbGncs+DPGND0wBaVugvHZJV10FzUJErdLeUwlonuMc+8/HmsTanakDHQr8gRj7LUx
	36YQrJSBix4kL/Wb8AP6LnSgIAOr7wk51AnWCvtk24SFxu51/HvzGzrfNb7t0oeDs8m4LmP4FZt
	tJYnwChq71EFrTFoZOmhS0CQ3eZgS3TH+GkOA3B+XqRt9/KG7MjXbLWooIIdayO4VKHAoTqsM1X
	OUFO0h1pVDNygtQp3MmMtnz7484eBmsB0/5LJ9X/lWJVONu+0DEt9BP08cQ3ET6Mzg9l1szIRY6
	1XF+CqHPuGXKDAAs0rAiA1QliYk4+dYaRN9REW+FjyO6x4zsBE8OxGMDYS4pg4uljWj9JJndpVk
	vluaKlVmo12gC4CopaW0s5ty6211IkaFK
X-Received: by 2002:a05:600c:154f:b0:436:30e4:459b with SMTP id 5b1f17b1804b1-438dc3ca451mr67421145e9.18.1738250812880;
        Thu, 30 Jan 2025 07:26:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF5i55LyvroBppi5sagXhnryW5jxU5Q3lAVRCCxKZvooKz6TsR04LsBL0jQxaaSe4iNmLMxgA==
X-Received: by 2002:a05:600c:154f:b0:436:30e4:459b with SMTP id 5b1f17b1804b1-438dc3ca451mr67420875e9.18.1738250812484;
        Thu, 30 Jan 2025 07:26:52 -0800 (PST)
Received: from ?IPV6:2003:cb:c713:3b00:16ce:8f1c:dd50:90fb? (p200300cbc7133b0016ce8f1cdd5090fb.dip0.t-ipconnect.de. [2003:cb:c713:3b00:16ce:8f1c:dd50:90fb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e23deedfsm27026195e9.16.2025.01.30.07.26.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 07:26:51 -0800 (PST)
Message-ID: <10e0b904-1ddb-429e-bcfa-22b360a841b3@redhat.com>
Date: Thu, 30 Jan 2025 16:26:49 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/4] mm/mmu_notifier: drop owner from
 MMU_NOTIFY_EXCLUSIVE
To: Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, nouveau@lists.freedesktop.org,
 Andrew Morton <akpm@linux-foundation.org>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?=
 <jglisse@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, Peter Xu <peterx@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>
References: <20250129115803.2084769-1-david@redhat.com>
 <20250129115803.2084769-3-david@redhat.com>
 <h4dnoixvp2kjeao6mzcpze4zx6t34ebpltqadkjl5zxcjhddkf@lbzo2yhzu5sz>
 <eab05949-efc8-4c04-ace1-b4435ec894e6@redhat.com>
 <Z5t-sFymrz5kFafV@phenom.ffwll.local>
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
In-Reply-To: <Z5t-sFymrz5kFafV@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30.01.25 14:29, Simona Vetter wrote:
> On Thu, Jan 30, 2025 at 10:28:00AM +0100, David Hildenbrand wrote:
>> On 30.01.25 06:34, Alistair Popple wrote:
>>> Looking at hmm_test I see that doesn't use the sequence counter to ensure
>>> the PTE remains valid whilst it is mapped. I think that is probably wrong, so
>>> apologies if that lead you astray.
>>
>> Yes, the hmm_test does not completely follow the same model the nouveau
>> implementation does; so it might not be completely correct.
> 
> But unrelated but just crossed my mind:
> 
> I guess another crucial difference is that the hw (probably, not sure)
> will restart the fault if we don't repair it to its liking. So the
> hmm-test does need some kind of retry loop too somewhere to match that.

Yes. Especially for the folio lock spinning is a rather suboptimal 
approach. So we likely would want the option to just lock it instead of 
try-locking it. (or getting rid of it entirely :) )

> But might be good to also still land some of the other improvements
> discussed in these threads to make make_device_exclusive a bit more
> reliable instead of relying on busy-looping throug the hw fault handler
> for everything.

Right.

-- 
Cheers,

David / dhildenb

