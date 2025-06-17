Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211F12F5483
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 15:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750175051; cv=none; b=X2+NHNIBDbuoAl8rGx+2GmOsuaSvNtgn+JfEf0W3B+jmS0e49vMBaWV2rO/uMyFd//0J0mRKCS2xNCQzL7ztDfensUvOHSOYWgnrxt7UHj7KD6uYX1jO3sCWM6gx2DRzUs29i815gVKtGiL3Mf1eEuGhfZM+rk3etAeOe3+cgkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750175051; c=relaxed/simple;
	bh=Qesw7FWBdB790FSeVsoF7pLTin07jZCKibjTFQ1N/4o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pTLoRZn6iZZwWV7lZ8RwGoaV9/dRrGv47DmDjffkQZMVtneRHnopfjH1lQFz3YOUHdbUvkF6wAKbjoOQ5iYBMSsofPqtHfeaTsaBxDM07JxlUIcfx4XOJzRhz4TrRuHYzKCFwZul8+YAhSPebWdqpnMFW/OuibMrhNWWrt8ar1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LA5nN60J; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LA5nN60J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750175049;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u8pCpCuV3SHMatGSJCijHr+IJztx1AQFgmUpAFfOuvk=;
	b=LA5nN60J85cVeuPFax7G1hLDhovss6toL7z3FuK/B/0nfvjQEr4AYa+NzdJ5vy9PABVyfU
	69QPGC0845mH9l+dtoMA9txw8MCdt+m0xWYlEpW5qzB2xuJcask76bbacfHEvUmQMo+yAC
	xAm+o0MKmyPsXhsnA2AQOdSkHUT+WOQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-686-c1wfI6IiPn6QSncETxJxXg-1; Tue, 17 Jun 2025 11:44:08 -0400
X-MC-Unique: c1wfI6IiPn6QSncETxJxXg-1
X-Mimecast-MFC-AGG-ID: c1wfI6IiPn6QSncETxJxXg_1750175047
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-451ac1b43c4so32906885e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 08:44:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750175047; x=1750779847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u8pCpCuV3SHMatGSJCijHr+IJztx1AQFgmUpAFfOuvk=;
        b=f9mKe3UWzs6j6Qg0Cx4bxFDnU4sJKLRNx128cTohL7mZbNSY5oBUKU9W4FCOijmkQu
         5YkprACmi+kH2z23Kj3RansCma2PNE2WPGm3iK56UDk7Ls1dGibXgujgm+3tHEUlPGzm
         UWH/KLTWMC1L1zkLWEkhi9HRZp8bOGHy+Gp32sDdDYnYmE4vUO9OZcB8hkFmpgxYdBkZ
         ED9J7OQTFUp2Mpch3SNWUgD3MC4yCNtkxEqXgIm+xwfVaqTXc9tutZEYYs2gvqiyUx8J
         nX2pR6lVYsaV/vBxAZUMSbx3yXcyTjuLXSIO3zdGaHL8KKAaH4SLMqFJQFoJXyRa0Fnp
         jQqw==
X-Gm-Message-State: AOJu0YwG4LcBwA8Y8T3Q+40mCd5U8mFwi/tGRY+Qtja6OlInr/6ejg0F
	HX6JEYwYWSopOlxuf39xrLi+T1yQ6K8gjWr5gTEf/VlSNoiBtE6luw3ZHU1bqK0LRE31A/Zp7mX
	FzvVxFo6t8zjAdxAKu1yumR7Dg8hwUqAfay/c1jTXvUazOPwhCHfjmNp25mIlPBahySY5bG9ASA
	HD5WW2CqUbLV4G9FCnNohrks2Y1FNYoVMgTl6kX4m1pYnRTOJ4
X-Gm-Gg: ASbGncsXOO0dxKh8uz55MjcQEBmoRxaAD+YIo8qhFxErzn5MF8bBXHQi2EnwRH256aN
	C52ys0kQRU0XJMKezUex8gA+hdt9Q5pHFR/yxmsfTq2EylRApHaYGlGFvyGeUZ1PgCTn/WoNHjd
	/RCAitCL1RVIgyjFntes5R+RnEgmt5e0bV0JJ4y+jsG6Fn35rJIo5xPCSAbiexfxu1ZAb8iAsrL
	BJUgQCaZAej/aAN1YpOjR0FE1cWsLPy1xHWqODlZSV6IJ552AUkx1Vdo2N5myIgabmSV4PY5e+3
	1jfvMSidx8DhKvDdQVE8K3Yfs8f0vzXbXpdFXwkK8PvA2D4XD3XEaK8kEK13z67TfjXMdO3qbBJ
	85emFRw==
X-Received: by 2002:a05:6000:2c13:b0:3a5:1241:ce99 with SMTP id ffacd0b85a97d-3a5723ad5dfmr10866456f8f.24.1750175047024;
        Tue, 17 Jun 2025 08:44:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHpBD+dKVpYruKbhanJPmGuA69TQLBLGeutEiQZdQL6alvi0yDoDZEPOFHzDtmskCoeBKHRQ==
X-Received: by 2002:a05:6000:2c13:b0:3a5:1241:ce99 with SMTP id ffacd0b85a97d-3a5723ad5dfmr10866409f8f.24.1750175046528;
        Tue, 17 Jun 2025 08:44:06 -0700 (PDT)
Received: from localhost (p200300d82f3107003851c66ab6b93490.dip0.t-ipconnect.de. [2003:d8:2f31:700:3851:c66a:b6b9:3490])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a568b4e4f1sm14054457f8f.87.2025.06.17.08.44.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 08:44:06 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	nvdimm@lists.linux.dev,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Alistair Popple <apopple@nvidia.com>,
	Matthew Wilcox <willy@infradead.org>,
	Jan Kara <jack@suse.cz>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Nico Pache <npache@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>
Subject: [PATCH RFC 08/14] mm/huge_memory: mark PMD mappings of the huge zero folio special
Date: Tue, 17 Jun 2025 17:43:39 +0200
Message-ID: <20250617154345.2494405-9-david@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617154345.2494405-1-david@redhat.com>
References: <20250617154345.2494405-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The huge zero folio is refcounted (+mapcounted -- is that a word?)
differently than "normal" folios, similarly (but different) to the ordinary
shared zeropage.

For this reason, we special-case these pages in
vm_normal_page*/vm_normal_folio*, and only allow selected callers to
still use them (e.g., GUP can still take a reference on them).

vm_normal_page_pmd() already filters out the huge zero folio. However,
so far we are not marking it as special like we do with the ordinary
shared zeropage. Let's mark it as special, so we can further refactor
vm_normal_page_pmd() and vm_normal_page().

While at it, update the doc regarding the shared zero folios.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/huge_memory.c |  5 ++++-
 mm/memory.c      | 13 +++++++++----
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 92400f3baa9ff..8f03cd4e40397 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1309,6 +1309,7 @@ static void set_huge_zero_folio(pgtable_t pgtable, struct mm_struct *mm,
 {
 	pmd_t entry;
 	entry = folio_mk_pmd(zero_folio, vma->vm_page_prot);
+	entry = pmd_mkspecial(entry);
 	pgtable_trans_huge_deposit(mm, pmd, pgtable);
 	set_pmd_at(mm, haddr, pmd, entry);
 	mm_inc_nr_ptes(mm);
@@ -1418,7 +1419,9 @@ static vm_fault_t insert_pmd(struct vm_area_struct *vma, unsigned long addr,
 	if (fop.is_folio) {
 		entry = folio_mk_pmd(fop.folio, vma->vm_page_prot);
 
-		if (!is_huge_zero_folio(fop.folio)) {
+		if (is_huge_zero_folio(fop.folio)) {
+			entry = pmd_mkspecial(entry);
+		} else {
 			folio_get(fop.folio);
 			folio_add_file_rmap_pmd(fop.folio, &fop.folio->page, vma);
 			add_mm_counter(mm, mm_counter_file(fop.folio), HPAGE_PMD_NR);
diff --git a/mm/memory.c b/mm/memory.c
index 9a1acd057ce59..ef277dab69e33 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -541,7 +541,13 @@ static void print_bad_pte(struct vm_area_struct *vma, unsigned long addr,
  *
  * "Special" mappings do not wish to be associated with a "struct page" (either
  * it doesn't exist, or it exists but they don't want to touch it). In this
- * case, NULL is returned here. "Normal" mappings do have a struct page.
+ * case, NULL is returned here. "Normal" mappings do have a struct page and
+ * are ordinarily refcounted.
+ *
+ * Page mappings of the shared zero folios are always considered "special", as
+ * they are not ordinarily refcounted. However, selected page table walkers
+ * (such as GUP) can still identify these mappings and work with the
+ * underlying "struct page".
  *
  * There are 2 broad cases. Firstly, an architecture may define a pte_special()
  * pte bit, in which case this function is trivial. Secondly, an architecture
@@ -571,9 +577,8 @@ static void print_bad_pte(struct vm_area_struct *vma, unsigned long addr,
  *
  * VM_MIXEDMAP mappings can likewise contain memory with or without "struct
  * page" backing, however the difference is that _all_ pages with a struct
- * page (that is, those where pfn_valid is true) are refcounted and considered
- * normal pages by the VM. The only exception are zeropages, which are
- * *never* refcounted.
+ * page (that is, those where pfn_valid is true, except the shared zero
+ * folios) are refcounted and considered normal pages by the VM.
  *
  * The disadvantage is that pages are refcounted (which can be slower and
  * simply not an option for some PFNMAP users). The advantage is that we
-- 
2.49.0

