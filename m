Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D89E28E594
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 11:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749037465; cv=none; b=HzFgy4bd9yxvypQgVV99unpIdY7D/CCcyJNMrP7HBRVmwuGfvtfQFVk88x+dTm424lMR/LhGujdyyV9feP0oPRf+KpCB1yCPdBMo9jjYLKlykuafjToJLv9yb89oSa2SeoqMsjlkiuhePY/71Tdz83QHC58RNu+SjyzYWOYsNx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749037465; c=relaxed/simple;
	bh=KuOgRbBgfLn4JiytyJCJWxPgQxC7L3xGE0gJqeHLfzU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LAoCc12LsLHAQn5V7bug3CfzRlINnYd6iOjn4R5zhumK6IiJ0q714Y7APQ08Hg7vbuaO+b3Y9NmIUCdPKGEwgqQsU4gTFD+d+tTL042GTixXAFK6UJzPXhmk2CRxZPP5acIAQ2BkxYPcZVlwkwwrwuXEvQzcjXYFTgcVgfjQyXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UONAhmd/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UONAhmd/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749037462;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=lAZ6PoM2yHxT2XxiC3h9Ua+Sq3PY55BOVc0a18RVQnA=;
	b=UONAhmd/W0N8wviiARmn4O3zJAeu35bBSbdzpxuiglhQfSHpFZXARrC8BKX/7265A3H76B
	oM7ReL+wa40wd8DquxALT+0nyEiJ9sVQYeGXO/ZJ5H2JbPZcpqKczoTJReJz3H3nR9p+G4
	za9lbMQfLOlXe99pGT8TGYo1CNo3VYs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-kEvfvVC8PJiW9YLsg1R50A-1; Wed, 04 Jun 2025 07:44:21 -0400
X-MC-Unique: kEvfvVC8PJiW9YLsg1R50A-1
X-Mimecast-MFC-AGG-ID: kEvfvVC8PJiW9YLsg1R50A_1749037460
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4eeed54c2so4270146f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 04:44:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749037460; x=1749642260;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lAZ6PoM2yHxT2XxiC3h9Ua+Sq3PY55BOVc0a18RVQnA=;
        b=qM6xS2YgBvTJLvzh1ynaJbWgq0M94+tvhZ2SLVF8o9zbvZI1XJnk6t+GXdpTUtWZ8x
         YJ69LcJV6Jn+8YWMex4gUZ/H2i2126MZr8i8M+5nhTeQn+TmFKDO1bG4+xNSuDCzQ2Ll
         mtr+6cptdrKyi+hQSmIMx9CSkXMShazSRXkPAoaw8OsSnvzDjw4s38RIxRVvDTUXu3hI
         X72REEBFbuXEIZww2FNxBU91wzDqkmIr7hEwQeNn+GyWKBw3pNaMGNrNYfwKFawL+1Ct
         eKup1pJ4QiCbzgRKpopB/ejCzsAh5ZCM3a40P/8nVtIGM4y89ZRn/j1/qn5y4YU7uGoj
         IZcQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0RQ/wJIUBQtPUiO8rZYbXT5Jrn4VJr3R8//2e7TYAR5mpC4NLO+p2LyT2gpXoBGQB01cKg9LTr+QjKdE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzF8WFgEZ4oJYKlILw37NutKeIC9YS9bUgzoTnjSglaq2Mqz2Ty
	WN39y9LRQJ+zpo2gDYSfnwl9q4qq3Jg+bkUbi27f2ZV6FLO9eERfpRRmTGo15RRFobPz00cq6gt
	PyvTUDWbpgipL2z/TVZlNBzKTI7zt9G7KN7hEXUDixLqkpBAhw2DqioiS/EiLVZI9Sw==
X-Gm-Gg: ASbGncvh0RgQD0e3/tsOlA3Z3BNUUg4+7gBwi3ITTZpqeM0NQ7R0WIx5qi5aSEze0AS
	G3JPwvZQ/TCEL7LJiMRx582EMQWnNYPci8n5qToUDKtwhuDgSgHpRiEW+0FIaUu8UybFA9ygkiZ
	x00xMKlRanlUTNGkzLakSmcw4KSfGzkqG1W8k9NnDx93BTJonuOvLv9r71yEoAclSuyJEMjj3Sm
	6lMM8s7Z/t0zRt3krrBq3sQn2AkfW30ZcLdxXvsgL0pUd57ftsavyhJRN/y8WwoORxlBW4PynyV
	f536l0K/nbicz0wls8vcKuSl8dNludFM/WjTxGuiACTJ4bGaVVQ4oBjHZyFDt/yx6l7Yr50OL7Q
	Kv6DzEsWfz4nVMfSV4yEilQLwvD/8AKWxxKYCZd6Or80iWSEdsA==
X-Received: by 2002:a5d:5f95:0:b0:3a4:ed62:c7e1 with SMTP id ffacd0b85a97d-3a51d8f59cfmr1948577f8f.12.1749037460531;
        Wed, 04 Jun 2025 04:44:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTk+ZZ/txMdPYiZPbWtN+UTbUQiFhEQ2KYLiZED5o28ZN+uPzMH8V5s47pXStLZWFaTG3UiA==
X-Received: by 2002:a5d:5f95:0:b0:3a4:ed62:c7e1 with SMTP id ffacd0b85a97d-3a51d8f59cfmr1948538f8f.12.1749037460114;
        Wed, 04 Jun 2025 04:44:20 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f1b:b800:6fdb:1af2:4fbd:1fdf? (p200300d82f1bb8006fdb1af24fbd1fdf.dip0.t-ipconnect.de. [2003:d8:2f1b:b800:6fdb:1af2:4fbd:1fdf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-451e505c350sm51456695e9.0.2025.06.04.04.44.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 04:44:19 -0700 (PDT)
Message-ID: <d72c77b7-2f40-4236-8288-e811f82671c6@redhat.com>
Date: Wed, 4 Jun 2025 13:44:18 +0200
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
 <8c389ee5-f7a4-44f6-a0d6-cc01c3da4d91@redhat.com>
 <92cc1bfb-ab7a-4abc-afd0-49f8f2d12da0@arm.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <92cc1bfb-ab7a-4abc-afd0-49f8f2d12da0@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 04.06.25 12:38, Dev Jain wrote:
> 
> On 22/05/25 9:48 pm, David Hildenbrand wrote:
>> On 22.05.25 09:47, Dev Jain wrote:
>>>
>>> On 22/05/25 12:43 pm, David Hildenbrand wrote:
>>>>
>>>>>> ... likely with a better function name,
>>>>>
>>>>>
>>>>> I want to be able to reuse the folio from vm_normal_folio(), and we
>>>>> also
>>>>> need
>>>>>
>>>>> nr_ptes to know how much to skip, so if there is no objection in
>>>>> passing
>>>>> int *nr_ptes,
>>>>>
>>>>> or struct folio **foliop to this new function, then I'll carry on with
>>>>> your suggestion :)
>>>>
>>>> Can you quickly prototype what you have in mind and paste it here?
>>>> Will make it easier :)
>>>
>>>
>>> if (prot_numa)
>>>
>>>        func(vma, addr, oldpte, &nr);
>>
>> I'd probably return "nr_ptes" and return the folio using a &folio
>> instead.
>>
>> That way, you can easily extend the function to return the folio in
>> the patch where you really need it (not this patch IIUR :) )
> 
> Just confirming, you mean to return nr_ptes and get the folio by passing
> &folio, and the function parameter will be struct folio **foliop?

Yes.

-- 
Cheers,

David / dhildenb

