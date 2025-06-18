Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD692F5469
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 17:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750268433; cv=none; b=CKD4TsYsorTuYnqJv/IFmNZtEiqkNgPeoXHqKwhCeYSJ3mVoSkhj0Kgtua7gIjevwREz+AkKbwq9+cnTTs0MWWeptytq6woONbPPcPW2Ube8TRRp+ey8NnoaYPSP+DCDCo+neIjadnHlMnTAsGN4CZOQbABpqmaN5Brp+dT9ZUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750268433; c=relaxed/simple;
	bh=LoSKhKhxUdNaBIY5unlgO/URzAbM3vnT3E6jz3vT77c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tQDZk5A+UXthJR6v8bRtVNS4Np9oZIS4WVDN0us5TvaFqBqJfIVZzjYYprLyeZVq56nqRG3oxCSbXmOoMyDDjEzOWlWKwFvbgPlqhOUdzt2iUF++J7Za+S7dCesZCh+/kn8TZLFMKeLycuA28s4upea0G4K4y4+HiNGiqHSw12g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bnw2ItgY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bnw2ItgY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268428;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S7FgUVlGmmQh/Fden7VOoWF093l0D6F2nUhdFZr7YaQ=;
	b=bnw2ItgYneYTNugiLoSh7womXWjhX7+jJWrkBqyrZdc8ohR7pEJXeVxJqQ2msEcWaOJS/n
	UVThEk+LyVvoi/WLXYIuRbRG34RzwtYUC9NsZMSxmCLhlIhWOYif551WXUUYi4KCNAes+B
	v3+hKeGfvq1dpbR4tpQSAjTwz3Ix9mA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-uLJIvNE8MLuQRqeo8GstSw-1; Wed, 18 Jun 2025 13:40:26 -0400
X-MC-Unique: uLJIvNE8MLuQRqeo8GstSw-1
X-Mimecast-MFC-AGG-ID: uLJIvNE8MLuQRqeo8GstSw_1750268425
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4535ad64d30so7580695e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 10:40:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750268425; x=1750873225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S7FgUVlGmmQh/Fden7VOoWF093l0D6F2nUhdFZr7YaQ=;
        b=bCcQpcnIItIuYk0dMOPyCbW2ew11AR46kZuVEsuJJgZZ8+1fr+lTyV92XK1fcx+R6a
         7jORZi2dlilVoTxbk5E3s4dgU79PTvgGUOa/wU/SAEYGPwug4pRgKopBSJDY3RhO2B7v
         aVFfGKkjp9KqNwyOWy6wRPkbcJv30bRLl0pu3WYXbskumUAQmW0Yme+a0wjyX7BsOV6v
         v+ba/vsMsmYpiuN8S0nPqQfvAlkP4zYcdj6jAINBAldaOTYUWr4xIAu9aFI34K2ERRrp
         LbBTdprF+B2P9fGGGfB1FpF929toxPNEXYDHBYNq5NSXyupgrkW48208JHkXK9mgQ1Fc
         5VoQ==
X-Gm-Message-State: AOJu0YwTOC4nImq8AZ/P/JO4PBWgxckbvx/RFf14+kB84zJXIqSG7jlW
	xhP4lQ17FNRfc6IPN/nD1dRBopLI93NuqgqXsQ7J3edvre6dAiL3vZwcVPuDtbV1Hdr6QBvhGcS
	IWwycBiTCQWISm3AERUAY3K1/C4QEj5W4iA9i0wfbmkQlGW568EvLKwQ6TgED9AzkjLmEgboFfn
	ZRSXW3/gor0AomMx/r00kUL0bzimVURI7Cs71RVIxV5LSO+i6F
X-Gm-Gg: ASbGnctqq0/rBxWDYF2f+BpXIuiCq9drAAWPBQu4Kjr11yPSqbNHDRTpNzZUBvbTQzU
	pGB4iC8W1S6WCeE1FFvWsNrIARQypWu9jwFCehtIlgsIgJaAlNsjjDABNViyyIbe82gsgsjPUbP
	1AJHJ8QNieM+XJ2f8Kw/3wctMS0Wdfvatzgogr8ElG1WvG2wY0CtCRrcZu20S4jGMQ4hD4tdJae
	5KcTsktxkINdCHNuuqbZoQqtptqMAXRaiJuOr6aatWwnyoN3ia3kZqSLafJUvjpVBhHcNlFDrOZ
	e15hy7AnaC/sEyd5IX4xOJA3QDGEcSwSTOWsV3Bn40dMS5gG0C3cKGR8q+he2PKVD2BzMFc0n4U
	u5n6fig==
X-Received: by 2002:a05:6000:2c0f:b0:3a4:ed2f:e80c with SMTP id ffacd0b85a97d-3a5723a3f92mr15706308f8f.31.1750268425425;
        Wed, 18 Jun 2025 10:40:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEayKPP2LeH5F/Ng3XTSzlfhGIAIvFkyNEolXxAmF4Ok7MzyUOG21uTMpu2qvZTdT619UlY2Q==
X-Received: by 2002:a05:6000:2c0f:b0:3a4:ed2f:e80c with SMTP id ffacd0b85a97d-3a5723a3f92mr15706239f8f.31.1750268424824;
        Wed, 18 Jun 2025 10:40:24 -0700 (PDT)
Received: from localhost (p200300d82f2d2400405203b5fff94ed0.dip0.t-ipconnect.de. [2003:d8:2f2d:2400:4052:3b5:fff9:4ed0])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a568a547ecsm17734777f8f.17.2025.06.18.10.40.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 10:40:24 -0700 (PDT)
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
Subject: [PATCH RFC 03/29] mm/zsmalloc: drop PageIsolated() related VM_BUG_ONs
Date: Wed, 18 Jun 2025 19:39:46 +0200
Message-ID: <20250618174014.1168640-4-david@redhat.com>
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

Let's drop these checks; these are conditions the core migration code
must make sure will hold either way, no need to double check.

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

