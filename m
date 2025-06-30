Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0C71DC988
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 11:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751282220; cv=none; b=XM/zdsALv9MMR/DvmF0Z7+wUZG734nTvSzslWRtyv883CDT9kf8NQXRp5O/8lvGWUYlSRho6hyA5cG9cWnJJrg9ZDbB2U5I+uT1VqIkgxDj7pymYol+rPSrJW5llnQJ7lSch+NQuB6dLWpmPAAa6QI6cG5xRmwEGZEOeIMiQK1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751282220; c=relaxed/simple;
	bh=MRSCJSaUWuv6pT7yRAnVcPtxGfPbHMtasI9ptiA3MEI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LzT6IMIV5moWjh3Il7GhQa7UuIAzmGgk5YPK1ZqPlSVBBkv88LZtetVYaz6H7fQ8bwtBYqEqhDfCGHaeEpmLTpb8RZH3imnzKjXqqA5r5sDzydcAgpvZ4P24ryZJGpe+mUgsD+/wnD+UuRGOwxxuQcJGsXRs1UpfSGBNvvH8K78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q0B9sqln; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q0B9sqln"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751282217;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=uSNbgfLpVD/Nd2AR6Zy5V8tzVyhxiZQgQB24rZmMwYg=;
	b=Q0B9sqln56rcEvTtY0+cd/03F3lPM8kz58WD3fSwgkrtdLTNaOi4N8DYffFjAMXo+mZkBu
	LvpFESkIg0MvF2NLwcH6BdDq/Kz4UEFvFUHWGHDy5WGuf7MPz0d7EOGfguuZ7p4g+C4X4D
	g81bOuaReb7n/EHyJ/k8XJiX5XsNu1Y=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-108-BCxt-dcsMoSNKP_NZrg0kw-1; Mon, 30 Jun 2025 07:16:56 -0400
X-MC-Unique: BCxt-dcsMoSNKP_NZrg0kw-1
X-Mimecast-MFC-AGG-ID: BCxt-dcsMoSNKP_NZrg0kw_1751282215
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-453691d0a1dso11118055e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 04:16:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751282215; x=1751887015;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uSNbgfLpVD/Nd2AR6Zy5V8tzVyhxiZQgQB24rZmMwYg=;
        b=gUs17pYzp8zBMljX4+g1osz3oVK+V0y2k1SYe1tPnK1VH8nWQiShI752yNE4243Sqj
         ibuHCKszw8hX0kTwXL/T3rarPouPGhAgH8Ox3H+n1D2mZDV/N/xybpLe95nhKFCDbhHN
         CfXILoRjq6SXgWfF/sF5mBtQFrVlGMZILiPhwLQFg37YjWH7KCipehizFM9AONVp3Srg
         GnFK6BCgGus8Gphb35vqIb65qOdkEe7QqNaA+RvcPzmOdXEZNSCyB0J2ObDG2m1URAlc
         9AhSKrnghKUyQLfmveyC/u8FFXFI/kIXmuCj5sAjj+uHt23VMyjf+bI90zn7iczEzPiM
         YdNA==
X-Gm-Message-State: AOJu0YzmmTP2Ws6kcK+Afya7B0exCLVDZEK7IoA+htbFtPO8W0j/megA
	N/N2QAV/7/+oOB+z8o4J06DGN6AbKytfdpuhq+wRdz5UzX+G4+xe8s1vwqypivJ5kuxhFA2Rw34
	r9P2uE1sYVcW+lcnxR6gOT180Y6g4Lll/ZwEB98/e6N6mPtZ4QvWIu8ix/NQu985/uQ==
X-Gm-Gg: ASbGncs/nGF6TjYQf3z/kr1VdJR2emCzqoCM9JD0TZHDQwDzSqR5+7kdJabjrls16CL
	Sg6IuCtlAzD0ommF9AyTDOOXIxYPQ1C2SFBH6hQMWs0Sap5cgg31nEdoKBWGib/6baiVD4AXVCo
	qYQ8qNr59xa8ePVqOpyEQEJ6B8rGyBNnRsL2mGFvP1hf8WhcQFaFSlT8bbqdIXEbadG6hJfV8Op
	Kh5p7Bz0TxfCZzCSKmyJK4iTpMaoK1lP4xHtUVQDnelrs2qQk0LH3MpmYBEiBZocVJ4qROjxFZM
	oNSYQjQ35HDl0gEzRRUTxYdB9253tk5YWyjEPRRHYTFfUFMszWXliT1RVzvR6DFy2OuFiw+omE6
	SqU53X690hgXfBmmpWjqvvi8EzEqJAuxJEWhfz18dFd9EHiic0w==
X-Received: by 2002:a05:600c:3483:b0:441:b19c:96fe with SMTP id 5b1f17b1804b1-4538ee5794cmr153257155e9.10.1751282214932;
        Mon, 30 Jun 2025 04:16:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPcMAuDi8vVaNDz66d39uLwRF2AxzD8s2DdPf9KbDJ9DS6L5jnCAepis8YVqLBcTvkPU1hIQ==
X-Received: by 2002:a05:600c:3483:b0:441:b19c:96fe with SMTP id 5b1f17b1804b1-4538ee5794cmr153256755e9.10.1751282214441;
        Mon, 30 Jun 2025 04:16:54 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f40:b300:53f7:d260:aff4:7256? (p200300d82f40b30053f7d260aff47256.dip0.t-ipconnect.de. [2003:d8:2f40:b300:53f7:d260:aff4:7256])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e52a35sm10273501f8f.57.2025.06.30.04.16.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 04:16:53 -0700 (PDT)
Message-ID: <5513d9ba-80bf-49a1-9a50-e1a6814925e7@redhat.com>
Date: Mon, 30 Jun 2025 13:16:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/4] mm: remove boolean output parameters from
 folio_pte_batch_ext()
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
 <20250627115510.3273675-5-david@redhat.com>
 <b6ccc61b-2948-4529-9c9d-47e9c9ed25ab@lucifer.local>
 <997a3af4-0c8f-4f8d-8230-08b43d0761b6@redhat.com>
 <4500541c-dde1-41a7-81c8-ac1573d05419@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <4500541c-dde1-41a7-81c8-ac1573d05419@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


> 
> @ptentp: Pointer to a COPY of the first page table entry whose flags we update
>           if appropriate.

+ * @ptentp: Pointer to a COPY of the first page table entry whose flags this
+ *         function updates based on @flags if appropriate.


> 
> And then update the description of folio_pte_batch_flags() both the brief one to
> add 'updates ptentp to set flags if appropriate' and maybe in the larger
> description bit.

Not in the brief one; the other description, including the excessive parameter doc
will be enough.

FWIW, I briefly though passing in an arg struct, or returning the pte instead (and returning
the nr_pages using a parameter), but hated both. More than these two stupid pte*.

> 
>>
>> [...]
>>
>>>>    	VM_WARN_ON_FOLIO(!pte_present(pte), folio);
>>>>    	VM_WARN_ON_FOLIO(!folio_test_large(folio) || max_nr < 1, folio);
>>>>    	VM_WARN_ON_FOLIO(page_folio(pfn_to_page(pte_pfn(pte))) != folio, folio);
>>>> +	VM_WARN_ON(virt_addr_valid(ptentp) && PageTable(virt_to_page(ptentp)));
>>>
>>> Hm so if !virt_addr_valid(ptentp) we're ok? :P
>>
>> I had the same question when writing that. Obviously,
>> PageTable(virt_to_page(ptentp)) faulted when called on something on the
>> stack. (ran into that ... :) )
>>
>> Maybe "VM_WARN_ON(virt_addr_valid(ptentp));" would work as well, but I am
>> not sure how that function behaves on all architectures ...
> 
> Well you wouldn't want to limit callers to only working on stack values...
> 
> I guess just add a comment, or rather update the the one below to something like:
> 
> 	/*
> 	 * Ensure this is a pointer to a copy not a pointer into a page table.
> 	 * If this is a stack value, it won't be a valid virtual address, but that's
> 	 * fine because it also cannot be pointing into the page table.
> 	 */
> 
> Which would clarify.

Yes, I'll use that, thanks.

-- 
Cheers,

David / dhildenb

