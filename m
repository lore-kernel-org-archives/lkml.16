Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189122E173B
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 11:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751541296; cv=none; b=lFJL3N5E1xbE4nNn9nS5FCpKVHJZouweyECo9NgCARNfe2U78sVqKvhIemSLIiVrMauG0GfZqCwDNrGFCjVoYpp6cSkDbe0Hvo66ojSiXj558dodA+P6uGE3J66tuRFewaDbcTxK8FmoyymzO+AsYE1/AZiabZo/5LeeoQ4APPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751541296; c=relaxed/simple;
	bh=T9H6/EgXmp1TPHCPtFsDrg8kxX6dYronthonjorc7kk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=owYBNMvIzpcHldBfJkwJ/ctK1SgqFJp1mrmbte6HUrYFlaE2+Bk43vcqAQqUDuPrfaJCuOHIY4Xxg/AL1aEpCoHo8ApwNSGj9IYlH2Zsnt59ReDVXD2aCwO0TDcgZbUj4P4YI0t3XOBprYmdYplrcb1lUI044mliNvHi7iEANkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NXUUMy0c; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NXUUMy0c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751541294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=3Ul5jCDH+RN26P1OCNIEr6cA5KtO5L7bVOyzCfVabSo=;
	b=NXUUMy0cDlQ6xdwiBrtegCVQjHN7rLTIP9Xb6sA9K/WO3dN41TVarX17p1MRigh6omR5Uy
	KO4CVZjxktZ547uT4nB4xgMykXCmPwtgHrjlsn5HxYbsrJIjKzXoqdgsJSFo2RHGVP6D7D
	kCCaR0IBzyJzCXyQfwjhSUbV79zks7w=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-0XQC4WmgOFuLIQRb9BS44A-1; Thu, 03 Jul 2025 07:14:53 -0400
X-MC-Unique: 0XQC4WmgOFuLIQRb9BS44A-1
X-Mimecast-MFC-AGG-ID: 0XQC4WmgOFuLIQRb9BS44A_1751541292
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-ae066127959so815222566b.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 04:14:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751541292; x=1752146092;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3Ul5jCDH+RN26P1OCNIEr6cA5KtO5L7bVOyzCfVabSo=;
        b=FntBz9eweseW3m0Ba1h7aFrriYOY/OIq6S/HO/PB+m83Jkd65gt/J3W1o4pxNFw+vV
         wpaCXegIngoc++1DhyVsdTRpaY2Nmap1+5sacIFdp/il87NBJ8fVqOVnvaTzzkOjdCd2
         S3DBSwSDvAMH3QPQdGedNrydbtL4QLmXZc/gBPbYue5Zt4YSRLZREQZJCc4YEYFsuLos
         H05P3CMM/8m7nE8FAYj3SyfTnaQ5fYqHfjn+38IYetETafvyPjp0FYu7wvyYC+kSyoSO
         rz+ghnepxT9gX9JLtClEM3xGo6jFbsKImaVRHhPGrvePVtWUZ13PpWNVPrbxXsN4NVw5
         me6A==
X-Forwarded-Encrypted: i=1; AJvYcCVtL4YilG2ujY4Ku/W4sOSIEUGhHWWmQQI9lWP+mbRgslDVo4CrKZvXO/86j3+Y7B1UWlXFwdWN5V7yjSo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlKaBX0mrUiu4PHG6blrwcaXwDylehxtiI8dLDr7hCwaJcWhMl
	27oicaPVOMvsXOMYZpj4Fzvk39HjJcYM3Q5UIoMlPq1rfVwXGe+d6xdn8izNeqQ/6yMahnFfNVt
	V+4mWSYiAb7svZPJ04cl44aLaUYuSzjlOsxlMlaDDnK9AWItDotZKpkb+62rcMulBRA==
X-Gm-Gg: ASbGncuNpcmGpE0O/CBB3oexGtnRjcUq/F4VNbjF4pUV6arxWReZryMMSIs84ZNnFLU
	yIfRSspnLAYkl11K85VUtsahZ41Zi7u35M38dQdRDom4jDFrcw1Qrli01iwvFC2IB06IkMcodw4
	KtryBAreMcPwlhRWjaP7j43sPVPgTtUiuAxIssUztBLzqwBoWduOsYNWMpKK8sGQK/9FohSA95b
	vQrLb/nOcoerjLTf3gRoX6hfgeD5huVoeJEi8zI6nIsgXSlwKEKMNcDi2p+guf3/ZF8JnrGTpI9
	Q6lQakD/+Rmk8RS/EyPnqApBU7SDwa/GGJ3kGD776fzy
X-Received: by 2002:a17:907:869e:b0:ae0:a1c2:262e with SMTP id a640c23a62f3a-ae3c2c471d6mr597516966b.50.1751541291584;
        Thu, 03 Jul 2025 04:14:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyV4wjXgRemO++dzaPvRQ7dSE6mgI+83l+4tjUB5UiJ87N8iQXzocMH2cdeFrRDzZA/f/c2w==
X-Received: by 2002:a17:907:869e:b0:ae0:a1c2:262e with SMTP id a640c23a62f3a-ae3c2c471d6mr597513566b.50.1751541291131;
        Thu, 03 Jul 2025 04:14:51 -0700 (PDT)
Received: from [10.32.64.156] (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35365a016sm1253840166b.57.2025.07.03.04.14.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 04:14:50 -0700 (PDT)
Message-ID: <9b4e9e08-9849-4d55-a0b3-639439c35559@redhat.com>
Date: Thu, 3 Jul 2025 13:14:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] cma: move allocation from HIGHMEM to a helper
 function
To: Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Alexandre Ghiti <alexghiti@rivosinc.com>, Pratyush Yadav
 <ptyadav@amazon.de>, linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20250702173605.2198924-1-rppt@kernel.org>
 <20250702173605.2198924-4-rppt@kernel.org>
 <aGZTApK8WxFrTxI0@localhost.localdomain>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <aGZTApK8WxFrTxI0@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03.07.25 11:53, Oscar Salvador wrote:
> On Wed, Jul 02, 2025 at 08:36:05PM +0300, Mike Rapoport wrote:
>> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>>
>> When CONFIG_HIGMEM is enabled, __cma_declare_contiguous_nid() first
>> tries to allocate the area from HIGHMEM and if that fails it falls back
>> to allocation from low memory.
>>
>> Split allocation from HIGMEM into a helper function to further decouple
>> logic related to CONFIG_HIGHMEM.
>>
>> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
>> ---
>>   mm/cma.c | 52 +++++++++++++++++++++++++++++-----------------------
>>   1 file changed, 29 insertions(+), 23 deletions(-)
>>
>> diff --git a/mm/cma.c b/mm/cma.c
>> index 1df8ff312d99..0a24c46f3296 100644
>> --- a/mm/cma.c
>> +++ b/mm/cma.c
>> @@ -376,6 +376,30 @@ static int __init cma_fixed_reserve(phys_addr_t base, phys_addr_t size)
>>   	return 0;
>>   }
>>   
>> +static phys_addr_t __init cma_alloc_highmem(phys_addr_t base, phys_addr_t size,
>> +			phys_addr_t align, phys_addr_t *limit, int nid)
>> +{
>> +	phys_addr_t addr = 0;
>> +
>> +	if (IS_ENABLED(CONFIG_HIGHMEM)) {
>> +		phys_addr_t highmem = __pa(high_memory - 1) + 1;
>> +
>> +		/*
>> +		 * All pages in the reserved area must come from the same zone.
>> +		 * If the requested region crosses the low/high memory boundary,
>> +		 * try allocating from high memory first and fall back to low
>> +		 * memory in case of failure.
>> +		 */
>> +		if (base < highmem && *limit > highmem) {
>> +			addr = memblock_alloc_range_nid(size, align, highmem,
>> +							*limit, nid, true);
>> +			*limit = highmem;
>> +		}
>> +	}
> 
> Not a big deal, but maybe better to do it in one function? 

Yes, same thought here.

-- 
Cheers,

David / dhildenb

