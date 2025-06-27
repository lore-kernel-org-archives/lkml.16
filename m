Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410DC2EA174
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 16:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751041822; cv=none; b=Hr+8jb7YaJ8bU/MxC7Cr49CSyTITaZGl95RcQUs8Sk6zFUrh9WPTFbe8O1MKxA1AcL9xU89z+39qHHpONx/AdeTVGMpr6qnUA8faav7W7z+velxy10HV9aKvjBlS+ZVtLZZFAKMBcF9dCF55aaSFCUDXGdUuyf/cncJ2+OUrN2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751041822; c=relaxed/simple;
	bh=GbBDeDpfKaiJXBDJb2QVtUJ8DgxAhotmOOlgqWnpGxw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q737lWePg7gjnzGHooB1Gw5X8IYB7QWxfC0aceG9LSu/v48/GluwpJ0mCSDUIS8nyPpWdFJjlSkaCPP2p1RVoH51P5cbNvR81UfLXjgDLaqtsT4+Q5Xv07tjL5PH/U/VeA/28a57Lf40iWgOFvx6WkfcOjMaa+/9BmaziNeNO5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BUnZceLM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BUnZceLM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751041818;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=FMC4YUXygZoZhAtwBUomQlpkOvVYPpeGsXFDd8TvJVo=;
	b=BUnZceLM5JAqttgPj6SbcQD63FHlIsitF87F5Pa0E+1VRnYhjiSEwfQYp7GDHnFT3mothD
	T5q1TQmEg9eJWP9me5TDkxeCxaoLdxCngnqjFxcrhkw4Yqql7RZ0WhgE6wrzWb36KSRzIi
	SZ718FZB6p2x8f/4BR7+U5K1c5qp3eA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-191-t9ogZ4QMNyiQnOA_Z8X1QQ-1; Fri, 27 Jun 2025 12:30:16 -0400
X-MC-Unique: t9ogZ4QMNyiQnOA_Z8X1QQ-1
X-Mimecast-MFC-AGG-ID: t9ogZ4QMNyiQnOA_Z8X1QQ_1751041816
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4530ec2c87cso459695e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 09:30:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751041815; x=1751646615;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FMC4YUXygZoZhAtwBUomQlpkOvVYPpeGsXFDd8TvJVo=;
        b=Koby/8y+/xJI8Ug3qJes7pMTZTWYxnRXz2LP4lB83yzbjFZOWVdXkE3PtvHPiJw74i
         Ydr7siyQxA6FTYe1NZu/AJoq3DdDk7IOICe8/mxj3CP1wckOn8yIqnj44b8Ln9iKFUEg
         NSUytfV14BEXiIWlKkCksDYC5Eu76ClgrII5ce+V+IJsKdlEY9FsmY2GXdQZ+EDQKc+3
         7sqPKUa4X7Yb3r0jP0Rm+XJ/VKH/zVJUmCEgFQ7DD3pdhLcSIkbw2Ahy3jGGB8CDPyE1
         PXzwZUIeS5hsosRQtqsVBB+6OWpswpg0NMQQ5llYJVBkjschE8pnJJRfdHV0+l6faaR9
         vfKQ==
X-Gm-Message-State: AOJu0YxOdBWFOTSd/Oa1pSIk3A81kOp6F84uoMLWyO2CqNB7xUM6PxhA
	5jMIWgsmRj+z6pUKHP/PCZx/4wvFfQS26VajFlaunFB1aqhlci7+lc5aZ/kzt9AgRzchodd4oUU
	EKNxFWbi8wh2AsxtI+bocOcoHj+rvHh7dRaJCUX3fgVuQOlhKgi3EsGYlXyeQx27bFA==
X-Gm-Gg: ASbGncukwfe1gJjGmBSk0Dtfjo157ulnUk+FvK9iNDdbfR/iZFIdQjr3P1Z4/XEr/8T
	YPxylNsn2LPwdT04hhdy+mYZeTvW/74GHd/UjfRdowaDF/O9v5G8ij9yL20Jc7RJeiIKIlc0G+v
	CAaasrliAIe095dEW0vvMyLhB5jcrtZZa6IQGaEfhQ6H9FcO9oWTcyyCVpx/ShotUYpRXDQep2V
	wH6W88z355mSuvI/KsuOVxzsePPzOcdOghBoc/8390QY1CwKPJP9wzXDpXL82yKA1p29bztNHID
	zDBjRGL2JiziQDx7zSb7bekuTZnD1eVBTs5VeLu9p4Dnf4m21DFj/r/VmDQE99U1H678SHpvqc7
	2IIc6a5FD4w1KElziNnqjVZP8oRqTnFmuq4/cDmFcZ2Bj+fdT1A==
X-Received: by 2002:a05:600c:4e92:b0:450:cabd:b4a9 with SMTP id 5b1f17b1804b1-4538ee798bemr40361835e9.29.1751041815504;
        Fri, 27 Jun 2025 09:30:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGqdsT/96F0Mr2PJX6b8M2jQoHI2tRESaMDJOYEgLFFr6DNktefRenln/Df0rWFyaxMn5Jyg==
X-Received: by 2002:a05:600c:4e92:b0:450:cabd:b4a9 with SMTP id 5b1f17b1804b1-4538ee798bemr40361545e9.29.1751041815067;
        Fri, 27 Jun 2025 09:30:15 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f2d:5d00:f1a3:2f30:6575:9425? (p200300d82f2d5d00f1a32f3065759425.dip0.t-ipconnect.de. [2003:d8:2f2d:5d00:f1a3:2f30:6575:9425])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7fab15sm3174897f8f.33.2025.06.27.09.30.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 09:30:14 -0700 (PDT)
Message-ID: <fd825d4f-76b5-40ee-bad5-634b4d80506c@redhat.com>
Date: Fri, 27 Jun 2025 18:30:13 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] mm: convert FPB_IGNORE_* into FPB_HONOR_*
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Zi Yan <ziy@nvidia.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Pedro Falcato <pfalcato@suse.de>,
 Rik van Riel <riel@surriel.com>, Harry Yoo <harry.yoo@oracle.com>
References: <20250627115510.3273675-1-david@redhat.com>
 <20250627115510.3273675-2-david@redhat.com>
 <6e3df002-fd04-4acf-a670-d36d5478921a@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <6e3df002-fd04-4acf-a670-d36d5478921a@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27.06.25 18:28, Lorenzo Stoakes wrote:
> On Fri, Jun 27, 2025 at 01:55:07PM +0200, David Hildenbrand wrote:
>> Honoring these PTE bits is the exception, so let's invert the meaning.
>>
>> With this change, most callers don't have to pass any flags.
>>
>> No functional change intended.
>>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
> 
> This is a nice change, it removes a lot of code I really didn't enjoy
> looking at for introducing these flags all over the place.
> 
> But a nit on the naming below, I'm not a fan of 'honor' here :)
> 
>> ---
>>   mm/internal.h  | 16 ++++++++--------
>>   mm/madvise.c   |  3 +--
>>   mm/memory.c    | 11 +++++------
>>   mm/mempolicy.c |  4 +---
>>   mm/mlock.c     |  3 +--
>>   mm/mremap.c    |  3 +--
>>   mm/rmap.c      |  3 +--
>>   7 files changed, 18 insertions(+), 25 deletions(-)
>>
>> diff --git a/mm/internal.h b/mm/internal.h
>> index e84217e27778d..9690c75063881 100644
>> --- a/mm/internal.h
>> +++ b/mm/internal.h
>> @@ -202,17 +202,17 @@ static inline void vma_close(struct vm_area_struct *vma)
>>   /* Flags for folio_pte_batch(). */
>>   typedef int __bitwise fpb_t;
>>
>> -/* Compare PTEs after pte_mkclean(), ignoring the dirty bit. */
>> -#define FPB_IGNORE_DIRTY		((__force fpb_t)BIT(0))
>> +/* Compare PTEs honoring the dirty bit. */
>> +#define FPB_HONOR_DIRTY		((__force fpb_t)BIT(0))
> 
> Hm not to be petty but... :)
> 
> I'm not sure I find 'honor' very clear here. Ignore is very clear, 'honor' (God
> the British English in me wants to say honour here but stipp :P) doesn't
> necessarily tell you what is going to happen.
> 
> Perhaps PROPAGATE? or OBEY?

RESPECT? :)

-- 
Cheers,

David / dhildenb

