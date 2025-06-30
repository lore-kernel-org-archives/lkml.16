Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51382C08A2
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 13:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751288511; cv=none; b=jARvvqruxvnbe+99gybV3n1O/8j9pG/mdI4g/8ZpL/3sBAOUqk2X0sVZvC5ZYmDxGI/7JNaTGsL9YNOyH4xexj5QwYdfZobU3OoJBk/G5Nq96G/96GFTyhHB4tNRGZIvTzM3HOP4g3Z72jsC6jTigNF1fPWlYst2ZEYgQ3RzAtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751288511; c=relaxed/simple;
	bh=UE0+puqslU6Vod0/Tnuw7OVCa6Yv44yCJDBwHPhWm7M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oFstUyH9Kd4VxHgVZVeD/AGtNSrGL8fFTWZOP1dEwsJdE30xM2FhXZazlBqtLKAxhmaMiNkb0VX1N4R8E6KQ881NaejbX9vuEBzNtWnmP1LjdIuL5lDcFr2lOm3DseueYNLD/jDcREcJdpfUu/mpIkzocgVkS791SPaC1Rlgh40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=T9VmMpqS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="T9VmMpqS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288507;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zjoj4LwixqS2sGyUbKyFkbKZVx00WcQgc8KQk63N+Nk=;
	b=T9VmMpqSJt/eeItmZxPTVZazxs0kGx+t2F+9Xzyod2jRKUdGoEHDSU+tDauNNnu5DkKgNL
	pD4G2eaCAke6I1Z3Yk1mTk5JrglMQEVh6cQkuW7oiRYB4mnxx5tB+0T/n+8T2Mu+w/ivO0
	7pUv+m7Fedtop83kV1zWV+0UGFeL+iE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-372-94XEVamWNXakPjTPNpgkqw-1; Mon, 30 Jun 2025 09:01:43 -0400
X-MC-Unique: 94XEVamWNXakPjTPNpgkqw-1
X-Mimecast-MFC-AGG-ID: 94XEVamWNXakPjTPNpgkqw_1751288497
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a4f65a705dso1185511f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 06:01:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751288497; x=1751893297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zjoj4LwixqS2sGyUbKyFkbKZVx00WcQgc8KQk63N+Nk=;
        b=s5jv+MnWxnXFSStW4cbDae/9rR7jtsIJjF+ezYLo7O3pokKrjq/Gd6Q5sh9/eTvcCc
         xrDeWB6KIFfnbAQNetbFhbTvDaCxEfVPNOhXP7rThBEvCgzXi7oF7JlnXnNawxFpk1tN
         L52/CIvUcBn460C0Z21jD+LkKTf7vq3QgGpTDFiQOuTB96gM7KaWqVmUsLxFFoMqCG6B
         cRD6MZW+BgCNy5zilQ6OhK+8Ptsot/06DkULZLqeBX2sMc7IKvUx+JP0yfYsfRz+uyjS
         BxDQCInO/aV0ny4JZiJZeO/J8/SNYr0Wj78SxmV/PZ+3GYIv6/fYVpeMp3gd8WchumsQ
         okYQ==
X-Gm-Message-State: AOJu0YzaGG7O1+O6jjLPyKFcHpC1eWT/zBRjtp1qDPdBjNp0SpC1agg3
	9+bov0a/FFA9QSBwJ42AB+1uLfvUTnXQ+1Ci/wyfNYjt13VQsxDXU1nmTgp/ItQHSd0ZN1yyat0
	b+AwnErFQZNXvy6WpyriE03Y40CkUnvLwSQNEGyLGnhH5ypwV4JD81MDTM0HMkRo1DbjPB0J2vy
	Q3JQYV3lprEvD0Gy4bh0gT112kEHZlPrATr0auWC/datg31Wb+
X-Gm-Gg: ASbGncsyzpYvmziRyvr4B+rDSjHgsQ6FJc3EP8e2iCHTjBWmoCvuKNy1kdP7pDX5ip+
	k3gbJD8nJLHpzwHcvt0xG/tTbTD14Jb4lghFoFqftEFpufbcUDv7jgS0jJBtc86l4J0alIdOzfJ
	11wkSXhH3mm3MJ+ifeNa/kkhTx/xzkqgmUu7HB1drELG8YWwNQqcmmqpAZ6dy6BJditXr/3rTdq
	vc+ASvJj1w2R59MBwHLn0fYoxFQ2u7mCTrlsGir2JgCmFYSfnmDLocI1MUe6luDunRzDxI7HUqk
	v01fVQDryYXlIK82H79Afatawmcb0xcFUjQ7m98jTFdpdpwLQFcB0wpXZxuvuk6U010CaXw0wux
	msIedszc=
X-Received: by 2002:a05:6000:41f2:b0:3a4:efc0:c90b with SMTP id ffacd0b85a97d-3a8f482bd78mr11299202f8f.15.1751288496622;
        Mon, 30 Jun 2025 06:01:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUx6MnmvL38m+UjxsSHRmCnwJ9csff/jtPLhL/sKkb+ObakA6KxkyBM5ParmF0iwuWxCWprQ==
X-Received: by 2002:a05:6000:41f2:b0:3a4:efc0:c90b with SMTP id ffacd0b85a97d-3a8f482bd78mr11299087f8f.15.1751288495708;
        Mon, 30 Jun 2025 06:01:35 -0700 (PDT)
Received: from localhost (p200300d82f40b30053f7d260aff47256.dip0.t-ipconnect.de. [2003:d8:2f40:b300:53f7:d260:aff4:7256])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3ac6ee0d0b9sm4643102f8f.18.2025.06.30.06.01.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 06:01:35 -0700 (PDT)
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
Subject: [PATCH v1 27/29] docs/mm: convert from "Non-LRU page migration" to "movable_ops page migration"
Date: Mon, 30 Jun 2025 15:00:08 +0200
Message-ID: <20250630130011.330477-28-david@redhat.com>
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

Let's bring the docs up-to-date.

Reviewed-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 Documentation/mm/page_migration.rst | 39 ++++++++++++++++++++---------
 1 file changed, 27 insertions(+), 12 deletions(-)

diff --git a/Documentation/mm/page_migration.rst b/Documentation/mm/page_migration.rst
index 519b35a4caf5b..d611bc21920d7 100644
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
+balloon-compaction infrastructure residing in the core kernel.
 
 Monitoring Migration
 =====================
-- 
2.49.0

