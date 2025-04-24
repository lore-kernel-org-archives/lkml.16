Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9886A14E2E2
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 21:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745529205; cv=none; b=ep7BwVCplsNxEXOE/lb6hy7z79fH8oFOpBVf+udLZoXzaVJS69yk9d14WlYBkWw8EoEaaGuNxXTFT1jdIO2aqgNR6PfKDGK3Oge4LKHDY6FAgzoh+sg2KQEbRkjuoRDqjKMaSrzqtkLvkEIkHp/NrMquFfb1Fx06VRa+85Kcz20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745529205; c=relaxed/simple;
	bh=rNkS7M4cu/FvczZ3XpjBuce/tBiY87IwonEo2s6h3hk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kjHmjoHtCZTKjsBN0gigTAY91fSSKOos05FyU/ah2sCPYe6IQq0rBdnGOcLkagYeDS4MM58u5nXF7kZunZtmkVvp5FO2n+WSBf0IXypaVlHUnOrPLQ6bm4Vr+JrijeLDiTgSxQuqJK34U6+gHdEyzSfF0m0UERcGwO/pTs0ABKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dwGBnVQW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dwGBnVQW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745529202;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=TOXhqaJnJp2+DQnqUGdABkzPsXEKdnuTwS+DW6VMcYU=;
	b=dwGBnVQWsD8hza+FzCA18t+ZEyFZsbdkKr2E9oOXVqxepMBJjW1fDU7cbrb5JA8SD9BHXN
	JOL2CtcvgKGUpPffuvJlfrTnPbnMmjau/ILK7UIpZRXSt6hYohV3qF1/7RmhyE9hhZE/OQ
	Y8w2IADU3coCYD/We/OXp265v7Bq5sw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-49-ei8urkV8PvKXyRVcTf5NEg-1; Thu, 24 Apr 2025 17:13:21 -0400
X-MC-Unique: ei8urkV8PvKXyRVcTf5NEg-1
X-Mimecast-MFC-AGG-ID: ei8urkV8PvKXyRVcTf5NEg_1745529200
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43ea256f039so11024085e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 14:13:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745529200; x=1746134000;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TOXhqaJnJp2+DQnqUGdABkzPsXEKdnuTwS+DW6VMcYU=;
        b=ZHy45m57YcpNHPFesi8NwHgITB9FNNY0lZlb2HqRea/5S9TyqaGbZE3IoJIo+sCfNt
         nZboLEnE8t+/sdA8mr1gUZpx5Kjh9n6xKXrJuIr/uql+qgOy9kbNhwj2GCyNgPImruIp
         qpusu4cWCBwWTZSB4o/fgkq2d75tHRNjL2qrWnMzIXQiFZUeew2hjHRuIrOqIt7bWAO5
         cjCfjqJtFWHvzI9fKAj7NWdrH4mfegVDycrmpD9wfNAhHiqHg3cFNGIuv4+0jSUfLfk0
         WRg8RCZdCJc2FkoZzopYncSqELgngt/vIeaNqIf0JVyHUiIEECLy5hQI9xoIrZPq7iIL
         Jm+A==
X-Forwarded-Encrypted: i=1; AJvYcCVyoz6VO+5+kcO5/NAGB3RGLKXrAUqqNt+pYT+JQAbjewOP4HMPAMYLM869XqYYJitx/MLNwTim1rrA7aM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzG/uhsaNcOFM1UARzi4HcerpzmPGC9Il5BV/W2JUzhaH1BbPdP
	zR7KbXFm+aEQUj8WUXYLALTnh1vsKcBVY4tLTvFW30uPcrMwKZyWaWy9iiw9VBeiw1mwzpaU4AK
	jmDH4Gwq6poxbIOrPpQp7LUY38c5ezcwFReBd/D8lNoxBIjvYs/sJ86vX+2lnPg==
X-Gm-Gg: ASbGncuj8L1j5VhOmHTYZrk/iaSPpToVlXZfINnLspKpzQQmSqwWF6Ruyn/Rc5X2cNI
	aHmUWqSQZc+Z9R7e8UYq7Wp6k5Z7V1rIOEFgaB5zB2ky4DlJF7vnXp/U4rmOdzfrhBn/Kr+KTJY
	w9Ez/EO6/cMnUZigoY1aMxf8GAFxJxSb1ii96oleY6K3CwYZrOO4X8Yru7yB2myznKtct5lC72G
	L3NT2YvTkdSzN1YuPZ1rqIpXviHBJIcBVpv0j9zYrRDQiSn9mNh97tV0dWIOEmvCA4P1IIOXH74
	gFTn0MR3TEWpTmM+BpUTmAAS0El9GhTG55tZovZ6hI10pysTolO/E825VhyZu8SPoq1/ED7sWV9
	FTbMp8EqMYM7XwvlkO5j2sH4fRQN6TnFdgAg7
X-Received: by 2002:a05:600c:524c:b0:43c:fe15:41c9 with SMTP id 5b1f17b1804b1-440a310818dmr7773185e9.9.1745529199950;
        Thu, 24 Apr 2025 14:13:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXu7rx60czPGcmWU0+8461KGJT0DcvIUYSs2uaUCrKVXSoMHpwGwItsZlEECqxxyTiY6BuTg==
X-Received: by 2002:a05:600c:524c:b0:43c:fe15:41c9 with SMTP id 5b1f17b1804b1-440a310818dmr7773115e9.9.1745529199621;
        Thu, 24 Apr 2025 14:13:19 -0700 (PDT)
Received: from ?IPV6:2003:cb:c74e:ff00:f734:227:6936:cdab? (p200300cbc74eff00f73402276936cdab.dip0.t-ipconnect.de. [2003:cb:c74e:ff00:f734:227:6936:cdab])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a530f6e6sm1830695e9.17.2025.04.24.14.13.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 14:13:19 -0700 (PDT)
Message-ID: <5569da56-4bd7-4ebf-88bf-a9edf7310f51@redhat.com>
Date: Thu, 24 Apr 2025 23:13:17 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/7] mm: Implement for_each_valid_pfn() for
 CONFIG_FLATMEM
To: David Woodhouse <dwmw2@infradead.org>, Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 "Sauerwein, David" <dssauerw@amazon.de>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Ard Biesheuvel <ardb@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Ruihan Li <lrh2000@pku.edu.cn>
References: <20250423133821.789413-1-dwmw2@infradead.org>
 <20250423133821.789413-3-dwmw2@infradead.org>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250423133821.789413-3-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23.04.25 15:33, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> In the FLATMEM case, the default pfn_valid() just checks that the PFN is
> within the range [ ARCH_PFN_OFFSET .. ARCH_PFN_OFFSET + max_mapnr ).
> 
> The for_each_valid_pfn() function can therefore be a simple for() loop
> using those as min/max respectively.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>   include/asm-generic/memory_model.h | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/include/asm-generic/memory_model.h b/include/asm-generic/memory_model.h
> index a3b5029aebbd..74d0077cc5fa 100644
> --- a/include/asm-generic/memory_model.h
> +++ b/include/asm-generic/memory_model.h
> @@ -30,7 +30,15 @@ static inline int pfn_valid(unsigned long pfn)
>   	return pfn >= pfn_offset && (pfn - pfn_offset) < max_mapnr;
>   }
>   #define pfn_valid pfn_valid
> -#endif
> +
> +#ifndef for_each_valid_pfn
> +#define for_each_valid_pfn(pfn, start_pfn, end_pfn)			 \
> +	for ((pfn) = max_t(unsigned long, (start_pfn), ARCH_PFN_OFFSET); \
> +	     (pfn) < min_t(unsigned long, (end_pfn),			 \
> +			   ARCH_PFN_OFFSET + max_mapnr);		 \
> +	     (pfn)++)
> +#endif /* for_each_valid_pfn */
> +#endif /* valid_pfn */

"pfn_valid"

>   
>   #elif defined(CONFIG_SPARSEMEM_VMEMMAP)
>   

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

