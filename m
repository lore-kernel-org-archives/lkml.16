Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF801F4CAE
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 10:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746701758; cv=none; b=tDyZq1YhgTr/Ys7NyTfSNAeUxluIMBICEUsoCzTboJHP9T09qfzYXbkUbcB7EX6z1ylcoa7cNj7xcBh9cpoT8EoS+dlpbkrH4L8Lx1J4FpZx7tjUotLMt3cFUoCZPOuifN+80dGDJW8lptQXzIbJRhgVYdJ5i0vu/OylRGu8Lt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746701758; c=relaxed/simple;
	bh=XMve2D8tLbOoJJseLLjcaSrpw61kYma40Ynn6rIG6/s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bfJrcYh0HZI7AXGwWl49OiD7tUhSZUmJo5Anyj2Hx5EQd6/eT++xH2OQGHi/TGGzQVjtSMhuL/9JydVZ28fsyzW7PwTPJKgaE6dpcbdYP53Felqq6ftok0HHL5rbmnNE9zTVffTiKFnF8zWFVn0y9Vsz/hgxqhS7C4FOufR9Ngs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XYSGJjTT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XYSGJjTT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746701754;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=QHb/wasnMtfC7lCHS4XuVZbdlC1OCesAAjufNjeLCJs=;
	b=XYSGJjTToS24MM0uO6cqvEsZrd+6ovuHFKDis0Ny9U+iaFIIdp8WO60yYuFRXoTbxH1oIh
	9kRYHWFfJbMBWkW28Tiq6NCJxSqQpw9/jzzY7RBCqCDs1onzRvXWd07+QDb8R5MXGliYUG
	qPP4vOVTX8Bkal3r6H9OVxzvc9AqIRY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-i2q-U3S_MD2jxUIG0OHFGQ-1; Thu, 08 May 2025 06:55:53 -0400
X-MC-Unique: i2q-U3S_MD2jxUIG0OHFGQ-1
X-Mimecast-MFC-AGG-ID: i2q-U3S_MD2jxUIG0OHFGQ_1746701752
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-39d9243b1c2so333947f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 03:55:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746701752; x=1747306552;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QHb/wasnMtfC7lCHS4XuVZbdlC1OCesAAjufNjeLCJs=;
        b=WJYCQDL8qTz7btOl7ES8skVAN98S83dG87zo5T2NhhczoD+1YdR0pVHOxYQ9UcEuiB
         0hrBF3WcBUhZHfcnLA+my5/8uALKDc7BNjdfUXGgtqBjo6SdPxVGHXXph4HL/4970wWI
         BsP3El8rhcQ4JfdexZCNzttK76s7CvqjiBuwHhWFPdRkAeD+8mhqCSkQ8YnkgRsx0iy0
         wLkkl4U9XfG97FUE5kZXJAiuBdHRHqgznQmmp2fFaRp1pE8MgPjpptbGgy2l4G5VGGtX
         aLAj2JyS5Iz2wROxWx8aVsgOSdF45HD2locLyugzPO+u6NLDDUVuLLjUUHRCCRWIrcNc
         ABuw==
X-Forwarded-Encrypted: i=1; AJvYcCUOzEvQW+5Ww9weBzH8yKhZFO4+Jq6AmRiWzXjN24RfLfzVtLftECZZg9Rx1uxfKdXBqKGbPLkspg3S3NI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxZqYLohNJaBC+8I2HNbsh7p5D91ddA+gG4ngks/095RYyG9Cq
	47tVJ6A3LGV/Nqzz7MEgLxmD7aTv3nyrTPaQngS1HRhWDqkC6zxLppcep9hezbVGFxnLV+NvvPj
	+ZBDo7BdwGDCved9Yw+lgXpXWIKxymQs9+cSJOJEowXf8HpP34dcOrfCQehpf/A==
X-Gm-Gg: ASbGncvNfo1kyYJCLQNs3guevv+pef71RvOa2hScHnyb/7g7jgExxfyNhq1h6/NvOD6
	xvdquoVjy+tT1qXthgnwc7sBgciyVp0xt3fiz9We6sphDs0F4R2Jn15tvXymdfb31bIrgiW3WWk
	cmjsNRbE6Oo1kISM1M7PMWkhLEa9zT5mF5r5yARZU+PTbJDCUiwR17sT0uRkA7ftlWH7NO+7IK6
	xzouSVW07qtJA7m7i8Y39R5sg3kxTqa+Mf3fNgtdY0Zg/2OecTnAkaURLnWQPWBJPHTNQOwwCkF
	H2YqE2wMgTEau5w4zNnoSdf2nBJ/uhHFT5xOINYQi+OFNLFVvaXFnThxlXTPbvWhTDo0m17d+D4
	tKZRQ+pmDpVpWXPtd3S9cCVmdxGna1CEInJ4GUZA=
X-Received: by 2002:a5d:5f49:0:b0:3a0:b930:b371 with SMTP id ffacd0b85a97d-3a0b930b4eemr3106730f8f.16.1746701752506;
        Thu, 08 May 2025 03:55:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZDWcZz8CqrDEBRyAK/U30uRKKEmwK0W4UGDucdTyL5P5bI4EfxzwEIznx9aDgEWL1TrzwIQ==
X-Received: by 2002:a5d:5f49:0:b0:3a0:b930:b371 with SMTP id ffacd0b85a97d-3a0b930b4eemr3106696f8f.16.1746701752136;
        Thu, 08 May 2025 03:55:52 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f3e:5900:27aa:5f4a:b65c:3d3c? (p200300d82f3e590027aa5f4ab65c3d3c.dip0.t-ipconnect.de. [2003:d8:2f3e:5900:27aa:5f4a:b65c:3d3c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a0b300873dsm6766886f8f.78.2025.05.08.03.55.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 03:55:51 -0700 (PDT)
Message-ID: <0979ce4e-d316-477c-872e-d3f9e47690e5@redhat.com>
Date: Thu, 8 May 2025 12:55:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] mm: Add generic helper to hint a large folio
To: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org
Cc: Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, vbabka@suse.cz,
 jannh@google.com, pfalcato@suse.de, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, peterx@redhat.com, ryan.roberts@arm.com,
 mingo@kernel.org, libang.li@antgroup.com, maobibo@loongson.cn,
 zhengqi.arch@bytedance.com, baohua@kernel.org, anshuman.khandual@arm.com,
 willy@infradead.org, ioworker0@gmail.com, yang@os.amperecomputing.com
References: <20250506050056.59250-1-dev.jain@arm.com>
 <20250506050056.59250-3-dev.jain@arm.com>
 <887fb371-409e-4dad-b4ff-38b85bfddf95@redhat.com>
 <b104b843-f12a-4382-a05f-53e2e35bdcb0@arm.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <b104b843-f12a-4382-a05f-53e2e35bdcb0@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


>> (2) Do we really need "must be part of the same folio", or could be just
>> batch over present
>> ptes that map consecutive PFNs? In that case, a helper that avoids
>> folio_pte_batch() completely
>> might be better.
>>
> I am not sure I get you here. folio_pte_batch() seems to be the simplest
> thing we can do as being done around in the code elsewhere, I am not
> aware of any alternate.

If we don't need the folio, then we can have a batching function that
doesn't require the folio.

Likely, we could even factor that (non-folio batching) out from folio_pte_batch().
The recent fix [1] might make that easier. See below.


So my question is: is something relying on all of these PTEs to point at the same folio?

[1] https://lkml.kernel.org/r/20250502215019.822-2-arkamar@atlas.cz


Something like this: (would need kerneldoc, probably remove "addr" parameter from folio_pte_batch(),
and look into other related cleanups as discussed with Andrew)


 From f56f67ee5ae9879adb99a8da37fa7ec848c4d256 Mon Sep 17 00:00:00 2001
From: David Hildenbrand <david@redhat.com>
Date: Thu, 8 May 2025 12:53:52 +0200
Subject: [PATCH] tmp

Signed-off-by: David Hildenbrand <david@redhat.com>
---
  mm/internal.h | 84 ++++++++++++++++++++++++++++-----------------------
  1 file changed, 46 insertions(+), 38 deletions(-)

diff --git a/mm/internal.h b/mm/internal.h
index 25a29872c634b..53ff8f8a7c8f9 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -217,36 +217,8 @@ static inline pte_t __pte_batch_clear_ignored(pte_t pte, fpb_t flags)
  	return pte_wrprotect(pte_mkold(pte));
  }
  
-/**
- * folio_pte_batch - detect a PTE batch for a large folio
- * @folio: The large folio to detect a PTE batch for.
- * @addr: The user virtual address the first page is mapped at.
- * @start_ptep: Page table pointer for the first entry.
- * @pte: Page table entry for the first page.
- * @max_nr: The maximum number of table entries to consider.
- * @flags: Flags to modify the PTE batch semantics.
- * @any_writable: Optional pointer to indicate whether any entry except the
- *		  first one is writable.
- * @any_young: Optional pointer to indicate whether any entry except the
- *		  first one is young.
- * @any_dirty: Optional pointer to indicate whether any entry except the
- *		  first one is dirty.
- *
- * Detect a PTE batch: consecutive (present) PTEs that map consecutive
- * pages of the same large folio.
- *
- * All PTEs inside a PTE batch have the same PTE bits set, excluding the PFN,
- * the accessed bit, writable bit, dirty bit (with FPB_IGNORE_DIRTY) and
- * soft-dirty bit (with FPB_IGNORE_SOFT_DIRTY).
- *
- * start_ptep must map any page of the folio. max_nr must be at least one and
- * must be limited by the caller so scanning cannot exceed a single page table.
- *
- * Return: the number of table entries in the batch.
- */
-static inline int folio_pte_batch(struct folio *folio, unsigned long addr,
-		pte_t *start_ptep, pte_t pte, int max_nr, fpb_t flags,
-		bool *any_writable, bool *any_young, bool *any_dirty)
+static inline int pte_batch(pte_t *start_ptep, pte_t pte, int max_nr,
+		fpb_t flags, bool *any_writable, bool *any_young, bool *any_dirty)
  {
  	pte_t expected_pte, *ptep;
  	bool writable, young, dirty;
@@ -259,14 +231,6 @@ static inline int folio_pte_batch(struct folio *folio, unsigned long addr,
  	if (any_dirty)
  		*any_dirty = false;
  
-	VM_WARN_ON_FOLIO(!pte_present(pte), folio);
-	VM_WARN_ON_FOLIO(!folio_test_large(folio) || max_nr < 1, folio);
-	VM_WARN_ON_FOLIO(page_folio(pfn_to_page(pte_pfn(pte))) != folio, folio);
-
-	/* Limit max_nr to the actual remaining PFNs in the folio we could batch. */
-	max_nr = min_t(unsigned long, max_nr,
-		       folio_pfn(folio) + folio_nr_pages(folio) - pte_pfn(pte));
-
  	nr = pte_batch_hint(start_ptep, pte);
  	expected_pte = __pte_batch_clear_ignored(pte_advance_pfn(pte, nr), flags);
  	ptep = start_ptep + nr;
@@ -300,6 +264,50 @@ static inline int folio_pte_batch(struct folio *folio, unsigned long addr,
  	return min(nr, max_nr);
  }
  
+/**
+ * folio_pte_batch - detect a PTE batch for a large folio
+ * @folio: The large folio to detect a PTE batch for.
+ * @addr: The user virtual address the first page is mapped at.
+ * @start_ptep: Page table pointer for the first entry.
+ * @pte: Page table entry for the first page.
+ * @max_nr: The maximum number of table entries to consider.
+ * @flags: Flags to modify the PTE batch semantics.
+ * @any_writable: Optional pointer to indicate whether any entry except the
+ *		  first one is writable.
+ * @any_young: Optional pointer to indicate whether any entry except the
+ *		  first one is young.
+ * @any_dirty: Optional pointer to indicate whether any entry except the
+ *		  first one is dirty.
+ *
+ * Detect a PTE batch: consecutive (present) PTEs that map consecutive
+ * pages of the same large folio.
+ *
+ * All PTEs inside a PTE batch have the same PTE bits set, excluding the PFN,
+ * the accessed bit, writable bit, dirty bit (with FPB_IGNORE_DIRTY) and
+ * soft-dirty bit (with FPB_IGNORE_SOFT_DIRTY).
+ *
+ * start_ptep must map any page of the folio. max_nr must be at least one and
+ * must be limited by the caller so scanning cannot exceed a single page table.
+ *
+ * Return: the number of table entries in the batch.
+ */
+static inline int folio_pte_batch(struct folio *folio, unsigned long addr,
+		pte_t *start_ptep, pte_t pte, int max_nr, fpb_t flags,
+		bool *any_writable, bool *any_young, bool *any_dirty)
+{
+
+	VM_WARN_ON_FOLIO(!pte_present(pte), folio);
+	VM_WARN_ON_FOLIO(!folio_test_large(folio) || max_nr < 1, folio);
+	VM_WARN_ON_FOLIO(page_folio(pfn_to_page(pte_pfn(pte))) != folio, folio);
+
+	/* Limit max_nr to the actual remaining PFNs in the folio we could batch. */
+	max_nr = min_t(unsigned long, max_nr,
+		       folio_pfn(folio) + folio_nr_pages(folio) - pte_pfn(pte));
+
+	return pte_batch(start_ptep, pte, max_nr, flags, any_writable, any_young,
+			 any_dirty);
+}
+
  /**
   * pte_move_swp_offset - Move the swap entry offset field of a swap pte
   *	 forward or backward by delta
-- 
2.49.0


-- 
Cheers,

David / dhildenb

