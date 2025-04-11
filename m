Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45381D5ACF
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 13:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744379078; cv=none; b=kfz3dlKWAN9gzyNUzTtbbs83BPo2zz5+rhfh8s5IIBivX+qoma0RBB47owVUh39KQK13gVZ52wCwlSZ2ZsbQAoyhDBO8utwtXjsSHbeui7ZzAbzQ51VouYC3DWwPzWKBMDQFfs2hAH3od89q1uHZSTPdi87/o8mER8vLqIf45Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744379078; c=relaxed/simple;
	bh=9X4U0MWjUXcaNCXw519/Y0/KO9YHMEPje1xQB3V5x/Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p/iVAhYTljPhC5I2aJKxBRBdmS5H32PWkclVQV/CZQWhiZYFtvbHZNGxRYNRP+p8T1WaNBpBrBPbkHiy99o2g12DjdqI1bXATvNFZ/aCJN0jf3lhP1a9a1cNn4aG12XKYfIkY0WQc3cfwYb04PidO9+Rniyrx2DE850beE6TUf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H8wF5pnO; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H8wF5pnO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744379075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=0d9qVVCDCQtie967IphgtK5PqSNxxtepQv9FwFQ05dY=;
	b=H8wF5pnO0jeG37I6Jqo7j54X6gSOR801g1EzwDmJGP5DRZ+k4QGYwClSXjxBJD9l2H0KTt
	t1x1fR3A3mvZXsTIPHDKPM34fX9bkOJAsvTwlbfRy4jeTb2IkT7vl0bqpcpWWjepqn11aQ
	Qw0cLgByyQ9BN7snBcqecZe0SjSQL2A=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-237-4mmNx8AZN6SORYs4MpUTOA-1; Fri, 11 Apr 2025 09:44:34 -0400
X-MC-Unique: 4mmNx8AZN6SORYs4MpUTOA-1
X-Mimecast-MFC-AGG-ID: 4mmNx8AZN6SORYs4MpUTOA_1744379073
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43cf327e9a2so17869585e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 06:44:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744379073; x=1744983873;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0d9qVVCDCQtie967IphgtK5PqSNxxtepQv9FwFQ05dY=;
        b=CmUvtrA+60M2czEDKEvyNAvftI5MmaVGIaB9RfvxuBBhH7xUWIIZ5V7KW8VluILWBB
         a07Ax8V5uFXlS0i/yMf9PrtbwXjoDYipm5qGZLwLU6S3l48K7jX1IDscZU8gmZKDAqFQ
         kpLL7t7GtdtXWrDau8r+dwKXFrPMjrHtWyGQSSpjdyI08aQ00fCJW3aV+MxCQj2hDHdF
         lZKPd9iHXnnLisLsMJMZihHF8L/nemDCb4wOyjT13lmBk1P6qW0l/3ETmIeZkoHsPuoF
         pyXkXbCVn4QQIO/KSy8ZO+nx7blA4w8OyWu10A5thdVaqd4ZNNebPXEnxVJI6JFOTD0/
         v6aQ==
X-Forwarded-Encrypted: i=1; AJvYcCVM5p/ggT67x+D7OMmWEpsUvF36/4Y30MWN/aVUqrNG3BXi4NswUyG2iKcI76zFNg75doMG/x30D+xerKM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDZ0iOGdmUDCsAeUaw8IUPap9bsLEZh6OeUp3bdbyh65ZifIEL
	NafVFPGGLkgOz+tV/Du/2JwwmOqthjUs+a4cDRZ5sHmAv0DjYftjppg1YgICJe+XL7W1WIJCl7B
	YHlvy+TPm4LUJZIiBzeaf/lDkOIG5u8KyGfOTY0g+SJF7gRpHYhgjvnjwejwMk1MPAyAL0y7s
X-Gm-Gg: ASbGnct8zMYNvPnvbF9ILpU6QpK3s3ZwnqkVb/O6zSzUVaB423AQXrQ01YvUHF5vPlM
	Hz3hAgh9+/gIeQFOA1Yt1fygUQfcz0y9v8dPgfZhaCJ5tPPOjg6agbslRxOpK2lf1kjnR6owxzK
	d5k41W8RvtxNcBAMtY5hka5Ue2cLqDTwnoerLsaNnHbB76DpcSEIN9Rs1gDZ0gSSNzczFliqxL7
	sWjr8f01TvntwItmh2kHtamC9ydXizTR5CBIxi9sLrUSUNuD5T9qjjU2VeHM2Dw/lN2Xworx0SU
	FJNLEE6gDYXw8wD3/w9fEZeeKmo7aQFIIoiLNS8lM1cR41NtEg5+5Y9GfaU/inemOy/+73HUUKC
	pxTXZV5b5oTXHY15EVgCkIcAHLybBqLyRp0LI
X-Received: by 2002:a05:6000:240b:b0:39d:8153:fde5 with SMTP id ffacd0b85a97d-39ea51f4ea7mr2490931f8f.24.1744379073154;
        Fri, 11 Apr 2025 06:44:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGO9gj31P4qLoLC9G/vsH0DExRXoVl21CZ0qV6WS97QdG7mwkJy3GtrAFZAHtWLoKRCnJoNOA==
X-Received: by 2002:a05:6000:240b:b0:39d:8153:fde5 with SMTP id ffacd0b85a97d-39ea51f4ea7mr2490909f8f.24.1744379072753;
        Fri, 11 Apr 2025 06:44:32 -0700 (PDT)
Received: from ?IPV6:2003:cb:c726:6800:7ddf:5fc:2ee5:f08a? (p200300cbc72668007ddf05fc2ee5f08a.dip0.t-ipconnect.de. [2003:cb:c726:6800:7ddf:5fc:2ee5:f08a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae978018sm2029422f8f.49.2025.04.11.06.44.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 06:44:32 -0700 (PDT)
Message-ID: <f0373427-b4e8-4612-b668-980d93febe26@redhat.com>
Date: Fri, 11 Apr 2025 15:44:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm,hugetlb: Allocate frozen pages in
 alloc_buddy_hugetlb_folio
To: Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Muchun Song <muchun.song@linux.dev>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>,
 Matthew Wilcox <willy@infradead.org>
References: <20250411132359.312708-1-osalvador@suse.de>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250411132359.312708-1-osalvador@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11.04.25 15:23, Oscar Salvador wrote:
> alloc_buddy_hugetlb_folio() allocates a rmappable folio, then strips the
> rmappable part and freezes it.
> We can simplify all that by allocating frozen pages directly.
> 
> Suggested-by: Vlastimil Babka <vbabka@suse.cz>
> Signed-off-by: Oscar Salvador <osalvador@suse.de>
> ---
>   mm/hugetlb.c | 17 +----------------
>   1 file changed, 1 insertion(+), 16 deletions(-)
> 
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index e3e6ac991b9c..83fa2b9f6fc4 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -1950,7 +1950,6 @@ static struct folio *alloc_buddy_hugetlb_folio(struct hstate *h,
>   	int order = huge_page_order(h);
>   	struct folio *folio;
>   	bool alloc_try_hard = true;
> -	bool retry = true;
>   
>   	/*
>   	 * By default we always try hard to allocate the folio with
> @@ -1965,22 +1964,8 @@ static struct folio *alloc_buddy_hugetlb_folio(struct hstate *h,
>   		gfp_mask |= __GFP_RETRY_MAYFAIL;
>   	if (nid == NUMA_NO_NODE)
>   		nid = numa_mem_id();
> -retry:
> -	folio = __folio_alloc(gfp_mask, order, nid, nmask);
> -	/* Ensure hugetlb folio won't have large_rmappable flag set. */
> -	if (folio)
> -		folio_clear_large_rmappable(folio);
>   
> -	if (folio && !folio_ref_freeze(folio, 1)) {
> -		folio_put(folio);
> -		if (retry) {	/* retry once */
> -			retry = false;
> -			goto retry;
> -		}
> -		/* WOW!  twice in a row. */
> -		pr_warn("HugeTLB unexpected inflated folio ref count\n");
> -		folio = NULL;
> -	}
> +	folio = (struct folio *)__alloc_frozen_pages(gfp_mask, order, nid, nmask);
>   
>   	/*
>   	 * If we did not specify __GFP_RETRY_MAYFAIL, but still got a

I assume htlb_alloc_mask() will always include _GFP_COMP.

But semantically, it might be wrong: __folio_alloc() will in the memdesc 
world also make sure to allocate the memdesc, __alloc_frozen_pages() not.

Maybe one would want a __alloc_frozen_folio() .... @willy?

-- 
Cheers,

David / dhildenb

