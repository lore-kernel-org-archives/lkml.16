Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858C72FFDEC
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 17:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750268463; cv=none; b=Gsq0yw4fUWAbnbd8gwmYoqBWmjyoIveaxz/k0JKsguir6BeGqy5i0FArRyACDio25JRfQVw+pcPCe7KNYjYF0jgS6lE+cv3mZx+3XrRKmUKh+M/VL1d2fPQqxqu/3Gi4lYqPEaGPLu23JTMzPOn21xY4U3PzCNWVEHPwO0T3doc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750268463; c=relaxed/simple;
	bh=ltmtOsj6PvpW+vjN7IqM0EXe8b45WiKSrK0SISC1AKI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SPTsjXBFZS1X17tItlW5Tnhn8wma8AMemUYBMr+QF1p3SCd1X34s5MPdNxbO7C40n36x5mFc7N7eeF4wi8jB/yEKRXt2OX1mr91KJnA5BrtrcLlMo9BYpV87pbvHpTwwaQP3lE8TLGmekcNPcop1nx+SRW0XFZPbxMZokCOFILQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N4qXCSVT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N4qXCSVT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268457;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R518sUXauciWuWBIWO47EfDSUo24r+YyG2S8Z5J8Wko=;
	b=N4qXCSVTOqS0jmWYH8loTM3Uk4emj/K3JX/PUFypyYUko4RxqE1/MjxjURE8tTI06Wp2n3
	WM7zz4AabxtD0FBbHI20CDp0/mMIme7TAoHX2+KYut2eFrtF1NQk4F4i/ZsUGWoqm4X0+F
	TLtKWC8xikiMpOI2Aro095CFCxrqHlc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-436-qSCLbJXdPeCxuJKeUGUg_A-1; Wed, 18 Jun 2025 13:40:56 -0400
X-MC-Unique: qSCLbJXdPeCxuJKeUGUg_A-1
X-Mimecast-MFC-AGG-ID: qSCLbJXdPeCxuJKeUGUg_A_1750268455
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-451d2037f1eso43919725e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 10:40:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750268455; x=1750873255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R518sUXauciWuWBIWO47EfDSUo24r+YyG2S8Z5J8Wko=;
        b=dnfzJmY9n+ECxcqiuFe5Q6NBVhHpVSuDJxxHbjfAMaSVX3dbKDiF3IBlkUJl/oYfF0
         HP4srM5ZehZdYapM+zdFa8eJTStPRxaNrqqGg71JlJCz+FgyR1WbhwdF+ne0s8uv4/fq
         lI17hUrC3gBN641uXHPIi4gUts+qTE5PtOOLyEnsAMrWeZxcNBn9pringfWUeFVy5HKF
         jB4OwDH9qMlcxYkcNboi8MAP9qFYPB3bFbXmvQCmx+kKBhjAfpMBwgGHxDiVgwUtfNTl
         gRHJXctGvUzy+VHz43EDd+qy0TOxV4junOS6pt+8jMDE4FgPFd3N0k6vRTmSSs7MkjKJ
         nFKA==
X-Gm-Message-State: AOJu0Yy3rE6DywC/fiaNdKmD/siNh6GKn7LaRuaeRT2J67Fcd64WkIN4
	KXc/dsDvW3P4Ntl8/SMHpyYiGVCJrA82zX4V2meCNJLCvi1O4ic5lYsq3h4cDkng0PBPI01D2de
	JtW7TyV1wEURz8JOGdAUgP33HLj8AWWTZEuYdkG+Y98BL//dNRMticbCZtATtQWfiDFFP7QJJo2
	lCB5PCRdzgPQNbKRzK3gK82sQ2mAJ4rSadOwyp/KI1vUBsp/n8
X-Gm-Gg: ASbGnctrg+pZCSDMp1hGRWKc0YcbU1jXn2hRlkANkIygxP2bKghCKxhynN1kak5cMtS
	CIBO6z68B+sjs4DSeBEt+IaIUvuGB4LfuBqQ4p9+mc51j1IinZND9DTPyI4OFpxNShp9Flesl+5
	uhB3AuwV93DleyaIy8VItYmpms9ne5uKkGMPBkoOcmY/Zq4auaDfw96wG+MG3Tp4ueGVamEZ+By
	ugEktdOoFmj7l8MBzN2ZEUF2fGRR2SuNReunwLsLAt5spJfB1LyCujrO/qbvhXRToXFITiA2zDP
	e3gYYYBA7aTMfA+4VlFkoApm9CgGGDCbJYeTz+93xXyt3aUSKiWmDqynoD0Xys2edTWugdNO7tM
	sC5sN+Q==
X-Received: by 2002:a05:600c:8509:b0:450:cf46:5510 with SMTP id 5b1f17b1804b1-4533cb53b27mr169413085e9.29.1750268454970;
        Wed, 18 Jun 2025 10:40:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECPQIWD9z7ds8IhVmKE9L3mk+qhph5JCu6Oi2OcOPUlhg6wunpBLWb7MobaQ8CxMoDDmzTIg==
X-Received: by 2002:a05:600c:8509:b0:450:cf46:5510 with SMTP id 5b1f17b1804b1-4533cb53b27mr169412335e9.29.1750268454440;
        Wed, 18 Jun 2025 10:40:54 -0700 (PDT)
Received: from localhost (p200300d82f2d2400405203b5fff94ed0.dip0.t-ipconnect.de. [2003:d8:2f2d:2400:4052:3b5:fff9:4ed0])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4535e983b14sm3703725e9.13.2025.06.18.10.40.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 10:40:53 -0700 (PDT)
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
Subject: [PATCH RFC 14/29] mm/migrate: remove __ClearPageMovable()
Date: Wed, 18 Jun 2025 19:39:57 +0200
Message-ID: <20250618174014.1168640-15-david@redhat.com>
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

Unused, let's remove it.

The Chinese docs in Documentation/translations/zh_CN/mm/page_migration.rst
still mention it, but that whole docs is destined to get outdated and
updated by somebody that actually speaks that language.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/migrate.h |  4 ----
 mm/compaction.c         | 11 -----------
 2 files changed, 15 deletions(-)

diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index c99a00d4ca27d..fb6e9612e9f0b 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
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

