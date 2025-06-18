Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168152FEE03
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 17:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750267418; cv=none; b=DuPP+HvsiXs/UndnnV//UgH2a1kD5mMeXplfvrM6oC37pKmzfHPtj8rmULZSuWl/sPqXe7ZuW2QOnPPah/PoCQwhw2w4CGRtaJ3dMrSOEDGcG9QAeOIgyGYsHLwxUwlWfQ6TTFS/shmS7qwCG9rsgGLsLEW26yKSTQpJI4LhLlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750267418; c=relaxed/simple;
	bh=kSJ7phh2/IUAhQ2jsrmVfPdNh/RK6dFu1yuj7rXJha0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W2qqZ2iUdpeXupzD4ruM6QikD8oaDX9J1T2zwCsfoycZ3U20KDXsRL0IZP6H5izreOqI5M9EzAvN7KPquNafLrMrhSVPQYxblVMOuFxWPsUq+xX7LRxI7XO/RO1NgFXe4neJ2pjY48fWNXGH9LdpozK9Z2V2SfMnsYKdtoXVqoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BF2LAx32; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BF2LAx32"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750267415;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=IZPpWXUlnKeNwN9q+QSTXWJIm5lmGOFm2ysA2/qMU74=;
	b=BF2LAx32g2x85aBL8sl+0DsEHAVledqpwSU8xmsQz1pYpMD3THZ6Qvk5W6s0n5rKkFy/X0
	wtJgdINjtYnHjiEI6FiMi1hR6Up9hGlhuF0hj1Ean+NR/tas0hklsTxv+J1d3zYDl4ADpX
	qp8OLz/2IyFlOW/7XB4p33yyw/ZqlXk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-461-rNPb9FsiO6awnVjs6sA3RQ-1; Wed, 18 Jun 2025 13:23:32 -0400
X-MC-Unique: rNPb9FsiO6awnVjs6sA3RQ-1
X-Mimecast-MFC-AGG-ID: rNPb9FsiO6awnVjs6sA3RQ_1750267411
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-451d7de4ae3so46056465e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 10:23:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750267411; x=1750872211;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IZPpWXUlnKeNwN9q+QSTXWJIm5lmGOFm2ysA2/qMU74=;
        b=HpjayNfgnaKia53L7Iax06s+aJvAV1MKIXYTfaDay/xbuSRbcszJ8SHXqtHldURhOo
         t+TwLPBExDMFROtrSpmMYcXPk5P6r0TWqWfMD89+NSXClGAAJr8ArQ2RDl4JdG1b9k4E
         6jI938jckHz6QuLcZ6EazWwflUzScalZJUjQyiZYgZtHdxtOk7l1fjGdKyYN7Q2uTaTy
         SxC0hVk8KCqr6labnbOP/ixz1CK4Wxj1P65RfjsV0UFZhNiEjtux4XtaAQBxndZsQh48
         gwscqcS95QnzaFBEbHmRhQ/8UZ1d2XpUx6gpwSAA+r5oqi4GkfyAJBP4jqQHLO1VWE9i
         0iQg==
X-Forwarded-Encrypted: i=1; AJvYcCVZKslNIl0M5YH7zUIcZcAm0q1bRvWapUfB0eRGWeulMj4WQfSe+VwKKVjB/3RD2vWQbsnzcTYyPyMwJl4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm+y5xadyBo0VxdbCPU92mr4BpEpFHVuEwzfKJvFrLqiQm0NPv
	jcoAYauN2+MJvQyrzQNBeTeeVaQkoT+/HsCfXTVetGkZxzLDZyQD4Nxb84lZzlgwN+NLPBWHMmu
	ipsFVTRfznQ8E0risYRKHwTTKozIoUGchh2JMMfBUCkxeNLXrOGJ02JppxXyZhIw/Xn4xEiNcQ8
	9V
X-Gm-Gg: ASbGncsGk6YjtZx5l6MP5njMpBKOxaIo6ElCxwW7UzAa9M6glV1cL3eaHo92YF3X+ir
	RXcOLWb6ngWQmCC9GQZheyy2VECClx4d6Pq0drjwkMOwBIQWgNbL0ITJ8/lF2TKM+GvJk761BIY
	I89qnwJ/ucn++NCl9i3+t72vVO8v/OGf8PJ7BBe6+MBTFCVXpgC+yqH7IpjJxlTs+Qz5YBUURe/
	YA9V3Auappnn9+jQALIOSEkgKZ3EIGwrGwU5V0MjFpddtPPQK4LHE7EpVGMhNKEsOCh84Mp9i7T
	zoYrc22HmARBUXcFeJoVXf2D7R1YNHeiQohErJzy8c2kkgFw+wR4MOmGx1Th7VLcSuNYt6PFSE9
	mg2n0RImLfEBwtASK9EeGDYNCDHXgx0pkFKQn7A4bUfJa0Ns=
X-Received: by 2002:a05:600c:820c:b0:43c:eeee:b70a with SMTP id 5b1f17b1804b1-45351d76416mr76334855e9.22.1750267411234;
        Wed, 18 Jun 2025 10:23:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWLOXcdGrXcCpooZZvZAIIwuZrYCyizxV+dBTel5EEmzbnVTkPUsz64b6qSvhtoJbS1GbG0g==
X-Received: by 2002:a05:600c:820c:b0:43c:eeee:b70a with SMTP id 5b1f17b1804b1-45351d76416mr76334695e9.22.1750267410886;
        Wed, 18 Jun 2025 10:23:30 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f2d:2400:4052:3b5:fff9:4ed0? (p200300d82f2d2400405203b5fff94ed0.dip0.t-ipconnect.de. [2003:d8:2f2d:2400:4052:3b5:fff9:4ed0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a7cb65sm17721293f8f.38.2025.06.18.10.23.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 10:23:30 -0700 (PDT)
Message-ID: <4c7dc187-bd04-47c5-b619-b91b83cca913@redhat.com>
Date: Wed, 18 Jun 2025 19:23:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] khugepaged: Optimize
 __collapse_huge_page_copy_succeeded() for large folios by PTE batching
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org, ziy@nvidia.com,
 baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, baohua@kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250618102607.10551-1-dev.jain@arm.com>
 <738669ec-a9e5-4ba1-85a7-605cb4132d05@redhat.com>
 <42aa7d12-3f84-4ee6-a067-5aee30ec677d@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <42aa7d12-3f84-4ee6-a067-5aee30ec677d@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18.06.25 19:10, Lorenzo Stoakes wrote:
> On Wed, Jun 18, 2025 at 06:14:22PM +0200, David Hildenbrand wrote:
>> On 18.06.25 12:26, Dev Jain wrote:
>>> +
>>>    			/*
>>>    			 * ptl mostly unnecessary, but preempt has to
>>>    			 * be disabled to update the per-cpu stats
>>>    			 * inside folio_remove_rmap_pte().
>>>    			 */
>>>    			spin_lock(ptl);
>>
>> Existing code: The PTL locking should just be moved outside of the loop.
> 
> Do we really want to hold the PTL for the duration of the loop? Are we sure
> it's safe to do so? Are there any locks taken in other functions that might
> sleep that'd mean holding a spinlock would be a problem?

It's a very weird thing to not hold the PTL while walking page tables, 
and then only grabbing it for clearing entries just to make selected 
functions happy ...

I mostly spotted the release_pte_folio(), which I think should be fine 
with a spinlock held. I missed the free_folio_and_swap_cache(), not sure 
if that is problematic.

Interestingly, release_pte_folio() does a

a) node_stat_mod_folio
b) folio_unlock
c) folio_putback_lru

... and folio_putback_lru() is documented to "lru_lock must not be held, 
interrupts must be enabled". Hmmmm. I suspect that doc is wrong.

So yeah, maybe better keep that weird looking locking like it is :)

-- 
Cheers,

David / dhildenb

