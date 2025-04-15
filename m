Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50DC028DF06
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 13:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744722166; cv=none; b=mTdvRichKxHO2PpbfQLHKA78+HnkEB9huTOovV/+SMYR4QuaSubLjXhvs5TKDURnOZiw7TV2h9CZ7aHsEqLU4cbyHd6agHUDJdHp7rMnN4WiXa3IFi5kLQBzUAJhKLvZKQmMB9BkHBsgTRle/Xmh6FJBWnwitze3jyNXORqZB3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744722166; c=relaxed/simple;
	bh=nKU7oXz7azT63GGaMuVJgMmk8Kg6aeC5OxGlUnIB/dw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uVYzlOnDnYZlihAqMANbllxc9wKKp1Iw9AhRL7/jzo1lDuQjn5Z2BhFW+6+lpIN0SjC7po4YbHrEncnj1U4LphqKkVU2rol6aS6EcGmf0+HBDJTYo2f9aNAgPo5Kxwr3w+ztmQQq0ojumbrvgJ0VgzdaXwfdNKlVDycgzM5IziA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=huBBLv9A; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="huBBLv9A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744722164;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=fYgbR8kG7oTYqOmEg71iZruwDr8wOwjYkIu/IWO1XA0=;
	b=huBBLv9Aj6bL/m/1aXj91jMdPesdNx2001bkgJJdeWlIUe4+4Bd7rj6HBQZOneO0AQDrKL
	808ioD3+yiA0fjmZil74gcDlrV39TnPX1I0xbGfAIQFjzQM0hyGyzelwTP/XRfKN8lqjGx
	sowsPIc9w3LLKYk1kCvrgtghuW8BBnQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-322-5vdGJGrxMfiSZNpjvjR4Fw-1; Tue, 15 Apr 2025 09:02:41 -0400
X-MC-Unique: 5vdGJGrxMfiSZNpjvjR4Fw-1
X-Mimecast-MFC-AGG-ID: 5vdGJGrxMfiSZNpjvjR4Fw_1744722160
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43d51bd9b41so43832485e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 06:02:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744722160; x=1745326960;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fYgbR8kG7oTYqOmEg71iZruwDr8wOwjYkIu/IWO1XA0=;
        b=srQc2rokf1UuYQD6PB+AQN0sWwcoEWuzWfmH7qMqhy/N5F/Y9XDcMoSFOY20Wb8EMN
         9rshPBsbebqDNNx3OgmzJ6upVK6pG8+6jPm15EI4TzZm4O8RhwxTN8ivfhcgdfG3jJDs
         m5PHuZzatAHxNdCg4119YZyUTpkjv6lNDWqE3bfzs91vZNwfgCuaMXbrhaS1fn0YmaDG
         khkPVpeKVy24DCNcloRQyihMWrVan2ROGTSe57rQ1AImnUsCkEb4NKVkuZuhB2mzjPfk
         7j08vUGV/8OETHLGCXSLfCcnecMXoPGKL2c/JjYg80jAuESNd+el9Ri2Vk5qFe97YVjG
         50MA==
X-Forwarded-Encrypted: i=1; AJvYcCUvvh2/gDwDcj405VCYOId9akL84rrj5uCbT5oZFIiOqUl9qD7SBqeLV6sxNZ0yRdo7XfncbVyJ3ZF9iuk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzxz+ROkZK+xcsDaLdqsVjU1+gN6K1YiX3SJGSMT3yEcIRPD8KO
	9F+QPKzxnXz/ZSMaTP1jdbJmujlGllut1VLcMiRZ+EEIh2VzLvd00BeRhP+hLVROD4Ow7PdD11P
	9N7d18tBMd5Q4Kkt1pZw90HrMesjV/lTkTHYlL6ieajP9HdZMa7RMTjJiKm/cIrhQb+Ah4wnmvq
	M=
X-Gm-Gg: ASbGnctWBN3LvwlT/8i93pxQ83Mm71thE4P8v6lBP+FmL6Au5fGlQ56dc56MKbKYATC
	+Ac9SVyCEQoe7jhrm2NBHqTiJ0BpD5Q2aA3JxLglyRz6Ylou5RXLq6L+CUcLyjeVWmVCvIqExMW
	7mgYUtuDnPx3C9rLD+RRANKFhCtyhX3BeLlDg+mIEemG3PeREv6s0p86N67P5MlllCK+fzdtJNO
	jeYJPG4RI8evExKQ6lojFMkxWidfGbTpAa2YuLLEgnviePJDc9aTbSB2y3l15PVSWL3+7/OAAj6
	CoTUwrNcaRuteWTG4Tun9RNHsg4NQbvulAKYndwJ9/4D5Jpelsi1tjIon+HekPWeYtpGg8lQtmL
	M0mH64hwCzZdamEh/GK+a+J+MyUWuINfl35jfgA==
X-Received: by 2002:a05:600c:604e:b0:43c:f6b0:e807 with SMTP id 5b1f17b1804b1-43f3b055a80mr134422325e9.31.1744722159977;
        Tue, 15 Apr 2025 06:02:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEFTb451dYiWPe1L9E1APjLev+PfHBH8BD8iJDyZJM9oEiG0tLYWmJ04OHy9N6pSiPuBjkGtA==
X-Received: by 2002:a05:600c:604e:b0:43c:f6b0:e807 with SMTP id 5b1f17b1804b1-43f3b055a80mr134421885e9.31.1744722159509;
        Tue, 15 Apr 2025 06:02:39 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f02:2900:f54f:bad7:c5f4:9404? (p200300d82f022900f54fbad7c5f49404.dip0.t-ipconnect.de. [2003:d8:2f02:2900:f54f:bad7:c5f4:9404])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f207cb88asm208403935e9.37.2025.04.15.06.02.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 06:02:38 -0700 (PDT)
Message-ID: <d6c415ae-4d8e-4d6b-a22d-eb2b02b5bb67@redhat.com>
Date: Tue, 15 Apr 2025 15:02:37 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm, hugetlb: Increment the number of pages to be reset on
 HVO
To: Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Muchun Song <muchun.song@linux.dev>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250415111859.376302-1-osalvador@suse.de>
Content-Language: en-US
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250415111859.376302-1-osalvador@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15.04.25 13:18, Oscar Salvador wrote:
> commit 4eeec8c89a0c ("mm: move hugetlb specific things in folio to page[3]")
> shifted hugetlb specific stuff, and now mapping overlaps _hugetlb_cgroup field.
> 
> Upon restoring the vmemmap for HVO, only the first two tail pages are reset, and
> this causes the check in free_tail_page_prepare() to fail as it finds
> an unexpected mapping value in some tails.
> 
> Increment the number of pages to be reset to 4 (head + 3 tail pages)
> 
> Fixes: 4eeec8c89a0c ("mm: move hugetlb specific things in folio to page[3]")
> Suggested-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Oscar Salvador <osalvador@suse.de>
> ---
>   mm/hugetlb_vmemmap.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
> index 9a99dfa3c495..27245e86df25 100644
> --- a/mm/hugetlb_vmemmap.c
> +++ b/mm/hugetlb_vmemmap.c
> @@ -238,11 +238,11 @@ static void vmemmap_remap_pte(pte_t *pte, unsigned long addr,
>    * struct page, the special metadata (e.g. page->flags or page->mapping)
>    * cannot copy to the tail struct page structs. The invalid value will be
>    * checked in the free_tail_page_prepare(). In order to avoid the message
> - * of "corrupted mapping in tail page". We need to reset at least 3 (one
> - * head struct page struct and two tail struct page structs) struct page
> + * of "corrupted mapping in tail page". We need to reset at least 4 (one
> + * head struct page struct and three tail struct page structs) struct page
>    * structs.
>    */
> -#define NR_RESET_STRUCT_PAGE		3
> +#define NR_RESET_STRUCT_PAGE		4
>   
>   static inline void reset_struct_pages(struct page *start)
>   {

Thanks!

Reviewed-by: David Hildenbrand <david@redhat.com>


-- 
Cheers,

David / dhildenb

