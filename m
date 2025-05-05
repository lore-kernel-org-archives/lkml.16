Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589A413213E
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 07:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746428494; cv=none; b=mD6nsqjmTX3nbfkVcfXMXpdaWUaOEsyLcNgdkQCFQE80yUoVXl7Ldd0+UYnR2Xivf5k4zCu6Y01X7DVJzkT603XrYN1hxbqVT+KpWjC+vUCvUOLqu7Jfp138nixL6fGcusTjXFUX0Nt4oOZnzix0O5FHwAhmfnKjTx6LroksnvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746428494; c=relaxed/simple;
	bh=u/30Ew8lKsyFMZVlQWQFvW6bIMIm5fa4NAIQtAueFX8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NPAGDmN08wPITW30xloVSZSsgS+MDRcfZk5wrfnD8varCcZg53v984VPDWqo++Dy2ZjWjeJsxKjEVEtCC9yGJe0JPAGYyUXZYFPLa6b1sV8DpO12PKRy7Flaokk1ljmKkAYupGSwGDyiTsEsnUpjYpASSo0KVXb5zR7PTrxuVw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EYFIAaY6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EYFIAaY6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746428491;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=RhhfHcsYwpjxeDwjBj3ZnCOvnYbVlwVS0EYs91oxcrY=;
	b=EYFIAaY6OkXzPZSLeU43DWMjxkf7JTS+HP5zSrv8Q+bzIh/H2qtrfGRSFi2R3Oy/pECiSM
	wTnohXq34iOmP1p7BYt9koQy6x8dOSIsWe6WKAB6TQASd27ZT13sHAgvZXjMdxvH/ZvpwP
	RPchbvEArWfHE0TcUPO5JZxshKSJoU4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-177-_OTNoBSQPDudCDgjGaTiuA-1; Mon, 05 May 2025 03:01:29 -0400
X-MC-Unique: _OTNoBSQPDudCDgjGaTiuA-1
X-Mimecast-MFC-AGG-ID: _OTNoBSQPDudCDgjGaTiuA_1746428489
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43cf5196c25so21665725e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 00:01:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746428488; x=1747033288;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RhhfHcsYwpjxeDwjBj3ZnCOvnYbVlwVS0EYs91oxcrY=;
        b=Fu9LFkP2LGgfXsG4MgF5b2dYqoHoOJ38zANYhowh9q930QaxUgkdyckzaKBJVa6UVZ
         Rlvs1JmljMdjFta19G0targkyGvDZq1jqDDxEkhwxvyUAvAjfSvwh/AcvGz9w7Ew14nU
         GOHjh5woHh9fLCWxFh0KOklWE9VfCyxWZnu+uGWyFXrrUc6eLFGqfIRQtsK56DNdmOx9
         eg6K2PgxlPh8Bw2ScxisiDvLcxXGckhubZdtEiUyqQ+iQFD0bxJmKvbM1EpbzQs62HpI
         HAjG/YgpVMruhdEIqGuZNIXLnxvf9ixarI3dKj7cm+Phl/k3iUMHrrZhK3/sg0K9ZpHo
         MF/A==
X-Forwarded-Encrypted: i=1; AJvYcCVhj+t861sRrwwhjNLTtZJ+YhDA8+Rdhk9B+J5FyC/nWS4mkWMI3X3mohAi8oH+rNhL/KNE+baCnV9AQzE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0riQbFgMCXBVNGhiu5MTIhxgfliS6akOtwOyXovM8yIdSNXeP
	aqQrFkB0kwsdwfIPILkot9pWYuI9mD6s7JX8vko4ZIB1bleEsQHjN6kZ/OIRsmbkgJU2O0QS2lH
	ikYAoKRB+SW3faJMJCEcOOa6ojEyMPLAEMEBknTq6fS02xZPWO0SMyDWWD4zXfQ==
X-Gm-Gg: ASbGncuop+bOPfgxDUrGBgUwvTb63J/eUHEe5wQe7KF2AV04rKSzmn4/bhAXxSxlvoV
	u5p9+Xh2q/BfEZU9FB/ZSaud/llUPmzGogdqm9fas/pzmNasKUf9CLWzX3lt85M2QK2JuucSe4p
	YcqbdZACOt+//f7Wh0Ke5YKZg4KDTL4qNcxXF4/NsHkorPbq3Cc+S+AyJHHAaJjsUSh7zonSGYi
	Ubnof8d5p6qvzmZlOROe10Z2lhlPGeQ1urdVtjzWj538YMZAZOI7LvXy++pQlzdjQLrkrErgWTV
	B7GrU58Kk+Gds4SwIMiNccqwvwQ7+tYmiKVblIZifEbhv1QQhe/igmwPhYy5FcTYdCnoQxsczHK
	6gQU9CumUe9XCE7Dznjz8eebh0SKiO5GH1ZNswkw=
X-Received: by 2002:a05:600c:1d9e:b0:43c:eec7:eabb with SMTP id 5b1f17b1804b1-441c48bc8f0mr46800775e9.8.1746428488651;
        Mon, 05 May 2025 00:01:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhpv+nKKZWl5dr3iD1RZGtma0FOL/sFOuS9BaYW0RupdfMgHSdX729belBTdnHfdl04v6LmQ==
X-Received: by 2002:a05:600c:1d9e:b0:43c:eec7:eabb with SMTP id 5b1f17b1804b1-441c48bc8f0mr46800535e9.8.1746428488347;
        Mon, 05 May 2025 00:01:28 -0700 (PDT)
Received: from ?IPV6:2003:cb:c73d:2400:3be1:a856:724c:fd29? (p200300cbc73d24003be1a856724cfd29.dip0.t-ipconnect.de. [2003:cb:c73d:2400:3be1:a856:724c:fd29])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2b287desm169126605e9.38.2025.05.05.00.01.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 00:01:27 -0700 (PDT)
Message-ID: <63aec3cb-60a8-4f30-9b12-3ee19c6c14f3@redhat.com>
Date: Mon, 5 May 2025 09:01:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] mm/hugetlb: Refactor __unmap_hugepage_range() to
 take folio instead of page
To: Fan Ni <nifan.cxl@gmail.com>, Oscar Salvador <osalvador@suse.de>
Cc: muchun.song@linux.dev, willy@infradead.org, mcgrof@kernel.org,
 a.manzanares@samsung.com, dave@stgolabs.net, akpm@linux-foundation.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250428171608.21111-3-nifan.cxl@gmail.com>
 <20250428171608.21111-6-nifan.cxl@gmail.com>
 <aBHYK3mqUyvqrGm2@localhost.localdomain> <aBfdls-Sw4VpMWQY@lg>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <aBfdls-Sw4VpMWQY@lg>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04.05.25 23:35, Fan Ni wrote:
> On Wed, Apr 30, 2025 at 09:58:35AM +0200, Oscar Salvador wrote:
>> On Mon, Apr 28, 2025 at 10:11:46AM -0700, nifan.cxl@gmail.com wrote:
>>> From: Fan Ni <fan.ni@samsung.com>
>>>
>>> The function __unmap_hugepage_range() has two kinds of users:
>>> 1) unmap_hugepage_range(), which passes in the head page of a folio.
>>>     Since unmap_hugepage_range() already takes folio and there are no other
>>>     uses of the folio struct in the function, it is natural for
>>>     __unmap_hugepage_range() to take folio also.
>>> 2) All other uses, which pass in NULL pointer.
>>>
>>> In both cases, we can pass in folio. Refactor __unmap_hugepage_range() to
>>> take folio.
>>>
>>> Signed-off-by: Fan Ni <fan.ni@samsung.com>
>>
>> Reviewed-by: Oscar Salvador <osalvador@suse.de>
>>
>> But:
>>
>>>   void __unmap_hugepage_range(struct mmu_gather *tlb, struct vm_area_struct *vma,
>>>   			    unsigned long start, unsigned long end,
>>> -			    struct page *ref_page, zap_flags_t zap_flags)
>>> +			    struct folio *folio, zap_flags_t zap_flags)
>>
>> I think we are kinda losing information here. ref_ was a good hint
>> and...
> 
> Hi Oscar,
> 
> Thanks for the feedback.
> Since the sugguested change here is minor and does not affect the
> function, and we do not have a aligned opinion here.
> https://lore.kernel.org/linux-mm/b23ef51b-1284-4168-8157-432c3e045788@redhat.com/
> I will leave it as it is until there are more pushes for the change.

I don't think we're losing any information. :) Especially if nowhere 
else in the kernel we use the term "ref_page" or "ref_folio". And things 
like put_ref_page(), free_unref_folios() ... talk about dropping 
references not "this is the reference folio".

"folio_to_unmap" might be clearer, but then, I think we should just use 
a single folio variable in that function.

This function might benefit from kerneldoc, though :)

-- 
Cheers,

David / dhildenb

