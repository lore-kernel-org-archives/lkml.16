Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA59B19F461
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 16:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747930134; cv=none; b=qX9lCfgqBwkUY55GD/v9EGwnDGwUQ/xS8KiQWVyfQIftxS9fAJERNvWo9EVMJH1E8wY2PpldSQ6mXRch7mCp4CeMHDX+2t5WII2m2xLejkCNUD+rdo3B7+ZMeONYCn8wKEFVVJ8dUDM2m048Mlv7wRYD1JvQ2/FZy5r9wvIjyzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747930134; c=relaxed/simple;
	bh=upknVRtPW6fhsiHEEadWl7qR2XimAukV6+7c11bLywI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n+mjJcfHH0Gwvaep5R6HTRqsb21HJWF4meZ0fxMwMWWoghmzIHxCOvj1EUbCOWQ9x+1q9giq7vL4pX2WpwD9Q9dAQcFUcTTekhosQp0PwhNfQpY/tiY8CBODfpNPiLc8qpNXg66QBs5ebk+url0pEfKezNMh2pCYOXbJHYTIbFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VfQM417R; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VfQM417R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747930131;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=8wfJZ2JWWh5NDCT76p5yfUNfJs0TBciywsBKTnLT2wg=;
	b=VfQM417RuM8Yk/isGued7pxJLZ1bXzpM6HmyAGz2mZ5fAxpcKESLgNxtYNVWBlLWuKaDJO
	Koo0sP+p3IJvP/yoG5U3egU4vjS8OJwhjZbh+jrPGFJ0lUjyIA+hwmKW33FGztgjrXvNOw
	3ZKGONv+wTJtkLMczf5yHCTfLAskLjU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-5--wfS-LR5Nf-Dcw8vWvNbnw-1; Thu, 22 May 2025 12:08:50 -0400
X-MC-Unique: -wfS-LR5Nf-Dcw8vWvNbnw-1
X-Mimecast-MFC-AGG-ID: -wfS-LR5Nf-Dcw8vWvNbnw_1747930129
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a367b3bc13so2569941f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 09:08:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747930129; x=1748534929;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8wfJZ2JWWh5NDCT76p5yfUNfJs0TBciywsBKTnLT2wg=;
        b=CXWMYkaPr7P2cYIxG8Vofj1fIu9w/u5+Kkp6PyLIvruNiDu87gPyBKMGTx8n+lA00C
         2rzGYwPBnq9VrNXSlVc3t+jNENmfvm0pAgP6Jn9JgHREZFhmiNzuZ27f7mC/DzyQmOza
         j7CCFTLFh+GC102kxu7IiBYsRUysICtZqOht/7sCB13oSnowim9Jchj8A4YX1416Ie6J
         Z37ELYowQdJvjPhaEZYqDvG7t0yaUkGIglBvHNqkpzEtIET/1F/q3bEVTyupB0+mzPSC
         IsZocFgVlZjVsAoDZNm3p5socaX7FmxcUBhUmjAkq6xRoy5MKXTbWsnUb5+FVMYynill
         gd5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXaY8/9e6gtpCdhr3zBceukAsEYYZHSmqneklcLibabYrRbUbSBs+wr5hF2cS8Seh0/OJw64vPctSBYiJU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1vPfJBtN5jlH10as1LQW0B403agufuNCo7uJ7upfbhpjkncFc
	gOUO71oDbFNCD/caXjNaIoAjVrlKMeihikRtDOXyWWY8F4bF+CKLzWSLZCcDHD0nslTQlELX4Oj
	CoSubqM/XklC48qNOqurGeRMSW+yl0kPM9XzsXlQXg8d5PmW3N9cgw2wUQ8fReJNb3g==
X-Gm-Gg: ASbGnctKv+kpEe+MxEt2V7MvcSs4GQrNaCCb/bacDw2/XUtN56qieqLbqr9YGsLi6Ac
	Qh4HeMVBNdmDQndbZeMECG1mGA+mnukT8YIb9Js7UnumhqeqDaI7z7ZQNBL0xh4wU8jVJNVTgAB
	HJmq49Fxk8zG2nATROWWgFEwJn6A1K96zLocnTRL6xDAw+VperddzngevyxnoRhKDMkrIpVURZR
	LUzs8cBGnqIDABMJBmP5+SviyeoAU/Z29gCJLTBE4PR8fWShjWQCy6O3KCssD+5cSyL5HeoLImt
	EUUvmSq+JBF7WFZqcOVvxudENgji8Zqi07GFUH2PgG78kQK0GlJ/TTjdiPx4oNC8lIBdqnZjN7z
	8G28XBgBHdVc6qBUIhpjkXMeHz3xoC6oozyaPxHQ=
X-Received: by 2002:a5d:5848:0:b0:3a1:f5c4:b81b with SMTP id ffacd0b85a97d-3a35c83915fmr21963191f8f.23.1747930128717;
        Thu, 22 May 2025 09:08:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESFdDFUXfb74tU7eLRPfNqn07FTE15x+guhR8GM6NgEr4TYOMtIVgXHeIhy1DRApmqlBJW2Q==
X-Received: by 2002:a5d:5848:0:b0:3a1:f5c4:b81b with SMTP id ffacd0b85a97d-3a35c83915fmr21963125f8f.23.1747930128211;
        Thu, 22 May 2025 09:08:48 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f22:2e00:6e71:238a:de9f:e396? (p200300d82f222e006e71238ade9fe396.dip0.t-ipconnect.de. [2003:d8:2f22:2e00:6e71:238a:de9f:e396])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca8896dsm23406352f8f.73.2025.05.22.09.08.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 09:08:47 -0700 (PDT)
Message-ID: <3360625b-2f95-45d8-8aa2-a7c5a4811786@redhat.com>
Date: Thu, 22 May 2025 18:08:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v0 1/2] migrate: implement
 migrate_misplaced_folio_batch
To: Gregory Price <gourry@gourry.net>
Cc: Bharata B Rao <bharata@amd.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Jonathan.Cameron@huawei.com, dave.hansen@intel.com,
 hannes@cmpxchg.org, mgorman@techsingularity.net, mingo@redhat.com,
 peterz@infradead.org, raghavendra.kt@amd.com, riel@surriel.com,
 rientjes@google.com, sj@kernel.org, weixugc@google.com, willy@infradead.org,
 ying.huang@linux.alibaba.com, ziy@nvidia.com, dave@stgolabs.net,
 nifan.cxl@gmail.com, joshua.hahnjy@gmail.com, xuezhengchu@huawei.com,
 yiannis@zptcorp.com, akpm@linux-foundation.org
References: <20250521080238.209678-1-bharata@amd.com>
 <20250521080238.209678-2-bharata@amd.com>
 <15744682-72ea-472f-9af1-50c3494c0b78@redhat.com>
 <aC9KuC1UbJYd2Q3i@gourry-fedora-PF4VCD3F>
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
In-Reply-To: <aC9KuC1UbJYd2Q3i@gourry-fedora-PF4VCD3F>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22.05.25 18:03, Gregory Price wrote:
> On Thu, May 22, 2025 at 05:59:01PM +0200, David Hildenbrand wrote:
>>> +int migrate_misplaced_folio_batch(struct list_head *folio_list, int node)
>>
>> "migrate_misplaced_folios" ?
>>
>> :)
> 
> something something brevity is the soul of wit
> 
> I think i went with _batch to match surrounding code (been a while since
> I wrote this), but I don't have strong feelings either way.

I think we have migrate_pages_batch() and migrate_pages_sync() because 
... they are called from migrate_pages() :)

For something that "simply" calls migrate_pages() right now, probably we 
should just call migrate_folios().

But maybe you were referring to yet another set of "_batch" functions.

-- 
Cheers,

David / dhildenb

