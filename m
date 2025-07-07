Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2302580FE
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 03:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751858986; cv=none; b=QI2mO5ghNglDMHsVNq/ptyvR1ZBQoe9pAaFSDOEHheCocMNAnXuaTpHgpC+7pqo3qZBw2CexSD3N5mWirbTSA0OZWhbMu5M2ECdh601QQBaQ+HIFsM42YeYk8k5GcuX1QYjM7yAVVxnhjSy6J8OCdK46aCPhTboj+/hnxWyEUT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751858986; c=relaxed/simple;
	bh=xttYNFFBwSr3kpaUW8tJxMwGQAXuZTSnXnLU9YrWjUM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nYeX9Kcnad9Lyq+0KHm5DheWhDkS/9oE4zRJM9pnQxj5XKjJoa/8xtKfwRgQTkolckfQroUgNE1vOi+z8t/vWrc3fWtjSx8Z4gSaV73UWDqY+nKHjDH3tPhA+YdJhgKtPNI5YReXL1uku5xMJwiAoNa16qUBxZV+J+J6pzvlEKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QW0jSXN7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QW0jSXN7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751858981;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gzNFWf4OSQQeW+ySynN28u9/wwwb81IMF6vHrkKZo84=;
	b=QW0jSXN7pCB1Ictyw7rDHv1llynH0JjR3fWfSXjoZZ1mLlvWvu1M5qbwHd9WkRE1DM2D9M
	RpIAwqXoCs4fQIZBtfqSkuW9TUFpXz8NZakqo6qfteU/FRYGHH6TNnyC4bu81JAuQ6QjJY
	IVBK9XTZsHn/+EHeL/TdpJnkESmkX0I=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-231-DmFNuCVeO92iIfZr1lg2FA-1; Sun, 06 Jul 2025 23:29:40 -0400
X-MC-Unique: DmFNuCVeO92iIfZr1lg2FA-1
X-Mimecast-MFC-AGG-ID: DmFNuCVeO92iIfZr1lg2FA_1751858978
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-5551093dd58so1388211e87.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 20:29:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751858978; x=1752463778;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gzNFWf4OSQQeW+ySynN28u9/wwwb81IMF6vHrkKZo84=;
        b=fNlUNa1T7r51QUfm0evVpJ3kOf8Uv8vWsghayUwhv4DAUiUBDs22cu+EmXY6pHx/ul
         OYEXozWZXo3d6hq0pO9J3BUcx/TBID8XnI+nBFMKw8Roz/ZE86ptq1VFkwyrHokL4Glu
         K8/hRGHONHOKtdGNrL7jpKZ2nVIKrFfbIb8MJXjJ8xpozZfzFERJQBJhM/xRb8vWlZaJ
         qbeclONoAHXGzbCjlGmmLlEP3YRMTBh3bZLezMGgpix3puYBvShKoJd+lBINw1B/DVMF
         Rj8h261Mvtm0VX77oAZcHsrPCtv6J1SjluNpMfGrWIzEECzehL/i2YU3coogrlYclDhX
         vDOg==
X-Forwarded-Encrypted: i=1; AJvYcCVyTWI+lIjsRfL9yCBTmqSJ8RSnbnP6S7q5A6GZuj4+lI5XorRyWiW9GZQCgklHABUKoP+n3paEZnaSaIM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKhr5b/sqpK/A5UxkMZqPKGlHhyZJfVclsex2PoccctDjRyf2T
	A2D4EYGVyRXP1S5X5NsrTiRn+NatrlVEfRLNXN87v4YnsyrZEuawyHxbcFc4a2EyHb77LWuVmCg
	68MwUE3EuOwJqCP+9b5HPKcTbmLWY8bmzzeedjz5U5AxI91z7FDDRint9rEcf9BWW
X-Gm-Gg: ASbGncubIO72EJurb0DC3tzqBqD+PZ7912kmkQGu8CyL/YJzz+v8xBZmqq7H4f3/ffL
	e0oRHw+SDXkNK/jrgQoSnzXvLbDaC6moKZx8vnNEoxJaQ5yM2DhfgfMZMSWgSAdBzSvIODs1aSF
	lMvAUIyLpjWduoxwMx7PctHfdCiPAokxTjjwu45g1VdVSwQO1dUfrbz+RYQjXUDR3WAirgiyMAJ
	xsArsHdBKVOkCc5qOa9EQPkSLBEYi4Q195M0P818xOPNUhAXeyDr8T7QdDhIkUfwSGFSfHXz+bB
	RX1IpPGxJ+En2p62EbXQv8OBrfEv7mzV88LxhYRLWDhscfSU
X-Received: by 2002:a05:6512:3d9f:b0:553:24f4:872a with SMTP id 2adb3069b0e04-557e5558009mr1851329e87.40.1751858978364;
        Sun, 06 Jul 2025 20:29:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGgxRoCFlczHytULjaP6Q8J3Xtu86ygoM7iexhMKDI/4xLKg09g2YDN+ZgYPwubGW96GEC0og==
X-Received: by 2002:a05:6512:3d9f:b0:553:24f4:872a with SMTP id 2adb3069b0e04-557e5558009mr1851314e87.40.1751858977889;
        Sun, 06 Jul 2025 20:29:37 -0700 (PDT)
Received: from [192.168.1.86] (85-23-48-6.bb.dnainternet.fi. [85.23.48.6])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55638497801sm1163807e87.127.2025.07.06.20.29.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Jul 2025 20:29:37 -0700 (PDT)
Message-ID: <f1e26e18-83db-4c0e-b8d8-0af8ffa8a206@redhat.com>
Date: Mon, 7 Jul 2025 06:29:36 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
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
 <6bb5b0ae-6de3-4df8-a8c1-07d4c6f8c275@redhat.com>
 <2ace3c9e-452a-4bd2-a7df-6fa9fd3de290@nvidia.com>
Content-Language: en-US
From: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>
In-Reply-To: <2ace3c9e-452a-4bd2-a7df-6fa9fd3de290@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 7/7/25 05:35, Balbir Singh wrote:
> On 7/5/25 13:17, Mika Penttilä wrote:
>>>>>> +static void migrate_vma_split_pages(struct migrate_vma *migrate,
>>>>>> +					unsigned long idx, unsigned long addr,
>>>>>> +					struct folio *folio)
>>>>>> +{
>>>>>> +	unsigned long i;
>>>>>> +	unsigned long pfn;
>>>>>> +	unsigned long flags;
>>>>>> +
>>>>>> +	folio_get(folio);
>>>>>> +	split_huge_pmd_address(migrate->vma, addr, true);
>>>>>> +	__split_huge_page_to_list_to_order(folio_page(folio, 0), NULL, 0, true);
>>>>> We already have reference to folio, why is folio_get() needed ?
>>>>>
>>>>> Splitting the page splits pmd for anon folios, why is there split_huge_pmd_address() ?
>>>> Oh I see 
>>>> +	if (!isolated)
>>>> +		unmap_folio(folio);
>>>>
>>>> which explains the explicit split_huge_pmd_address(migrate->vma, addr, true);
>>>>
>>>> Still, why the folio_get(folio);?
>>>>  
>>>>
>>> That is for split_huge_pmd_address, when called with freeze=true, it drops the
>>> ref count on the page
>>>
>>> 	if (freeze)
>>> 		put_page(page);
>>>
>>> Balbir
>>>
>> yeah I guess you could have used the pmd_migration path in __split_huge_pmd_locked, and not use freeze because you have installed the migration pmd entry already.
>> Which brings to a bigger concern, that you do need the freeze semantics, like clear PageAnonExclusive (which may fail). I think you did not get this part
>> right in the 3/12 patch. And in this patch, you can't assume the split succeeds, which would mean you can't migrate the range at all.
>> Doing the split this late is quite problematic all in all.
>>
> Clearing PageAnonExclusive will *not* fail for device private pages from what I can see in __folio_try_share_anon_rmap().
> Doing the split late is a requirement due to the nature of the three stage migration operation, the other side
> might fail to allocate THP sized pages and so the code needs to deal with it
>
> Balbir Singh

Yes seems clearing PageAnonExclusive doesn't fail for device private pages in the end, 
but the 3/12 patch doesn't even try to clear PageAnonExclusive with your changes afaics,
which is a separate issue.

And __split_huge_page_to_list_to_order() (return value is not checked) can fail for out of memory.
So think you can not just assume split just works. If late split is a requirement (which I can understand is),
you should be prepared to rollback somehow the operation.

>
--Mika

