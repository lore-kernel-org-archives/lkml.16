Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B85293C72
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 09:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750152413; cv=none; b=aDsSsf+vVY4GNAqPH08EOgKyDnzVgQ2oN/ri8wR1kQrh54Duf9jWH44UQRA3EcelnacIc0xZUBgq0BSFdAFH11x9Fz7Ceuh5dm6eNuGW0XHhJbPqoGwDcaBVPxw/+yFXhkgGE4clZ4UZNNLxAhBVb5WKNxLuF74/d+3puXx3Gns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750152413; c=relaxed/simple;
	bh=SzDlGdH1NOp3o1EOiGv6zf2Vqwj0h3EkU+zvzfAp3SQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vr/ZGHHeiI98294ryoRyU1qxtfsq8zYMevj5nGKqi/jqr5W3KAGz17Hh7AkVr3byvQuuHDSi9Wu+epXjL6uX7q8vgAa7/rixdu29uJkhEJcHbF+k0q9Ut0THQVEI9xYXaGlwc8iBlq1jeGrVkXeIFaHRwZ5hjlj+TzTBgcG/TSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LCpjHcHN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LCpjHcHN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750152410;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Hk/BPIhsLuiwabR6FYxikcyLQpMTxlPRv796ypZ5BV4=;
	b=LCpjHcHN/LvWDb6PFOEPFv4DEOY9VpopltfhQYnTv1TmShFLIzUP+w7n4mVgIsymP0n+rr
	l4Y6KztLlQXKqvGCrmrLRezR+9uduHcHPCQV+9E7dX3jNcjDtfvUoGHLgZDvKMXN3wP0Ce
	LyIhxAzX+9gyXl6msxBwsFbEVyaXxcw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-574-HGDklYDRO0y11PJHasrpQA-1; Tue, 17 Jun 2025 05:26:49 -0400
X-MC-Unique: HGDklYDRO0y11PJHasrpQA-1
X-Mimecast-MFC-AGG-ID: HGDklYDRO0y11PJHasrpQA_1750152408
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a54a8a0122so2233949f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 02:26:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750152408; x=1750757208;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Hk/BPIhsLuiwabR6FYxikcyLQpMTxlPRv796ypZ5BV4=;
        b=qIbvq2mJwaI0DK9iSKXO2007VjwX+hAeqXKJ2qUXt8RfMf5GEA6cMh8uyLms4c+FCX
         lGt3eDhVPaFSvqUkHYLuMDdJWF1kAtczxjm5zRuY5ZxstRSFw21fKk6nE2NPclSU2KLE
         25w2jLl1tLir2gE/t/vcccag/JC38lWdNX6QCiMdjnG29SDWETHyht15TdxXpToISR4L
         ukgATanq5d76a3MYWfEZk4mX/ToG1TR04SZWuRc4kcNiWSbNByCYqtxxn7Z3s+C1RG1c
         OsIU5VPvwy850aIvIH3bGxGf8cK0xbxFPJjaqt5OPahvd2pS50I52PUp1C/hJEy1QITq
         3baQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7IucoPpuYN16odkIWX8E/3aOdC94kGrj7h1JpEj5l9387Y+piS3heIszlG/an9oX005lC9Im7RMjIQVI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJxQ6b1bm6MShFU0ukwwOnwKX3zYn/PmdHpvY5j8cOCtFdR6Lg
	aAiz0hDMSInzdn8dq/8aI/pLzDpEcLxwZvomZLd6EmQXOjWAlQV3UzkCiHoWcY3pNoI4Ys3+d79
	OX20U+2UFm5lUROtK11Xy0U97TkRlMvzbGTWH5cD1oXdflUbYLg3AioAol9BErrF/4h2dF+OOyI
	97
X-Gm-Gg: ASbGnctIWCZMwOd5bllysF/BfWEVQIK4WK55Q+Ke0aoCRnvssFT2YHm8EJBi5Vi+tkZ
	id7O7GJrbZDP2DJNuSKkg+4aCT7vzkTzJ9PS9Ew5TbSnbL7VvN5F2Q2iuEZfKo2gW/zsQC0p8Vt
	NRdAEKI9MOQ0Fsb1RuhLs+Aajy50+aIXDmq/WhxfdapM/1VHO7LdkMlUgdXXuCp6jEsrEyacUpS
	tAPvNulN2uhClCdtcCY2Z+q7VraOJQofJ2nT1OLxbB/Wvz1cc9kV/8h/wIiuAvc7y/pNelRVnNN
	nZinXBctB/Ww1JPAYSA2p7nKDoQETmZGHE89VyZgvkBBfn0NIIRI/xvEGPNx7GiR5Fz8EUAJnFb
	2ikBozdVcdDRrDt6BBXRA3YhY3Z238wVgs5vViGL6Fx6QUMc=
X-Received: by 2002:a05:6000:2089:b0:3a4:f663:acb9 with SMTP id ffacd0b85a97d-3a572397762mr11631641f8f.9.1750152407850;
        Tue, 17 Jun 2025 02:26:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9GzR1TqRnCT0Ecax6PWVz9Y2kIUUwsOz9gbW3DR4Uq5mpu2c4hBo9aKPgY/qa/zS7oaUfjQ==
X-Received: by 2002:a05:6000:2089:b0:3a4:f663:acb9 with SMTP id ffacd0b85a97d-3a572397762mr11631622f8f.9.1750152407481;
        Tue, 17 Jun 2025 02:26:47 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f31:700:3851:c66a:b6b9:3490? (p200300d82f3107003851c66ab6b93490.dip0.t-ipconnect.de. [2003:d8:2f31:700:3851:c66a:b6b9:3490])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b7741bsm13584395f8f.98.2025.06.17.02.26.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 02:26:47 -0700 (PDT)
Message-ID: <b2a08c1f-190b-4e20-b8be-704d12b406c8@redhat.com>
Date: Tue, 17 Jun 2025 11:26:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [QUESTION] xas_reload() in iter_xarray_populate_pages()
To: Dev Jain <dev.jain@arm.com>, ziy@nvidia.com, willy@infradead.org,
 dhowells@redhat.com, hughd@google.com
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, ryan.roberts@arm.com,
 aneesh.kumar@kernel.org
References: <20250526063524.22597-1-dev.jain@arm.com>
 <918d552a-085a-4529-8f20-a060b1f0c9f1@arm.com>
 <5bbf39b9-ddfc-4d97-8f08-8bd43223982f@redhat.com>
 <8b8ce450-0300-4eed-a80f-2e8e18fb4e11@arm.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <8b8ce450-0300-4eed-a80f-2e8e18fb4e11@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 17.06.25 11:18, Dev Jain wrote:
> 
> On 17/06/25 1:17 pm, David Hildenbrand wrote:
>> On 17.06.25 07:10, Dev Jain wrote:
>>>
>>> On 26/05/25 12:05 pm, Dev Jain wrote:
>>>> Hello all,
>>>>
>>>> After doing an xas_load() and xas_retry(), we take neither a
>>>> reference nor a lock
>>>> on the folio, and we do an xas_reload(). Is this just to reduce the
>>>> time window
>>>> for a race?
>>>>
>>>> If the above is true, then, there is a negligible window between
>>>> xas_load() and
>>>> xas_reload(), because only xas_retry() exists between them, so why
>>>> to even reload()?
>>>>
>>>> Thanks,
>>>> Dev
>>>
>>> I do not completely remember our discussion in THP Cabal; I recall
>>> David Howells maybe
>>> saying that the folios are already locked, so it is safe to do
>>> xas_load and then do
>>> a folio_get()? Even if we remove the redundant xas_reload(), I still
>>> don't understand
>>> why we won't need xas_reload() at least after folio_get()?
>>
>> I think the points where
>>
>> (a) this should go all away soon
>>
>> (b) there is the expectation that the folios cannot get truncated
>>      concurrently. So we can do an unconditional folio_get(), don't have
>>      to check folio->mapping etc.
> 
> Well...pretty sure the file read path is taking the inode->i_rwsem or
> i_lock somewhere,
> 
> to synchronize with truncation/reclaim, can't figure out where. Reclaim
> takes the i_lock in __remove_mapping and
> 
> then freezes the folio reference, so the read path must lock i_lock
> somewhere.

I mean, if concurrent freeing of a folio would be possible, the function 
would be horribly broken :)

-- 
Cheers,

David / dhildenb

