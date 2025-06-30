Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E93B289E3D
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 13:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751288437; cv=none; b=gJJGA9ui2eEzqxkMnoQG+09e522DSbYbKiGp1FgQkV9eqsqvZ7ECBjs3hwW2ZY10cHJN2FRC+hx0cc3s4zkyA67IUSHj4sNFC6Se2BmCeUht60NSd11cFAkd0ancrxovXcctRnz4cqO620O2bI5VL6pcyeGAVUQ6Anl+rbiTn2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751288437; c=relaxed/simple;
	bh=19X4bQvLwR3+OfNQbpdo9I8RjESqqjGAQVBNJ6TpCho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tSDRxlvmT2IUUgMY4KlBX0azdKNHWEwWPcLjCtZPHqpnALGDZDQKel6gKWysSAY4VcSWFZ7Gr5Ow4poOruLO14M7M4G0+gNr2O1vLKdFBeIhlXWl1N2hXPkg7bCB1VO1lWpFfRJVhLA9VTTVMiORcqO0/Jsrt2fDpJfUmDy6Ei8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZZtiPm4C; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZZtiPm4C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288434;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nJlezl1jqk1KHM/JmX+CbcKO2aiRBLF0rBMpUlNHwJA=;
	b=ZZtiPm4CRBEJXRO+ZdNFie79VtmD+a2dEM4gwhi+A4Egp8saFYdPIz5D0SJDMbY/GtxLOt
	dOYFAz8OjWo3etSx3Eao4doNb+1uu3RAQ9v3czBysn3PMhgH86vUbE9kkG2G8vU18/kaTH
	HC/wbAE8D9RPR6C30OWKvd2iYA3iNsc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-0n2B3X_fMV6VuXQ8N1jxUQ-1; Mon, 30 Jun 2025 09:00:33 -0400
X-MC-Unique: 0n2B3X_fMV6VuXQ8N1jxUQ-1
X-Mimecast-MFC-AGG-ID: 0n2B3X_fMV6VuXQ8N1jxUQ_1751288432
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a4f858bc5eso1529401f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 06:00:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751288432; x=1751893232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nJlezl1jqk1KHM/JmX+CbcKO2aiRBLF0rBMpUlNHwJA=;
        b=BA+F4Mc/g3QzuifWwywmk8Vuf3nR2VkCvQQad7pJ0nRIFiOz5pRM1OK8Z+fC1L+ZDV
         aIcwm1QOKsjcqY6VB09nPCzblx7Q161CicH2q1XZBNKF5rH1xpuXb7+AxNmKI1SD3uph
         Ja7oIVHoXNW+MRibpjHEXTF6iuHXI3IrqbJeiltgmU6ZC9JDXvy5iZ9N8lY1kiGLEQu8
         UmJD912B/2fbNT5dL7lYTdr9GC9VdT6gTYELbuBUt5hoJHq9SUyrLjT3NKbgYwnlzgi9
         0g0lXGApA1qysfGR3maDvF409DhEqG4oCy4x43r+LBNYVDUu6Y+o+30i7yVPBYzmpubP
         zMTA==
X-Gm-Message-State: AOJu0YxkpU6ZZpbfJ7F2HqjO3+Ufly7L4zVk/wK5SDJt9BEyBZZYd2Yz
	p1kZnmLMmWRvgTosOcgNQ9F6GHtlJ3jhIwsFPULm3nODBN+D0C8jsiRKahWxHKgeoNK6BYqs/tM
	iow0OgEXR1R0yuuw1Jh9Wd2/jB2mMda6F/RzLA+XBFUKiFCPZRBHtEMOzjwyuBBroLZnHwEh8HT
	mV+o0zrMSdXKI21GdkIetn7tBBaYRxitOyzxb9n8UFG8GE480R
X-Gm-Gg: ASbGncv6fINajQuz4EuujV4kA6MSKGfy2TZ+egLfWeG/N7yeZWdyEze814b902jya/Y
	GWpi1l8w76UZKspovYLU7v6v7yrV1rwxS1iCK5EnhXXD4ixHkiM79IUAsmqF+S4XdxtCIakzL+z
	BQoFahd0zzZKqeAoIomeLKgbvr5JBAYfbBkWZ0yKPJx3nsK7s4KFoLKgXlU21IkddqQ1gxtr1jP
	Iq/j01F4mXomxLfxMcRNcotsY9u16lu+KePk6UuDmZCJmpJPUPPQZORZL0jVeV/7b/OWxoQy3yw
	d/5rVgxkiDN+1WeL4dXAKvVD5+5jHjugJ6+QxgxerUBdFTCVR/lCrE+LPgpTwK3Att73EV3blqy
	N2aHkjNw=
X-Received: by 2002:adf:e181:0:b0:3a4:f038:af76 with SMTP id ffacd0b85a97d-3a8feb844cemr10501301f8f.53.1751288431641;
        Mon, 30 Jun 2025 06:00:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGEarPHGaA16flG07pTm8Y+2ZoBRaEqSqyGzIU15EPr/yTHmV5lKxwKCSS//XnEer0oKPVNw==
X-Received: by 2002:adf:e181:0:b0:3a4:f038:af76 with SMTP id ffacd0b85a97d-3a8feb844cemr10501216f8f.53.1751288430998;
        Mon, 30 Jun 2025 06:00:30 -0700 (PDT)
Received: from localhost (p200300d82f40b30053f7d260aff47256.dip0.t-ipconnect.de. [2003:d8:2f40:b300:53f7:d260:aff4:7256])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a88c7fadf3sm10557609f8f.34.2025.06.30.06.00.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 06:00:30 -0700 (PDT)
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
Subject: [PATCH v1 06/29] mm/zsmalloc: make PageZsmalloc() sticky until the page is freed
Date: Mon, 30 Jun 2025 14:59:47 +0200
Message-ID: <20250630130011.330477-7-david@redhat.com>
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

Let the page freeing code handle clearing the page type.

Acked-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
Acked-by: Harry Yoo <harry.yoo@oracle.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/zpdesc.h   | 5 -----
 mm/zsmalloc.c | 3 +--
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/mm/zpdesc.h b/mm/zpdesc.h
index 5cb7e3de43952..5763f36039736 100644
--- a/mm/zpdesc.h
+++ b/mm/zpdesc.h
@@ -163,11 +163,6 @@ static inline void __zpdesc_set_zsmalloc(struct zpdesc *zpdesc)
 	__SetPageZsmalloc(zpdesc_page(zpdesc));
 }
 
-static inline void __zpdesc_clear_zsmalloc(struct zpdesc *zpdesc)
-{
-	__ClearPageZsmalloc(zpdesc_page(zpdesc));
-}
-
 static inline struct zone *zpdesc_zone(struct zpdesc *zpdesc)
 {
 	return page_zone(zpdesc_page(zpdesc));
diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
index 7f1431f2be98f..f98747aed4330 100644
--- a/mm/zsmalloc.c
+++ b/mm/zsmalloc.c
@@ -880,7 +880,7 @@ static void reset_zpdesc(struct zpdesc *zpdesc)
 	ClearPagePrivate(page);
 	zpdesc->zspage = NULL;
 	zpdesc->next = NULL;
-	__ClearPageZsmalloc(page);
+	/* PageZsmalloc is sticky until the page is freed to the buddy. */
 }
 
 static int trylock_zspage(struct zspage *zspage)
@@ -1055,7 +1055,6 @@ static struct zspage *alloc_zspage(struct zs_pool *pool,
 		if (!zpdesc) {
 			while (--i >= 0) {
 				zpdesc_dec_zone_page_state(zpdescs[i]);
-				__zpdesc_clear_zsmalloc(zpdescs[i]);
 				free_zpdesc(zpdescs[i]);
 			}
 			cache_free_zspage(pool, zspage);
-- 
2.49.0

