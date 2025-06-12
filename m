Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE551F5858
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 06:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749711316; cv=none; b=OQgJmyLLCJlYtk2W3ciDc+BFlk+1WsncfLyyXDFkWD3S+NZWtPyikQ2Ae5kYV+dJwYpmHrH22v4wxUs2Qpl+/rDxikBcMD7B8DXeh0CXDRVwTeVFXIbEVp5RMG7U6N1vdmzOrLgqew4qw5siiW36Po6u9SNTyocjzqesfa0ckyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749711316; c=relaxed/simple;
	bh=IqcXjZu44Mml/Q06OAMWUQdB8BKS+1HRehFsSwvaPEg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p14i68fFiyvbiEzZo7KSrmZWGQRs5mfPh7nFDfEwyaUHbLJJ1X5BneJnG0Bm7AAkUgfKqY5mcj6OOWJU0j1HYbIrBTUIQ/haOajs55gsDyeYfVzRw64l8s0Hqnl2UnWJxfaKx0JjkqP0CbFjG57wAVd4rXZhl2BgmeGHGnevHhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EkHuE9Kl; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EkHuE9Kl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749711313;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=JSWiuXrWaWNg/L//dAUjqt0FVUEKmzq568u+oIeTgbc=;
	b=EkHuE9KlxCGWfwiaL3h0XKJao9FKh98O7kaZro4C6HSG7ECPrZXz7DiuyMSP482CMhfXB6
	Mapwi99sPU19f3EElvDwdyMaEH6h0NbkSznCiGyZcHNtjjV+XsMF5LfSAINypkjOZBq0My
	wXrClqbxVAQ1+/OL0PfIQTuGAH4d1Fs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-128-D-5pR_COOv-ohcvXF58Ixw-1; Thu, 12 Jun 2025 02:55:11 -0400
X-MC-Unique: D-5pR_COOv-ohcvXF58Ixw-1
X-Mimecast-MFC-AGG-ID: D-5pR_COOv-ohcvXF58Ixw_1749711310
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a4fabcafecso327384f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 23:55:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749711310; x=1750316110;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JSWiuXrWaWNg/L//dAUjqt0FVUEKmzq568u+oIeTgbc=;
        b=a5jdsuFiQulv5MMpDFgdHZt+AaNlRh3sbHw/FebBlcQLKnJ47G8Goisswlr8P3YVfu
         Pqc+jwkyIPT3fVSOvU7BTaK7hi7zQgArVEEa1xP+PvAZheow6hEvB2uS4aMRjYl2HYUr
         YU1OP9J/v+mM+SGmnaxm7AqQfyTxd+sOk5NoNMdWFdj9ZrljN3ivLanQ3QUzLrBNffW7
         jto72vNarhuV8CQSmyYD/0UrZ9GXOtgNB1RwZVQ7QII5jt8uNFfCPZajQwH+dIzZikFb
         HctcPS+uMZ2JFc+cd73CowZTEOFU54AwBmKeKiiqw1qa5sEx0G9/29QKfOF1OPK1kwC3
         8kpQ==
X-Gm-Message-State: AOJu0YzYzG082mRgeD9TGcH9qU4k7uJ7TncEJmyXuCzDhmLUwo11tz5l
	Yv+Pr1S0RUyKJwx4TkqLqZaA+kPfNFuB4Bkeo3uSlEoixBWLfYnX6v0nCiJKr3+POum+o6yIyJD
	KpdlCeRkDw6a4iWdvkBg+txVI5/gkQwciH7K9KCMCUgHBD7m5xqrTzkh7w8WM5lFAjQ==
X-Gm-Gg: ASbGncv3RVOO1c0bGuOsYJW6Q3f7Fyi5i7JKZAw5WxYQkvoyVivK/bDUX2/HrwbP078
	u8xedO2qjQ8X/QziA0scLbd59vDN+JnnlK5V2CYe4WTMNY9+I889788dPVsGzGc2ZbDQtnsT97N
	mYRxFttNWrBg1v+RifFwuj5Op7PA/OxyOucHQIKFV0KOaB6vjfv/4S+TN/jRmKAm8dSbhNevS0J
	OFfhCN4+oQ/oSLSRYkQpCwGQzCIZHnkPKQSQtubf82Vbv57ZkWh36JuGRGABb3yKv8beS1hS8Ni
	c7aRCVrNgsGh24bCuXjrFjHkW4Zov20ikAvb/Pw+EpOM8FtT+OHpsxjlXzRdMWtpgMoQp9ET1GX
	MzkQPSlm9DZ2LUWcxJ+DGVDZbowrWaPzKNjn0Q60kVFAooe0bbw==
X-Received: by 2002:a5d:5f96:0:b0:3a4:d0dc:184d with SMTP id ffacd0b85a97d-3a5586dc413mr4861247f8f.27.1749711310193;
        Wed, 11 Jun 2025 23:55:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrKF3kZCkydZM2t5D9v/uaqJUfqJNkCQxO4p8k0rvlVbALIq5ShGx56bCxD8499/B2r5mHKg==
X-Received: by 2002:a5d:5f96:0:b0:3a4:d0dc:184d with SMTP id ffacd0b85a97d-3a5586dc413mr4861217f8f.27.1749711309741;
        Wed, 11 Jun 2025 23:55:09 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f2c:1e00:1e1e:7a32:e798:6457? (p200300d82f2c1e001e1e7a32e7986457.dip0.t-ipconnect.de. [2003:d8:2f2c:1e00:1e1e:7a32:e798:6457])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a561a3cd11sm1053968f8f.59.2025.06.11.23.55.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 23:55:09 -0700 (PDT)
Message-ID: <00d0156e-0052-4a02-9816-d0815b4ff02e@redhat.com>
Date: Thu, 12 Jun 2025 08:55:07 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] mm/huge_memory: don't ignore queried cachemode in
 vmf_insert_pfn_pud()
To: Alistair Popple <apopple@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, nvdimm@lists.linux.dev,
 linux-cxl@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Dan Williams <dan.j.williams@intel.com>,
 Oscar Salvador <osalvador@suse.de>, stable@vger.kernel.org
References: <20250611120654.545963-1-david@redhat.com>
 <20250611120654.545963-2-david@redhat.com>
 <dvstixx4pey6euns6xttep5bbc4jhz6smtgheijviwkbawnqbm@tqhbg4hzeiog>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <dvstixx4pey6euns6xttep5bbc4jhz6smtgheijviwkbawnqbm@tqhbg4hzeiog>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12.06.25 03:56, Alistair Popple wrote:
> On Wed, Jun 11, 2025 at 02:06:52PM +0200, David Hildenbrand wrote:
>> We setup the cache mode but ... don't forward the updated pgprot to
>> insert_pfn_pud().
>>
>> Only a problem on x86-64 PAT when mapping PFNs using PUDs that
>> require a special cachemode.
>>
>> Fix it by using the proper pgprot where the cachemode was setup.
>>
>> Identified by code inspection.
>>
>> Fixes: 7b806d229ef1 ("mm: remove vmf_insert_pfn_xxx_prot() for huge page-table entries")
>> Cc: <stable@vger.kernel.org>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>   mm/huge_memory.c | 7 +++----
>>   1 file changed, 3 insertions(+), 4 deletions(-)
>>
>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>> index d3e66136e41a3..49b98082c5401 100644
>> --- a/mm/huge_memory.c
>> +++ b/mm/huge_memory.c
>> @@ -1516,10 +1516,9 @@ static pud_t maybe_pud_mkwrite(pud_t pud, struct vm_area_struct *vma)
>>   }
>>   
>>   static void insert_pfn_pud(struct vm_area_struct *vma, unsigned long addr,
>> -		pud_t *pud, pfn_t pfn, bool write)
>> +		pud_t *pud, pfn_t pfn, pgprot_t prot, bool write)
>>   {
>>   	struct mm_struct *mm = vma->vm_mm;
>> -	pgprot_t prot = vma->vm_page_prot;
>>   	pud_t entry;
>>   
>>   	if (!pud_none(*pud)) {
>> @@ -1581,7 +1580,7 @@ vm_fault_t vmf_insert_pfn_pud(struct vm_fault *vmf, pfn_t pfn, bool write)
>>   	pfnmap_setup_cachemode_pfn(pfn_t_to_pfn(pfn), &pgprot);
>>   
>>   	ptl = pud_lock(vma->vm_mm, vmf->pud);
>> -	insert_pfn_pud(vma, addr, vmf->pud, pfn, write);
>> +	insert_pfn_pud(vma, addr, vmf->pud, pfn, pgprot, write);
>>   	spin_unlock(ptl);
>>   
>>   	return VM_FAULT_NOPAGE;
>> @@ -1625,7 +1624,7 @@ vm_fault_t vmf_insert_folio_pud(struct vm_fault *vmf, struct folio *folio,
>>   		add_mm_counter(mm, mm_counter_file(folio), HPAGE_PUD_NR);
>>   	}
>>   	insert_pfn_pud(vma, addr, vmf->pud, pfn_to_pfn_t(folio_pfn(folio)),
>> -		write);
>> +		       vma->vm_page_prot, write);
> 
> Actually It's not immediately obvious to me why we don't call track_pfn_insert()
> and forward the pgprot here as well.

(track_pfn_insert is now called pfnmap_setup_cachemode_pfn)

Prior to me adding vmf_insert_folio_pud()
> device DAX would call vmf_insert_pfn_pud(), and the intent at least seems to
> have been to change pgprot for that (and we did for the PTE/PMD versions).

It's only for PFNMAP mappings as far as I understand. I think this is 
mostly about drivers mapping actual weird stuff with weird memory types 
(e.g., vfio mapping mmio etc) into the page tables, that does not have a 
struct page.

> 
> However now that the ZONE_DEVICE folios are refcounted normally I switched
> device dax to using vmf_insert_folio_*() which never changes pgprot based on x86
> PAT. So I think we probably need to either add that to vmf_insert_folio_*() or
> a new variant or make it the responsibility of callers to figure out the correct
> pgprot.

I would assume that for ZONE_DEVICE the cachemode is always simpler 
(e.g., no MMIO?)?

In any case, I would assume ZONE_DEVICE only ended up "accidentally" 
triggering it and that it didn't make a difference.

Observe that pfnmap_setup_cachemode_pfn() is only called from 
vmf_insert_pfn_*() ... well, and our ugly friend __vm_insert_mixed() 
that similarly inserts a PFN mapping.

-- 
Cheers,

David / dhildenb

