Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642EF2F6FA0
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 10:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751624773; cv=none; b=b0mdINI+MHn++XTKKkMit6x0th0NbjYHQpH2frwsSxfLZlT3PrgGI2rN56jL7dXOI9olrCAnth3xO+r8x+TWI3qo2dM+C/dhPntUs2c5MqswsGsRwSPmz3s8745hZyc7OIROAVeWHnG1/3wNwRfmgBY/UNK1mr4isgL9wi8vUAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751624773; c=relaxed/simple;
	bh=9ampJPvcNYsRFz7oDnoiAgEw+Je4opPgPkQZSBZIrqY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T5MWX9i/VztwiDAexR/odICEDmmILf00BHTlq3mpQlZ5iYTLDJoD/MDoyL9905lcGUdH+AoexBqwmKi5gur4ebVB+bnk+p7UtyS2yIIWjbJ1CLtZwT+neSCuHZQW23HV6fCVodQhA8meIe2zH57k7XRkRRTAgZY5xx7SQnL04Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QHk83vAZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QHk83vAZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751624771;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0v9UDDMP4rF7Dl8ADVUR+GZMZCj14eHRzzjvBkF5+v8=;
	b=QHk83vAZ4Bhzk3MSce4ERV7y+dXpc3I3es3aXdZnol45asWicUdRZbo3C86+Xers01heCJ
	4A/4zcO32iyN78i+ODQCw5We+TbD0SfxESygA8zwb4Jw+OXTIRIjP96jaGHkNNgixO6NIH
	Fp0MQfhQnYfyxbfrsw7UbwPkj3zt99M=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-342-6rxs7wTWMuSxnG2GuoTsyw-1; Fri, 04 Jul 2025 06:26:10 -0400
X-MC-Unique: 6rxs7wTWMuSxnG2GuoTsyw-1
X-Mimecast-MFC-AGG-ID: 6rxs7wTWMuSxnG2GuoTsyw_1751624769
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3b39cc43f15so440014f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 03:26:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751624769; x=1752229569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0v9UDDMP4rF7Dl8ADVUR+GZMZCj14eHRzzjvBkF5+v8=;
        b=Hsqg464uActAYILbDT8cIz2uj+5qp6/Jpl2Wlg0HNeWdG+uOrfSjbznOs97r865sEc
         wiZ2qFHchfSS0yFfnvWbvYvsKoI6noJ7k4WV2sOc+uqPCYit4r8ZyfNINtQ1SJaH2qos
         GOv/+o/y864MgkuGVC6th9/yVZHpkGf5ewpKZwLhWJL9sZh+9tsd8cqmRr3UjHweiOOn
         gVVcMyv5kIx5FVoEW6/Yj7c4dLK6C/3v9lCl5u92EQUMB1Eu03dSLvOBeK/lH51mmPaV
         ftNZ76fcOgKd0b9FwdG59n8fRgv3udK8SPrREBr4beQEkNvluL2eO3bZel66mlLQt+/C
         FrdA==
X-Gm-Message-State: AOJu0YyTiN4v/Y0XXEUywNXV1UXqI9QZM7YjhnkNGfJb1wLhsS2kVriq
	E2h+y0n3b7staxHacUov5KChVaiNzsUrWs8zpdjeY+Fcg/dLWic6yzNgXLSq3K8OmOuEhCEl4Ys
	pwzszfOwIaBcQgc8E/KELrH6EKgQCj4gK1l8Vg7DDHIzycW9kuq6/FkR5p/jw8ovjoY35JUp1tY
	RA4aUgXNzjT8JhJ85PC69bFL8S5gbHI1jpNoT+Tah4ztjQ7g==
X-Gm-Gg: ASbGnct67v92l+a8O2u4Bd0/xhGrvVELMhooLpwz1JuaqJBCYaEvcDZDsn/ABrW5iWv
	H0+GD2BKxkgmTCxHyGUqUi1avwJxa/iK0cgo0r0xFjMEerfdTTOzRGuVkirGQAj4WMAYWwgxg7A
	hoV3CL0txXa+s2VCBBvrTelKXjdACFSbr0ubZWlTk4/5a2MolivaVe7BgRlv2FzYpJc5Abyafvb
	4+o/VBkidibLFYiBWtFddTcA4tJNv3VuMz+BDWSyaFAkpWOCqZs4yxJXQQkfj1L4BvVSQar/0RX
	egmpB/JspiV2UqgQqF1jWS1JwgDaWeS7mtJySp30yLI/JXtocwVhwLwohjO12EVH8XDKaCrlDbe
	Mn/F3ew==
X-Received: by 2002:a05:6000:1a88:b0:3b4:58ff:ed1 with SMTP id ffacd0b85a97d-3b4966267b8mr1677220f8f.52.1751624769205;
        Fri, 04 Jul 2025 03:26:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOt865rvlOHIOEECbMk+LvbVs6qEWcN/5MI9jLz/1+4Qw68QFcrUmFxGowYoL4Q/9NBp5iRA==
X-Received: by 2002:a05:6000:1a88:b0:3b4:58ff:ed1 with SMTP id ffacd0b85a97d-3b4966267b8mr1677111f8f.52.1751624768501;
        Fri, 04 Jul 2025 03:26:08 -0700 (PDT)
Received: from localhost (p200300d82f2c5500098823f9faa07232.dip0.t-ipconnect.de. [2003:d8:2f2c:5500:988:23f9:faa0:7232])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b47285c90esm2150789f8f.91.2025.07.04.03.26.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 03:26:07 -0700 (PDT)
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
Subject: [PATCH v2 14/29] mm/migrate: remove __ClearPageMovable()
Date: Fri,  4 Jul 2025 12:25:08 +0200
Message-ID: <20250704102524.326966-15-david@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250704102524.326966-1-david@redhat.com>
References: <20250704102524.326966-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Unused, let's remove it.

The Chinese docs in Documentation/translations/zh_CN/mm/page_migration.rst
still mention it, but that whole docs is destined to get outdated and
updated by somebody that actually speaks that language.

Reviewed-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Harry Yoo <harry.yoo@oracle.com>
Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/migrate.h |  8 ++------
 mm/compaction.c         | 11 -----------
 2 files changed, 2 insertions(+), 17 deletions(-)

diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index c99a00d4ca27d..6eeda8eb1e0d8 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -35,8 +35,8 @@ struct migration_target_control;
  * @src page.  The driver should copy the contents of the
  * @src page to the @dst page and set up the fields of @dst page.
  * Both pages are locked.
- * If page migration is successful, the driver should call
- * __ClearPageMovable(@src) and return MIGRATEPAGE_SUCCESS.
+ * If page migration is successful, the driver should
+ * return MIGRATEPAGE_SUCCESS.
  * If the driver cannot migrate the page at the moment, it can return
  * -EAGAIN.  The VM interprets this as a temporary migration failure and
  * will retry it later.  Any other error value is a permanent migration
@@ -106,16 +106,12 @@ static inline int migrate_huge_page_move_mapping(struct address_space *mapping,
 #ifdef CONFIG_COMPACTION
 bool PageMovable(struct page *page);
 void __SetPageMovable(struct page *page, const struct movable_operations *ops);
-void __ClearPageMovable(struct page *page);
 #else
 static inline bool PageMovable(struct page *page) { return false; }
 static inline void __SetPageMovable(struct page *page,
 		const struct movable_operations *ops)
 {
 }
-static inline void __ClearPageMovable(struct page *page)
-{
-}
 #endif
 
 static inline
diff --git a/mm/compaction.c b/mm/compaction.c
index 17455c5a4be05..889ec696ba96a 100644
--- a/mm/compaction.c
+++ b/mm/compaction.c
@@ -137,17 +137,6 @@ void __SetPageMovable(struct page *page, const struct movable_operations *mops)
 }
 EXPORT_SYMBOL(__SetPageMovable);
 
-void __ClearPageMovable(struct page *page)
-{
-	VM_BUG_ON_PAGE(!PageMovable(page), page);
-	/*
-	 * This page still has the type of a movable page, but it's
-	 * actually not movable any more.
-	 */
-	page->mapping = (void *)PAGE_MAPPING_MOVABLE;
-}
-EXPORT_SYMBOL(__ClearPageMovable);
-
 /* Do not skip compaction more than 64 times */
 #define COMPACT_MAX_DEFER_SHIFT 6
 
-- 
2.49.0

