Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54ACE29B22D
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 10:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750846405; cv=none; b=EWeZ8CWjEz7izUZAr9LhUirOSZ4GZN+grKnp/0I8xDSwWSG8wOZ8ghdJ8Ujio+2b1znvtJQWROEgbX5wGfXEVyk/hndXjd7QmUBcxkC6WGZLArhIng0ehu8BIOSAXYC4cyIgBTTmM0ccZju7ijffuZr4R5aClAyQCILzHo41ol0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750846405; c=relaxed/simple;
	bh=f00caMhMJNwf7PMxdCeGlzNnSQ5JS5p+FKtfJ0cNb7w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NJWX5lDLgX6Cid1uZekNMDCPbBC2cg8WTGrT7ZvMlOwry/bNaCbSXBWDl4nuFGK2Eqy6DSIQ9SnAK5PP9UhP+9cogdJ3hTPquuNQszF7YmkEDc8HNRSXnUHeDxaMRxQWBeSsVos6dDPOUM75HgjRGWhrwX0INet5fpw3MsE4a2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fTg/YMzq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fTg/YMzq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750846402;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Ocn/ODqk8wCM+J+nUX+K2lMqIhHOZxBKo9wLudoDs0w=;
	b=fTg/YMzqb3lpkuL2jUlzH7BuV39YUHN8cC03JQCQEE5Y3o2pHZ8DicUz5MEX0JXBNTKTRT
	esiKcur+W+iH20RZhJBSbcxnRVoH5olxI5Bqu3H5kMTibulfqBBDBXmmRaxT7nXKkkE2p2
	5MsWQdItl7Nhep51IlkIWAuznNlFtdc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-294-8iqa4HXyOGOK17tYPIn23g-1; Wed, 25 Jun 2025 06:13:16 -0400
X-MC-Unique: 8iqa4HXyOGOK17tYPIn23g-1
X-Mimecast-MFC-AGG-ID: 8iqa4HXyOGOK17tYPIn23g_1750846395
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-450d244bfabso50630735e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 03:13:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750846395; x=1751451195;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ocn/ODqk8wCM+J+nUX+K2lMqIhHOZxBKo9wLudoDs0w=;
        b=HC7E4qYI/cayB+etoR7XW7HAOwuQda9anF+0ch8+16kS/WOnrnhX/qkJevQl0sJny2
         lviigvWj5v51Yhv8mxZ3iMFdXO052fZ+voE9MdjNigSnVCfCXJtK6kvq+yKkoGf87Cv0
         gX/wfunUJXCbRbtwoN7wg9hdrd1Geb206zj5/0HTetAd/TF9Bh8Z51yfP75EvN5GZVW4
         UKVjpDSM4RXsbuRvXwUSOLQEsCzZr48UId7c5gYEA6ayRWCD6KopyTZuorUucve5vaow
         rQPdlsv6RMV1Y98Zx8ODa0RlTGS9/88E4djpVwNRhsUicvukXbyJEDSdlEhTEI/DVgI/
         hoNw==
X-Forwarded-Encrypted: i=1; AJvYcCWq2W9lMS/r7NECpiX1/adH8nc1HAoLOZbIYodItoNdd/cQz9IHCGI9Eb52ZE1cw/lZEIJ5T7oxMnEN8DM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw22g78eWZyuMib7Lxg/VPsnNFF69VP3kPUQw6+wT2g+SNdyBZ/
	sLt46ztGYvpNt5pDLzaabLXh1jCtXZSgBVgZryZOIZbAW1i1eE8C4mmDXrcOvo2FLEK5xWgYWO+
	G6Uof0hHRnKJ0XxdCEQuNIKi3W9R8Y045xTDVcqGpuqnsfoVnRSezaDm3OuNF9eQfmg==
X-Gm-Gg: ASbGnctyOOUhAw0LSK2vTOYaxt6t/LlQ2AS6VC312I2KSj7my/GJFkOpXnCXRFfuoPE
	RQBTLN2yghkxVR2YrQod3TYSlYsFg8/AnpcCZVuCtTtXxmKe6MRXomHbgvL3C7pobUiAoSBe9wv
	/MABJOedZaEhimb0Mv3f8Swpfe5qdnQVL5WwM2vqi+61vYcBGEG5ElphDlNGbYAhvEGNAWtbMJ6
	/Mn0HmwLoPAR1puMucrnQkXakUDcuMiQ7rpZhvaJaAefwysciQHDRRJZ4UtWuFqY5EhMPInTXcS
	pURx11y9/amu2ygPkg7C3RA9z208xezTh39WuDO0+7pIQrmh38SgLg==
X-Received: by 2002:a05:6000:4913:b0:3a4:d367:c591 with SMTP id ffacd0b85a97d-3a6ed5c7b26mr1861535f8f.10.1750846394733;
        Wed, 25 Jun 2025 03:13:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPoNM7p9tuaRpt47wshhpPxdQ6o8XwMpBiMzR2lmO9/zLctCPS7q+Nksaf3M65EY6A8tOpJA==
X-Received: by 2002:a05:6000:4913:b0:3a4:d367:c591 with SMTP id ffacd0b85a97d-3a6ed5c7b26mr1861517f8f.10.1750846394352;
        Wed, 25 Jun 2025 03:13:14 -0700 (PDT)
Received: from [192.168.3.141] (p57a1abde.dip0.t-ipconnect.de. [87.161.171.222])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823563fasm15039395e9.21.2025.06.25.03.13.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 03:13:13 -0700 (PDT)
Message-ID: <ab9efb5b-66ce-46f3-b0be-544f202d9190@redhat.com>
Date: Wed, 25 Jun 2025 12:13:12 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] mm,hugetlb: Change mechanism to detect a COW on
 private mapping
To: Oscar Salvador <osalvador@suse.de>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Muchun Song <muchun.song@linux.dev>, Peter Xu <peterx@redhat.com>,
 Gavin Guo <gavinguo@igalia.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250620123014.29748-1-osalvador@suse.de>
 <20250620123014.29748-2-osalvador@suse.de>
 <45d66a0c-a5ed-4894-999c-0ed5b732ebb0@redhat.com>
 <aFuqAHvBSslOuEMQ@localhost.localdomain>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <aFuqAHvBSslOuEMQ@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25.06.25 09:49, Oscar Salvador wrote:
> On Mon, Jun 23, 2025 at 04:09:51PM +0200, David Hildenbrand wrote:
>>
>>> -	/*
>>> -	 * hugetlb_wp() requires page locks of pte_page(vmf.orig_pte) and
>>> -	 * pagecache_folio, so here we need take the former one
>>> -	 * when folio != pagecache_folio or !pagecache_folio.
>>> -	 */
>>> +	/* hugetlb_wp() requires page locks of pte_page(vmf.orig_pte) */
>>>    	folio = page_folio(pte_page(vmf.orig_pte));
>>> -	if (folio != pagecache_folio)
>>> -		if (!folio_trylock(folio)) {
>>> -			need_wait_lock = 1;
>>> -			goto out_ptl;
>>> -		}
>>> -
>>> +	folio_lock(folio);
>>>    	folio_get(folio);
>>
>> Just realized that this won't work for this patch here, as we are holding
>> the PTL.
>>
>> In patch #2 you do the right thing.
> 
> Yap, missed that.
> I might have to do the lock-unlock-dance here, and then in patch#2 move
> it to hugetlb_wp.
> Sounds reasonable?

Yes

-- 
Cheers,

David / dhildenb

