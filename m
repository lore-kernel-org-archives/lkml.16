Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419A41B4F0A
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 11:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750849298; cv=none; b=TbIervUK3F1sEfzPMs9gu4+ACpwxpEe8V1rxSXf3iqckXSetfML/+grCHPCbyE/YXRzpZFaLdDG2ewb2BJVx00aG+y68LN1B0c1BtqIMph+PRPigfOq3cEALHM2k/dplwh8q0eOXwuIvor4GmdBWrQLQ8t+BpDR7UeYwRiXQMpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750849298; c=relaxed/simple;
	bh=0pR9xiLr3TNGa3IpLyBgqw9P5mr1T0CNAsj1vkj871M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O303z6yTBZoW/uVUQkm8wcPPgpTigmgFPd8CK/tCjZaBlbgIFKFc/vL7QVQSgyd8o9QNLBnCKdiB+kvRwYk8Vf4mG0tom0RjnJxHdI9xqyySM0yKRmYMiVidQKhO0GFNB4YCY3RIrUUs3ZjYHmbRaPwhhf8kwF0p5Sxk6ANbaSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iJYOe+gV; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iJYOe+gV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750849296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Kz6APK9dsF4j4P9pg66c0MDK7d+JPOfYEid0r31fCbs=;
	b=iJYOe+gVvbSGesFZaibzmWcC+rIod7S1PmXbBlZhi6k0mXISNrA7ZBVdRdw0e6iSmYtU4g
	93AG9nZsgMHRrJNciF0olOnLTtw+Wq1vg8o6cYKkJniyYvuEeOS+JOfH2Zi1t3h9tuE49Z
	t9TZJxD22SRkvVihL6VMTTeVOv3GdaQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-t5o6XBdROVWyGzqta0PjIg-1; Wed, 25 Jun 2025 07:01:33 -0400
X-MC-Unique: t5o6XBdROVWyGzqta0PjIg-1
X-Mimecast-MFC-AGG-ID: t5o6XBdROVWyGzqta0PjIg_1750849292
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-450de98b28eso3908765e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 04:01:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750849292; x=1751454092;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Kz6APK9dsF4j4P9pg66c0MDK7d+JPOfYEid0r31fCbs=;
        b=R31YXGgFYgbm0NWeRzcXXndDAyz4mLjgBeZCd2/gPXwDM7Hj+uvem0DKunCO34JtNR
         phtMoNekEBEddVGuD7FjsBs0wFuR82ctMsFwR0PH2q0QfDKWGDK+aZMBMm3OpFE2qF61
         d09LKhtX4gUVQ5TVeg9AFa+MfG3Z0F4CuGNDFb8LtWuiMxEAMnjo4aTpaFj6xaYZNzca
         ngZm8b2LlhXHpwZVAAhvnTxwILqLfpQ36Wzc22VQ0WqSh5ogHePRpa2PBElCbpifmMtZ
         VndHRMGge0CKwL5weOWlZpw39+YM5dzEIFpkqn69/hMX3Kz3jxOw9+V0wrrJphbyWUV/
         ZzSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWwYJf9MZMoIXqy6Wu4IcwYHNRjIOwmZil0DwI7cOMp8po613B+xAueWjp7W7iYacE467DVMy5SX5ISVY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj/zw6fUTFOtZj8YKA6mvuHgZf8Fp1uw//JsOHBzDNh3kME/6P
	lb+gb736aKcTMdXGkfYvFsb5YBEaLuPtNGlxVdfZ9XIR2wbPJ6qJhnL7C6Gx5MFyANXqBi3mQUK
	RdOKp+qg6mJhYWXvKjPH0oKQ/rKyrLgdO1ErQVtj390KTR9HUwrh/YfwCxoT4lE7paQ==
X-Gm-Gg: ASbGnctv5z94VAH3dLzDSx0qZ2XDG+dsn7+dLkOgqpx6Ace6UcA+aR3g0KnXlpjsOfG
	3EI82Rr1Pd8oIRfLUYiU5BYyI+AQiNfc9wEaNi6w0UxOuuR5ZaljT93IUeyFECBq4Om7a9uxneY
	J/kfdDfBpApY5/LpOhvSYaDsiTWlonYlzLBww6l7RR/G4aTSc8JAN0Wt+vaWrXmSXtR+ZIEX7l5
	FX48ZMNXsxvl8mhbmMotQYB34OzHoSBfGMWsn7O1mI4Sbrp1IVC37lW1NdAcXWhgNPjLKRGzzsB
	+nC+dcpdPSQmXDTocbwuQ2MWgHdYeU19riUTRg+p/ZVJMbz+Fp8BkQMw6gnEPz3bqbOrSMUHkjw
	Q+F7IQNXv4Nk2YjrFpeXGjq/GPlHsrvq83HYrjrIjMMEZ
X-Received: by 2002:a5d:64e6:0:b0:3a4:f722:a46b with SMTP id ffacd0b85a97d-3a6e71ff6aamr6361375f8f.15.1750849291847;
        Wed, 25 Jun 2025 04:01:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPZFLBLmsDHtXRB4H5l5o76XKJEC5l5yx1gYpH977UiB1XroTTTWDmy2sKvb5kr0xD7UuyEA==
X-Received: by 2002:a5d:64e6:0:b0:3a4:f722:a46b with SMTP id ffacd0b85a97d-3a6e71ff6aamr6361311f8f.15.1750849291308;
        Wed, 25 Jun 2025 04:01:31 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f12:1b00:5d6b:db26:e2b7:12? (p200300d82f121b005d6bdb26e2b70012.dip0.t-ipconnect.de. [2003:d8:2f12:1b00:5d6b:db26:e2b7:12])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538235600csm16446145e9.20.2025.06.25.04.01.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 04:01:30 -0700 (PDT)
Message-ID: <5ba95609-302b-456a-a863-2bd5df51baf2@redhat.com>
Date: Wed, 25 Jun 2025 13:01:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] mm: Support batched unmap for lazyfree large
 folios during reclamation
To: Barry Song <21cnbao@gmail.com>, Lance Yang <lance.yang@linux.dev>
Cc: akpm@linux-foundation.org, baolin.wang@linux.alibaba.com,
 chrisl@kernel.org, kasong@tencent.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, lorenzo.stoakes@oracle.com,
 ryan.roberts@arm.com, v-songbaohua@oppo.com, x86@kernel.org,
 ying.huang@intel.com, zhengtangquan@oppo.com,
 Lance Yang <ioworker0@gmail.com>
References: <2c19a6cf-0b42-477b-a672-ed8c1edd4267@redhat.com>
 <20250624162503.78957-1-ioworker0@gmail.com>
 <27d174e0-c209-4851-825a-0baeb56df86f@redhat.com>
 <938c4726-b93e-46df-bceb-65c7574714a6@linux.dev>
 <CAGsJ_4y1GObH-C7R=FQL=UWe3kF6qhKoRqPxNPYx0k7uwocc+g@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <CAGsJ_4y1GObH-C7R=FQL=UWe3kF6qhKoRqPxNPYx0k7uwocc+g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25.06.25 12:57, Barry Song wrote:
>>>
>>> Note that I don't quite understand why we have to batch the whole thing
>>> or fallback to
>>> individual pages. Why can't we perform other batches that span only some
>>> PTEs? What's special
>>> about 1 PTE vs. 2 PTEs vs. all PTEs?
>>
>> That's a good point about the "all-or-nothing" batching logic ;)
>>
>> It seems the "all-or-nothing" approach is specific to the lazyfree use
>> case, which needs to unmap the entire folio for reclamation. If that's
>> not possible, it falls back to the single-page slow path.
> 
> Other cases advance the PTE themselves, while try_to_unmap_one() relies
> on page_vma_mapped_walk() to advance the PTE. Unless we want to manually
> modify pvmw.pte and pvmw.address outside of page_vma_mapped_walk(), which
> to me seems like a violation of layers. :-)

Please explain to me why the following is not clearer and better:

diff --git a/mm/rmap.c b/mm/rmap.c
index 8200d705fe4ac..09e2c2f28aa58 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1845,23 +1845,31 @@ void folio_remove_rmap_pud(struct folio *folio, struct page *page,
  #endif
  }
  
-/* We support batch unmapping of PTEs for lazyfree large folios */
-static inline bool can_batch_unmap_folio_ptes(unsigned long addr,
-                       struct folio *folio, pte_t *ptep)
+static inline unsigned int folio_unmap_pte_batch(struct folio *folio,
+               struct page_vma_mapped_walk *pvmw, enum ttu_flags flags,
+               pte_t pte)
  {
         const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
-       int max_nr = folio_nr_pages(folio);
-       pte_t pte = ptep_get(ptep);
+       struct vm_area_struct *vma = pvmw->vma;
+       unsigned long end_addr, addr = pvmw->address;
+       unsigned int max_nr;
+
+       if (flags & TTU_HWPOISON)
+               return 1;
+       if (!folio_test_large(folio))
+               return 1;
+
+       /* We may only batch within a single VMA and a single page table. */
+       end_addr = min_t(unsigned long, ALIGN(addr + 1, PMD_SIZE), vma->vm_end);
+       max_nr = (end_addr - addr) >> PAGE_SHIFT;
  
+       /* We only support lazyfree batching for now ... */
         if (!folio_test_anon(folio) || folio_test_swapbacked(folio))
-               return false;
+               return 1;
         if (pte_unused(pte))
-               return false;
-       if (pte_pfn(pte) != folio_pfn(folio))
-               return false;
-
-       return folio_pte_batch(folio, addr, ptep, pte, max_nr, fpb_flags, NULL,
-                              NULL, NULL) == max_nr;
+               return 1;
+       return folio_pte_batch(folio, addr, pvmw->pte, pte, max_nr, fpb_flags,
+                              NULL, NULL, NULL);
  }
  
  /*
@@ -2024,9 +2032,7 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
                         if (pte_dirty(pteval))
                                 folio_mark_dirty(folio);
                 } else if (likely(pte_present(pteval))) {
-                       if (folio_test_large(folio) && !(flags & TTU_HWPOISON) &&
-                           can_batch_unmap_folio_ptes(address, folio, pvmw.pte))
-                               nr_pages = folio_nr_pages(folio);
+                       nr_pages = folio_unmap_pte_batch(folio, &pvmw, flags, pteval);
                         end_addr = address + nr_pages * PAGE_SIZE;
                         flush_cache_range(vma, address, end_addr);


-- 
Cheers,

David / dhildenb

