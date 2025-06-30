Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67B228EBFE
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 13:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751288472; cv=none; b=MHd13sBIftt6bL5N2BhvV75DTUoUGbZXaJeG0Hsfc0BRl1bNW321h09pJI1y/knXi08c0lPoy1EXRRCxCQvvfwZuujX7brdfpLsYeZIqCb5p5s1yYvc7Tw06dImNYBkqQ3b6zcO0zASDtptJQdd4U+3DgT9s6ET5k4b4wcyHp2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751288472; c=relaxed/simple;
	bh=iVcKD9ZKy+q0IZPfhKWFJvDMMmEVnhfUGzTuz3ApUIU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d6qeDOauclvpSjju+ea+pk55i97nqKR4/aDWWtFgq+6dNRHroZ6Q5++ndWQJP1P0sz4Hcb5ydbtqfAjUgYnhowexB9h4Kxfo6S/lLENvFT/0TKZpCx7zp8I9epbKN2+2KRVpWR90/sQ/y5FkxGChlPfKqNDsdyR5So6Btfpwlx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VDZzmIWS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VDZzmIWS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IIzDkBhnyPsIOakhHuAsjx3fJM8m9J+HURfbhEZ1A0M=;
	b=VDZzmIWSbX3G9KlJMwOl3DbTqoYlps5DlVtS8ERMD/xpoZVArHNhIrhrEorgmYCSSIY9PJ
	ZgNJ/j8u2qCBzVICw/kRkQeBE4//2RzgUy5ClKkW2PVXQEIg7rYg6u4ipddUj72mPPuGIp
	hJjlZ/HdpRU1sS0QgeEt7Aqy54x4GvU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-567-l9odpnwaPeG4_JeKvLs3_A-1; Mon, 30 Jun 2025 09:01:05 -0400
X-MC-Unique: l9odpnwaPeG4_JeKvLs3_A-1
X-Mimecast-MFC-AGG-ID: l9odpnwaPeG4_JeKvLs3_A_1751288465
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-45320bfc18dso22229305e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 06:01:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751288464; x=1751893264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IIzDkBhnyPsIOakhHuAsjx3fJM8m9J+HURfbhEZ1A0M=;
        b=s5molGRVZbXEAPscojCiOnRkZGMXwZXflPraZrzm+pakUT3mNycDyMeNAKncT8mMfS
         WxbshI27DzZJJ42z3Vmv6uTyayKUMGtrPleScrxIYDW92o3JuPYGWimlFFMMvbiEj54b
         TK6j/L3FS4WUJHYHTkyrAsEjXZWmQ2N/HHoPQDSZZ5wmoOBZFLmV43daAQdpdqXiSBIK
         qrKFp5mNRDE44H0y1EwLKoxvt7r7kTVhJ1SGEO3XzJwpbIINv7fG4qsdCPFa3OrNDtOf
         b9ixJ2yg4JUvAEJPoGLXI0IlZXWa9ojplRU16yDYDQJB/gFehGY7WBYtyVsA5dYE9Alv
         V+gg==
X-Gm-Message-State: AOJu0YzuPFfp+MC7aCqDxF+IM088C1B3Qdow07BxBo5pz1ncvQgz4wPL
	ehBuyCa7z2KilZejRCg+bgN6RwZ9QXX0qWpgCMRzejP1u8QCQFCkbnFo+y8UDcREdUkKZiq2jIx
	qbESpyAoexBk5/MNWrURG879RVnKWVGSr1bKWBsMcRazIDmyFnNjxqF3ql3jvKBcgvE9DuvWgUS
	M9q2qvuAGoZAIvwNKbT0+4p1aPXfKg54hK+5NAKjtEGfUXStlq
X-Gm-Gg: ASbGnct05HhdJK8tdtC10bs1iYpxcOXW7B/3yC2lx8+zMrfidUSumRXU6TXjQxk+ygU
	/mapX4KSBm6XLuhqw8S69HtqAjNBHPmS7N+rn/R+cGfvM1cUdiTFCLhuE5XViUu6WVWNewbdlG/
	QCvB//Cy6Icc+OTbn/Ij90ez6m8lgkldasuaLCkTCsTz9nOAk0kaR0xc3E8lyuJGNS76ZasaMSA
	7d+9SJ6nyyi66ONZbQ8Z7tKtLOXLhR25D7I6fh3fej4C8GlHMfTsUS9q6RnYyI1oSdys4ra7gZX
	CEEWgnXuTBjpOJLKg2azMiXubf3OEznPGtFSgFTFZCfYc4mLXb4LR1KSBI0ki8u755FE0XKA0tD
	YTP5hUW4=
X-Received: by 2002:a05:600c:1994:b0:450:d79d:3b16 with SMTP id 5b1f17b1804b1-4538f309394mr135241285e9.14.1751288463798;
        Mon, 30 Jun 2025 06:01:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7zExQWNaFUjIE00JTRK6K+i5BO8qjO8BpI1TRkHw1kVlVhDi4cL0K0LNLq7UFrw8vD2WvGA==
X-Received: by 2002:a05:600c:1994:b0:450:d79d:3b16 with SMTP id 5b1f17b1804b1-4538f309394mr135239205e9.14.1751288462959;
        Mon, 30 Jun 2025 06:01:02 -0700 (PDT)
Received: from localhost (p200300d82f40b30053f7d260aff47256.dip0.t-ipconnect.de. [2003:d8:2f40:b300:53f7:d260:aff4:7256])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-453823ad247sm170241515e9.26.2025.06.30.06.01.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 06:01:02 -0700 (PDT)
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
Subject: [PATCH v1 17/29] mm/page_isolation: drop __folio_test_movable() check for large folios
Date: Mon, 30 Jun 2025 14:59:58 +0200
Message-ID: <20250630130011.330477-18-david@redhat.com>
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

Currently, we only support migration of individual movable_ops pages, so
we can not run into that.

Reviewed-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/page_isolation.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/page_isolation.c b/mm/page_isolation.c
index b97b965b3ed01..f72b6cd38b958 100644
--- a/mm/page_isolation.c
+++ b/mm/page_isolation.c
@@ -92,7 +92,7 @@ static struct page *has_unmovable_pages(unsigned long start_pfn, unsigned long e
 				h = size_to_hstate(folio_size(folio));
 				if (h && !hugepage_migration_supported(h))
 					return page;
-			} else if (!folio_test_lru(folio) && !__folio_test_movable(folio)) {
+			} else if (!folio_test_lru(folio)) {
 				return page;
 			}
 
-- 
2.49.0

