Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5FD264634
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 20:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748637430; cv=none; b=fUCCe7+TUQWih1KFRPX4R36Nz2r6J4Ivf40xUW2nuid8p7u9spo3K7GBo4lQGuu0QQwbMZk/WitV22uWuypkmfsH7hJhQU8o8qstEM71lrNr+RuZqySp79DdwVhdKyK1nAbxolAZZxT1jzNRvUeJX0zQBEkyWnMNwQ7rIAzh/kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748637430; c=relaxed/simple;
	bh=Hx5Hb7BaZE/BRzAVgrmaMoYlZJkLBZR0xfFRZJ/ZcOc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CnAjEIUz7rHLUQ6/IAOO0zbkE0vR4ZuQ+5eKYUUy9qUjDI046QDYJiuMJfzaLoyJELUFZcN6alQ1+NWOZB2daYNWwWuTuxtFvIGe5epUsa9t5qyqLP/evRVkfnnFRSeEThi1weRJjZ2BflV1GSFL7ShMZHRw/Tj4vBCilyVSUaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WU4zJ/wV; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WU4zJ/wV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748637427;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=LoFhHwna4DNpF+0tUacKnGF67Gq6Vrdi1+MZRGnB0wk=;
	b=WU4zJ/wVu9qz2s7NNk5CW5qWag8ZFeY2BnKVfJ6pP7n0rVZvBKS5RAH56GgR09uXw8yzm+
	l3wQhKuaZgK7J/w0FIrl3ul7V/QswENT0R8as11l2sauXT9nCwivv0OuW6lHvlWoJbQxGr
	06wmUQ8nuGK4OUcCt11dgG0LxfYtk4Y=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-I9Ek84SxMTKfpIggtk_Hlg-1; Fri, 30 May 2025 16:37:03 -0400
X-MC-Unique: I9Ek84SxMTKfpIggtk_Hlg-1
X-Mimecast-MFC-AGG-ID: I9Ek84SxMTKfpIggtk_Hlg_1748637422
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-440667e7f92so17346575e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 13:37:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748637422; x=1749242222;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LoFhHwna4DNpF+0tUacKnGF67Gq6Vrdi1+MZRGnB0wk=;
        b=PpElXLFUum1tL+iIo+SPxKt4N0aPf7wnES7f3WvvZhpEbpfqTvrCbUN0//uMFY0Fwq
         Or+MujXH/rdRef2WGf/O2lqYHBRZ7OpfUVJH8LxdViYJpdqMZEDxZyGds8eBvHAJXrCE
         Bsvd6VnCHZd4dxhpNKN5h0LljwX6867DE8qi9LGaRMOswiRu+/cACBU934otMS9nH1Yl
         hWeWo4KZS/Mq/X1SiXXL9crIuZqBY5xWUYBTPuq8BNEcS7RGKyhNh+nWbWzr2P1KdXb7
         fqGOIywEbjMB/s7IqstVnz+qgmMrNqomJvgMKO9W1tj8VNiZWmUxUJBDRkkYokIjxZKd
         KRhg==
X-Forwarded-Encrypted: i=1; AJvYcCUEDJEQOLiilmOwxLxSm4mb/c0PAuf0Kd9po7PtzElz+t84/kMckb75NErotWUxEpRO9gvGplBqOwD7Z/k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw58B/5UfWwfg46ilU5lqmB8Gni+BFqqkC0xGNUax4AjaJtUxbx
	dtPe/15k97Ssz8U+7gA9VdsaCkPBq6Rwr02to2Ni8rP3vRSJhFrNdOqJbE6g3yB0wcL1ZvDxZj/
	Brpw2ARadil7if42oy500QhM5lFunIPstyZ3sLGtio4lTczy8UeF+Iakx3o7xtyxbtQ==
X-Gm-Gg: ASbGncu6qRpD9EDEOdt5HBinZCg9fVielwFikdol4WgKu2gcfzhJbLguH3vIaUxXg8x
	NxnBZ2EiDhLmyyspr/wwrmaxOChsS0N3UJgW3C9cWOktI9kKS1F5YIcsItqnMNx12NTKtRB4Pf1
	qk4KEQRDcZV6J9YThRM+/PgwCBrNbRlpybNZh55IXxXpobBt0aE5mHGOBZw0pA+JgkgbYlWTWMs
	bfwdu3Lps3mUg0rc2IdwXWZN452p23nSvjejaC61LgTA5o2fqLzXSJxOx7HXRZ6IVsvllPlVVjD
	j0LGvR4NcLxL8lU5ai8nU2JK9WmbdH5LPWRGh74cgYJlZZ4be8xFJvMFJvsfRL9jhYhF+9nWMjt
	JNyaNONXwU/ZhAC0yBn06vPew7Ofy+xFFs4aVsLQSNMC/1wZhXg==
X-Received: by 2002:a05:600c:1d11:b0:441:b076:fce8 with SMTP id 5b1f17b1804b1-450d65382f3mr44763185e9.14.1748637422402;
        Fri, 30 May 2025 13:37:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwnbQtZTBdkPV7rcjHwxokS1ZNELaKAdLMY/+erkv28q6aENuEvHuQ8PZywJC74WaTVeaKjw==
X-Received: by 2002:a05:600c:1d11:b0:441:b076:fce8 with SMTP id 5b1f17b1804b1-450d65382f3mr44763035e9.14.1748637422035;
        Fri, 30 May 2025 13:37:02 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f03:5b00:f549:a879:b2d3:73ee? (p200300d82f035b00f549a879b2d373ee.dip0.t-ipconnect.de. [2003:d8:2f03:5b00:f549:a879:b2d3:73ee])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7fc29f4sm26949415e9.38.2025.05.30.13.37.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 13:37:01 -0700 (PDT)
Message-ID: <722b084a-872b-4694-963d-241d00c63487@redhat.com>
Date: Fri, 30 May 2025 22:37:00 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gup: optimize longterm pin_user_pages() for large folio
To: lizhe.67@bytedance.com
Cc: akpm@linux-foundation.org, jgg@ziepe.ca, jhubbard@nvidia.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, muchun.song@linux.dev,
 peterx@redhat.com
References: <6f5e3238-9750-40db-8fe1-88d28655a988@redhat.com>
 <20250530150254.52362-1-lizhe.67@bytedance.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250530150254.52362-1-lizhe.67@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30.05.25 17:02, lizhe.67@bytedance.com wrote:
> On Fri, 30 May 2025 15:08:06 +0200, david@redhat.com wrote:
> 
>>>>> diff --git a/mm/gup.c b/mm/gup.c
>>>>> index 84461d384ae2..8c11418036e2 100644
>>>>> --- a/mm/gup.c
>>>>> +++ b/mm/gup.c
>>>>> @@ -2317,6 +2317,25 @@ static void pofs_unpin(struct pages_or_folios *pofs)
>>>>>     		unpin_user_pages(pofs->pages, pofs->nr_entries);
>>>>>     }
>>>>>     
>>>>> +static struct folio *pofs_next_folio(struct folio *folio,
>>>>> +				struct pages_or_folios *pofs, long *index_ptr)
>>>>> +{
>>>>> +	long i = *index_ptr + 1;
>>>>> +	unsigned long nr_pages = folio_nr_pages(folio);
>>>>> +
>>>>> +	if (!pofs->has_folios)
>>>>> +		while ((i < pofs->nr_entries) &&
>>>>> +			/* Is this page part of this folio? */
>>>>> +			(folio_page_idx(folio, pofs->pages[i]) < nr_pages))
>>>>
>>>> passing in a page that does not belong to the folio looks shaky and not
>>>> future proof.
>>>>
>>>> folio_page() == folio
>>>>
>>>> is cleaner
>>>
>>> Yes, this approach is cleaner. However, when obtaining a folio
>>> corresponding to a page through the page_folio() interface,
>>
>> Right, I meant page_folio().
>>
>>> READ_ONCE() is used internally to read from memory, which results
>>> in the performance of pin_user_pages() being worse than before.
>>
>> See contig_pages in [1] how it can be done using folio_page().
>>
>> [1]
>> https://lore.kernel.org/all/20250529064947.38433-1-lizhe.67@bytedance.com/T/#u
> 
> Thank you for your suggestion. It is indeed a good idea. I
> initially thought along the same lines. However, I found that
> the conditions for optimization here are slightly different
> from those in contig_pages(). Here, it is only necessary to
> ensure that the page is within the folio, rather than
> requiring contiguity.

Yes.

> 
> I have made some preliminary attempts: using the method of
> contig_pages() still gets an optimization effect of
> approximately 73%. On the other hand, if we use the following
> code to determine whether page_to_pfn(pofs->pages[i]) belongs
> to the range
> [folio_pfn(folio), folio_pfn(folio) + folio_nr_pages(folio)),
> the optimization effect is about 70%. I sincerely hope to
> hear your thoughts on which solution you might favor.
> 
> +static struct folio *pofs_next_folio(struct folio *folio,
> +		struct pages_or_folios *pofs, long *index_ptr)
> +{
> +	long i = *index_ptr + 1;
> +
> +	if (!pofs->has_folios) {
> +		unsigned long start_pfn = folio_pfn(folio);
> +		unsigned long end_pfn = start_pfn + folio_nr_pages(folio);
> +
> +		for (; i < pofs->nr_entries; i++) {
> +			unsigned long pfn = page_to_pfn(pofs->pages[i]);
> +
> +			/* Is this page part of this folio? */
> +			if ((pfn < start_pfn) || (pfn >= end_pfn))
> +				break;

folio_page() is extremely efficient with CONFIG_SPARSEMEM_VMEMMAP.  I am 
not sure how efficient it will be in the future once "struct folio" is 
no longer an overlay of "struct page".

page_to_pfn() should be slightly more expensive than folio_page() right 
now, but maybe more efficient in the future (maybe).

I don't particularly care, whatever you prefer :)

-- 
Cheers,

David / dhildenb

