Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A002B1EE00C
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 11:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747915170; cv=none; b=kYgh4Hz56EQONZJKgUblC0uzfa/qvxt8FBafjR3A6sC/BXBCnFTzOyWz3buyW5Wz2JV9liOL/4xoMIt2txTe/8cXj4vXE3iFA/JVVCYNLCPCANbuspZFGUPQwVWYj7hvW9/fN0pLVDbqnnutVz5vDfEQylQZGfbEbJlTkg9cVTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747915170; c=relaxed/simple;
	bh=xsY+WVYL8L0A3PirpffFGjJQA0OtyzQBTsOxvrWKtZ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pXpNYLarxdxpI2Iz/JJckzmDY95+klvl2z/yyv5zlsTITRuPe0Hhn6T8Zf5JvXzFbK4iTDc1PyJfePVky+ONfRVfO/XBJQ7sFZ1rBAaZ6gs7VormDUeFpNNQG9M4ii/Q6Paphdni1mf/2j3o4PqxzH5lRGGvP/pLAE+6CoH1Zs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ggiuL7oM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ggiuL7oM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747915167;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=7fiFtiH8zx6Q5uLD8mHm7dEx5UXACqGkovQu6C5VCJg=;
	b=ggiuL7oMviMS3ODlQgxTszXzyJbLNpIurxi4B5HXZt1zi2l1CJiO0vIoiKSO5exUxu+JXL
	yLnJY3F6vo1Z4JSMfByA4lMTBmCPjuG1MG8DEmS1d3xq3w7iSd7j1pSMwtXBmahm9Ij1C4
	Yn31Y6frti2q9fjA+bqvONT6HHir68E=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-570-DOgq9ZcAORyMrliEi_O38w-1; Thu, 22 May 2025 07:59:26 -0400
X-MC-Unique: DOgq9ZcAORyMrliEi_O38w-1
X-Mimecast-MFC-AGG-ID: DOgq9ZcAORyMrliEi_O38w_1747915165
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a367b3bc13so2394305f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 04:59:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747915165; x=1748519965;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7fiFtiH8zx6Q5uLD8mHm7dEx5UXACqGkovQu6C5VCJg=;
        b=UecnImDI4c+o8ea5HnXKqyXZ19IfYYxkeqSFTS8PZxv+FyPJI0BTjlDDULULiHoGk1
         QjeySlzVtIE1+6TT0EU5Vp6mZCG0vVc7RcneRo/k005+sVLjSX0DgHaLF3VNavbVzX5t
         /O9wRqykUJkkjLGXAAa9ep/hN1WGiJoPYfVNhvpUpopx+pZ+LQgoxlmgSgSDE+PIQR41
         FLYLMkZKYiiO3UPAH0fgJYjQI/VMnbPN7Nl0Ni4JOU90jjzD3zVdAdm5TN6WJLOzRwfi
         p5Rh+47Mu72NS3ygpiJz4TZOo2l6lSoxvi+KxE1+TqeBRhDUqt38AASE7j+L0TsylKs5
         +TNw==
X-Forwarded-Encrypted: i=1; AJvYcCWFLl9v1My987L/ncYfYIq2H1GrA6I3lY83r9PK0LYcx+wWnfV50G7ZzVmdWzUBknhJ+s5pA8sC/mtMKtY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxthIOJIjyJd641CDx7ugt7Hq/BoTsy3m3axtj85Sl/c9e0fa1s
	jnbNJG4Fy7allpfXI8QR1NYzPoRu9mQhQseQZFgBUVmNO4aT46izhFzaJQsc0UWDYcXJOGza4ik
	o9IKsSOKUzvMGLxTK4jI0HgnKKbjn5/PB7iYRk7oXF2bY2WkqhXsG34cVOdJFFfYN7g==
X-Gm-Gg: ASbGncvKTbdyeCQ/VV8m+mXygYsY+cx0dFQvF4nVnFdeRyAtXma25PoBbHR1q9pUlTI
	gYcDa5eetuWXxcsdFhne4YoM9YXFIJAPNhtDuyazahyyexFYq0hCP/IodJb7gXMhv3uP97g0ZZ9
	An2ZMbv2dcJvEyqYp6si5zMe3xMLxXL63tdDBZsL9vKowulRx/l9kyHuol8pjrr1XagPnAqP/ck
	YNKdUCzeP0nmZz9sVzWBUzyojFvkWuY6tLhlFrcVoByjSpBaefALAMSqtJvY0Z5gUO4M/GJMzhR
	fhM6mYVP5J70YfOVWQrVR6DfOKdSoAn7m1hsP1SGOw==
X-Received: by 2002:a05:6000:40db:b0:3a3:75fa:a0d5 with SMTP id ffacd0b85a97d-3a375faa1a5mr12387120f8f.38.1747915165000;
        Thu, 22 May 2025 04:59:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0yA4gY6+gi7WxSWBhc6gCkx0fOYsaTnNNtqlh+dpqLA2KIMazxXtNbxT4Ad513o3lGqw/6A==
X-Received: by 2002:a05:6000:40db:b0:3a3:75fa:a0d5 with SMTP id ffacd0b85a97d-3a375faa1a5mr12387090f8f.38.1747915164603;
        Thu, 22 May 2025 04:59:24 -0700 (PDT)
Received: from [192.168.3.141] (p4fe0f532.dip0.t-ipconnect.de. [79.224.245.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f78b0acasm100097975e9.31.2025.05.22.04.59.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 04:59:24 -0700 (PDT)
Message-ID: <a3e9e11e-1e8e-42a5-bcc6-e5ad97b4e4da@redhat.com>
Date: Thu, 22 May 2025 13:59:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/khugepaged: Fix race with folio splitting in
 hpage_collapse_scan_file()
To: Baolin Wang <baolin.wang@linux.alibaba.com>,
 Shivank Garg <shivankg@amd.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc: ziy@nvidia.com, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
 npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com,
 fengwei.yin@intel.com, bharata@amd.com,
 syzbot+2b99589e33edbe9475ca@syzkaller.appspotmail.com
References: <20250522093452.6379-1-shivankg@amd.com>
 <3eae6bb7-4865-44c2-8603-dc2bd8e3609b@linux.alibaba.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <3eae6bb7-4865-44c2-8603-dc2bd8e3609b@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22.05.25 12:01, Baolin Wang wrote:
> 
> 
> On 2025/5/22 17:34, Shivank Garg wrote:
>> folio_mapcount() checks folio_test_large() before proceeding to
>> folio_large_mapcount(), but there exists a race window where a folio
>> could be split between these checks which triggered the
>> VM_WARN_ON_FOLIO(!folio_test_large(folio), folio) in
>> folio_large_mapcount().
>>
>> Take a temporary folio reference in hpage_collapse_scan_file() to prevent
>> races with concurrent folio splitting/freeing. This prevent potential
>> incorrect large folio detection.
>>
>> Reported-by: syzbot+2b99589e33edbe9475ca@syzkaller.appspotmail.com
>> Closes: https://lore.kernel.org/all/6828470d.a70a0220.38f255.000c.GAE@google.com
>> Fixes: 05c5323b2a34 ("mm: track mapcount of large folios in single value")
>> Suggested-by: David Hildenbrand <david@redhat.com>
>> Signed-off-by: Shivank Garg <shivankg@amd.com>
>> ---
>>    mm/khugepaged.c | 16 ++++++++++++++++
>>    1 file changed, 16 insertions(+)
>>
>> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
>> index cc945c6ab3bd..6e8902f9d88c 100644
>> --- a/mm/khugepaged.c
>> +++ b/mm/khugepaged.c
>> @@ -2295,6 +2295,17 @@ static int hpage_collapse_scan_file(struct mm_struct *mm, unsigned long addr,
>>    			continue;
>>    		}
>>    
>> +		if (!folio_try_get(folio)) {
>> +			xas_reset(&xas);
>> +			continue;
>> +		}
>> +
>> +		if (unlikely(folio != xas_reload(&xas))) {
>> +			folio_put(folio);
>> +			xas_reset(&xas);
>> +			continue;
>> +		}
>> +
>>    		if (folio_order(folio) == HPAGE_PMD_ORDER &&
>>    		    folio->index == start) {
>>    			/* Maybe PMD-mapped */
>> @@ -2305,23 +2316,27 @@ static int hpage_collapse_scan_file(struct mm_struct *mm, unsigned long addr,
>>    			 * it's safe to skip LRU and refcount checks before
>>    			 * returning.
>>    			 */
>> +			folio_put(folio);
>>    			break;
>>    		}
>>    
>>    		node = folio_nid(folio);
>>    		if (hpage_collapse_scan_abort(node, cc)) {
>>    			result = SCAN_SCAN_ABORT;
>> +			folio_put(folio);
>>    			break;
>>    		}
>>    		cc->node_load[node]++;
>>    
>>    		if (!folio_test_lru(folio)) {
>>    			result = SCAN_PAGE_LRU;
>> +			folio_put(folio);
>>    			break;
>>    		}
>>    
>>    		if (!is_refcount_suitable(folio)) {
> 
> You add a temporary refcnt for the folio, then the
> is_refcount_suitable() will always fail, right?

Indeed. Would one of our MADV_COLLAPSE selftests catch that?

We should also be converting that code to use folio_expected_ref_count() 
-- either directly or wrapped in is_refcount_suitable().

Likely just here through

if (folio_expected_ref_count(folio) + 1 != folio_ref_count(folio))
	...

-- 
Cheers,

David / dhildenb

