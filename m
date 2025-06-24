Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D7D1F5617
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 08:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750753805; cv=none; b=epKlLPPwj/e4ObNDMC3/XgX32Kzrqmx9qlMVlhlSifoHQ6HBBFIMvpAJno/9nQA+Rh26G1Fky7amFYgtMMhgTOgTP4vnW4KHxnjv2DqqFwOXuDqFxWRUkayc1I1xgssJPTrODMVp9H2Vc9tJCgX2zF3IHosqRwxq/+UaWcNzLs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750753805; c=relaxed/simple;
	bh=uaR/M8sP5lFhz77VZt6O7P6zpylOL/LO96IjQVwbFNM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LBaBJBx6xjZee7fGGbgHe16Mkl1P6t/e1V93i1QLVVJSvCcHluXuY0teVUIBBLYhZCP8nacvn4cbCU8jOp/f9entbVJYyVtjmz73bFNiwqlaZJYxnHKB53AJNoMVbiusQcEbd2J2Gw5uqPTMaEeeV3zDaYpJoqR535DaeMnEb3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=P9dOh1Jk; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P9dOh1Jk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750753802;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=AyqJMvywObY4nRmPc+2PsXq0lHTsftC0w2wrECC4jPI=;
	b=P9dOh1Jk/V/hrEL35sjAy34q7JWu4qMWM9j1t0KqPdups1TnJjEPWp7HUK1DW0M6FPCkbc
	8MyTxIih/DGsgP2bL5r1p6BmNhWHeaWJVyleY2Thfj8uZOuNArXpvWYPgAU8xDu8Is4LP1
	scZxGejPUZkKPqeQn0cF2V27dZWIEZw=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-414-2H1Ps_zdO8-c-7IdjMDepw-1; Tue, 24 Jun 2025 04:30:00 -0400
X-MC-Unique: 2H1Ps_zdO8-c-7IdjMDepw-1
X-Mimecast-MFC-AGG-ID: 2H1Ps_zdO8-c-7IdjMDepw_1750753799
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-60785c45274so3911941a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 01:30:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750753799; x=1751358599;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AyqJMvywObY4nRmPc+2PsXq0lHTsftC0w2wrECC4jPI=;
        b=kFPlP14Zog8MteaxX3iS45TEyPsdco+hTE46WW8tnuEVpwuIwpDEeSlqrLeNns16eL
         THw/jjcsS4JZAtVgfFmEhkRv0q9IELCNGrdRhsSHZW/8JlES3HnfTiGv7E23v6bRcQHl
         mIAMZxisVPP/CK/ST1gu1Wy2l+G/hRzRSy8egLmURuh8m98xASDk5Mus9CuNelrBEnBw
         2Bxo5gVyWyt/85cP2lTu9oHHY1RRZ9DbN3nFTMGufFKzaJsILNWDemhesKnCj5gsCSLC
         sg97U3ZD0F+TevS1aPIvivcrSDTVFm8CNj8+5Z0ulGvmbsaEu/qgEHdPiYI+kDScyi2X
         xWvg==
X-Forwarded-Encrypted: i=1; AJvYcCUP/ut2XIz2fkAoKhrslTMTYFSxH5jzQBYCNAJhvr8EdAj+r0MZnbLq4X83qElXyfDZ+23alPArXpdFe80=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmIgMN3+TXcaKiFsByOXbHAn0Y7gYPi0FMgmopxCBUd5avFZso
	oueGQQGNP3L2t2CGdFZTbdbDbIY1jSRg1OMg7pfY06wW9oGFLB/bM2rcCUoH5bLFiradrxNV88q
	US0VHqiIogtLku/GsdT12DQ/TnkLD0h9MV+PDx5gTTRcrBDgoNKMjOFUhhazfgqtpDQ==
X-Gm-Gg: ASbGncu45Yap/1R+fwAhNXY3CYPLhXkfWJZEIo+n9pGmSxJgfGMNltOoGYfkvy2kW0Z
	tPK9duzh3tTU0OYKFjPkJkftiojLhpnEltsvUJeWDNzlWHgDbPNFIE2jFgGdVWLCZfyuedMhRKo
	2yyinHmzGmAoCTQoEQkumUyXelu5YPmQI2lTCji//KziPDLIWE46tubCjCOR2UFZAwffaI3yUro
	rgw2gmGI6Yl0b344nPdA8H5pr5x3QiRO/oQnmyudM2HQ9Y+vEKURvfmy8MhQo03HvRJ2RQEpWD7
	sMOD1UIiV/dyVt9IjfqVDEDvc8aUXnTklY4Z
X-Received: by 2002:a17:907:940d:b0:ade:c643:62ce with SMTP id a640c23a62f3a-ae057cd7b28mr1502687866b.56.1750753799363;
        Tue, 24 Jun 2025 01:29:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGoHZfuvldROZlOpGrlurDali1Q//bIgFk9wR+Ykn2N+4mx7sxvQlxPEOfDkbPRWBFbwP5rhw==
X-Received: by 2002:a17:907:940d:b0:ade:c643:62ce with SMTP id a640c23a62f3a-ae057cd7b28mr1502684866b.56.1750753798914;
        Tue, 24 Jun 2025 01:29:58 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:84::108? (mischulz23.caps.cit.tum.de. [2a09:80c0:84::108])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0541b6894sm836679466b.111.2025.06.24.01.29.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 01:29:58 -0700 (PDT)
Message-ID: <44c805d7-000a-440e-995b-106f324eff15@redhat.com>
Date: Tue, 24 Jun 2025 10:29:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] mm: huge_memory: disallow hugepages if the
 system-wide THP sysfs settings are disabled
To: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org,
 hughd@google.com
Cc: ziy@nvidia.com, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
 npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com,
 baohua@kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <cover.1750666536.git.baolin.wang@linux.alibaba.com>
 <adb8d5032ecc7b6935e3197cafffe92cbc7581e6.1750666536.git.baolin.wang@linux.alibaba.com>
 <a9f77007-78c1-4980-bd31-af5dff741f27@redhat.com>
 <ae78feb2-d044-41ba-bc4f-e3085428bc10@linux.alibaba.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <ae78feb2-d044-41ba-bc4f-e3085428bc10@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 24.06.25 03:48, Baolin Wang wrote:
> 
> 
> On 2025/6/23 21:54, David Hildenbrand wrote:
>>
>>> diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/
>>> selftests/mm/khugepaged.c
>>> index 4341ce6b3b38..85bfff53dba6 100644
>>> --- a/tools/testing/selftests/mm/khugepaged.c
>>> +++ b/tools/testing/selftests/mm/khugepaged.c
>>> @@ -501,11 +501,7 @@ static void __madvise_collapse(const char *msg,
>>> char *p, int nr_hpages,
>>>        printf("%s...", msg);
>>> -    /*
>>> -     * Prevent khugepaged interference and tests that MADV_COLLAPSE
>>> -     * ignores /sys/kernel/mm/transparent_hugepage/enabled
>>> -     */
>>> -    settings.thp_enabled = THP_NEVER;
>>> +    settings.thp_enabled = THP_ALWAYS;
>>
>>
>> Would MADVISE mode also work here? If we don't set MADV_HUGEPAGE, then
>> khugepaged should be excluded, correct?
> 
> I tried this, but some test cases failed. As I replied to Barry, it's
> because some tests previously set MADV_NOHUGEPAGE, and now there is no
> way to clear the MADV_NOHUGEPAGE flag except by setting MADV_HUGEPAGE.

Okay, can you add that detail to the patch description. I suspect we 
really want a way to undo what MADV_NOHUGEPAGE/MADV_NOHUGEPAGE did (if 
only naming wouldn't be complicated: MADV_DEFAULT_HUGEPAGE, hmmmm).

-- 
Cheers,

David / dhildenb

