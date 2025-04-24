Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C3214E2E2
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 21:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745529113; cv=none; b=bv08kxPi1SnBbHplRoigPPH6yz2Ppw3lWfKjA1FJ36SOqqJEEFwgq0bRoJ7X+WK015K9Ev+rYP6KUE55b0pONJvIJuc0qIJVFmUn80GlW062iQmfGp8JBzszzwNWjyPjxL4HlAK6+WOosoQ7E769mSUCLj0QH2EhWFIw/MTbtLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745529113; c=relaxed/simple;
	bh=YnvKMngnPmH2Gsb/dh241I3G125aq+P5yf1pjgcWRQ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=swEaG4It+RRzpbkEhkCPvynQZJzwrziG6vgDhH7q9aRtPIPiGgJwTGuAKRm0wAjzkR30xUC0b+WKkIu21Y2BcUC9e/Lu43Wq65EbYe4Z650+nUmCGrZL2H6yxJNaG8mg3AQAeu7V/PbyuAivqodKaE0auZ7ntXVzB2Jdv5w0hCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Md5aC0Hh; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Md5aC0Hh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745529110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=XSJt09CWKPOf+EGnLW8nyqe/QhTx1Ajx0DdE2d0+ieI=;
	b=Md5aC0HhFtHVxFHmY8khS6I9z8OOTwWkGPZgtW/EF/hf8Y27X45UFmRSMYcjhLkJV1gaNR
	vzzugT8Ac5Fut5GrBfir8HDo6offSOgb3VO9dDB3dSeWZU9Wg7uGr49+30eLlfabs1OTVR
	N7Zlp0y1wOAYGuH1TAummBL4cdtPnPY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-282-ouACF3SOOaaC6Mz_yTL5vQ-1; Thu, 24 Apr 2025 17:11:47 -0400
X-MC-Unique: ouACF3SOOaaC6Mz_yTL5vQ-1
X-Mimecast-MFC-AGG-ID: ouACF3SOOaaC6Mz_yTL5vQ_1745529106
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43d209dc2d3so7760755e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 14:11:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745529106; x=1746133906;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XSJt09CWKPOf+EGnLW8nyqe/QhTx1Ajx0DdE2d0+ieI=;
        b=UmxE82MNT7XW4ZsQLc4zHUnq3cN2akBzmVHYpuz/okW+PdlrwqTFCAQhGG+fQfYB04
         IMcK8Li6ZR7zKnt3gSv/pk8JiCSTvpUR+RpufJS8YPPkpDCLkCV4yBEQ1O/cPTkKM/Id
         Doa/BZmIEKfQ+yTZUi7609NqOInIzumUhxg+KJC+dyo66ZEgBdb4mzDn/SYdB5g2MLEt
         NZ7pd7mFq5ymT0a0ZqSnp4I9rJ/ICupX8nES58wGveHtsBnG+HpwC/Cg9vP6XgwZ9Rsu
         yJZAFmcrS10sYIQU/HAZtX/6uxxvMr/JmF1wf3w51SIsp04o7jYamZttuAvORLzyg4hJ
         DN6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWwiehpOWXDdrnL4DazjyUJpVVqxy+wq2KsQzeUHCLOBu3pQu/67BjjwrlzEC5qC4MY1C7tAP+0c/eusjs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWcR8fA9uJaJgDJYlQDLDPK2eECZCjvy+jZ2vRntD6hLb0PIu9
	Fzv+NpDJyI4QIkjFeuH54nkXnDTyPJ2TVGyYQDRFQNwcXO6UDTyasi3SPZJCHvDHYDZZSD225dC
	XHWVaTHs689zTLzkDdWgwLmzMIGoI20RcyHq5xNhPxq7ZG3X3wf6zR+MifArtzA==
X-Gm-Gg: ASbGncs0tzASoOU4JFykwN/RWcbZdaleZXVeMuBtdTPJOnU6TeztGBoG13cLtsVVjIo
	589wbBuKxWsVaDIZzQ0X50oaPH+jaeRpdMlpI5DRwH5AyI7HNDK+314vfxR9qZIR4rMbGIVGfv8
	iXL4+T4GlRtb1VR871v/x1c8XOlSMqi7ipxWiV0UJ7l7rajPjQ/IbQ9kHTpyM6/LponghecmYIR
	b+BRFNJXzZUxxe+tVA4doTqDHrCI9AtmihgweOhdvGIKk8Bkq7VU9eDIe1Eb7u2hNchTgF+gUte
	iR62QXDxb+uSwkZ///MkBow6GEjReAyV1v4I6vioBjvgJUoL3c8RtQGvmtaE2pJWa+9hm9jHI5p
	pC0Je1JflBpiiVHDX3c+izYcHRPNnoJiFYtG8
X-Received: by 2002:a05:600c:8012:b0:43c:e7ae:4bcf with SMTP id 5b1f17b1804b1-4409bc06f4cmr44141565e9.0.1745529106305;
        Thu, 24 Apr 2025 14:11:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcF4PqwYVcKyDhNajp+9yGkVLlqSoBI+pDcioIx4vbWO4AH3K4GqMgkz2s+HBMzGQ0VesaZA==
X-Received: by 2002:a05:600c:8012:b0:43c:e7ae:4bcf with SMTP id 5b1f17b1804b1-4409bc06f4cmr44141435e9.0.1745529105905;
        Thu, 24 Apr 2025 14:11:45 -0700 (PDT)
Received: from ?IPV6:2003:cb:c74e:ff00:f734:227:6936:cdab? (p200300cbc74eff00f73402276936cdab.dip0.t-ipconnect.de. [2003:cb:c74e:ff00:f734:227:6936:cdab])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2ac5a9sm34371385e9.23.2025.04.24.14.11.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 14:11:45 -0700 (PDT)
Message-ID: <0eae5cc8-5714-44dc-97b4-e1b991c0e918@redhat.com>
Date: Thu, 24 Apr 2025 23:11:43 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/7] mm: Introduce for_each_valid_pfn() and use it from
 reserve_bootmem_region()
To: David Woodhouse <dwmw2@infradead.org>, Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 "Sauerwein, David" <dssauerw@amazon.de>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Ard Biesheuvel <ardb@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Ruihan Li <lrh2000@pku.edu.cn>
References: <20250423133821.789413-1-dwmw2@infradead.org>
 <20250423133821.789413-2-dwmw2@infradead.org>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250423133821.789413-2-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 23.04.25 15:33, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Especially since commit 9092d4f7a1f8 ("memblock: update initialization
> of reserved pages"), the reserve_bootmem_region() function can spend a
> significant amount of time iterating over every 4KiB PFN in a range,
> calling pfn_valid() on each one, and ultimately doing absolutely nothing.
> 
> On a platform used for virtualization, with large NOMAP regions that
> eventually get used for guest RAM, this leads to a significant increase
> in steal time experienced during kexec for a live update.
> 
> Introduce for_each_valid_pfn() and use it from reserve_bootmem_region().
> This implementation is precisely the same naïve loop that the function
> used to have, but subsequent commits will provide optimised versions
> for FLATMEM and SPARSEMEM, and this version will remain for those
> architectures which provide their own pfn_valid() implementation,
> until/unless they also provide a matching for_each_valid_pfn().
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>   include/linux/mmzone.h | 10 ++++++++++
>   mm/mm_init.c           | 23 ++++++++++-------------
>   2 files changed, 20 insertions(+), 13 deletions(-)
> 
> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> index 6ccec1bf2896..230a29c2ed1a 100644
> --- a/include/linux/mmzone.h
> +++ b/include/linux/mmzone.h
> @@ -2177,6 +2177,16 @@ void sparse_init(void);
>   #define subsection_map_init(_pfn, _nr_pages) do {} while (0)
>   #endif /* CONFIG_SPARSEMEM */
>   
> +/*
> + * Fallback case for when the architecture provides its own pfn_valid() but
> + * not a corresponding for_each_valid_pfn().
> + */
> +#ifndef for_each_valid_pfn
> +#define for_each_valid_pfn(_pfn, _start_pfn, _end_pfn)			\
> +	for ((_pfn) = (_start_pfn); (_pfn) < (_end_pfn); (_pfn)++)	\
> +		if (pfn_valid(_pfn))
> +#endif
> +
>   #endif /* !__GENERATING_BOUNDS.H */
>   #endif /* !__ASSEMBLY__ */
>   #endif /* _LINUX_MMZONE_H */
> diff --git a/mm/mm_init.c b/mm/mm_init.c
> index 9659689b8ace..41884f2155c4 100644
> --- a/mm/mm_init.c
> +++ b/mm/mm_init.c
> @@ -777,22 +777,19 @@ static inline void init_deferred_page(unsigned long pfn, int nid)
>   void __meminit reserve_bootmem_region(phys_addr_t start,
>   				      phys_addr_t end, int nid)
>   {
> -	unsigned long start_pfn = PFN_DOWN(start);
> -	unsigned long end_pfn = PFN_UP(end);
> +	unsigned long pfn;
>   
> -	for (; start_pfn < end_pfn; start_pfn++) {
> -		if (pfn_valid(start_pfn)) {
> -			struct page *page = pfn_to_page(start_pfn);
> +	for_each_valid_pfn (pfn, PFN_DOWN(start), PFN_UP(end)) {

                           ^ space should be removed

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

