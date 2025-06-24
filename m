Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FAD126CE01
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 15:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750779271; cv=none; b=HMxbiqPQq8wdm+msmyzW0V2QgdXeInWGLaZrZAt90d/4pIteEFeBi7rrY+kz5yvsEhGJzcFwo3h9dlAHdKh9TkWZYGOfucp7bKrfA922i3Au5t5Ucocx52Bxwmx5pNB2PdvVQxp3dD50RCQlQEHG/36vWTH1feMMdZCCod3l9sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750779271; c=relaxed/simple;
	bh=SGgzbGCmXeXBsxVmZQGsWAKziVz62vfg3/s+kHQ/2nU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SoitQWT2BGke6h9NrHlQ2ZWNUJPaEZ7LXGWGmuLYi+mC3UMwTssB4dIcbXTZdxPy6Ibb+U+BNtdT0J+u7VPKK1O1K1iTv3WqFT0JOxJDuuMai+LNN4fl/3/jsk01ENMl6wMbJRijRGrSVhds7Z33nsNRqXIV6gPAfgoOlreazYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YYjOhwuB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YYjOhwuB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750779268;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=RcLpQIGOHnObqeC9JE4WrzqVitzt8nhGtyf8y+j3oKs=;
	b=YYjOhwuB8unigFceDLIc9+Jk7cuifrVmySXAe2FrVC9YA0m98BufvgroDj0JaaeuvHFLHC
	31Sb1EMIi8BgRYGOsehq3MJk8rZmiv1wIEKlabz4K8vTFvGa3526H6+T1mTK7p1IF5DbBa
	jcPKeefJpBUFE4yCC490dcI247cQet0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-622-yhM9mzmcPrWcAHJR_FnJ7A-1; Tue, 24 Jun 2025 11:34:26 -0400
X-MC-Unique: yhM9mzmcPrWcAHJR_FnJ7A-1
X-Mimecast-MFC-AGG-ID: yhM9mzmcPrWcAHJR_FnJ7A_1750779265
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-451dda846a0so42080045e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 08:34:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750779265; x=1751384065;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RcLpQIGOHnObqeC9JE4WrzqVitzt8nhGtyf8y+j3oKs=;
        b=vhkutkC8BMDMnjxoFElHdy/uInZyTwzUKpEz+dmiL6Ezh8H8lcGlvRpyGgfSXfI8+e
         rGs9QO5FNDH11VAKoHRkuYnhiXUWr1huKGCFRdOmbQbzJKEopYaKzNpHkUSBcnk3brfR
         QRys1cN8AeiU53JABBQzs9cCVu2mbXi+JIeo/bkegXOxxhaFgoUFyXEZnxqqp3kJ0BOd
         jtckMLBVbPFksf92DZwtI1bZIqejZBguFhrmtMViJyG8T+qiJffwBK/9gdySXBCI3dao
         UEpF9eWGoI8cYYk2Z5d4CbePuwAQL4RZq/KD26xv58eKx4J1UZ/gm7h96HV6TcZcck+n
         h7JQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2xJcSwaWQUBjjMlHV5ZZQVug2pF4r2V3FX0WyIkhJPq8ma8M7v8aqnyoR8xWnpEKQPPE+ANhC1PSG+dA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1NHAVrt9MYJtzUtpsuhuc8ozUD1N0e5vpHlmKKCelOR8Xf/Pa
	uCJTk70iyl62yi6YSJW9TaLSuGd61VsuOsksQUC2fA6rx6kpU8IjleiBeYYV1WEAiwQk2y2uXjd
	8jaULT3LLO/tL077XoF9NG5STqCDD4sxd47F8fr8jSt/KCjWUg4vw2gtDKQJ651XLDg==
X-Gm-Gg: ASbGncumr8ryZYwYRncjY+gZpyKk5Lq0TLt6LeVCpMamy5/oOaAWE8pwhBDTUBV8bML
	lXCvex5uuFLVKZ3j0MlTJnyaVzvoYjXEWZ3ukzZmuKpjae51+HmTWCZo0WhMLBxCpGvsVX5jl/W
	HMJz/WmcoKIuOOeGK4HDhkb9UHRRpafJEJ2KqtscKhkAQeqOMhTovTGhd2YO/nDBHMxBUKnFNqs
	7fe4NOpmr5omaYO3IUkbebHeBDJGny1I53iODkWB2pLkX9gHmuzo1ofMhWlQjaKXheRHFFgbJv6
	7YMCoBKqh3UbOsvqOcb79mOB8v4JyPZyADGWl/Lp7z8Y3MTsOj3v+Kk=
X-Received: by 2002:a05:6000:644:b0:3a1:fa6c:4735 with SMTP id ffacd0b85a97d-3a6d12de9f5mr15286835f8f.35.1750779265340;
        Tue, 24 Jun 2025 08:34:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6Ygv2yKeSOnyksLf8xOR4yHKXMKNiKsSWotC4sSpeb23NQbCgX43VhwnxwPvnUhGhaM9S2Q==
X-Received: by 2002:a05:6000:644:b0:3a1:fa6c:4735 with SMTP id ffacd0b85a97d-3a6d12de9f5mr15286806f8f.35.1750779264907;
        Tue, 24 Jun 2025 08:34:24 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453755e7d1dsm62924635e9.10.2025.06.24.08.34.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 08:34:24 -0700 (PDT)
Message-ID: <2c19a6cf-0b42-477b-a672-ed8c1edd4267@redhat.com>
Date: Tue, 24 Jun 2025 17:34:23 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] mm: Support batched unmap for lazyfree large
 folios during reclamation
To: Lance Yang <ioworker0@gmail.com>
Cc: 21cnbao@gmail.com, akpm@linux-foundation.org,
 baolin.wang@linux.alibaba.com, chrisl@kernel.org, kasong@tencent.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, v-songbaohua@oppo.com,
 x86@kernel.org, ying.huang@intel.com, zhengtangquan@oppo.com
References: <a694398c-9f03-4737-81b9-7e49c857fcbe@redhat.com>
 <20250624152654.38145-1-ioworker0@gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250624152654.38145-1-ioworker0@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24.06.25 17:26, Lance Yang wrote:
> On 2025/6/24 20:55, David Hildenbrand wrote:
>> On 14.02.25 10:30, Barry Song wrote:
>>> From: Barry Song <v-songbaohua@oppo.com>
> [...]
>>> diff --git a/mm/rmap.c b/mm/rmap.c
>>> index 89e51a7a9509..8786704bd466 100644
>>> --- a/mm/rmap.c
>>> +++ b/mm/rmap.c
>>> @@ -1781,6 +1781,25 @@ void folio_remove_rmap_pud(struct folio *folio,
>>> struct page *page,
>>>    #endif
>>>    }
>>> +/* We support batch unmapping of PTEs for lazyfree large folios */
>>> +static inline bool can_batch_unmap_folio_ptes(unsigned long addr,
>>> +            struct folio *folio, pte_t *ptep)
>>> +{
>>> +    const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>>> +    int max_nr = folio_nr_pages(folio);
>>
>> Let's assume we have the first page of a folio mapped at the last page
>> table entry in our page table.
> 
> Good point. I'm curious if it is something we've seen in practice ;)

I challenge you to write a reproducer :P I assume it might be doable 
through simple mremap().

> 
>>
>> What prevents folio_pte_batch() from reading outside the page table?
> 
> Assuming such a scenario is possible, to prevent any chance of an
> out-of-bounds read, how about this change:
> 
> diff --git a/mm/rmap.c b/mm/rmap.c
> index fb63d9256f09..9aeae811a38b 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -1852,6 +1852,25 @@ static inline bool can_batch_unmap_folio_ptes(unsigned long addr,
>   	const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>   	int max_nr = folio_nr_pages(folio);
>   	pte_t pte = ptep_get(ptep);
> +	unsigned long end_addr;
> +
> +	/*
> +	 * To batch unmap, the entire folio's PTEs must be contiguous
> +	 * and mapped within the same PTE page table, which corresponds to
> +	 * a single PMD entry. Before calling folio_pte_batch(), which does
> +	 * not perform boundary checks itself, we must verify that the
> +	 * address range covered by the folio does not cross a PMD boundary.
> +	 */
> +	end_addr = addr + (max_nr * PAGE_SIZE) - 1;
> +
> +	/*
> +	 * A fast way to check for a PMD boundary cross is to align both
> +	 * the start and end addresses to the PMD boundary and see if they
> +	 * are different. If they are, the range spans across at least two
> +	 * different PMD-managed regions.
> +	 */
> +	if ((addr & PMD_MASK) != (end_addr & PMD_MASK))
> +		return false;

You should not be messing with max_nr = folio_nr_pages(folio) here at 
all. folio_pte_batch() takes care of that.

Also, way too many comments ;)

You may only batch within a single VMA and within a single page table.

So simply align the addr up to the next PMD, and make sure it does not 
exceed the vma end.

ALIGN and friends can help avoiding excessive comments.

-- 
Cheers,

David / dhildenb

