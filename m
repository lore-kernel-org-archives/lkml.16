Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421A12FC002
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 17:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750268497; cv=none; b=GQVFuZLrVfZ6oPunAbaiRNOEdOOHPJiEJ5asI9YFItKeG36g6fkkN6hbevmjbr6KH3tDp/mDAEep0310Xx7AOU7O1tIrfVZWhDsDjMQ5MULJjuLIieh2wUoUA6PYkJxWxaOrQOrsC+yT3B3pWnfaKOy6bubZRtArYAOh7mkWQfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750268497; c=relaxed/simple;
	bh=qANw5s/Bw3QCvq7BlzvxZffSRQGWJpFueQvB/Dfqsvw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=msb4ZQoac4ldfcbrMTpt4Xbq49aDw4RAyJ70y33xWEyRcEGemMyMzqnM20xMloKk2ZHv9tPH3pwhGoKltz+UNOVMtVOhFIpIypu6VsPalI19+QV1b7kgo7dWWbDv5iTcwnPhOYzZyAAInR5C4HyctAKo7anCspueWLyTe0u6w8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Bv5ZI2eQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Bv5ZI2eQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268493;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OmfdwaP0f5XUY3WcVBI8N3swmSiQtYBlwUFmuX0ZYxw=;
	b=Bv5ZI2eQ/dGldGwaua9XQhxpnfr9C51HJjG77T68zXscE04eMToqCfntF30JA1g3NGGodO
	8GFji0uuOp+cMLD0k2g9Rz+Rw0VeTCkjpTK2+/EGsXornRnKd2UloKg6qDCedeGLUa8qkZ
	ekTJ2z4TxZptLhl0LpNjTlmcUDlhem8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-462-KEXdgAFsNIulMDxGQCDfVQ-1; Wed, 18 Jun 2025 13:41:32 -0400
X-MC-Unique: KEXdgAFsNIulMDxGQCDfVQ-1
X-Mimecast-MFC-AGG-ID: KEXdgAFsNIulMDxGQCDfVQ_1750268491
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a4f8192e2cso3545473f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 10:41:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750268491; x=1750873291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OmfdwaP0f5XUY3WcVBI8N3swmSiQtYBlwUFmuX0ZYxw=;
        b=rj7SAf96c4XqPhm0UDjruTz1Kf6ZIdBeV1NcNqq2QP2q3h5ySAyKdqTFN3uhQsOWAk
         IdZdfgI92t21oDf25cXHjLACI1LluseZWewpvIngaHpC+T1zkrRcubiWlfrPxaZpztG1
         +Tx7wg8e2g8M8fQOaqW9HhmDmu1hbOS6+OK+I6XPE23kCEml/tTbQDNTnFlgGHtHy/3C
         0tOtActEAtJx/BhsMpZ6NxVvydn2op+Xod5+bINfg3Qb3G4FP6Lk+8LduElHMmRsNY1y
         Z+f0s+jwxDmJpcLr0nIoL1gYNhRxDmSDlVLNrMS+z1tzBiu9AqTvsHEFjc3Fj2c2+MyW
         thOg==
X-Gm-Message-State: AOJu0YyIcaXtvjGzklo6mefMS8TzutljNh082WoOlDQytTTHWKSkBS+B
	LtNDG8cCTXj0oSUnfKQYxcoTJYLu0LENWToiXN5WCyFYwHJskZrPajtJUKJ13PI5amKOREtLfjP
	2nbUBg2SpxepSqAtFsMCc0Vw32ic9Bk3QV7TJGQ3WAyB0tA8GAjrk1mgkvrStbMP8UUqn3VwMJW
	Lj3L1OtyvsdCFxmlk6Di4Mlf+ZxLuB0J+4APbbY05Qj81Qqo+K
X-Gm-Gg: ASbGncvNqwr1pA92zI7V3s1XoXaTwL7aFo9f0+iqWPolwLQF1wfgRr5TB6bmCfBcPIr
	FHvr7EJ9XbtOPyx3vZ+8dP9optzZ2n/VU+Q7GCCrql6JVT0dLtaJguj+xATWHtcNQlEa87+XeXk
	wmLFrH4XS/cUh61rU5kvnH7Z1+UXS0jPqbdl1uxckzb2De4eFHlO+9w7fM7w4MRmD9dKMMuFM/9
	JyEWfKNxu6L8HLfalNaM8xqA8nmTeaqQBZnk+VMz6/wvsOYEcXPGE5PV9RMMSRPRMAcDJ83mwBO
	biSmuAaHtWTVTg7xyNegE6xuYutmS73wgg4GVer2rTOEuesACdzhmtwwXiS3B4AtIOFQ0+Aaf9C
	yZ0gxmg==
X-Received: by 2002:a05:6000:178b:b0:3a5:21c8:af31 with SMTP id ffacd0b85a97d-3a5723721bdmr15240252f8f.16.1750268490904;
        Wed, 18 Jun 2025 10:41:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAZhpZh4slqbXf6Y+7KOO1SPenqI87LsZpqVnArN4AUioCPUgU259IOTbkkNjhv6BPhqHLFQ==
X-Received: by 2002:a05:6000:178b:b0:3a5:21c8:af31 with SMTP id ffacd0b85a97d-3a5723721bdmr15240182f8f.16.1750268490320;
        Wed, 18 Jun 2025 10:41:30 -0700 (PDT)
Received: from localhost (p200300d82f2d2400405203b5fff94ed0.dip0.t-ipconnect.de. [2003:d8:2f2d:2400:4052:3b5:fff9:4ed0])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a568b2f80asm17518051f8f.78.2025.06.18.10.41.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 10:41:29 -0700 (PDT)
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
Subject: [PATCH RFC 27/29] docs/mm: convert from "Non-LRU page migration" to "movable_ops page migration"
Date: Wed, 18 Jun 2025 19:40:10 +0200
Message-ID: <20250618174014.1168640-28-david@redhat.com>
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

Let's bring the docs up-to-date.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 Documentation/mm/page_migration.rst | 39 ++++++++++++++++++++---------
 1 file changed, 27 insertions(+), 12 deletions(-)

diff --git a/Documentation/mm/page_migration.rst b/Documentation/mm/page_migration.rst
index 519b35a4caf5b..a448e95e0a98e 100644
--- a/Documentation/mm/page_migration.rst
+++ b/Documentation/mm/page_migration.rst
@@ -146,18 +146,33 @@ Steps:
 18. The new page is moved to the LRU and can be scanned by the swapper,
     etc. again.
 
-Non-LRU page migration
-======================
-
-Although migration originally aimed for reducing the latency of memory
-accesses for NUMA, compaction also uses migration to create high-order
-pages.  For compaction purposes, it is also useful to be able to move
-non-LRU pages, such as zsmalloc and virtio-balloon pages.
-
-If a driver wants to make its pages movable, it should define a struct
-movable_operations.  It then needs to call __SetPageMovable() on each
-page that it may be able to move.  This uses the ``page->mapping`` field,
-so this field is not available for the driver to use for other purposes.
+movable_ops page migration
+==========================
+
+Selected typed, non-folio pages (e.g., pages inflated in a memory balloon,
+zsmalloc pages) can be migrated using the movable_ops migration framework.
+
+The "struct movable_operations" provide callbacks specific to a page type
+for isolating, migrating and un-isolating (putback) these pages.
+
+Once a page is indicated as having movable_ops, that condition must not
+change until the page was freed back to the buddy. This includes not
+changing/clearing the page type and not changing/clearing the
+PG_movable_ops page flag.
+
+Arbitrary drivers cannot currently make use of this framework, as it
+requires:
+
+(a) a page type
+(b) indicating them as possibly having movable_ops in page_has_movable_ops()
+    based on the page type
+(c) returning the movable_ops from page_has_movable_ops() based on the page
+    type
+(d) not reusing the PG_movable_ops and PG_movable_ops_isolated page flags
+    for other purposes
+
+For example, balloon drivers can make use of this framework through the
+balloon-compaction framework residing in the core kernel.
 
 Monitoring Migration
 =====================
-- 
2.49.0

