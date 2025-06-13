Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC4B1A254C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 13:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749822498; cv=none; b=jF/SHvEjc5qWo26CuDyhgbKwcrdytH/ySwixLN8v+DT9fw+Yu1g9m11ievF/GxIjX/qdzG1ururTVZKsBAlPOvj9Val4Z3QXPje50mwz+S0Dibd7sRpqbVBBX6UwFL5DjxbG6hO6Z0ctmhCDCBfWuET4Ypc8Sosj9hgzbvd6bvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749822498; c=relaxed/simple;
	bh=2+HXMAtNoniwKRyhPkeThvDJkrXZTDTRzz39iAcdrhY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=stG25pcym80cord6GYKOdSs71r9bndCwAg7tTgIkAnWuLdSEN1BD50xWHQGGv9rEr2vx5/Y9kOLbgTS9c5Q7XYg10SS6yyrujZr8JS/PEMcS5/khKIWpVI5zvGGGqdcxOlSoRu2lSbCojE286ZXeEFrAQ6W2aT1MncD9EUYVlSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IKg46gTY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IKg46gTY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749822495;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=FlpStz9Nu7mGd6bh3NaiGT/FtozOWPpuATqW9fvPa2E=;
	b=IKg46gTYvRX4fpkhF6A9eGicnbn1y+qUpY3phCgjX5s1sS726ITgT/7RS87drjlRsv36Gd
	1w8DHSQcXpN8kq36cWqRl9C+9zmFgyldw/d+pvSlKV/F6oFWokX8qfa8yKRoR1meuYv1CM
	RRvyqoB6My6mDJLHFDemWuEN2cTz37s=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-486-C6Ez_dPtPB-9rzR_tJvr1Q-1; Fri, 13 Jun 2025 09:48:13 -0400
X-MC-Unique: C6Ez_dPtPB-9rzR_tJvr1Q-1
X-Mimecast-MFC-AGG-ID: C6Ez_dPtPB-9rzR_tJvr1Q_1749822492
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a5232c6ae8so999331f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 06:48:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749822492; x=1750427292;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FlpStz9Nu7mGd6bh3NaiGT/FtozOWPpuATqW9fvPa2E=;
        b=aVCwgSqDg4L6wkNlmU8vtGBHLuVWHW0gPra6COV4aVi1RR8W8JMsfh7seoAuXDiEEs
         RljqJNkp8LG9pZC5wh24XKM2BCTmSCLullkjE6Jxo2nklNHCVcPrMYrlbS7DkSVEWoYe
         faJC8DF1b+Y7AyOVAwospbTHqHLqLqQ0s+I2PuCBYRsgPQrv5XLVNwljB8kWTpoiiNts
         SYmtQd1buS4tOwDhV2V0zldVz0wu4rSDWEhfFlmWiBjuYODnExanhIqKnwK8/0nrOB6z
         oFNP/e3rEuBXSWy/vJ49T72mHGPz6NQZzQx2sY2hWg1Rf5/8r1kViD6aiP/hneFqFwrb
         bnNg==
X-Forwarded-Encrypted: i=1; AJvYcCWQKnBMR+/Zzn4Y9u/JuVkVKJPd7dB2Ww7ZYiSsFqms60xeos1FkYnWMxlcEg38KlIT1tN3HziOTYvoeus=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPQCmlQDnZAtwvFDlkmdkxjh3GY6LRi9mhuksRtl1h3jHNJxIw
	eYjYSSTe5onhoURK9nasU3UAOht3SV6v2oLvKuscOy8asVnkZSzWBa7h5HOazS/G12R+9XElA9k
	G+yjYIJwoaxZEXPaYsoeIxbDKhnUvTQNl5gj+YYERGp5ccAI+qHOKAYdGfI2r0dEbuw==
X-Gm-Gg: ASbGnctbpvWbSOayTBRpypD5x905pnTjP6MT684p9Ih/t5vXUL8mW2XajnQYf2blnP9
	CYbcquiZEzzusjMVT4oNM0ebgz4tcBV7QInchMGoPYicBww+8Fhdqcbr1tte6GHxM1NGwmHrrE+
	4f0ECfDwzZul6dokUtDebywpg0KPDL89om8B08fbHlnpMigwAIj4Bck7m6DbetatJo+vmuZo2dp
	AKyxHKV29+kKWXwCgQEbsqPkHtKiNEsAys+tUEFRW/onlJxev96gRi+HnAvar/+BFvBN2JDmOYP
	5RcVUgXW82oQHOndEY4I9XeGr6cOh/5aadgJiLCSoZvndQn+kQ0j78ZVyQvV1WQdoaP8Yh+IcUq
	Nx514UHwH38b8iUzZ5bbDEuLSyLDBHDFdApiV4yMb8citeQOeww==
X-Received: by 2002:a5d:5850:0:b0:3a4:f902:3872 with SMTP id ffacd0b85a97d-3a568670cdfmr2821174f8f.19.1749822492520;
        Fri, 13 Jun 2025 06:48:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFTnixNMJ19dkd58TRRn/1gXW0L9xoxbp5v9Jh6vXM5f9pE1YKSwySO7tZwzmqh4vxHpG8xQ==
X-Received: by 2002:a5d:5850:0:b0:3a4:f902:3872 with SMTP id ffacd0b85a97d-3a568670cdfmr2821144f8f.19.1749822492155;
        Fri, 13 Jun 2025 06:48:12 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f1a:3700:2982:b5f7:a04e:4cb4? (p200300d82f1a37002982b5f7a04e4cb4.dip0.t-ipconnect.de. [2003:d8:2f1a:3700:2982:b5f7:a04e:4cb4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b087a9sm2465743f8f.55.2025.06.13.06.48.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 06:48:11 -0700 (PDT)
Message-ID: <01f0f47e-1992-4991-b11d-c3d51b470da0@redhat.com>
Date: Fri, 13 Jun 2025 15:48:10 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] mm,hugetlb: Conver anon_rmap into boolean
To: Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Muchun Song <muchun.song@linux.dev>,
 James Houghton <jthoughton@google.com>, Peter Xu <peterx@redhat.com>,
 Gavin Guo <gavinguo@igalia.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250612134701.377855-1-osalvador@suse.de>
 <20250612134701.377855-4-osalvador@suse.de>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250612134701.377855-4-osalvador@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12.06.25 15:46, Oscar Salvador wrote:
> We use anon_rmap as a boolean, so declare it as that.
> 
> Signed-off-by: Oscar Salvador <osalvador@suse.de>
> ---
>   mm/hugetlb.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index dfa09fc3b2c6..62bc3808f99e 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -6431,7 +6431,7 @@ static vm_fault_t hugetlb_no_page(struct address_space *mapping,
>   	struct mm_struct *mm = vma->vm_mm;
>   	struct hstate *h = hstate_vma(vma);
>   	vm_fault_t ret = VM_FAULT_SIGBUS;
> -	int anon_rmap = 0;
> +	bool anon_rmap = false;
>   	unsigned long size;
>   	struct folio *folio;
>   	pte_t new_pte;
> @@ -6542,7 +6542,7 @@ static vm_fault_t hugetlb_no_page(struct address_space *mapping,
>   			 * check whether we can re-use this page exclusively for us.
>   			 */
>   			folio_lock(folio);
> -			anon_rmap = 1;
> +			anon_rmap = true;
>   		}
>   	} else {
>   		/*

While at it, I would rename that to "new_anon_folio" or sth like that.

It's used to distinguish whether we create an anon or a file folio.

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

