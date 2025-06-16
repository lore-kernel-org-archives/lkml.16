Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4BC3B1AB
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 21:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750108636; cv=none; b=CtEARSC0mo/hz+74vhbC1e5rXE0LXuO6shbS/wsFjt7HOHIqkMKot+bZpIB8rRhm3J01hLKmGYziemsqSbU79hckZYAvGKUfixuDF1HfhP4Bs9ZZVWSOqyq0Y1CMaVfQkEUtPeuFqQ8Y+yuInvXKncs1Eq3ifLa0bIIwzDiZiFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750108636; c=relaxed/simple;
	bh=6DkDAnTryZsdP9B2tJNBaVKvwzCmYC49oVMtV96EWUY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pvoja24nZDFXdujyR4Sctn5AKXso00oHiNbHXuYzqnBSzyjg208d6JZDAnp8ufbU2/8R67JBsD9f+VGIAkh0SAJeaRSInoVMkLscLmNlmluKqspWGzFKKMz+pcJVu0/IjzBpffW0A2YG41xNePVRuRD6CiS85dtBWKX1VcIJm2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SBm+aslA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SBm+aslA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750108633;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=HnJYG3PvtFjFil/WV8ssVZhvqh2kulArcwW1sYXByhk=;
	b=SBm+aslAhqAPTOHfEQ5sVgRXDQeogQCZije2ccVHRAWvPYs9a+PXEQ81tfbMaNnmM1mFi3
	CyGE+OIivQX/CZCYksPcDRfskomsrm191WbfYgAknIbZmeLmRXUEVslNnvn4D1lG+yqorC
	aHbRxQXWCpJAH4Jpwu+gPzxhBpdCFm8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-ebve0tayN1GJ2GDsaFfEDw-1; Mon, 16 Jun 2025 17:17:12 -0400
X-MC-Unique: ebve0tayN1GJ2GDsaFfEDw-1
X-Mimecast-MFC-AGG-ID: ebve0tayN1GJ2GDsaFfEDw_1750108631
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-450d64026baso34232945e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 14:17:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750108631; x=1750713431;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HnJYG3PvtFjFil/WV8ssVZhvqh2kulArcwW1sYXByhk=;
        b=V4U6r0Bk0wg58VZujmoxwBCm7Tkt80RJHOgaEFm5tQ9z6IARj2z6JoIsN2v5Szjbhg
         jeqCeIXdk3zshupsQJX2J3GqjKcir5pFvx07yEpxByVZbIP/XjSRc13qkdFvqEPXeSx4
         pAPPykV2bbBf9WAOTGGYUmywiB86SlgCHoMAAboz3aByY2lNqrYocJpfOtBi8rwvsZ7g
         5Vh2j5646w3SawHirgGw7bKyrATwJyi2Cyzs7YpDCy20QA/tMp82AW0blmtqbGMGENFu
         B41Fw6DzgeRSmEF2d9FT30ZGIZ2e9iT3Oiw5s+KYLDBNGJIQF/t+W8OPlF0uTSNOU4y8
         GLTw==
X-Forwarded-Encrypted: i=1; AJvYcCXt6WbglaHv8kD8T/MlS2h+kKnmJQBCX294fe4XEp15Zoclt0uiJTc54JJABScEYyMXroGjwzZKNrshhWI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKHEYoH+/xcfuQjceUYcLSGXodJNAxqD91K8MWntXJaKruRFda
	u1ODY/tnkGmhGUWcgObkTaD80E2Fwu0RNXarrDhoBIMHcoEgB+aW7/dTp7sO8gtctG86/bLaFUM
	qMrY13jdpGbKufpbxgz+VtuhOfqEMvVeo8cXd4Q4H34ux0xbkvq2MbyGrRyntHzONkA==
X-Gm-Gg: ASbGncvAhSp4SucqqYU9eiwDIv7xhedj4w972Ecpy27EapsZ5EneijihfDqCk9Q5OaO
	KYVy4I5KA506/T4TWEpvPFWH0kr+Kx87OX6ev9LMk16bpOvygNFe8nziA/0DMmw0F8flgl78sF2
	GwKSWt4P7U5H45ca98rQCiABlTTEcvncsujdJBVk2YR3XTKLhU9+g8+XKqv4LNJiiOYcDFZwJSJ
	dOXQugReyKdg9z6bS2cDwgfDxYwUXOh+yGw+idDAP74dmAlu/ZFlw1vs2fTUmo8ruitJzUfHl7H
	BZ/khIv4NrnkzSdYrfSxzylMbOJqGb1l5tZniCWWorLWz0DsCewklfu9ukguJpn+eau5Ge8JuiN
	nJB/CwkqNxLYKBgDpRIMZolYuFc5pscOfOqGQqg3fHw9zbrnqqQ==
X-Received: by 2002:a05:600c:a218:b0:451:edc8:7806 with SMTP id 5b1f17b1804b1-4533e57d98dmr50266315e9.32.1750108631234;
        Mon, 16 Jun 2025 14:17:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8oBMkGvd7PRRPPcXzKQHTudMe5Uvbsmvsnm7KpeQdEh7RW/YNEFe0X2UUVYc+5/4PEY1nRg==
X-Received: by 2002:a05:600c:a218:b0:451:edc8:7806 with SMTP id 5b1f17b1804b1-4533e57d98dmr50266175e9.32.1750108630742;
        Mon, 16 Jun 2025 14:17:10 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f3a:e300:c660:4ff5:5bfb:f5c5? (p200300d82f3ae300c6604ff55bfbf5c5.dip0.t-ipconnect.de. [2003:d8:2f3a:e300:c660:4ff5:5bfb:f5c5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a7f8f9sm11982771f8f.42.2025.06.16.14.17.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 14:17:10 -0700 (PDT)
Message-ID: <f76e4f7b-1cac-4ce3-bd68-80d6c2ab5146@redhat.com>
Date: Mon, 16 Jun 2025 23:17:09 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: add additional mmap-related files to mmap
 section
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>
References: <20250616203503.565448-1-lorenzo.stoakes@oracle.com>
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
In-Reply-To: <20250616203503.565448-1-lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16.06.25 22:35, Lorenzo Stoakes wrote:
> msync and nommu are directly related to memory mapping, memfd and mincore
> are less so but are roughly speaking operating on virtual memory mappings
> from the point of view of the user so this seems the most appropriate place
> for them.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---
>   MAINTAINERS | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4523a6409186..a5d1ff923a62 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15735,7 +15735,6 @@ F:	Documentation/admin-guide/mm/
>   F:	Documentation/mm/
>   F:	include/linux/gfp.h
>   F:	include/linux/gfp_types.h
> -F:	include/linux/memfd.h
>   F:	include/linux/memory_hotplug.h
>   F:	include/linux/memory-tiers.h
>   F:	include/linux/mempolicy.h
> @@ -15974,12 +15973,17 @@ L:	linux-mm@kvack.org
>   S:	Maintained
>   W:	http://www.linux-mm.org
>   T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> +F:	include/linux/memfd.h
>   F:	include/trace/events/mmap.h
> +F:	mm/memfd.c

This is much more shmem related than it is mapping related (I mean, 
there is almost nothing mapping related in there)?

> +F:	mm/mincore.c
>   F:	mm/mlock.c
>   F:	mm/mmap.c
>   F:	mm/mprotect.c
>   F:	mm/mremap.c
>   F:	mm/mseal.c
> +F:	mm/msync.c
> +F:	mm/nommu.c

There is a lot of mmap logic in there, correct. + a bunch of other weird 
things ... :(

-- 
Cheers,

David / dhildenb

