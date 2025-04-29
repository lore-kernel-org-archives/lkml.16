Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436A52BD580
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 09:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745918871; cv=none; b=Y9ju8Im5RMUcHeFNB52SkWuzAyLYn7T7OmuMn4SLjxew+oBy1R8uQ+LTAEFcbsZUmk3cjetWS7R3jFNMCE0snYmfNzd5ddbHJrB3+7DldDD7z5OuI3jJOo6CfswREpaNfmwRzvZGh/rYvprHr2MYE5owCrXLpaS1SI/gnO4oaeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745918871; c=relaxed/simple;
	bh=8HK6UNjvWFByLkQO5X7zxGeF5wGGaZyqcJ8hX/3z0lE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=KIs3QMYlNtyU7JOd9d3OLsgU+0hUdszD2TGRmp+JhwDerTXbCpmgPI3xpYxUA2sXnrQ4KophUpq528S9HYtvQI+xKqt1/ew/GrahpeofiQ8XYqQ1GdycySijZ9tq8H8kGwoS/GQ/6obpKsRxOrNQfHb4cSDrLs1Jn7ojhBiXmyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NAhswpOM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NAhswpOM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745918869;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=fKSH+FXqhLWZM9fRPxjrnAYFhRTwogig0uOiiV/gcWk=;
	b=NAhswpOMWgBc7UD5KkvNLsdPJHV9QbD44IlH1JefuEGdSNZugTNID79UofdL3q1QEPgp0G
	IFx7RolNXh+S+ZzBJ1ozwfza8MGpodMWuOZYK0DaI//UBuH8P/cVoFdNrVmWKhl8CbThxi
	1da4VtS3wrVUYDG9j/hgA1TtdkMPTT4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-70-Qoha7D8WMjK3k69mUa4U_w-1; Tue, 29 Apr 2025 05:27:47 -0400
X-MC-Unique: Qoha7D8WMjK3k69mUa4U_w-1
X-Mimecast-MFC-AGG-ID: Qoha7D8WMjK3k69mUa4U_w_1745918866
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-39130f02631so1897146f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 02:27:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745918866; x=1746523666;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fKSH+FXqhLWZM9fRPxjrnAYFhRTwogig0uOiiV/gcWk=;
        b=sTBPzXevSY7h2Kncj3+K3Sxq6Z4oHcRCM5KuTYj4K4jU8vpi/naFaHMKYoSG+mvA/e
         qJFUMm8a7FfLBtful93OFOEU3cQQZ75ztYAaTImYXGCmZEeYO3+PLKBIDQxGb5EpLVT0
         4w97xPnY/D/hfMTt94jEIeogdOi3JkwlznzXboMGxrLPzpfEyKYFea/XsgKMYHcCL29G
         3ugqkIRTZaGLgyTH0J0jhj8ODwxxcfsHVT9Tmqbj4nl+jypkVwf+SJBZwnIXzTE7IAZe
         o98F4je7tZ+FYDT+lmJIST7OuiMHZxwTbaWVm3zLuWvnSQry+yPVaO3d03U+3BI+YWeK
         6TLA==
X-Forwarded-Encrypted: i=1; AJvYcCW5m2hLDhKNNI7Cbw2Dfcoh5YvKlWoqALDt1/crvooAsqXlUKYgU8tXGcm7n7WP7ukwvlkWTG4WE3SUbOs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOGj8jRJ+yKUy1muO8cKjYPspbZUgrNCV4XgTrH1w3A3xy2r1T
	Sg4jMbnwMqBnuv0GiFqtki9Yj8gypIn2yqKj5x2QtGWmRTK+/ZSaT5tuaAVetr1H2ctzD5cNf78
	FD8nzADXVsIGNPgTBHZAW/QcBFYfQOw/7InjeeHJXXsOpf+z7oAXaMq/fNtCVaA==
X-Gm-Gg: ASbGncuic6S0rGMz8w8q6Hw9ZvcVt8VwabaQMArAtCXv5h5ae7vtsSx5Mpdp64ca8V/
	6UoLmuGgglcmKcQ3+wMsy0UvDzGVFSWxUP1iRbO5ibqaBgGWis9LEmVX4ReKauYGYKsu4pACuul
	TiDNveMfx9TgJTAJzNRexkn99fKnHy2TKihf1MQZYyVHUdqm3+O39VMNSriKgAWB1yFNkwfx1GF
	Fz+B7aoMeN79qtITYFM5/OSNthWjUmteNEsQ8nl5vPuRCd3IpguEIu7BLzPofled87HKe9ylqAZ
	H0svlq9UVvXQ5bNWYLBkR6m2GIt45PtH0vA2tcmyCbvHiOqSXa+Bh8JinmyIezArtRpsBIbVdih
	giDAnFhlcGyr4CFH7r9yPcq1n87944VBQxA2A3fE=
X-Received: by 2002:a05:600c:4e54:b0:43c:f1b8:16ad with SMTP id 5b1f17b1804b1-441ac91ce3fmr23580555e9.30.1745918866329;
        Tue, 29 Apr 2025 02:27:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjHWG3JA2ydXcTpqmzjCTS1CxLqIa0iOQT/f4ABfKTOjSI117XybK9mJBeuL0JFNSojm5kYw==
X-Received: by 2002:a05:600c:4e54:b0:43c:f1b8:16ad with SMTP id 5b1f17b1804b1-441ac91ce3fmr23580295e9.30.1745918865908;
        Tue, 29 Apr 2025 02:27:45 -0700 (PDT)
Received: from ?IPV6:2003:cb:c73b:fa00:8909:2d07:8909:6a5a? (p200300cbc73bfa0089092d0789096a5a.dip0.t-ipconnect.de. [2003:cb:c73b:fa00:8909:2d07:8909:6a5a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a5394bfasm151677125e9.40.2025.04.29.02.27.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 02:27:45 -0700 (PDT)
Message-ID: <9a770aec-a020-4199-a53e-eddda657999d@redhat.com>
Date: Tue, 29 Apr 2025 11:27:43 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] mm: Batch around can_change_pte_writable()
From: David Hildenbrand <david@redhat.com>
To: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org
Cc: ryan.roberts@arm.com, willy@infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org,
 Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, vbabka@suse.cz,
 jannh@google.com, anshuman.khandual@arm.com, peterx@redhat.com,
 joey.gouly@arm.com, ioworker0@gmail.com, baohua@kernel.org,
 kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
 christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
 linux-arm-kernel@lists.infradead.org, namit@vmware.com, hughd@google.com,
 yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250429052336.18912-1-dev.jain@arm.com>
 <20250429052336.18912-7-dev.jain@arm.com>
 <25dcf969-e479-4d4a-a95c-0e83706af99e@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <25dcf969-e479-4d4a-a95c-0e83706af99e@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29.04.25 11:19, David Hildenbrand wrote:
> 
>>    #include "internal.h"
>>    
>> -bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
>> -			     pte_t pte)
>> +bool can_change_ptes_writable(struct vm_area_struct *vma, unsigned long addr,
>> +			      pte_t pte, struct folio *folio, unsigned int nr)
>>    {
>>    	struct page *page;
>>    
>> @@ -67,8 +67,9 @@ bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
>>    		 * write-fault handler similarly would map them writable without
>>    		 * any additional checks while holding the PT lock.
>>    		 */
>> -		page = vm_normal_page(vma, addr, pte);
>> -		return page && PageAnon(page) && PageAnonExclusive(page);
>> +		if (!folio)
>> +			folio = vm_normal_folio(vma, addr, pte);
>> +		return folio_test_anon(folio) && !folio_maybe_mapped_shared(folio);
> 
> Oh no, now I spot it. That is horribly wrong.
> 
> Please understand first what you are doing.

Also, would expect that the cow.c selftest would catch that:

"vmsplice() + unmap in child with mprotect() optimization"

After fork() we have a R/O PTE in the parent. Our child then uses 
vmsplice() and unmaps the R/O PTE, meaning it is only left mapped by the 
parent.

ret = mprotect(mem, size, PROT_READ);
ret |= mprotect(mem, size, PROT_READ|PROT_WRITE);

should turn the PTE writable, although it shouldn't.

If that test case does not detect the issue you're introducing, we 
should look into adding a test case that detects it.

-- 
Cheers,

David / dhildenb

