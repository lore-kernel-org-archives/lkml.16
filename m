Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B440A1A239D
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 17:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750267589; cv=none; b=g2enOorHaeIGvDhbQ1BDD/2GOCCMEa72elpxtZSM1e2r34Lg4fU7Y+6OOhDpjptCPbC7DHwaqfUswwF4qOg1csQLu8J642H/xxONMqLIngz72+6qOHchzmH9s7HQmxyVuLoLiVtFH6yT0qxw8Ro7x68jTYQIvwbpvHdO/TJjm4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750267589; c=relaxed/simple;
	bh=8rQFIYvL/D8vQhH1LoCiZQ5uIGzALcVfCTpqPf6vwHU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Jx3RLpCSddfHEpCj8PPXL+qgNGSngALHA/7NdeVBnn6Mc1SvK3fibQWyCCiP8/6m/2ufoNtC30Ef9h7MXqkrmwcbDDl4HL7uDB5AlH94RaKTc7a7o9JZKRTC2b0kmn9ECu6F1tMCEWh5GaEpsE9PEXEXMBZEnMJtyCgf3zeEqlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Xk9TW94I; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Xk9TW94I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750267586;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=a6x0WYiUcQJ9DTIWMx+cprOqlirek80JnA/x9WkF1hA=;
	b=Xk9TW94I9j92m3UxvNzLeg5UdowMtNyBn4hAgFc5TxKyBTyrM2J+ncdHbnrSH8XrB8I5Sz
	tY4mM4MktNgtCiZ6z/16S9S0X4qPybyaIp2I+CzELS7HuPJcwOXnvafWG0AFoAcre7zJCW
	3yg9tD61W3Tkf/Z1C5lZE6X4tCa4/vE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-156-WBmmZfdeM0-GD5JeraGsaw-1; Wed, 18 Jun 2025 13:26:25 -0400
X-MC-Unique: WBmmZfdeM0-GD5JeraGsaw-1
X-Mimecast-MFC-AGG-ID: WBmmZfdeM0-GD5JeraGsaw_1750267579
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4532514dee8so60719485e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 10:26:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750267579; x=1750872379;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=a6x0WYiUcQJ9DTIWMx+cprOqlirek80JnA/x9WkF1hA=;
        b=V78V1mPmvrpNMJhBlmz52wEksIfrJLDIZIji7k+a5arc4e3pioqWJZlBKnlU3fFhQZ
         eQ0qobtcPo+kPxT+GHBWN3sFfoab9EmvCeWIypWzYrh9IPXPEJrpGK82Fc07jvvVSaLg
         pBFdeddSx5cdwikELWNIuc2K9pU9B44dNqKheyXLw7orvOd3qiLWpJUTI98hb7R+BvJ9
         Q5Iy5DfO2/9frwygPQAT8Y8LFN6abjQD4H2wSem+AuMhOmqHa0Doe/3dHJYi2WVGWDcd
         nYwvKVgK3SjExBuAz8xRfXjy6BLQKf/IwNB//NkMm6KTvZiI/ZUxRr3L2vSm+VwjF96L
         T4AQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxSCdWmLWKbgBtpyqPP69eXLDTDO8so+Jg3QV6i+V5Oa2zxN6nIQ+nCncYKE3Hvw4iaA2B2ykNROXtPBI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjKLkMtaDv/i8Shb5j+GGVx5mevx+kfGdG7GsAHTu20QUYQ87O
	KCR6uMH6V3AQ0twFtQnFZ6hyNxSuHAC8Vj6h8KW+TH8XEHNTsbkDbdgx9OJnCLOeN5SnvXw6Nv2
	d9JNZcwrT2E1JmhW98mimMrH2ZGpYuiwn46ikzA9EyL8tilbVr2LT/TJJSOnaazro9732SKxTJ5
	gl
X-Gm-Gg: ASbGncu166dmZcTH5Z9csSQDVGgmnmSDG5oz/p9bR78FFVW4o1LPsZa1w+jj0n88Nti
	83OH8IDsfx5ebo/UWNCWm/LRkXCKxBjH8yQxYP4k3QLkWLI9anNDTXUZSc1fUQaqEToeq3n5pbE
	zKo8DURqL1eivae38tAySENmPk+7DbLpfdAC57CvjsDxq4/NnXRfbBlyGacEcLk6gazjV1TMzai
	ffBKukEvzbrQ+DNAf2J9IVZotw9MftI3ythDhZWJsIikJnXSK6b6uSuNHFXXrLQVGJVVYxHsibu
	guMlWCT25kA82aaBokXxE5Qobmp/6OwGTxKRMsHh9lkRCcvRlbf+AlCV/IyeIWty6XcTvMiXexF
	sP5L3faWpzGlqP1+lMmderkjexhY9AlVtIlE5Xaq1tcV97jM=
X-Received: by 2002:a05:600c:1e02:b0:43d:fa59:af97 with SMTP id 5b1f17b1804b1-4533cac919bmr157889605e9.32.1750267579173;
        Wed, 18 Jun 2025 10:26:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSs9bGE/hs92uP8WOAkyfMT9RmOxXm2HmTAmrMfLMnR+279lwRZLoLqsF3abVBEEc2w7YVCw==
X-Received: by 2002:a05:600c:1e02:b0:43d:fa59:af97 with SMTP id 5b1f17b1804b1-4533cac919bmr157889475e9.32.1750267578810;
        Wed, 18 Jun 2025 10:26:18 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f2d:2400:4052:3b5:fff9:4ed0? (p200300d82f2d2400405203b5fff94ed0.dip0.t-ipconnect.de. [2003:d8:2f2d:2400:4052:3b5:fff9:4ed0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a54a36sm17697956f8f.15.2025.06.18.10.26.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 10:26:18 -0700 (PDT)
Message-ID: <99388a50-02ae-4433-adc7-753a4cb1a576@redhat.com>
Date: Wed, 18 Jun 2025 19:26:17 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] khugepaged: Optimize
 __collapse_huge_page_copy_succeeded() for large folios by PTE batching
From: David Hildenbrand <david@redhat.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org, ziy@nvidia.com,
 baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, baohua@kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250618102607.10551-1-dev.jain@arm.com>
 <738669ec-a9e5-4ba1-85a7-605cb4132d05@redhat.com>
 <42aa7d12-3f84-4ee6-a067-5aee30ec677d@lucifer.local>
 <4c7dc187-bd04-47c5-b619-b91b83cca913@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <4c7dc187-bd04-47c5-b619-b91b83cca913@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18.06.25 19:23, David Hildenbrand wrote:
> On 18.06.25 19:10, Lorenzo Stoakes wrote:
>> On Wed, Jun 18, 2025 at 06:14:22PM +0200, David Hildenbrand wrote:
>>> On 18.06.25 12:26, Dev Jain wrote:
>>>> +
>>>>     			/*
>>>>     			 * ptl mostly unnecessary, but preempt has to
>>>>     			 * be disabled to update the per-cpu stats
>>>>     			 * inside folio_remove_rmap_pte().
>>>>     			 */
>>>>     			spin_lock(ptl);
>>>
>>> Existing code: The PTL locking should just be moved outside of the loop.
>>
>> Do we really want to hold the PTL for the duration of the loop? Are we sure
>> it's safe to do so? Are there any locks taken in other functions that might
>> sleep that'd mean holding a spinlock would be a problem?
> 
> It's a very weird thing to not hold the PTL while walking page tables,
> and then only grabbing it for clearing entries just to make selected
> functions happy ...
> 
> I mostly spotted the release_pte_folio(), which I think should be fine
> with a spinlock held. I missed the free_folio_and_swap_cache(), not sure
> if that is problematic.
> 
> Interestingly, release_pte_folio() does a
> 
> a) node_stat_mod_folio
> b) folio_unlock
> c) folio_putback_lru
> 
> ... and folio_putback_lru() is documented to "lru_lock must not be held,
> interrupts must be enabled". Hmmmm. I suspect that doc is wrong.

It's late ... doc is correct. Was reading "must be held".

So yeah, let's leave it as is.

-- 
Cheers,

David / dhildenb

