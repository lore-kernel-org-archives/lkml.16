Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F0A248864
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 08:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745311965; cv=none; b=lbID+La++OOX1CqDebc9MOCZv311HVygTRbZzhP8OzvmhQcBSLVFWNPSmxCWbyuFslj8jppoV6zI2LY3xZOiREJN2PsQ7Tq3+RYG6WLT1X0SaxxeomN2HZh/Da2CE1kWhxbzAymgfKbghy80ZvSV3F4rs4J3R4x8ePHibymiuzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745311965; c=relaxed/simple;
	bh=2+zROsJH65QbCmNMNJPngWFXlb09tnr6gxvd3DdsS7M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=npse8drUepn7DhMRkxhcLMP0pjnIJ/4N4x3HfXimfE8bJ5gcFaRiUKYPaXgvhnRELjMbAOCZJAbER8691eVS6Wyac7tjYQrhIUlFye3dAn9yWwAZy103jg2tYkyWZwf4tpmru5jE81+9mK6pEqH8mtBcPtpgQ225UfQf8b6dE38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A0GX1uah; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A0GX1uah"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745311962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=6D+NIEZj5Y7xPhCQODKU2HLjfcx1SC407jYITEkyw1E=;
	b=A0GX1uahE9PytZb818Z02yzw5msbSJEUn+WJt+Q//WQyWMq+5IUipXpwFDNUXpXKdMeb9k
	KLmk7jqFN2X9kUS3bmdYzC5gst6IyN9+deNndhGUnrBI6URhM2FSn66f3b0toWPe8BUAxe
	ACdd0+ko855Oh/hFTA1anAntMv5Nl8U=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-219-5DJlzCznM8-Lu3oIwN-kHA-1; Tue, 22 Apr 2025 04:52:39 -0400
X-MC-Unique: 5DJlzCznM8-Lu3oIwN-kHA-1
X-Mimecast-MFC-AGG-ID: 5DJlzCznM8-Lu3oIwN-kHA_1745311958
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43ceb011ea5so27196355e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 01:52:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745311958; x=1745916758;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6D+NIEZj5Y7xPhCQODKU2HLjfcx1SC407jYITEkyw1E=;
        b=tGPzFaPqG//OktD7Nj+aKxrhp/trlGai8JUWxWySR1YRe61MmM46wEPMi0OCsJI3cg
         r0P06l9EbaSJPs4xeTYHa8uVUx0GXPcvIQd0jVd3WhuA/HfX5u1p0tkRCjz2dpg0dd7l
         Wll0+suAdC7ceCOyRLmArlg5i4ewL0qVPvTEkU6lYg3B5YzMWkSiGh4cRChQ9qxVQOPN
         FDWCUAspjNCSuGglpUnDdFHcnrICgIe6kL4pJWtPCrABgvRpUyakLyUNalMdE0AjC/75
         pgK3o3PZHLWNvRDLICOI0QUBPamV6dHSzXJtOb2UCm5trDeBgGCBOpNeYpXjCqQ+CZR+
         +QGw==
X-Forwarded-Encrypted: i=1; AJvYcCUG6MGsEUUZO8+B/wA4Oxow3r+u0TJkuk0jwl4OqGNlCCajsCByhirf1LZ6jZz0Sqh/+pLJ2LKWYS1Rmy0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfodrhuWq9flNidnapkn2Qlc9RKo0IPu0EkRVdtb91f4c+NGwL
	cWDUjZcRyVtA1Coqu1gXqvdmgqHy9TXqSBMUV/7CAGuPBDf/p6A6cpuYCe+GOrgl9dEzdfGCa98
	D0aDndAiz/mx3eYikm3zuWzardllU1L2V2twYeg+yeL/K/z/ovX1tkLB1YI57dA==
X-Gm-Gg: ASbGncvKpdxYOuNGvvGRBRUnX4k/bUMW0P9B0yP8oIF4kF+C41lp04bbWsWs4SSMf5d
	YSuA2zXDz5i3z0a2xZ+CrGO53mz0RRatVIXZFUmslAv/OO3NOIBUrtn07W1ZUYcikikNtctmgXC
	YEqCgby87gPP24SpKsAnhaczRAn7Z7zrII8T5mdvmaL0v+CiHutS85OY8gRItQhCHrXfW2tY2+/
	86/tnMflhm2sCeXVuP8tTVBfZOtlhCnnOsI2/MHD9EsOo/80YYW8XnsXyLvEMaR4irWxzjJ4pLa
	vDRhNu67QliyANTV2Q0D60Dl/e3144njnVUfMTgY2E9K12pBWmNqe4BbIhbcskXod2u7aW4XAEh
	En2nV6NcwQgiOoO/oGA1J7S5kO4RtIwnxrK3r
X-Received: by 2002:a05:6000:1449:b0:38f:4f60:e669 with SMTP id ffacd0b85a97d-39efba6ae57mr11302112f8f.29.1745311958287;
        Tue, 22 Apr 2025 01:52:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/UI2uRZTHgPFSuSaAg/KQzTDzHZh4wPKLeRC71LvW1VKaLDpD/BYdDtU9xqkVe9XTUyRq2g==
X-Received: by 2002:a05:6000:1449:b0:38f:4f60:e669 with SMTP id ffacd0b85a97d-39efba6ae57mr11302099f8f.29.1745311957953;
        Tue, 22 Apr 2025 01:52:37 -0700 (PDT)
Received: from ?IPV6:2003:cb:c731:8700:3969:7786:322:9641? (p200300cbc73187003969778603229641.dip0.t-ipconnect.de. [2003:cb:c731:8700:3969:7786:322:9641])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4206fasm14260104f8f.2.2025.04.22.01.52.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 01:52:37 -0700 (PDT)
Message-ID: <0ba5c4ab-1580-4286-b9df-5d4da4e9324e@redhat.com>
Date: Tue, 22 Apr 2025 10:52:36 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] mm/hugetlb: Refactor unmap_hugepage_range() to
 take folio instead of page
To: nifan.cxl@gmail.com, muchun.song@linux.dev, willy@infradead.org
Cc: mcgrof@kernel.org, a.manzanares@samsung.com, dave@stgolabs.net,
 akpm@linux-foundation.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Fan Ni <fan.ni@samsung.com>, Sidhartha Kumar <sidhartha.kumar@oracle.com>
References: <20250418170834.248318-2-nifan.cxl@gmail.com>
 <20250418170834.248318-3-nifan.cxl@gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250418170834.248318-3-nifan.cxl@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18.04.25 18:57, nifan.cxl@gmail.com wrote:
> From: Fan Ni <fan.ni@samsung.com>
> 
> The function unmap_hugepage_range() has two kinds of users:
> 1) unmap_ref_private(), which passes in the head page of a folio.  Since
>     unmap_ref_private() already takes folio and there are no other uses
>     of the folio struct in the function, it is natural for
>     unmap_hugepage_range() to take folio also.
> 2) All other uses, which pass in NULL pointer.
> 
> In both cases, we can pass in folio. Refactor unmap_hugepage_range() to
> take folio.
> 
> Signed-off-by: Fan Ni <fan.ni@samsung.com>
> Reviewed-by: Muchun Song <muchun.song@linux.dev>
> Reviewed-by: Sidhartha Kumar <sidhartha.kumar@oracle.com>
> ---
> v2:
> Picked up Reviewed-by tags;
> 
> v1:
> https://lore.kernel.org/linux-mm/aAHUluy7T32ZlYg7@debian/T/#m7ba630d783e08ae708453279579093d481c6e721
> ---
>   include/linux/hugetlb.h | 2 +-
>   mm/hugetlb.c            | 7 ++++---
>   2 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
> index a57bed83c657..b7699f35c87f 100644
> --- a/include/linux/hugetlb.h
> +++ b/include/linux/hugetlb.h
> @@ -128,7 +128,7 @@ int move_hugetlb_page_tables(struct vm_area_struct *vma,
>   int copy_hugetlb_page_range(struct mm_struct *, struct mm_struct *,
>   			    struct vm_area_struct *, struct vm_area_struct *);
>   void unmap_hugepage_range(struct vm_area_struct *,
> -			  unsigned long, unsigned long, struct page *,
> +			  unsigned long, unsigned long, struct folio *folio,
>   			  zap_flags_t);

Note that no parameters are using names. While I am not a big fan of 
that in general, we should keep it consistent.

Either name all or none.


Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

