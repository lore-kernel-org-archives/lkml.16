Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F833D69
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 13:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751291277; cv=none; b=SwHwWauHBP7wGOd9iLLVvY2RVKeYOAvjFiqdlyMbl+LBUhq8fVDsSTPkyTiGJGALp2DTTMSy2N9oBKo4wTWmRN0l8H3sux4ID5/6FCjJfJXsb5yXnAlPzL8pxC7crUk8NojaL3WBSa0Lzf6bJkGDmw6XCb1KVfK25ZuUvv9Zmtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751291277; c=relaxed/simple;
	bh=lie/LfIgQ9mia+bf8OGBFbyVskJ9HqacK6ieFLtj0Io=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DIbbBvwqJ1BFf6BNOCEJizsJLHP/p3hVOASe5dcfhWTAeVaGr4oSJY3NnzU0mqF0ex2s2awx7/PGEUPDT2aklTUTX1oqhuQCed5DM4MiQmE3KfzFU11naibvLl87J1Z2iZQxJtp1PPrWe+Z7C41m1xzeafVqzyqnfU2PhTIBFmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Fq6nHF3b; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Fq6nHF3b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751291274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=DZhwNkrSWJ6snmNq4FM6iA3U1zHfUTmNW6Si/nv2ybI=;
	b=Fq6nHF3blwGshhNOWvY9nOl7zzKwJBD0qf9BdhkTg7iMI5YLdfrtwWnteJub5FqcfGBs21
	/MilFQ8OtvQZN9z3o/MP6LlZdBQK3Ch5XsSlhl1QepFtns1VRZlEP97JxJorOnLxJD5b3R
	soe2YP7GqOuuvhstkmui66AfEGCtbRc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-561-4BQz056qPuG772jtlmxQsw-1; Mon, 30 Jun 2025 09:47:51 -0400
X-MC-Unique: 4BQz056qPuG772jtlmxQsw-1
X-Mimecast-MFC-AGG-ID: 4BQz056qPuG772jtlmxQsw_1751291271
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-450d6768d4dso13957765e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 06:47:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751291270; x=1751896070;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DZhwNkrSWJ6snmNq4FM6iA3U1zHfUTmNW6Si/nv2ybI=;
        b=WUB7JEcX4eBqZCYd38dw9DHuhas6amo1ijWI2YxtL6MCSSdsR43QzT8Y0njZGhmvO6
         U3HnUVu11pneF2NqS5xKlH8VU7OhEBDs6W//qOPNm6ylOn2r63fdqTWGOiiieL//EdkE
         dZX7WGOQH5DVJt0wqZrrRKpwWnpkJwgu8E4f02+dvyouCRRufQ6jeWx0YDkmLPUUyrUT
         /XxRuw2NeFtn1DuCxeNrnEstip5uS0s89eKuY5ujYfXJVwY1bvQZ92DtROQ9VTR1ZgZl
         wDWxtHwJlEcogtYgtyPgcOAIo/LPjwLr2irvGzZ8bmmZu6QXCphgmSQCuVngRXPnEZKP
         t6WQ==
X-Gm-Message-State: AOJu0YyMMeO90hX6rXmB6s4R5FcjlmWEC6UVYOT7qDzH8e8N1AvzUgZt
	1snZKLNcXCrCvR78BljgkheLtsn8+oD0B4w6xn4DIovE7RSsjf6uIdpOokDctfkscjEG0Pnxz+I
	uJhrnYtPId9p2FZ7f5aWnBs6eft7PpsO18BfmYcgK06EfVm7i7HzMak5z058TNt/BUA==
X-Gm-Gg: ASbGncskdW+hRf6b142AKv95OTpebEC7RzI6rQpa807IJ42bGQHWlqcicPtO/OBb2a4
	sKbwXIkGL6qoMrWb7ZUZajgnj1WQQ4yaPPtQwdYcMG2pp3pW7k67OJIzBSoFRJ6fRoHUPLipIKV
	mMOidZJtjCvVmHvw8Wqigsu7MacNnDVlUX+ovhN6z+QzI3ugh+TZ0L1v+yMKPPQnSxsYRwn0R//
	i24G4MXQskhWcz8LOp13erJ6nHRFR+MSrzlBKBg/pN6Y3AgMJ72U8xYEZQybj6txxFi6QJdJ+ay
	+WDdkHCsZXpJCqLQTHbROi5zaSebdmWLJUWYOBlQ1AUDBER3rpdsOGaDzAVeLa32yk3KBWMZd6y
	b+OHSVLROnLna629SG9nSluxDwaLZqMOVGwp0wsrrXCJL+ugHNA==
X-Received: by 2002:a05:6000:2d11:b0:3a4:e8bc:594 with SMTP id ffacd0b85a97d-3a8f4453eddmr7844207f8f.8.1751291270497;
        Mon, 30 Jun 2025 06:47:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzyLcAPcEksIb+16aEeJKBphGEY9WJaXQreW8FZ7NhTpUshnY0St3sShAL2FDT7dCj5NUO9A==
X-Received: by 2002:a05:6000:2d11:b0:3a4:e8bc:594 with SMTP id ffacd0b85a97d-3a8f4453eddmr7844174f8f.8.1751291269980;
        Mon, 30 Jun 2025 06:47:49 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f40:b300:53f7:d260:aff4:7256? (p200300d82f40b30053f7d260aff47256.dip0.t-ipconnect.de. [2003:d8:2f40:b300:53f7:d260:aff4:7256])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e5972bsm10549097f8f.68.2025.06.30.06.47.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 06:47:49 -0700 (PDT)
Message-ID: <81c8ca46-1e87-4fd5-b8fd-f42de0097113@redhat.com>
Date: Mon, 30 Jun 2025 15:47:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] mm: convert FPB_IGNORE_* into FPB_HONOR_*
To: Mike Rapoport <rppt@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Pedro Falcato <pfalcato@suse.de>,
 Rik van Riel <riel@surriel.com>, Harry Yoo <harry.yoo@oracle.com>
References: <20250627115510.3273675-1-david@redhat.com>
 <20250627115510.3273675-2-david@redhat.com>
 <6e3df002-fd04-4acf-a670-d36d5478921a@lucifer.local>
 <fd825d4f-76b5-40ee-bad5-634b4d80506c@redhat.com>
 <9427d552-b94d-4b27-a4e3-ed958c153b48@lucifer.local>
 <aGEAWMKsK2VtdbI8@kernel.org>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <aGEAWMKsK2VtdbI8@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29.06.25 10:59, Mike Rapoport wrote:
> On Fri, Jun 27, 2025 at 05:33:06PM +0100, Lorenzo Stoakes wrote:
>> On Fri, Jun 27, 2025 at 06:30:13PM +0200, David Hildenbrand wrote:
>>> On 27.06.25 18:28, Lorenzo Stoakes wrote:
>>>> On Fri, Jun 27, 2025 at 01:55:07PM +0200, David Hildenbrand wrote:
>>>>> Honoring these PTE bits is the exception, so let's invert the meaning.
>>>>>
>>>>> With this change, most callers don't have to pass any flags.
>>>>>
>>>>> No functional change intended.
>>>>>
>>>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>>>
>>>> This is a nice change, it removes a lot of code I really didn't enjoy
>>>> looking at for introducing these flags all over the place.
>>>>
>>>> But a nit on the naming below, I'm not a fan of 'honor' here :)
>>>>
>>>>> ---
>>>>>    mm/internal.h  | 16 ++++++++--------
>>>>>    mm/madvise.c   |  3 +--
>>>>>    mm/memory.c    | 11 +++++------
>>>>>    mm/mempolicy.c |  4 +---
>>>>>    mm/mlock.c     |  3 +--
>>>>>    mm/mremap.c    |  3 +--
>>>>>    mm/rmap.c      |  3 +--
>>>>>    7 files changed, 18 insertions(+), 25 deletions(-)
>>>>>
>>>>> diff --git a/mm/internal.h b/mm/internal.h
>>>>> index e84217e27778d..9690c75063881 100644
>>>>> --- a/mm/internal.h
>>>>> +++ b/mm/internal.h
>>>>> @@ -202,17 +202,17 @@ static inline void vma_close(struct vm_area_struct *vma)
>>>>>    /* Flags for folio_pte_batch(). */
>>>>>    typedef int __bitwise fpb_t;
>>>>>
>>>>> -/* Compare PTEs after pte_mkclean(), ignoring the dirty bit. */
>>>>> -#define FPB_IGNORE_DIRTY		((__force fpb_t)BIT(0))
>>>>> +/* Compare PTEs honoring the dirty bit. */
>>>>> +#define FPB_HONOR_DIRTY		((__force fpb_t)BIT(0))
>>>>
>>>> Hm not to be petty but... :)
>>>>
>>>> I'm not sure I find 'honor' very clear here. Ignore is very clear, 'honor' (God
>>>> the British English in me wants to say honour here but stipp :P) doesn't
>>>> necessarily tell you what is going to happen.
>>>>
>>>> Perhaps PROPAGATE? or OBEY?
>>>
>>> RESPECT? :)
> 
> DONT_IGNORE ;-)

Well, yes, that would be an obvious option as well, but I think I'll go 
with "RESPECT" for now.

-- 
Cheers,

David / dhildenb

