Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F01F24887D
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 08:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748335254; cv=none; b=s0DMvfo54D/LKvl1WDOwacO9bXQ7a5ThiM1SLX6GOcOKsFtgAqXtVfVZmbnw/3MWjNhZhw1gIZZ0j05HOxPJSY1Gwzamd80hN3yG2uVmVdhgiP4uOxZZwXzyX8hT5LPygbEEgi71yAB2ZvI7lA6s3ulf2fXpe1m1ZOljp8mM6ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748335254; c=relaxed/simple;
	bh=vYpe9znuVq6oIkVDRJjx6HZ2DivnVC6vfN7c1ohY4U8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A6X5/qSCBYx9PRsHevhQcqEKdMLzc4UyvNrD0PO7AN28ZGJhs+v29fKLgVhxttp8thCL3PHxlnZ3luBNWj0HJWZVEx3gKtyfdQIplKGpYD43yNX6JQmq2OUxA+Ep2kCxfjTAgV47pVILFdz7QafIBJ5Vs/lq6zAjWcvpX9c4QFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fFIEFfTi; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fFIEFfTi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748335251;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=6j1tnrm2oQ1B9QVBiBphU2xxo1w1QOyD4Ch9K10dgYw=;
	b=fFIEFfTijRJZf6OhQAsnefefqewWVYKkCtU/8f/Lz+cdGPN+UflK4TruWibFc093sQdUft
	VUVvt3sv99Rnj687b5J+Ie08MNsT7lzbEQYqZK9Aqb8ZISBT7ldW+pAhhqj+pkdU9XdMzJ
	V6BYNxkjkthQW3Dcxl09Al26ZWgFkVE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-376-mmbQ2V_DPruUaMNI4gl_qQ-1; Tue, 27 May 2025 04:40:49 -0400
X-MC-Unique: mmbQ2V_DPruUaMNI4gl_qQ-1
X-Mimecast-MFC-AGG-ID: mmbQ2V_DPruUaMNI4gl_qQ_1748335249
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43eed325461so19756915e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 01:40:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748335248; x=1748940048;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6j1tnrm2oQ1B9QVBiBphU2xxo1w1QOyD4Ch9K10dgYw=;
        b=MJpotM/FUie9i8lLo0cMS8qSHMC/KEi8GF8RhrYz5IXDuWQ2Z48Xubsq9Tu4s+2RkY
         qP3LM60Um+oloVj+kzrgZhfcLg2smFdsn5StOBtJyCUcglZ4HYT3pwx9QcV8zj8A0Kce
         geKGDLEmLVLnSt4HfJ39eaApJuUqCWKaxNs6xJ/+VDzmBhDw6VUoRUua46MkjbFlmFHp
         feALvcBZSRmGT6amywyaGB8nkhtvHYhJn0wCpxnYF9+OmSs8Z7Oje41KyUKjDb6Ob8It
         gpH7x9SIprfSVcewuruHod3eRTLXv9sDxd4TDtQdrg3YMGrlcwFmXxNTTHEyUYvH/H9E
         CYQA==
X-Forwarded-Encrypted: i=1; AJvYcCUe96wTDFMbn1gvAn9au7cj6XEU80hqqseOgUoj+EO4lPjEOIxRNDJwLB0Qtf4GGjL1PG5pwifF9Mnbvp0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+gkUXMoVykDzzdQSsXnHxyhO12VXSOCOZcWllLLTUqok3Yhu7
	c5W5fb9j3gMlxzMCAqG+Nn5KI+6ItbhTw3pjwiiyd+Shs1eEwb2KKbeX9WdxbIsEzylKT5dXYFd
	O1MeuVs8TqK5ueua2X7EGt4EKT2t2Gt59ifZzJCNMbUaAWUhLn85bRsnm1mxVHBbrhQ==
X-Gm-Gg: ASbGnctzsfrz1RHGLf0q5eCsTWDi+FgCfTBFUEZburp5vLDT+NkvfOJ3EtCtUldp7/E
	UhjozPEDcwePLb0hVv1PgC98myfKX8DkxN2EH3Q/W19R5DSO6bItc02hynQ5xNWccnAJmedcvdA
	yQ+vAcGW2swbbK3ih8B5Zvhsk/90nAK60ceVwpGWj4v0ehMF1j8GdaVkvyQcP2nS7foJB1AL0Mp
	d1cGanh4aM4EVLB0q+DIGTLWKpd4kl5pjR9q6KPXPe7uw0Lsby6ou1nqc2pmvMpx71U8sc9eMWF
	8Lqy1ZREJJ3VwXCSHug/8GNDIYRjuIRJ1i0rVb4QpKTS
X-Received: by 2002:a05:600c:1d82:b0:442:ccfa:18c with SMTP id 5b1f17b1804b1-44c94c2b056mr81699745e9.32.1748335248607;
        Tue, 27 May 2025 01:40:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEx0z7TPrzjPsmfvznphXdQAB56nXeyTUbbd5ltvN4gjQsG4IyK3ivh/WD9byy1zzlV4p5GTQ==
X-Received: by 2002:a05:600c:1d82:b0:442:ccfa:18c with SMTP id 5b1f17b1804b1-44c94c2b056mr81699415e9.32.1748335248167;
        Tue, 27 May 2025 01:40:48 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-44fcd135f6bsm12749905e9.3.2025.05.27.01.40.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 01:40:47 -0700 (PDT)
Message-ID: <d405f2ba-7e3a-4914-8a6b-01704f449d69@redhat.com>
Date: Tue, 27 May 2025 10:40:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 1/2] mm/khugepaged: fix race with folio split/free
 using temporary reference
To: Dev Jain <dev.jain@arm.com>, Shivank Garg <shivankg@amd.com>,
 akpm@linux-foundation.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc: ziy@nvidia.com, baolin.wang@linux.alibaba.com,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, fengwei.yin@intel.com, bharata@amd.com,
 syzbot+2b99589e33edbe9475ca@syzkaller.appspotmail.com
References: <20250526182818.37978-1-shivankg@amd.com>
 <b19653ae-8c9a-46f1-af93-3d09c3b0759e@arm.com>
 <0dc0fef0-ec1d-4971-81e6-0add808a8551@redhat.com>
 <cf22aeef-0160-46f8-b2e3-d308ccee0504@arm.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <cf22aeef-0160-46f8-b2e3-d308ccee0504@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 27.05.25 10:06, Dev Jain wrote:
> 
> On 27/05/25 1:18 pm, David Hildenbrand wrote:
>> On 27.05.25 05:20, Dev Jain wrote:
>>>
>>> On 26/05/25 11:58 pm, Shivank Garg wrote:
>>>> hpage_collapse_scan_file() calls is_refcount_suitable(), which in turn
>>>> calls folio_mapcount(). folio_mapcount() checks folio_test_large()
>>>> before
>>>> proceeding to folio_large_mapcount(), but there is a race window
>>>> where the
>>>> folio may get split/freed between these checks, triggering:
>>>>
>>>>      VM_WARN_ON_FOLIO(!folio_test_large(folio), folio)
>>>>
>>>> Take a temporary reference to the folio in hpage_collapse_scan_file().
>>>> This stabilizes the folio during refcount check and prevents incorrect
>>>> large folio detection due to concurrent split/free. Use helper
>>>> folio_expected_ref_count() + 1 to compare with folio_ref_count()
>>>> instead of using is_refcount_suitable().
>>>>
>>>> Fixes: 05c5323b2a34 ("mm: track mapcount of large folios in single
>>>> value")
>>>> Reported-by: syzbot+2b99589e33edbe9475ca@syzkaller.appspotmail.com
>>>> Closes:
>>>> https://lore.kernel.org/all/6828470d.a70a0220.38f255.000c.GAE@google.com
>>>>
>>>> Suggested-by: David Hildenbrand <david@redhat.com>
>>>> Acked-by: David Hildenbrand <david@redhat.com>
>>>> Signed-off-by: Shivank Garg <shivankg@amd.com>
>>>> ---
>>>
>>> The patch looks fine.
>>>
>>> I was just wondering about the implications of this on migration.
>>> Earlier
>>> we had a refcount race between migration and shmem page fault via
>>> filemap_get_entry()
>>> taking a reference and not releasing it till we take the folio lock,
>>> which was held
>>> by the migration path. I would like to *think* that real workloads,
>>> when migrating
>>> pages, will *not* be faulting on those pages simultaneously, just
>>> guessing. But now
>>> we have a kernel thread (khugepaged) racing against migration. I may
>>> just be over-speculating.
>>
>> I'm not quite sure I understand the concern you have. Any temporary
>> reference can temporarily block migration, however, the retry logic
>> should be able to handle that just fine -- and this code is not really
>> special (see filemap_get_entry()).
> 
> 
> You are correct that any temp ref can block migration, however, that
> reference has to come after the folios have been isolated in the
> migration path.
> 
> So the probability of someone taking a reference on the folio is quite
> low since it has been isolated. The problem with filemap_get_entry() is
> that it finds
> 
> the folio in the pagecache, so isolation is useless, then takes a
> reference and then shmem_get_folio_gfp() does a folio_lock() instead of
> folio_try_lock().
> 
> This was the race which I talked about an year back at [1]. My concern
> is that we are adding another candidate to that race; just wondering if
> there is
> 
> a better solution to fix the race mentioned in Shivank's patchset.

Note that in this code here, we're not locking the folio just yet, we're 
only grabbing a reference for a very short time.

We will isolate+lock the folios in collapse_file(), where we also lock 
all slots in the pagecache.

The alternative would be to also lock all slots here, which is arguably 
worse.

-- 
Cheers,

David / dhildenb

