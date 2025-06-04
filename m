Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA1B290098
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 14:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749049113; cv=none; b=dMGksAhLoltCRaIzr6YLB6bAyIPqlMbLZUVXCqhJG05o0nL0LA06CWhb8Q2RdG/rMHvQ2nYnj3A1wtdzBS/evPFLJg+7UktOcmsJ+hSh+BEOwjVa7j67zqY22wK+ExhXwIoigFQTv2dXH5+OQtWkWYr0qRWbocmJL0S6S2Ze20k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749049113; c=relaxed/simple;
	bh=3cZtHDT182hjcG4xgz8CRAEfFwHp4dh4d3OG9V6YGZY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OUJ/2vS72PknWxEt7whVDAxvPQ5jCKJNKWqSlSHiBRjaefjHZeSSp/5XWNb/+WSDEY7XLgA9eRJEw1rrYB/osADtKqSOfrXEsdQfrgBFG4hNex+0hg9nqXAyygngxi92Gh2egN5+qYA94EgQwTTYEga0+ONYwivtql2XTd0kmrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HHTh7vF0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HHTh7vF0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749049110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=3qjG397uxmb1tWEqI007xcyMmGE3Kzd3iABso6Fhu8E=;
	b=HHTh7vF0D7gCv2iEyvkqq9XGZwEVPpfv9J+DRRCQAVONdG1eBdHwSPzsTHNIuTulRTyeu8
	op/7kH1l5nbWIDFw2GFkyAHJ/gtb622sX9m0pZRCouHoNm4qUKo6K3JS5YSuxiH1UTFanm
	XHtcxSBCcaFu5Wh3hU2MCg44fbrXwHw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-591-JKnuMwo0OMqFWcviKqIK_g-1; Wed, 04 Jun 2025 10:58:29 -0400
X-MC-Unique: JKnuMwo0OMqFWcviKqIK_g-1
X-Mimecast-MFC-AGG-ID: JKnuMwo0OMqFWcviKqIK_g_1749049108
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-450dada0f83so41363325e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 07:58:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749049108; x=1749653908;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3qjG397uxmb1tWEqI007xcyMmGE3Kzd3iABso6Fhu8E=;
        b=sIcipwf8HFnclUUm0JvduS+wkJxa0a15N25ta1QZ4VaGkb+TABcXRmVAmWfFTlqFDB
         oOnquRKlFN18Db/iv5kIja2roA43e1X6w1N7NUvf1yln/SA27AngKlFQ2Qefq7OqXCIG
         E7UcWkXDR1AwOu/K7vXY16/1r4FnYqmOZulUAdSlVN6ufh8ZYtirPYxjZScjY5+dWkqh
         gJSiquzf040HBcPUu0YdK+FWNoMW9DbPSiEvZz62axgFZUn/jdNRHQxPbxUL3HV7FCCu
         0QfZ+/bN3aWPMlCmZh6IGKRFpD+YI1+/nZovwALgoZnd+xnj8BwxgLT4spF28de/6y0G
         PX4w==
X-Gm-Message-State: AOJu0YyPvL/ooJXx5Vx69uqD73sdr8liLpJA0wX3yD2AwGzmPZMkb0zt
	Vs6U4IbpJ9QfkgcG89rSf6wzCPliWoHqNt4EfYvM1+aui0hsxXZK++y632IrooJbFuduQAuv9KZ
	2KP/WuMvsAHxx7i0R5BGua+aNAToPcGijc9mC3Us4LOJaqCgbamroi6yWcoyTQIsMbA==
X-Gm-Gg: ASbGncsOJHVKftJKAmGZ8xicfHczuHWh6K8lqgO0YvpTTn8bmKhkQ2fvJCaFRBGRz+n
	avB03SPiDUMr1cfOmxZw12hZdSQVk7hK3nIl3nyvoK/eWBlVrLoWVdQKtE6YbqacZ40pkxQ/aqa
	U/5HBYKiHgSGvO2g7OBBlO2gTuXnmEWPj1xwwAK7y+DCJla7Vy0yBgps5oDLIdTy19Pl5iBtsDv
	4lIjTrrdJE7mU1sEK97nLD4QqKDf8WNv6c7+I1sLpgRREkv3awM/CtrplhR3kTgu+dCy2W1kCxz
	mO1GI9Dr557HkKQv16g+vLQVq0i/RgX5T//QgoZ7KSrEs1pRdlWlRDPsSPNmWV4Ktecer4ONkCh
	8j688rNHgC2Ysevrfk1giZWCHdug0hL1sKajp0EE=
X-Received: by 2002:a05:600c:4f50:b0:43d:fa59:a685 with SMTP id 5b1f17b1804b1-451f0b3d1fcmr27348335e9.33.1749049108381;
        Wed, 04 Jun 2025 07:58:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSCKuzq3sABDrmK6xE5KM5W8GUG4ustymmrLD1aZ7lqTnj4irkZMhM/KfbK8Iu1R75qfGXAw==
X-Received: by 2002:a05:600c:4f50:b0:43d:fa59:a685 with SMTP id 5b1f17b1804b1-451f0b3d1fcmr27348145e9.33.1749049107938;
        Wed, 04 Jun 2025 07:58:27 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f1b:b800:6fdb:1af2:4fbd:1fdf? (p200300d82f1bb8006fdb1af24fbd1fdf.dip0.t-ipconnect.de. [2003:d8:2f1b:b800:6fdb:1af2:4fbd:1fdf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d8006ff8sm200519545e9.34.2025.06.04.07.58.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 07:58:27 -0700 (PDT)
Message-ID: <5575b0cf-de59-4b4e-b339-c310f079bda7@redhat.com>
Date: Wed, 4 Jun 2025 16:58:25 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] mm/gup: remove (VM_)BUG_ONs
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
 Peter Xu <peterx@redhat.com>, Linus Torvalds <torvalds@linux-foundation.org>
References: <20250604140544.688711-1-david@redhat.com>
 <fb548cd0-4a6a-4e90-92b8-24c7b35df416@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <fb548cd0-4a6a-4e90-92b8-24c7b35df416@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04.06.25 16:48, Lorenzo Stoakes wrote:
> +Linus in case he has an opinion about BUG_ON() in general...
> 
> On Wed, Jun 04, 2025 at 04:05:44PM +0200, David Hildenbrand wrote:
>> Especially once we hit one of the assertions in
>> sanity_check_pinned_pages(), observing follow-up assertions failing
>> in other code can give good clues about what went wrong, so use
>> VM_WARN_ON_ONCE instead.
> 
> I guess the situation where you'd actually want a BUG_ON() is one where
> carrying on might cause further corruption so you just want things to stop.

Yes. Like, serious data corruption would be avoidable.

> 
> But usually we're already pretty screwed if the thing happened right? So
> it's rare if ever that this would be legit?
> 
> Linus's point of view is that we shouldn't use them _at all_ right? So
> maybe even this situation isn't one where we'd want to use one?

I think the grey zone is actual data corruption. But one has to have a 
pretty good reason to use a BUG_ON and not a WARN_ON_ONCE() + recovery.

> 
>>
>> While at it, let's just convert all VM_BUG_ON to VM_WARN_ON_ONCE as
>> well. Add one comment for the pfn_valid() check.
> 
> Yeah VM_BUG_ON() is just _weird_. Maybe we should get rid of all of them
> full stop?

That's my thinking a well.

> 
>>
>> We have to introduce VM_WARN_ON_ONCE_VMA() to make that fly.
> 
> I checked the implementation vs. the other VM_WARN_ON_ONCE_*()'s and it
> looks good.
> 
> I wonder if we can find a way to not duplicate this code... but one for a
> follow up I think :>)
> 
>>
>> Drop the BUG_ON after mmap_read_lock_killable(), if that ever returns
>> something > 0 we're in bigger trouble. Convert the other BUG_ON's into
>> VM_WARN_ON_ONCE as well, they are in a similar domain "should never
>> happen", but more reasonable to check for during early testing.
>>
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
>> Cc: Vlastimil Babka <vbabka@suse.cz>
>> Cc: Mike Rapoport <rppt@kernel.org>
>> Cc: Suren Baghdasaryan <surenb@google.com>
>> Cc: Michal Hocko <mhocko@suse.com>
>> Cc: Jason Gunthorpe <jgg@ziepe.ca>
>> Cc: John Hubbard <jhubbard@nvidia.com>
>> Cc: Peter Xu <peterx@redhat.com>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
> 
> LGTM so,
> 
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> 
> 

Thanks!

> One nit below.
> 
>> ---
>>
>> Wanted to do this for a long time, but my todo list keeps growing ...
> 
> Sounds familiar :) Merge window a chance to do some of these things...
> 
>>
>> Based on mm/mm-unstable
>>
>> ---
>>   include/linux/mmdebug.h | 12 ++++++++++++
>>   mm/gup.c                | 41 +++++++++++++++++++----------------------
>>   2 files changed, 31 insertions(+), 22 deletions(-)
>>
>> diff --git a/include/linux/mmdebug.h b/include/linux/mmdebug.h
>> index a0a3894900ed4..14a45979cccc9 100644
>> --- a/include/linux/mmdebug.h
>> +++ b/include/linux/mmdebug.h
>> @@ -89,6 +89,17 @@ void vma_iter_dump_tree(const struct vma_iterator *vmi);
>>   	}								\
>>   	unlikely(__ret_warn_once);					\
>>   })
>> +#define VM_WARN_ON_ONCE_VMA(cond, vma)		({			\
>> +	static bool __section(".data..once") __warned;			\
>> +	int __ret_warn_once = !!(cond);					\
>> +									\
>> +	if (unlikely(__ret_warn_once && !__warned)) {			\
>> +		dump_vma(vma);						\
>> +		__warned = true;					\
>> +		WARN_ON(1);						\
>> +	}								\
>> +	unlikely(__ret_warn_once);					\
>> +})
> 
> An aside, I wonder if we could somehow make this generic for various
> WARN_ON_ONCE()'s?

Yeah, probably. Maybe it will get .... ugly :)

> 
>>   #define VM_WARN_ON_VMG(cond, vmg)		({			\
>>   	int __ret_warn = !!(cond);					\
>>   									\
>> @@ -115,6 +126,7 @@ void vma_iter_dump_tree(const struct vma_iterator *vmi);
>>   #define VM_WARN_ON_FOLIO(cond, folio)  BUILD_BUG_ON_INVALID(cond)
>>   #define VM_WARN_ON_ONCE_FOLIO(cond, folio)  BUILD_BUG_ON_INVALID(cond)
>>   #define VM_WARN_ON_ONCE_MM(cond, mm)  BUILD_BUG_ON_INVALID(cond)
>> +#define VM_WARN_ON_ONCE_VMA(cond, vma)  BUILD_BUG_ON_INVALID(cond)
>>   #define VM_WARN_ON_VMG(cond, vmg)  BUILD_BUG_ON_INVALID(cond)
>>   #define VM_WARN_ONCE(cond, format...) BUILD_BUG_ON_INVALID(cond)
>>   #define VM_WARN(cond, format...) BUILD_BUG_ON_INVALID(cond)
>> diff --git a/mm/gup.c b/mm/gup.c
>> index e065a49842a87..3c3931fcdd820 100644
>> --- a/mm/gup.c
>> +++ b/mm/gup.c
>> @@ -64,11 +64,11 @@ static inline void sanity_check_pinned_pages(struct page **pages,
>>   		    !folio_test_anon(folio))
>>   			continue;
>>   		if (!folio_test_large(folio) || folio_test_hugetlb(folio))
>> -			VM_BUG_ON_PAGE(!PageAnonExclusive(&folio->page), page);
>> +			VM_WARN_ON_ONCE_PAGE(!PageAnonExclusive(&folio->page), page);
>>   		else
>>   			/* Either a PTE-mapped or a PMD-mapped THP. */
>> -			VM_BUG_ON_PAGE(!PageAnonExclusive(&folio->page) &&
>> -				       !PageAnonExclusive(page), page);
>> +			VM_WARN_ON_ONCE_PAGE(!PageAnonExclusive(&folio->page) &&
>> +					     !PageAnonExclusive(page), page);
> 
> Nit but wouldn't VM_WARN_ON_ONCE_FOLIO() work better here?

No, we want the actual problematic page here, as that can give us clues 
what is going wrong.

For the small-folio case above we could use it, though.

-- 
Cheers,

David / dhildenb

