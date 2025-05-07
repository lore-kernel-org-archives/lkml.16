Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E257821858E
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 21:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746653048; cv=none; b=ZuVGziSsWZEx5RpUGw4Wyqpmj5Pps3tCoutFG9kGUPrsLbEq1LeNOPkvfNjN2eQVyFCO8FBSNXNHQnOPKHRk0z59/zQo4A0mQrp2a0LipPK5OoAKoxrVTbd2ozBx8l/oxxtvVzpFq5mm3mKsnaeaHSEbfFKpeSxOehcdiHKdS8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746653048; c=relaxed/simple;
	bh=SbXqXkRF7gpuq3sDG7ZahCiS3b1A91HC3ZpNoG+gHZc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IMTo96Hy9hDsEwuYRMGvjPuK9VYTjialisCW73z1X77jc9s1QBlkpN9kT63HrIIWLKc6BOmAvkM5mG1sYb1I+C+4XbBC1gKARaWUFgAf85u4XKIXM5icahWvlJKZSiFgLoWdIUKwKp5ubZZ1omPPCgKwm2t+2FxdXV8xswBoqzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=avwxfMI5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="avwxfMI5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746653045;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=d+pvQ/K7tduX07bnQlxgjZUncPJ/mdxljDPoTJs6qOQ=;
	b=avwxfMI5Y0FbSIpninXejzoIc1+lOJdnMMkOeETprhCEhgLWOENNvNrdldkbiydFFbZXZM
	+F7bB15PuyGUqr4MGSPmPjAugCqvMnMZXVejiWn/V7tgeSq0a1Ma8rfl+smga3OGgfg2k4
	4CV9Q7lwc/rHdRKVvrhhRxu56IAJtAw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-227-6FjhZfwgNwicQUUsTl5M6A-1; Wed, 07 May 2025 17:24:04 -0400
X-MC-Unique: 6FjhZfwgNwicQUUsTl5M6A-1
X-Mimecast-MFC-AGG-ID: 6FjhZfwgNwicQUUsTl5M6A_1746653043
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43d007b2c79so1842795e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 14:24:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746653043; x=1747257843;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=d+pvQ/K7tduX07bnQlxgjZUncPJ/mdxljDPoTJs6qOQ=;
        b=tVgDMfxixfjcOEBWmNx47HMHsHIsf3EAjpBZ+iLVTLGjGbdp19eBzW3CvWhL67bFV4
         qhqI7b1rAWIWxK7vqwYuZreOzOlo5dUq4THKypa+8/7BJWvo0CL0zPqAGcDpvHGPj4TN
         8QmZq6zUJDfsbRMIHaL5WGa95l48KgfHbkxVaxVBroqbU2J0Ib7Qthv/veM3wo8Op23r
         A9UMnMd+9PqwhjcN/iJzrCZymreIOdHk2v1FrG2MqnV/0BZAOpeRnWdaMsjcft7h3c6v
         L3Uy7gwJZL1Zy//O6OZHDBjHeyajSwJsCrwzV9vCj7an+aHXtBd2Pu60WFyywoL1suEW
         7jYg==
X-Forwarded-Encrypted: i=1; AJvYcCViaXDwOio17Xdpz8cqgZor6n67JETDk5CluQv7XJkjsnGLyH3VzBKMlLPPXAPVi1l6CL293RWF9L3A6pA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVmZYzgByfjIiDI9darHyPd5cgo8Zxma2m8jdxyRXVS5xDa5Zv
	ke6i9dd/ymjUWEP4FHjM1a1kHvGn7v5euhpCTmERFCyFeq/BhaoplIGK+iVpj4qzJBeP/xbt0vi
	eS4kZG91Hm12+s8nMEBAFDJEw4gKe8XJDyWOxTAGyxepPz/67SzDljLYxm5SDBw==
X-Gm-Gg: ASbGnctBXF/Yo6m9NLC5h9I3NwBcmW4MIp0EPqSdec6DFODWmqtEWwOKtNdpVS2G1Jj
	xejvwiD0F2xk8OWwTqNIGO699b9h+M3e9b2ZEJDDxcFd7g+Mf3/Xqfj/9AyrtrACT45Jb02jWUh
	5Pc+o7NEUqRhkrqCeCgvgHlSjWJLOAJgrjjFrrm4MGBoeFhQZQq/jIJBoaE/pWf2gZO8aBfqwXc
	9dHpKgDw7eoebKrmvbkuzAOO4BMGiACTE9S1CmJh8s9StIll66hA0jK7dW8I+0wjz/zB3uspsd3
	oii+AvW6WeyZ0yf/Y8E24XElCl13e710Nrdz//Ak/ex2ss/DFwq6/jzpjComwGH+VikPyFEsemk
	//Gh8KK4I8DTglLYmLkStm9cZCMrg87tsdn/NZg==
X-Received: by 2002:a05:600c:698e:b0:43b:c284:5bc2 with SMTP id 5b1f17b1804b1-441d448c751mr49976255e9.0.1746653043505;
        Wed, 07 May 2025 14:24:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGoYoTA7F3kp3g/aZUTm/lbMFLVUbNxNtmTXz+1bJWu2ngebQcHWT1w9lFE+3OB1GdC0ddoag==
X-Received: by 2002:a05:600c:698e:b0:43b:c284:5bc2 with SMTP id 5b1f17b1804b1-441d448c751mr49976065e9.0.1746653043122;
        Wed, 07 May 2025 14:24:03 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f2b:fe00:532f:f82e:7128:936b? (p200300d82f2bfe00532ff82e7128936b.dip0.t-ipconnect.de. [2003:d8:2f2b:fe00:532f:f82e:7128:936b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd35fb09sm13252985e9.30.2025.05.07.14.24.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 14:24:02 -0700 (PDT)
Message-ID: <d2348cc3-c9c6-4df0-82b6-1105edd44a75@redhat.com>
Date: Wed, 7 May 2025 23:24:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] mm: convert do_set_pmd() to take a folio
To: Matthew Wilcox <willy@infradead.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, hannes@cmpxchg.org,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, dev.jain@arm.com, ziy@nvidia.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <8e33c8a65b46170dfd8ba6715d2115856a55b8f6.1746609191.git.baolin.wang@linux.alibaba.com>
 <a2faee74256c22cff2238487a86b154d5520c334.1746609191.git.baolin.wang@linux.alibaba.com>
 <aBtNrQNlL7hjLrTZ@casper.infradead.org>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <aBtNrQNlL7hjLrTZ@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07.05.25 14:10, Matthew Wilcox wrote:
> On Wed, May 07, 2025 at 05:26:13PM +0800, Baolin Wang wrote:
>> In do_set_pmd(), we always use the folio->page to build PMD mappings for
>> the entire folio. Since all callers of do_set_pmd() already hold a stable
>> folio, converting do_set_pmd() to take a folio is safe and more straightforward.
> 
> What testing did you do of this?
> 
>> -vm_fault_t do_set_pmd(struct vm_fault *vmf, struct page *page)
>> +vm_fault_t do_set_pmd(struct vm_fault *vmf, struct folio *folio)
>>   {
>> -	struct folio *folio = page_folio(page);
>>   	struct vm_area_struct *vma = vmf->vma;
>>   	bool write = vmf->flags & FAULT_FLAG_WRITE;
>>   	unsigned long haddr = vmf->address & HPAGE_PMD_MASK;
>>   	pmd_t entry;
>>   	vm_fault_t ret = VM_FAULT_FALLBACK;
>> +	struct page *page;
> 
> Because I see nowhere in this patch that you initialise 'page'.
> 
> And that's really the important part.  You seem to be assuming that a
> folio will never be larger than PMD size, and I'm not comfortable with
> that assumption.  It's a limitation I put in place a few years ago so we
> didn't have to find and fix all those assumptions immediately, but I
> imagine that some day we'll want to have larger folios.
> 
> So unless you can derive _which_ page in the folio we want to map from
> the vmf, NACK this patch.

Agreed. Probably folio + idx is our best bet.

Which raises an interesting question: I assume in the future, when we 
have a 4 MiB folio on x86-64 that is *misaligned* in VA space regarding 
PMDs (e.g., aligned to 1 MiB but not 2 MiB), we could still allow to use 
a PMD for the middle part.

So idx must not necessarily be aligned to PMDs in the future.

For now, we could sanity-check that idx is always 0.

But the rmap sanity checks in folio_add_file_rmap_pmd() will already 
catch that for us.

-- 
Cheers,

David / dhildenb

