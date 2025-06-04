Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D7928D828
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 10:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749031648; cv=none; b=eCvFSR6i7qwRouMGtTvmoq5cUH2IR2Qy1aDBAkFt104DjChC3VBr5SB11ze8bIIqFeOaAVWkYgwhxGQBNNVngDtdxbZSyj06sEP3mgnjpsVbFE6DOFSncdIcSzsUpHSRmzqT7gP9UjgG+dsGRu3HREgiAmSex/7csu4zszO/39E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749031648; c=relaxed/simple;
	bh=12SlAVxWL49IT3DlM/LrsD+2sJP1//rmG4q4/hAXMd4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WE1VvC5i4ubJbFPWH3y4xpbLQ2ucWGPw8VS+xQ+dSyEVcjSggETZLrcjc7mdbTBLNyXN6PmNNYFHoScU2EFN5zb7ND0ePf+ChlGMOyfx/Vdo1Mvb52QT7KsjI+dUdBXTUtMJA4fRg6HhINrTIfiTjJ+WiSqyUcCW4OaME7c7kXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bLT7tM+T; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bLT7tM+T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749031645;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=7PRfniGheLvssRHrIJEaU1qt06uo8ioIfyXuvxIrE6A=;
	b=bLT7tM+TiyvsSZJ8R0HXmV0xYMG0gwc9YIfwYU4vm40ZJO4RYOtxDDc4Ocrfqzxmgc5Wk8
	A4afuOttdL0+BREnG2L5AzKBnncPVUDmhNWg0eMTWLQRS2rlzJ5iaodjvPSMR2NREK9myI
	5SW2umENqgI1nvvcmMJ4VIkxOMJw25Y=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-368-vAoOVoNrOQe9Gfal9m4_Kg-1; Wed, 04 Jun 2025 06:07:24 -0400
X-MC-Unique: vAoOVoNrOQe9Gfal9m4_Kg-1
X-Mimecast-MFC-AGG-ID: vAoOVoNrOQe9Gfal9m4_Kg_1749031643
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-450dada0f83so38734705e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 03:07:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749031643; x=1749636443;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7PRfniGheLvssRHrIJEaU1qt06uo8ioIfyXuvxIrE6A=;
        b=mje6yjB3slp1f2yAlH38t4q11cMCQTH96vw4lliFDKnHqEoR+RCYZFwwHgFCTDyk7t
         GJnZd+aBlei369BnOVq0URkKXVRLNXKfvr2WpfDjG9ZMaRpoWy6kNUE1llYYgUtaJdVr
         nz83zk6BdVpJwArD2fA6huj1JAoaAeFG1peiSgf1e/gRrVrL6LISCg6hJDJvVnWzqntj
         OHK1oF7xNN31sUcZcbqGdXAqRN7oFEIB+wwVphi4/iW35GqVUgLnk4IPciaEZN8q7wR5
         lCPSinYJ8zQvsazCf/YF0LZSMpgKF+CWKIPwp04qO4gfnZXGv/1CzIuLgdPFMebRB2s+
         rqIg==
X-Forwarded-Encrypted: i=1; AJvYcCUYL1+MUqt1Gec/lUk9y9VweJSa4/9yG9ZJjQ9yk/+7jzdqtsQpf76XUgJRXX+bLrDJOAJm5nOpRDUTOJ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGeI0raA7nv5mMO/o6ek37nhoq1FNFRFiICKxWS++lkTqU+izA
	4c5NuzJ9H/NoF2WtCZuP+V3jBCDMiFQfj4M2w9VSSOVEw14wCiNy8x+IWDcg03bSRNS7EhfZHvW
	+y2lWDF+gZCWgsOLwESfFetsyF8FgCg55SeJXOHlzUetyeIujRgVjbrSrQIWkme7Vpg==
X-Gm-Gg: ASbGnctKf8Kn6jcC+Ka4nMW9g8yOfMLeKx/qtq8Uk4Vc7fkM+KfpwMF8XaxcZtNsgwr
	SqpbSWqePNVFo9Df5aP5mTLSi9Ca5bl4QZNnj8JIy/+lLQ0vTyf0HMPtez7enwpSO5dakJ8b+wG
	89F4wrMn9gEEcN+Ys/zhMxyPDTqHL3/OYfb9RzY29aImpfheSfQFRXJNTK1O5dX+YoBKcIHLU5Q
	0kRwMwaz8vmF6W1ge2Uxjc3Im5iJ1KJK9M47HfbbmF19MpB+Ab7+LaF42hNKRTfuAbCm9Ejn5S2
	aUZiFUjXJCRVWa0Nf4wMjNHwCjECD1e5NFghEsNiVagf1CDBpK/gPVjshNbsWbrvmdYmg7hTPA2
	RCDMw85vIrMqlesEp/87CYJTALW03SDYjmY3+o6blfDejGqa4/w==
X-Received: by 2002:a05:600c:a015:b0:450:d37c:9fc8 with SMTP id 5b1f17b1804b1-451f0a74191mr18412185e9.13.1749031643158;
        Wed, 04 Jun 2025 03:07:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7o2bEYM4OLlTeV0JBA6sp6f4ZXgEdhRDuQC/nWLoEHV+qeqnF/gO2YE9gGAKeTmJLS62Qxg==
X-Received: by 2002:a05:600c:a015:b0:450:d37c:9fc8 with SMTP id 5b1f17b1804b1-451f0a74191mr18411865e9.13.1749031642639;
        Wed, 04 Jun 2025 03:07:22 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f1b:b800:6fdb:1af2:4fbd:1fdf? (p200300d82f1bb8006fdb1af24fbd1fdf.dip0.t-ipconnect.de. [2003:d8:2f1b:b800:6fdb:1af2:4fbd:1fdf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d8006613sm201595465e9.28.2025.06.04.03.07.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 03:07:22 -0700 (PDT)
Message-ID: <fa9d72ac-1b46-4a09-8f29-af97f2ca6e2e@redhat.com>
Date: Wed, 4 Jun 2025 12:07:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: gup: fail migration when no migratable page to
 prevent CMA pinning
To: Hyesoo Yu <hyesoo.yu@samsung.com>
Cc: janghyuck.kim@samsung.com, zhaoyang.huang@unisoc.com,
 jaewon31.kim@gmail.com, Andrew Morton <akpm@linux-foundation.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
 Peter Xu <peterx@redhat.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <CGME20250604095242epcas2p17032a1133b03be2d24c8ebcff94d1d55@epcas2p1.samsung.com>
 <20250604095049.4052078-1-hyesoo.yu@samsung.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250604095049.4052078-1-hyesoo.yu@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04.06.25 11:50, Hyesoo Yu wrote:
> Commit 1aaf8c122918 ("mm: gup: fix infinite loop within __get_longterm_locked")
> caused CMA pages to become pinned in some cases when handling longterm GUP.
> This happened because migration would return success immediately if no pages
> were in the movable_page_list, without retrying.
> 
> However, CMA pages can be temporarily off the LRU (e.g., in pagevecs), and

A better example might be concurrent isolation. Just imagine two of 
these longterm pinnings racing.

> therefore not appear in movable_page_list, even though they can be migrated
> later. Before commit 1aaf8c, the kernel would retry migration in such cases,
> which helped avoid accidental CMA pinning.
> 
> The commit 1aaf8c aimed to support an out-of-tree use case (like pKVM), where
> longterm GUP was applied to non-LRU CMA pages. But allowing CMA pinning
> in general for this corner case could lead to more fragmentation and
> reliability issues. So this patch prevents that.
> 
> Instead of retrying, this patch explicitly fails the migration attempt
> (-EBUSY) if no movable pages are found and unpinnable pages remain.
> This avoids infinite loops and gives user a clear signal to retry,
> rather then spinning inside kernel.

Hmmm, that means we will return EBUSY to the caller. Are all users 
actually prepared to deal with that?

So far we only returned EBUSY in this corner-case 
migrate_device_coherent_folio() that most callers never actually trigger.

Maybe we should do EAGAIN for now (old way of doing it?), and look into 
doing EBUSY separately.

> 
> Fixes: 1aaf8c122918 ("mm: gup: fix infinite loop within __get_longterm_locked")
> Signed-off-by: Hyesoo Yu <hyesoo.yu@samsung.com>
> ---
>   mm/gup.c | 49 ++++++++++++++++++++++++++-----------------------
>   1 file changed, 26 insertions(+), 23 deletions(-)
> 
> diff --git a/mm/gup.c b/mm/gup.c
> index e065a49842a8..446938aedcc9 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -2303,12 +2303,13 @@ static void pofs_unpin(struct pages_or_folios *pofs)
>   /*
>    * Returns the number of collected folios. Return value is always >= 0.
>    */

Comment should be removed.

> -static void collect_longterm_unpinnable_folios(
> +static bool collect_longterm_unpinnable_folios(
>   		struct list_head *movable_folio_list,
>   		struct pages_or_folios *pofs)
>   {
>   	struct folio *prev_folio = NULL;
>   	bool drain_allow = true;
> +	bool any_unpinnable = false;
>   	unsigned long i;
>   
>   	for (i = 0; i < pofs->nr_entries; i++) {
> @@ -2321,6 +2322,8 @@ static void collect_longterm_unpinnable_folios(
>   		if (folio_is_longterm_pinnable(folio))
>   			continue;
>   
> +		any_unpinnable = true;
> +
>   		if (folio_is_device_coherent(folio))
>   			continue;
>   
> @@ -2342,6 +2345,8 @@ static void collect_longterm_unpinnable_folios(
>   				    NR_ISOLATED_ANON + folio_is_file_lru(folio),
>   				    folio_nr_pages(folio));
>   	}
> +
> +	return any_unpinnable;
>   }
>   
>   /*
> @@ -2353,8 +2358,13 @@ static int
>   migrate_longterm_unpinnable_folios(struct list_head *movable_folio_list,
>   				   struct pages_or_folios *pofs)
>   {
> -	int ret;
> +	int ret = -EAGAIN;
>   	unsigned long i;
> +	struct migration_target_control mtc = {
> +		.nid = NUMA_NO_NODE,
> +		.gfp_mask = GFP_USER | __GFP_NOWARN,
> +		.reason = MR_LONGTERM_PIN,
> +	};

Reverse xmas tree while we're at it.

But, can we do this cleanup here separately, and not as part of the fix?

>   
>   	for (i = 0; i < pofs->nr_entries; i++) {
>   		struct folio *folio = pofs_get_folio(pofs, i);
> @@ -2370,6 +2380,7 @@ migrate_longterm_unpinnable_folios(struct list_head *movable_folio_list,
>   			gup_put_folio(folio, 1, FOLL_PIN);
>   
>   			if (migrate_device_coherent_folio(folio)) {
> +				pofs_unpin(pofs);
>   				ret = -EBUSY;
>   				goto err;
>   			}
> @@ -2388,27 +2399,11 @@ migrate_longterm_unpinnable_folios(struct list_head *movable_folio_list,
>   		pofs_clear_entry(pofs, i);
>   	}
>   
> -	if (!list_empty(movable_folio_list)) {
> -		struct migration_target_control mtc = {
> -			.nid = NUMA_NO_NODE,
> -			.gfp_mask = GFP_USER | __GFP_NOWARN,
> -			.reason = MR_LONGTERM_PIN,
> -		};
> -
> -		if (migrate_pages(movable_folio_list, alloc_migration_target,
> -				  NULL, (unsigned long)&mtc, MIGRATE_SYNC,
> -				  MR_LONGTERM_PIN, NULL)) {
> -			ret = -ENOMEM;
> -			goto err;
> -		}
> -	}
> -
> -	putback_movable_pages(movable_folio_list);
> -
> -	return -EAGAIN;
> +	if (migrate_pages(movable_folio_list, alloc_migration_target, NULL,
> +			  (unsigned long)&mtc, MIGRATE_SYNC, MR_LONGTERM_PIN, NULL))
> +		ret = -ENOMEM;
>   
>   err:
> -	pofs_unpin(pofs);
>   	putback_movable_pages(movable_folio_list);
>   
>   	return ret;
> @@ -2417,11 +2412,19 @@ migrate_longterm_unpinnable_folios(struct list_head *movable_folio_list,
>   static long
>   check_and_migrate_movable_pages_or_folios(struct pages_or_folios *pofs)
>   {
> +	bool any_unpinnable;
> +
>   	LIST_HEAD(movable_folio_list);
>   
> -	collect_longterm_unpinnable_folios(&movable_folio_list, pofs);
> -	if (list_empty(&movable_folio_list))
> +	any_unpinnable = collect_longterm_unpinnable_folios(&movable_folio_list, pofs);
> +
> +	if (list_empty(&movable_folio_list)) {
> +		if (any_unpinnable) {

/*
  * If we find any longterm unpinnable page that we failed to
  * isolated for migration, it might be because someone else
  * concurrently isolated it. Make the caller retry until it
  * succeeds.
  */


> +			pofs_unpin(pofs);
> +			return -EBUSY;
> +		}
>   		return 0;
> +	}
>   
>   	return migrate_longterm_unpinnable_folios(&movable_folio_list, pofs);
>   }


-- 
Cheers,

David / dhildenb

