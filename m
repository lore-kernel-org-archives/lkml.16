Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651D1283FDE
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 09:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747302064; cv=none; b=TSANmMC66n1+MJXM2XM9ur9OFyg648Pox0NTm+FxF3h0ogw08xoXxWBlrT8EKmjDJiwCUeHYBzu5xwjtx9VXS9iEhtDe10kGHgsqW7rkFPykUQF79xOZr24FIVQcuNyQmzJXnH1bgHNN8HZW7/9GK5mOcEMTUUUQptMohan++OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747302064; c=relaxed/simple;
	bh=MGUTufPC8eJlpXJAzXZokqBHaaopUQ+rSgOQsEWWtbk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M+Q6QVZ3zd38pFgotsMfkn4U68C2bwWLhAA31uaT5/vix6iySHQO11BC1J8OhvF31nL7frFJMX+QX6hya/aN82fJ/dKfqcKzO6V2avZg7oTpR79KRyq9IW4a0n8mB7AN5TRlf68dz8GeR/JkSWAFhyg/33xu2zDUTyPu31Qjt8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eVMZNWRh; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eVMZNWRh"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54e98f73850so624244e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 02:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747302060; x=1747906860; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=16TXtjUQOKhYTp8nb0jqguevt6aIASjENt+W1s/s8pA=;
        b=eVMZNWRhAcP/qSE8ehWUI0dbYG5/GT0+oyCZBpGbs4VclmGq26YEsW9AkHxTT2bZ3Z
         GJGbp+WQMqhzA0ExTYDJL8U1Ft5YrmPS8E+NLeoNRlPEf9vzvBl8y9VURBlB/8XZpbyx
         uSGft3imncVkLclQJ7+i3Z8UwZ6hx3RiEuSITi6Yfs66Pbgdt2NH5VGI7a3Yeb+A9XLB
         +pCYQjeFc+y3e9dV1CSDCIHxVMyLwcN9d9ZySx5jgqkbGZW0543gKBX4dOFim65F6MGG
         CffsTah0QLSRRsN8qVD8sPykguR3GKs7RpFXi6QrxCEalXGuIrRY0b4R0iKjxCNtV7Cw
         0Scg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747302060; x=1747906860;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=16TXtjUQOKhYTp8nb0jqguevt6aIASjENt+W1s/s8pA=;
        b=gSyVXZOW7mDEHImFp6p0ctOv75HnhUxMm43racKOb421V0drunnQWypQy4x6QeXJqK
         EiPr4Sm4VVAqbKrJztUEZD8Ek3GF9JCFjGPrTjd3zbeRddRCaqOyg3gZp2p/1k0cgQti
         6NAyGwVBtwU8m0/uXBGR2QsouMEryPetlskaEo1Pw9Sw5JCWF55+Q9XqRifJcAS/DG8Q
         yrI/Q1Mz/+UooJYxEknkz3NNBfmDojbpqcqIdW+SOh8T22uI6rO3MAj4EixFuGXrJyD7
         Xhttzp0vYF11p7NspxZ/XQL+Pj68/8IFZIotKX/eIwwd5X+gbrNCT1DyhCrmYn34VQ+S
         XJJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUICpp6zgJt/EQnpjwyR5m+7sv8PLVVYoQ2meLvrFXDxGVR4liT/rAnmurURZQb7qr+F7ivu9RZg0O3Sig=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzGcz5tD/o7MMC/6iKEzoOvMe+nnpCiGFjcT21rrtJYFcsjwE5
	rAS7IeBzRISVaoqPQenEp0KZyrq+rnBIhsSbu2Tyjk9QVrsV8Bnr
X-Gm-Gg: ASbGncuf7AYe+Pq7zOPgfJIJG1ClfmiZnRvphyDc5sx24G+JFUokKU/U1atEDqXroFs
	Xuuge20lnI2cNt2frGAWgv1jdwvehhQxIYVInpuJrqPu2V+WzGoRgMOYVhhGGRYF0+AhMi2y1QA
	dyTTv53X6pDMUSXt9XL5T7M/71PPVLBk7kLQPLDGnZMOLiBM0YIGUn/cP8BTt+M1n3L9ux6oNvM
	vPGw5IXV2BV87iEj+lt0/LheRicJGJy4pTa5stTJb7HFR3598UB1Ms6sUBwUrD7APbSwNbNbwaR
	dJF3q+fhFhfWoY0UTKcfKcWtsLQSo8H+4Dy71HNngxet+yuF9IjkcxcsDmlnHrmbjg==
X-Google-Smtp-Source: AGHT+IGYzEDJNoKwsDOnBe/xP7z666VnKlBcvQah0C6jkJJ61IWyXuFBCMCgwXZ0OGtqJHzXvSsKiw==
X-Received: by 2002:a05:6512:6804:b0:54e:9c6e:8636 with SMTP id 2adb3069b0e04-550d765196dmr2139025e87.47.1747302060226;
        Thu, 15 May 2025 02:41:00 -0700 (PDT)
Received: from localhost (soda.int.kasm.eu. [2001:678:a5c:1202:4fb5:f16a:579c:6dcb])
        by smtp.gmail.com with UTF8SMTPSA id 2adb3069b0e04-550d49f3eebsm744705e87.244.2025.05.15.02.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 02:40:59 -0700 (PDT)
Date: Thu, 15 May 2025 11:40:59 +0200
From: Klara Modin <klarasmodin@gmail.com>
To: Kairui Song <kasong@tencent.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
	Matthew Wilcox <willy@infradead.org>, Hugh Dickins <hughd@google.com>, Chris Li <chrisl@kernel.org>, 
	David Hildenbrand <david@redhat.com>, Yosry Ahmed <yosryahmed@google.com>, 
	"Huang, Ying" <ying.huang@linux.alibaba.com>, Nhat Pham <nphamcs@gmail.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	Kalesh Singh <kaleshsingh@google.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Tim Chen <tim.c.chen@linux.intel.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 24/28] mm, swap: implement helpers for reserving data in
 swap table
Message-ID: <flxeg6dxdanixfcfw2sc4qtgisngt22d6ltwkql5hkvx4ixzwe@oyoo4vefepie>
References: <20250514201729.48420-1-ryncsn@gmail.com>
 <20250514201729.48420-25-ryncsn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514201729.48420-25-ryncsn@gmail.com>

Hi,

On 2025-05-15 04:17:24 +0800, Kairui Song wrote:
> From: Kairui Song <kasong@tencent.com>
> 
> To prepare for using swap table as the unified swap layer, introduce
> macro and helpers for storing multiple kind of data in an swap table
> entry.
> 
> Signed-off-by: Kairui Song <kasong@tencent.com>
> ---
>  mm/swap_table.h | 130 ++++++++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 119 insertions(+), 11 deletions(-)
> 
> diff --git a/mm/swap_table.h b/mm/swap_table.h
> index 69a074339444..9356004d211a 100644
> --- a/mm/swap_table.h
> +++ b/mm/swap_table.h
> @@ -5,9 +5,41 @@
>  #include "swap.h"
>  
>  /*
> - * Swap table entry could be a pointer (folio), a XA_VALUE (shadow), or NULL.
> + * Swap table entry type and bit layouts:
> + *
> + * NULL:     | ------------    0   -------------|
> + * Shadow:   | SWAP_COUNT |---- SHADOW_VAL ---|1|
> + * Folio:    | SWAP_COUNT |------ PFN -------|10|
> + * Pointer:  |----------- Pointer ----------|100|
> + *
> + * Usage:
> + * - NULL: Swap Entry is unused.
> + *
> + * - Shadow: Swap Entry is used and not cached (swapped out).
> + *   It's reusing XA_VALUE format to be compatible with workingset
> + *   shadows. SHADOW_VAL part could be all 0.
> + *
> + * - Folio: Swap Entry is in cache.
> + *
> + * - Pointer: Unused yet. Because only the last three bit of a pointer
> + *   is usable so now `100` is reserved for potential pointer use.
>   */
>  
> +#define ENTRY_COUNT_BITS	BITS_PER_BYTE
> +#define ENTRY_SHADOW_MARK	0b1UL
> +#define ENTRY_PFN_MARK		0b10UL
> +#define ENTRY_PFN_LOW_MASK	0b11UL
> +#define ENTRY_PFN_SHIFT		2
> +#define ENTRY_PFN_MASK		((~0UL) >> ENTRY_COUNT_BITS)
> +#define ENTRY_COUNT_MASK	(~((~0UL) >> ENTRY_COUNT_BITS))
> +#define ENTRY_COUNT_SHIFT	(BITS_PER_LONG - BITS_PER_BYTE)
> +#define ENTRY_COUNT_MAX		((1 << ENTRY_COUNT_BITS) - 2)
> +#define ENTRY_COUNT_BAD		((1 << ENTRY_COUNT_BITS) - 1) /* ENTRY_BAD */
> +#define ENTRY_BAD		(~0UL)
> +
> +/* For shadow offset calculation */
> +#define SWAP_COUNT_SHIFT	ENTRY_COUNT_BITS
> +
>  /*
>   * Helpers for casting one type of info into a swap table entry.
>   */
> @@ -19,17 +51,27 @@ static inline swp_te_t null_swp_te(void)
>  
>  static inline swp_te_t folio_swp_te(struct folio *folio)
>  {
> -	BUILD_BUG_ON(sizeof(swp_te_t) != sizeof(void *));
> -	swp_te_t swp_te = { .counter = (unsigned long)folio };

> +	BUILD_BUG_ON((MAX_POSSIBLE_PHYSMEM_BITS - PAGE_SHIFT) >
> +		     (BITS_PER_LONG - ENTRY_PFN_SHIFT - ENTRY_COUNT_BITS));

MAX_POSSIBLE_PHYSMEM_BITS does not seem to be available on all
arches/configs.

E.g. zsmalloc seems to set it to MAX_PHYSMEM_BITS when this is the case
but I don't know if that applies here.

> +	swp_te_t swp_te = {
> +		.counter = (folio_pfn(folio) << ENTRY_PFN_SHIFT) | ENTRY_PFN_MARK
> +	};
>  	return swp_te;
>  }
>  
>  static inline swp_te_t shadow_swp_te(void *shadow)
>  {
> -	BUILD_BUG_ON((BITS_PER_XA_VALUE + 1) !=
> -		     BITS_PER_BYTE * sizeof(swp_te_t));
> -	VM_WARN_ON_ONCE(shadow && !xa_is_value(shadow));
>  	swp_te_t swp_te = { .counter = ((unsigned long)shadow) };
> +	BUILD_BUG_ON((BITS_PER_XA_VALUE + 1) != BITS_PER_BYTE * sizeof(swp_te_t));
> +	BUILD_BUG_ON((unsigned long)xa_mk_value(0) != ENTRY_SHADOW_MARK);
> +	VM_WARN_ON_ONCE(shadow && !xa_is_value(shadow));
> +	swp_te.counter |= ENTRY_SHADOW_MARK;
> +	return swp_te;
> +}
> +
> +static inline swp_te_t bad_swp_te(void)
> +{
> +	swp_te_t swp_te = { .counter = ENTRY_BAD };
>  	return swp_te;
>  }
>  
> @@ -43,7 +85,7 @@ static inline bool swp_te_is_null(swp_te_t swp_te)
>  
>  static inline bool swp_te_is_folio(swp_te_t swp_te)
>  {
> -	return !xa_is_value((void *)swp_te.counter) && !swp_te_is_null(swp_te);
> +	return ((swp_te.counter & ENTRY_PFN_LOW_MASK) == ENTRY_PFN_MARK);
>  }
>  
>  static inline bool swp_te_is_shadow(swp_te_t swp_te)
> @@ -51,19 +93,63 @@ static inline bool swp_te_is_shadow(swp_te_t swp_te)
>  	return xa_is_value((void *)swp_te.counter);
>  }
>  
> +static inline bool swp_te_is_valid_shadow(swp_te_t swp_te)
> +{
> +	/* The shadow could be empty, just for holding the swap count */
> +	return xa_is_value((void *)swp_te.counter) &&
> +	       xa_to_value((void *)swp_te.counter);
> +}
> +
> +static inline bool swp_te_is_bad(swp_te_t swp_te)
> +{
> +	return swp_te.counter == ENTRY_BAD;
> +}
> +
> +static inline bool __swp_te_is_countable(swp_te_t ent)
> +{
> +	return (swp_te_is_shadow(ent) || swp_te_is_folio(ent) ||
> +		swp_te_is_null(ent));
> +}
> +
>  /*
>   * Helpers for retrieving info from swap table.
>   */
>  static inline struct folio *swp_te_folio(swp_te_t swp_te)
>  {
>  	VM_WARN_ON(!swp_te_is_folio(swp_te));
> -	return (void *)swp_te.counter;
> +	return pfn_folio((swp_te.counter & ENTRY_PFN_MASK) >> ENTRY_PFN_SHIFT);
>  }
>  
>  static inline void *swp_te_shadow(swp_te_t swp_te)
>  {
>  	VM_WARN_ON(!swp_te_is_shadow(swp_te));
> -	return (void *)swp_te.counter;
> +	return (void *)(swp_te.counter & ~ENTRY_COUNT_MASK);
> +}
> +
> +static inline unsigned char swp_te_get_count(swp_te_t swp_te)
> +{
> +	VM_WARN_ON(!__swp_te_is_countable(swp_te));
> +	return ((swp_te.counter & ENTRY_COUNT_MASK) >> ENTRY_COUNT_SHIFT);
> +}
> +
> +static inline unsigned char swp_te_try_get_count(swp_te_t swp_te)
> +{
> +	if (__swp_te_is_countable(swp_te))
> +		return swp_te_get_count(swp_te);
> +	return 0;
> +}
> +
> +static inline swp_te_t swp_te_set_count(swp_te_t swp_te,
> +					unsigned char count)
> +{
> +	VM_BUG_ON(!__swp_te_is_countable(swp_te));
> +	VM_BUG_ON(count > ENTRY_COUNT_MAX);
> +
> +	swp_te.counter &= ~ENTRY_COUNT_MASK;
> +	swp_te.counter |= ((unsigned long)count) << ENTRY_COUNT_SHIFT;
> +	VM_BUG_ON(swp_te_get_count(swp_te) != count);
> +
> +	return swp_te;
>  }
>  
>  /*
> @@ -87,17 +173,39 @@ static inline swp_te_t __swap_table_get(struct swap_cluster_info *ci, pgoff_t of
>  static inline void __swap_table_set_folio(struct swap_cluster_info *ci, pgoff_t off,
>  					  struct folio *folio)
>  {
> -	__swap_table_set(ci, off, folio_swp_te(folio));
> +	swp_te_t swp_te;
> +	unsigned char count;
> +
> +	swp_te = __swap_table_get(ci, off);
> +	count = swp_te_get_count(swp_te);
> +	swp_te = swp_te_set_count(folio_swp_te(folio), count);
> +
> +	__swap_table_set(ci, off, swp_te);
>  }
>  
>  static inline void __swap_table_set_shadow(struct swap_cluster_info *ci, pgoff_t off,
>  					   void *shadow)
>  {
> -	__swap_table_set(ci, off, shadow_swp_te(shadow));
> +	swp_te_t swp_te;
> +	unsigned char count;
> +
> +	swp_te = __swap_table_get(ci, off);
> +	count = swp_te_get_count(swp_te);
> +	swp_te = swp_te_set_count(shadow_swp_te(shadow), count);
> +
> +	__swap_table_set(ci, off, swp_te);
>  }
>  
>  static inline void __swap_table_set_null(struct swap_cluster_info *ci, pgoff_t off)
>  {
>  	__swap_table_set(ci, off, null_swp_te());
>  }
> +
> +static inline void __swap_table_set_count(struct swap_cluster_info *ci, pgoff_t off,
> +					  unsigned char count)
> +{
> +	swp_te_t swp_te;
> +	swp_te = swp_te_set_count(__swap_table_get(ci, off), count);
> +	__swap_table_set(ci, off, swp_te);
> +}
>  #endif
> -- 
> 2.49.0
> 

Regards,
Klara Modin
