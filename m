Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB1412D1F1
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 19:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743793650; cv=none; b=ZWf/2v4+1bUvL+1ilCDnCg2tjDsywGVvhL9r3rvG1BdnXrW2slDhr5ABBXOxs2qupzPvMjnzcdNxuntz+0VinG1EDiXAw1LHZD/RjuhD1RA9BfYf5AKy9ssjTjGfsbBgoftxyvM5E3XlOGeyGV8siFnXsLfaiNqPqIp3VUmjKMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743793650; c=relaxed/simple;
	bh=yNZ0kchyaMHKOOSattO/R7rZ6yp8sSzvuJYRWNSMaJU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gvNJ1BM6TfbpX3tIRZ9mn7QLaPG0tyIENRqgQteedwpek7tJO+BpiZPUSpj51o3ojOT9sB5w0qHQp/hQrcrSXNpuRqyskPpLLw3WLVY5MSgOSUCitlU8fnnoZmP8HMQvke4pJolcWji6ru141e3pzyI2p6BHXwiC0T6Gmf5K9Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LIiJvuoW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LIiJvuoW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743793647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=j8cUxrNy3Rx78apksYsfaPzukZTCMHhoyKdomVK2V/w=;
	b=LIiJvuoWQloWEGM0gFKxv0QLVPXsikHrdSThOFnKAmvk2CbPuwDZRxMZK6LA4D0weOUYSd
	jOcqwh9SkO6COnU7joTpR1SXwXotmDeun0+Vy+4GhR/gDW+lyaHOcvGlkYiQ9i2eBP1MoH
	Dz0BcIBbOM0d2TgWx5wLN2htwIU1hB4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-417-fRwbJk0jPVmKBEJyUDMw1Q-1; Fri, 04 Apr 2025 15:07:26 -0400
X-MC-Unique: fRwbJk0jPVmKBEJyUDMw1Q-1
X-Mimecast-MFC-AGG-ID: fRwbJk0jPVmKBEJyUDMw1Q_1743793645
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43ced8c2eb7so18599205e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 12:07:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743793645; x=1744398445;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=j8cUxrNy3Rx78apksYsfaPzukZTCMHhoyKdomVK2V/w=;
        b=E0d5Rn9pSeqaYBOJ/10slIvegmGeQNPlrJNYVPGBpOayZafpkl5bqAWgupwlA27cVt
         qa4qi1izCwHSPv6j8nPYxHp/BmyOMQMD8PpL4Bxw7fgCaOYjnzXCGmEdU58fUO/oXGB3
         fa5tUbyXDJEJo86ITyMx0/e8cZlUmL57c55pqqff27fEFhKkG5JySj2HI7mO8EsUYL5D
         bNw9gOBFnX9R87K8uocBRaON2hH1V5/vVTRwmVS4zO8xOhZ71xP7WrF4M2cJr5hrUxOW
         RoY98ahYu8uQvLdl0o6kBep1o+reDWhnGpPqCmd6FathyIJ72zIYKdqZu65hF9zkrwLN
         WhbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrZ/vs+AQHTK2ZBVFnqh0n22FK4PiAMTWXfflriIAuFnX0fXhGyglozgy+OcRWBTnW7B4Q3gL2kCVIzFs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfId9WIWEVK1An0ofRhr+EWZhzGCu6pNcdzqpJ2jSFA24KQ2XW
	RD3ffW+iaeqWkCe/Hneo+UjTfSkhOvov55ouRAgFa6AThpiQIZlL5WBXO6di125iQKJrCUjSQTT
	RVQ3+aWJc6WA0fqnqZ6yyePVDdKAmr8wEHwLtarYa0F+pFmo1nAEuuxWGfwpDRA==
X-Gm-Gg: ASbGnctl0Yo3xEFuxFTIkEdq2p9VC4aUkZ9kPGy6/EV7Tz4Me6Ndg/qX2/zKWYbrVpE
	k11nhyr8V5fGP91z9u/q9QGAdowvCCEUG1uHGL4FexIU7ZL+Lu7ar0DEtaGJ2IWPUoRdfzT7+2h
	Qhgx2X6Q1DfOM3eLn+hc7CobOSZRpBji7oQpRGL4XOs22lHoxP0zkxfQt9QmvKY3V7EHxmbhYxL
	tXgD9+mWkBFub1AF5i0CP6BeQxb3QKfZGL/y2Thy+GJ6ewem7bu/oaR0jzY2oLK5mrwam+96qW7
	L4h+tYO9ddS9TX44jNfnyfezl/ool65mVb1T1lTRwSKHhvG/rWh7kJ42plTuarOWix5bp9KaZT8
	jIXNZc6DMSkarnMNjpvlYkw21btXd0JLZKgMLEVgMWtM=
X-Received: by 2002:a05:600c:4e0e:b0:43c:fda5:41e9 with SMTP id 5b1f17b1804b1-43ed0da5960mr46146485e9.31.1743793644978;
        Fri, 04 Apr 2025 12:07:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVehbx7IFxxmOzORDp8jOyzXkdBMOGm6/NyyN+Ynqnfen8uNBrBfGp93vakeFTUGGd99VRcg==
X-Received: by 2002:a05:600c:4e0e:b0:43c:fda5:41e9 with SMTP id 5b1f17b1804b1-43ed0da5960mr46146285e9.31.1743793644625;
        Fri, 04 Apr 2025 12:07:24 -0700 (PDT)
Received: from ?IPV6:2003:cb:c71b:7900:8752:fae3:f9c9:a07e? (p200300cbc71b79008752fae3f9c9a07e.dip0.t-ipconnect.de. [2003:cb:c71b:7900:8752:fae3:f9c9:a07e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec366aa29sm53303815e9.39.2025.04.04.12.07.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 12:07:24 -0700 (PDT)
Message-ID: <427f683b-ac68-4820-b264-4016b34df592@redhat.com>
Date: Fri, 4 Apr 2025 21:07:23 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] docs: update THP admin guide about non-tmpfs
 filesystem support
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: "Pankaj Raghav (Samsung)" <kernel@pankajraghav.com>,
 Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, willy@infradead.org, linux-mm@kvack.org,
 Bagas Sanjaya <bagasdotme@gmail.com>, da.gomez@kernel.org,
 gost.dev@samsung.com, linux-doc@vger.kernel.org,
 Pankaj Raghav <p.raghav@samsung.com>
References: <20250404140657.29285-1-kernel@pankajraghav.com>
 <Z-_7fzU02OU1hVOT@bombadil.infradead.org>
 <09c13770-4d62-430a-827d-6ad35411d18c@redhat.com>
 <Z_Ad0MsSAuAGevgm@bombadil.infradead.org>
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
In-Reply-To: <Z_Ad0MsSAuAGevgm@bombadil.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04.04.25 19:58, Luis Chamberlain wrote:
> On Fri, Apr 04, 2025 at 06:18:12PM +0200, David Hildenbrand wrote:
>> On 04.04.25 17:32, Luis Chamberlain wrote:
>>> On Fri, Apr 04, 2025 at 04:06:57PM +0200, Pankaj Raghav (Samsung) wrote:
>>>> From: Pankaj Raghav <p.raghav@samsung.com>
>>>>
>>>> THP support for non-tmpfs filesystem has been around for some time now.
>>>> Update the admin guide to reflect it.
>>>>
>>>> While we are at it, move FilePmdMapped to previous paragraph for clarity,
>>>> and clarify ShmemPmdMapped & ShmemHugePage.
>>>>
>>>> Signed-off-by: Pankaj Raghav <p.raghav@samsung.com>
>>>> Acked-by: David Hildenbrand <david@redhat.com>
>>>> ---
>>>>
>>>> Changes since v2:
>>>> - Address comment from Bagas Sanjaya
>>>> - Squash commits and Ack from David
>>>>
>>>>    Documentation/admin-guide/mm/transhuge.rst | 22 +++++++++++++++-------
>>>>    1 file changed, 15 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git a/Documentation/admin-guide/mm/transhuge.rst b/Documentation/admin-guide/mm/transhuge.rst
>>>> index dff8d5985f0f..f8aae64e38d0 100644
>>>> --- a/Documentation/admin-guide/mm/transhuge.rst
>>>> +++ b/Documentation/admin-guide/mm/transhuge.rst
>>>> @@ -12,8 +12,8 @@ using huge pages for the backing of virtual memory with huge pages
>>>>    that supports the automatic promotion and demotion of page sizes and
>>>>    without the shortcomings of hugetlbfs.
>>>> -Currently THP only works for anonymous memory mappings and tmpfs/shmem.
>>>> -But in the future it can expand to other filesystems.
>>>> +Currently, THP only works for anonymous memory mappings, tmpfs/shmem and
>>>> +filesystems that support large folios.
>>>
>>> That seems to allude that THP can be supported on filesystems
>>> that suppor large folios. I don't think we want to call that THP
>>> and that can confuse folks. Leaving "currently" also seems to
>>> indicate that there is more work to be done for THP for filesystems
>>> but that's not true as well. So how about something like:
>>>
>>> THP only works for anonymous memory mappings, and the tmpfs/shmem is the only
>>> filesystem to support it. The alternative to THP for other filesystems is to
>>> support large folios and with it you can end up using huge pages
>>
>> That makes things more complicated without a good reason.
>>
>> See CONFIG_READ_ONLY_THP_FOR_FS as an early usage of the term "THP" for
>> stuff we have in the pagecache.
> 
> OK.
> 
>> (with large folios we now properly implement
>> this concept, and support more than only PMD size)
> 
> Do we really want to call large folio support on filesystems THP?

Good question.

"folio" is just the metadata we currently use to manage a chunk of 
memory, and a "large folio" is one that spans more than a single page -- 
huge page, large page, super page, ... in the past the metadata for that 
used to be a complicated piece of "compound page". In the future, we 
might call it differently (struct file_mem ?), who knows.

So "large folio" support in a fs allows for the usage of these larger 
chunks of memory (huge pages).


The filesystem tries to transparently make use of huge pages (of various 
sizes); in contrast to hugetlb, that is "transparent" in a way that 
these can be split, partially mapped, partially truncated -- just like 
for anon or shmem.

(Well, the "transparent" part was never really 100% true, but that's a 
different story)

I see more similarity with THP than with hugetlb in that sense.

In the end I don't think the terminology matters that much -- note that 
we are talking about an admin guide that resides in transhuge.rst -- as 
long as people don't confuse it with "ordinary" huge pages as in 
hugetlb. "file huge page" is rather misleading.

I'd be curious in which sense these file thingies are different than 
what we have for anon/shmem/... except that some toggles don't apply to 
them and the pagecache mostly "more transparently" makes use of them. 
(which makes them even more transparent? ;) )

-- 
Cheers,

David / dhildenb

