Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A9F139D0A
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 03:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751685428; cv=none; b=Va1rUGs/vBC+bovUfATcXQ1Xcg90ANM10Y4hTlrKnKd5O4Nb96MPQ4/w5xodJOwyINEQrY1v14SOMOQww/goGtg+vfcQXHS153CAcVrnUu2Y6gcBk0maOsRVwDY2JaV3L1U1fJmg10JrcfdbFucd+UYWy4oUfial0n4nSsvrh/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751685428; c=relaxed/simple;
	bh=XxjAsf9chqev4dX/SiMm+qf47fKa+FxYoX/zknAsnSI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=He5WvbB+Vo5tNiA9nWcZYIXQiyXw2NqFSnP/Zn+55sbVorDh+3v383LzbmplRJFjkjpfJDKEZNSZVSM5/Ed+DPSiE2+oR9uJYXTtq59K3dbvWfe2DoNu3XrMakAxwmgjczIgoCB7FHRa/ueNHWMCSFCVLk0T+h/cV6ORiz/F2Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aniEvFd9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aniEvFd9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751685425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F5/Bn2BytkOsSlWozTZYRd/bdmH3M8hyQMzYw6cOXkw=;
	b=aniEvFd9mTAiN39fAr86BG1RoSRxVKc4tjX+A3Hd/MTRHPAXNlGn/MUmVS7wl5bUkyKgPX
	qGuYe35plmibQkT395iXq2hZdi38sh/wc58MB6f3NfsS0gZRU8UuZqNKfW66a5pSach+aU
	lxWLd8u4xRX4RLMpZ90REuEouvM1dxI=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-443-NrRKv9-qML2WgtiRZ0sYsA-1; Fri, 04 Jul 2025 23:17:03 -0400
X-MC-Unique: NrRKv9-qML2WgtiRZ0sYsA-1
X-Mimecast-MFC-AGG-ID: NrRKv9-qML2WgtiRZ0sYsA_1751685422
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-553addbf0beso1150381e87.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 20:17:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751685422; x=1752290222;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F5/Bn2BytkOsSlWozTZYRd/bdmH3M8hyQMzYw6cOXkw=;
        b=hfs4wRiWX3cCnwe7YKUDHIa3UH6GsZYbI0Q6UE6Bk/9nWlasDPBevT+4+mnHz0NPuZ
         UsNiF3Ba2IM6/nHh0kEQBPdpzCQZs/ntAR6x4JhqT0EIyNrHFBnsqrthBpwIh02ADRG/
         wNaR/7NQax4EHY3ERoTvw0LdRtgisV4w3RzcmGrbOyqqQ24BtjTOAuRGPJibnNSeSGGR
         ykJlL9szDSNlois/CNMYxAYSaNaF7rtRkGSsBJvcJLBUJ+3xPbLnfwcu7mePZKY7x82D
         JHaesjKrBUyoNaNOTcqVZ83nmdhKr4e7Hd4y8RVr5XOEr+xU9EhtmJADPubhBFjSDrqa
         P+bQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPvNIGlVw/Hvdfra4R5iH6ZNp+aSPMpX4cJXL3nfHY7jqtIhbl2zj4W56aQCw1kmQD1oXXlS6v5+ajyLM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwS9kKpinkw5VyJDxOjFRp+UczyjByioHnmV6p9rZtn8Yrd5jI5
	n9d4Lr5elK4K69yCfYjhvFil7ff5eveCJjRKqzMgWP82/n1SUT08KJ5Daf4UWoH2heHOrzc8g12
	Uk3nur54B8/7uPM4rOZ6HE7Of6zAoak3lgshhnYYCKP6XfyT6mK/ZVduSbgaE0qhy
X-Gm-Gg: ASbGncsst7E0/p1nmthqTzdELh7NQQFcY33wPq87hM0UfP6DBXzH/CKOBMfSS0tK1ER
	7BglG8p4Cyl4xdGFdQL/iVSQCWtFZk3G77NevrQ9zM+mf8ACsj2JeHqUvqoGM5QMOWtHNvcM+jM
	Wy1puBxHOzQfYpzrCGx/TVRa0vQNH+nAmWwtKU6iyVVy3ACLOBAkVLA7X9DPU3D7eoSw8qqpOiu
	0PgVfkWKPxopYs7nBwNq3aHNpMLuHpIxu3CjhMLtiFqSqfEKXeFwTiql4to8A4/xPMHvAfNctDY
	/oB7LeTNM6ge9trUGzyrNslwXtSufJtt6/ObnuTql/HvChys
X-Received: by 2002:a05:6512:3b86:b0:553:ac4c:2177 with SMTP id 2adb3069b0e04-557e555948emr242526e87.20.1751685422003;
        Fri, 04 Jul 2025 20:17:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCzn96YGyNVvvQhJUr6pN5y+cvMh4pEY4+0E++aRJaPYzWFUVtLdVb+2Zv5/f1eXWAlgJt5g==
X-Received: by 2002:a05:6512:3b86:b0:553:ac4c:2177 with SMTP id 2adb3069b0e04-557e555948emr242510e87.20.1751685421496;
        Fri, 04 Jul 2025 20:17:01 -0700 (PDT)
Received: from [192.168.1.86] (85-23-48-6.bb.dnainternet.fi. [85.23.48.6])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32e1adbb390sm3996551fa.0.2025.07.04.20.17.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 20:17:01 -0700 (PDT)
Message-ID: <6bb5b0ae-6de3-4df8-a8c1-07d4c6f8c275@redhat.com>
Date: Sat, 5 Jul 2025 06:17:00 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>
Subject: Re: [v1 resend 08/12] mm/thp: add split during migration support
To: Balbir Singh <balbirs@nvidia.com>, linux-mm@kvack.org
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?=
 <jglisse@redhat.com>, Shuah Khan <shuah@kernel.org>,
 David Hildenbrand <david@redhat.com>, Barry Song <baohua@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Matthew Wilcox <willy@infradead.org>,
 Peter Xu <peterx@redhat.com>, Zi Yan <ziy@nvidia.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, Jane Chu <jane.chu@oracle.com>,
 Alistair Popple <apopple@nvidia.com>, Donet Tom <donettom@linux.ibm.com>
References: <20250703233511.2028395-1-balbirs@nvidia.com>
 <20250703233511.2028395-9-balbirs@nvidia.com>
 <e1889eb8-d2d9-4d97-b9ae-e50158442945@redhat.com>
 <715fc271-1af3-4061-b217-e3d6e32849c6@redhat.com>
 <b25b3610-5755-4b7e-9a9f-d7f1dc3e4bdc@nvidia.com>
Content-Language: en-US
In-Reply-To: <b25b3610-5755-4b7e-9a9f-d7f1dc3e4bdc@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


>>>> +static void migrate_vma_split_pages(struct migrate_vma *migrate,
>>>> +					unsigned long idx, unsigned long addr,
>>>> +					struct folio *folio)
>>>> +{
>>>> +	unsigned long i;
>>>> +	unsigned long pfn;
>>>> +	unsigned long flags;
>>>> +
>>>> +	folio_get(folio);
>>>> +	split_huge_pmd_address(migrate->vma, addr, true);
>>>> +	__split_huge_page_to_list_to_order(folio_page(folio, 0), NULL, 0, true);
>>> We already have reference to folio, why is folio_get() needed ?
>>>
>>> Splitting the page splits pmd for anon folios, why is there split_huge_pmd_address() ?
>> Oh I see 
>> +	if (!isolated)
>> +		unmap_folio(folio);
>>
>> which explains the explicit split_huge_pmd_address(migrate->vma, addr, true);
>>
>> Still, why the folio_get(folio);?
>>  
>>
> That is for split_huge_pmd_address, when called with freeze=true, it drops the
> ref count on the page
>
> 	if (freeze)
> 		put_page(page);
>
> Balbir
>
yeah I guess you could have used the pmd_migration path in __split_huge_pmd_locked, and not use freeze because you have installed the migration pmd entry already.
Which brings to a bigger concern, that you do need the freeze semantics, like clear PageAnonExclusive (which may fail). I think you did not get this part
right in the 3/12 patch. And in this patch, you can't assume the split succeeds, which would mean you can't migrate the range at all.
Doing the split this late is quite problematic all in all.



--Mika

