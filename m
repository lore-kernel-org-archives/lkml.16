Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7922B225A3C
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 13:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748610494; cv=none; b=d+DEJgOrLryIGeaboGXxXe4YWOvnZK44zvI+QtGnZQ7zfwNzpaG246oXTGDYSJYkQ4SuEt8NCADer1pmzcUqIN+a9tOyhIww78qEMz45uIQfv5nKhTe5kjbmDuPNYDGUrkI8L4LsUQP9pOJj18ut1qDbm0yHmb5Zjx+waoVxL/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748610494; c=relaxed/simple;
	bh=tdxLFOVFJO4PBYC9kI+wwoaPCQc8QV86/HOk1kV6Qe4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t8E9qRmosVYQnsLYFf1cKRHnnEgEeKrl+vuoGla1LVlxcf+Asuy6WUfN7cDooatFC3tkoA/WewjvR2zmLERfRK1J+hZPjKuzCwPPnbB5/4wwTC+adXdKNfhCX+0OjTjjFGeQ1lOpDo3I8u2l+ZlDKriOQsXVwvRHzF+TuVAkLAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MG6l3D10; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MG6l3D10"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748610491;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=5jfF9ono9G2mSAv9W1nWU8naZPviQnOurLCxmwQeGwk=;
	b=MG6l3D1022n/pegQ3CXpZ3zjdur/CqPSLJRyapnGdrmGN3ksPpMqJxfMa7qDHLzJ937nMU
	PCAU8na3OFx22CZZwOplyCXZkO7hzesRp7exURiUIL9vzYETZK4h+tFNxhuIryNpw3VFjK
	qqsuNIO7738CNEoIqWAkIwzWlSuuOSQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-sitmk8l3P4u_JGLELCmKQg-1; Fri, 30 May 2025 09:08:09 -0400
X-MC-Unique: sitmk8l3P4u_JGLELCmKQg-1
X-Mimecast-MFC-AGG-ID: sitmk8l3P4u_JGLELCmKQg_1748610489
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a4f65a705dso996573f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 06:08:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748610489; x=1749215289;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5jfF9ono9G2mSAv9W1nWU8naZPviQnOurLCxmwQeGwk=;
        b=HdIV0NnhVoUVm6HP5Dyjd62FRbw8eFaVC3nFUa6sGoVgtk415QOyIV0vy/SmNF2JAf
         gqZEpJAen22Pcn9PtiMMxsGPADDLqQIzTqfBYuzupGtc5vB0wsuxKqy7u+whA5MqZvO3
         c5g8orQno6dGk7UT97WCw5ZKNPqJb2pzDzxdNDE6+UAkOmoYIIA4FlQrKy3Ni3G7v8SW
         QnR0ViSQI00qrpEZXpq7u3S7nswfcfwaai3DQ9eW0PONSuXQAeZizMUcl9TZLJXAwj2q
         1t/JCt4ppLBIgxSEtYYrb46z9ammX29i73+RAPHXu3jpViGAcc8OaXzHRSH0R/uTnjaz
         9Eew==
X-Forwarded-Encrypted: i=1; AJvYcCUyBzV0wAefigR4yO7F1NV91F5LIc67cCtQpi20cxK3pRWXjKkDNT62HIRp4dakgammjDCl62XG8TFQ38A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtdVJt0lEm7MUT1Hwyq4bvl44f3AkcrqgP4fnStLs0Oa3YqqfO
	R+zeFQlaWgHygTTFBBjz8Rc1TgDKIIEHSwv397G7VQxtV4nldytREAL483m/NHNZEVI7/yhUhqH
	O40NlVK/gpPx8yQ0n2TymLNVwi+L/NP4SGI2H5Y+yunFluHkRncQObH9hu0xVgozlVQ==
X-Gm-Gg: ASbGncs23NeSvOTLyaHAf3YcDrJsGPOx9JgkRO7OJHTD6edQg6WhRSUC981rOT8YiFl
	/8CRmdI+OWyyoIrWiK6qQzULg/teDZSOQuxGBxZmn/6vf/G0O19GRWYXwSUsFnW65wseW9iqoiA
	4MwFYG4Br4gKdDQDwOMB+kxyVd5afBuM6rsem7wCb6IDsCJf9HE4XEMkDS4j+w4tWxTffB52Xny
	sktadrOnkN1dwq4OovNGZAVylHd7LzhBj7xOHiY0uC7sLc43xiFo12DW/rPrhvhJVduqq0eQShi
	qI4siygK1zDknt04vV7D0J8+vmpb7K6C61zrCuruKFkFjPR87eWFCZgeO3Hf9WDdexhq15FYBtC
	hV1MqUaCQhGVMRcrCN25dHvKHKhztly8pqqCFcsc=
X-Received: by 2002:a05:6000:4009:b0:3a4:dfa5:325e with SMTP id ffacd0b85a97d-3a4f7a438e5mr2790820f8f.10.1748610488677;
        Fri, 30 May 2025 06:08:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbviQCHa0UNiUhuilYuPoe2IGjSQgU5eYBMfG7pUzDgRk9JNWZvMBCEgKX8+hVlySgX1pw0Q==
X-Received: by 2002:a05:6000:4009:b0:3a4:dfa5:325e with SMTP id ffacd0b85a97d-3a4f7a438e5mr2790746f8f.10.1748610488076;
        Fri, 30 May 2025 06:08:08 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f03:5b00:f549:a879:b2d3:73ee? (p200300d82f035b00f549a879b2d373ee.dip0.t-ipconnect.de. [2003:d8:2f03:5b00:f549:a879:b2d3:73ee])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f009fd7csm4736738f8f.88.2025.05.30.06.08.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 06:08:07 -0700 (PDT)
Message-ID: <6f5e3238-9750-40db-8fe1-88d28655a988@redhat.com>
Date: Fri, 30 May 2025 15:08:06 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gup: optimize longterm pin_user_pages() for large folio
To: lizhe.67@bytedance.com
Cc: akpm@linux-foundation.org, jgg@ziepe.ca, jhubbard@nvidia.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, muchun.song@linux.dev,
 peterx@redhat.com
References: <a98bc945-0020-40ce-a650-47dcd0274001@redhat.com>
 <20250530122003.44555-1-lizhe.67@bytedance.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250530122003.44555-1-lizhe.67@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30.05.25 14:20, lizhe.67@bytedance.com wrote:
> On Fri, 30 May 2025 13:31:26 +0200, david@redhat.com wrote:
> 
>> On 30.05.25 11:23, lizhe.67@bytedance.com wrote:
>>> From: Li Zhe <lizhe.67@bytedance.com>
>>>
>>> In the current implementation of the longterm pin_user_pages() function,
>>> we invoke the collect_longterm_unpinnable_folios() function. This function
>>> iterates through the list to check whether each folio belongs to the
>>> "longterm_unpinnabled" category. The folios in this list essentially
>>> correspond to a contiguous region of user-space addresses, with each folio
>>> representing a physical address in increments of PAGESIZE. If this
>>> user-space address range is mapped with large folio, we can optimize the
>>> performance of function pin_user_pages() by reducing the number of if-else
>>> branches and the frequency of memory accesses using READ_ONCE. This patch
>>> leverages this approach to achieve performance improvements.
>>>
>>> The performance test results obtained through the gup_test tool from the
>>> kernel source tree are as follows. We achieve an improvement of over 75%
>>> for large folio with pagesize=2M. For normal page, we have only observed
>>> a very slight degradation in performance.
>>>
>>> Without this patch:
>>>
>>>       [root@localhost ~] ./gup_test -HL -m 8192 -n 512
>>>       TAP version 13
>>>       1..1
>>>       # PIN_LONGTERM_BENCHMARK: Time: get:13623 put:10799 us#
>>>       ok 1 ioctl status 0
>>>       # Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0
>>>       [root@localhost ~]# ./gup_test -LT -m 8192 -n 512
>>>       TAP version 13
>>>       1..1
>>>       # PIN_LONGTERM_BENCHMARK: Time: get:129733 put:31753 us#
>>>       ok 1 ioctl status 0
>>>       # Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0
>>>
>>> With this patch:
>>>
>>>       [root@localhost ~] ./gup_test -HL -m 8192 -n 512
>>>       TAP version 13
>>>       1..1
>>>       # PIN_LONGTERM_BENCHMARK: Time: get:3386 put:10844 us#
>>>       ok 1 ioctl status 0
>>>       # Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0
>>>       [root@localhost ~]# ./gup_test -LT -m 8192 -n 512
>>>       TAP version 13
>>>       1..1
>>>       # PIN_LONGTERM_BENCHMARK: Time: get:131652 put:31393 us#
>>>       ok 1 ioctl status 0
>>>       # Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0
>>>
>>> Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
>>> ---
>>>    mm/gup.c | 31 +++++++++++++++++++++++--------
>>>    1 file changed, 23 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/mm/gup.c b/mm/gup.c
>>> index 84461d384ae2..8c11418036e2 100644
>>> --- a/mm/gup.c
>>> +++ b/mm/gup.c
>>> @@ -2317,6 +2317,25 @@ static void pofs_unpin(struct pages_or_folios *pofs)
>>>    		unpin_user_pages(pofs->pages, pofs->nr_entries);
>>>    }
>>>    
>>> +static struct folio *pofs_next_folio(struct folio *folio,
>>> +				struct pages_or_folios *pofs, long *index_ptr)
>>> +{
>>> +	long i = *index_ptr + 1;
>>> +	unsigned long nr_pages = folio_nr_pages(folio);
>>> +
>>> +	if (!pofs->has_folios)
>>> +		while ((i < pofs->nr_entries) &&
>>> +			/* Is this page part of this folio? */
>>> +			(folio_page_idx(folio, pofs->pages[i]) < nr_pages))
>>
>> passing in a page that does not belong to the folio looks shaky and not
>> future proof.
>>
>> folio_page() == folio
>>
>> is cleaner
> 
> Yes, this approach is cleaner. However, when obtaining a folio
> corresponding to a page through the page_folio() interface,

Right, I meant page_folio().

> READ_ONCE() is used internally to read from memory, which results
> in the performance of pin_user_pages() being worse than before.

See contig_pages in [1] how it can be done using folio_page().


[1] 
https://lore.kernel.org/all/20250529064947.38433-1-lizhe.67@bytedance.com/T/#u

-- 
Cheers,

David / dhildenb

