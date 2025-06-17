Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145801E22FC
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 07:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750145709; cv=none; b=hnptwPaZXG2V1TpecM0PGYDiMZ5fpGJP38PpNK4iK7BW5B/hN2gKeuvP6q1AlSrmdWERzf7/HPvS0acfpUJ2BXbuouJERZxaihmu9iXYFKHqxe5yHFt77CDZXlwlEB6VWVJHYg7cQ/F19NIf/nll++57mZ+LOzxqSH9h01XUwpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750145709; c=relaxed/simple;
	bh=WTQn1jvIcuYuUMmkktU+F6VAMUzXWNxHnSm8UZakJ78=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tCKefAn8b75mK1gGrGcL9wPAhqve5XIiNVTR9I2v6UTYpDpIMsbdeIeIqlBhgXNVhm0b1hcSX5SwvaGgYQvUSEbdoJykoja1tp7XJV+cp+wtVlZIzCBrS+l3fqX7+R57TvhwVTrpXYzlq8J0pyc4pCqmUiIFQzlbnco+gE23X2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q9pWs7zk; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q9pWs7zk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750145706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Qr7YDLYZeKL5nI6aE6TfY01hQ51/nxfWCDQx9DxnXBs=;
	b=Q9pWs7zkGG5ToS8Y64UwU8eSjPgUmPVC/tfdmt5SwGZsmR5rk6NmnbOWtAXykVJofE8N9N
	MrdduxwD6WAnur8QdIzE2jskGMoprt/XHanOJAw09d1nXtW6GXKznOqAvrfRCIuAmjUz+a
	FhTwK2UeZ91BcAk5wC4av2rHz/LTPYY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-38-2ls1J8LUMTmJ8IEEWqP5iQ-1; Tue, 17 Jun 2025 03:35:03 -0400
X-MC-Unique: 2ls1J8LUMTmJ8IEEWqP5iQ-1
X-Mimecast-MFC-AGG-ID: 2ls1J8LUMTmJ8IEEWqP5iQ_1750145702
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4eeed54c2so3393972f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 00:35:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750145702; x=1750750502;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Qr7YDLYZeKL5nI6aE6TfY01hQ51/nxfWCDQx9DxnXBs=;
        b=FNr75RKe5xClsuXNrDtxNxnB+npAWfPdK+PGUAKnLNRLNEFNXgvZ57We7igx/v2YFn
         g4YBkbO7LNBfVrBqaRW8ufJ/eIMSWBx+kOPFPWjxYVtsgzdg9uez7Jb/SX7zjS9wAGLE
         b+xmM4z6Lxm0vKNmjSCe/igvUAlsVKuZUEjVdLnjVc5PZhpLXJe0DcSFlAGtaJpnzpe2
         kfKMm7HBLO3Al+A+ZAjfME7mLOvvWnO+OsL5D9N4k/R5SgMYitxEQZjLtFZjRVkYOqzw
         hLUGAAzj5VZcBC1Ca8h+5sYfLt1iysT4S7IVY1RbXUhzfbmb94tCnuOJcwOfjUzbZ+sf
         L98A==
X-Forwarded-Encrypted: i=1; AJvYcCWRzP6qsU2aaUG3NH+Ef1WfdMldaFjV5kx2G2qb/27xRpLLqpR3yO2KIFkfd8XxDGJ+091NFZ/aVSaJSI8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyChcxMOYnw6Q50GKrP/Y/yXQNCyoYvsS8JoECF7W1XnnN2Xyt6
	heEEYnUbpLV9prc4Q3C5cDzMmvMvhB6KOyzO8U9r0p452QprdyEy0eH7j6tlU2iG1Bh/zF4c/Pa
	PuVw4RWcPKBBBJ0Xtkvlf9WygwMXenEuYcaUL+cWHfcg/O/g528JevzdepeTCv/VYzw==
X-Gm-Gg: ASbGncs3pPd80GlVk0F6s/C4VbbYdILgXIrP6s86T2fwslnUS0huIu9ljwTL8Q1j0OG
	wKRruxSIghBDfWIQhSUGmSiTmGoMiyc9XVy4dkQ0jh8DCV4obGc/Z9bG6pBOwgB+O28YCs6J4v0
	AUXnt/taPjgqiINcqGRZQMADEkCRnoCvggcNQrh1iJ34UciuKsy28kb7LCIWckY8Eenn2LEA76T
	pR/ISQC9EZSrkXQw7orlU19869hWjfsL8QQ3Mh+3yq1oJlw99vWOpj+xTr9Pg02Ga9A50aegvyb
	8csF+bo6is/+kWVNu5gQHNWDWIO6klxqqBhjGXu83Ku8zXhTQusE4DxYIkYIlu2SnpkvAqvmm1Z
	GI8gdfOmw/9zFJCF2UAgQ1UbkhFpz/muwpb3WrhInGVBngCo=
X-Received: by 2002:adf:b64d:0:b0:3a5:75a6:73b9 with SMTP id ffacd0b85a97d-3a575a6776bmr5519730f8f.11.1750145701968;
        Tue, 17 Jun 2025 00:35:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHj5SVN8X/GgRvKQRhQLvWOYL4dcmdIN/phPnUQUy6L/lFKmUG1JqHAavYuw0IUsXgdRRaM+w==
X-Received: by 2002:adf:b64d:0:b0:3a5:75a6:73b9 with SMTP id ffacd0b85a97d-3a575a6776bmr5519713f8f.11.1750145701594;
        Tue, 17 Jun 2025 00:35:01 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f31:700:3851:c66a:b6b9:3490? (p200300d82f3107003851c66ab6b93490.dip0.t-ipconnect.de. [2003:d8:2f31:700:3851:c66a:b6b9:3490])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e241b70sm164337975e9.18.2025.06.17.00.35.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 00:35:01 -0700 (PDT)
Message-ID: <e09ed520-6b52-4b53-b6bb-dfee8f34be5b@redhat.com>
Date: Tue, 17 Jun 2025 09:35:00 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] gup: introduce unpin_user_folio_dirty_locked()
To: lizhe.67@bytedance.com, alex.williamson@redhat.com,
 akpm@linux-foundation.org, peterx@redhat.com
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20250617041821.85555-1-lizhe.67@bytedance.com>
 <20250617041821.85555-3-lizhe.67@bytedance.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250617041821.85555-3-lizhe.67@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17.06.25 06:18, lizhe.67@bytedance.com wrote:
> From: Li Zhe <lizhe.67@bytedance.com>
> 
> Introduce a new interface, unpin_user_folio_dirty_locked(). This
> interface is similar to unpin_user_folio(), but it adds the
> capability to conditionally mark a folio as dirty. VFIO will utilize
> this interface to accelerate the VFIO DMA unmap process.
> 
> Suggested-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
> ---
>   include/linux/mm.h |  2 ++
>   mm/gup.c           | 27 +++++++++++++++++++++------
>   2 files changed, 23 insertions(+), 6 deletions(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index fdda6b16263b..242b05671502 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -1689,6 +1689,8 @@ void unpin_user_page_range_dirty_lock(struct page *page, unsigned long npages,
>   				      bool make_dirty);
>   void unpin_user_pages(struct page **pages, unsigned long npages);
>   void unpin_user_folio(struct folio *folio, unsigned long npages);
> +void unpin_user_folio_dirty_locked(struct folio *folio,
> +		unsigned long npins, bool make_dirty);
>   void unpin_folios(struct folio **folios, unsigned long nfolios);
>   
>   static inline bool is_cow_mapping(vm_flags_t flags)
> diff --git a/mm/gup.c b/mm/gup.c
> index 84461d384ae2..15debead5f5b 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -360,12 +360,7 @@ void unpin_user_page_range_dirty_lock(struct page *page, unsigned long npages,
>   
>   	for (i = 0; i < npages; i += nr) {
>   		folio = gup_folio_range_next(page, npages, i, &nr);
> -		if (make_dirty && !folio_test_dirty(folio)) {
> -			folio_lock(folio);
> -			folio_mark_dirty(folio);
> -			folio_unlock(folio);
> -		}
> -		gup_put_folio(folio, nr, FOLL_PIN);
> +		unpin_user_folio_dirty_locked(folio, nr, make_dirty);
>   	}
>   }
>   EXPORT_SYMBOL(unpin_user_page_range_dirty_lock);
> @@ -435,6 +430,26 @@ void unpin_user_folio(struct folio *folio, unsigned long npages)
>   }
>   EXPORT_SYMBOL(unpin_user_folio);
>   
> +/**
> + * unpin_user_folio_dirty_locked() - conditionally mark a folio
> + * dirty and unpin it
> + *
> + * @folio:  pointer to folio to be released
> + * @npins:  number of pins
> + * @make_dirty: whether to mark the folio dirty
> + *
> + * Mark the folio as being modified if @make_dirty is true. Then
> + * release npins of the folio.
> + */
> +void unpin_user_folio_dirty_locked(struct folio *folio,
> +		unsigned long npins, bool make_dirty)
> +{
> +	if (make_dirty && !folio_test_dirty(folio))
> +		folio_mark_dirty_lock(folio);
> +	gup_put_folio(folio, npins, FOLL_PIN);
> +}
> +EXPORT_SYMBOL_GPL(unpin_user_folio_dirty_locked);
> +
>   /**
>    * unpin_folios() - release an array of gup-pinned folios.
>    * @folios:  array of folios to be marked dirty and released.

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

