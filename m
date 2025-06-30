Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BC628B7D4
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 13:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751288434; cv=none; b=k3hb/DjLEFu2g2zTggwdxBGSmTtAQafCR1++Z3EJEUZqgLZRhwxORuSSC6ogkKjZUe48urPZzffeN8rSrZzqEb1AHKN4jPb37in7HVLNHPcN+I1VHa7nMvctVne3/FiAJ0deRjHBDjU9uJGSQkd4amch564xlKMzEDatsW/OmG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751288434; c=relaxed/simple;
	bh=RPaleElAAsDd8ZXcp7V7mHwwcGHXNcadS42UzjFFaPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t+/MhEJ6LEu1MSs4Y/ojLdJZ87eE2YOYB9iA8Fh1Qfn/zIjnGGt3F4hJpVtuLYDMWJpx+7u5aU5rT1kJXbGA1wcFR/j7UloNdmE9YcoapcDjj2J5skSfr2vVlsjl4Sks75k/IdT5aFpAznn8Gwd732DuCnSgiO7/74uXNuRwDGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SPk6McXY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SPk6McXY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288432;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iLYHGg19bG0clXk7rQPjR4hvYWmeZvg7QKQ5c0snrQE=;
	b=SPk6McXY3w7qS4c+lXxWYLW6YP98whpIq+1CEoj4adjO7qg+0mnr+8N+956gND3Q+GcrGA
	/1MxMHnd2ujcVpm4Qeiie+nu5L4X5YaZ4B9LPiefOJMjwlS3p/SpBF3dpETDThMH8TZKXE
	IT9e8eIuDPLwFgc4OaAqwHFd0l8t2co=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-540-sGckTeW8OnOODD5tVmDpzg-1; Mon, 30 Jun 2025 09:00:19 -0400
X-MC-Unique: sGckTeW8OnOODD5tVmDpzg-1
X-Mimecast-MFC-AGG-ID: sGckTeW8OnOODD5tVmDpzg_1751288418
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-451d5600a54so31263115e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 06:00:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751288418; x=1751893218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iLYHGg19bG0clXk7rQPjR4hvYWmeZvg7QKQ5c0snrQE=;
        b=Y0mVj4ng/yUlHe8G50PjitZmInuEHvQaxu644fK1s7vSmQ6emQs6tRzniwBFcLmoYG
         yfw7sqLYEopxn+Kc+PmX957nJh7MoS6DQ/AXo5M2kxDK+K2zNVrjcgGMRCGXM8h4cR2O
         2ZGL3rrVenC2rV+vDTqHgl83JtSkndPb9O9NESAJOcxNyXDR1InBTEYTsSPGXhxeNE72
         FBKDdrcucm2pV8TO2nTNCj1FlUQzx7v/uSCI6JzPidX6u7COM5wKObKp7Pta7IOJJOWT
         nHyYGhh4Eo6ysu0+finKjkBRk8j0RUn8IJfIQVZHp3a/zU5JsY/d6qHKcnUS4RrHPm/L
         m5dg==
X-Gm-Message-State: AOJu0YwxLhvLuymXKMVeJVXJnF7yUZwU+u4Shwtut8PdD+B8Dn9X2mXL
	AtElh5OxV5JniiGMKg2/iKaResRn7hy6xlLID+Qf8A6e2EHh1boeWm2FH3My9AGC8Cw7HMlfWe4
	SQy1x/jH7hQi+QFNrNt7mCddlwBEl5BvuZrNoVwgZUS+HIk3TR1oYrKnot5pMJk50EORVl7lYRY
	f8mPeyPWVWyQlsciw7uQmHXybU8FmIg4gqrT2Iy7mnn7PwgH5E
X-Gm-Gg: ASbGncvkBFKPP38hdrmKmMhalUZF7PRQ9t/aL+Gi7ibeaIJeE30cYbEoskqx6xH2eAh
	hqdpgfrx2dUrGyeUkok2lfKJd3wAymQ/OhXATgJQiuDBbposfL/T8zUe2tgLMYfj08LNHv2mJI6
	xOe9NhoHYv/4lLTmocUj9tkU/xbhrDgzCyJT2qE8gIMlovvuoRRbYuPC8Fzh4sc6NOTWPRaEcqb
	K8Owg+MqbrAft06bOxT20YTfCR/mq6AXMduNCZmgmQmWmf0Mxw1Vw1GytaP0/iqEgx8+tKCSYEh
	qYQf/V4a2t90ddG7c0grnZFLRuU1XDOcswhfkzEsaVzmvvOOw6s35K/LKmJizupRG9/TH15KH7k
	Wjx+qCDQ=
X-Received: by 2002:a05:600c:35c9:b0:453:608:a18b with SMTP id 5b1f17b1804b1-453947d8ff2mr103853475e9.9.1751288417789;
        Mon, 30 Jun 2025 06:00:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGb/NAxjgNou29rgmmNKmV3zZO0Mb6cYoPiX5R9Zf8/khrmrYWUc/XyFqJpcvry+rGAxO8smA==
X-Received: by 2002:a05:600c:35c9:b0:453:608:a18b with SMTP id 5b1f17b1804b1-453947d8ff2mr103852575e9.9.1751288417169;
        Mon, 30 Jun 2025 06:00:17 -0700 (PDT)
Received: from localhost (p200300d82f40b30053f7d260aff47256.dip0.t-ipconnect.de. [2003:d8:2f40:b300:53f7:d260:aff4:7256])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a892e59659sm10376420f8f.77.2025.06.30.06.00.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 06:00:16 -0700 (PDT)
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
Subject: [PATCH v1 01/29] mm/balloon_compaction: we cannot have isolated pages in the balloon list
Date: Mon, 30 Jun 2025 14:59:42 +0200
Message-ID: <20250630130011.330477-2-david@redhat.com>
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

The core will set PG_isolated only after mops->isolate_page() was
called. In case of the balloon, that is where we will remove it from
the balloon list. So we cannot have isolated pages in the balloon list.

Let's drop this unnecessary check.

Acked-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/balloon_compaction.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/mm/balloon_compaction.c b/mm/balloon_compaction.c
index d3e00731e2628..fcb60233aa35d 100644
--- a/mm/balloon_compaction.c
+++ b/mm/balloon_compaction.c
@@ -94,12 +94,6 @@ size_t balloon_page_list_dequeue(struct balloon_dev_info *b_dev_info,
 		if (!trylock_page(page))
 			continue;
 
-		if (IS_ENABLED(CONFIG_BALLOON_COMPACTION) &&
-		    PageIsolated(page)) {
-			/* raced with isolation */
-			unlock_page(page);
-			continue;
-		}
 		balloon_page_delete(page);
 		__count_vm_event(BALLOON_DEFLATE);
 		list_add(&page->lru, pages);
-- 
2.49.0

