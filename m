Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C711E834B
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 12:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748262246; cv=none; b=G2vOhFKt69TvSBY75+fCyLe0Jl+pgKyrcmLu9fWD5RlfM7n63WpBV6+roPhl+FKxxZxkXw1MmS6OlaVHR6vKnHdqTn8yLupziUPiccipzzfQqF4o+DzTySemKCxY4dacZNlicNuCSRwwn1yPCG9XOLmzLtApk9UA0nbezkk1M5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748262246; c=relaxed/simple;
	bh=ztFgBMUTJ0FW3msAWaAlWOios7p3gwv7RgLc/TKzPvI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=lMV92UJABz3a6NjsKf9N/DT0wBBiVD+2uXBhIgFckLf12EzxyyJjE3UjDlHE/93YN5L4+BG6S5HAIPONJ/16vQ2ZlhrDrEgjCAb81lRB3mAbl8UTi54uGl9xco1rvEdq+Nee3QrK0bhaERqc9VzRqR3+sO40pWNJQwTUngh27Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D/eJNjUJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D/eJNjUJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748262243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=f1hUbLfWBJa++NBQk5ASCDVxczZvEsEV/qvkLyROOug=;
	b=D/eJNjUJfcfAbVhes9QtxY5f21XwWVU8A/14AW0t9vwULJLLZQFOrxMZDjf834ttA2UGc7
	P56RS1xMkGBP+CqTtWXoQaGxP+VOsQA6bKcVv98T22+WL9LyeKLIuZBsrAnGRCJk5hIUJx
	8kEcC9OJD7Ll2k3B6oW0ahwx53eZRTk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-16-hIXBW-YoMPe2FNzcSVrTwg-1; Mon, 26 May 2025 08:24:01 -0400
X-MC-Unique: hIXBW-YoMPe2FNzcSVrTwg-1
X-Mimecast-MFC-AGG-ID: hIXBW-YoMPe2FNzcSVrTwg_1748262241
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-441d438a9b7so14514625e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 05:24:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748262240; x=1748867040;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=f1hUbLfWBJa++NBQk5ASCDVxczZvEsEV/qvkLyROOug=;
        b=BPuMwx/QZ/edM/898jo1cPY/M8kTqwTAccmyDmkV+zrStJYybqaDy1vXU7J9/mdTyR
         A+D4ctRNh5Bvx9vhghIvFF+bdBV1tzp8xakLosTSIFHCJkK4zTJlI/cZoJZhq+wZ6H7B
         volNLI8MbhGVqOKKWg7MgF8rrrvSEdL5t/zbrNvq6KNCxojpM3WTwET400QJyKo5sQzI
         hj77EPsbMdMQGKjQwN78vRl0yhNVrFXAKEKUi/Cm4/xsiMxzpIvFAZORG68vgZpX+2OT
         PDXQ7UYxYy+2D0W7/ZKYWiuCx95N0HHQ63rS9BFxsF+PSIBvHz6HrDlu/cTh5mFxv7JE
         uDgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtjiz0DXBYITepm8qOitFG+OUTAWS82teHvUjK/ChmDiTCim9B5JTUpDE0TChwUzY0Iv+beTr8EvNwWjY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzT/pknz2uVqEufMAdmTBA1dZy81mdZLGZfSJPzcYpBXKCx5dUh
	Dhm2W3QYbwAgFIAOyBx7puPym9TeMFP0fNsaRS49PId5i7/wFj801ZMxn0+4YLjxD2g6tmXpN+d
	fDGt0fsN5d/KMx+CpWfeL4RsIF2DYB73eJVjZB0uEheEBKi6vRnl+c3DBobPFZu2/2w==
X-Gm-Gg: ASbGncvbfnv0zmdpFoF9nH2UBkJrmc5YGjd6I3A//NZVGcrLPYJvISSMQXOAi3lxMhC
	+LVnFQR60Phlm1AqdmItw0KFFvscpYsD6aKWwO2dCnA6X8dPoSNNx5i8gVv2gDKGcBuVnyYjo21
	hkly3MY0nVr+0u0WhWPlIvwW9+AWxT4o7ZcsvZKwIEQ26IjUi9OIVYYuEyMXqqYAH7tpBPXGtHe
	zt8M74QRrlg6Rv9gi34SERyNLerc/3AdaDYyhS6xLiT42/vJWO5HQwJ7hiQVD0GUDp0xe43zwih
	F4vYctB+u2Usza0VINGEDUelYgxZQPQ1o7MOeEXQiU9lgOPBAV4VrBRPLhveulSBD7gnXSk6Z9N
	989DEIfC/rneUei3gzevLdXtH0CnlG47lng7ttAo=
X-Received: by 2002:a05:6000:18a8:b0:3a3:6478:e08 with SMTP id ffacd0b85a97d-3a4ca544f78mr7973477f8f.23.1748262240548;
        Mon, 26 May 2025 05:24:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCd+TDq8gpbIs+tC4tvt576LzOqo/K2mmtAv7N2bHG5fgvQDVY0iA2xsAsXn3MxRT60vvaKg==
X-Received: by 2002:a05:6000:18a8:b0:3a3:6478:e08 with SMTP id ffacd0b85a97d-3a4ca544f78mr7973449f8f.23.1748262240079;
        Mon, 26 May 2025 05:24:00 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f19:6500:e1c1:8216:4c25:efe4? (p200300d82f196500e1c182164c25efe4.dip0.t-ipconnect.de. [2003:d8:2f19:6500:e1c1:8216:4c25:efe4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4d9982c96sm2595262f8f.64.2025.05.26.05.23.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 05:23:59 -0700 (PDT)
Message-ID: <347b3035-26fe-43af-8df4-b1610d305908@redhat.com>
Date: Mon, 26 May 2025 14:23:58 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/hugetlb: remove redundant folio_test_hugetlb
From: David Hildenbrand <david@redhat.com>
To: yangge1116@126.com, akpm@linux-foundation.org
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 21cnbao@gmail.com,
 baolin.wang@linux.alibaba.com, muchun.song@linux.dev, osalvador@suse.de,
 liuzixing@hygon.cn
References: <1747987559-23082-1-git-send-email-yangge1116@126.com>
 <427043ca-ae91-4386-8ffd-aaf164773226@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <427043ca-ae91-4386-8ffd-aaf164773226@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26.05.25 14:20, David Hildenbrand wrote:
> On 23.05.25 10:05, yangge1116@126.com wrote:
>> From: Ge Yang <yangge1116@126.com>
>>
>> In the isolate_or_dissolve_huge_folio() function, the folio_test_hugetlb()
>> function is called to determine whether a folio is a hugetlb folio.
>> However, in the subsequent alloc_and_dissolve_hugetlb_folio() function,
>> the folio_test_hugetlb() function is called again to make the same
>> determination about whether the folio is a hugetlb folio. It appears that
>> the folio_test_hugetlb() check in the isolate_or_dissolve_huge_folio()
>> function can be removed. Additionally, a similar issue exists in the
>> replace_free_hugepage_folios() function, and it should be addressed as
>> well.
>>
>> Suggested-by: Oscar Salvador <osalvador@suse.de>
>> Signed-off-by: Ge Yang <yangge1116@126.com>
>> ---
>>    mm/hugetlb.c | 51 +++++++++++++--------------------------------------
>>    1 file changed, 13 insertions(+), 38 deletions(-)
>>
>> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
>> index 6c2e007..6e46f2f 100644
>> --- a/mm/hugetlb.c
>> +++ b/mm/hugetlb.c
>> @@ -2787,20 +2787,24 @@ void restore_reserve_on_error(struct hstate *h, struct vm_area_struct *vma,
>>    /*
>>     * alloc_and_dissolve_hugetlb_folio - Allocate a new folio and dissolve
>>     * the old one
>> - * @h: struct hstate old page belongs to
>>     * @old_folio: Old folio to dissolve
>>     * @list: List to isolate the page in case we need to
>>     * Returns 0 on success, otherwise negated error.
>>     */
>> -static int alloc_and_dissolve_hugetlb_folio(struct hstate *h,
>> -			struct folio *old_folio, struct list_head *list)
>> +static int alloc_and_dissolve_hugetlb_folio(struct folio *old_folio,
>> +			struct list_head *list)
>>    {
>> -	gfp_t gfp_mask = htlb_alloc_mask(h) | __GFP_THISNODE;
>> +	gfp_t gfp_mask;
>> +	struct hstate *h;
>>    	int nid = folio_nid(old_folio);
>>    	struct folio *new_folio = NULL;
>>    	int ret = 0;
>>    
>>    retry:
>> +	/*
>> +	 * The old_folio might have been dissolved from under our feet, so make sure
>> +	 * to carefully check the state under the lock.
>> +	 */
>>    	spin_lock_irq(&hugetlb_lock);
>>    	if (!folio_test_hugetlb(old_folio)) {
>>    		/*
>> @@ -2829,8 +2833,10 @@ static int alloc_and_dissolve_hugetlb_folio(struct hstate *h,
>>    		cond_resched();
>>    		goto retry;
>>    	} else {
>> +		h = folio_hstate(old_folio);
>>    		if (!new_folio) {
>>    			spin_unlock_irq(&hugetlb_lock);
>> +			gfp_mask = htlb_alloc_mask(h) | __GFP_THISNODE;
>>    			new_folio = alloc_buddy_hugetlb_folio(h, gfp_mask, nid,
>>    							      NULL, NULL);
>>    			if (!new_folio)
>> @@ -2874,35 +2880,20 @@ static int alloc_and_dissolve_hugetlb_folio(struct hstate *h,
>>    
>>    int isolate_or_dissolve_huge_folio(struct folio *folio, struct list_head *list)
>>    {
>> -	struct hstate *h;
>>    	int ret = -EBUSY;
>>    
>>    	/*
>> -	 * The page might have been dissolved from under our feet, so make sure
>> -	 * to carefully check the state under the lock.
>> -	 * Return success when racing as if we dissolved the page ourselves.
>> -	 */
>> -	spin_lock_irq(&hugetlb_lock);
>> -	if (folio_test_hugetlb(folio)) {
>> -		h = folio_hstate(folio);
>> -	} else {
>> -		spin_unlock_irq(&hugetlb_lock);
>> -		return 0;
>> -	}
>> -	spin_unlock_irq(&hugetlb_lock);
>> -
>> -	/*
>>    	 * Fence off gigantic pages as there is a cyclic dependency between
>>    	 * alloc_contig_range and them. Return -ENOMEM as this has the effect
>>    	 * of bailing out right away without further retrying.
>>    	 */
>> -	if (hstate_is_gigantic(h))
>> +	if (folio_order(folio) > MAX_PAGE_ORDER)
>>    		return -ENOMEM;
>>    
>>    	if (folio_ref_count(folio) && folio_isolate_hugetlb(folio, list))
>>    		ret = 0;
>>    	else if (!folio_ref_count(folio))
>> -		ret = alloc_and_dissolve_hugetlb_folio(h, folio, list);
>> +		ret = alloc_and_dissolve_hugetlb_folio(folio, list);
>>    
>>    	return ret;
>>    }
>> @@ -2916,7 +2907,6 @@ int isolate_or_dissolve_huge_folio(struct folio *folio, struct list_head *list)
>>     */
>>    int replace_free_hugepage_folios(unsigned long start_pfn, unsigned long end_pfn)
>>    {
>> -	struct hstate *h;
>>    	struct folio *folio;
>>    	int ret = 0;
>>    
>> @@ -2925,23 +2915,8 @@ int replace_free_hugepage_folios(unsigned long start_pfn, unsigned long end_pfn)
>>    	while (start_pfn < end_pfn) {
>>    		folio = pfn_folio(start_pfn);
>>    
>> -		/*
>> -		 * The folio might have been dissolved from under our feet, so make sure
>> -		 * to carefully check the state under the lock.
>> -		 */
>> -		spin_lock_irq(&hugetlb_lock);
>> -		if (folio_test_hugetlb(folio)) {
>> -			h = folio_hstate(folio);
>> -		} else {
>> -			spin_unlock_irq(&hugetlb_lock);
>> -			start_pfn++;
>> -			continue;
>> -		}
>> -		spin_unlock_irq(&hugetlb_lock);
> 
> ^ oh my, that is bad code.
> 
> Taking the hugetlb_lock for each and ever page in the range.
> 
> Let me find that code and nack it.

Already in 6.15, gah.

Please convert that code to never ever take any hugeglb locks unless we 
are clearly dealing with a hugetlb folios.

-- 
Cheers,

David / dhildenb

