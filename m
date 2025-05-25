Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6AC127468
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 10:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748168678; cv=none; b=M15Y4cRXmIH75aXibtV0haUzdLkOCC3xktKnvbQQVMzJ5BHX1Grwdbjwbj/004Aga384/Cf8vAZETc1ZEsw0Fvb6JejJxAp6nkyE8doGqPh1NSqLB2ju1j5eN8tayAfwKKUW7OnJMt1rhkcYPx60Bn/qNVgByhdzkLfU0bfUQZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748168678; c=relaxed/simple;
	bh=uk53fRjOEueOPTdzMV/EYUoTmR8VCJKUpAySzvnB1jU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BvnvXqWFLFiAh6qq6blID6UqQ7OcwEYJPHeFn0qpveEUfvMdvZAAYIbxf2AhR2YKEhMuGe7gTsqyPr2UrpDyGuCkzuzh4GHmXSkHkqz/9hyzilBSITRpr5fcQmuy4PCCG07hZnI0pkeoDQI5f0qomNzXtr3pxrPIWYUJD6S0ync=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gGjJZIZ/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gGjJZIZ/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748168675;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=CZC2aLVVRC9MSj++zrrkRN5Czmbv+GL6NoJprKEHhc8=;
	b=gGjJZIZ/7dOa8bkugIobZSHoXRJSif+DSXEDGEzOuzlivB9qjZRL/xJaTtmOCS80ZKuRP+
	PH3TRoNrB0eGHSpAbO/nD97fIe31UbS27CMH5wta2GbSFSpiISDHzBmVTslQ+4d5OGF1nY
	/j9YMfZfxgI4eSkyRG8Qcc+vu9tUjSM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-452-ytnyQVuGNVyvU9TsFXc9eA-1; Sun, 25 May 2025 06:24:33 -0400
X-MC-Unique: ytnyQVuGNVyvU9TsFXc9eA-1
X-Mimecast-MFC-AGG-ID: ytnyQVuGNVyvU9TsFXc9eA_1748168672
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43cf44b66f7so7030865e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 03:24:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748168672; x=1748773472;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CZC2aLVVRC9MSj++zrrkRN5Czmbv+GL6NoJprKEHhc8=;
        b=d0s323zfKBxYw6W6n3ecOXo5lJ0+kboiZNmnTKeTb24fPyboJwOgQwzvrAbJFB5bOr
         y1VSl0qXQwGuV7o7eYIZGjNIul3Ogn8sDESfquu4pdXHaF2KGCW5wh5Aol20ZlQtFUdb
         TFJlAR2Iyra9oi2DbCInWjKpaUf4Uchn60FJdKtq22dOJ35mjnw+5Z6cKgTOOMttYMRZ
         QnSP1UwvqZ2ue92g28qdKPzoHgZdBdDfNudoDfrryrUIfWw/B5PRqiSLd6gEhw2silPQ
         xzRjNcKBchscuhCz2lb9/hQ4F8v37fTsafQ4RykEY8kGa407i7gFqalqL82cKf9zrf+u
         FcBg==
X-Forwarded-Encrypted: i=1; AJvYcCV3TTSWlBeE48HV7Nvq8sNnxjmCukj2v6ugX7oSVb14Z6CGFTS0keAKFHQf9mYJ2pVL0wykNorQ63csSTU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwL06MTpDmLvdPkTi6FzoqAKCjyq+syLx4w/UZceZ8jYFOtF5vb
	SPSGtRChM6z/b1n7wCrHKzvXq4IX+BwwYvoMIe2sUGHrpDziQi6ydE0kqhjDEZ3b8XTN0kWl+XR
	QVKsbIivNSSN8rEBZsFOc+cFz0GrJZ1PLdzSCfm3x5bw1k4HeYwB4Crq7WOCzpCkKiQ==
X-Gm-Gg: ASbGncsGMmuhSFcoGYEm+z705yXoth44oGbew1lGRwMfxvAbAFhJd870qi9JRr+GXAh
	5G3m1JKHSEnsWs8t/9mUOY0c8PdWKLsEIzDM47r6cejfa0RvDebnZi+zwATZxOcw0NZP59+yTiR
	KB1sq5ZQBC8xs8qmGw60ndaojiHdvBbPozNwUH87jxDjHF4nbhtrIyKdrhO1TEj2mZgbB1FAKSN
	/muacboC/KrZ+Ew8DWxWQj1L1J5Wef2jEZFoVzub2vjhd7YInj6IiW4sfBdSAmjhsSnCyjFpWOj
	h/4e40AIxSNDXd45ndGvW1SF5Cu10h5boCDAbFe9iA==
X-Received: by 2002:a5d:5846:0:b0:3a3:5cca:a56a with SMTP id ffacd0b85a97d-3a4cb46c42emr3954973f8f.32.1748168671828;
        Sun, 25 May 2025 03:24:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF81BtASRSIVPVFuqf47Gc5RFX+uSPO/1kvbsWNsgC3lWdOpQxwUzVB+DI/dMdwMcqIWMaYYg==
X-Received: by 2002:a5d:5846:0:b0:3a3:5cca:a56a with SMTP id ffacd0b85a97d-3a4cb46c42emr3954951f8f.32.1748168671483;
        Sun, 25 May 2025 03:24:31 -0700 (PDT)
Received: from [192.168.3.141] (p4ff1fb19.dip0.t-ipconnect.de. [79.241.251.25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f78aeb8csm201185655e9.28.2025.05.25.03.24.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 May 2025 03:24:31 -0700 (PDT)
Message-ID: <e6b657c6-98b9-4690-9a26-27db0fa7c794@redhat.com>
Date: Sun, 25 May 2025 12:24:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] mm/mmap: Fix uprobe anon page be overwritten when
 expanding vma during mremap
To: Oleg Nesterov <oleg@redhat.com>
Cc: Pu Lehui <pulehui@huaweicloud.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, mhiramat@kernel.org,
 peterz@infradead.org, akpm@linux-foundation.org, Liam.Howlett@oracle.com,
 vbabka@suse.cz, jannh@google.com, pfalcato@suse.de, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, pulehui@huawei.com,
 Andrii Nakryiko <andrii@kernel.org>, Jiri Olsa <jolsa@kernel.org>
References: <20250521092503.3116340-1-pulehui@huaweicloud.com>
 <20250524164516.GA11642@redhat.com>
 <e8a679eb-e40c-481d-b65a-d16f9e66c19a@redhat.com>
 <20250525095926.GA5391@redhat.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250525095926.GA5391@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25.05.25 11:59, Oleg Nesterov wrote:
> On 05/24, David Hildenbrand wrote:
>>
>> On 24.05.25 18:45, Oleg Nesterov wrote:
>>>
>>> To be honest, I can't even understand this part due to my ignorance.
>>> What does "the old uprobe anon page to be orphan" actually mean?
>>> How can the unnecessary uprobe_mmap() lead to an "unbalanced"
>>> inc_mm_counter(MM_ANONPAGES) ? Or what else can explain the
>>> "BUG: Bad rss-counter state" from check_mm() ? Or there are more problems?
>>
>> Essentially, we end up mapping an anonymous page (when install the uprobe)
>> after preparing the new VMA, but before moving over the pages from the old
>> VMA.
>>
>> So when we then move over the pages from the old VMA, we overwrite the PTE
>> mapping an anonymous page (due to uprobe).
>>
>> As we simply overwrite the PTE that is mapping an anonymous page, we run
>> into inconsistency later: RSS counter mismatch, memory leak, etc.
> 
> Ah, I seem to start understand... move_ptes() doesn't even check *new_pte,
> I guess it assumes pte_none(ptep_get(new_pte), right? So the old anonymous
> page is simply leaked after set_pte_at(mm, new_addr, new_pte, pte)...
> 
> Correct?

Right. Ordinary page faults cannot happen concurrently, so the 
assumption is that there really isn't anything mapped yet.

> 
>> We should never be installing an anonymous page (due to uprobe) into a VMA
>> during mremap() before moving over the pages from the old VMA.
> 
> OK. But do you see any reason why uprobe_mmap() should be ever called during
> mremap() ?

Only when growing a VMA: we might now cover a part with a uprobe, which 
we have take care of.

not to mention munmap() ...

I cannot think of something that would require it during munmap().

-- 
Cheers,

David / dhildenb

