Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C518F4A
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 07:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750836219; cv=none; b=KWFfDrjOmJ7wBHzk0LfaP9VDvOIDJdHmZoC1kZNiqo8WjH3Rr3WGPqJQe8iUhaxV2Z8iKC+EJtXOk5SLK4vVx6TgHgGytnUpsbmSLN4pGIP+y3J84lno9u5dMoITrAeD0aR5vbJL+dCHrajwgzn82hIkFkcfD2fvc2tY4N9w1bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750836219; c=relaxed/simple;
	bh=Hran8CiRAqKqgfL9vJ2362zzvmBx0/DZCk/j2ZX5sdI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SMqYScifFOI2Uz2aF+iZzCu9aMPqwhO2DAIr3g8Sh49G4S6xn2hpRzdAgaihJj/wCC+e63OllhzAI12fHLpKFi8XAQWxJUSDcIJ4M9CgK+7Y/7BSUTZvqJel4Xp3U7Zn+olNlNSoXzE2Cc74xIvatbba/OmHhiwVZ0O8uH6fEDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hGjY0r6A; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hGjY0r6A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750836216;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=a3KTdeHUu8GHZCADGGmhQ8ofhnT3M3IFKWPoU6/iCcw=;
	b=hGjY0r6Ann+4iUXipv9cUqxgbGgH7Kal7Rwxtsb7jsjVK3+1FpEjRA+hjBtEy46XubeBJf
	eU1W9UKgQroY7bXZsVaspWc9dlrdSEu/onIVpdcTlf1p2XaQq9oCDwxw21mUUkoykpcBir
	XNB8WV4exuWQrUZ4ag0p0fCJGmcOCi4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-44-N2kKs5EwOTa1fUb9IMfn7A-1; Wed, 25 Jun 2025 03:23:34 -0400
X-MC-Unique: N2kKs5EwOTa1fUb9IMfn7A-1
X-Mimecast-MFC-AGG-ID: N2kKs5EwOTa1fUb9IMfn7A_1750836214
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-453691d0a1dso25695465e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 00:23:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750836213; x=1751441013;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=a3KTdeHUu8GHZCADGGmhQ8ofhnT3M3IFKWPoU6/iCcw=;
        b=BZH23yVOQ3lyau4/GHtUkR/FF1wHVFUZDqh1K6nVt3SZ4P7Tz0hLf9ZVksAUH+/GJv
         mEwDuy3fK2382NmuPt9WSl6cZb5lis8O0qtYRBV/jzunJq6RUuX7ITx5l1tRDjJBwuZ1
         2sl98mVBMHCo0GhI7ASryRqlVG/T6y5J14OHkA8DUF1sRu//MnYPvsFRd1NoK3osEzKx
         UuNIk6AS/005hZBq3JFDW7bIgLFh9gsxRMNRkiF+GYynX4skecP9BfQWyasXTFFXMZS0
         2rrgiSYNznhe3pzW4ysg1dTkSyN2Fa0XMKVrjaePP9kwS8sN8otJO3XUkCvNBG8vlgjx
         ec1g==
X-Forwarded-Encrypted: i=1; AJvYcCUeIi+uzRK0F20raBjRTHFQjHaW+UP08HMJ1dw+c9cZ/k9nuWeQusCYjkxw6EKuETL4mpk7jTvRYr5igLM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMsl5AZFeQOP6TCYApudkcAyS63aoBOMnY6NzjJ73lrT/BjqzJ
	ESqLy9lu2A3B84dtkoDIetdJPNQbqcq+vH62X4fxTdulOp39XoXFsU5FNczXnn13s5rkgnds2Uh
	o6p2U88VEp5gttdKp22rbGRauj7IeFT5UoE+acMRiCBn8wJ5DLYA/0Ddj1mbm1C2lBQ==
X-Gm-Gg: ASbGncuGPXE7hdUMz44CpGuASYCg14uQqr0rWroONOA+SvWCxRJT0VKaTi2ULmq9lpc
	N1G2tf4pcU4vaL1W4wtWrlDwOPb1kweB/soHXTFjyArPqt2swetYLBLvVFAhpDL6RGtXobYZVv8
	0AyDcZqcWOGDuK3Aedf5+oQvr7vGP2l4+pl/s6xxDrN/ipGPzwe8/qFeMBqtVUWDlhykE3A9IiY
	okOjaZwupkT5OErBrmbOKngC6rCQGBR+tEfcQe4gdpiswIvh2F1SL4hkn/poceNl2qHXB8EAW5y
	z0av74X/93jF7OmSKDSoaSDaLL3uTNGWck6SoJdA5wn3rAQeBLGHU42AdtNUn/V7jZd4FCV4S+I
	JM2WbR0SBaWm/jP2HiTcgJtqrdMtaEIuZudo9WIUMNYHJ
X-Received: by 2002:a05:600c:5306:b0:441:d2d8:bd8b with SMTP id 5b1f17b1804b1-45381aaa03fmr15980995e9.8.1750836213537;
        Wed, 25 Jun 2025 00:23:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IElJceROIW/vxdIONPCC4EAzXZp58f5+S5Nk0sWx5bUmxq7ePyGWfrxDC6p2riHV/GW5m5sKg==
X-Received: by 2002:a05:600c:5306:b0:441:d2d8:bd8b with SMTP id 5b1f17b1804b1-45381aaa03fmr15980765e9.8.1750836213128;
        Wed, 25 Jun 2025 00:23:33 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f12:1b00:5d6b:db26:e2b7:12? (p200300d82f121b005d6bdb26e2b70012.dip0.t-ipconnect.de. [2003:d8:2f12:1b00:5d6b:db26:e2b7:12])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e805dc00sm3938244f8f.31.2025.06.25.00.23.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 00:23:32 -0700 (PDT)
Message-ID: <9cb94544-f65a-4394-b1e2-bfb226ead31c@redhat.com>
Date: Wed, 25 Jun 2025 09:23:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] fix MADV_COLLAPSE issue if THP settings are
 disabled
To: Hugh Dickins <hughd@google.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, ziy@nvidia.com, lorenzo.stoakes@oracle.com,
 Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com,
 dev.jain@arm.com, baohua@kernel.org, zokeefe@google.com,
 shy828301@gmail.com, usamaarif642@gmail.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <cover.1750815384.git.baolin.wang@linux.alibaba.com>
 <75c02dbf-4189-958d-515e-fa80bb2187fc@google.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <75c02dbf-4189-958d-515e-fa80bb2187fc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25.06.25 07:53, Hugh Dickins wrote:
> On Wed, 25 Jun 2025, Baolin Wang wrote:
> 
>> When invoking thp_vma_allowable_orders(), if the TVA_ENFORCE_SYSFS flag is not
>> specified, we will ignore the THP sysfs settings. Whilst it makes sense for the
>> callers who do not specify this flag, it creates a odd and surprising situation
>> where a sysadmin specifying 'never' for all THP sizes still observing THP pages
>> being allocated and used on the system. And the MADV_COLLAPSE is an example of
>> such a case, that means it will not set TVA_ENFORCE_SYSFS when calling
>> thp_vma_allowable_orders().
>>
>> As we discussed in the previous thread [1], the MADV_COLLAPSE will ignore
>> the system-wide anon/shmem THP sysfs settings, which means that even though
>> we have disabled the anon/shmem THP configuration, MADV_COLLAPSE will still
>> attempt to collapse into a anon/shmem THP. This violates the rule we have
>> agreed upon: never means never.
>>
>> For example, system administrators who disabled THP everywhere must indeed very
>> much not want THP to be used for whatever reason - having individual programs
>> being able to quietly override this is very surprising and likely to cause headaches
>> for those who desire this not to happen on their systems.
>>
>> This patch set will address the MADV_COLLAPSE issue.
>>
>> Test
>> ====
>> 1. Tested the mm selftests and found no regressions.
>> 2. With toggling different Anon mTHP settings, the allocation and madvise collapse for
>> anonymous pages work well.
>> 3. With toggling different shmem mTHP settings, the allocation and madvise collapse for
>> shmem work well.
>> 4. Tested the large order allocation for tmpfs, and works as expected.
>>
>> [1] https://lore.kernel.org/all/1f00fdc3-a3a3-464b-8565-4c1b23d34f8d@linux.alibaba.com/
>>
>> Changes from v3:
>>   - Collect reviewed tags. Thanks.
>>   - Update the commit message, per David.
>>
>> Changes from v2:
>>   - Update the commit message and cover letter, per Lorenzo. Thanks.
>>   - Simplify the logic in thp_vma_allowable_orders(), per Lorenzo and David. Thanks.
>>
>> Changes from v1:
>>   - Update the commit message, per Zi.
>>   - Add Zi's reviewed tag. Thanks.
>>   - Update the shmem logic.
>>
>> Baolin Wang (2):
>>    mm: huge_memory: disallow hugepages if the system-wide THP sysfs
>>      settings are disabled
>>    mm: shmem: disallow hugepages if the system-wide shmem THP sysfs
>>      settings are disabled
>>
>>   include/linux/huge_mm.h                 | 51 ++++++++++++++++++-------
>>   mm/shmem.c                              |  6 +--
>>   tools/testing/selftests/mm/khugepaged.c |  8 +---
>>   3 files changed, 43 insertions(+), 22 deletions(-)
>>
>> -- 
>> 2.43.5
> 
> Sorry for chiming in so late, after so much effort: but I beg you,
> please drop these.
> 
> I did not want to get into a fight, and had been hoping a voice of
> reason would come from others, before I got around to responding.

Thanks for being that voice of reason :)

I would have hoped someone from the original discussion would have 
raised that this was indeed all discussed before (below).

> 
> And indeed Ryan understood correctly at the start; and he, Usama
> and Barry, perhaps others I've missed, have raised appropriate
> concerns but not prevailed.
> 
> If we're sloganeering, I much prefer "never break userspace" to
> "never means never", attractive though that over-simplification is.

Well, one could argue we broke user space (admin settings) when we 
converted "never" to no longer mean "never", but "never by page faults + 
khugepaged". And we did so without updating the documentation.

I finally went back and checked the original discussions and, yes, this 
was deliberate [1].

As so often, we created a mess with THP toggles.

Probably best to fixup the "never" documentation, and state that there 
is no way to disable MADV_COLLAPSE anymore.

I agree that if we want a way to disable all of them, we better have a 
"deny" now. ... until someone else breaks that, then we can have a 
"really_never_deny_all" etc. ;)

[1] 
https://lore.kernel.org/linux-mm/CAAa6QmTCuHWuQ=dcdPX8hS3mKMucwjsjEoBCeFoDSwXCca6hpA@mail.gmail.com/

-- 
Cheers,

David / dhildenb

