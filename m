Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9505A1C860C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 07:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749194909; cv=none; b=Y8mgxSSCKbJUF6N+IKV0ttgrd0xQgtO5X9KFgaXisGACrthHK3X56y/543Jo5GDbVhOCWKW3LdheSuVnfQRoaWJKIdEZlh33/Gy5givK3K/kpaSX7o5f153p/NZ5XeG+ApLrueyqOAWvZ9JmtzkWkIg0DAORAkdG9j9np3l4OG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749194909; c=relaxed/simple;
	bh=iaYxD+iI4naXYVHj7zQRNz0DVMwoDBG2LlbzruSW9qw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J/zLOE9OpqotAU1W2/9bEmi5SZJaGHQnRFbS9L2LhKBSePAg8WR11AM4BF1lGLhbx9xlX/AsxlHc4YBSk9tEFKgpLqTWW/O/WnVrt4C1i5HhuPp9UOzLT8L6Kq0vUUw3eFBQtK6JlhZkDml7nC/6SinjmIjmXtfd6+iy5EpwX14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hUzNUmPw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hUzNUmPw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749194906;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=MzU6QKfO94usyKULdWmvLb6fqSscWED5D9l6Eb/I+FQ=;
	b=hUzNUmPwdVUPQEQxyxeznTxyr+3aBR3gLQ+A26XCT9SY6EM8sq3pZY8CwNyPfuQjzwEZkH
	po2LyMbkzdD38oP7YpucENwrK+WVgMJUE+9H1lWZf8M1psuBtWRxcjbVX86QKQAjFZVi9U
	FeIW1Itq5DQFf0QZvy4gzbMpBbJTvP8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-613-T2UlViLmOEu6H1To9Y_48g-1; Fri, 06 Jun 2025 03:28:23 -0400
X-MC-Unique: T2UlViLmOEu6H1To9Y_48g-1
X-Mimecast-MFC-AGG-ID: T2UlViLmOEu6H1To9Y_48g_1749194903
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a4eeed54c2so1132475f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 00:28:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749194903; x=1749799703;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MzU6QKfO94usyKULdWmvLb6fqSscWED5D9l6Eb/I+FQ=;
        b=dY1bGBKCu4027biIWhsEcyrQWoCvDIDufpbKx5VSVL9waYJS41ABTFFKEqLGhdsQok
         qu3BoXZweXsSQUq9b81rb1i8AskTxfKZ8vMqJE/husTDrsawpUY5r6UatS5oewg1waLL
         y26ZDXbBX2c3WraHWlfar7DOn8rTKkvY3yRi3U4PX3DfZUcokFLnpGOlkLFumTZVk5RU
         r492RfrWxuLeRAtk9A9s8X1kQdlBAplJcBvlDBZDg14Nfn36iG+L7oCwZcgT3yrL/Fjf
         HF3+e3IQLQJ+y9zwsJpvC54ZRP9Xd8yMAaMsJbgWOhC9YpKToHr8krrr2rzfcDHsPQnU
         CnBw==
X-Forwarded-Encrypted: i=1; AJvYcCVh4BjFt6NU26Ot9nAWXSkJ8eF/m8vUWGD6ZfKnpn0nYP9IQGj2gpEyQxk0+/hQ61xJihzBqvL2dCbc31E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb0keucgK/FopxzDk/oyRHIMchx8hME5t04sJxzza9CMUUzvIE
	7p//rK3FagSQnaFk4jKvmflBRZAFkqYSR6rMTBHwiQzVQbXJDQDnVfed3r+uAWQZd4IlyNQm7xb
	Q7G5Z+1E1hOlThXGW1g6NMqYlYc8A+Iiq67cmiqQOgpf4TO7w4lr+X5aQIZgKx2Qzug==
X-Gm-Gg: ASbGncsezfFiiOyQIPi7wW2hsF1YvGGkJdqzunGvZ1fUmcQgEdCC8T+cQzERSwohSu0
	hrHu4qbZnDtlJ+PYNETlESHtK1Ur0ZoPFmo2eD3APFiUgJri+rCxTJx3AABakJbiwojB+airZLp
	uhMIPXEoTWFocB8djHBDdQ2AegPIO0BUZMz5Xs/ZsVqeh8v3MUC+hRCsYz5M3tQn6yxtIq1tr3U
	gbmSLe0OoL4+wHN0byddI5ZhwTcWp2VW1ZIpeGKX90GiUbJ2wPHDuXgwxo8E9VbcUpPSx0KT016
	dzeeuqAD0V6YJfLEr5HyWZl0wb2ZTeqe9wtXehD1A489RRKFbAKvMA==
X-Received: by 2002:a05:6000:250d:b0:3a4:f912:862b with SMTP id ffacd0b85a97d-3a5318a0627mr2178103f8f.33.1749194902696;
        Fri, 06 Jun 2025 00:28:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFaLWomZETgDCELZygyLcC/ojJCXhsOZyZJnL/gBwDuRpfKNSX2ofIkG8V68GPZaYh+LOJmwQ==
X-Received: by 2002:a05:6000:250d:b0:3a4:f912:862b with SMTP id ffacd0b85a97d-3a5318a0627mr2178057f8f.33.1749194902217;
        Fri, 06 Jun 2025 00:28:22 -0700 (PDT)
Received: from [192.168.3.141] (p57a1a6a5.dip0.t-ipconnect.de. [87.161.166.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244d15asm1098905f8f.66.2025.06.06.00.28.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 00:28:21 -0700 (PDT)
Message-ID: <371ac1ce-8f14-4914-94f5-6e6b46a486fb@redhat.com>
Date: Fri, 6 Jun 2025 09:28:20 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/2] mm/huge_memory: don't mark refcounted pages
 special in vmf_insert_folio_*()
To: Dan Williams <dan.j.williams@intel.com>, linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, nvdimm@lists.linux.dev, linux-cxl@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Alistair Popple <apopple@nvidia.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>
References: <20250603211634.2925015-1-david@redhat.com>
 <68422c7a3a2c2_2491100fe@dwillia2-xfh.jf.intel.com.notmuch>
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
In-Reply-To: <68422c7a3a2c2_2491100fe@dwillia2-xfh.jf.intel.com.notmuch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Dan,

On 06.06.25 01:47, Dan Williams wrote:
> David Hildenbrand wrote:
>> Based on Linus' master.
>>
>> While working on improving vm_normal_page() and friends, I stumbled
>> over this issues: refcounted "normal" pages must not be marked
>> using pmd_special() / pud_special().
>>
>> Fortunately, so far there doesn't seem to be serious damage.
>>
>> This is only compile-tested so far. Still looking for an easy way to test
>> PMD/PUD mappings with DAX. Any tests I can easily run?
> 
> The way I test this I would not classify as "easy", it is a bit of a pain
> to setup, but it is passing here:

I guess most of the instructions are in

https://github.com/pmem/ndctl

?

I would assume that we need to set aside some special dax area using 
early boot params (memmap=).

Might come in handy in the future.

> 
> [root@host ndctl]# meson test -C build --suite ndctl:dax
> ninja: Entering directory `/root/git/ndctl/build'
> [168/168] Linking target cxl/cxl
>   1/13 ndctl:dax / daxdev-errors.sh          OK              14.30s
>   2/13 ndctl:dax / multi-dax.sh              OK               2.89s
>   3/13 ndctl:dax / sub-section.sh            OK               8.40s
>   4/13 ndctl:dax / dax-dev                   OK               0.06s
>   5/13 ndctl:dax / dax-ext4.sh               OK              20.53s
>   6/13 ndctl:dax / dax-xfs.sh                OK              20.34s
>   7/13 ndctl:dax / device-dax                OK              11.67s
>   8/13 ndctl:dax / revoke-devmem             OK               0.25s
>   9/13 ndctl:dax / device-dax-fio.sh         OK              34.02s
> 10/13 ndctl:dax / daxctl-devices.sh         OK               3.44s
> 11/13 ndctl:dax / daxctl-create.sh          SKIP             0.32s   exit status 77
> 12/13 ndctl:dax / dm.sh                     OK               1.33s
> 13/13 ndctl:dax / mmap.sh                   OK              85.12s
> 
> ...ignore the SKIP, that seems to be caused by an acpi-einj regression.

Thanks for running these tests!

> 
> However, how about not duplicating the internals of insert_pfn_p[mu]d()
> with something like the below. Either way you can add:

I considered that, but I prefer the current end result where we cleanup 
the pmd_none() handling and not mess with folios and pfns at the same time.

... just like we do for insert_pfn() vs. insert_page(), I don't think 
these code paths should be unified.

(we should do more sanity checks like validate_page_before_insert() 
etc., but that's something for another day :) )


> 
> Tested-by: Dan Williams <dan.j.williams@intel.com>
> Reviewed-by: Dan Williams <dan.j.williams@intel.com>

Thanks!


Let me resend with the fixup squashed.

-- 
Cheers,

David / dhildenb

