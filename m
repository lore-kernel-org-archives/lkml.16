Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1EB31993B9
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 19:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749844651; cv=none; b=ujtH3yvJiE4pIMKO0uQTG2y611ozvo+LhO7sXNeCmmqydeP1goxs+6YcKXY5Xp2OfbTOLqC4M3r6TXU3PD+BEzFyCHX6Uwaq/6wuKT2dNwQXuQtzwWeYbU2qR7yoqQJXwF4o5C7I183TbZO8+5pcL7355Pamo710Esw/zC69H78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749844651; c=relaxed/simple;
	bh=Gar34iSM0UXpNsaePuRrIbb+gcqZozQKhl/G5EfTpI4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V7YJOl2juJEa7ZZ6Xw+MN0ezqY3J2wRR/F0ooqqNRt5z37Alw9kn9Foo1NfcAQlaev5z5Zh66g5/xld8LtXUCbe0arSdrJnYTnn3a8czuC13aU2IOoz0G7WTlM/o0JYZSjZidytsr6BGEpXTSjZztfb3rFxA+hEuKDiufd1OoeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VXrb2KT0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VXrb2KT0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749844648;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=i0TQKjESHxK6cTzcBrQME8IBFyrZ8jShVytZ++oPYrY=;
	b=VXrb2KT0/kU7lwWfaGG8SUkbyK7DvcLkf9NvYSOIzCfopVthTlu3223TKSbLdUfp1zMG10
	eNDCtKonnfeVLtDW8VBAG5+trbLMBEon62n/zdvK2+7jNRQsGwtonLtRC7nLS8fnh2otO8
	mVleyg4DmFrR/mYM/Rgp+XrgIxMr9Ic=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-370-C4-X3iWwNvaQWnwc2RKJQA-1; Fri, 13 Jun 2025 15:57:27 -0400
X-MC-Unique: C4-X3iWwNvaQWnwc2RKJQA-1
X-Mimecast-MFC-AGG-ID: C4-X3iWwNvaQWnwc2RKJQA_1749844646
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-450d64026baso16796555e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 12:57:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749844646; x=1750449446;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=i0TQKjESHxK6cTzcBrQME8IBFyrZ8jShVytZ++oPYrY=;
        b=nVnkETQb7uebmlTCf/ZNGd5JECBifMamWWDRVJBfOEjfIfdEehQTlHn7e66zViUgU2
         BR6jO2M6OnM08Z/2CeOAK8oqp+kgEWuw+lUb4n0W1lICkY5MrRyIimz2vqSBa381DXV1
         8rSGtog9djT9Bvh7ED9Wqm04ybbeZYXwegqXNvEXmdHgLbJVhMjORmi+W/Avl3uFaMZi
         d5ndGjv/8dlkoYceaWuUQWLXjJ8VhhdYylwvRQ7CL6bl07atwxzJOgwN7qJZHoqMnmmz
         JCm2qYwFitVHxXEVRmdRMDo2KcvMCwToU0c0xCLHEjKRBou647O1Dw/ihMMtytEjFvtc
         ylSA==
X-Forwarded-Encrypted: i=1; AJvYcCVCkGbJCDsSXyfi3/6fg77x7+KJBnYMuhgrAjpvdrDnnnssCSve/I/BUi4icovdkYGbeBh7x1FRJ9dLHW8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4U1tH6WeFkcAd9ect+64rT0g6ClDQXJG4AtasnyLsJgtQpNfq
	TTHZqyAO/nDdiEoq7vwpxruJse0h53A5FREHMyfGLhjzWQzYIKbu9F4+bSTTvVfhmG2b5/icrHu
	Yzle0z8Jxe44WUt4iGdtwz0F3H5t+QFATXhnMrCVZVN1CQmfKIP3r+bQRjTnl3rK3sw==
X-Gm-Gg: ASbGncuTU6t2teiqRgwPUaFeurnfs8Z3nmLqwYg1UF3RE2GE/5Q295/k5YvBEIeZESl
	zKCSTkSq1s14awyXCLCGUvkQzFsv6PlIuIDNOs4v+nUDYRW+acaMFC2nJkmOSYGo8ZoLCXfJerb
	0TeupLkZY4PjmfVz5HVYwLxVwUq/Tw2RDyEsgApj7PmAHIzBtuStd7FmKAEIUgM3nzrdCPKXZZ/
	ov0P0CxfunuPMB7B0uVONox186co+rRmQpyOvJVAYrUxtEtMqGoTqhv/8nE3g+FDf5UF3Rs9G+L
	jxC5rnlhV7dKcclTzYxXmaQb7ido2KNB16/BAkAkxsIEaghfeUP95s324sqR67KlSAzTEO12W+d
	21gsi6InZN1QVJX3TGUYErUs4S1OUt8WDgPuZfWHAWkds6guWkg==
X-Received: by 2002:a05:600c:358b:b0:450:6b55:cf91 with SMTP id 5b1f17b1804b1-4533ca4681amr9623015e9.6.1749844646118;
        Fri, 13 Jun 2025 12:57:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvApC5lDtccKglB9U88TXnFqonrOhZhGCcvfW7NYtyiyeauiD9kcVAxL15TvPCzlvjDstuXQ==
X-Received: by 2002:a05:600c:358b:b0:450:6b55:cf91 with SMTP id 5b1f17b1804b1-4533ca4681amr9622825e9.6.1749844645704;
        Fri, 13 Jun 2025 12:57:25 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f1a:3700:2982:b5f7:a04e:4cb4? (p200300d82f1a37002982b5f7a04e4cb4.dip0.t-ipconnect.de. [2003:d8:2f1a:3700:2982:b5f7:a04e:4cb4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532dea1cc5sm63859665e9.16.2025.06.13.12.57.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 12:57:24 -0700 (PDT)
Message-ID: <ffeeb3d2-0e45-43d1-b2e1-a55f09b160f5@redhat.com>
Date: Fri, 13 Jun 2025 21:57:23 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] mm,hugetlb: Document the reason to lock the folio in
 the faulting path
To: Oscar Salvador <osalvador@suse.de>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Muchun Song <muchun.song@linux.dev>, James Houghton <jthoughton@google.com>,
 Peter Xu <peterx@redhat.com>, Gavin Guo <gavinguo@igalia.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250612134701.377855-1-osalvador@suse.de>
 <20250612134701.377855-3-osalvador@suse.de>
 <44f0f1cc-307a-46e3-9e73-8b2061e4e938@redhat.com>
 <aEw0dxfc5n8v1-Mp@localhost.localdomain>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <aEw0dxfc5n8v1-Mp@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13.06.25 16:23, Oscar Salvador wrote:
> On Fri, Jun 13, 2025 at 03:56:15PM +0200, David Hildenbrand wrote:
>> On 12.06.25 15:46, Oscar Salvador wrote:
>>> -	/* hugetlb_wp() requires page locks of pte_page(vmf.orig_pte) */
>>> +	/*
>>> +	 * We need to lock the folio before calling hugetlb_wp().
>>> +	 * Either the folio is in the pagecache and we need to copy it over
>>> +	 * to another file, so it must remain stable throughout the operation,
>>
>> But as discussed, why is that the case? We don't need that for ordinary
>> pages, and existing folio mappings can already concurrently modify the page?
> 
> Normal faulting path takes the lock when we fault in a file read-only or to
> to map it privately.
> That is done via __do_fault or cow_fault, in __do_fault()->vma->vm_ops_>fault().
> E.g. filemap_fault() will locate the page and lock it.
> And it will hold it during the entire operation, note that we unlock it
> after we have called finish_fault().
 > > The page can't go away because filemap_fault also gets a reference on
> it, so I guess it's to hold it stable.
> 

What I meant is:

Assume we have a pagecache page mapped into our page tables R/O 
(MAP_PRIVATE mapping).

During a write fault on such a pagecache page, we end up in 
do_wp_page()->wp_page_copy() we perform the copy via 
__wp_page_copy_user() without the folio lock.

In wp_page_copy(), we retake the pt lock, to make sure that the page is 
still mapped (pte_same). If the page is no longer mapped, we retry the 
fault.

In that case, we only want to make sure that the folio is still mapped 
after possibly dropping the page table lock in between.

As we are holding an additional folio reference in 
do_wp_page()->wp_page_copy(), the folio cannot get freed concurrently.


There is indeed the do_cow_fault() path where we avoid faulting in the 
pagecache page in the first place. So no page table reference, an I can 
understand why we would need the folio lock there.


Regarding hugetlb_no_page(): I think we could drop the folio lock for a 
pagecache folio after inserting the folio into the page table. Just like 
do_wp_page()->wp_page_copy(), we would have to verify again under PTL if 
the folio is still mapped

... which we already do through pte_same() checks?

-- 
Cheers,

David / dhildenb

