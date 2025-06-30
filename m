Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F26828B3FA
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 13:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751288431; cv=none; b=UOYyno6ltahkXt2y48njGJ6UJYPNkItILQe8V9u6gP9CLhN8WXwmzF2i5MWE3h5UMaPZfpHMi+WkEvg6i5glat/d8kmQF59seyt6H0TMPpO7wMQQ4jk3V7l2ge3QBlPxuCCFgjLNHOLrbpTX4ekHFIQiVI4PbqmHl3RjMI8KIsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751288431; c=relaxed/simple;
	bh=g/Nn7yNLQF9bkumkJTFPBJ0/vMryjzBbswzQoi8SqSw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=csoG7yLrGaL5c2o282Vqexb1DjzjxqX8Em7V6O6vmu0G5zA9VdGuF6tePZ5+uyFlthftLUDsg/ZICUz3tdklUIHzuky/eIbpqjYHJ6deu/5GJvHawiGZzQe43bDa59u5KlsfpqFMWE93eVZak9Gb17SVGJ4IUnfuvNy+V4MW5KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HqGczN6V; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HqGczN6V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288428;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/UC4605AtCeOAEiQnGvC6ua/uaOm0pT0/PRnxSFzekI=;
	b=HqGczN6VFd/D7S6TYuJG/6tTKfNELE4zc4sw/3Jk/qdoM0m7oXBo94D1g2pxh/Mm1ezTfc
	bgdxVMsk0Wg0C4p/A6ysiXYAWN+4qg+U2xPwMl9UEM8NH14/YdRwH6Ne2gu/FQBI7lqb5u
	o/SyIQJO2Xjf6dn2VYtdYCSuErdzOQw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-25-1U6ZZ3sENzCDTg2SVNpJ9A-1; Mon, 30 Jun 2025 09:00:25 -0400
X-MC-Unique: 1U6ZZ3sENzCDTg2SVNpJ9A-1
X-Mimecast-MFC-AGG-ID: 1U6ZZ3sENzCDTg2SVNpJ9A_1751288424
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4539b44e7b1so9205615e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 06:00:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751288424; x=1751893224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/UC4605AtCeOAEiQnGvC6ua/uaOm0pT0/PRnxSFzekI=;
        b=h29QSi0cYrJDiwnvEVgsYReUurLiutGGidpbrWptgLu3MbG7Ax2Klzl1k0NkRx/yy9
         tniWKwNePTQrvjAevDW2PzGdWdW9yw80B0dEZeuHRElZK2IUIp9iklFfUNyrU49hXY3o
         AgQ+G7OKIi4RcPOXwnAQolwMjMjLXgnYRq5XTau+3U/7FI6FRiwXSOZYLnZ2/Vo3yHOS
         yS3wVqSuTWz4SgbN8HVLr+truZs66AgK5qo5/3eY4l8Qo+LWcYVqTvYRx6lHI7tu1xQn
         KBtcb98/B0qFdOGKZgo9IrR1DY4O8S1/i2P+0DP6vIfCpxdAUCjuKHCJBNFk0IhhS61C
         bSVQ==
X-Gm-Message-State: AOJu0Yw1iq8UMH168SdIdeo9MFGHhiwcbA82AGYbO5h5E4xwSt8kdVC/
	eyCNszLmu7qQQM1lyRoGqcJUR0MxejR4bRY9G+jGgdquP5n3VtQUyz96+rCWl67Q/VnLnmm+N+B
	WPQvawIeDZhuo4xmpiAJToZvgM4vcewfDp3j5zZUFrk6+UnXBUxU+NT/Gjx1wqjvGvd2bQ0uwAB
	8P/FiHiW86O+aUx5L24DNu4oZT7/qTPy2epaeWp0UqwTAsbjHV
X-Gm-Gg: ASbGncsA3NJREzlP1rXCPYFmcT8aNxsTSQ4A9ALt+Cw97RlawSWH7w9bf85IhAyH/CT
	i7w27HciEhRnnOM5Wqr/Qxw3RVcnvIz9DBoCb+sPQmipBxc/zuLQrK+759JQUlUlwqgiYpU3XOy
	mnniQZMVOjc1Ojs3Vpse6uoyKVxUrZz3LeKy1KRztGQ/Gx3irK2JKZ05Cwwu8vWBu2hsrH+1tJL
	ZSjhCI8OnHPGGegOQd8YSMjlhoBs71esB9bVtCwUCTG6GS1xZ41TtCHbnAcu7YHkrh0lyxPmR4T
	l0Y3ORBJwE1c/aQphFDa6jc3Viz/6EUdOvRXP4DJAUG7rEk4Df4DG0qEoh5aO6qN7Sx2wtFYB4C
	zHvkP2rU=
X-Received: by 2002:a05:6000:1786:b0:3a4:dc93:1e87 with SMTP id ffacd0b85a97d-3a8f577fdf7mr11727619f8f.1.1751288424288;
        Mon, 30 Jun 2025 06:00:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLO9PGgybCCYgBv54Fac4lQzN8FKYTlkGjVWntSI86PNTFg8laDwfPxXxOTUUP76xSqnQLIw==
X-Received: by 2002:a05:6000:1786:b0:3a4:dc93:1e87 with SMTP id ffacd0b85a97d-3a8f577fdf7mr11727461f8f.1.1751288423060;
        Mon, 30 Jun 2025 06:00:23 -0700 (PDT)
Received: from localhost (p200300d82f40b30053f7d260aff47256.dip0.t-ipconnect.de. [2003:d8:2f40:b300:53f7:d260:aff4:7256])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a892e595c6sm10642847f8f.66.2025.06.30.06.00.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 06:00:22 -0700 (PDT)
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
Subject: [PATCH v1 03/29] mm/zsmalloc: drop PageIsolated() related VM_BUG_ONs
Date: Mon, 30 Jun 2025 14:59:44 +0200
Message-ID: <20250630130011.330477-4-david@redhat.com>
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

Let's drop these checks; these are conditions the core migration code
must make sure will hold either way, no need to double check.

Acked-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
Acked-by: Harry Yoo <harry.yoo@oracle.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/zpdesc.h   | 5 -----
 mm/zsmalloc.c | 5 -----
 2 files changed, 10 deletions(-)

diff --git a/mm/zpdesc.h b/mm/zpdesc.h
index d3df316e5bb7b..5cb7e3de43952 100644
--- a/mm/zpdesc.h
+++ b/mm/zpdesc.h
@@ -168,11 +168,6 @@ static inline void __zpdesc_clear_zsmalloc(struct zpdesc *zpdesc)
 	__ClearPageZsmalloc(zpdesc_page(zpdesc));
 }
 
-static inline bool zpdesc_is_isolated(struct zpdesc *zpdesc)
-{
-	return PageIsolated(zpdesc_page(zpdesc));
-}
-
 static inline struct zone *zpdesc_zone(struct zpdesc *zpdesc)
 {
 	return page_zone(zpdesc_page(zpdesc));
diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
index 999b513c7fdff..7f1431f2be98f 100644
--- a/mm/zsmalloc.c
+++ b/mm/zsmalloc.c
@@ -1719,8 +1719,6 @@ static bool zs_page_isolate(struct page *page, isolate_mode_t mode)
 	 * Page is locked so zspage couldn't be destroyed. For detail, look at
 	 * lock_zspage in free_zspage.
 	 */
-	VM_BUG_ON_PAGE(PageIsolated(page), page);
-
 	return true;
 }
 
@@ -1739,8 +1737,6 @@ static int zs_page_migrate(struct page *newpage, struct page *page,
 	unsigned long old_obj, new_obj;
 	unsigned int obj_idx;
 
-	VM_BUG_ON_PAGE(!zpdesc_is_isolated(zpdesc), zpdesc_page(zpdesc));
-
 	/* The page is locked, so this pointer must remain valid */
 	zspage = get_zspage(zpdesc);
 	pool = zspage->pool;
@@ -1811,7 +1807,6 @@ static int zs_page_migrate(struct page *newpage, struct page *page,
 
 static void zs_page_putback(struct page *page)
 {
-	VM_BUG_ON_PAGE(!PageIsolated(page), page);
 }
 
 static const struct movable_operations zsmalloc_mops = {
-- 
2.49.0

