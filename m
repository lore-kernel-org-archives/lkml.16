Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7B12FC005
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 17:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750268496; cv=none; b=rP4vXJZjaIOFpPULkyBmdj7VzHAeY84wVi9t609BvIajdgKiHaR2s1I9WivdL/BmBwgLsWSabJ5lkc40H2W/wmTe/VKEYES8lbKhO0+I0RvnxipF9KRQ+I5jQj373MDI1LHnSzsq6l14VcFf20Xa+jmNGDs3V66AIX1coB4/Vk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750268496; c=relaxed/simple;
	bh=4TlSSp/B7+/N/ILiDxGnb+tpfbPIQ9nea0SrUYxJmrE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KVSnpGN0Rc8gnkG4+7W+nEf/LWeHBqxrPUPIPaIqdgLM+dnxiNBzs+sQU3u6T09/J0+FHBQcMuqbcicqjz6ottIsqiQ94Vq1csWKqPZQVhhhSkubONVCT2XbE1icT2P+E74Dx8YWDVnZE7AsLA6ck/DpwiIC2EpXf11fSpCGUsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=h+b4heuY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h+b4heuY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268493;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iWRDBtzd4nIP01/duk3xBYsYZViv9Z7E8J4LCipKpgg=;
	b=h+b4heuYtV06mdgrSjBxbzDl0SOHwBkh0Vyo1qMq4gLdILvFyriOzAzyZyGC8p4WC4Br3P
	fZ0X8VWBArLdBpMRM0cF5yyx8rfWMynXLq9JLHzm7UYdfO9czjnchych6zzzttqmsT42mk
	NojSlsRZcVa7VNbHiCe5AUoojE8ViMk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-18-s560JbI1MDKeo78snzmHXw-1; Wed, 18 Jun 2025 13:41:30 -0400
X-MC-Unique: s560JbI1MDKeo78snzmHXw-1
X-Mimecast-MFC-AGG-ID: s560JbI1MDKeo78snzmHXw_1750268488
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a5281ba3a4so2495888f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 10:41:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750268488; x=1750873288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iWRDBtzd4nIP01/duk3xBYsYZViv9Z7E8J4LCipKpgg=;
        b=h1yCQ1K8ES7RDp7QdwPv44QHku/Vp5/1u84+AHhWiUE83X6QFcE8pIz8yfdy1nbT6z
         MhsdNLNqlUZsWVgX+cQuWOp2vFE9BSw4EQait/jR1q5wxnRCM0lCUoq1hfOrb03qyZht
         fCk/khO7luJvwK/LBHhdNvHy7wMWWl63F/5gW1QmBLIoRyhBjrQ+OOmhXKy8TNzQ9lXv
         Qtir3f/DSGfAUDqUrUEQMU6k338Ncgq/ZP3l5Po2SXM+FoL5JlBS+yMU1O2MTxbxlxrI
         wVOkFAjnVid5zSnTTEjVMolqC4P14DDXP1DEDD0anuRStFOc1r1LSEtz4ZDQGc5GGBjF
         +Ezw==
X-Gm-Message-State: AOJu0YyU/56mdVVuABHZJKfB4y8e8pKh7Fa2YqUw82gcdRQrvczZ4Arl
	L3mOOb26Xv456V0jT57l36iWjzzGwv+fzPLsx4Bdn+NWeiNsRk+KpXZIol4y2gD/LIdujyigLTD
	RA8/3+haD1m+pHdgcjUs4aqXzlxJlK0utWQ79UCpGWoZkBnRyLTiXtYdvvS8oUl2Uc2JTRAZi/l
	wEjb3zPwwJD5vrzi7TsgaDOgFIBMr94dQ3cagAe+YAx6ROMJ0J
X-Gm-Gg: ASbGncs0tJ6ZOah1jEShgQyPAG07WDrZKjcMg7as1zTvhKlrOjHZpn7L6hhiQTTKXWE
	aG32lOvILCzG1vhstvBv+zhMIpaIih3tcu65dkHDrEH5Wbykxe5ZeRdgTL6G8SICco485zXqa4b
	+UGH05kMo6RMX2TRPLSuEArqPohS8JbZTGwF3ZUOfAiPT2V2mmFrqm9fcfNRyVRZyZNhxBdqCNM
	W54azsw0HZxMOS2PRzAOGF4eMjswRJz0HKy9He6SsbTNd1B756Tmb34R8UesBkPgIZHepXXY3mb
	CKx4uWNDowhBu0SBorPlqeJpkEy7ilF5t4L4ninUxcl+ywzWTv3Hw/0MiVzyNtpWe4l/p/lbXcV
	gH3lrOQ==
X-Received: by 2002:a5d:5f4b:0:b0:3a4:e5ea:1ac0 with SMTP id ffacd0b85a97d-3a57239782fmr14644120f8f.5.1750268488291;
        Wed, 18 Jun 2025 10:41:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHe8UrsZSiMxiNmESOiojos47BRrZtzx99uy76zavyI6JTu09cx8RaDL9RnhQyywn3/qc/sHg==
X-Received: by 2002:a5d:5f4b:0:b0:3a4:e5ea:1ac0 with SMTP id ffacd0b85a97d-3a57239782fmr14644032f8f.5.1750268487539;
        Wed, 18 Jun 2025 10:41:27 -0700 (PDT)
Received: from localhost (p200300d82f2d2400405203b5fff94ed0.dip0.t-ipconnect.de. [2003:d8:2f2d:2400:4052:3b5:fff9:4ed0])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a568b48564sm17230726f8f.82.2025.06.18.10.41.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 10:41:27 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	virtualization@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Jerrin Shaji George <jerrin.shaji-george@broadcom.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>,
	Rakie Kim <rakie.kim@sk.com>,
	Byungchul Park <byungchul@sk.com>,
	Gregory Price <gourry@gourry.net>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Minchan Kim <minchan@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Brendan Jackman <jackmanb@google.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	Xu Xin <xu.xin16@zte.com.cn>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Naoya Horiguchi <nao.horiguchi@gmail.com>,
	Oscar Salvador <osalvador@suse.de>,
	Rik van Riel <riel@surriel.com>,
	Harry Yoo <harry.yoo@oracle.com>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Shakeel Butt <shakeel.butt@linux.dev>
Subject: [PATCH RFC 26/29] mm: rename PAGE_MAPPING_* to FOLIO_MAPPING_*
Date: Wed, 18 Jun 2025 19:40:09 +0200
Message-ID: <20250618174014.1168640-27-david@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618174014.1168640-1-david@redhat.com>
References: <20250618174014.1168640-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that the mapping flags are only used for folios, let's rename the
defines.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 fs/proc/page.c             |  4 ++--
 include/linux/fs.h         |  2 +-
 include/linux/mm_types.h   |  1 -
 include/linux/page-flags.h | 20 ++++++++++----------
 include/linux/pagemap.h    |  2 +-
 mm/gup.c                   |  4 ++--
 mm/internal.h              |  2 +-
 mm/ksm.c                   |  4 ++--
 mm/rmap.c                  | 16 ++++++++--------
 mm/util.c                  |  6 +++---
 10 files changed, 30 insertions(+), 31 deletions(-)

diff --git a/fs/proc/page.c b/fs/proc/page.c
index 999af26c72985..0cdc78c0d23fa 100644
--- a/fs/proc/page.c
+++ b/fs/proc/page.c
@@ -149,7 +149,7 @@ u64 stable_page_flags(const struct page *page)
 
 	k = folio->flags;
 	mapping = (unsigned long)folio->mapping;
-	is_anon = mapping & PAGE_MAPPING_ANON;
+	is_anon = mapping & FOLIO_MAPPING_ANON;
 
 	/*
 	 * pseudo flags for the well known (anonymous) memory mapped pages
@@ -158,7 +158,7 @@ u64 stable_page_flags(const struct page *page)
 		u |= 1 << KPF_MMAP;
 	if (is_anon) {
 		u |= 1 << KPF_ANON;
-		if (mapping & PAGE_MAPPING_KSM)
+		if (mapping & FOLIO_MAPPING_KSM)
 			u |= 1 << KPF_KSM;
 	}
 
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 93ee0d2d6f1ad..f00a073c35c45 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -524,7 +524,7 @@ struct address_space {
 	/*
 	 * On most architectures that alignment is already the case; but
 	 * must be enforced here for CRIS, to let the least significant bit
-	 * of struct page's "mapping" pointer be used for PAGE_MAPPING_ANON.
+	 * of struct folio's "mapping" pointer be used for FOLIO_MAPPING_ANON.
 	 */
 
 /* XArray tags, for tagging dirty and writeback pages in the pagecache. */
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index d6b91e8a66d6d..f139f47696f63 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -105,7 +105,6 @@ struct page {
 					unsigned int order;
 				};
 			};
-			/* See page-flags.h for PAGE_MAPPING_FLAGS */
 			struct address_space *mapping;
 			union {
 				pgoff_t __folio_index;		/* Our offset within mapping. */
diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index b42986a578b71..23b1e458dfeda 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -695,10 +695,10 @@ PAGEFLAG_FALSE(VmemmapSelfHosted, vmemmap_self_hosted)
 /*
  * On an anonymous folio mapped into a user virtual memory area,
  * folio->mapping points to its anon_vma, not to a struct address_space;
- * with the PAGE_MAPPING_ANON bit set to distinguish it.  See rmap.h.
+ * with the FOLIO_MAPPING_ANON bit set to distinguish it.  See rmap.h.
  *
  * On an anonymous folio in a VM_MERGEABLE area, if CONFIG_KSM is enabled,
- * the PAGE_MAPPING_ANON_KSM bit may be set along with the PAGE_MAPPING_ANON
+ * the FOLIO_MAPPING_ANON_KSM bit may be set along with the FOLIO_MAPPING_ANON
  * bit; and then folio->mapping points, not to an anon_vma, but to a private
  * structure which KSM associates with that merged folio.  See ksm.h.
  *
@@ -713,21 +713,21 @@ PAGEFLAG_FALSE(VmemmapSelfHosted, vmemmap_self_hosted)
  * false before calling the following functions (e.g., folio_test_anon).
  * See mm/slab.h.
  */
-#define PAGE_MAPPING_ANON	0x1
-#define PAGE_MAPPING_ANON_KSM	0x2
-#define PAGE_MAPPING_KSM	(PAGE_MAPPING_ANON | PAGE_MAPPING_ANON_KSM)
-#define PAGE_MAPPING_FLAGS	(PAGE_MAPPING_ANON | PAGE_MAPPING_ANON_KSM)
+#define FOLIO_MAPPING_ANON	0x1
+#define FOLIO_MAPPING_ANON_KSM	0x2
+#define FOLIO_MAPPING_KSM	(FOLIO_MAPPING_ANON | FOLIO_MAPPING_ANON_KSM)
+#define FOLIO_MAPPING_FLAGS	(FOLIO_MAPPING_ANON | FOLIO_MAPPING_ANON_KSM)
 
 static __always_inline bool folio_test_anon(const struct folio *folio)
 {
-	return ((unsigned long)folio->mapping & PAGE_MAPPING_ANON) != 0;
+	return ((unsigned long)folio->mapping & FOLIO_MAPPING_ANON) != 0;
 }
 
 static __always_inline bool PageAnonNotKsm(const struct page *page)
 {
 	unsigned long flags = (unsigned long)page_folio(page)->mapping;
 
-	return (flags & PAGE_MAPPING_FLAGS) == PAGE_MAPPING_ANON;
+	return (flags & FOLIO_MAPPING_FLAGS) == FOLIO_MAPPING_ANON;
 }
 
 static __always_inline bool PageAnon(const struct page *page)
@@ -743,8 +743,8 @@ static __always_inline bool PageAnon(const struct page *page)
  */
 static __always_inline bool folio_test_ksm(const struct folio *folio)
 {
-	return ((unsigned long)folio->mapping & PAGE_MAPPING_FLAGS) ==
-				PAGE_MAPPING_KSM;
+	return ((unsigned long)folio->mapping & FOLIO_MAPPING_FLAGS) ==
+				FOLIO_MAPPING_KSM;
 }
 #else
 FOLIO_TEST_FLAG_FALSE(ksm)
diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index e63fbfbd5b0f3..10a222e68b851 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -502,7 +502,7 @@ static inline pgoff_t mapping_align_index(struct address_space *mapping,
 static inline bool mapping_large_folio_support(struct address_space *mapping)
 {
 	/* AS_FOLIO_ORDER is only reasonable for pagecache folios */
-	VM_WARN_ONCE((unsigned long)mapping & PAGE_MAPPING_ANON,
+	VM_WARN_ONCE((unsigned long)mapping & FOLIO_MAPPING_ANON,
 			"Anonymous mapping always supports large folio");
 
 	return mapping_max_folio_order(mapping) > 0;
diff --git a/mm/gup.c b/mm/gup.c
index 6888e871a74a9..76ef1839a126a 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2804,9 +2804,9 @@ static bool gup_fast_folio_allowed(struct folio *folio, unsigned int flags)
 		return false;
 
 	/* Anonymous folios pose no problem. */
-	mapping_flags = (unsigned long)mapping & PAGE_MAPPING_FLAGS;
+	mapping_flags = (unsigned long)mapping & FOLIO_MAPPING_FLAGS;
 	if (mapping_flags)
-		return mapping_flags & PAGE_MAPPING_ANON;
+		return mapping_flags & FOLIO_MAPPING_ANON;
 
 	/*
 	 * At this point, we know the mapping is non-null and points to an
diff --git a/mm/internal.h b/mm/internal.h
index feda91c9b3f4e..ef11d341e3915 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -150,7 +150,7 @@ static inline void *folio_raw_mapping(const struct folio *folio)
 {
 	unsigned long mapping = (unsigned long)folio->mapping;
 
-	return (void *)(mapping & ~PAGE_MAPPING_FLAGS);
+	return (void *)(mapping & ~FOLIO_MAPPING_FLAGS);
 }
 
 /*
diff --git a/mm/ksm.c b/mm/ksm.c
index 18b3690bb69ad..660a94964438f 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -893,7 +893,7 @@ static struct folio *ksm_get_folio(struct ksm_stable_node *stable_node,
 	unsigned long kpfn;
 
 	expected_mapping = (void *)((unsigned long)stable_node |
-					PAGE_MAPPING_KSM);
+					FOLIO_MAPPING_KSM);
 again:
 	kpfn = READ_ONCE(stable_node->kpfn); /* Address dependency. */
 	folio = pfn_folio(kpfn);
@@ -1070,7 +1070,7 @@ static inline void folio_set_stable_node(struct folio *folio,
 					 struct ksm_stable_node *stable_node)
 {
 	VM_WARN_ON_FOLIO(folio_test_anon(folio) && PageAnonExclusive(&folio->page), folio);
-	folio->mapping = (void *)((unsigned long)stable_node | PAGE_MAPPING_KSM);
+	folio->mapping = (void *)((unsigned long)stable_node | FOLIO_MAPPING_KSM);
 }
 
 #ifdef CONFIG_SYSFS
diff --git a/mm/rmap.c b/mm/rmap.c
index fd160ddaa9807..c8610ea772683 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -503,12 +503,12 @@ struct anon_vma *folio_get_anon_vma(const struct folio *folio)
 
 	rcu_read_lock();
 	anon_mapping = (unsigned long)READ_ONCE(folio->mapping);
-	if ((anon_mapping & PAGE_MAPPING_FLAGS) != PAGE_MAPPING_ANON)
+	if ((anon_mapping & FOLIO_MAPPING_FLAGS) != FOLIO_MAPPING_ANON)
 		goto out;
 	if (!folio_mapped(folio))
 		goto out;
 
-	anon_vma = (struct anon_vma *) (anon_mapping - PAGE_MAPPING_ANON);
+	anon_vma = (struct anon_vma *) (anon_mapping - FOLIO_MAPPING_ANON);
 	if (!atomic_inc_not_zero(&anon_vma->refcount)) {
 		anon_vma = NULL;
 		goto out;
@@ -550,12 +550,12 @@ struct anon_vma *folio_lock_anon_vma_read(const struct folio *folio,
 retry:
 	rcu_read_lock();
 	anon_mapping = (unsigned long)READ_ONCE(folio->mapping);
-	if ((anon_mapping & PAGE_MAPPING_FLAGS) != PAGE_MAPPING_ANON)
+	if ((anon_mapping & FOLIO_MAPPING_FLAGS) != FOLIO_MAPPING_ANON)
 		goto out;
 	if (!folio_mapped(folio))
 		goto out;
 
-	anon_vma = (struct anon_vma *) (anon_mapping - PAGE_MAPPING_ANON);
+	anon_vma = (struct anon_vma *) (anon_mapping - FOLIO_MAPPING_ANON);
 	root_anon_vma = READ_ONCE(anon_vma->root);
 	if (down_read_trylock(&root_anon_vma->rwsem)) {
 		/*
@@ -1334,9 +1334,9 @@ void folio_move_anon_rmap(struct folio *folio, struct vm_area_struct *vma)
 	VM_BUG_ON_FOLIO(!folio_test_locked(folio), folio);
 	VM_BUG_ON_VMA(!anon_vma, vma);
 
-	anon_vma += PAGE_MAPPING_ANON;
+	anon_vma += FOLIO_MAPPING_ANON;
 	/*
-	 * Ensure that anon_vma and the PAGE_MAPPING_ANON bit are written
+	 * Ensure that anon_vma and the FOLIO_MAPPING_ANON bit are written
 	 * simultaneously, so a concurrent reader (eg folio_referenced()'s
 	 * folio_test_anon()) will not see one without the other.
 	 */
@@ -1367,10 +1367,10 @@ static void __folio_set_anon(struct folio *folio, struct vm_area_struct *vma,
 	/*
 	 * page_idle does a lockless/optimistic rmap scan on folio->mapping.
 	 * Make sure the compiler doesn't split the stores of anon_vma and
-	 * the PAGE_MAPPING_ANON type identifier, otherwise the rmap code
+	 * the FOLIO_MAPPING_ANON type identifier, otherwise the rmap code
 	 * could mistake the mapping for a struct address_space and crash.
 	 */
-	anon_vma = (void *) anon_vma + PAGE_MAPPING_ANON;
+	anon_vma = (void *) anon_vma + FOLIO_MAPPING_ANON;
 	WRITE_ONCE(folio->mapping, (struct address_space *) anon_vma);
 	folio->index = linear_page_index(vma, address);
 }
diff --git a/mm/util.c b/mm/util.c
index 0b270c43d7d12..20bbfe4ce1b8b 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -670,9 +670,9 @@ struct anon_vma *folio_anon_vma(const struct folio *folio)
 {
 	unsigned long mapping = (unsigned long)folio->mapping;
 
-	if ((mapping & PAGE_MAPPING_FLAGS) != PAGE_MAPPING_ANON)
+	if ((mapping & FOLIO_MAPPING_FLAGS) != FOLIO_MAPPING_ANON)
 		return NULL;
-	return (void *)(mapping - PAGE_MAPPING_ANON);
+	return (void *)(mapping - FOLIO_MAPPING_ANON);
 }
 
 /**
@@ -699,7 +699,7 @@ struct address_space *folio_mapping(struct folio *folio)
 		return swap_address_space(folio->swap);
 
 	mapping = folio->mapping;
-	if ((unsigned long)mapping & PAGE_MAPPING_FLAGS)
+	if ((unsigned long)mapping & FOLIO_MAPPING_FLAGS)
 		return NULL;
 
 	return mapping;
-- 
2.49.0

