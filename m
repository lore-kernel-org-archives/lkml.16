Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6671A219ED
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 14:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747407304; cv=none; b=KsyEOVHOzDxBai2cVwEbXhiJCc8v5iZVWDIdDKk2kXJE5RlavuL/0b1T4CUtnOnuHGVG27IfHjh/LBd/8iSkgZhZUwXN9TjUDCfTI9qAqk7lF3KU3SZtHVThI0xF8mjfbkhbGieExTyagyTfvQ5yIngUK/RUG92OitlzuNsvVrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747407304; c=relaxed/simple;
	bh=UHaRZLFxOoiECXC/Zb+yha+9n150Lp7dBDDd1l29OLk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LUQSZJPGhBnLCvdlCpHdHmh768bzEkARqAKvx3Bvdu4zeoJHrq8m9Aa12I4Zopj5F7Yk6D4Iiebu4p9lQOYtF+TSN1o3jAR4XXAYzsY/DdGOqC4iSjaOeKpWPIkB+gcTdHzBP02apGL+IRtq6ZFRy+DDTEVcb0TF74QKVDL9KVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BVlRijdH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BVlRijdH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747407299;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=LD4o5M1xb49Wzg+l8iYWhHX8QQJZuE63lxcgIPd7AkI=;
	b=BVlRijdHmcO63ZcgcU2me2J8M9zmT+zt7WwwKWUhI8z0uFfSx0CJdHOyRXXiGQKZMJkeMe
	HQU3Zkz6m/Yhkr46an40SYgJzldg23RFMg1WTCvy7QKjrJz8BtRgHQz4lPEEHSx+aUD1nH
	Y4F0T0NID9kM8p8y6WqJtO484WfuWko=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-307-TxQgrl4bOaOzF47n_diLug-1; Fri, 16 May 2025 10:54:56 -0400
X-MC-Unique: TxQgrl4bOaOzF47n_diLug-1
X-Mimecast-MFC-AGG-ID: TxQgrl4bOaOzF47n_diLug_1747407293
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43ceeaf1524so12956705e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 07:54:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747407293; x=1748012093;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LD4o5M1xb49Wzg+l8iYWhHX8QQJZuE63lxcgIPd7AkI=;
        b=jEAwn+Ft/hJTVKWH1pSHGBv6yTOHbiEQBfyRcK40WflusofVwv25ZlPzwoFtbOZlWr
         HJgJrCj91wTEWHxU7g4fAyk9FqtVcE5VeXfT0PDKjYrxttM3EPDCUohgw1oTRLPEqlBz
         At452HnOX4dKioRNbF3AYpqHHaGUUX+xP/zyFX+X5AirFM1wDY4O9BzPFwGESjtkLCM+
         cPklc7UsAk44d5VL3TLfSl5UkK9ExXFdKXtN4rirrXcu5x7maKtb3J74/j+8u7HjEAaj
         k3R2tm+oQqIwYTf6fOJhR1kuTLbMHH6wN4IxwK2JPumNBeYmo0JMWXUY8C5O00cFUw/C
         2k4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVRkXmS3jYxctU8c+D7T0KuR6YgJVpQgxDHGMLZZaPbnC4jUHKtEP1l1CY9OJwmGnOrid2glcJiTxWQfo4=@vger.kernel.org
X-Gm-Message-State: AOJu0YztHtuJC9FGkwddSpTzTzm+EWPbWfwV8IAnPbgkksDw7FQKYBrk
	Mk9xDATr2k5kIizlScuvYv3gauAP7rWstJsshPfSAgrZRPQkUsrLRsjI1woU9ePd/ZV1cTz+Z7Z
	QArRLZKc0d0hAmShTdT23gxDnT7x6yJlCkyjsqJzBI9m8CYbmeKDrahlS4bP3saSqgUkNf9Il+I
	rK
X-Gm-Gg: ASbGnct93lcA1YCneSXxz1FeweDuFLCVYRzmXS1Ftlz28lKWPUS0xageHjFyLqg4xmr
	8pavZ5tRT0qVy3MB+lu/Wr5s0vPe5y2faVMZp8RoNbqdZ/gs6Bypu/YDDn8hcxdgxsI5u4R1igz
	zfprcpVlEudvV5ZV82yl9i/etRpRMbrPhZp40zYnRvDcdrVq2BsLSpKytAoFDOrnn1hEszWSmYo
	mGCmD2yThIZbHSmWPtv5U21BcXC4Ai/xDHELAp+icAhKID8itxG3Aap5HH2OyqSazfAbQczK/Cn
	YfB4kB13+4e8YsUwqxsWAzGNSevjtqun1um+AJpQHy8itZouGS0ZcHDPHwLq9X/xpezrdon5LIG
	YTtc4U5HBRp3+ABDDAUDtKT4/HvcneZyYZetVuck=
X-Received: by 2002:a05:600c:ccd:b0:43b:c7f0:6173 with SMTP id 5b1f17b1804b1-442fd93ce92mr37193235e9.4.1747407292674;
        Fri, 16 May 2025 07:54:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHq5Gdy3Qhjo8HXYvMMt4++cpmafTe237v1vk7ja2/lEEeZn4qAZfPbeL+gGW5mKrjS9TsanQ==
X-Received: by 2002:a05:600c:ccd:b0:43b:c7f0:6173 with SMTP id 5b1f17b1804b1-442fd93ce92mr37192955e9.4.1747407292284;
        Fri, 16 May 2025 07:54:52 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f47:4700:e6f9:f453:9ece:7602? (p200300d82f474700e6f9f4539ece7602.dip0.t-ipconnect.de. [2003:d8:2f47:4700:e6f9:f453:9ece:7602])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442fd50ee03sm36155655e9.14.2025.05.16.07.54.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 07:54:51 -0700 (PDT)
Message-ID: <1e571419-9709-4898-9349-3d2eef0f8709@redhat.com>
Date: Fri, 16 May 2025 16:54:50 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 1/3] mm: add large zero page for efficient zeroing of larger
 segments
To: "Pankaj Raghav (Samsung)" <kernel@pankajraghav.com>
Cc: Pankaj Raghav <p.raghav@samsung.com>, "Darrick J . Wong"
 <djwong@kernel.org>, hch@lst.de, willy@infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, mcgrof@kernel.org, gost.dev@samsung.com,
 Andrew Morton <akpm@linux-foundation.org>
References: <20250516101054.676046-1-p.raghav@samsung.com>
 <20250516101054.676046-2-p.raghav@samsung.com>
 <cb52312d-348b-49d5-b0d7-0613fb38a558@redhat.com>
 <d2gqsc55wnzckszesku3xsa33nseueul4vnwfpjcb37flm5su4@xx6nahf5h3vu>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <d2gqsc55wnzckszesku3xsa33nseueul4vnwfpjcb37flm5su4@xx6nahf5h3vu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16.05.25 15:03, Pankaj Raghav (Samsung) wrote:
> On Fri, May 16, 2025 at 02:21:04PM +0200, David Hildenbrand wrote:
>> On 16.05.25 12:10, Pankaj Raghav wrote:
>>> Introduce LARGE_ZERO_PAGE of size 2M as an alternative to ZERO_PAGE of
>>> size PAGE_SIZE.
>>>
>>> There are many places in the kernel where we need to zeroout larger
>>> chunks but the maximum segment we can zeroout at a time is limited by
>>> PAGE_SIZE.
>>>
>>> This is especially annoying in block devices and filesystems where we
>>> attach multiple ZERO_PAGEs to the bio in different bvecs. With multipage
>>> bvec support in block layer, it is much more efficient to send out
>>> larger zero pages as a part of single bvec.
>>>
>>> While there are other options such as huge_zero_page, they can fail
>>> based on the system memory pressure requiring a fallback to ZERO_PAGE[3].
>>
>> Instead of adding another one, why not have a config option that will always
>> allocate the huge zeropage, and never free it?
>>
>> I mean, the whole thing about dynamically allocating/freeing it was for
>> memory-constrained systems. For large systems, we just don't care.
> 
> That sounds like a good idea. I was just worried about wasting too much
> memory with a huge page in systems with 64k page size. But it can always be
> disabled by putting it behind a config.

Exactly. If the huge zero page is larger than 2M, we probably don't want 
it in any case.

On arm64k it could be 512 of MiBs. Full of zeroes.

I'm wondering why nobody ever complained about that before, and I don't 
see anything immediate that would disable the huge zero page in such 
environments. Well, we can just leave that as it is.

In any case, the idea would be to have a Kconfig where we statically 
allocate the huge zero page and disable all the refcounting / shrinking.

Then, we can make this Kconfig specific to sane environments (e.g., 4 
KiB page size).

 From other MM code, we can then simply reuse that single huge zero page.

> 
> Thanks, David. I will wait to see what others think but what you
> suggested sounds like a good idea on how to proceed.

In particular, it wouldn't be arch specific, and we wouldn't waste on 
x86 2x 2MB for storing zeroes ...

-- 
Cheers,

David / dhildenb

