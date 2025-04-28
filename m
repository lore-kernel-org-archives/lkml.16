Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79A21CBEB9
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 20:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745871832; cv=none; b=mJV1KdrMIjEFr2A6DZhjccH+tbovEZxdqgc3X3aZbMEJhATJkhClzgo1iDsP7YDLbdJeRm2BF1DcCbokjntKnG3z5A3uQrlhZx/o61zYSff9Wym+xx1TjfrC5IhoWa1C4j9yhTfVD8Uw6GSwGryKdkhNhF8ZCQjSVPFmpdsTies=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745871832; c=relaxed/simple;
	bh=Xog45FFHV/nIK9JPmpyMtJwnzEAovikL2LM1ENc3SzQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ko0WvEuQuahYFzgsFUKINVKOg8fp43ZuL/APng3h+GVZ8xQ6hNlOe3RClaQFjxT8VD0bCLTaTwBm79uWWyCO4P/qvk8O8qZeKoxnBSqz6ly47yrcoI7aVTDUoBP+FGlV+HMK2K3DYT0Ntsa2AYhVRm3KSPET+iJp14GVKSby1/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EWAP7Y0M; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EWAP7Y0M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745871829;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=rkEtrqEhBS4XY4MnxLuPuVZCrKNUqZ8c+beG4mFgbns=;
	b=EWAP7Y0MvkoWiCtXl1VUAnRt8w3JGhLIwujRZnBGSz4AJ+GskqX3PKK5cyFNpFKTT7wGnm
	hzZ+2KmyAs6JztNQFR5imJgmUNe+69nHHYBkMaTN1E9wZryIN5H1y9b7gYXjxTGmw/v5y7
	+8JMNBsWPkbeZLt7B+/MhGz651FqqW4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-654-xohIQT6fNoaG8xU0HBmtWg-1; Mon, 28 Apr 2025 16:23:46 -0400
X-MC-Unique: xohIQT6fNoaG8xU0HBmtWg-1
X-Mimecast-MFC-AGG-ID: xohIQT6fNoaG8xU0HBmtWg_1745871825
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a08a1c0fc5so109128f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 13:23:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745871825; x=1746476625;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rkEtrqEhBS4XY4MnxLuPuVZCrKNUqZ8c+beG4mFgbns=;
        b=Vd01Pa6I3Zv913UVUtH9utj26UjzHs7i2UE7U2kWMlr6d7nXmMTbvxuFrTO5F4tAym
         k/YTvb3X6KkZrauutLvj6nja3vfQl7MAMWfAUT8BCWRS0K5tX6xTsDJaoYV27eZ//5tk
         BhOL14KyNJn3p5q1lINXCwT602cWipK9v5lgeuSDJhM+q4yBmtHfUSxYPCnlo8jBlWFF
         TdAJV1J4CXYDeZ7XdLth7IgkDSxlU2sFFNZS1xVvywhBnZXLKHSTLMM9n7FHISGOAJXp
         ddlBizctkpEHTMAhTVKXexr8HvjUGGI/Iclid6rDBO+xHRPugy0FCf1KAaLDl0ZvB3Mw
         lE/w==
X-Forwarded-Encrypted: i=1; AJvYcCUOPxg3CE7Kp/6fLY69P1aAW1RjH7TGeHWUrN7zLJ7yM8a6XidtNurKWLZyJoUGp2fJX4up3I+mzvFOInY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwuCs8PbCjh6DSLSzbDAziu62B9JW9l/EIkfqF/n7D26FKZxSU
	R42vg3P6GVyEURHdfum3iduAUHI/hfnhc4AERAaB9K88sy03W+hzgPLsn6wvfvJtw4UFDCU3Ozw
	KVxa+G6OO7flY+tdk5XEeW91iytrUcjj0lqSSHFb+CqqCCobz1foadyPvE6+KvA==
X-Gm-Gg: ASbGncvWHiTghXtUHP08C3d79HLYV3zWdPudQ3JvN3W11zzvZU/bs1PDNePe0crYzLF
	j0b5y6pPmjeag0bS+5u1eTNsPWEAT+L/+FSe30dMh0RHgRpE6G2alNkF+6iSjuJbP5TyG3HKplE
	SxqL5BCRr/p/t8hDT7GsMe6JcV0XzVEYdE6ygjveBMOfzrheG0OLG5v0PAiamv1JtR57mgRweFp
	tttPoJ9E9xC1WgoG+DSLRvLAwYDYYQNdPXeC+T8yeQdzY+n6RuB6rqe44pdLzYNWqIfLtNqfwk/
	EeN3ssS8vbsOnpMrS/is2IcbeScVT9R9nCJj9ngXOb+qwqg0YsYImE6jmMFJhrYDaI744cmVyJX
	UgzwCO8EhrALMjTp+Gf5LJ61DgIeTJoCc3RQ8hYo=
X-Received: by 2002:a05:6000:b4e:b0:39e:cc5e:147 with SMTP id ffacd0b85a97d-3a0894a1aa8mr941295f8f.55.1745871825194;
        Mon, 28 Apr 2025 13:23:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHi9BeKEw90HGojYH0uYj++rRWoQl9Ep0UCTEuLPP1j3Ci9jqWDeYDWhMBAhQ1IJFvMvOz7CA==
X-Received: by 2002:a05:6000:b4e:b0:39e:cc5e:147 with SMTP id ffacd0b85a97d-3a0894a1aa8mr941276f8f.55.1745871824797;
        Mon, 28 Apr 2025 13:23:44 -0700 (PDT)
Received: from ?IPV6:2003:cb:c72f:ea00:2f00:e7e5:8875:a0ea? (p200300cbc72fea002f00e7e58875a0ea.dip0.t-ipconnect.de. [2003:cb:c72f:ea00:2f00:e7e5:8875:a0ea])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073cbf04dsm12236556f8f.52.2025.04.28.13.23.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 13:23:44 -0700 (PDT)
Message-ID: <bd8ce421-cf2a-451b-a3eb-613e6856bb9e@redhat.com>
Date: Mon, 28 Apr 2025 22:23:42 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 05/11] mm: convert VM_PFNMAP tracking to pfnmap_track()
 + pfnmap_untrack()
To: Suren Baghdasaryan <surenb@google.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Peter Xu <peterx@redhat.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, x86@kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski
 <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrew Morton <akpm@linux-foundation.org>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>
References: <20250425081715.1341199-1-david@redhat.com>
 <20250425081715.1341199-6-david@redhat.com> <aAvvQ1h9bg11hiqI@x1.local>
 <bbadf008-9ffc-4628-9809-2d8cf104a424@redhat.com> <aA-n9hvSX9JLsRM-@x1.local>
 <7a26e29c-d889-450a-a5e1-ce671f09e4c8@redhat.com> <aA-rtji7ujQgckbM@x1.local>
 <884fab29-e16a-4663-8e33-885bc70ca2f7@redhat.com>
 <f08118b3-0736-4a5d-b780-8e3d88f45c02@lucifer.local>
 <CAJuCfpEtnBrAkSV-6PDv4Au5gs02vWYeMNHo3OxZb8NB0sy8cw@mail.gmail.com>
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
In-Reply-To: <CAJuCfpEtnBrAkSV-6PDv4Au5gs02vWYeMNHo3OxZb8NB0sy8cw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 28.04.25 21:57, Suren Baghdasaryan wrote:
> On Mon, Apr 28, 2025 at 12:37 PM Lorenzo Stoakes
> <lorenzo.stoakes@oracle.com> wrote:
>>
>> On Mon, Apr 28, 2025 at 07:23:18PM +0200, David Hildenbrand wrote:
>>> On 28.04.25 18:24, Peter Xu wrote:
>>>> On Mon, Apr 28, 2025 at 06:16:21PM +0200, David Hildenbrand wrote:
>>>>>> Probably due to what config you have.  E.g., when I'm looking mine it's
>>>>>> much bigger and already consuming 256B, but it's because I enabled more
>>>>>> things (userfaultfd, lockdep, etc.).
>>>>>
>>>>> Note that I enabled everything that you would expect on a production system
>>>>> (incld. userfaultfd, mempolicy, per-vma locks), so I didn't enable lockep.
>>>>
>>>> I still doubt whether you at least enabled userfaultfd, e.g., your previous
>>>> paste has:
>>>>
>>>>     struct vm_userfaultfd_ctx  vm_userfaultfd_ctx;   /*   176     0 */
>>>>
>>>> Not something that matters.. but just in case you didn't use the expected
>>>> config file you wanted to use..
>>>
>>> You're absolutely right. I only briefly rechecked for this purpose here on
>>> my notebook, and only looked for the existence of members, not expecting
>>> that we have confusing stuff like vm_userfaultfd_ctx.
>>>
>>> I checked again and the size stays at 192 with allyesconfig and then
>>> disabling debug options.
>>
>> I think a reasonable case is everything on, except CONFIG_DEBUG_LOCK_ALLOC and I
>> don't care about nommu.
> 
> I think it's safe to assume that production systems would disable
> lockdep due to the performance overhead. At least that's what we do on
> Android - enable it on development branches but disable in production.

Right, and "struct lockdep_map" is ... significantly larger than 8 
bytes. With that enabled, one is already paying for extra VMA space ...

-- 
Cheers,

David / dhildenb

