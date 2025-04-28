Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567DD1AF0B4
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 20:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745871702; cv=none; b=qLUJClTOLinCOmtzBe/+KuC1Bs3fFqktz7h+dEn9GaBaAhan34/enlx5Wn243AO09YdBJhmad1qpv2xsqKvBwR8XkvfBBcxcrZQVkuKiuaPgKtyLlmukAFxVIei2kqM2UJBXdeBZD3NTFkFBWDcdJ+gFkS9IcAMISv4QoNPljK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745871702; c=relaxed/simple;
	bh=FduzFSRARw8p7Q0w6SysEIi/fJixs8KU4M+Qzk/Jg7M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bWvPhEhMpmzQH7nH09moAzGYzKy0nhgGt/+rTcQqDrfFnxhV6IWfhZvJZbCIKUzffWMiX7Ck3vk7OpS+CPkAp0b51jahW2CCD5UmWo4m+27QD5tPOD+n+TwtzdrP1CbWwiHPzZUrjv1Yi90F1e9ZusXEdNx1xUHk/PgU29vL/jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EG32uC1p; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EG32uC1p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745871700;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=LrYFRIG+5naiBlbX+9CjgCvO3T2uyab9clc4dalicFs=;
	b=EG32uC1p4ycyfzDocVHDlhM0+s8GARKYmz/PMPKIplhpTCxUjY+CLGmdABhoUrQsuYtb74
	b4ntZVdM73XrVtZBjBVEdVE8YqecPW4OsqQNpSGgTvgk13TU1eFqSDJ91sTruTzAXwuCk/
	AYHNdOGuuUyG+Gbe+WEm43eXfRfVBLM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-133-raHD8A2sMMOkDq5_hD2W8Q-1; Mon, 28 Apr 2025 16:21:39 -0400
X-MC-Unique: raHD8A2sMMOkDq5_hD2W8Q-1
X-Mimecast-MFC-AGG-ID: raHD8A2sMMOkDq5_hD2W8Q_1745871698
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43cf5196c25so27812475e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 13:21:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745871698; x=1746476498;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LrYFRIG+5naiBlbX+9CjgCvO3T2uyab9clc4dalicFs=;
        b=qYallXN+Fszfse7ZI7ra2OB0JdYhunAFrYI7TS+u2PRTq2cqmUcHsuFUoJuRT/FcKD
         B0ZTBQvvBi74Q3sBipbMAQEeP4mAwybinBYvPepeh3CXCRdwW6SnXDTSEDQ3K8OGfePj
         ELnVR5/OhVBkkE/IFPH8pQUlgz7J68d9FyDFBbEcMa9OzjZ+jZFbZ4KKkOMmJ/WsmlxF
         N+HJqHdF1CJu00JpFRg6HnXBWVyITAZMpsjkoggzFy4jqtu5XhB6LGmWQ2bwClc2UfwM
         aX6AX7AcMvkH3Q2CsNgzQ/44UWVX4Wtt0ptytv+HDXkF0S/eBsOdoteClhl9h+sl/v9i
         enXQ==
X-Gm-Message-State: AOJu0YzDVn0PjpuBT/83QhZtPO7EqfNUSmcP4hekdMPIkVD9xs8MGYWX
	zNAqGRMRcie7tN0lJzQvIN2Tj4gX+SliPUpPQmqx441oQUOEQmTKXW65TmXQfQxucw2bVdreVJ0
	ZaqI/DSF64nNMx36VyoVG+kOqMoP7hCcKegNVRmEOBhWY1nMWOe9Mrke7bjvazw==
X-Gm-Gg: ASbGncvxI3E8j9awZGujIdw0CoTzmPxqp9rYmu3aU5dIPfnlZl+CQTaKrmzp/9MVPJY
	Aymwaks27R38zGHK+vUaeyi61SJ+VLujZsP/abcISvHKjaFgEddrtCTjzJyUvxkjVK6qeTQUf2e
	DRzr4t/o15Ko9DTYlNWOTzYrbmwQ3fOA8OSdUzv+VF2gNZvZIM5v77TGgJ8n5kI7fHom4FiATve
	68ESDBUUez8NGUYq2AkkGWspI6RVf7eQ/AJEvI5QQc3xx6qK91a+fxyqV7AElyMNfxWNjj8MulY
	3LhvEOKwp5BLqetEsQ/8KY4Jk9qomvVUc6qIDDrSfWLW18sUgtLzjryxhhd27Ufbw/ONYfGlB2c
	zw/mgMUexargQr+OEYPh3dplFBRRpCuGcJQpAnL0=
X-Received: by 2002:a05:600c:a06:b0:43d:fa59:cc8f with SMTP id 5b1f17b1804b1-441ac89558fmr4580935e9.33.1745871698133;
        Mon, 28 Apr 2025 13:21:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpSf09RRSheP3E2kXomQow4GricntzgKsoJCPbpu2kgpQbD4Ec+VYPptiAm17v8S7ArcU8Xg==
X-Received: by 2002:a05:600c:a06:b0:43d:fa59:cc8f with SMTP id 5b1f17b1804b1-441ac89558fmr4580665e9.33.1745871697810;
        Mon, 28 Apr 2025 13:21:37 -0700 (PDT)
Received: from ?IPV6:2003:cb:c72f:ea00:2f00:e7e5:8875:a0ea? (p200300cbc72fea002f00e7e58875a0ea.dip0.t-ipconnect.de. [2003:cb:c72f:ea00:2f00:e7e5:8875:a0ea])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a536a1e8sm135663205e9.28.2025.04.28.13.21.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 13:21:37 -0700 (PDT)
Message-ID: <5a2103cb-08c7-4085-ad88-3d373562047e@redhat.com>
Date: Mon, 28 Apr 2025 22:21:35 +0200
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
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-trace-kernel@vger.kernel.org, Dave Hansen
 <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrew Morton <akpm@linux-foundation.org>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>, Peter Xu <peterx@redhat.com>
References: <20250425081715.1341199-1-david@redhat.com>
 <20250425081715.1341199-6-david@redhat.com>
 <8131940c-8b22-4856-947b-62ca64e2f417@lucifer.local>
 <CAJuCfpFTgXu+RtbzAis4C0kV=hjFQH39BZrKJsQbjnZRMR2tbw@mail.gmail.com>
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
In-Reply-To: <CAJuCfpFTgXu+RtbzAis4C0kV=hjFQH39BZrKJsQbjnZRMR2tbw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 28.04.25 22:00, Suren Baghdasaryan wrote:
> On Mon, Apr 28, 2025 at 12:47 PM Lorenzo Stoakes
> <lorenzo.stoakes@oracle.com> wrote:
>>
>> +cc Suren, who has worked HEAVILY on VMA field manipulation and such :)
>>
>> Suren - David is proposing adding a new field. AFAICT this does not add a
>> new cache line so I think we're all good.
>>
>> But FYI!
> 
> Thanks! Yes, there should be some space in the last cacheline after my
> last field reshuffling.

That explains why -- that last time I looked at this -- there was no 
easy space available. Thanks for that!

-- 
Cheers,

David / dhildenb

