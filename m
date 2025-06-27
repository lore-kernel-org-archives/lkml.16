Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4EE2E8DFD
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 15:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751036953; cv=none; b=VmRCey7TU4mE7xC9GcRRSZ88sgsKWfXuGlVrdV/HczlAoCHfKVNwUfjxgJAug1Ax99BvJfC6A+TEdmzmpE1/pEovgjCtAeliSGwsR9G9cOFnpVaCFGvXOgMxsEWgSeadev1cv2qH7FRdbTrTGZJ1JO6zU5hbHF2dSCQRZOfTdP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751036953; c=relaxed/simple;
	bh=gr5Y7MDB0YPEZFqzbHg7k6EBv1TU4O+wVSgIO2DgrPg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DlcPNukOSeD7xyIfEhaMej/QWKP27oYlnhx+6H3EaIYAv7fVQWMpnyHWtms0ig2TQANdJ2mhFgWgDbThQKTjjEzVNoaztUCW1o49bC3lhtBnsnjOe6ciBOvmF1tNAMYdVkeqYbQcCIXxBzsbpjt18DRDuqE3aOXtYUL4pqtm3gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hqB8OTfN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hqB8OTfN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751036950;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=R52UK179SfEw6rrLSyqaN22xz8RJ96+38R4F+OJEGnw=;
	b=hqB8OTfNJHdeie95uz9K0L2YZnLDe8X3kK7afvhwzNfpluZM/e7Q6pFHiQRnKDVMFhnnGp
	YXCASETSzcC+XPZfzEtwSPqmA3XxRn9hKv1EfmuPpZ+GgzNarQsVFjw/tvByHyfAEayXcV
	d/PiS9rjSKg5qnTP/8RwpaRP7vBNG+w=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-146-IAgyZ4A1MBCHRz3WIlvuQQ-1; Fri, 27 Jun 2025 11:09:08 -0400
X-MC-Unique: IAgyZ4A1MBCHRz3WIlvuQQ-1
X-Mimecast-MFC-AGG-ID: IAgyZ4A1MBCHRz3WIlvuQQ_1751036947
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-451dda846a0so17002085e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 08:09:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751036947; x=1751641747;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=R52UK179SfEw6rrLSyqaN22xz8RJ96+38R4F+OJEGnw=;
        b=YOkOrdU7NYgjnH6/T1Sa9ZGCePnmwvspbL4t6BbJuRIuHw2OaCgaVdh1gf/zaQJU7z
         0fol9zEkG/2nKDqN1DHvXv7dwySNWNz41Vks/zWS3YDM+8cUUM4FMocsDoZQcjnbIjVE
         2N5+aPkqwZsT3g70gxmaaqRy7tjFTSkLsPiVD29jzB7JkG8C7G2DkrgOYhc5HIKU+Ztw
         7J9q68UvaHIITtwdgbxtTWuDv/wuVwmxsoFPb9CebRENrHLKS/YvNV7sFaHaeMrMFSJW
         PizQehviEE/GT6v0SQaRUdVS1ty06bDJ2RvjJKH6ye5qj0ZxVbv25jEt9r06SIw5LdNd
         YA2w==
X-Gm-Message-State: AOJu0YwmIglYmuQXx0vt9ZRxv6tgSvCCJmZG6lClGUcN/MB3NP91lkXZ
	ie9V+pLbXlGsfb+sl2xA4So6ewZT8v9IrY87m1pUfaau50RsX8lEUeYcrvjZln0MDcKEqmaorRd
	o7Gh6qAuxX+ZXdl0gDgAlP/RasX5rw4gm2lwPfzDaPXoG7OepbX8iYdC/vcmcgOKBwQ==
X-Gm-Gg: ASbGncvOXKUNQ7EBtc57rIySLv2j1WmeX/SJpoc6BYRr0k7UckwH0GIlaKPYp7roMwU
	4N2bnOIbNpATmzailbJ6GUNccrnWZ3C0k0fmQ8jsBgtpsvsJiFLYdq17jWd5QRNvifKb3glniaU
	vlfWjwHzi+gTsuSavNLD7sh4hsE40kCA/90EyC5oPN1SaqwgwDPPBw2KaPkd00BOksFZhOLg84u
	+7U2m7LQIqyoEttlO9P/Z29YzkD407cPO6vcoVx/TRKiTrS3YmQudoSJz778VUJRcWcvOEdd0Tx
	hSx8g59Uia1JIGTz6eyoAJtKk5vpDCY1G/NMOMdQci+AHiZJend0fPM2ne8OTjRLxPalCg716Bo
	SHhoqMuyDM1/ErN4XZA759U3GH+HHQkn4gTr43kX17aWHSPzzyQ==
X-Received: by 2002:a05:600c:4688:b0:43d:ac5:11e8 with SMTP id 5b1f17b1804b1-4538ee835bcmr39294945e9.21.1751036947136;
        Fri, 27 Jun 2025 08:09:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWe0Tk0XYbLjqf5R0NQ29I7Nsta+/uEcW+ztqfhBW32Asd+GFgU7LbjQTI2JkLaJQuwwkEhQ==
X-Received: by 2002:a05:600c:4688:b0:43d:ac5:11e8 with SMTP id 5b1f17b1804b1-4538ee835bcmr39294235e9.21.1751036946497;
        Fri, 27 Jun 2025 08:09:06 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f2d:5d00:f1a3:2f30:6575:9425? (p200300d82f2d5d00f1a32f3065759425.dip0.t-ipconnect.de. [2003:d8:2f2d:5d00:f1a3:2f30:6575:9425])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a406ab6sm54044615e9.30.2025.06.27.08.09.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 08:09:06 -0700 (PDT)
Message-ID: <9eb26777-cdfd-49df-9e1f-e326454ab477@redhat.com>
Date: Fri, 27 Jun 2025 17:09:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/4] mm: split folio_pte_batch() into folio_pte_batch()
 and folio_pte_batch_ext()
To: Lance Yang <ioworker0@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
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
 <20250627115510.3273675-4-david@redhat.com>
 <CABzRoya5n6ChTnjfsoYpQuQ6Gtuu61kpH5fc_iXv2cAQHS-KKg@mail.gmail.com>
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
In-Reply-To: <CABzRoya5n6ChTnjfsoYpQuQ6Gtuu61kpH5fc_iXv2cAQHS-KKg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 27.06.25 16:19, Lance Yang wrote:
> On Fri, Jun 27, 2025 at 7:55 PM David Hildenbrand <david@redhat.com> wrote:
>>
>> Many users (including upcoming ones) don't really need the flags etc,
>> and can live with a function call.
>>
>> So let's provide a basic, non-inlined folio_pte_batch().
>>
>> In zap_present_ptes(), where we care about performance, the compiler
>> already seem to generate a call to a common inlined folio_pte_batch()
>> variant, shared with fork() code. So calling the new non-inlined variant
>> should not make a difference.
> 
> It's always an interesting dance with the compiler when it comes to inlining,
> isn't it? We want the speed of 'inline' for critical paths, but also a compact
> binary for the common case ...
> 
> This split is a nice solution to the classic 'inline' vs. code size dilemma ;p

Yeah, in particular when we primarily care about optimizing out all the 
unnecessary checks inside the function, not necessarily also inlining 
the function call itself.

If we ever realize we absolute must inline it into a caller, we could 
turn folio_pte_batch_ext() into an "__always_inline", but for now it 
does not seem like this is really required from my experiments.

-- 
Cheers,

David / dhildenb

