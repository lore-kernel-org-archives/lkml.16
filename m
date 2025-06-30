Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC935479B
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 09:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751274522; cv=none; b=RlNCe/lNl/FuNHXevf7ADAnqEWOBTBd5WR6z0RB3uEYWyhAp4YmTAb+W1r+uNR7nsYxVreWBxvotQ/nCRJ3r/TMdmvmxq4Q7L6GhCwOhdFizQM8btbxi0cyatpcLIEE+hwirbDGSqfhxZmyBAkXs6yulzKetFHYUSBzcAZPZlbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751274522; c=relaxed/simple;
	bh=zKeTOXh3TvcxbRfpRjEUAS0qGLUUwsV5bYuNEJs8VZE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cy8NGIq2Rp4g6WizcXmGOEV/9bf+8V70Nhj263meMSI5ULwYrQlKlRxmlmGRM9pxKPrTLVXfPdIRdARWkgiuoK0JgDvQMU+6yw38QH8wiFggRsuX+w2erDVSnv1F61Ec5ZAku17nCW+1hmUgL0SorD1k5C/5Utguf+sjpC/eDoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cfQi8G8P; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cfQi8G8P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751274520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=64xC4zQ8+9vm0l1IYRTEX7hKYTJUCSlbYR5cwQZC1I0=;
	b=cfQi8G8PFrOg8Hpri64bjuOTT9zt5e6vhttx/jUs2mhg9f8mh4nZwvNcMFkUCdGgZdOyr4
	Uq7NXBiUtF+lQHyHThihkZ9H8WjqHNIEAclZgHqtsLD3BVwO9/FMe+fz8KQRgTTDdF8KZY
	eN+Ao3TW3QiGw3MB9hcbWSK4euvySAc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-cxItLjqhNyyzTJr1X_JMlg-1; Mon, 30 Jun 2025 05:08:38 -0400
X-MC-Unique: cxItLjqhNyyzTJr1X_JMlg-1
X-Mimecast-MFC-AGG-ID: cxItLjqhNyyzTJr1X_JMlg_1751274517
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a4eeed54c2so1468264f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 02:08:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751274517; x=1751879317;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=64xC4zQ8+9vm0l1IYRTEX7hKYTJUCSlbYR5cwQZC1I0=;
        b=DnIDTfidhxkRkJM9qj98+zwWismnm3GgFuaJ9lGm+bdudaS69QT6n6GyLEuX5wUiT0
         b9MlTKqp+k9/fHBHrCwwwgkAfAPfvgr3W0rkGd2il+bWuPAlnCRgHncrYhqlPT8zWVvR
         YjkdN6RHwDMoCK2mDrA7jJzB/sxfa8Be+5MOVnaFMTEkAwnbbbVBpG0b8XCEluXk1CaU
         baifT/pO4N2Q6yvhNzE23nKBdFxuTzDKvSdTle0ZTlfIOSspWMA3N3MRO87j3dSUNNco
         5y4/1jlK2BHD+VzUHf3HJgLOhOCnhepouvweQ5NaV2moj1oaHJCqlhpfLWsKKFd+6qjc
         PMHw==
X-Forwarded-Encrypted: i=1; AJvYcCUZBNcOUwVwAcYEytc9p7KAO3tEkGiHAfMGichu2KnUGXSgjO8SyHNhIkPqNYRDyTUw+9dAYlTnYJBnYSg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzkr/b8xfLf2qRtHv1eKJmQ7ZRqj4XEeyLkmaZLOcZZRtXdsbl0
	1o1fYJuTgL05VCe1JHLuK7Do/RU1V9mDt27OhZaVZUGMBBHIRnqKvATaR7GeuHUgUotbmOXVEvE
	fTtc5LjdsvO7MnlOowZ5m0c/m7zTxd0C+GeFJj0Zv6mdp2Eqno1q35aN9mAmnbn2hTQ==
X-Gm-Gg: ASbGncua2+hhNvb+98+TouU2vI6lJOUQs3s8oN/BpGygavgZP4/490nKDG7hHrtPYHR
	SaMnKzY/vNsB88sy+hw5tvX/XT+oPuXRkeH7Sbo2k8oehyVMrYVsbR0v8fQrbpnbyhuAik1D0QM
	R8xvonkoTymsi7JG1NwyB4ts91Yz6ozHiulAouBN+kNVCbLdDZ4hlwG9k9LkH0TNv6ADsGAOtHm
	wPcwfZhLqWLR6gMfImuINznkHJ6kqacLUeELZjWMVlbNYSzb56WXVr1dvZ4dlOqZH/ePjE1nmeH
	S8/lBW1kXDSNxurewmtI76V2yJNGHihm224rjlz6TBgUoLaybCH3cdhy7u0k0vIlVYaLauHxYcA
	QxIKGuM8uVaBLgIqbXWrzxCmT3sDoghel1CSIMPcz/oVehjkcOA==
X-Received: by 2002:a05:6000:2807:b0:3a4:f892:de7f with SMTP id ffacd0b85a97d-3a8fee65129mr7468779f8f.36.1751274517047;
        Mon, 30 Jun 2025 02:08:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJLXMZpwmNlVuaEbYCO/poMsOERDXHknjrrriyl3NfUpRhPKQc/NITgoCmhjRuusQcOSt1HA==
X-Received: by 2002:a05:6000:2807:b0:3a4:f892:de7f with SMTP id ffacd0b85a97d-3a8fee65129mr7468743f8f.36.1751274516534;
        Mon, 30 Jun 2025 02:08:36 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f40:b300:53f7:d260:aff4:7256? (p200300d82f40b30053f7d260aff47256.dip0.t-ipconnect.de. [2003:d8:2f40:b300:53f7:d260:aff4:7256])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c80b5aesm9718838f8f.44.2025.06.30.02.08.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 02:08:35 -0700 (PDT)
Message-ID: <f0ccb18b-4297-4741-9dd9-d020b171c28d@redhat.com>
Date: Mon, 30 Jun 2025 11:08:34 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] mm: convert FPB_IGNORE_* into FPB_HONOR_*
To: Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Zi Yan <ziy@nvidia.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Pedro Falcato <pfalcato@suse.de>,
 Rik van Riel <riel@surriel.com>, Harry Yoo <harry.yoo@oracle.com>
References: <20250627115510.3273675-1-david@redhat.com>
 <20250627115510.3273675-2-david@redhat.com>
 <5c3428c6-25be-4a94-811a-6bb6718f6c58@arm.com>
 <cc846c55-0505-4ad6-9664-ac799d9c0226@redhat.com>
 <5375208d-2c11-4579-a303-e8416ab07159@arm.com>
 <aa9c4bd5-f36e-4820-9ca2-1154b44b8908@arm.com>
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
In-Reply-To: <aa9c4bd5-f36e-4820-9ca2-1154b44b8908@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30.06.25 11:04, Ryan Roberts wrote:
> On 30/06/2025 04:34, Dev Jain wrote:
>>
>> On 29/06/25 2:30 am, David Hildenbrand wrote:
>>> On 28.06.25 05:37, Dev Jain wrote:
>>>>
>>>> On 27/06/25 5:25 pm, David Hildenbrand wrote:
>>>>> Honoring these PTE bits is the exception, so let's invert the meaning.
>>>>>
>>>>> With this change, most callers don't have to pass any flags.
>>>>>
>>>>> No functional change intended.
>>>>
>>>> FWIW I had proposed this kind of change earlier to Ryan (CCed) and
>>>> he pointed out: "Doesn't that argument apply in reverse if you want
>>>> to ignore something new in future?
>>>>
>>>> By default we are comparing all the bits in the pte when determining the batch.
>>>> The flags request to ignore certain bits.
>>>
>>> That statement is not true: as default we ignore the write and young bit. And
>>> we don't have flags for that ;)
>>>
>>> Now we also ignore the dirty and soft-dity bit as default, unless told not to
>>> do that by one very specific caller.
>>>
>>>> If we want to ignore extra bits in
>>>> future, we add new flags and the existing callers don't need to be updated.
>>>
>>> What stops you from using FPB_IGNORE_* for something else in the future?
>>>
>>> As a side note, there are not that many relevant PTE bits to worry about in
>>> the near future ;)
>>>
>>> I mean, uffd-wp, sure, ... and before we add a FPB_HONOR_UFFD_WP to all users
>>> to be safe (and changing the default to ignore), you could add a
>>> FPB_IGNORE_UFFD_WP first, to then check who really can tolerate just ignoring
>>> it (most of them, I assume).
>> I agree.
> 
> Meh. Personally I think if you start mixing HONOR and IGNORE flags, it becomes
> very confusing to work out what is being checked for and what is not. I stand by
> my original view. But yeah, writable and young confuse it a bit... How about
> generalizing by explicitly requiring IGNORE flags for write and young, then also
> create a flags macro for the common case?
> 
> #define FPB_IGNORE_COMMON (FPB_IGNORE_WRITE | FPB_IGNORE_YOUNG |	\
> 			   FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY)
> 
> It's not a hill I'm going to die on though...

How about we make this function simpler, not more complicated? ;)

-- 
Cheers,

David / dhildenb

