Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CBFC2CCDB
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 08:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743494570; cv=none; b=pVwLUzIp0qe9YLLRgcDr0nv3jqrCFVSA0IwkopwsZ/rEHxteBJUP/n7Ymdzo977yYMWKsXbs4qkUS82lbvscoeDKhEP0xtof/LTXKxNs8/F1rAXy8cHfmXbHqfKMHsjBs6+nJ1C4VbT5aCEUfFKcbXL4kqtzQZ9x/zXEC+K/BaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743494570; c=relaxed/simple;
	bh=HzpAHO5PEDiUo0W5zS/jg0sITWRPTwgqf3DVFtLfujU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LyHJJK/3bbNmdebLNoiYuYfCaLKXcQTr7XmSKvSd4owNdaQNVqRZ9VImQjUYeMfH9iJJ9CygbIqB4FzzcmoJfhhm6GJwj0sluxTSvMenUXn6fudSlsGRiZgjQHIuPFzs9cfA4d3neo+443SOmHpP4q+16m1uA4Ugg4lk13tqgNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c7Dck8L4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c7Dck8L4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743494568;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=dYJet0YnCiCvticcD26OadOMCZ+YzdfY2OI1EE1PSWw=;
	b=c7Dck8L47BrXZyONlBQFL+of3rQtJhQHEgeGz350h3cUNUAhcfvXxO0KcINEA8hhX27SUD
	22qnha033dE4QpqhatLhH0j1iv6h399jqPIZPKHrjB2IVVslYCeNI56nudY3MBazf8QKrC
	WLoYzRtWDZ0cuj9MLdUkZGCXfxGJ0+U=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-349-4BxnGgBTMrSdEvXn7rEM2g-1; Tue, 01 Apr 2025 04:02:47 -0400
X-MC-Unique: 4BxnGgBTMrSdEvXn7rEM2g-1
X-Mimecast-MFC-AGG-ID: 4BxnGgBTMrSdEvXn7rEM2g_1743494566
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-39143311936so1949307f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 01:02:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743494566; x=1744099366;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dYJet0YnCiCvticcD26OadOMCZ+YzdfY2OI1EE1PSWw=;
        b=q6r37Q4UqmNZyJcMLUtVQ6sf4nXucUWsxxL0Ku8SPlcdlGEnxbaI7HiphjeYPhWwRL
         nx3+cZzePxHEiLsETkmongok3sLYznUjf3sF4/ShDuP5cTOV28Gogx4sHwwktNt7amrn
         0LOR3qHMpLnEpKw+SD92keshNZuevB2WyZ+XUTt2kO1cnuTp997Si1LeA1t8JWw8Ijns
         zVkg/2qVGrebT23a/BXYcKMrt1mi4qv0riLJhvdoH5+/e/iW4AXar2zgHdln4Mw9UZYc
         M2nDyde90igJMLnF0JQUwgfAW4eqUfS8qTAeJmVAzTDF7uYbfLbUFbO7WzNRQ6HdPfA2
         AHdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpF3AyaVrN8WOs0hnBjWHad+OVFik0VnWwoCrJWs4cR6CtjidxdoUVFpHCDpCe/aKAQlFGPu6M1/xFSWU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo0bMLiXQCGQig+XFFXOXFNKj+A3Utk5oP5m+qtVFwB/poVd3m
	YKATjRQRWvnvkqtShRg44XC7WJzMlqnCIh1TMBm/uM1Ez57yr+NWk7wSrwDCPPQQEoKhEpbTrkn
	r5Ph8mMUfqVFXycvLmf0gRmh65hc3ZZ1nDYhZVipF8M5iHsqxeytYR8XhgIeN9Q==
X-Gm-Gg: ASbGncvm2FDMWstVPMQzzcQjSxWVf/maFli9sDtW1ubb4lxxtY1krNRuwHSwW9oTNu7
	fIiy+fjsbHaRNtf1+BiMHWx/iBx8NetCbr9vYJwW0bZYWNotZRCHDNB/ONxweZbFJUUYQ57VhSC
	rLMogiVSXEpNOZk5G8SfIuVhNk+EY1Ld99UENuuKBgPtSqdUfbxoN5aiGYm1+7u/TofqT9vlqu3
	eOX1d2JxxgG4OP1dqJtMLcakGzzPS493/CGwau1BhoJx5K0QtTFNlMYTluU/7IkwSQ8WR2YPPpX
	5suZazEBP/SygXzl2l0IbvelVLF6bcwqqC1QfVQe5rYXJz2b1T6njhHhdoF/79lwkypmeZ8jZYf
	gQf7e/+5cPR5VbGL6nTkmYU1QurtEAdYops96YEV5
X-Received: by 2002:a5d:588e:0:b0:391:3157:7717 with SMTP id ffacd0b85a97d-39c23650ed0mr1400945f8f.34.1743494565903;
        Tue, 01 Apr 2025 01:02:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPu4/9Cw6SxcDwHFmIdroOnVqxkjyJnUFCKmUTC8ChrQesrsO0NER18JD61s9630ANEn3Lxw==
X-Received: by 2002:a5d:588e:0:b0:391:3157:7717 with SMTP id ffacd0b85a97d-39c23650ed0mr1400898f8f.34.1743494565471;
        Tue, 01 Apr 2025 01:02:45 -0700 (PDT)
Received: from ?IPV6:2003:cb:c707:4d00:6ac5:30d:1611:918f? (p200300cbc7074d006ac5030d1611918f.dip0.t-ipconnect.de. [2003:cb:c707:4d00:6ac5:30d:1611:918f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b66d0dbsm13543063f8f.58.2025.04.01.01.02.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 01:02:44 -0700 (PDT)
Message-ID: <e6b8481f-0bf6-4acf-9ebc-9b4f28c0be08@redhat.com>
Date: Tue, 1 Apr 2025 10:02:43 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] mm/gup: check if both GUP_GET and GUP_PIN are set
 in __get_user_pages() earlier
To: Baoquan He <bhe@redhat.com>, akpm@linux-foundation.org
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, yanjun.zhu@linux.dev
References: <20250331081327.256412-1-bhe@redhat.com>
 <20250331081327.256412-3-bhe@redhat.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250331081327.256412-3-bhe@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31.03.25 10:13, Baoquan He wrote:
> In __get_user_pages(), it will traverse page table and take a reference
> to the page the given user address corresponds to if GUP_GET or GUP_PIN
> is et. However, it's not supported both GUP_GET and GUP_PIN are set.
> This check should be done earlier, but not doing it till entering into
> follow_page_pte() and failed.
> 
> Here move the checking to the beginning of __get_user_pages().
> 
> Signed-off-by: Baoquan He <bhe@redhat.com>
> ---
> v1->v2:
> - Fix code bug caused by copy-and-paste error, this is reported by
>    lkp test robot.
> 
>   mm/gup.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/mm/gup.c b/mm/gup.c
> index 73777b1de679..f9bce14ed3cd 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -847,11 +847,6 @@ static struct page *follow_page_pte(struct vm_area_struct *vma,
>   	pte_t *ptep, pte;
>   	int ret;
>   
> -	/* FOLL_GET and FOLL_PIN are mutually exclusive. */
> -	if (WARN_ON_ONCE((flags & (FOLL_PIN | FOLL_GET)) ==
> -			 (FOLL_PIN | FOLL_GET)))
> -		return ERR_PTR(-EINVAL);
> -
>   	ptep = pte_offset_map_lock(mm, pmd, address, &ptl);
>   	if (!ptep)
>   		return no_page_table(vma, flags, address);
> @@ -1434,6 +1429,11 @@ static long __get_user_pages(struct mm_struct *mm,
>   
>   	VM_BUG_ON(!!pages != !!(gup_flags & (FOLL_GET | FOLL_PIN)));
>   
> +	/* FOLL_GET and FOLL_PIN are mutually exclusive. */
> +	if (WARN_ON_ONCE((gup_flags & (FOLL_PIN | FOLL_GET)) ==
> +			 (FOLL_PIN | FOLL_GET)))
> +		return -EINVAL;
> +

We already have that check in is_valid_gup_args(), that catches all 
external users that could possibly mess this up.

So we can just convert that into a VM_WARN_ON_ONCE(), and while doing 
that, we should convert the VM_BUG_ON() above to a VM_WARN_ON_ONCE() as 
well.

-- 
Cheers,

David / dhildenb

