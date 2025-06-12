Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5327F248166
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 14:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749737792; cv=none; b=oycjFIMa+1xnoOdKkvIuNF3cAUH9R/rqTL/Wxzc8qbMeqog0gsJ5tGEOZWTxGR/Kk4Li3ADuXUNd0/ENyxbJGi4iu77c9SWAIF6OCKXG0ySERTbnDp1s/M2Mxn0k5YljrelWPmKhwUJnJuKqgWoQg/m0qOh4bJYm+9jGYzJDxuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749737792; c=relaxed/simple;
	bh=nG+jxcUpmXrBYrEek6eX+v70PG8fQ+P505c/UdbARoA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KRMsrpLpTUPLGGQCLz5svX3eQNNruOo+sEnKPd9xbF8+7SvilaASWvGtdrWAnKVBuHKEQSRhrvIjTtCSQNJFqH9JEDlZDCw2V/Yvrvf2TzhtyhAMxUU3IFKU9Jjc+UczK6Mr7I2dTGXG7UmSf4L/VZ6QmAp1WzA/H5Or+Yn06+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QcVqEPs+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QcVqEPs+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749737789;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=vn5KxC01xvmiFp/syyWqBt2AJ+Zmvl3pjCQmiPB8670=;
	b=QcVqEPs+KHA4uORZEP2eWsav8R8RRIVAZMdpDJHavn8h9IQw64gArtfcgzu4L2vu4dOXmp
	RzK+UVaiIYyyTg1SPHl1le8zge6U5ZaeELw9MyD8MtueHenaeGf+2Zxjt1/vPJttLpf8cM
	MB6ASEFb+xyYiKLlxfrAdLg32Uz0/bw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-170-Niwr3DGZMlqfRZy5OMFqOg-1; Thu, 12 Jun 2025 10:16:27 -0400
X-MC-Unique: Niwr3DGZMlqfRZy5OMFqOg-1
X-Mimecast-MFC-AGG-ID: Niwr3DGZMlqfRZy5OMFqOg_1749737786
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a54a8a0122so519512f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 07:16:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749737786; x=1750342586;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vn5KxC01xvmiFp/syyWqBt2AJ+Zmvl3pjCQmiPB8670=;
        b=qyvOmBQE+thZEJ3jEkOMkjSmzdXvgHhOuZCyO2nVfCJ78kYVbGDa6iWgRHN1bQQJOF
         qau41i9CTv6vg8tYlK37xlReOgo0llEPOQEp2gBP7enZxZWqfgV4LQVMnUCrsj5G1R44
         z0SYmzwiU8WU3wSrekNGlbxiWYGzC76Eh6lGck4iiKzeTDVOnuJ7ITlVNl/5BLWwCf0q
         qwcLb88/CfPVyqvCX384q7SDcjRBvQ7SYz6fJw8Z90KFi2o08h+LizVH/oMOudWIbhwD
         dtVRn3lXNyaj7v8+6vvdx5DcyPbLlNWs+pMdk9fvuSp/+89PD5pE4zxV/1KU2VKmqd2m
         fDMA==
X-Forwarded-Encrypted: i=1; AJvYcCX2T2Ixf91AFMO4+WOby6oVWukalohXgcyRWXJ1lKhM07V86X9HfPqWZqUtTJSURDO8wA135bIvFdCgOhs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbcIPBeZzXuV+rphnllBHjPvu15pLVzX8I0fhEc4bLEDkTFoP4
	MruoChv9QPh4bIX8xr10IPpgiwCpKAhL80Rqt3PyEZ5QLZela3USTnU6dkBH9tr7+nH2sKIokRc
	aqWAFg+whgJJqeRy6VkVKLhG6e3p3yeiSntp60ThC6ERvezqBOTMf3Hq/79EBnmpi9A==
X-Gm-Gg: ASbGncs9BhPBxQu0P4Cs8NLdAzmPld4dgMEkrHlJ7cihL9NQ+6bQ9DvSiUyFAMqL1lY
	LulL+NzUY+y4+1ze6c+Z188yLcNqWpFBsmV9a/+2zExBhxT+PyozQx1i0SqV5nDJmkM37UxUWir
	fBxOKdDedMhsKR/UEXoUc/RTyfoX71n4ah/BNIlfKi47ivqytI/BWD4f1wQVBdqFPvspecehczo
	GhnsZ5mYDahGjxCAEJuXAiQ7rbB/4ku0Hnz4hhHcspmrau/3ZBY+/XXFyWvpC/fNDgtc3qGc9Nk
	2jKDUKRueDRJjwP8wIAHAOXXa9OVD2G0dQNGw1qkZ08sKqWLN0RmGV7hXXYYEE2A57KnjnmS/hl
	wPGtlrfuA/5Cy1ej+UHlCAiq2CnqtahYrzrlmnAah9KwE/CBKdQ==
X-Received: by 2002:a05:6000:4305:b0:3a4:f7ae:77cc with SMTP id ffacd0b85a97d-3a5603b08ddmr3034675f8f.0.1749737786397;
        Thu, 12 Jun 2025 07:16:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1A7mp073xZaNS9y1PabnR7Iw/E97SE3d2SGCKiHbtPjJ5G/l1yk4DbgQ6shodPe4sIJT/DA==
X-Received: by 2002:a05:6000:4305:b0:3a4:f7ae:77cc with SMTP id ffacd0b85a97d-3a5603b08ddmr3034625f8f.0.1749737785911;
        Thu, 12 Jun 2025 07:16:25 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f2c:1e00:1e1e:7a32:e798:6457? (p200300d82f2c1e001e1e7a32e7986457.dip0.t-ipconnect.de. [2003:d8:2f2c:1e00:1e1e:7a32:e798:6457])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e13c187sm22369795e9.23.2025.06.12.07.16.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 07:16:25 -0700 (PDT)
Message-ID: <7b03ba9d-5ace-4c1e-a415-544b471f19d7@redhat.com>
Date: Thu, 12 Jun 2025 16:16:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] mm: huge_memory: disallow hugepages if the
 system-wide THP sysfs settings are disabled
To: Baolin Wang <baolin.wang@linux.alibaba.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, hughd@google.com, Liam.Howlett@oracle.com,
 npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com, ziy@nvidia.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <cover.1749109709.git.baolin.wang@linux.alibaba.com>
 <8eefb0809c598fadaa4a022634fba5689a4f3257.1749109709.git.baolin.wang@linux.alibaba.com>
 <1ec368c4-c4d8-41ea-b8a3-7d1fdb3ec358@redhat.com>
 <2ff65f37-efa9-4e96-9cdf-534d63ff154e@linux.alibaba.com>
 <953596b2-8749-493d-97eb-a5d8995d9ef8@redhat.com>
 <97a67b74-d473-455e-a05e-c85fe45da008@linux.alibaba.com>
 <b8fe659e-8a84-4328-b6d6-6116c616cb3d@redhat.com>
 <ce58b08c-0ac1-4ec2-8ff6-cf8e651709b0@lucifer.local>
 <201a1cc4-93fc-48e3-aeab-759ba8c8a47c@lucifer.local>
 <519c59e6-20ef-4edf-88b8-a71f38cbd2de@linux.alibaba.com>
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
In-Reply-To: <519c59e6-20ef-4edf-88b8-a71f38cbd2de@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12.06.25 16:13, Baolin Wang wrote:
> 
> 
> On 2025/6/12 21:29, Lorenzo Stoakes wrote:
>> On Thu, Jun 12, 2025 at 02:27:06PM +0100, Lorenzo Stoakes wrote:
>> [snip]
>>
>>> I propose a compromise as I rather like your 'exclude never' negation bit.
>>>
>>> So:
>>>
>>> /* Strictly mask requested anonymous orders according to sysfs settings. */
>>> static inline unsigned long __thp_mask_anon_orders(unsigned long vm_flags,
>>>                   unsigned long tva_flags, unsigned long orders)
>>> {
>>>           const unsigned long always = READ_ONCE(huge_anon_orders_always);
>>>           const unsigned long madvise = READ_ONCE(huge_anon_orders_madvise);
>>>           const unsigned long inherit = READ_ONCE(huge_anon_orders_inherit);;
>>> 	const unsigned long never = ~(always | madvise | inherit);
>>>           const bool inherit_enabled = hugepage_global_enabled();
>>>
>>> 	/* Disallow orders that are set to NEVER directly ... */
>>> 	orders &= ~never;
>>>
>>> 	/* ... or through inheritance (global == NEVER). */
>>> 	if (!inherit_enabled)
>>> 		orders &= ~inherit;
>>>
>>> 	/*
>>> 	 * Otherwise, we only enforce sysfs settings if asked. In addition,
>>> 	 * if the user sets a sysfs mode of madvise and if TVA_ENFORCE_SYSFS
>>> 	 * is not set, we don't bother checking whether the VMA has VM_HUGEPAGE
>>> 	 * set.
>>> 	 */
>>> 	if (!(tva_flags & TVA_ENFORCE_SYSFS))
>>> 		return orders;
>>>
>>> 	if (hugepage_global_always())
>>> 		return orders & (always | inherit);
>>>
>>> 	/* We already excluded never inherit above. */
>>> 	if (vm_flags & VM_HUGEPAGE)
>>> 		return orders & (always | madvise | inherit);
>>
>> Of course... I immediately made a mistake... swap these two statements around. I
>> thought it'd be 'neater' to do the first one first, but of course it means
>> madvise (rather than inherit) orders don't get selected.
>>
>> This WHOLE THING needs refactoring.
> 
> Personally, I think the 'exclude never' logic becomes more complicated.
> I made a simpler change without adding a new helper. What do you think?
> 
> static inline
> unsigned long thp_vma_allowable_orders(struct vm_area_struct *vma,
>                                          unsigned long vm_flags,
>                                          unsigned long tva_flags,
>                                          unsigned long orders)
> {
>           /* Optimization to check if required orders are enabled early. */
>           if (vma_is_anonymous(vma)) {
>                   unsigned long mask = READ_ONCE(huge_anon_orders_always);
>                   bool huge_enforce = !(tva_flags & TVA_ENFORCE_SYSFS);
>                   bool has_madvise =  vm_flags & VM_HUGEPAGE;
> 
>                   /*
>                    * if the user sets a sysfs mode of madvise and if
> TVA_ENFORCE_SYSFS
>                    * is not set, we don't bother checking whether the VMA
> has VM_HUGEPAGE
>                    * set.
>                    */
>                   if (huge_enforce || has_madvise)
>                           mask |= READ_ONCE(huge_anon_orders_madvise);
>                   if (hugepage_global_always() ||
>                       ((has_madvise || huge_enforce) &&
> hugepage_global_enabled()))

OMG is that ugly.

-- 
Cheers,

David / dhildenb

