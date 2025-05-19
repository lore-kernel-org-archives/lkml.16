Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1901DEFD9
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 18:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747677869; cv=none; b=fGamBwQ9ikUEPdP0AWU2yLoZ0rp3yIjfm2tuNYsON4QUPqafDw5GBM02/d3WAeAJHg7JFXTxK9boNG/aNZLbpMdOc30dy1NZaH74DwhElHXiwVJXIJ53cHX2dl08sF0YtiF3lL7d0j7uzc/UkyWADJ7TI+yI/vvQrzoMkePnhV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747677869; c=relaxed/simple;
	bh=zo8+/r1dolubNS9VK5Z/jU0dVzT1dnbZmTG0syHsfqQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Xr9Rx/oA52JrJK/1qQJlBsPoCbWrG8F0OBI8DSIw+CPXbiLCKu3xDHX66/qCBWWQu4gY5UP9bqQ6sn/MAAnRrVhu62rWh82BMx3p8OfLDP6XUfJOAIrjSrW3OaiSIc3WEU05BhuBBAJXHmFKwrGYyqfZ4BsYP0MZBRB3YXK+3z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QShakyjK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QShakyjK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747677867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Ylxl7a4tP8gYAwM6KLUB1+rIzOrluynBjKOFtEAvyJk=;
	b=QShakyjKiMnvkYScOISCTlMBg46XH9wZCoNYo+T8uAXtiv/8lyre7hYy9WU5lUSF+ypF6c
	QP0tHfncCnGWklHVo31Jxy0kmVNQsdHoNifTw3T/30HQU5hN0vfScdUd5SldiS2EoPQJlt
	gsPBhAPE6TPbjPHveM9lffF19mkEeJI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-mnb2Wlq8P4e4M2MsULkcKA-1; Mon, 19 May 2025 14:04:25 -0400
X-MC-Unique: mnb2Wlq8P4e4M2MsULkcKA-1
X-Mimecast-MFC-AGG-ID: mnb2Wlq8P4e4M2MsULkcKA_1747677864
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-442d472cf7fso38034815e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 11:04:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747677864; x=1748282664;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ylxl7a4tP8gYAwM6KLUB1+rIzOrluynBjKOFtEAvyJk=;
        b=HAmNARIJMDrsJaWip4SJ2ua3z5kD0R6+iApGGmTa6WkPl81R9QHlfFZ2BxI29HAC4b
         XDm3QRf832p5UNHeYrK2sYtlwa+CU5eZD1Fog/RJGNnySE0P9K0zgGwS8iHJZvZlqsY+
         R7/e+XHTf2b0czg8KaqlCWWRjBdFg8MFijC7aAZLhxf8ZxXUVl9QKIsWWFED/FDrgDIo
         O000tBGg//dMJ2ld5aDLR0krDL2suFWo5yR/nP/u8ykCqVYEmSzIyv7nny/F5XJIO1hN
         eQakbDatgNNGE8YaIEIITx4ilhi2UKeEdCa+tcusqYqxIban8V9U5QjwScdb2j8la7mh
         mtcg==
X-Forwarded-Encrypted: i=1; AJvYcCXUdGCacCCFSkQrD8ND6MeoYR+pfrm8Cb3XpvNH+gHdh/faY8c/AY13wg1OpXH23lw97X8gwOvm9qwIoQs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyGWXpUwv4iePTYM+Y4yChLQ/P/7A8E5dMm3aFDMnYGsHKQjQ6
	ltETE5T+CtC+5Z6zhScva2HLi3miq8kuerVpeoo3JRJNkcgE2/beaSf//WnA1lTOV8PRoVfcXJ0
	ATn/D319yGbwBd3GME4lcPBLjvp/PZBl528aoY+dumrdd/SE2QhUaXfTPJIYuQWgAIw==
X-Gm-Gg: ASbGncscus+Qt5+VDvqzwbDbRXPBc+dLh27uQH4dYGN9qCBtOvS8i39yy2TVh44QfVb
	HkFahbRrSwyEwknXYOUo8He1eslUfjBXq9lH7DtMWbw/YhkuVe0Ud3Ks7T9iz/1SM3B6YmYkgHH
	Sf7ngc5nLFUYyOz1zheJ0jQ2XDo32S6z8hfaAdON1ofsu7YnRNC+Co/RWuNgiGSlzlFFBaVsw0Z
	owf7NUVES0mMua5VNjUqAF1uU+nPJeTHJkUj0J3pJgXKV+R+Rz/tsyGqEivxWyhKwlyDsjFf0/0
	hryUgKf7iEo0CpE3cma4tgssRTkMbk24xtf7j7ERDS0J8LsgUEfsIjL/gtlGWPrSfdRCxUnIgaK
	Tsm3M+vA1WCBKGtTM9yWo/D7QOR8KEzjbWtRUO34=
X-Received: by 2002:a05:600c:8215:b0:441:b5cb:4f94 with SMTP id 5b1f17b1804b1-442fd606ba6mr131278285e9.5.1747677864483;
        Mon, 19 May 2025 11:04:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqEHR0p47D6A7BByJuurOL3YWvqVix3j4p7J+y+K5WxZtOIn9b26frZGNIjwvHtGZbvgcUzA==
X-Received: by 2002:a05:600c:8215:b0:441:b5cb:4f94 with SMTP id 5b1f17b1804b1-442fd606ba6mr131277925e9.5.1747677864153;
        Mon, 19 May 2025 11:04:24 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f3c:3a00:5662:26b3:3e5d:438e? (p200300d82f3c3a00566226b33e5d438e.dip0.t-ipconnect.de. [2003:d8:2f3c:3a00:5662:26b3:3e5d:438e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca888fcsm14274343f8f.78.2025.05.19.11.04.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 11:04:23 -0700 (PDT)
Message-ID: <3e2d3bbb-8610-41d3-9aee-5a7bba3f2ce8@redhat.com>
Date: Mon, 19 May 2025 20:04:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] mm: prevent KSM from completely breaking VMA merging
From: David Hildenbrand <david@redhat.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>, Xu Xin <xu.xin16@zte.com.cn>,
 Chengming Zhou <chengming.zhou@linux.dev>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
References: <cover.1747431920.git.lorenzo.stoakes@oracle.com>
 <418d3edbec3a718a7023f1beed5478f5952fc3df.1747431920.git.lorenzo.stoakes@oracle.com>
 <e5d0b98f-6d9c-4409-82cd-7d23dc7c3bda@redhat.com>
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
In-Reply-To: <e5d0b98f-6d9c-4409-82cd-7d23dc7c3bda@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


>> +/*
>> + * Are we guaranteed no driver can change state such as to preclude KSM merging?
>> + * If so, let's set the KSM mergeable flag early so we don't break VMA merging.
>> + *
>> + * This is applicable when PR_SET_MEMORY_MERGE has been set on the mm_struct via
>> + * prctl() causing newly mapped VMAs to have the KSM mergeable VMA flag set.
>> + *
>> + * If this is not the case, then we set the flag after considering mergeability,
>> + * which will prevent mergeability as, when PR_SET_MEMORY_MERGE is set, a new
>> + * VMA will not have the KSM mergeability VMA flag set, but all other VMAs will,
>> + * preventing any merge.
> 
> Hmmm, so an ordinary MAP_PRIVATE of any file (executable etc.) will get
> VM_MERGEABLE set but not be able to merge?
> 
> Probably these are not often expected to be merged ...
> 
> Preventing merging should really only happen because of VMA flags that
> are getting set: VM_PFNMAP, VM_MIXEDMAP, VM_DONTEXPAND, VM_IO.
> 
> 
> I am not 100% sure why we bail out on special mappings: all we have to
> do is reliably identify anon pages, and we should be able to do that.
> 
> GUP does currently refuses any VM_PFNMAP | VM_IO, and KSM uses GUP,
> which might need a tweak then (maybe the solution could be to ... not
> use GUP but a folio_walk).

Oh, someone called "David" already did that. Nice :)

So we *should* be able to drop

* VM_PFNMAP: we correctly identify CoWed pages
* VM_MIXEDMAP: we correctly identify CoWed pages
* VM_IO: should not affect CoWed pages
* VM_DONTEXPAND: no idea why that should even matter here

-- 
Cheers,

David / dhildenb

