Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDEC9283CAC
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 13:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749647604; cv=none; b=GxzA7HcMLGmfGiNBXmYu0jMXm85LAJCxfMuQ54jKA4H7fffgzjBZE8MVYzVIEVc0Tq3ffXl1HfDAv+RhZ7eiNJN4kqKVkEKpr8SgqLj2bSLViU6MzgqXc8dYKXPR9G4lgp7uf2wuCIb9CUdTWeuCOLpt9tQ8W3S0fNLQYSSnHE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749647604; c=relaxed/simple;
	bh=tVjWZZq7aC71e6oZeyUhcEByjY5cRYLLNLRos59IMKw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EUolueas5mJl9XX78QQAHymhj73JG+TmK6JLaewPn/pN/V3iPLFj4zgoybteKwHG4jXI4LYr4ZtYGmdXMV/VllUOZWwYngHTtx+/I424QuedPJyh3lzfFkn0av2cAS5vIV22CB9QDTjl/IVlLyMEZHJr2VsP2tHs2P7iat7i8z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hCuNIDsW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hCuNIDsW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749647601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7/yCkHIcpMtAc9OSRfJ62TeWdUDAL1/W3fcogu/NpP0=;
	b=hCuNIDsWHWFtIUhatL9ecsNr0NVLeuTdH+fE2gGhtBAzsBeDOqHGBegCsFk530JVLmOHfx
	YzFxluNL9J1bbpdNLh9aC71vMA8OfpJcTMbRpAMeWkwIPmH/JdGEx9F0a6BiCIoYmIC1GM
	6+Lqk48VWtpahlar/xWTDlCAA2PLgxw=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-52-Nmy--GifP9CiakOpbhmvXg-1; Wed, 11 Jun 2025 09:13:18 -0400
X-MC-Unique: Nmy--GifP9CiakOpbhmvXg-1
X-Mimecast-MFC-AGG-ID: Nmy--GifP9CiakOpbhmvXg_1749647598
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d38f565974so159262785a.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 06:13:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749647598; x=1750252398;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7/yCkHIcpMtAc9OSRfJ62TeWdUDAL1/W3fcogu/NpP0=;
        b=ESnJwB2gbYkl8IZJUTD3hw38wr/v/z0vgAWtKXCOsxPddVNA0wTduY1iT8sD3sFdlh
         i19xkQxxo+oOK4rgEOpQb1ijGv119sdaA3kB53bgNdgORs5/Pv3EY50rhH5dkwfbZxpr
         gzM1J5KZgKlc0JyM492WMkKCU3D9ZYL+siVyBsvDMSrUSgyDlIp8a4qaba4AXBwTTq2E
         ErMadRpLYum61ww7+NdKB69qHUfoLnmihOkblvgr0zj5xnNBMfoCjj4L/IetWUB7ov5/
         PE/UZ45f+Zy91ocn3tqPLORbNgY1o0t2wiF2RuEUh9UMpRzvOpagBQpOu+lOOPsp3W3x
         skkg==
X-Gm-Message-State: AOJu0Ywgmc3dntZyUskS0TDZW361Ds9K0EdCMbmL23vxVd/HiOL5Kxwi
	c8RzfKWbEr8QkJAuiD4DtMTc6i9EEdQ2gs/Minw+b2Siop1i2pAXe6vkE5Yz98CDlC4sHq3SYwQ
	kjH1uk8pzoHLIbccdX0xwtrUAF3fJ8lNuLdEcMwozGp+WKvxqm8fbtwvS3vd7xUqDUxa/EBvNZQ
	2sZKwgI03x5RfkRng/BZTMkdvJX16EsgP85njNJ6X8iEhpNysa
X-Gm-Gg: ASbGncvvjX8CBTbIZI3HA4x7JEu9qhYlJ3UCwTcDMPfOKW1SFb9mYpV2pRU5er/DW8c
	7fK2vyNtpwgPWu6VbwaRWo1/62mE4ZGf7uIKB7pwNu3mNhyGI3FnhMUq1a2Z/5y6WNlRItcVQ71
	YgEgSMmHeK/HHEL7J/RkrHMO/zJjR1NT0IldtRDzxEnke3Isp2pLZB4rde4Fe2EYkAeePJH4xgd
	nMPmXOwgZN0qfKnehh0F1OlU39F4zx69Bk+HwVspS/c7CczMLMCWYjRSj6tb1gWR0LzA7UcI6Ej
	ojSFBtr9/JfPycm/yY0DdcK04ZP1iRlEWkYbfLZ0LQ==
X-Received: by 2002:a05:620a:170f:b0:7d2:26b4:9a91 with SMTP id af79cd13be357-7d3a87f886amr476942485a.2.1749647598111;
        Wed, 11 Jun 2025 06:13:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHc2fImNRriWGsaw3Op67ph4lhGxj0zvCwpB17iJ/FdZgoWW5fEkHRMUQVllDHDRlj1xdpoSA==
X-Received: by 2002:a05:620a:170f:b0:7d2:26b4:9a91 with SMTP id af79cd13be357-7d3a87f886amr476933885a.2.1749647597463;
        Wed, 11 Jun 2025 06:13:17 -0700 (PDT)
Received: from localhost (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7d3901b12easm539789085a.67.2025.06.11.06.13.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 06:13:17 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	David Hildenbrand <david@redhat.com>,
	Hyesoo Yu <hyesoo.yu@samsung.com>,
	Stable@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Peter Xu <peterx@redhat.com>,
	Zhaoyang Huang <zhaoyang.huang@unisoc.com>,
	Aijun Sun <aijun.sun@unisoc.com>,
	Alistair Popple <apopple@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v1] mm/gup: Revert "mm: gup: fix infinite loop within __get_longterm_locked"
Date: Wed, 11 Jun 2025 15:13:14 +0200
Message-ID: <20250611131314.594529-1-david@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After commit 1aaf8c122918 ("mm: gup: fix infinite loop within
__get_longterm_locked") we are able to longterm pin folios that are not
supposed to get longterm pinned, simply because they temporarily have
the LRU flag cleared (esp. temporarily isolated).

For example, two __get_longterm_locked() callers can race, or
__get_longterm_locked() can race with anything else that temporarily
isolates folios.

The introducing commit mentions the use case of a driver that uses
vm_ops->fault to insert pages allocated through cma_alloc() into the
page tables, assuming they can later get longterm pinned. These pages/
folios would never have the LRU flag set and consequently cannot get
isolated. There is no known in-tree user making use of that so far,
fortunately.

To handle that in the future -- and avoid retrying forever to
isolate/migrate them -- we will need a different mechanism for the CMA
area *owner* to indicate that it actually already allocated the page and
is fine with longterm pinning it. The LRU flag is not suitable for that.

Probably we can lookup the relevant CMA area and query the bitmap; we
only have have to care about some races, probably. If already allocated,
we could just allow longterm pinning)

Anyhow, let's fix the "must not be longterm pinned" problem first by
reverting the original commit.

Fixes: 1aaf8c122918 ("mm: gup: fix infinite loop within __get_longterm_locked")
Closes: https://lore.kernel.org/all/20250522092755.GA3277597@tiffany/
Reported-by: Hyesoo Yu <hyesoo.yu@samsung.com>
Cc: <Stable@vger.kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Peter Xu <peterx@redhat.com>
Cc: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
Cc: Aijun Sun <aijun.sun@unisoc.com>
Cc: Alistair Popple <apopple@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/gup.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index e065a49842a87..3c39cbbeebef1 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2303,13 +2303,13 @@ static void pofs_unpin(struct pages_or_folios *pofs)
 /*
  * Returns the number of collected folios. Return value is always >= 0.
  */
-static void collect_longterm_unpinnable_folios(
+static unsigned long collect_longterm_unpinnable_folios(
 		struct list_head *movable_folio_list,
 		struct pages_or_folios *pofs)
 {
+	unsigned long i, collected = 0;
 	struct folio *prev_folio = NULL;
 	bool drain_allow = true;
-	unsigned long i;
 
 	for (i = 0; i < pofs->nr_entries; i++) {
 		struct folio *folio = pofs_get_folio(pofs, i);
@@ -2321,6 +2321,8 @@ static void collect_longterm_unpinnable_folios(
 		if (folio_is_longterm_pinnable(folio))
 			continue;
 
+		collected++;
+
 		if (folio_is_device_coherent(folio))
 			continue;
 
@@ -2342,6 +2344,8 @@ static void collect_longterm_unpinnable_folios(
 				    NR_ISOLATED_ANON + folio_is_file_lru(folio),
 				    folio_nr_pages(folio));
 	}
+
+	return collected;
 }
 
 /*
@@ -2418,9 +2422,11 @@ static long
 check_and_migrate_movable_pages_or_folios(struct pages_or_folios *pofs)
 {
 	LIST_HEAD(movable_folio_list);
+	unsigned long collected;
 
-	collect_longterm_unpinnable_folios(&movable_folio_list, pofs);
-	if (list_empty(&movable_folio_list))
+	collected = collect_longterm_unpinnable_folios(&movable_folio_list,
+						       pofs);
+	if (!collected)
 		return 0;
 
 	return migrate_longterm_unpinnable_folios(&movable_folio_list, pofs);
-- 
2.49.0

