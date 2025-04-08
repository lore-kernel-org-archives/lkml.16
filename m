Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874E6204F79
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 18:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744138054; cv=none; b=mpAip20dXe4zpw3S8osFG5wypqo5UF9yIGEA0uuwYl/sgFPhOhi5pwtsybEF2Hu9B7dgFU/DtMOBizIYWMUtmM5abkD/wuO8jKoUwpL9oEfulSIbDudDFyPXqArQ3AO+lSTkGgWYNNbjoQ82WJi204QUUFB+HIgJaGHI2FAZ0w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744138054; c=relaxed/simple;
	bh=s2oRNq1JLVwHe7pXwonJ3AbJabUaM/nBmDjD++pQ3DU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CPsyvTtoDmn+t2PIYMFtfDRrlbO5jznmcHC4vu4SCnU55uUyOmjlEf7CFAL9SwFKie0fFbKSgDFvEQ2tOEQ79b4wc5wEtJezdGOZYIt9HnniqsLrHbYCW06wgfHkkE2GjE8GxcR4/7p/9TmCXcRLuOYPgqO/GmxR10hzywPjAlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HsJVEfxW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HsJVEfxW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744138051;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=9p9FTjApgGVG2ehvCMAGkrLSVRjNhboSjbIVtKrybrs=;
	b=HsJVEfxWHsntngGl+RAlW33cJUphjMIV8foBSLEQg1VLNZCB7rYWBx0nHWANFNSf0ZufgQ
	1BcEGtPil64sWP2wyOwvRP8jZoP14V63qQUYk4hS262+thys1AShwOKVQGjxmBj4ph88+8
	hb8iQ5AQInzAvqenoGenU+Bo9m2IwbY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-513-KHmOFl_jOkqURS1gDDLzNg-1; Tue, 08 Apr 2025 14:47:30 -0400
X-MC-Unique: KHmOFl_jOkqURS1gDDLzNg-1
X-Mimecast-MFC-AGG-ID: KHmOFl_jOkqURS1gDDLzNg_1744138049
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-39131f2bbe5so2275376f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 11:47:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744138049; x=1744742849;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9p9FTjApgGVG2ehvCMAGkrLSVRjNhboSjbIVtKrybrs=;
        b=eWpYjRGdXENKzhiJtMEkWuiTBzC9H5DVfUOUxrI+39o7VvM3mzTeFBEWAOV0gsLc++
         DvISqamnVCgq0HV4hGyZcNHE5+0Er47WiwOyLWM9VVMpzhdsslRwurImbGyZak399OzS
         trUqmLHwCSCnJcYQG55Wzz9VrUfP1YpHysvyGQVYYmHFjqi6Arw84pnYoHCr3TBMQO8K
         /u+pQNgaaSrWxm2RLo/gVkNSNTZtEGfggnVI5O4YWljLNvZpVWu84B24Sr1XxnrdNKHC
         WP2rSWJCF3otP4m4bgiMRhbL/zAWuaRknHjUbWC5uiqubBjqi2kfpKUwSYhAaqrFi2tv
         kq+g==
X-Forwarded-Encrypted: i=1; AJvYcCUPMwWebVBRCCjHJINrFzRCkBJB8X7mlPkFah9iff5VDPAVixznm+KiBG0+t9rCLJkR2bLT1kDTH4vQcBY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZVLJSECYtK6asx0qhMQxstG7SHXli7hZ/fdqFdUzJhkwaX3c+
	QitNqKAlYB/Il1LdFmlvfClMR9Yj/f321ia0YTnvGYL2N9SeH+ueNsfeaiKBOMQQw4LytnbcNf7
	EzyvNSE8MiVsgywjmTq61h51MT5ZgA1/NlHd/6LqwaQQiwsXvR4jJXJMEPI8mew==
X-Gm-Gg: ASbGncsD7zvYIP5clocJ8mqS/1rTSI+v8vicheZih+8e4OlRm3JY9UIBBpelppUJDkm
	xIj+d3+OaLARH178RjJ8GnAGcp5nOsbkbhRHDmqVfO2EivXgbA8qQNvAEA/Gm3G0+NrHIZ177rJ
	fgDx1Z9NijyRfSYqcSRF4PvFjVcQmu1I1x9HRWKPqcYaHEEx9W23yy9jfaTxt9/yeSmJP29xfXe
	1UdKBKPR/0HF0lvFV+ZW2H17iwHwaKZOzGRh7cinYvtqqGd+8uP7A0PtmcLzsCn0VgM2WeQH2MV
	GeDKaSDkFaScmvPvfIAvHo8KXlbPqbZ+jbZ5k2SQmyCNl3uQd8F4wzqglpAD0YQsW1czAOY54q+
	VXBlqwUrAzfWsb0gAO2/buo3dukNx9Cy2Zp7NPG8C
X-Received: by 2002:a05:6000:2403:b0:39c:16a0:feeb with SMTP id ffacd0b85a97d-39d87ab64f6mr235286f8f.27.1744138048811;
        Tue, 08 Apr 2025 11:47:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbL8M+Q+aG1JQj+aPaxVsGSxiEwTTwED/tqoWnrukJgCBGiGlBB8KmAq4bFYPNdn3QC/jbrw==
X-Received: by 2002:a05:6000:2403:b0:39c:16a0:feeb with SMTP id ffacd0b85a97d-39d87ab64f6mr235270f8f.27.1744138048442;
        Tue, 08 Apr 2025 11:47:28 -0700 (PDT)
Received: from ?IPV6:2003:cb:c707:4f00:a44a:5ad6:765a:635? (p200300cbc7074f00a44a5ad6765a0635.dip0.t-ipconnect.de. [2003:cb:c707:4f00:a44a:5ad6:765a:635])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a6796sm15969091f8f.31.2025.04.08.11.47.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 11:47:27 -0700 (PDT)
Message-ID: <e56b7e21-2202-4b71-8200-a1b077e0115c@redhat.com>
Date: Tue, 8 Apr 2025 20:47:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: add memory advice section
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250408161105.156350-1-lorenzo.stoakes@oracle.com>
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
In-Reply-To: <20250408161105.156350-1-lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08.04.25 18:11, Lorenzo Stoakes wrote:
> The madvise code straddles both VMA and page table manipulation. As a
> result, separate it out into its own section and add maintainers/reviewers
> as appropriate.
> 
> We additionally include the mman-common.h file as this contains the shared
> madvise flags and it is important we maintain this alongside madvise.c.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---
>   MAINTAINERS | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index de97cd54ff24..325424a53acf 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15552,6 +15552,19 @@ F:	mm/vma.h
>   F:	mm/vma_internal.h
>   F:	tools/testing/vma/
>   
> +MEMORY MAPPING - MEMORY ADVICE
> +M:	Andrew Morton <akpm@linux-foundation.org>
> +M:	Liam R. Howlett <Liam.Howlett@oracle.com>
> +M:	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> +M:	David Hildenbrand <david@redhat.com>
> +R:	Vlastimil Babka <vbabka@suse.cz>
> +R:	Jann Horn <jannh@google.com>
> +S:	Maintained
> +W:	http://www.linux-mm.org
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> +F:	include/uapi/asm-generic/mman-common.h
> +F:	mm/madvise.c
> +
>   MEMORY TECHNOLOGY DEVICES (MTD)
>   M:	Miquel Raynal <miquel.raynal@bootlin.com>
>   M:	Richard Weinberger <richard@nod.at>

Thanks!

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

