Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61C9305525
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 17:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750268499; cv=none; b=unlTZLSP5xADO6rBSEY6p0MGNEkAcraQm3izvZYwyfRhe1UAwP9wXdkJvRH0OHasRHJ9R9aKJITlGMeJGlFo76xBvtwu5tqfvEnMK4QizDYqAF9NhoeCHG+Xy3JUN/sAG3mjPVXwnwlFRktQ4haRA89ZxV4p4Lxf1zMVqDcb7E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750268499; c=relaxed/simple;
	bh=xmAX6FaG7PwzByxdVNWIboeTPGW5tjq2c62uEFet5m4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BsMxS8t5zpU7Xg3Ey6e7wk/qbZMzPeMM1QlqRR+OAmbQ773CMdKoVdEETF2gGdKVwu5+vDRS0tygD/SWPuQwNNi3DdyIH9awrXHz5nen+Pl4xKOKOesX72UhJsniIkRXIjGlLH48q/D2/cPrIfTqk+sKfdLuVzJVSnsYV575F0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UWuZz79D; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UWuZz79D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268496;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EpLhIwgxSmOTAUjcHZTQRVGXB1xFFa6Mgym/mVDU2pw=;
	b=UWuZz79DKCer1K2zP2dkFjhVTfQXYPyAgt89CuDopdCEaMw1IDDvBx3JEOBWHYx2qQeq37
	TAP9nmUKxdLhlQEIuVnkQodczviJNzTb/36cCbiD6PByVZOxzwxK3Qqh4pV75+SrAtlE8I
	DBQq3dkaFeXemaYovnYly9FVCPOi5zY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-503-fPVFkNCiPASVRLkZpJxzzg-1; Wed, 18 Jun 2025 13:41:34 -0400
X-MC-Unique: fPVFkNCiPASVRLkZpJxzzg-1
X-Mimecast-MFC-AGG-ID: fPVFkNCiPASVRLkZpJxzzg_1750268494
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a4f7ebfd00so3268672f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 10:41:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750268493; x=1750873293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EpLhIwgxSmOTAUjcHZTQRVGXB1xFFa6Mgym/mVDU2pw=;
        b=GL1smevLdPhdnuG2pvv/mf82zR0QyFyfQDMrhQRH8CqMHtrbJ3bOoDTcv80pfQx/YF
         A3sSr2p0SRRrDaBuyRJtccA1pxSd2xxvx1CB8E7X3n0QloUC6Vib3jQIyLpAREvlUt0+
         TBAYTiBxGnp4F7ZnKaq4cOenxVM4pdbSTYpZg4pzqZkPGyQ5HqZve1QqIjP1lRBOzAq8
         US6gQlSu1evJKs+vZk7py3BVLsjwEpfsX9j3LiiQ50RMFwP/O5xRZUKo/q04CE4By7rh
         2AMhoAnTQvVHbqirNrzVL0Roiuy704Lq34BKtN6ixoNpijonnCuel5xec3x11pFC8NKI
         eLhA==
X-Gm-Message-State: AOJu0YwB6OzjMvhlSN4fWAkXtQLHhvPNOHWKrx8+bQym0hTBSUJRj3OD
	sH7GiBpDZ2NAJvuvhLe1GO5n0vcf8iinhxrpKoWVUmYqQ5Y7Ao0fn2Gx/gCQGAlbkd61SXRjdn9
	1QuYWvBWsJyx/H4xDxufycZ6vx2cP38egwsrsxzVERpJlzRIza1blKZa3ZaGNrjEVoyI8FpW/GN
	JqZWd8WYqV3dvlbyq83fwIm64qZfAL0cyt+ksQMfZYo2l3UAg1
X-Gm-Gg: ASbGncvsdYAAtNTMaHAEqLEo58uUD0pN+SK7Zg/Yfb9ni7eMka3ECh1apS+PG4N+bgs
	LeYy1wwhCDsoDwtIGOLYV8bmXkBtgbYnLpy6z19FAFDsgETZbRHtgxBbOgW7XCRvbf/LP2Y5EXY
	3pmanTrK4idO5Dtjr4Kfrrh4t/YSSt4KMnjsp/G7A6W/CJ9yxKB38N826FO7QHrJxmKv0pA0bQc
	s/U9y3ssJIjjqloBz2zOYPrDjJ1AQmE8+S+54WVROgFKPAmPWnHBqNVNDdN/H2/a1CYMl+0BVRq
	Q+QUJDodHKftl3b8mcixLhtEWq845naNJPwHq91nhejbVqT/q58qypyX/oE7HLVfZ34ip7M0jTJ
	qfjOTrQ==
X-Received: by 2002:a05:6000:708:b0:3a5:5278:e635 with SMTP id ffacd0b85a97d-3a572367577mr14018505f8f.3.1750268493547;
        Wed, 18 Jun 2025 10:41:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIdYJ4byKGNqSckw7stdQWmP9a+mk+8zzlUOQQiezgX3FefY2T8iN/DegCcyfhV4fwKQhI6A==
X-Received: by 2002:a05:6000:708:b0:3a5:5278:e635 with SMTP id ffacd0b85a97d-3a572367577mr14018429f8f.3.1750268493058;
        Wed, 18 Jun 2025 10:41:33 -0700 (PDT)
Received: from localhost (p200300d82f2d2400405203b5fff94ed0.dip0.t-ipconnect.de. [2003:d8:2f2d:2400:4052:3b5:fff9:4ed0])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a568b5bfefsm17100889f8f.88.2025.06.18.10.41.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 10:41:32 -0700 (PDT)
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
Subject: [PATCH RFC 28/29] mm/balloon_compaction: "movable_ops" doc updates
Date: Wed, 18 Jun 2025 19:40:11 +0200
Message-ID: <20250618174014.1168640-29-david@redhat.com>
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

Let's bring the docs up-to-date. Setting PG_movable_ops + page->private
very likely still requires to be performed under documented locks:
it's complicated.

We will rework this in the future, as we will try avoiding using the
page lock.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/balloon_compaction.h | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/include/linux/balloon_compaction.h b/include/linux/balloon_compaction.h
index b222b0737c466..2fecfead91d26 100644
--- a/include/linux/balloon_compaction.h
+++ b/include/linux/balloon_compaction.h
@@ -4,12 +4,13 @@
  *
  * Common interface definitions for making balloon pages movable by compaction.
  *
- * Balloon page migration makes use of the general non-lru movable page
+ * Balloon page migration makes use of the general "movable_ops page migration"
  * feature.
  *
  * page->private is used to reference the responsible balloon device.
- * page->mapping is used in context of non-lru page migration to reference
- * the address space operations for page isolation/migration/compaction.
+ * That these pages have movable_ops, and which movable_ops apply,
+ * is derived from the page type (PageOffline()) combined with the
+ * PG_movable_ops flag (PageMovableOps()).
  *
  * As the page isolation scanning step a compaction thread does is a lockless
  * procedure (from a page standpoint), it might bring some racy situations while
@@ -17,12 +18,10 @@
  * and safely perform balloon's page compaction and migration we must, always,
  * ensure following these simple rules:
  *
- *   i. when updating a balloon's page ->mapping element, strictly do it under
- *      the following lock order, independently of the far superior
- *      locking scheme (lru_lock, balloon_lock):
+ *   i. Setting the PG_movable_ops flag and page->private with the following
+ *	lock order
  *	    +-page_lock(page);
  *	      +--spin_lock_irq(&b_dev_info->pages_lock);
- *	            ... page->mapping updates here ...
  *
  *  ii. isolation or dequeueing procedure must remove the page from balloon
  *      device page list under b_dev_info->pages_lock.
-- 
2.49.0

