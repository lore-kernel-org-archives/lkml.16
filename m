Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18F31DF988
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 18:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745520541; cv=none; b=Es6VNZy45Gj2D99eWogmj3JjkB0a4vU/84O7wHOtDH2EffsACcScW+XBAFa3cr2odE4zVtgh4INpRbtCqPYH52fhCl+BScRzLx56MpIUI62A139icDyCCp/oRQDUhWYPze54/MdUHb3c5M9EUQ0r6GQi7xFuHpI8ACxNzcW+YJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745520541; c=relaxed/simple;
	bh=eHlHAQeQbDfCFfKwU3uoAXUThY467wmu8bWBncwoL7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gRKupyjAjr0tAGLMxHNI5Xg+thjiukdRrDy7F00WGsWorQuf2nm6FtRJmed6yHlboeMAzu2KZMa+N9NuXNR2XuvYEp+NtRIF5k9x6Armhp+v2MfB4Fw7cvdp/XZd0SHTlGnMOGwGoQfkSEoKAxf6id9YpeiGHNB+N9UEWx9hXgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Vnt3GBUq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Vnt3GBUq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745520537;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CIsAhVnMQMAgsCImJP25I4m3E7RhssUalv/w6kh8Bxw=;
	b=Vnt3GBUqVIkJUYdlwwVbTXoJaTiXWBXT1E73Us0D/A4d0J31wFkGK2xP2OZkAPIsSHzcac
	ZFkHR+oK/NEPmsgJpTUG4y9peOt+gQ6zYLrDZyTsjeR0VCQx7PNkPZCiuH5+mARMNvR6sX
	/LNOmVrLMgGjWahQBFCdJOaw6mH2VDs=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-93-EdiFdrm8M7yJ9PA6UaiGfw-1; Thu, 24 Apr 2025 14:48:55 -0400
X-MC-Unique: EdiFdrm8M7yJ9PA6UaiGfw-1
X-Mimecast-MFC-AGG-ID: EdiFdrm8M7yJ9PA6UaiGfw_1745520535
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f2c7056506so25148136d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 11:48:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745520533; x=1746125333;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CIsAhVnMQMAgsCImJP25I4m3E7RhssUalv/w6kh8Bxw=;
        b=rvEtcVnj+sXSslz9HIqaoQyO6fOjpsOTX9/bixQzS6KvyFSOq/HnDS1wq1NKI5ectC
         ZmBuKZ/RIGybI5MjjnoTqtZmtFRqsdN5WjUWJFlvnVe3VymRv1wosuzKWHQ4tN7VfsGj
         eXbmcSeKZ7tvMe69n89RuDYJQ+/ts8y/b3Tarq2Nel3+qOvuSKvdwxzHbAxT8MGpcTYT
         E4HdzddUb4vpJm/3Qx2Xv6QwZ+2YR07csW9niSF/hgHAUz3aBf3sCqJPL1qhVK+0clRs
         8RJmvoiDAOj0c2Z7lNAz3VdLJKTBCfOpmH+VSYfLnGGM2yZqgTyfnBV1dq82zOESLZc/
         YU6A==
X-Forwarded-Encrypted: i=1; AJvYcCU2MvT4QuCLXkLU2rLnYL42DVDb57LVC5U4YvzQsfggfC4jqEA5eYgHn9Ryz3LidhHYUMesiS+mDqEAQT8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRZMgAC9DPrSEqbiz3CZ8Wl9vsvwoLZqeO5luRzqD4RR+uLMqf
	Zo1B+t+kttijqn89rTQ488+634ZZhMga5FAhWJ8O31t4NSMLQJrEkc0mH5H8N0CFbMrMOdgrAC5
	7nnLddPb6yPE+QikGpUiFWZd8K8P1kQrQoMGbasT7wVpLQq1trLZ9aOrfnOKM6YIU99ueaw==
X-Gm-Gg: ASbGncsb9f6AwNQD8h+uUBQc/pS624++MMGiYuAubLPYL4aRrq4+Fq7OzQQqB8RRy4Q
	h65iTot7CgC8Kn8yglI6WjhP2ZVszKNL2/JjP9IFrpNrUjSXn3oyr/z4Q9cQhd+I4jGHPv0/IIY
	aiX2DT5dEJPJAGBX7vhYQa6fNlIqh0q7ePxx4QR8fEVr6CMmzzN4kIc5wTFVUGj9QUU6TTrvu3W
	6p2uXs4V5xBcdFmh8trDgWEofzLhhpIRZ2YZeQa5DIoSmorIOr0JkWNgpzDhXo/dOjr/KTxcbj9
	on4=
X-Received: by 2002:ad4:5dcc:0:b0:6e8:feae:929c with SMTP id 6a1803df08f44-6f4bfc0a8b0mr61445946d6.21.1745520533451;
        Thu, 24 Apr 2025 11:48:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH17C4USZR112eySO3Y6G9ihn+PwxF/2KrtX6D43iXldDZU8YpYtRibl9+FniISbEuiNDXIRQ==
X-Received: by 2002:ad4:5dcc:0:b0:6e8:feae:929c with SMTP id 6a1803df08f44-6f4bfc0a8b0mr61445676d6.21.1745520533154;
        Thu, 24 Apr 2025 11:48:53 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f4c8bf73b9sm2826156d6.25.2025.04.24.11.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 11:48:52 -0700 (PDT)
Date: Thu, 24 Apr 2025 14:48:49 -0400
From: Peter Xu <peterx@redhat.com>
To: Ming Wang <wangming01@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
	Andrew Morton <akpm@linux-foundation.org>,
	Hongchen Zhang <zhanghongchen@loongson.cn>,
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
	lixuefeng@loongson.cn, gaojuxin@loongson.cn, chenhuacai@loongson.cn
Subject: Re: [PATCH] mm/hugetlb: LoongArch: Return NULL from
 huge_pte_offset() for none PMD
Message-ID: <aAqHkdXt50van31B@x1.local>
References: <20250424083037.2226732-1-wangming01@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250424083037.2226732-1-wangming01@loongson.cn>

On Thu, Apr 24, 2025 at 04:30:37PM +0800, Ming Wang wrote:
> LoongArch's huge_pte_offset() currently returns a pointer to a PMD slot
> even if the underlying entry points to invalid_pte_table (indicating no
> mapping). Callers like smaps_hugetlb_range() fetch this invalid entry
> value (the address of invalid_pte_table) via this pointer.

So it's in smaps_hugetlb_range() context, then..

> 
> The generic is_swap_pte() check then incorrectly identifies this address
> as a swap entry on LoongArch, because it satisfies the !pte_present()
> && !pte_none() conditions. This misinterpretation, combined with a
> coincidental match by is_migration_entry() on the address bits, leads
> to kernel crashes in pfn_swap_entry_to_page().

.. you mentioned !pte_none() is checked.  Could you explain why it's
pte_none() rather than huge_pte_none()?  As I saw loongarch has exactly
this..

static inline int huge_pte_none(pte_t pte)
{
	unsigned long val = pte_val(pte) & ~_PAGE_GLOBAL;
	return !val || (val == (unsigned long)invalid_pte_table);
}

I'm not familiar with loongarch's invalid_pte_table, but I would expect at
least for now in hugetlb specific paths it should be reported as none even
without this patch.

One more thing to mention is the kernel (AFAIU) is trying to moving away
from hugetlb specific pgtable parsing to generic pgtable walkers.  It means
it could happen at some point where the kernel walks the hugetlb pgtables
using normal pgtable APIs.  I'm not yet sure what would happen then, but
maybe at some point the invalid_pte_table check is needed in pte_none() too
for loongarch.

Thanks,

> 
> Fix this at the architecture level by modifying huge_pte_offset() to
> check the PMD entry's content using pmd_none() before returning. If the
> entry is none (i.e., it points to invalid_pte_table), return NULL
> instead of the pointer to the slot.
> 
> Co-developed-by: Hongchen Zhang <zhanghongchen@loongson.cn>
> Signed-off-by: Hongchen Zhang <zhanghongchen@loongson.cn>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> Signed-off-by: Ming Wang <wangming01@loongson.cn>
> ---
>  arch/loongarch/mm/hugetlbpage.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/loongarch/mm/hugetlbpage.c b/arch/loongarch/mm/hugetlbpage.c
> index e4068906143b..cea84d7f2b91 100644
> --- a/arch/loongarch/mm/hugetlbpage.c
> +++ b/arch/loongarch/mm/hugetlbpage.c
> @@ -47,7 +47,7 @@ pte_t *huge_pte_offset(struct mm_struct *mm, unsigned long addr,
>  				pmd = pmd_offset(pud, addr);
>  		}
>  	}
> -	return (pte_t *) pmd;
> +	return pmd_none(pmdp_get(pmd)) ? NULL : (pte_t *) pmd;
>  }
>  
>  uint64_t pmd_to_entrylo(unsigned long pmd_val)
> -- 
> 2.43.0
> 

-- 
Peter Xu

