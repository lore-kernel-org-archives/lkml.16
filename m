Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E53B29899B
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 20:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747253986; cv=none; b=fhgaqKOQYplRi9NNEzE4hsDds+vc2K3Oj77Qra89Of9Ket27+SL0HVlMozZMVR1zNlqZ5iV+GF0IzQmU0sfeD/XvjWJaO/aBpBFK7+ZFm+PRiypMVxMKJ9Wc/8ngCWPhxrfX1OSxitXwAJFfVaqvzbze3K/2nteCigXXJI4q5M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747253986; c=relaxed/simple;
	bh=7wQ6zVnj9EKELsTAYy0JyAexEb8K5QXyOXgGjnfqHVo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WypAHIpUBZTsypF6a53e7iGNxidd8l5rzeYmuLxBbdVFRQkEIW7Z9kKGpmOOmS1htqYtX7q+A4vqnDKiZ9m0ZzVsuWx22zPxAsiY0aWcanKRb1h2tAUxOFsZY5mWygDdH0g9MHF8pkpugP+fT6ui8jcIeJRErhNzFCaX0K1c8aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AmeaeGRe; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AmeaeGRe"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-30820167b47so259918a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 13:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747253983; x=1747858783; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6yvNaKoiyhdGzQTNSpSTtFq3TIsydM+hZJJMZKRox3o=;
        b=AmeaeGReoz++osi93Qy4BfaYt2xOj0BkHx6nTvOHqX2calXOFWP+vovQKlNTj0q8jV
         d31VmPrhic8WKGvDw7ccAu67gITS5a2uTS3h8j16MCsFp8MBEKQPfxLyyKk1p3b6XVPb
         BXosGkKOyASFnqw/Wa8xjR0ln1Qe6dEkD9KNBJX6gKom+OtXEUW5/0mjkIDGUCLl8Vq3
         A8+gmWsoljKvGE2YYB8nco/JMAlra66q2Du102bWlhVMJqKx6BCybvwDEMbRs9TiQOJg
         qVZUopN49OW1CahHDFGV8R0g1Aayenz7+71UIv7XjwlFlz9L63xd+K+ZBred/C3pp18W
         pLUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747253983; x=1747858783;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6yvNaKoiyhdGzQTNSpSTtFq3TIsydM+hZJJMZKRox3o=;
        b=iNekTzz82/0ihnnr5p34vQ/e1g5IPi1wsEC8daTsq1D+npZQWH0mqAvj7iJsFEVVYr
         1Tv5zipVJ9QbNRBsbHEyuRp0B1C5Tk9KsIOZ73qArKt57IsQC2hAmi7lahfHu/ztU6Zz
         dcrh2VIbRkapShapZKG5N2fDguAaF6iqYWh6bepu/B3/V27n1yqXdXMENKbHLD3YDIrG
         D9YwxTankwPdvg8PFlrR80+zuKXtG9vaUFG85T/3CCT8DgbgnlJuyY2tofg7S9qIKszX
         vhQEUlUQGAUdpjZWVTHT06a84qxvw1CbN/+2ZJx0+Tt/AHGLJK+DC5xan0u7/n8SER36
         9Yzw==
X-Forwarded-Encrypted: i=1; AJvYcCU24AbK/tMc677chNQknjI3ZOEdCy7bPkgWz6mRUP8jUVypDa9oluTN716i0C+XzvkoNV3421GqkT7DqFo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPCZymBkR0Fn5ZJ7+3HVkFd4Q3aaDxR9EUtoFZk6Bf1ZF4Nbny
	ez3cell92PcVwCPEkPNVzFbErR8EEvzoY0405kg0Od2R/X1CO+af0QzN
X-Gm-Gg: ASbGnctXjDd2Q3rOr54INzdExtVSfFq6SKSJpgVhUqU1FViOXxYJ/+rIEXCgb5W5iuu
	eEDei/+oqEzfn+X6h4S/i2IcIjZcuQ3Jvx196y92WO0mytcfX6qaBBE00DVlh9BK7XTCyXqjOH5
	IY9A/bF4ERAawCX6q4OVN5ucMQC1BPuQAN/+60heC2QNK22MzNXElpPKxq7xz0mWqTO/svUwWf6
	3xf8gc6MRgtndY/7rgmHGk5fRb+OY9J81XJan+GPeaZJ+S0QqpgoGw7PHkv9lhsYIvrDKL7Ub7j
	sIX10yEPu2odpEHsAiVmLVEY3KlNes/QcbZVtJnFmwuEtoIP+Ms9seqsFJ/6325XrD+6poeW
X-Google-Smtp-Source: AGHT+IGzwbynZkVxEox6mUaD39pJPSF0MdkK7lxUBurI2jti1PYOMDflNME+e3xh2xNygeW7R+QKAg==
X-Received: by 2002:a17:90b:3d10:b0:30a:882f:3120 with SMTP id 98e67ed59e1d1-30e4db0fc4emr1291920a91.5.1747253983159;
        Wed, 14 May 2025 13:19:43 -0700 (PDT)
Received: from KASONG-MC4.tencent.com ([101.32.222.185])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e33401934sm2003692a91.9.2025.05.14.13.19.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 May 2025 13:19:42 -0700 (PDT)
From: Kairui Song <ryncsn@gmail.com>
To: linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	Hugh Dickins <hughd@google.com>,
	Chris Li <chrisl@kernel.org>,
	David Hildenbrand <david@redhat.com>,
	Yosry Ahmed <yosryahmed@google.com>,
	"Huang, Ying" <ying.huang@linux.alibaba.com>,
	Nhat Pham <nphamcs@gmail.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Baoquan He <bhe@redhat.com>,
	Barry Song <baohua@kernel.org>,
	Kalesh Singh <kaleshsingh@google.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Tim Chen <tim.c.chen@linux.intel.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	linux-kernel@vger.kernel.org,
	Kairui Song <kasong@tencent.com>
Subject: [PATCH 24/28] mm, swap: implement helpers for reserving data in swap table
Date: Thu, 15 May 2025 04:17:24 +0800
Message-ID: <20250514201729.48420-25-ryncsn@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514201729.48420-1-ryncsn@gmail.com>
References: <20250514201729.48420-1-ryncsn@gmail.com>
Reply-To: Kairui Song <kasong@tencent.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kairui Song <kasong@tencent.com>

To prepare for using swap table as the unified swap layer, introduce
macro and helpers for storing multiple kind of data in an swap table
entry.

Signed-off-by: Kairui Song <kasong@tencent.com>
---
 mm/swap_table.h | 130 ++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 119 insertions(+), 11 deletions(-)

diff --git a/mm/swap_table.h b/mm/swap_table.h
index 69a074339444..9356004d211a 100644
--- a/mm/swap_table.h
+++ b/mm/swap_table.h
@@ -5,9 +5,41 @@
 #include "swap.h"
 
 /*
- * Swap table entry could be a pointer (folio), a XA_VALUE (shadow), or NULL.
+ * Swap table entry type and bit layouts:
+ *
+ * NULL:     | ------------    0   -------------|
+ * Shadow:   | SWAP_COUNT |---- SHADOW_VAL ---|1|
+ * Folio:    | SWAP_COUNT |------ PFN -------|10|
+ * Pointer:  |----------- Pointer ----------|100|
+ *
+ * Usage:
+ * - NULL: Swap Entry is unused.
+ *
+ * - Shadow: Swap Entry is used and not cached (swapped out).
+ *   It's reusing XA_VALUE format to be compatible with workingset
+ *   shadows. SHADOW_VAL part could be all 0.
+ *
+ * - Folio: Swap Entry is in cache.
+ *
+ * - Pointer: Unused yet. Because only the last three bit of a pointer
+ *   is usable so now `100` is reserved for potential pointer use.
  */
 
+#define ENTRY_COUNT_BITS	BITS_PER_BYTE
+#define ENTRY_SHADOW_MARK	0b1UL
+#define ENTRY_PFN_MARK		0b10UL
+#define ENTRY_PFN_LOW_MASK	0b11UL
+#define ENTRY_PFN_SHIFT		2
+#define ENTRY_PFN_MASK		((~0UL) >> ENTRY_COUNT_BITS)
+#define ENTRY_COUNT_MASK	(~((~0UL) >> ENTRY_COUNT_BITS))
+#define ENTRY_COUNT_SHIFT	(BITS_PER_LONG - BITS_PER_BYTE)
+#define ENTRY_COUNT_MAX		((1 << ENTRY_COUNT_BITS) - 2)
+#define ENTRY_COUNT_BAD		((1 << ENTRY_COUNT_BITS) - 1) /* ENTRY_BAD */
+#define ENTRY_BAD		(~0UL)
+
+/* For shadow offset calculation */
+#define SWAP_COUNT_SHIFT	ENTRY_COUNT_BITS
+
 /*
  * Helpers for casting one type of info into a swap table entry.
  */
@@ -19,17 +51,27 @@ static inline swp_te_t null_swp_te(void)
 
 static inline swp_te_t folio_swp_te(struct folio *folio)
 {
-	BUILD_BUG_ON(sizeof(swp_te_t) != sizeof(void *));
-	swp_te_t swp_te = { .counter = (unsigned long)folio };
+	BUILD_BUG_ON((MAX_POSSIBLE_PHYSMEM_BITS - PAGE_SHIFT) >
+		     (BITS_PER_LONG - ENTRY_PFN_SHIFT - ENTRY_COUNT_BITS));
+	swp_te_t swp_te = {
+		.counter = (folio_pfn(folio) << ENTRY_PFN_SHIFT) | ENTRY_PFN_MARK
+	};
 	return swp_te;
 }
 
 static inline swp_te_t shadow_swp_te(void *shadow)
 {
-	BUILD_BUG_ON((BITS_PER_XA_VALUE + 1) !=
-		     BITS_PER_BYTE * sizeof(swp_te_t));
-	VM_WARN_ON_ONCE(shadow && !xa_is_value(shadow));
 	swp_te_t swp_te = { .counter = ((unsigned long)shadow) };
+	BUILD_BUG_ON((BITS_PER_XA_VALUE + 1) != BITS_PER_BYTE * sizeof(swp_te_t));
+	BUILD_BUG_ON((unsigned long)xa_mk_value(0) != ENTRY_SHADOW_MARK);
+	VM_WARN_ON_ONCE(shadow && !xa_is_value(shadow));
+	swp_te.counter |= ENTRY_SHADOW_MARK;
+	return swp_te;
+}
+
+static inline swp_te_t bad_swp_te(void)
+{
+	swp_te_t swp_te = { .counter = ENTRY_BAD };
 	return swp_te;
 }
 
@@ -43,7 +85,7 @@ static inline bool swp_te_is_null(swp_te_t swp_te)
 
 static inline bool swp_te_is_folio(swp_te_t swp_te)
 {
-	return !xa_is_value((void *)swp_te.counter) && !swp_te_is_null(swp_te);
+	return ((swp_te.counter & ENTRY_PFN_LOW_MASK) == ENTRY_PFN_MARK);
 }
 
 static inline bool swp_te_is_shadow(swp_te_t swp_te)
@@ -51,19 +93,63 @@ static inline bool swp_te_is_shadow(swp_te_t swp_te)
 	return xa_is_value((void *)swp_te.counter);
 }
 
+static inline bool swp_te_is_valid_shadow(swp_te_t swp_te)
+{
+	/* The shadow could be empty, just for holding the swap count */
+	return xa_is_value((void *)swp_te.counter) &&
+	       xa_to_value((void *)swp_te.counter);
+}
+
+static inline bool swp_te_is_bad(swp_te_t swp_te)
+{
+	return swp_te.counter == ENTRY_BAD;
+}
+
+static inline bool __swp_te_is_countable(swp_te_t ent)
+{
+	return (swp_te_is_shadow(ent) || swp_te_is_folio(ent) ||
+		swp_te_is_null(ent));
+}
+
 /*
  * Helpers for retrieving info from swap table.
  */
 static inline struct folio *swp_te_folio(swp_te_t swp_te)
 {
 	VM_WARN_ON(!swp_te_is_folio(swp_te));
-	return (void *)swp_te.counter;
+	return pfn_folio((swp_te.counter & ENTRY_PFN_MASK) >> ENTRY_PFN_SHIFT);
 }
 
 static inline void *swp_te_shadow(swp_te_t swp_te)
 {
 	VM_WARN_ON(!swp_te_is_shadow(swp_te));
-	return (void *)swp_te.counter;
+	return (void *)(swp_te.counter & ~ENTRY_COUNT_MASK);
+}
+
+static inline unsigned char swp_te_get_count(swp_te_t swp_te)
+{
+	VM_WARN_ON(!__swp_te_is_countable(swp_te));
+	return ((swp_te.counter & ENTRY_COUNT_MASK) >> ENTRY_COUNT_SHIFT);
+}
+
+static inline unsigned char swp_te_try_get_count(swp_te_t swp_te)
+{
+	if (__swp_te_is_countable(swp_te))
+		return swp_te_get_count(swp_te);
+	return 0;
+}
+
+static inline swp_te_t swp_te_set_count(swp_te_t swp_te,
+					unsigned char count)
+{
+	VM_BUG_ON(!__swp_te_is_countable(swp_te));
+	VM_BUG_ON(count > ENTRY_COUNT_MAX);
+
+	swp_te.counter &= ~ENTRY_COUNT_MASK;
+	swp_te.counter |= ((unsigned long)count) << ENTRY_COUNT_SHIFT;
+	VM_BUG_ON(swp_te_get_count(swp_te) != count);
+
+	return swp_te;
 }
 
 /*
@@ -87,17 +173,39 @@ static inline swp_te_t __swap_table_get(struct swap_cluster_info *ci, pgoff_t of
 static inline void __swap_table_set_folio(struct swap_cluster_info *ci, pgoff_t off,
 					  struct folio *folio)
 {
-	__swap_table_set(ci, off, folio_swp_te(folio));
+	swp_te_t swp_te;
+	unsigned char count;
+
+	swp_te = __swap_table_get(ci, off);
+	count = swp_te_get_count(swp_te);
+	swp_te = swp_te_set_count(folio_swp_te(folio), count);
+
+	__swap_table_set(ci, off, swp_te);
 }
 
 static inline void __swap_table_set_shadow(struct swap_cluster_info *ci, pgoff_t off,
 					   void *shadow)
 {
-	__swap_table_set(ci, off, shadow_swp_te(shadow));
+	swp_te_t swp_te;
+	unsigned char count;
+
+	swp_te = __swap_table_get(ci, off);
+	count = swp_te_get_count(swp_te);
+	swp_te = swp_te_set_count(shadow_swp_te(shadow), count);
+
+	__swap_table_set(ci, off, swp_te);
 }
 
 static inline void __swap_table_set_null(struct swap_cluster_info *ci, pgoff_t off)
 {
 	__swap_table_set(ci, off, null_swp_te());
 }
+
+static inline void __swap_table_set_count(struct swap_cluster_info *ci, pgoff_t off,
+					  unsigned char count)
+{
+	swp_te_t swp_te;
+	swp_te = swp_te_set_count(__swap_table_get(ci, off), count);
+	__swap_table_set(ci, off, swp_te);
+}
 #endif
-- 
2.49.0

