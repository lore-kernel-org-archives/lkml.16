Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD47829405
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 08:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743495573; cv=none; b=Uugh0oOufAfVOaH5sl3u9nGKuWjGQjsrN768JS2XhHF5d9wyo9YZxXokwIxRjw1yn5Pm0svcQI4gyA9I29Ey4JMF+omYtEtgABv2f2BzIBgJYoHTMQsUNhgKmWO54pNCa4zpcjoDJWLuWcZSAwJQuvqluD1h0LTBhZvS7keF7is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743495573; c=relaxed/simple;
	bh=cn4xMCfwVwGDw2+qWWSU7Q3MU7R5jQfj+oDp3f1ZDA4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=km7MGt1sR4Lfn9r0ttnUCmvRqWs8k1DK/Iabl2emF2UxD/lK240bJp2LavgFEzrr/Xc5qXJv46HJHqxTVSsvE+CPbS6OwZUbeW1w5L0BuOqpDEuHNIeDqAv4uJB20NEiyWH/PCwsfJ+0lGP7b9gvDA1l8feL1GQjlhJhAaeN1tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=h7urjNaM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h7urjNaM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743495570;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=G18/0+PB8HRisUibBcwrDtcW76V6IeG/xoloBCihAHg=;
	b=h7urjNaMMh8nl/bekmYhTeFQTKWQvTbX+Zqyy8m3UDETacIn77ybKj5gYZyT6klhsjP2Hi
	pEq1XxAb2ZifhaozfKawUjHsBVq0+WNGygppHp66AtijS+j75IFhIl1bDIB4TE0U7MVgUb
	XGENMBhRAo1k/tc9X2UnAOxi1aGADwI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-185-ydtqR4Z_M92ToJJQKvzuAQ-1; Tue, 01 Apr 2025 04:19:27 -0400
X-MC-Unique: ydtqR4Z_M92ToJJQKvzuAQ-1
X-Mimecast-MFC-AGG-ID: ydtqR4Z_M92ToJJQKvzuAQ_1743495566
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43e9b0fd00cso10181835e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 01:19:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743495566; x=1744100366;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=G18/0+PB8HRisUibBcwrDtcW76V6IeG/xoloBCihAHg=;
        b=eYDF8CCnJ6gq0i3vlwtQgGLeLBygG0J+flZ0PvRnqFfiheA5XULVayP7oaXBeC2Vr2
         eKkU3bsQ5T+g5MrwVPabhjb4A1J2PAFkMGNHYioPSvlPgsFS3jlUhQLeuNWbJ2EtE/yk
         i3NyNVHw2DdztJscazU0JjOh6p5SdUEHOOAOHkq1CrMc05zawy168UE57zrEhlyQye09
         7oVyN8fmoqt2eCu0S52aCRtuLX+QujezVKHqcJl/tLnAaDFI5wewXooY+d0ODjjAR34N
         6ZtUNs2dkJXe+FtgGyeDQfMob5nEvR5R87rFk1pgJhPGonrGwJFK3hrotrzoGQE+z9VF
         yY4g==
X-Forwarded-Encrypted: i=1; AJvYcCXp8/jHjngzHE4rA+0vWgWUlj/tMVSX/Le5Drunt5HtTW0o8d5t65DnBcS9wytkcHUDblNVfP0tTkwKV5o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0V4Wff7r3Y0504JhG0wwXGAckZZxxbRZDu943f5M/LCrPIN4Q
	SLLy7SRTqJkGmybN4w8FyCzzKtF7WAmr8uZzcf4km23ixWHx3eWLU5WyqkHatZWiCKlvJwcwJ+W
	CL4js+weWf75RXrlisJzS4ZPrdKvSZpz6wdtjEu4WZZpZY4tXEnlOE5aKelLK9A==
X-Gm-Gg: ASbGncv/iawwFSHQau8HX6rEW1WlHEasHr+Af8mmFiH9Nup3RhyjIpCadXIiT+2F8Mv
	uWenkf3BhGhtxp+62SOelW/VZnDMENS649+kkb9ThxMMEmbAkUlGTC8BqwY8VQfEyYxDYKd3cFS
	SZEQdksH9ioJZkH1WHpmp/LRUYCVVpOl0lkZKN6PRW0z03e5kaE8PzZXbLrfITjUYvw0xaLS9A8
	fXUmjBFGdOXMcGAzhJt3esIX4kWLWvkVJrKwGSAqqo7RCwpRsGqDu8HI5CQiOgnK47eqtyIsASl
	ckImxwIyfdPd2MVPFUck9yx72ZO40fIsJulKkQ/ou+Yt26iHhqCSeTdHDN4NApOyZ2E4Kcbntei
	ws4jl9it524GsUSEHyDLJj4RIVTwBERxSUfR/FtWp
X-Received: by 2002:a05:600c:3493:b0:43b:c6a7:ac60 with SMTP id 5b1f17b1804b1-43db62b72e4mr108274095e9.10.1743495566313;
        Tue, 01 Apr 2025 01:19:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcxMWf0eFH42cYOGBM0l+MpFvQXIE5mHVNgPmRXj3lSniz+bBk7y+9/3fIfu4fdV5ATwyx/g==
X-Received: by 2002:a05:600c:3493:b0:43b:c6a7:ac60 with SMTP id 5b1f17b1804b1-43db62b72e4mr108273925e9.10.1743495566012;
        Tue, 01 Apr 2025 01:19:26 -0700 (PDT)
Received: from ?IPV6:2003:cb:c707:4d00:6ac5:30d:1611:918f? (p200300cbc7074d006ac5030d1611918f.dip0.t-ipconnect.de. [2003:cb:c707:4d00:6ac5:30d:1611:918f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b66d0dbsm13577415f8f.58.2025.04.01.01.19.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 01:19:25 -0700 (PDT)
Message-ID: <a7fa5bb9-29b5-4323-84c7-646a471dc9da@redhat.com>
Date: Tue, 1 Apr 2025 10:19:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] mm/gup: remove gup_fast_pgd_leaf() and clean up
 the relevant codes
To: Baoquan He <bhe@redhat.com>, akpm@linux-foundation.org
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, yanjun.zhu@linux.dev
References: <20250331081327.256412-1-bhe@redhat.com>
 <20250331081327.256412-5-bhe@redhat.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250331081327.256412-5-bhe@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31.03.25 10:13, Baoquan He wrote:
> In the current kernel, only pud huge page is supported in some
> architectures. P4d and pgd huge pages haven't been supported yet.
> And in mm/gup.c, there's no pgd huge page handling in the
> follow_page_mask() code path. Hence it doesn't make sense to have
> gup_fast_pgd_leaf() in gup_fast code path.

I wonder if that was in place to handle (prepare for) very large hugetlb 
folios. Until a while ago, follow_page_mask() did not have to handle 
these hugetlb folios.

But I assume it never got used.

Acked-by: David Hildenbrand <david@redhat.com>

> 
> Here remove gup_fast_pgd_leaf() and clean up the relevant codes.
> 
> Signed-off-by: Baoquan He <bhe@redhat.com>
> ---
>   mm/gup.c | 49 +++----------------------------------------------
>   1 file changed, 3 insertions(+), 46 deletions(-)
> 
> diff --git a/mm/gup.c b/mm/gup.c
> index a15317cf6641..58cdc5605a4a 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -3168,46 +3168,6 @@ static int gup_fast_pud_leaf(pud_t orig, pud_t *pudp, unsigned long addr,
>   	return 1;
>   }
>   
> -static int gup_fast_pgd_leaf(pgd_t orig, pgd_t *pgdp, unsigned long addr,
> -		unsigned long end, unsigned int flags, struct page **pages,
> -		int *nr)
> -{
> -	int refs;
> -	struct page *page;
> -	struct folio *folio;
> -
> -	if (!pgd_access_permitted(orig, flags & FOLL_WRITE))
> -		return 0;
> -
> -	BUILD_BUG_ON(pgd_devmap(orig));
> -
> -	page = pgd_page(orig);
> -	refs = record_subpages(page, PGDIR_SIZE, addr, end, pages + *nr);
> -
> -	folio = try_grab_folio_fast(page, refs, flags);
> -	if (!folio)
> -		return 0;
> -
> -	if (unlikely(pgd_val(orig) != pgd_val(*pgdp))) {
> -		gup_put_folio(folio, refs, flags);
> -		return 0;
> -	}
> -
> -	if (!pgd_write(orig) && gup_must_unshare(NULL, flags, &folio->page)) {
> -		gup_put_folio(folio, refs, flags);
> -		return 0;
> -	}
> -
> -	if (!gup_fast_folio_allowed(folio, flags)) {
> -		gup_put_folio(folio, refs, flags);
> -		return 0;
> -	}
> -
> -	*nr += refs;
> -	folio_set_referenced(folio);
> -	return 1;
> -}
> -
>   static int gup_fast_pmd_range(pud_t *pudp, pud_t pud, unsigned long addr,
>   		unsigned long end, unsigned int flags, struct page **pages,
>   		int *nr)
> @@ -3302,12 +3262,9 @@ static void gup_fast_pgd_range(unsigned long addr, unsigned long end,
>   		next = pgd_addr_end(addr, end);
>   		if (pgd_none(pgd))
>   			return;
> -		if (unlikely(pgd_leaf(pgd))) {
> -			if (!gup_fast_pgd_leaf(pgd, pgdp, addr, next, flags,
> -					       pages, nr))
> -				return;
> -		} else if (!gup_fast_p4d_range(pgdp, pgd, addr, next, flags,
> -					       pages, nr))
> +		BUILD_BUG_ON(pgd_leaf(pgd));
> +		if (!gup_fast_p4d_range(pgdp, pgd, addr, next, flags,
> +					pages, nr))
>   			return;
>   	} while (pgdp++, addr = next, addr != end);
>   }
-- 
Cheers,

David / dhildenb

