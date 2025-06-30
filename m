Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E53518FDBE
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 08:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751271567; cv=none; b=LDjqvEiSawWgWckktrKuB0mnlyqQRFgD/pbDggVfvq3TiweAeL1rn35aP5LkdGzknL3w9w4skR1A037EoWVYFYppXsBzrQ4iAuLWPq0DjS17XuKj5LZHFeMVxlZOu5ZbXpZB7BAKbMy8yhML/lAYrBaRQd29LNlaQLbyHy9TOhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751271567; c=relaxed/simple;
	bh=MtsChutNFwNy1BrMKOU5qVnMBx9E1vhTkQh2TkQ2ZjM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BUmP1qJpjfmLX2uVV/ugLZgU6O742r+GSzEPxN1tGxwiHP2tD9G8Xqwr+IrIXlPAMk9vh5M+MxldxqYeiDUlIdIhGnf4uwBAnvENIU0PdAnoyRMneyuYOov/YUN1e2feH+cg/ItEF8xXaLGj9cLEilZ1xSrgcJzy01Owm5TEji8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EXTwPACN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EXTwPACN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751271564;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=6rjuiBdCgCZQ3wUNP8WG3kJosrNfsI+VGS+0nYYi6/s=;
	b=EXTwPACNd4cICFhE0IdJ8JjWrTdi9oGQt7gAv41tlaRhr+4R/4j3qLnaeaKajIilMe9kE8
	P/ppg6AQ4TIaLiqh3NZtbXXhyI6pRI8Aym3/SJhPgZW7h5SdYsoU5optzCTZvFra3fexU6
	rdrSMKZAAYmovfv8P5SFnadK7SgRB7Q=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-JqOr8wlBOKacxhvsxMPVxQ-1; Mon, 30 Jun 2025 04:19:23 -0400
X-MC-Unique: JqOr8wlBOKacxhvsxMPVxQ-1
X-Mimecast-MFC-AGG-ID: JqOr8wlBOKacxhvsxMPVxQ_1751271562
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4f8fd1847so1790092f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 01:19:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751271562; x=1751876362;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6rjuiBdCgCZQ3wUNP8WG3kJosrNfsI+VGS+0nYYi6/s=;
        b=uxMr8GWKi86MrT3Le+GJ6K/hyEq8hNyTWeJjuaA80WrSwILiOdoWXEqi1xn+HmImGK
         D+XvJzc+lttXwF6tg6+ftmgDm75VfD0SZZp50vDjzZSPoErHO4mw2QzPJUrcxtTiZN4h
         7G4bzxD4jmtnS+s2RekpNKJoW1shKqcDsccuEWwo22aYkWzhWoQ5q1bcaThAAyKszCSC
         xnbD35Q57n2XuE6FoeOtZ5aeL+FWIYEoUzOQB8BRh57iKjDGDvGLTMdcDgis3QHe+EWz
         FVEdglNDHwvA21SiRhvaAF6vwcNnUeAA7zzPQMicyVxKSwXrsDKgtDbRaQNPUA3SndE8
         yTrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXi6AOQkVJPL0Hs5lYjQmOIgsuVI+dSKiEnUfzocnMIgHfynZ5br4Lwv60L/2QvaufKCUv+BblFFPmSC4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSUzskPUKTs7OZeRbCs+4i8OIG1RlFeW8thW31OwwT4Td6i4vO
	vjUFqjWGylaBuv0kNpddjCRK3qpq+iNEdcSWPkMZ4yhmvijWNofhRflfbiELfWt1T81zibjR8N9
	S8zwX5Q/rlOiuaD+1UsFEw/pwCPyDfRTxf6U0ppG0UbSJlZPfm5qTJLZSqFhaAc4FlA==
X-Gm-Gg: ASbGncupIObTW/ByzE1AWc/BF6JMEZdlis3xrdQYwc03HeG+lsUWqkSItMEnpfAXOpx
	9kTJ6rYV/6ii4jXDGZXhalORiwFet4Ba8T1rPPaaonNbj7OmMDCYjB92GvuROJUSZwHsDwjXURM
	y9PFR/uTdv61e/GNcI255bUxMt2VgS2MOD4OQ77fUV7e6hSGkNj8Bw0/I3rf17JFcdXsXt6F9Ps
	TdAaKdF2DnvQmJgK+4uUwWgHAlOEDhsm84aYfeXDGqdsWfXuFVd1XcbchNX1is+iisIkk/j7Oo4
	kJSizWISnwxoai7YIr33ZCsqwBh+DfIN/cQFuDgb4oSoftwnx8pBW0YBfgzO/AbmEK8kDiDzUMX
	suKX64WZOxFcaakLR4bOFAYjtbxVlUnMwkzwU4EUvVzJDfrfMgg==
X-Received: by 2002:a5d:55c9:0:b0:3a4:dd02:f724 with SMTP id ffacd0b85a97d-3a900575c7amr8096879f8f.43.1751271561848;
        Mon, 30 Jun 2025 01:19:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhLzuzoEbHQBeZGJMzeuEUvwVC7mTrWLoncZmfxcMXqw0Ym2aGta0QiTRTEJa8+OCCMSwQsQ==
X-Received: by 2002:a5d:55c9:0:b0:3a4:dd02:f724 with SMTP id ffacd0b85a97d-3a900575c7amr8096848f8f.43.1751271561415;
        Mon, 30 Jun 2025 01:19:21 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f40:b300:53f7:d260:aff4:7256? (p200300d82f40b30053f7d260aff47256.dip0.t-ipconnect.de. [2003:d8:2f40:b300:53f7:d260:aff4:7256])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c8013fesm9865476f8f.38.2025.06.30.01.19.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 01:19:20 -0700 (PDT)
Message-ID: <fd84915d-2702-405d-8d9a-d1ef21e6f563@redhat.com>
Date: Mon, 30 Jun 2025 10:19:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] khugepaged: Reduce race probability between migration and
 khugepaged
To: Dev Jain <dev.jain@arm.com>, Anshuman Khandual
 <anshuman.khandual@arm.com>, akpm@linux-foundation.org
Cc: ziy@nvidia.com, baolin.wang@linux.alibaba.com,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, baohua@kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250630044837.4675-1-dev.jain@arm.com>
 <786c83e0-d69f-4fa3-a39c-94c4dfc08a20@arm.com>
 <28bc843d-615f-4848-988b-31a0a2921d14@arm.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <28bc843d-615f-4848-988b-31a0a2921d14@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30.06.25 10:12, Dev Jain wrote:
> 
> On 30/06/25 1:25 pm, Anshuman Khandual wrote:
>> On 30/06/25 10:18 AM, Dev Jain wrote:
>>> Suppose a folio is under migration, and khugepaged is also trying to
>>> collapse it. collapse_pte_mapped_thp() will retrieve the folio from the
>>> page cache via filemap_lock_folio(), thus taking a reference on the folio
>>> and sleeping on the folio lock, since the lock is held by the migration
>>> path. Migration will then fail in
>>> __folio_migrate_mapping -> folio_ref_freeze. Reduce the probability of
>>> such a race happening (leading to migration failure) by bailing out
>>> if we detect a PMD is marked with a migration entry.
>> Could the migration be re-attempted after such failure ? Seems like
>> the migration failure here is traded for a scan failure instead.
> 
> We already re-attempt migration. See NR_MAX_MIGRATE_PAGES_RETRY and
> NR_MAX_MIGRATE_ASYNC_RETRY. Also just before freezing the refcount,
> we do a suitable refcount check in folio_migrate_mapping(). So the
> race happens after this and folio_ref_freeze() in __folio_migrate_mapping(),
> therefore the window for the race is already very small in the migration
> path, but large in the khugepaged path.
>    
> 
>>
>>> This fixes the migration-shared-anon-thp testcase failure on Apple M3.
>> Could you please provide some more context why this test case was
>> failing earlier and how does this change here fixes the problem ?
> 
> IMHO the explanation I have given in the patch description is clear
> and succinct: the testcase is failing due to the race. This patch
> shortens the race window, and the test on this particular hardware
> does not hit the race window again.
> 
>>
>>> Note that, this is not a "fix" since it only reduces the chance of
>>> interference of khugepaged with migration, wherein both the kernel
>>> functionalities are deemed "best-effort".
>>>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>>> ---
>>>
>>> This patch was part of
>>> https://lore.kernel.org/all/20250625055806.82645-1-dev.jain@arm.com/
>>> but I have sent it separately on suggestion of Lorenzo, and also because
>>> I plan to send the first two patches after David Hildenbrand's
>>> folio_pte_batch series gets merged.
>>>
>>>    mm/khugepaged.c | 12 ++++++++++--
>>>    1 file changed, 10 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
>>> index 1aa7ca67c756..99977bb9bf6a 100644
>>> --- a/mm/khugepaged.c
>>> +++ b/mm/khugepaged.c
>>> @@ -31,6 +31,7 @@ enum scan_result {
>>>    	SCAN_FAIL,
>>>    	SCAN_SUCCEED,
>>>    	SCAN_PMD_NULL,
>>> +	SCAN_PMD_MIGRATION,
>>>    	SCAN_PMD_NONE,
>>>    	SCAN_PMD_MAPPED,
>>>    	SCAN_EXCEED_NONE_PTE,
>>> @@ -941,6 +942,8 @@ static inline int check_pmd_state(pmd_t *pmd)
>>>    
>>>    	if (pmd_none(pmde))
>>>    		return SCAN_PMD_NONE;
>>> +	if (is_pmd_migration_entry(pmde))
>>> +		return SCAN_PMD_MIGRATION;
>>>    	if (!pmd_present(pmde))
>>>    		return SCAN_PMD_NULL;
>>>    	if (pmd_trans_huge(pmde))
>>> @@ -1502,9 +1505,12 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
>>>    	    !range_in_vma(vma, haddr, haddr + HPAGE_PMD_SIZE))
>>>    		return SCAN_VMA_CHECK;
>>>    
>>> -	/* Fast check before locking page if already PMD-mapped */
>>> +	/*
>>> +	 * Fast check before locking folio if already PMD-mapped, or if the
>>> +	 * folio is under migration
>>> +	 */
>>>    	result = find_pmd_or_thp_or_none(mm, haddr, &pmd);
>>> -	if (result == SCAN_PMD_MAPPED)
>>> +	if (result == SCAN_PMD_MAPPED || result == SCAN_PMD_MIGRATION)
>> Should mapped PMD and migrating PMD be treated equally while scanning ?
> 
> SCAN_PMD_MAPPED is used as an indicator to change result to SCAN_SUCCEED
> in khugepaged_scan_mm_slot: after the call to collapse_pte_mapped_thp. And,
> it is also used in madvise_collapse() to do ++thps which is used to set the
> return value of madvise_collapse. So I think this approach will be wrong.

But if it already is PMD mapped (just temporarily through a migration 
entry), isn't this exactly what we want?

-- 
Cheers,

David / dhildenb

