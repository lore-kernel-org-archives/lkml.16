Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6119F155C82
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 10:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744973903; cv=none; b=eT2gM2YeZVlCsZLbbFJfSKN859H3HdK2EOCXtS/l2UU+PJSkL1iMnzhSf+GMWsz9pt8Vyc1Bi7vvQww8EtwqUzFo7LHsbhWQ+ms2eeQJMItX8ZZqNkw8sMjejrqWudHJdCJU7VSOYVno7HFsDzguxTm6zybhgRoxY/ZK9cutFIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744973903; c=relaxed/simple;
	bh=toYgE3lROpqJXLPmf6933GXvRdD70q5i/RVlmIrAo2Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qEotT+L6V4/cLkH0VS5LKyFc2KCCI2/3iR1F6SBY0ZPY+aNxqaUv2ExJrmYj0JuSd1lyf3+2BqOMDCoKIAeNOC2/YxQBxVEYnal0tNAszDW/dX61Ym8HD6X93gcN/iHZngyFIK/2DC2S9NH/3hteYioacLh5ojmHc8cqRJpV/WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U2fha0iH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U2fha0iH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744973900;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=u0MV4YptBECn0AEWRqEAwwCIqsmfcfaJ0sFseRPrKu4=;
	b=U2fha0iHneKhKLtRIaxXd35ek5CPVTkHDe9tPAbiSfGTaiVjE6GW2Vmy4jsOYD0CoRUPzv
	NyM7iwEGfYnMEzejKnBpwjh+0p/nsoFWqsh5rRa4aV3GVWAeigxIGo5rxgtBwpgx1CL3QT
	SsEp8OzUBeIuq/KDmAjZ3M2iHId8dec=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-5-qxWa4tyLMgiX-KHg0J1cNQ-1; Fri, 18 Apr 2025 06:58:18 -0400
X-MC-Unique: qxWa4tyLMgiX-KHg0J1cNQ-1
X-Mimecast-MFC-AGG-ID: qxWa4tyLMgiX-KHg0J1cNQ_1744973898
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43d5ca7c86aso9262705e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 03:58:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744973897; x=1745578697;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=u0MV4YptBECn0AEWRqEAwwCIqsmfcfaJ0sFseRPrKu4=;
        b=OJks+KPzjQsI2sQBp33QZxF1BUUQ6D2HcPwk+doJAftxHQdoTB0DnFS1OBt6zAfRUe
         gERQJhPP/3O2JdYe66G3F06iH3Bt36COHTPtnlf+aVI9nIHrK+gYpUrlzbBWxWmeUhTk
         RJFbcJLBrRUPkhDv75wtprWb5b5k8tvLXv/uOorc5QRwQ0wJomPf35lNvYw1h/HCY4zX
         522f6ItDhN2mzv8HO9pRgoU2PZmD5nJAn0bJ7Sro4ozu1aX7qGcOpCmN+CPTL1KYJWHR
         fVA6EVlHUkIE5YToGnh7R4lWmL+6vd6C4kyr1GK4ORU6ap1AHxhTis58wR3xGNeiRWGE
         kn2A==
X-Forwarded-Encrypted: i=1; AJvYcCVcSGKmc05AAf1udvHRXXQCVeCKbdaheekXRHIO4AkJxqTWRu0xVHOfTx1qz7PnssR2EdUqZ9EV2uXydls=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFkj11yeviM6e+ix8CpJPUoJgiuYxzyhCjt8RaI9DAFxcGW/WV
	+IgP+f6fM+evEmjf5HrO5Dv+1wEJNWFdgZ9cQZucdxETr4WPb4SblFH6JhwvyKfPFvePlvl1jRF
	qP+lMtODwzOReRJD/JDYRRrPke3rmf0iuLkXaAnaLxbh7FRT6MI7+hWYJPtRmXw==
X-Gm-Gg: ASbGncuBiDqL3W1yjEWOQq02gaFKA+jEaHNSPO/85ZRkOKXTgh49yYI/sSxQodzl6kF
	Og5RvI5M6Q+5V1dJuVZbQAKWVcknQTeCbWBcnPWb5xksKRRHoAEbvBvqKGXhhPIlLXV+GGtv0BD
	3fMo1vnEiNb7C6peaNs1O57jKPcoZtcdJQU5iB+lr3iXh/mMVkbGkT3IG5salZLHRqIO8/0Gcv+
	Ox/YRarChH95sUbPgp5p4NRyomqoAPcCDLpGHC1DehsPmA8ygo5o5JifD0v33eMVsUy5X/kSU2z
	o9UwMx0hj4Ft5XMG0+JQMzbKCOXbMP3AkKs8mW2mDP1el2uqv2oj3RZcX3K9RWoKQAa8+uT2QhX
	ZnRwfyFbgCHLzAhscssSzWugDULh7AkjCTR5ORYs=
X-Received: by 2002:a05:6000:1846:b0:39c:11c0:eb98 with SMTP id ffacd0b85a97d-39efbae03admr1796874f8f.39.1744973897621;
        Fri, 18 Apr 2025 03:58:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWVydDYkQahQCU3P6/5YeQqHOxwuV9tHBqkFWlpkBjSfFSUtaDqNUuaHg5loIpQnY5j20cMQ==
X-Received: by 2002:a05:6000:1846:b0:39c:11c0:eb98 with SMTP id ffacd0b85a97d-39efbae03admr1796858f8f.39.1744973897286;
        Fri, 18 Apr 2025 03:58:17 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70e:6700:cada:5396:a4f8:1434? (p200300cbc70e6700cada5396a4f81434.dip0.t-ipconnect.de. [2003:cb:c70e:6700:cada:5396:a4f8:1434])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa42082csm2417281f8f.3.2025.04.18.03.58.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Apr 2025 03:58:16 -0700 (PDT)
Message-ID: <fd5e2424-5084-4bde-bf97-767cdc3dda13@redhat.com>
Date: Fri, 18 Apr 2025 12:58:15 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] mm/rmap: rename page__anon_vma to page_anon_vma
 for consistency
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Ye Liu <ye.liu@linux.dev>, akpm@linux-foundation.org,
 nao.horiguchi@gmail.com, linmiaohe@huawei.com, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Liam.Howlett@oracle.com, harry.yoo@oracle.com,
 riel@surriel.com, vbabka@suse.cz, liuye@kylinos.cn
References: <20250418095600.721989-1-ye.liu@linux.dev>
 <20250418095600.721989-2-ye.liu@linux.dev>
 <9490ed5c-f6e0-40f3-839b-7b3a5decb5f4@redhat.com>
 <752651d1-7cca-45b8-b5ac-9c32ab97e9fd@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <752651d1-7cca-45b8-b5ac-9c32ab97e9fd@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18.04.25 12:50, Lorenzo Stoakes wrote:
> On Fri, Apr 18, 2025 at 12:40:10PM +0200, David Hildenbrand wrote:
>> On 18.04.25 11:55, Ye Liu wrote:
>>> From: Ye Liu <liuye@kylinos.cn>
>>>
>>> Renamed local variable page__anon_vma in page_address_in_vma() to
>>> page_anon_vma. The previous naming convention of using double underscores
>>> (__) is unnecessary and inconsistent with typical kernel style, which uses
>>> single underscores to denote local variables. Also updated comments to
>>> reflect the new variable name.
>>>
>>> Functionality unchanged.
>>>
>>> Signed-off-by: Ye Liu <liuye@kylinos.cn>
>>> ---
>>>    mm/rmap.c | 8 ++++----
>>>    1 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/mm/rmap.c b/mm/rmap.c
>>> index 67bb273dfb80..b509c226e50d 100644
>>> --- a/mm/rmap.c
>>> +++ b/mm/rmap.c
>>> @@ -789,13 +789,13 @@ unsigned long page_address_in_vma(const struct folio *folio,
>>>    		const struct page *page, const struct vm_area_struct *vma)
>>>    {
>>>    	if (folio_test_anon(folio)) {
>>> -		struct anon_vma *page__anon_vma = folio_anon_vma(folio);
>>> +		struct anon_vma *page_anon_vma = folio_anon_vma(folio);
>>
>> I'm extremely confused why this should not simply be called "anon_vma". Why
>> do we need the "page" in here *at all* ?
> 
> Presumably to differentiate from the VMA's anon_vma, but it seems redundant
> and silly to preface it as the page's (really, folio's) anon_vma.

Exactly, thus my confusion :)

> 
> The original patch is strictly an improvement so I'm fine with that, but we
> could also rename this to anon_vma to make the function a little simpler to
> read.
> 
> I guess the key bit where this becomes vaguely relevant is:
> 
> 		    vma->anon_vma->root != page_anon_vma->root
> 
> This whole thing seems to be to deal with races with unuse_vma() as per the
> comment.
> 
> Anyway, TL;DR: fine with that rename if we want it!

Okay, let's drop the "page_" part if possible.

-- 
Cheers,

David / dhildenb

