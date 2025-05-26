Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D25236124
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 12:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748262015; cv=none; b=DdhUt8AsrC5UfNHG/25PuSV2DT/A8+Eu1THojYSvMiK0iCl+1Cxl4Cnyf9JmcqWRXGm3xY+MPlJDCZDRf+xT5qSL1yZ6gH3ZLtSvHjUseuXmDza4ZjLucStxMbFi5aSuCw9cdvnby7/LI58XDn1wUy80E0VA4dX2/di5tN2aQBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748262015; c=relaxed/simple;
	bh=yqfENcnYY6pPSr0BmRQuvKvsQ0QUFO+ORW/4MIJ2J60=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dgv0CL9Zcx05UPpl6Z21ALUIF9/1pBgFKS2slyMEj8aXYaKexkOjttVKgoPlf4Copm4oNUjY3A8bTEzq5vof1F9BS8gCBKaiG89kbT/fTq4Km0sLsZVGkI7okz/e3Wr0Dlf6OlNjWytS+LZSkYRGzpRmg3XCMGZgRfDcWkejNvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=E4a1jF+9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E4a1jF+9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748262012;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=5A2Q+CMJCDRak53L6Qj3+f+0q3AUDd7oUCnA/5x2UK8=;
	b=E4a1jF+9O2BqG/VFTzAoiff/vYGn5Gbp1gc6hour2yGjeo8gITwruVPEpp0nJfpuIf8bdp
	S96zDouf2VBOmKN7o5ITfMc7A4sjpO5bAb5WjWTTh1GtnFUZziJIFmzwfvwpPrI7IXOxR2
	gzwBf1eigWa5i/Na3B7AN3N7xn8ZEmE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-118-KaY0O_LeMzC8qpRQdl4AsA-1; Mon, 26 May 2025 08:20:11 -0400
X-MC-Unique: KaY0O_LeMzC8qpRQdl4AsA-1
X-Mimecast-MFC-AGG-ID: KaY0O_LeMzC8qpRQdl4AsA_1748262010
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43e9b0fd00cso11416195e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 05:20:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748262010; x=1748866810;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5A2Q+CMJCDRak53L6Qj3+f+0q3AUDd7oUCnA/5x2UK8=;
        b=Di8LlB8GHiJ3lwLNKzYb1Q2ZhHVPjSTkufUR8R/SY1oux42JVbqmF9YmDdetVtbp+W
         XS2/DEHPNEIq7JlONIgNawM2zAROoXyb3pheY1vtU5Q8Z83GPwHDpl5TXqem0lnpcSrE
         AiSO47h7FaWnGUpvlXy2Holq2wYKo7xmmWxxxet6uEli6FZ6LXXSfcghEu2VPXK7NC/Y
         SYsM+v4JJeh1hGwFoF9jezCXfDjZAKn1KLVdDXMVQGPbaTrxxpujAAPLLDa3gkRc0zwc
         Ik9P7D9NC23WpdkR0lbpxMKlYY7ik8Eopimsoz9/J42ZtTpJeZ6Mkpv9IaFbBNCuWkwy
         d43Q==
X-Forwarded-Encrypted: i=1; AJvYcCW06tgLYqhdXSv3tnqVzKGJaNU+j3t5la7YO/27qvRcCbrB++XUlDih1kYzqwgjYXJ3dEkHd0CDffJkH0I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsXomkI8nBCtbw3ulYP+Br3JE7tgwYyVnij3e+abXOEDmf/iMx
	wNMeDuOh8Unv7jE18kHVBmLkSY1L7QzxM2HlV92n0RXToI9d4J9xdHWIdvd7wdcgYpqbVxaOPIN
	Xw9W0y6ITurGrbnRaCbS89aTNh1YvolHC6LsrnCR9Cm8pLTVdv0vZOocmE4uM2mA2VQ==
X-Gm-Gg: ASbGncsVbQFbGugMOWB4j4DWQ6Co5lpGTgHB5IrtZH7k2AkBDy3UFQA8ZW/k5mzI3hj
	0KdAZbaydGxjUswJLX9/7Iwl44rwTI8aYvyUTrDB9WLRBH6Ov9Fnso2OOFTiCJhP+/uppclsyc0
	fIA5IG5BWRuUUtVd9k15QG3eOGTWFRwXOOHlOYsZ3yED7XAi99zdJDh8rAoTPvC2i6/DunWvSlT
	8yDFNjhNyAcO5WDs2wgsNwYI/9ceLeWrN3vjJmEYO1o+dCQ/K2tb8gkkizJCxsLHrUZhDQJP6nZ
	M1COntLlHozn8w1nrSXDglJOuz5VUfzALJ4l8AsnYajFiVZdcWqIpUjcZ8oaA8cLjPmntgo/k5h
	H/6CUiMEH7RnKA17p7NJnfFFpjoDb96p+SHe65iQ=
X-Received: by 2002:a05:600c:1d0a:b0:43d:186d:a4bf with SMTP id 5b1f17b1804b1-44c77bf3aa2mr71788695e9.0.1748262009723;
        Mon, 26 May 2025 05:20:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsRFNLZeMFPpnKb5K07VvovOYpBuMPYMi3n+XwsliI0gPjkXMgXHAQZo9STCl6QJp5lEPW3g==
X-Received: by 2002:a05:600c:1d0a:b0:43d:186d:a4bf with SMTP id 5b1f17b1804b1-44c77bf3aa2mr71788385e9.0.1748262009270;
        Mon, 26 May 2025 05:20:09 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f19:6500:e1c1:8216:4c25:efe4? (p200300d82f196500e1c182164c25efe4.dip0.t-ipconnect.de. [2003:d8:2f19:6500:e1c1:8216:4c25:efe4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f7bae847sm230898175e9.36.2025.05.26.05.20.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 05:20:08 -0700 (PDT)
Message-ID: <427043ca-ae91-4386-8ffd-aaf164773226@redhat.com>
Date: Mon, 26 May 2025 14:20:06 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/hugetlb: remove redundant folio_test_hugetlb
To: yangge1116@126.com, akpm@linux-foundation.org
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 21cnbao@gmail.com,
 baolin.wang@linux.alibaba.com, muchun.song@linux.dev, osalvador@suse.de,
 liuzixing@hygon.cn
References: <1747987559-23082-1-git-send-email-yangge1116@126.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <1747987559-23082-1-git-send-email-yangge1116@126.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23.05.25 10:05, yangge1116@126.com wrote:
> From: Ge Yang <yangge1116@126.com>
> 
> In the isolate_or_dissolve_huge_folio() function, the folio_test_hugetlb()
> function is called to determine whether a folio is a hugetlb folio.
> However, in the subsequent alloc_and_dissolve_hugetlb_folio() function,
> the folio_test_hugetlb() function is called again to make the same
> determination about whether the folio is a hugetlb folio. It appears that
> the folio_test_hugetlb() check in the isolate_or_dissolve_huge_folio()
> function can be removed. Additionally, a similar issue exists in the
> replace_free_hugepage_folios() function, and it should be addressed as
> well.
> 
> Suggested-by: Oscar Salvador <osalvador@suse.de>
> Signed-off-by: Ge Yang <yangge1116@126.com>
> ---
>   mm/hugetlb.c | 51 +++++++++++++--------------------------------------
>   1 file changed, 13 insertions(+), 38 deletions(-)
> 
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 6c2e007..6e46f2f 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -2787,20 +2787,24 @@ void restore_reserve_on_error(struct hstate *h, struct vm_area_struct *vma,
>   /*
>    * alloc_and_dissolve_hugetlb_folio - Allocate a new folio and dissolve
>    * the old one
> - * @h: struct hstate old page belongs to
>    * @old_folio: Old folio to dissolve
>    * @list: List to isolate the page in case we need to
>    * Returns 0 on success, otherwise negated error.
>    */
> -static int alloc_and_dissolve_hugetlb_folio(struct hstate *h,
> -			struct folio *old_folio, struct list_head *list)
> +static int alloc_and_dissolve_hugetlb_folio(struct folio *old_folio,
> +			struct list_head *list)
>   {
> -	gfp_t gfp_mask = htlb_alloc_mask(h) | __GFP_THISNODE;
> +	gfp_t gfp_mask;
> +	struct hstate *h;
>   	int nid = folio_nid(old_folio);
>   	struct folio *new_folio = NULL;
>   	int ret = 0;
>   
>   retry:
> +	/*
> +	 * The old_folio might have been dissolved from under our feet, so make sure
> +	 * to carefully check the state under the lock.
> +	 */
>   	spin_lock_irq(&hugetlb_lock);
>   	if (!folio_test_hugetlb(old_folio)) {
>   		/*
> @@ -2829,8 +2833,10 @@ static int alloc_and_dissolve_hugetlb_folio(struct hstate *h,
>   		cond_resched();
>   		goto retry;
>   	} else {
> +		h = folio_hstate(old_folio);
>   		if (!new_folio) {
>   			spin_unlock_irq(&hugetlb_lock);
> +			gfp_mask = htlb_alloc_mask(h) | __GFP_THISNODE;
>   			new_folio = alloc_buddy_hugetlb_folio(h, gfp_mask, nid,
>   							      NULL, NULL);
>   			if (!new_folio)
> @@ -2874,35 +2880,20 @@ static int alloc_and_dissolve_hugetlb_folio(struct hstate *h,
>   
>   int isolate_or_dissolve_huge_folio(struct folio *folio, struct list_head *list)
>   {
> -	struct hstate *h;
>   	int ret = -EBUSY;
>   
>   	/*
> -	 * The page might have been dissolved from under our feet, so make sure
> -	 * to carefully check the state under the lock.
> -	 * Return success when racing as if we dissolved the page ourselves.
> -	 */
> -	spin_lock_irq(&hugetlb_lock);
> -	if (folio_test_hugetlb(folio)) {
> -		h = folio_hstate(folio);
> -	} else {
> -		spin_unlock_irq(&hugetlb_lock);
> -		return 0;
> -	}
> -	spin_unlock_irq(&hugetlb_lock);
> -
> -	/*
>   	 * Fence off gigantic pages as there is a cyclic dependency between
>   	 * alloc_contig_range and them. Return -ENOMEM as this has the effect
>   	 * of bailing out right away without further retrying.
>   	 */
> -	if (hstate_is_gigantic(h))
> +	if (folio_order(folio) > MAX_PAGE_ORDER)
>   		return -ENOMEM;
>   
>   	if (folio_ref_count(folio) && folio_isolate_hugetlb(folio, list))
>   		ret = 0;
>   	else if (!folio_ref_count(folio))
> -		ret = alloc_and_dissolve_hugetlb_folio(h, folio, list);
> +		ret = alloc_and_dissolve_hugetlb_folio(folio, list);
>   
>   	return ret;
>   }
> @@ -2916,7 +2907,6 @@ int isolate_or_dissolve_huge_folio(struct folio *folio, struct list_head *list)
>    */
>   int replace_free_hugepage_folios(unsigned long start_pfn, unsigned long end_pfn)
>   {
> -	struct hstate *h;
>   	struct folio *folio;
>   	int ret = 0;
>   
> @@ -2925,23 +2915,8 @@ int replace_free_hugepage_folios(unsigned long start_pfn, unsigned long end_pfn)
>   	while (start_pfn < end_pfn) {
>   		folio = pfn_folio(start_pfn);
>   
> -		/*
> -		 * The folio might have been dissolved from under our feet, so make sure
> -		 * to carefully check the state under the lock.
> -		 */
> -		spin_lock_irq(&hugetlb_lock);
> -		if (folio_test_hugetlb(folio)) {
> -			h = folio_hstate(folio);
> -		} else {
> -			spin_unlock_irq(&hugetlb_lock);
> -			start_pfn++;
> -			continue;
> -		}
> -		spin_unlock_irq(&hugetlb_lock);

^ oh my, that is bad code.

Taking the hugetlb_lock for each and ever page in the range.

Let me find that code and nack it.

> -
>   		if (!folio_ref_count(folio)) {
> -			ret = alloc_and_dissolve_hugetlb_folio(h, folio,
> -							       &isolate_list);
> +			ret = alloc_and_dissolve_hugetlb_folio(folio, &isolate_list);

And we're still doing that there now?

We *really* should have an early folio_test_hugetlb() check and skip 
whatever has no indication of being related to hugetlb.

-- 
Cheers,

David / dhildenb

