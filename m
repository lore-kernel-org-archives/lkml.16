Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE331C6FF3
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 19:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750706532; cv=none; b=uf59fqIhWyq/LVsCsIB9eCml/K8z0DtRt8Y3pXWfTSCmgpqmGKE9VGBGlpjqgr3FYd0dcwedWrG7qMZ27WMvv8+ca7c4huMWoHht2fEcBnqL6M1LO+vf3gZRteG6Ls98ZoyJafkdFUqvdB+v+wCXcJGg25wcrIhOhELHe4jhvBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750706532; c=relaxed/simple;
	bh=ZK3S0XPxcmYiS4vVibj9PCsaH7tpzJ/rlgCHRYNpd4U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NnHzSJ+phz6Z/qaLfi+CKIxPNSiBByryy8Qd1U/7UN+UrNT7UQRqM8EktXdwuRAa8ApuOmdV4dzGOcip65FbL2RwhVOgNuKaztC/pTSTe+XyUAVFDu33TkGfQNuc4Bvh6YFvrq+5/r3c7tJmrlLG78lnHwmzwpmeCzL0Ma9FtBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Qiaz0dtn; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Qiaz0dtn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750706529;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=bQlmBkT7YPFLGN3jkndyeHxVU2LJMrxMkjzinTzeACw=;
	b=Qiaz0dtnedw+Mrwqrb1vSYxg9WwO6ND4i41udqhF9DEkIHanzR6cXWFuCOeEZCFtUJzjRY
	aSOeQ09hI39hgswoQZIumJuOOvLLdALgd2nCtog+SNj2ZYwF3q/6KkSdZn/qX6b604hM+q
	r9e17si98wn3s6Yoj0IgoMa5SJNbXUA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-294-4wY6JvvTMLi8wM-O5UeFRA-1; Mon, 23 Jun 2025 15:22:07 -0400
X-MC-Unique: 4wY6JvvTMLi8wM-O5UeFRA-1
X-Mimecast-MFC-AGG-ID: 4wY6JvvTMLi8wM-O5UeFRA_1750706526
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a4fac7fa27so1723672f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 12:22:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750706526; x=1751311326;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bQlmBkT7YPFLGN3jkndyeHxVU2LJMrxMkjzinTzeACw=;
        b=HOt1PdZoWrXRkK4H6PotQ0jl/zASkm0/jd9EPrjisrDEjUBqxJkCogTQqlY/UlqP08
         QZCZjIhLTM1MIHGxQ6ALS9Rp/ie4pnqdTNtdDp+UjYPS3EOyvMLdgd6DergxbYqFiIUo
         4XCVyDjF7wc0mqNN0h0x9srRPDnokiTerpr+LjVmnqeJntW+mz1lIAGaok9WCEWrQJac
         OaZ0amjUq1OMu1jxTTJ3bc9iPs+kSmw9oYsMwYkvZ3+aVVg7giFxHbvkzixYaxg9QIb4
         qu/kKw2m8TpSmN/nnTLblp+BQbueMvPWFZI2fEDfK5dKn5J4voDDyDPFBxgtQzRF6JWX
         rOFQ==
X-Gm-Message-State: AOJu0YyYVPBhtRxkx40666xKgXnFgFWyPUdYx0srFA5zoT5Rt2yIxtLs
	c6WhzBS0LbfGSagz+8pmNMGeQp+oXRnr0Js5RmMedFo8IG18VI0OOA3u3x6jRGk49o42mRbjTgO
	FrApI+XWazGWrJeeUOcemNMi0ssKPg1ASJAaeUQghVI7pVIZgC7FXl6FSsj/4DvWjlPjTx6tYLf
	FL
X-Gm-Gg: ASbGncujTeS7h9XUx1sCxpqZRAyaYmcxbDEU5SizvkV3AZqLKGxhqaprkyb21ZTqMx5
	1aZ0fyCg8JQFkBh3Sp0nuncHzs8DiLsuEfMNmfAl96k4HpFSbTBZBwBVBKTJsv0Bn2AF8G6Vi65
	wGpn62kAATfScU4R+lksRxAh6rjbJRuNnLQhXaUU5WrRDpderUJZ9uPVrmxdHknJGalDrzaMHqd
	1PD+JmLxNonxW6yzIvUOyX6g+SREDWGn9Ui8W4/4YzcrRtZcOr8BWFWMMp1Wo8rZrlXC4CADR3t
	1OpCZ4l3j/sFUUk6DgW6D7oZY4tAtk9YHtYyGTEE/GeURIdKe97T7OZ2+gAGgrOJBwfQqxQPJw2
	YL/tkLMoK+LEWgJAn+GqDH0p32Ro8vc62psRSyhwFCQGQ6I3cNg==
X-Received: by 2002:a05:6000:2890:b0:3a4:d4e5:498a with SMTP id ffacd0b85a97d-3a6d130d49cmr11494755f8f.42.1750706526335;
        Mon, 23 Jun 2025 12:22:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF87md/e3MMQCR4P74foXjnNwaFCtfLKwq6x9gBQ7WUQ/oG8Mjxt52qiatY+Y1JHSf1QQrKdw==
X-Received: by 2002:a05:6000:2890:b0:3a4:d4e5:498a with SMTP id ffacd0b85a97d-3a6d130d49cmr11494745f8f.42.1750706525946;
        Mon, 23 Jun 2025 12:22:05 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4e:fd00:8e13:e3b5:90c8:1159? (p200300d82f4efd008e13e3b590c81159.dip0.t-ipconnect.de. [2003:d8:2f4e:fd00:8e13:e3b5:90c8:1159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f1d902sm9900905f8f.43.2025.06.23.12.22.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 12:22:05 -0700 (PDT)
Message-ID: <4d35795f-df24-40eb-a1e8-2914b0f5d697@redhat.com>
Date: Mon, 23 Jun 2025 21:22:03 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 03/14] mm: compare pfns only if the entry is present
 when inserting pfns/pages
To: Oscar Salvador <osalvador@suse.de>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, nvdimm@lists.linux.dev,
 Andrew Morton <akpm@linux-foundation.org>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Dan Williams <dan.j.williams@intel.com>, Alistair Popple
 <apopple@nvidia.com>, Matthew Wilcox <willy@infradead.org>,
 Jan Kara <jack@suse.cz>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>
References: <20250617154345.2494405-1-david@redhat.com>
 <20250617154345.2494405-4-david@redhat.com>
 <aFVhvYbRH2dtiFKY@localhost.localdomain>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <aFVhvYbRH2dtiFKY@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20.06.25 15:27, Oscar Salvador wrote:
> On Tue, Jun 17, 2025 at 05:43:34PM +0200, David Hildenbrand wrote:
>> Doing a pte_pfn() etc. of something that is not a present page table
>> entry is wrong. Let's check in all relevant cases where we want to
>> upgrade write permissions when inserting pfns/pages whether the entry
>> is actually present.
> 
> Maybe I would add that's because the pte can have other info like
> marker, swp_entry etc.
> 
>> It's not expected to have caused real harm in practice, so this is more a
>> cleanup than a fix for something that would likely trigger in some
>> weird circumstances.
>>
>> At some point, we should likely unify the two pte handling paths,
>> similar to how we did it for pmds/puds.
>>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
> 
> Reviewed-by: Oscar Salvador <osalvador@suse.de>
> 
> Should we scream if someone passes us a non-present entry?
> 

Probably? Good point, let me think about that.

> 
>> ---
>>   mm/huge_memory.c | 4 ++--
>>   mm/memory.c      | 4 ++--
>>   2 files changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>> index 8e0e3cfd9f223..e52360df87d15 100644
>> --- a/mm/huge_memory.c
>> +++ b/mm/huge_memory.c
>> @@ -1392,7 +1392,7 @@ static int insert_pmd(struct vm_area_struct *vma, unsigned long addr,
>>   		const unsigned long pfn = fop.is_folio ? folio_pfn(fop.folio) :
>>   					  fop.pfn;
>>   
>> -		if (write) {
>> +		if (write && pmd_present(*pmd)) {
>>   			if (pmd_pfn(*pmd) != pfn) {
>>   				WARN_ON_ONCE(!is_huge_zero_pmd(*pmd));
>>   				return -EEXIST;
>> @@ -1541,7 +1541,7 @@ static void insert_pud(struct vm_area_struct *vma, unsigned long addr,
>>   		const unsigned long pfn = fop.is_folio ? folio_pfn(fop.folio) :
>>   					  fop.pfn;
>>   
>> -		if (write) {
>> +		if (write && pud_present(*pud)) {
>>   			if (WARN_ON_ONCE(pud_pfn(*pud) != pfn))
>>   				return;
>>   			entry = pud_mkyoung(*pud);
>> diff --git a/mm/memory.c b/mm/memory.c
>> index a1b5575db52ac..9a1acd057ce59 100644
>> --- a/mm/memory.c
>> +++ b/mm/memory.c
>> @@ -2137,7 +2137,7 @@ static int insert_page_into_pte_locked(struct vm_area_struct *vma, pte_t *pte,
>>   	pte_t pteval = ptep_get(pte);
>>   
>>   	if (!pte_none(pteval)) {
>> -		if (!mkwrite)
>> +		if (!mkwrite || !pte_present(pteval))
>>   			return -EBUSY;
> 
> Why EBUSY? because it might transitory?

I was confused myself about error handling, and why it differs for all 
cases ... adding to me todo list to investigate that (clean it up ...) :)

-- 
Cheers,

David / dhildenb

