Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D20919CCFC
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 13:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751288452; cv=none; b=pnVlDPVbjPLmWd/kU35ayUiVZMxIkFfhktn2qjhMPoA5hgFk9ZjsRJEROjx6CfwfafQ5V3AOv17MeC3/Jm7uOtE3F+YRRcbAJoEUcBHBzWVIHUkdwLNDKxN7Y6e62PtiLvrqpFkA71VxrMrBUKHeKVnSBAEEYalcgI/cEBSPWWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751288452; c=relaxed/simple;
	bh=eiWjuQAK343S0iGCo5U1CeA1xAD7ABzULSg4BICmapk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jh/i+VgRNJn7cF5mAOzrJSGq2njtpVRGi8nsJ8tAeOnl0/QkfgMhf0YEWhv7rdf7CcifdBTEj61xLQIYdce3GhzFYhqQ67cGB9uDG/Hf1Z2VUgCatTp0FL1THKnOV93Dq1DIctQGludn0NRALoEov0cecEMP3BiDIPzorQ7MiDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=STO7u0ip; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="STO7u0ip"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288447;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZjlP0D3eY9tZf8Nb4qLq/i9Tdq3zqU6lo6GiM8rDh3E=;
	b=STO7u0ip5IVwggMYRutFBva7vjUZlVpf8g54xD9inUEG8YAzCOVP2emxWRcRhSCc/LyADY
	mmCPme0ZySC2wyfq4qWD9bzW0UUS8exKsvmn/v1T01LwQU9CZXqfEJbSXM0VFQGd/xqfaH
	CLgbIudg4rsclmN62ZtNjj1vF//Cglw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-25-MRD4eXtFMimEYyyLls0jQg-1; Mon, 30 Jun 2025 09:00:42 -0400
X-MC-Unique: MRD4eXtFMimEYyyLls0jQg-1
X-Mimecast-MFC-AGG-ID: MRD4eXtFMimEYyyLls0jQg_1751288441
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a56b3dee17so2651998f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 06:00:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751288441; x=1751893241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZjlP0D3eY9tZf8Nb4qLq/i9Tdq3zqU6lo6GiM8rDh3E=;
        b=VcIH6N5WLzeHyQBhlJkqiXqeZDMECJTVbXMgmlVpD7u5fN1it3CQLeeatA3X1E19Tw
         fJBYUpYYYHorEdvpZ5WbNIjR7dPJOOhgIDpB3eQ6SsM8+Hfzt1uZ2CedDrMJRBV5Z3Eh
         l0/niFE4HzYlb1ux7VS4eN69Pi5a8/DkMymXOOgIU3JTtrBx7mnRVQQ7uP5sRuWh/5Tc
         P9Ib6zRwHHzX5JSNqXbxHRb/osNNrJaJMgwaXYFPj9rp05bVtHZFiwTcNdZEM4T74cLa
         1ba7qYrefGuxtc8VquQafSPEaklCBME7aTwETDEqmmeU3fMuMgQzyByHz0MxTQDD7nzl
         pWdQ==
X-Gm-Message-State: AOJu0Yzazae3EO0SXAJsM/faM0nd/2RiJBnd5SvtdHbZlXfLlllFggLD
	HCG0ta4nkYCkNNsOWiWxoQycEu2soW6NK8C5S4HLL3J/qQYc1fTBbL3KfcgKgQQu+echPNhuJvP
	0Z0Qg7mVQzg6p88LWur5hHVrQls5di6hmXzFe7xA0V98YYA0C6rEMO5b580g/f/pKMsgolHUT/c
	HFook1dmVDwqGbK4UXW3ZzSHtJfPTAHp+bDkmtLL8bR7KFYl/Y
X-Gm-Gg: ASbGncvi+awUpNmoX4MzplaCmH77mX2VvcOXJ2a/P+QojhkffmQ49cNCeEAs8B/cOEz
	dAFuZAPa3bMjc+xjGGOOWMBkxnVN4dCDMCDZyoJPpHboxn59DGb1vkbtNZYit9/Yt4UevwGsppp
	tRJ06NSaETFdpLp2WFh2t7PbBCImAgqKIlW90e2Kl5eoN0QYyMAArEW5OrfLHb1Ah8Nizw1ZxXD
	46dNmfeX+b8FenDy0tjTXqGxjwVwX/3dC9v4WhjXi/VhImUrkJvkyBF55Km2ZXjy+pTmFhwUBh9
	n2WfRcpv/R7cdko3dqbKP/BWAbTQNgxFT9lCp8pz5xvDLF+bIVz8WqCMzo9+mAYpJls3fKksGiw
	gMuAp1Qc=
X-Received: by 2002:a05:6000:200e:b0:3a6:daff:9e5 with SMTP id ffacd0b85a97d-3a6f31023bdmr13743630f8f.7.1751288440773;
        Mon, 30 Jun 2025 06:00:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFaNYb3ONKvqKvr320nfpncqFiQLJi8PiPIyho0Wzz9N7dVDIemJ3QiyBdfpFdZCgx38anKxQ==
X-Received: by 2002:a05:6000:200e:b0:3a6:daff:9e5 with SMTP id ffacd0b85a97d-3a6f31023bdmr13743499f8f.7.1751288439567;
        Mon, 30 Jun 2025 06:00:39 -0700 (PDT)
Received: from localhost (p200300d82f40b30053f7d260aff47256.dip0.t-ipconnect.de. [2003:d8:2f40:b300:53f7:d260:aff4:7256])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a892e52ca4sm10445235f8f.58.2025.06.30.06.00.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 06:00:39 -0700 (PDT)
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
Subject: [PATCH v1 09/29] mm/migrate: factor out movable_ops page handling into migrate_movable_ops_page()
Date: Mon, 30 Jun 2025 14:59:50 +0200
Message-ID: <20250630130011.330477-10-david@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250630130011.330477-1-david@redhat.com>
References: <20250630130011.330477-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Let's factor it out, simplifying the calling code.

The assumption is that flush_dcache_page() is not required for
movable_ops pages: as documented for flush_dcache_folio(), it really
only applies when the kernel wrote to pagecache pages / pages in
highmem. movable_ops callbacks should be handling flushing
caches if ever required.

Note that we can now change folio_mapping_flags() to folio_test_anon()
to make it clearer, because movable_ops pages will never take that path.

Reviewed-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/migrate.c | 82 ++++++++++++++++++++++++++++------------------------
 1 file changed, 45 insertions(+), 37 deletions(-)

diff --git a/mm/migrate.c b/mm/migrate.c
index d97f7cd137e63..0898ddd2f661f 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -159,6 +159,45 @@ static void putback_movable_ops_page(struct page *page)
 	folio_put(folio);
 }
 
+/**
+ * migrate_movable_ops_page - migrate an isolated movable_ops page
+ * @page: The isolated page.
+ *
+ * Migrate an isolated movable_ops page.
+ *
+ * If the src page was already released by its owner, the src page is
+ * un-isolated (putback) and migration succeeds; the migration core will be the
+ * owner of both pages.
+ *
+ * If the src page was not released by its owner and the migration was
+ * successful, the owner of the src page and the dst page are swapped and
+ * the src page is un-isolated.
+ *
+ * If migration fails, the ownership stays unmodified and the src page
+ * remains isolated: migration may be retried later or the page can be putback.
+ *
+ * TODO: migration core will treat both pages as folios and lock them before
+ * this call to unlock them after this call. Further, the folio refcounts on
+ * src and dst are also released by migration core. These pages will not be
+ * folios in the future, so that must be reworked.
+ *
+ * Returns MIGRATEPAGE_SUCCESS on success, otherwise a negative error
+ * code.
+ */
+static int migrate_movable_ops_page(struct page *dst, struct page *src,
+		enum migrate_mode mode)
+{
+	int rc = MIGRATEPAGE_SUCCESS;
+
+	VM_WARN_ON_ONCE_PAGE(!PageIsolated(src), src);
+	/* If the page was released by it's owner, there is nothing to do. */
+	if (PageMovable(src))
+		rc = page_movable_ops(src)->migrate_page(dst, src, mode);
+	if (rc == MIGRATEPAGE_SUCCESS)
+		ClearPageIsolated(src);
+	return rc;
+}
+
 /*
  * Put previously isolated pages back onto the appropriate lists
  * from where they were once taken off for compaction/migration.
@@ -1023,51 +1062,20 @@ static int move_to_new_folio(struct folio *dst, struct folio *src,
 								mode);
 		else
 			rc = fallback_migrate_folio(mapping, dst, src, mode);
-	} else {
-		const struct movable_operations *mops;
 
-		/*
-		 * In case of non-lru page, it could be released after
-		 * isolation step. In that case, we shouldn't try migration.
-		 */
-		VM_BUG_ON_FOLIO(!folio_test_isolated(src), src);
-		if (!folio_test_movable(src)) {
-			rc = MIGRATEPAGE_SUCCESS;
-			folio_clear_isolated(src);
+		if (rc != MIGRATEPAGE_SUCCESS)
 			goto out;
-		}
-
-		mops = folio_movable_ops(src);
-		rc = mops->migrate_page(&dst->page, &src->page, mode);
-		WARN_ON_ONCE(rc == MIGRATEPAGE_SUCCESS &&
-				!folio_test_isolated(src));
-	}
-
-	/*
-	 * When successful, old pagecache src->mapping must be cleared before
-	 * src is freed; but stats require that PageAnon be left as PageAnon.
-	 */
-	if (rc == MIGRATEPAGE_SUCCESS) {
-		if (__folio_test_movable(src)) {
-			VM_BUG_ON_FOLIO(!folio_test_isolated(src), src);
-
-			/*
-			 * We clear PG_movable under page_lock so any compactor
-			 * cannot try to migrate this page.
-			 */
-			folio_clear_isolated(src);
-		}
-
 		/*
-		 * Anonymous and movable src->mapping will be cleared by
-		 * free_pages_prepare so don't reset it here for keeping
-		 * the type to work PageAnon, for example.
+		 * For pagecache folios, src->mapping must be cleared before src
+		 * is freed. Anonymous folios must stay anonymous until freed.
 		 */
-		if (!folio_mapping_flags(src))
+		if (!folio_test_anon(src))
 			src->mapping = NULL;
 
 		if (likely(!folio_is_zone_device(dst)))
 			flush_dcache_folio(dst);
+	} else {
+		rc = migrate_movable_ops_page(&dst->page, &src->page, mode);
 	}
 out:
 	return rc;
-- 
2.49.0

