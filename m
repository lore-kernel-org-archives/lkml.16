Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB8E284688
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 08:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749198203; cv=none; b=HTk05Pz1YbdKw0dhiKxBO53siB4IrHYzrhz6/yIUdZcjArZEs+SHlycwbJqyn9OYZwF2fKdcJxOuLB8NbS/PZQazz+B/iyT5hRKqpowVhOA7AQ85J2hJKLqfCsRT1EMcd+VJJ6RiaQ2pyapPoCuJtOKYlSAwXd4Ax3OisW7GyTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749198203; c=relaxed/simple;
	bh=fxUo2HqeAFUlDXp+GMOI4ZAd2lcG1VxBOVia4VaTnXg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=euxRmeSUm8D7ESJgzs/z9jLVTXllFdyDSSqn6zqUIHzn+QU3G2e8IMVPR6mTPDPfWPUqeMcpQgvM2+LXGCqdnwnSW2NU16cM892sMqo97ZIXlV/QlV/LhXsNPitDdMuNhkGLVsSDTRLFPpAtrX8W4eFbvjg9G6qeQB8Hbq8AYCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gbqA3SKg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gbqA3SKg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749198198;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=6ajWNDkIGe/RPonsgk1x1omUJ/bvYDkNNzEILiZ4Kgg=;
	b=gbqA3SKgTzAtHmf39rSJCaDt/pKoEViLatkmpaK0ZkoJHFIMipAzbdVmhGGRcP1KL3Z6pY
	euTot52vUyu7WOu8Z2UA3HuoC0MdZG76dTwPqa6SIhTMBqNfLsFHrge1LkoCyroET5gT/9
	pOlmQ4blAL/BkqwgZYnsgF5nqq3xuLo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-388-cj8zxJFlMYiXyw9YPCy8tg-1; Fri, 06 Jun 2025 04:23:16 -0400
X-MC-Unique: cj8zxJFlMYiXyw9YPCy8tg-1
X-Mimecast-MFC-AGG-ID: cj8zxJFlMYiXyw9YPCy8tg_1749198196
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4f3796779so1334032f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 01:23:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749198196; x=1749802996;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6ajWNDkIGe/RPonsgk1x1omUJ/bvYDkNNzEILiZ4Kgg=;
        b=gIcd3AKW555N5cvd2prMKOB69rQFxkw87EbZoO37ZU7YQv4Zbco4em5oWOjGuAxalI
         f9jqr//fa9Dp2fg6UbFMgOPlcYcHme0FPzitTOYfQdIrg50JCV4R9AA6qhaX++M6zSLN
         5iM+FQtihc46RzuX9xaR8NEWEmEZm7MgsbdtBqR3pMohoiK8Z/YpXxo47P1Pbeyq1QHM
         BZZ9pYva7F+6sck4v1GB+EZzpwtPRs+bhIOWbHWVlj6us39GtWRBf9sqT7Knf4RBfACQ
         kNNQywHRfcM/w5gNpcuO7p3KpGNV8OpsRVVGB5sjRFagI+pjjLi/JgS873BqzsTfqZ57
         +7Fg==
X-Gm-Message-State: AOJu0YzbNuaFYNe8g1BP9Npmom+Wh1PHC0xhnnS+jx1ACXtMpU9T8uN2
	cRnAqHOzq9vGQHG7PUoF6EC7IFqFHxTrgB5O5l5D7lgwdOUrW6+eAVHsuBUFfwFa7pvcXP6Bl/8
	PA9fvJeUlXSrQa0OHx4/ZnrFXxx8pQ+wdqPk6u5aZGhhVsgZNFaIz51vaF4obAbRwgw==
X-Gm-Gg: ASbGnctAJ+2Wj8Ilv8rbD8aeRxCOIpYylI5/qhvQRzD8SyNp++D2SpqL8g+asS/z0CN
	Gev2uCI9JrgZlL4XYRXaiq6bapUMhGOy5+XdiocRo7Wj1HOqgiMJ/djpQ3jjxu0U9LbYTXr9vYX
	RyRK2B7wJRZ4BJji6FBCMz9XHGacHGmdyJnN2vrZJfV3DVbgeHzRCoENwZqzwW+VCBXD1itULdA
	ZhJMc0v9W7UlsrAX84AIfZpC+jKm0TRAJfL2Qllx+9aWcdxH8LzfPnCtPnH6y9OXOkfkvxG0MMd
	VA7mYVlgviDYmtDvm4l3hR/xvL76oS2vz6ZGdIMEGQZLaGonoDJBNLcE0NNvOfmeRhsqYV792mb
	czZL6Q4i8qw3z/EvDZbyzHswlLXWVX6QoGveyqFDhNA==
X-Received: by 2002:a05:6000:2585:b0:39f:175b:a68d with SMTP id ffacd0b85a97d-3a53188da55mr1982147f8f.11.1749198195591;
        Fri, 06 Jun 2025 01:23:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGgzY8Eq+Aj8NnhMsDe8lTl3DU6IfHWx3dR5ziy4gZ5Wc1+1k9JZmrf+nIDql3bue6WAHNteQ==
X-Received: by 2002:a05:6000:2585:b0:39f:175b:a68d with SMTP id ffacd0b85a97d-3a53188da55mr1982112f8f.11.1749198195141;
        Fri, 06 Jun 2025 01:23:15 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f19:9c00:568:7df7:e1:293d? (p200300d82f199c0005687df700e1293d.dip0.t-ipconnect.de. [2003:d8:2f19:9c00:568:7df7:e1:293d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5323ab1a2sm1165901f8f.28.2025.06.06.01.23.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 01:23:14 -0700 (PDT)
Message-ID: <b6a1b97b-39d9-4c9e-ba95-190684fc4074@redhat.com>
Date: Fri, 6 Jun 2025 10:23:11 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] mm/huge_memory: don't mark refcounted pages
 special in vmf_insert_folio_pmd()
To: Oscar Salvador <osalvador@suse.de>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, nvdimm@lists.linux.dev,
 linux-cxl@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Alistair Popple <apopple@nvidia.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Dan Williams <dan.j.williams@intel.com>
References: <20250603211634.2925015-1-david@redhat.com>
 <20250603211634.2925015-2-david@redhat.com>
 <aEKkvdSAplmukcXz@localhost.localdomain>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <aEKkvdSAplmukcXz@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06.06.25 10:20, Oscar Salvador wrote:
> On Tue, Jun 03, 2025 at 11:16:33PM +0200, David Hildenbrand wrote:
>> Marking PMDs that map a "normal" refcounted folios as special is
>> against our rules documented for vm_normal_page().
>>
>> Fortunately, there are not that many pmd_special() check that can be
>> mislead, and most vm_normal_page_pmd()/vm_normal_folio_pmd() users that
>> would get this wrong right now are rather harmless: e.g., none so far
>> bases decisions whether to grab a folio reference on that decision.
>>
>> Well, and GUP-fast will fallback to GUP-slow. All in all, so far no big
>> implications as it seems.
>>
>> Getting this right will get more important as we use
>> folio_normal_page_pmd() in more places.
>>
>> Fix it by just inlining the relevant code, making the whole
>> pmd_none() handling cleaner. We can now use folio_mk_pmd().
>>
>> While at it, make sure that a pmd that is not-none is actually present
>> before comparing PFNs.
>>
>> Fixes: 6c88f72691f8 ("mm/huge_memory: add vmf_insert_folio_pmd()")
>> Signed-off-by: David Hildenbrand <david@redhat.com>
> 
> Hi David,
> 
>> ---
>>   mm/huge_memory.c | 39 ++++++++++++++++++++++++++++++++-------
>>   1 file changed, 32 insertions(+), 7 deletions(-)
>>
>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>> index d3e66136e41a3..f9e23dfea76f8 100644
>> --- a/mm/huge_memory.c
>> +++ b/mm/huge_memory.c
>> @@ -1474,9 +1474,10 @@ vm_fault_t vmf_insert_folio_pmd(struct vm_fault *vmf, struct folio *folio,
>>   	struct vm_area_struct *vma = vmf->vma;
>>   	unsigned long addr = vmf->address & PMD_MASK;
>>   	struct mm_struct *mm = vma->vm_mm;
>> +	pmd_t *pmd = vmf->pmd;
>>   	spinlock_t *ptl;
>>   	pgtable_t pgtable = NULL;
>> -	int error;
>> +	pmd_t entry;
>>   
>>   	if (addr < vma->vm_start || addr >= vma->vm_end)
>>   		return VM_FAULT_SIGBUS;
>> @@ -1490,17 +1491,41 @@ vm_fault_t vmf_insert_folio_pmd(struct vm_fault *vmf, struct folio *folio,
>>   			return VM_FAULT_OOM;
>>   	}
>>   
>> -	ptl = pmd_lock(mm, vmf->pmd);
>> -	if (pmd_none(*vmf->pmd)) {
>> +	ptl = pmd_lock(mm, pmd);
>> +	if (pmd_none(*pmd)) {
>>   		folio_get(folio);
>>   		folio_add_file_rmap_pmd(folio, &folio->page, vma);
>>   		add_mm_counter(mm, mm_counter_file(folio), HPAGE_PMD_NR);
>> +
>> +		entry = folio_mk_pmd(folio, vma->vm_page_prot);
>> +		if (write) {
>> +			entry = pmd_mkyoung(pmd_mkdirty(entry));
>> +			entry = maybe_pmd_mkwrite(entry, vma);
>> +		}
>> +		set_pmd_at(mm, addr, pmd, entry);
>> +		update_mmu_cache_pmd(vma, addr, pmd);
>> +
>> +		if (pgtable) {
>> +			pgtable_trans_huge_deposit(mm, pmd, pgtable);
>> +			mm_inc_nr_ptes(mm);
>> +			pgtable = NULL;
>> +		}
>> +	} else if (pmd_present(*pmd) && write) {
>> +		/*
>> +		 * We only allow for upgrading write permissions if the
>> +		 * same folio is already mapped.
>> +		 */
>> +		if (pmd_pfn(*pmd) == folio_pfn(folio)) {
>> +			entry = pmd_mkyoung(*pmd);
>> +			entry = maybe_pmd_mkwrite(pmd_mkdirty(entry), vma);
>> +			if (pmdp_set_access_flags(vma, addr, pmd, entry, 1))
>> +				update_mmu_cache_pmd(vma, addr, pmd);
>> +		} else {
>> +			WARN_ON_ONCE(!is_huge_zero_pmd(*pmd));
>> +		}
> 
> So, this is pretty much insert_pfn_pmd without pmd_mkdevmap/pmd_mkspecial().
> I guess vmf_inser_folio_pmd() doesn't have to be concerned with devmaps
> either, right?
> 
> Looks good to me, just a nit: would it not be better to pass a boolean
> to insert_pfn_pmd() that lets it know whether it "can" create a
> devmap/special entries?

See my reply to Dan.

Yet another boolean, yuck. Passing the folio and the pfn, yuck.

(I have a strong opinion here ;) )

-- 
Cheers,

David / dhildenb

