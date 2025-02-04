Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF7E20CCC7
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 11:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738669121; cv=none; b=p+vRD9d/n6QdVKH4sBiIXctpi2vl4ThrpysM8jmrB0A+AWK9JYwqRxwJdX0VAkhcAbE0HbjskZ8oUMaDDy72LcBdZuWrzjvYbxegCSLPBveY3mZshYRr3lq/+6i0pbI91/9aQNbPWP7bt6CBWDqCkUUBPZoqdZIKgZO8q3+csIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738669121; c=relaxed/simple;
	bh=12fJ64RlRnWkAke48caZ4LKgFI9WY9H2y6aR+62QTCQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YHEJBbEVeccJOyWFOOJsdXWWqbFI+Z065DVbD/vLO+a4gT3DIfdDPMQwSagN7suNcNaSTzY3/EdvF0JJCRsnHOG5pVo69VqobvbM1bxRbbSdM7odoX12Y8qppqQBJ6Tqqv3UEYLf2gKtY1Rv1/Nxz23AuKAXVP6BC85tQBHzvi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hNVcfQmU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hNVcfQmU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738669117;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=dAf6I6x8Ixyhwl4g5QnQwYXZIRw06z5WdjsdkIZQ9pE=;
	b=hNVcfQmUdmENqyPy4P3gFbBOdt/lgca6kTPlmhKvuEgfZm4KS6rDvcIeBAP696f8QWj28I
	W1/xXXFTsKTxCjH2zc96PVKMKbonFUuyen2dU6mO4XzyEn3BxnPkdUQ6J7pdS/pIHl3W0R
	dc5qH61ZvMZ1ng0NDhghLL88u6YClZs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-wZ2N_1PhPLWfDT3C-gkJng-1; Tue, 04 Feb 2025 06:38:36 -0500
X-MC-Unique: wZ2N_1PhPLWfDT3C-gkJng-1
X-Mimecast-MFC-AGG-ID: wZ2N_1PhPLWfDT3C-gkJng
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4361ac8b25fso1439865e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 03:38:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738669115; x=1739273915;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dAf6I6x8Ixyhwl4g5QnQwYXZIRw06z5WdjsdkIZQ9pE=;
        b=mh+GE9KwpQqW9zp/kc58DprhAfe/5bazoTqnLLHNYiD5GpcvOhrfC3LEgh8bM5mL02
         a/a7w7CtuGrQoc0iAJUHfL1gy3IzU9WQ7MZI7hmwC0YGg/6rKF7g+//J3584L0aMcKfl
         gsmRHkeFVuBKVp8ZaDmGSTqFD6csG3jX5P4ZOEsaswIY40RmjbrLb+AVpKhHkmNVj8J6
         IwT/SXafMQaisgFk/eOHoODCI52c+k+s0t9MXaGsyVJH8Qyztjy3liWpC/6IlUnGHdAG
         Hjf0JiPwQHwOKPmLVjr17JTFByCtTOM7VAfQFh/t5Q2LEgHE7V8XWSAJD+bKjHU3TS0d
         +cBA==
X-Forwarded-Encrypted: i=1; AJvYcCWt8/yxSd0s6GEED9BfrYbdFG450dZaL2C6LBLdHaePlHDkTt8vrWVg8SHf1wJ9ki/CvxWH6a9PInY5RKg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzO6yxGu5TNFRGui6WOLQN1/Ag1x63GUix9AZ8d/RXtTe6BWUau
	jwPOWXskJOSGT1IB71WX1prdZwfaR6SfAKelP6ZlKDCKcpTSTst1l4bHH6sAj/caevWspPuYNug
	qlq4gHNvdi/9z56GeDTba0xYaTf2JR+NgFNTUPZ839BQn0sHw9yGxZiCpTmIbqQ==
X-Gm-Gg: ASbGncvBSHFzMaEf5NPUIPukORHBGX9zsWa9UU1KussswdcLyj8KZRc04aAGYbxY3zi
	3pjfwOovmDThcVG9I3lmnutntrspGh7LeaM9infwST8xCRWi77g7t+CdrVHy2EZUmnNSPj6N1ai
	8BasI6VgrRCueY+2ABQ5cmHmoVdz3aifO59P5O0lSmSnGn5zjqPnZg+7Oh8kdUUW3LEsxy6Is5j
	xUQvsYdtEYP1PTSRa34zsLkP1IUUz2/M8qp/SRANx7Ws7yKkyTk+IMdiDOpBTWK61HWcY6kQ0yq
	E1wrtyBFELjja4dwiXty/al64JyTzn/ksHDJlTuf6M8jdskOXeIhXlSabJFdJqcovAIsPZe42KV
	1VcmBQcEns3gHIL7y/wC2/FGngpc=
X-Received: by 2002:a5d:64e6:0:b0:38d:ae2b:8374 with SMTP id ffacd0b85a97d-38dae2b8a1amr977181f8f.52.1738669115312;
        Tue, 04 Feb 2025 03:38:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHVHbCkqlzOrzhIL5tsJnUc5CY0X5I+EABZF7WUoOmHjZ083H4rwma8rlO41Xl3jBripWoeMA==
X-Received: by 2002:a5d:64e6:0:b0:38d:ae2b:8374 with SMTP id ffacd0b85a97d-38dae2b8a1amr977163f8f.52.1738669114978;
        Tue, 04 Feb 2025 03:38:34 -0800 (PST)
Received: from ?IPV6:2003:cb:c70a:300:3ae1:c3c0:cef:8413? (p200300cbc70a03003ae1c3c00cef8413.dip0.t-ipconnect.de. [2003:cb:c70a:300:3ae1:c3c0:cef:8413])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1cfa2fsm15861718f8f.91.2025.02.04.03.38.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 03:38:33 -0800 (PST)
Message-ID: <0785a15e-29fb-4801-9743-3d08e381d506@redhat.com>
Date: Tue, 4 Feb 2025 12:38:31 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] mm: Support batched unmap for lazyfree large
 folios during reclamation
To: Barry Song <21cnbao@gmail.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org
Cc: baolin.wang@linux.alibaba.com, chrisl@kernel.org, ioworker0@gmail.com,
 kasong@tencent.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, v-songbaohua@oppo.com,
 x86@kernel.org, ying.huang@intel.com, zhengtangquan@oppo.com
References: <20250115033808.40641-1-21cnbao@gmail.com>
 <20250115033808.40641-4-21cnbao@gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250115033808.40641-4-21cnbao@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

>   	unsigned long hsz = 0;
>   
> @@ -1780,6 +1800,16 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
>   				hugetlb_vma_unlock_write(vma);
>   			}
>   			pteval = huge_ptep_clear_flush(vma, address, pvmw.pte);
> +		} else if (folio_test_large(folio) && !(flags & TTU_HWPOISON) &&
> +				can_batch_unmap_folio_ptes(address, folio, pvmw.pte)) {
> +			nr_pages = folio_nr_pages(folio);
> +			flush_cache_range(vma, range.start, range.end);
> +			pteval = get_and_clear_full_ptes(mm, address, pvmw.pte, nr_pages, 0);
> +			if (should_defer_flush(mm, flags))
> +				set_tlb_ubc_flush_pending(mm, pteval, address,
> +					address + folio_size(folio));
> +			else
> +				flush_tlb_range(vma, range.start, range.end);
>   		} else {

I have some fixes [1] that will collide with this series. I'm currently 
preparing a v2, and am not 100% sure when the fixes will get queued+merged.

I'll base them against mm-stable for now, and send them out based on 
that, to avoid the conflicts here (should all be fairly easy to resolve 
from a quick glimpse).

So we might have to refresh this series here if the fixes go in first.

[1] https://lkml.kernel.org/r/20250129115411.2077152-1-david@redhat.com

-- 
Cheers,

David / dhildenb

