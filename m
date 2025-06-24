Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B7A182BC
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 16:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750782434; cv=none; b=a3PkRulRWsA3jPG1Bl82ltQHRk4KGa0ZQBbISRG03Z/KmAacRMNUox09KprErUzGPjME/mufBQ5xvGK3dB3G4WIabWZoGCvZ3Ll2FSSd1suVl1npeeCRz8Qsi4bkmuIYM/GRqyle5MErVEQwsVEpRgm+vMXeCw1lglHpowybl4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750782434; c=relaxed/simple;
	bh=3dXFzJ7BV0TyRc/wrutR3s3QNZNNhAWckfIpYqYBPdo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KQGCuzZ7oc11G7rZj34F8abzaSdQ/SDn30ZC9+v1JKXs6QzwrhMQQp4jOMNiX4xovTL4TISLayZnJ2s+dBPRCZAeYfVcCDVGIEewbADum2kLPE5lpEmPKjCBwo5iRLDLKPrU/Gk1CpBeW2fjHMe5msHu3A4qI/5KAMsjFQNcd5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ni7GY2O0; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ni7GY2O0"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a6cdc27438so4751847f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 09:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750782430; x=1751387230; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vfQI9Zp3u7xxHzx8USFneWg+7J0GkvoymFFOyqkhxfc=;
        b=Ni7GY2O0QYk81RJwFkvKqHRF03+qwC/mQpg4Qv/v7eCHyikRKglXYBdOSApfX3AwOi
         w7fSeyNJQgsUEpxMN3j6C0z4bkPz9Q+WoJgTXas9lqFxoo0D3Vn2mQLwq2iiOC3/x8ti
         XTpmkJUD90AFSdGWt/uJAZlWM5GIz2hyEayib7w4WCV6ALzCjcRc41C+Jw/BGTsQeVMx
         k1r28abXHzo0VJK/zQmWixaw7PfnSgqS8b+X2fFYqYw1qoM74iCIcUAxtoAfqRsSeH8Z
         GFwT1eOGhhjfsYVK8q7IzvQz8u1k6kB4/gp4zoK8Pb3UVCQSw2eIaeBUZGm5LHp4rza4
         ECyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750782430; x=1751387230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vfQI9Zp3u7xxHzx8USFneWg+7J0GkvoymFFOyqkhxfc=;
        b=Ud+JLUWudtos16vgG5+fUlCyqBcXyZZwM6A90RjEGBtOoE6QRy8+VkAjY8uhOkqDWa
         P9WSYQDaJGo7aVawtltm0dbzljDjYxuOeXU61Z7oZP7+L8hwsnSSeAUm2uf9vqZwtOHn
         6uayApFgvSkOrqf5+vy7HDz1OTuQuELpr5jNcZ6BWEHL/KIzoFxqtx9YRe4JtpWvFwC1
         SA8xoMc5Dz+2Cas3Yk1etNyVCWHjkFDAzHWr/1lAA0jE5+jQKRVw8HWPkRhsV2IBV30/
         2EGBjA9+/uI314UzXt8l0bhPPhUEHQavxYE2PU3tKK/CiixvfQHItdV2DYpe1cyfr54s
         2Smw==
X-Forwarded-Encrypted: i=1; AJvYcCWDz5rRfawE0yH5GRuqnNKLBSwn1XBhqktufJiy2nd0TDwb8C1Nymz6+jLNo3y/ThEE6lxj6wNrDhvh8I4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywxdu0a9mVMIKfWoHWCMvFY1MjDPW8dkpbUz9tE8indF489ICPn
	vG0yJkHrU+IRSsAveqtZNtV+PrBhyOAu2CAg2ee8g1Xxll9E3HpVd7Vk
X-Gm-Gg: ASbGncsTos4LmlGELdvL9yoK6amHydEDhI385xEouLHJuayl4/V/JOEyz2+6P3HVwrP
	CJ0HVMintaEqGF/HmYAEPebhtqzvVnIF33FwzHa8tQTB7td6KvNMuJRhoXOLRNzmKLfEya0Ixoa
	G+1MC5PKf1f1fVo/l4agNYzotvCucrJqF/OfeHLotD+p+X8TKMMkW7GugL8YyRt2OA50G1F75PZ
	29ZsDCCH24LcfoHosch0CH+CCOZG3gg+zHA9muyoLHBqhXbFvZewtJybT7g35tRBkKzO9ptXF7M
	GNDlw0e46Zl2hliLW2xHiBIDat6wGZY68MFviWTHQTrakCPR9Q==
X-Google-Smtp-Source: AGHT+IGjHJmY+eS3Ezzzmmv0iIiNJG0AeJ4sIzX9fod1PSWFl8jor/RhAVVtop+K7gu3E2hIu7gfhA==
X-Received: by 2002:a05:6000:4a16:b0:3a4:ee3f:e9a6 with SMTP id ffacd0b85a97d-3a6d1331fd2mr14561131f8f.54.1750782430437;
        Tue, 24 Jun 2025 09:27:10 -0700 (PDT)
Received: from localhost.localdomain ([2a09:0:1:2::305a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e805175asm2267875f8f.20.2025.06.24.09.27.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Jun 2025 09:27:10 -0700 (PDT)
From: Lance Yang <ioworker0@gmail.com>
To: david@redhat.com
Cc: 21cnbao@gmail.com,
	akpm@linux-foundation.org,
	baolin.wang@linux.alibaba.com,
	chrisl@kernel.org,
	ioworker0@gmail.com,
	kasong@tencent.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	lorenzo.stoakes@oracle.com,
	ryan.roberts@arm.com,
	v-songbaohua@oppo.com,
	x86@kernel.org,
	ying.huang@intel.com,
	zhengtangquan@oppo.com
Subject: Re: [PATCH v4 3/4] mm: Support batched unmap for lazyfree large folios during reclamation
Date: Wed, 25 Jun 2025 00:25:03 +0800
Message-ID: <20250624162503.78957-1-ioworker0@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <2c19a6cf-0b42-477b-a672-ed8c1edd4267@redhat.com>
References: <2c19a6cf-0b42-477b-a672-ed8c1edd4267@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 2025/6/24 23:34, David Hildenbrand wrote:
> On 24.06.25 17:26, Lance Yang wrote:
>> On 2025/6/24 20:55, David Hildenbrand wrote:
>>> On 14.02.25 10:30, Barry Song wrote:
>>>> From: Barry Song <v-songbaohua@oppo.com>
>> [...]
>>>> diff --git a/mm/rmap.c b/mm/rmap.c
>>>> index 89e51a7a9509..8786704bd466 100644
>>>> --- a/mm/rmap.c
>>>> +++ b/mm/rmap.c
>>>> @@ -1781,6 +1781,25 @@ void folio_remove_rmap_pud(struct folio *folio,
>>>> struct page *page,
>>>>    #endif
>>>>    }
>>>> +/* We support batch unmapping of PTEs for lazyfree large folios */
>>>> +static inline bool can_batch_unmap_folio_ptes(unsigned long addr,
>>>> +            struct folio *folio, pte_t *ptep)
>>>> +{
>>>> +    const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>>>> +    int max_nr = folio_nr_pages(folio);
>>>
>>> Let's assume we have the first page of a folio mapped at the last page
>>> table entry in our page table.
>>
>> Good point. I'm curious if it is something we've seen in practice ;)
> 
> I challenge you to write a reproducer :P I assume it might be doable 
> through simple mremap().
> 
>>
>>>
>>> What prevents folio_pte_batch() from reading outside the page table?
>>
>> Assuming such a scenario is possible, to prevent any chance of an
>> out-of-bounds read, how about this change:
>>
>> diff --git a/mm/rmap.c b/mm/rmap.c
>> index fb63d9256f09..9aeae811a38b 100644
>> --- a/mm/rmap.c
>> +++ b/mm/rmap.c
>> @@ -1852,6 +1852,25 @@ static inline bool 
>> can_batch_unmap_folio_ptes(unsigned long addr,
>>       const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>>       int max_nr = folio_nr_pages(folio);
>>       pte_t pte = ptep_get(ptep);
>> +    unsigned long end_addr;
>> +
>> +    /*
>> +     * To batch unmap, the entire folio's PTEs must be contiguous
>> +     * and mapped within the same PTE page table, which corresponds to
>> +     * a single PMD entry. Before calling folio_pte_batch(), which does
>> +     * not perform boundary checks itself, we must verify that the
>> +     * address range covered by the folio does not cross a PMD boundary.
>> +     */
>> +    end_addr = addr + (max_nr * PAGE_SIZE) - 1;
>> +
>> +    /*
>> +     * A fast way to check for a PMD boundary cross is to align both
>> +     * the start and end addresses to the PMD boundary and see if they
>> +     * are different. If they are, the range spans across at least two
>> +     * different PMD-managed regions.
>> +     */
>> +    if ((addr & PMD_MASK) != (end_addr & PMD_MASK))
>> +        return false;
> 
> You should not be messing with max_nr = folio_nr_pages(folio) here at 
> all. folio_pte_batch() takes care of that.
> 
> Also, way too many comments ;)
> 
> You may only batch within a single VMA and within a single page table.
> 
> So simply align the addr up to the next PMD, and make sure it does not 
> exceed the vma end.
> 
> ALIGN and friends can help avoiding excessive comments.

Thanks! How about this updated version based on your suggestion:

diff --git a/mm/rmap.c b/mm/rmap.c
index fb63d9256f09..241d55a92a47 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1847,12 +1847,25 @@ void folio_remove_rmap_pud(struct folio *folio, struct page *page,
 
 /* We support batch unmapping of PTEs for lazyfree large folios */
 static inline bool can_batch_unmap_folio_ptes(unsigned long addr,
-			struct folio *folio, pte_t *ptep)
+					      struct folio *folio, pte_t *ptep,
+					      struct vm_area_struct *vma)
 {
 	const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
+	unsigned long next_pmd, vma_end, end_addr;
 	int max_nr = folio_nr_pages(folio);
 	pte_t pte = ptep_get(ptep);
 
+	/*
+	 * Limit the batch scan within a single VMA and within a single
+	 * page table.
+	 */
+	vma_end = vma->vm_end;
+	next_pmd = ALIGN(addr + 1, PMD_SIZE);
+	end_addr = addr + (unsigned long)max_nr * PAGE_SIZE;
+
+	if (end_addr > min(next_pmd, vma_end))
+		return false;
+
 	if (!folio_test_anon(folio) || folio_test_swapbacked(folio))
 		return false;
 	if (pte_unused(pte))
@@ -2025,7 +2038,7 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 				folio_mark_dirty(folio);
 		} else if (likely(pte_present(pteval))) {
 			if (folio_test_large(folio) && !(flags & TTU_HWPOISON) &&
-			    can_batch_unmap_folio_ptes(address, folio, pvmw.pte))
+			    can_batch_unmap_folio_ptes(address, folio, pvmw.pte, pvmw.vma))
 				nr_pages = folio_nr_pages(folio);
 			end_addr = address + nr_pages * PAGE_SIZE;
 			flush_cache_range(vma, address, end_addr);
--
Thanks,
Lance
