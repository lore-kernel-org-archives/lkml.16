Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8F321CA05
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 09:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748597289; cv=none; b=HncuIFkxS6tgZ/kP4TRRtNwe+fJv13AzCrUv1bXP/iY7/bcsgUqMeEudQD8C67Z8aQhXbu+WibIK4YsnI9HGx4g7BL+jMUHMjMTLhHaZ3aTxs/amFD7N02uAFH9s04UyFgET6clf1hjqQifu+57t9PG5XJ/VVa+i9S4vcz6KBO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748597289; c=relaxed/simple;
	bh=UPgrN+I2yqTJYCpGaX5IMke5p2FuQ5Fto8LxZ7iAGOE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V0i8FWo/wPH+mG5jsrs+tWWpf1Mi/XQiCnJunGVNPfNMBW9BGxm4WPCd0QmhucIHAqY+FwHZ0kUWQN2hGAMs3gvHxbDyCrXqtbEVhTAfieqfuA2zP0Sfo/ixl7LoExVRAqzwxvhOnEhyixTdFmiSKDSkBPO0BSRYBRzBFZPM27g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SGjcQHCL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SGjcQHCL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748597286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=MaatFJjQ8egE/8VtOwBSoT6wLagg2lOTiOnjBKEO9pM=;
	b=SGjcQHCL9TkEtLRHNl1uYHuBajy8I7QMy0k7jldx/EUuNotLiKKZe15QROdVuAiUg/zl89
	EZeU9q1uOKAq9SOB2HHMdDyyXfYshegixlT4mqrJPQfg+2iS7SLBULou1Squom94N0IHe0
	Gh5DygbopDp43FJ+9kEfR2W7r8HXZP0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-442-0gERuKarOW6tGj8GvVESlA-1; Fri, 30 May 2025 05:28:05 -0400
X-MC-Unique: 0gERuKarOW6tGj8GvVESlA-1
X-Mimecast-MFC-AGG-ID: 0gERuKarOW6tGj8GvVESlA_1748597284
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a4f85f31d9so254590f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 02:28:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748597284; x=1749202084;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MaatFJjQ8egE/8VtOwBSoT6wLagg2lOTiOnjBKEO9pM=;
        b=tXjybnQHHjGyYXM1RRqHVsHL5wFO9iZnbswNsRrVVf3llx68ddBCmeThlvPCmU2im6
         UKoSo4iNuOf+aJdhera3CuwRsLuZiYGpM1l8YbY8NSUh4jIWmwJnllcTTpvrv/Ko9+PV
         Kp6PWKUBoZtZIk6IrYhNYg6+ELkJfdcJxK8nKvqHN/bsDRlWMAZI7Kp07NTDJs5TGFXQ
         m6Qd1jS8FCPWZxkvm6WBIs9Qh3yOWsmElxofwm33zYL0DFxEpic6axt652roE5xTUi4p
         zm9Yt2AxwcT4naF/XbNvraEjiDuDoT6wUXk5DMjTBSO9ReXJuSor3Rvc5EUgdj7UKxIS
         M74g==
X-Forwarded-Encrypted: i=1; AJvYcCUvSaklPu/Z6b7FCUg9V3CyTUkl8GhaEg5ZzA80MkULb+ajDHjDO/Svs8g4HwbqkWtp2Iszlcg0ynRLLc0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtnVFNTK4yg+VQ1UXxwPDxm8DciYWm4L72nKBGJ6cTysWZPGTa
	wUd1HNjmM4r5UhcWSo5qs0wscN3/LrYcqtxwQ/Bwc5cUTsqJ4l7JYIYAqKXGIzUEhRjpSraMGFB
	Z+Ex/IEPFGhVXBVczt9VIeysLgDUhxJDUQiXTFqJZi9gigqMjDPcgKvNgXiD1LCDPkQ==
X-Gm-Gg: ASbGncvexKlR9h8doSHmnWcSJbrz3NkbciLPxapmeM9vY6Ckj2YPMQ5Z5dcbD0ww8dw
	UsNI3JzizARudrbTSW3qiJDHiurpR9fnZJ669Kcunct0bbgTb9franZgSMVFtutVXcu6vXRpoQw
	Zyomn1uXc5keJP2Nr0drYA9dO/oOZ8gBNXPCn3ViOeCdUjl8bMk2foY+UDe1JC1e/JKhLxQUnMq
	vk/AJtzTqeezSScK78KKYrLCtaHq0tcjcf3F1EcHLjJwGMbplvNvUXttN8Qkpv235VL5EY9bcVO
	LcBYit1A/hdDx9qVd4hu6NstXDes0D3Brf6Osx9H5eKXra0Gc/hQENfduUz5a/m6Mno3pf9+VSv
	/Re45VllBdDWUPZoGpAgOaTTovtvnBIInwdnelD4=
X-Received: by 2002:a05:6000:230b:b0:3a4:e318:1aa9 with SMTP id ffacd0b85a97d-3a4f89ead67mr1079180f8f.59.1748597283683;
        Fri, 30 May 2025 02:28:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSN415fVjodgeAGej8jr3DGQGkFoBTJfuX+0MivXSEcmg1XYg2YU3IQl5r7q4efo/bqIG2xA==
X-Received: by 2002:a05:6000:230b:b0:3a4:e318:1aa9 with SMTP id ffacd0b85a97d-3a4f89ead67mr1079154f8f.59.1748597283295;
        Fri, 30 May 2025 02:28:03 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f03:5b00:f549:a879:b2d3:73ee? (p200300d82f035b00f549a879b2d373ee.dip0.t-ipconnect.de. [2003:d8:2f03:5b00:f549:a879:b2d3:73ee])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f009757fsm4336476f8f.78.2025.05.30.02.28.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 02:28:02 -0700 (PDT)
Message-ID: <2fb04e1b-8ce0-4216-9255-fc09c04e860b@redhat.com>
Date: Fri, 30 May 2025 11:28:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] kdump: crashkernel reservation from CMA
To: Michal Hocko <mhocko@suse.com>
Cc: Baoquan He <bhe@redhat.com>, Donald Dutile <ddutile@redhat.com>,
 Jiri Bohac <jbohac@suse.cz>, Vivek Goyal <vgoyal@redhat.com>,
 Dave Young <dyoung@redhat.com>, kexec@lists.infradead.org,
 Philipp Rudo <prudo@redhat.com>, Pingfan Liu <piliu@redhat.com>,
 Tao Liu <ltao@redhat.com>, linux-kernel@vger.kernel.org,
 David Hildenbrand <dhildenb@redhat.com>
References: <04904e86-5b5f-4aa1-a120-428dac119189@redhat.com>
 <427fec88-2a74-471e-aeb6-a108ca8c4336@redhat.com>
 <Z8Z/gnbtiXT9QAZr@MiWiFi-R3L-srv>
 <e9c5c247-85fb-43f1-9aa8-47d62321f37b@redhat.com>
 <aDgQ0lbt1h5v0lgE@tiehlicka>
 <a1a5af90-bc8a-448a-81fa-485624d592f3@redhat.com>
 <aDlsF5tAcUxo4VgT@tiehlicka>
 <e0f7fc1e-2227-4c6b-985a-34a697a52679@redhat.com>
 <aDl1ViMpK_6q_z06@tiehlicka>
 <04a49de5-eb79-431b-ba5b-eae2536781c6@redhat.com>
 <aDl5rpqCUyf7nX2M@tiehlicka>
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
In-Reply-To: <aDl5rpqCUyf7nX2M@tiehlicka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30.05.25 11:26, Michal Hocko wrote:
> On Fri 30-05-25 11:11:40, David Hildenbrand wrote:
>> On 30.05.25 11:07, Michal Hocko wrote:
>>> On Fri 30-05-25 10:39:39, David Hildenbrand wrote:
>>>> On 30.05.25 10:28, Michal Hocko wrote:
>>> [...]
>>>>> All that being said I would go with an additional parameter to the
>>>>> kdump cma setup - e.g. cma_sane_dma that would skip waiting and use 10s
>>>>> otherwise. That would make the optimized behavior opt in, we do not need
>>>>> to support all sorts of timeouts and also learn if this is not
>>>>> sufficient.
>>>>>
>>>>> Makes sense?
>>>>
>>>> Just so I understand correctly, you mean extending the "crashkernel=" option
>>>> with a boolean parameter? If set, e.g., wait 1s, otherwise magic number 10?
>>>
>>> crashkernel=1G,cma,cma_sane_dma # no wait on transition
>>
>> But is no wait ok? I mean, any O_DIRECT with any device would at least take
>> a bit, no?
>>
>> Of course, there is a short time between the crash and actually triggerying
>> kdump.
> 
> This is something we can test for and if we need a short timeout in this
> case as well then it is just trivial to add it. I am much more
> concerned about those potentially unpredictable DMA transfers that could
> take too long and it is impossible to test for those and therefore we
> need to overshoot.

Agreed.

-- 
Cheers,

David / dhildenb

