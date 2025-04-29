Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52A72C1787
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 12:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745929477; cv=none; b=mmWYpdspT7qnDXvT37PMltG24958GSjOo56MoPGBbCam2ETNDWwsdhKTbX89NzriLphJ86osIxeGlNDDKbFhS6Fmb2lJiDwhf2RDcwvOzELTNf/47+k4D19TKu6+5RjR/gxSuqh2kmf+UOcuih/KYW4kGL82kWDfQc8fsNz59cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745929477; c=relaxed/simple;
	bh=T2LhIOeNpEZmbHVSN2TQjE+VlIC/adhYvfC/TrSGCXU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aDLaINf+kNvik4GrHvX9eqM0FIJHUb9X9r9f8YPJNd7cEeflTzUTAFlSj7bzsBcPbqRkZBSe5AXYx1lFMbHGPgGxJStn2Iu2G1c7MuGKJflA7cCb6IonB8H1A8ayXOErOVOvGpigm9NcdSKu/mWKiYySzXIrPnRjzPbjXMoU4sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KTmdC/Z4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KTmdC/Z4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745929474;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=kyBZvHqk9hrp0G96QmgOzfE/FegiKBDztUxLRGGDstI=;
	b=KTmdC/Z4MyPSZcMu71S/afXM9gGBNgbS+IFhKOIk0b0UHeAW4LqwYlSxv8OfpBUDMxlEuX
	plDWJOxFpwEHPju6CgNODKCVay/GFu3fP+QUxZmWJJE/MVNePDPwq6MUwfxo00Gp4uaMWN
	ifFKlH7HebC+1Qlo/Ad7IVZUTD596tk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-505--i7UBqFBM82n8c7vKtL0SQ-1; Tue, 29 Apr 2025 08:24:32 -0400
X-MC-Unique: -i7UBqFBM82n8c7vKtL0SQ-1
X-Mimecast-MFC-AGG-ID: -i7UBqFBM82n8c7vKtL0SQ_1745929471
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a07a7b4298so1687892f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 05:24:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745929471; x=1746534271;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kyBZvHqk9hrp0G96QmgOzfE/FegiKBDztUxLRGGDstI=;
        b=VhzTXPE992UGEKys79iciTVPRzvQPyTnXBx3NAE46k9mrO5V7YILGHADeg20miMbJn
         uQV6KxHUPJ3RxEUPuc8be673EvQIC2Cpo3kXdzyIbpzka2dAAtffm47ZUgqsbPB3YX6L
         QaOExckGSDem+rs0JpgrBz5CwHjjJrMHIB4APQqzHND4eNhRnNmvsESsScsczLTvSaje
         O7SVh7dxLwWibYVpeFso1LeOzrDQM0JhSwJOrY7jh63tVVapwcA5Qw/e1PYu2X4KbJK2
         I9K5IF3b016pHgXY9T9bmaTDw6li73/M7M170mYCOrOM3ljV09P41SgNo9zddrCuhpTm
         m8nA==
X-Forwarded-Encrypted: i=1; AJvYcCVM9J6PX4gnw/Xdo3Yw4PbRcKvgXlDRt1rmrbCP9QaLu72us9nlHlLXYVw6Q1JNfKfnpQBhbg6Y3/9/hKc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+XdeKOriarfHP5uJQGltrguK4hvrHo4xdto9yg9Dkn8Ngxz8S
	fpQ0DNgFvRu9Qq01RRArjny1+vj3JZlwpFBx7DYUYl/gvvDH0BssnEhBRwSZZDhkxSIeHL5HaEG
	iq7EXTgZohJWjVZxmGbi7dYovKDqB7tw1X5SErgDLENk0xAAs2QRU42sPl/945w==
X-Gm-Gg: ASbGncur40rqnaUZH4wnnHgVE+cZQFFXjvSL7HWVfH7ISySrPBMvb25iaMlWlq6Lsa8
	yqu3xUweRy1USnoIj49YsfJiiMCgwBL/iLyGDS9FuTRNQPk24PQp/fZN1rxzI/DA0EsXJ9NB9dV
	BlFrKPNiQOT5N0qCqxuUsTD+xL8kbG+5TniwdVAlBw56v74Rnfv/F2dKZ01RK+Lc+NJgmqHg8hO
	sa4rn603tLSTT5it+nGnxjP3WRNrGTixsgWwCdWpx1+NL6XMLlgOxrFKQdge8BZKOM45AKPh6QR
	LUbltTijt7J2mKjZoFYPecNt3jhWbZSUjfMi9YMESofY2yGltu7lzT11Nnpatp5YD7ucUr57a3F
	UfaVNqKudPg2djUgDFOC1ftgzSVkjk7//sOweRKM=
X-Received: by 2002:a05:6000:1448:b0:39f:4d62:c5fc with SMTP id ffacd0b85a97d-3a08ad47291mr2221565f8f.35.1745929471427;
        Tue, 29 Apr 2025 05:24:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFTFfgPx330EBAU8jvIkA4dn665GTM1w8EZRC6C3R+O9Z4AxC1QxMSXFpEzud78UlgYKo/CBw==
X-Received: by 2002:a05:6000:1448:b0:39f:4d62:c5fc with SMTP id ffacd0b85a97d-3a08ad47291mr2221544f8f.35.1745929471082;
        Tue, 29 Apr 2025 05:24:31 -0700 (PDT)
Received: from ?IPV6:2003:cb:c73b:fa00:8909:2d07:8909:6a5a? (p200300cbc73bfa0089092d0789096a5a.dip0.t-ipconnect.de. [2003:cb:c73b:fa00:8909:2d07:8909:6a5a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e5e345sm14003848f8f.94.2025.04.29.05.24.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 05:24:30 -0700 (PDT)
Message-ID: <f12086b6-8a24-40b6-8c6d-75131e0e2573@redhat.com>
Date: Tue, 29 Apr 2025 14:24:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] mm, swap: remove no longer used swap mapping
 helper
To: Kairui Song <kasong@tencent.com>, linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>, Hugh Dickins <hughd@google.com>,
 Chris Li <chrisl@kernel.org>, Yosry Ahmed <yosryahmed@google.com>,
 "Huang, Ying" <ying.huang@linux.alibaba.com>, Nhat Pham <nphamcs@gmail.com>,
 Johannes Weiner <hannes@cmpxchg.org>, linux-kernel@vger.kernel.org
References: <20250429114949.41124-1-ryncsn@gmail.com>
 <20250429114949.41124-7-ryncsn@gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250429114949.41124-7-ryncsn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29.04.25 13:49, Kairui Song wrote:
> From: Kairui Song <kasong@tencent.com>
> 
> This helper existed to fix the circular header dependency issue
> but it is no longer used since commit 0d40cfe63a2f ("fs: remove
> folio_file_mapping()"), remove it.
> 
> Signed-off-by: Kairui Song <kasong@tencent.com>
> Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>   include/linux/pagemap.h | 1 -
>   mm/swapfile.c           | 9 ---------
>   2 files changed, 10 deletions(-)
> 
> diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
> index 47b5746d5a65..a071cdc8f902 100644
> --- a/include/linux/pagemap.h
> +++ b/include/linux/pagemap.h
> @@ -533,7 +533,6 @@ static inline void filemap_nr_thps_dec(struct address_space *mapping)
>   }
>   
>   struct address_space *folio_mapping(struct folio *);
> -struct address_space *swapcache_mapping(struct folio *);
>   
>   /**
>    * folio_flush_mapping - Find the file mapping this folio belongs to.
> diff --git a/mm/swapfile.c b/mm/swapfile.c
> index bf6c98009909..1a36e1f4f198 100644
> --- a/mm/swapfile.c
> +++ b/mm/swapfile.c
> @@ -3653,15 +3653,6 @@ struct swap_info_struct *swp_swap_info(swp_entry_t entry)
>   	return swap_type_to_swap_info(swp_type(entry));
>   }
>   
> -/*
> - * out-of-line methods to avoid include hell.
> - */
> -struct address_space *swapcache_mapping(struct folio *folio)
> -{
> -	return swp_swap_info(folio->swap)->swap_file->f_mapping;
> -}
> -EXPORT_SYMBOL_GPL(swapcache_mapping);
> -
>   /*
>    * add_swap_count_continuation - called when a swap count is duplicated
>    * beyond SWAP_MAP_MAX, it allocates a new page and links that to the entry's

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

