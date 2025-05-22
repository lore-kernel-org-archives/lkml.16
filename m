Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC06EED8
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 16:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747930745; cv=none; b=QCxMscfzg9c7xxed0eruIk4dl9pn/2MT9mPrMHOL+qkwpvLoAN9z0MY23kY5tBjKgsB+RMHBVqnuH4JZ9TrwUFuaI8hbN9hsTw9P7n4+pUNofwjNx94dUBhvLjvILP6BjQjlcGu5eaTne3Hj6iGRdBYmNs+tiaFDOXeei+kjoVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747930745; c=relaxed/simple;
	bh=93Q8hW1QAMS40zO9P3Kcfo61nKPpM7kcSU8vVeO1500=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P2q20XpuVEDTBnk163p9eK4AmAmswy63XxmepwS8tgLLNGrDERsXOLYljyOU2ZX9M9SRJaN3BQTmrdpcDgpgmursoPYMp2zjiP0f1FP/hDO28yJfhmQDgbbfmYxWY51Z7v/MSHtb8B/QpeD69sKBa3E3CD2K6/l7QTzgQBT5LVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NfVoOfjP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NfVoOfjP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747930742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=iNEGGapq4Usbx8WprxYW79iwHG8/Ds16tbYqQx4rIVs=;
	b=NfVoOfjPa79TKkZcSoeoqhNHhVv9h+D6kW5nhKKpKoVi3b5E1Gsl9oojvpIp62FgNbrX1/
	rWnooruDzOEUW3yxSAGqAtJFtr7fZJZij4lrhJhscP/0hIwa1unxZHwFthgK3av6z/rB/k
	D59AN7YctiiDTt48YBYFj8Ifiuejyhc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-403-XhYYhwz7NOiqG3M2MZf9wg-1; Thu, 22 May 2025 12:19:00 -0400
X-MC-Unique: XhYYhwz7NOiqG3M2MZf9wg-1
X-Mimecast-MFC-AGG-ID: XhYYhwz7NOiqG3M2MZf9wg_1747930739
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43ceeaf1524so235335e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 09:19:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747930739; x=1748535539;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iNEGGapq4Usbx8WprxYW79iwHG8/Ds16tbYqQx4rIVs=;
        b=ZwEYG9nXY5VweWEv6LVEYQCghHMKhM4p8IXKmN1nQyB/ojMUvRBb4y5rnXLUyhP3ah
         rki/yN1fQJJJnaNfVgXDxsV0299Aqv+nWMbHTeKQtcq5Gk9oqU3whSmKUV6FIBj4ZSgP
         TxAN2f421gN6Ix0OhP9Gu3vpglARyKgeaIYoAmkCYae7xlEbCbSqbARm+E5qQJprglPY
         /4fbLpUp7DW95MYqp0m5s7iHAa/nqi9GZORjWIVkmqT+zaO/rAanuu9YiBPoUu7xHrdj
         swnBYSOE2sBhsPBmnxCt/r5Ws5Ns9daYlv9Zz62oMcAzmPutratz/O6yMdOz3mNqcELp
         UQ5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXfrHxXlDmAWKk+CRaXJVIz2jM5OhVSNMWxdnTPOtzO8HS+RmGa7FVWduK48wRB9VlAK42wfSoxe8qrPh4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvyoGN869I24PYIxTZl4F1I72rQRxGrPl4yv/UjwO41EYKqGdF
	aX5GO90iE8yM7cNmSiMrM4F36NfRDJ3t8b71msZL39PeaPkdvbosn6r746USKd0QJtva60lzAdP
	mBhHZuzG7TS/HrT6D+szRZmhf7epSpZ7IGos/iyRv1LWKW/pfgKcV0KRg7G5ML5vFYQ==
X-Gm-Gg: ASbGnctDNn5fQxBThxvu15S2jvoIcRxlDHoheMlmuIJw01ikdW63PS8lM8JuPzSMyip
	9GdX8z9QE7eeREP50lNgdjO2gabh+dyHuL96hyPYPDoR2AyuMHpZMfVsa8OmqXsXbWn7ugaSdCl
	JaFNSjmS/zNe0TOv+Ynh7NonZuDkwuyowzrObQ6sHlWDKYterq0Sp6Sz9O0ysoeXFzBfK/A8mmi
	8/ape9vmfdC5ft1MLRtGtTrOVHx7R2rwB3p7UYyNsLI7WdevdfZGtv2cDUWgBtTEihkp+oXnU3F
	aXX13V6eb/mydcw0IQNsGWC44brcZcVBtzyhvdLa+JDVJBulFuKG1unXWdP3k9lYIFLJgRVCHgm
	bW56d7oLdhJG02B1OsT3kQIZbn3zjpcmto8tMGys=
X-Received: by 2002:a05:600c:8505:b0:439:4b23:9e8e with SMTP id 5b1f17b1804b1-44b5197b602mr1116115e9.3.1747930739474;
        Thu, 22 May 2025 09:18:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAdJkrH1E+ND11IodoWra6JTZCBkY1BaS3Yl9rKZh5vHb9g64bdlnwe6dOgo9ICwicYpKgrA==
X-Received: by 2002:a05:600c:8505:b0:439:4b23:9e8e with SMTP id 5b1f17b1804b1-44b5197b602mr1115775e9.3.1747930739024;
        Thu, 22 May 2025 09:18:59 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f22:2e00:6e71:238a:de9f:e396? (p200300d82f222e006e71238ade9fe396.dip0.t-ipconnect.de. [2003:d8:2f22:2e00:6e71:238a:de9f:e396])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f3814262sm109958655e9.25.2025.05.22.09.18.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 09:18:57 -0700 (PDT)
Message-ID: <8c389ee5-f7a4-44f6-a0d6-cc01c3da4d91@redhat.com>
Date: Thu, 22 May 2025 18:18:56 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] mm: Optimize mprotect() by batch-skipping PTEs
To: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org
Cc: ryan.roberts@arm.com, willy@infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org,
 Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, vbabka@suse.cz,
 jannh@google.com, anshuman.khandual@arm.com, peterx@redhat.com,
 joey.gouly@arm.com, ioworker0@gmail.com, baohua@kernel.org,
 kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
 christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
 linux-arm-kernel@lists.infradead.org, hughd@google.com,
 yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250519074824.42909-1-dev.jain@arm.com>
 <20250519074824.42909-2-dev.jain@arm.com>
 <912757c0-8a75-4307-a0bd-8755f6135b5a@redhat.com>
 <76afb4f3-79b5-4126-b408-614bb6202526@arm.com>
 <25c0c700-656c-4a8a-8ef1-5093581cf25c@redhat.com>
 <4f97491c-b0dd-406a-9ddb-4f4424571704@arm.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <4f97491c-b0dd-406a-9ddb-4f4424571704@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 22.05.25 09:47, Dev Jain wrote:
> 
> On 22/05/25 12:43 pm, David Hildenbrand wrote:
>>
>>>> ... likely with a better function name,
>>>
>>>
>>> I want to be able to reuse the folio from vm_normal_folio(), and we also
>>> need
>>>
>>> nr_ptes to know how much to skip, so if there is no objection in passing
>>> int *nr_ptes,
>>>
>>> or struct folio **foliop to this new function, then I'll carry on with
>>> your suggestion :)
>>
>> Can you quickly prototype what you have in mind and paste it here?
>> Will make it easier :)
> 
> 
> if (prot_numa)
> 
>       func(vma, addr, oldpte, &nr);

I'd probably return "nr_ptes" and return the folio using a &folio instead.

That way, you can easily extend the function to return the folio in the 
patch where you really need it (not this patch IIUR :) )

-- 
Cheers,

David / dhildenb

