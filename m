Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98512BEFF9
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 13:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751288507; cv=none; b=GuVQku0e6fTk8FbFX+5vFrUiQswyDIfroj9GckI4NI53eWtTO8LN6phJHRPPKaKg4J216cUEke/w5+0q5xxmPr/DCZYd0Zf8nqT23AcF2Ieplzs4qvaZzBx7KUovyNHFLCD3W295uLyht1y6G4++GqWK1o0tsFFfMk3D1s1XD0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751288507; c=relaxed/simple;
	bh=VLtr/75+OgLg5UKJqAhr4SPpTHq3QNsAl+8ocPk3Nhw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BDkEe6ZhdAeAVND7cIJsSOAbLNm+pObQ51xf2Sb5T10GvaNRsnPQz1eUa39IRLKXCTAAOJJXhFusuqnqw+7vAQQFioE0YLvkkyTDXtg2MnitoGmp0Hf7lAap+5d8RcidZ5rhTvqzdWWfUKF/kjA8tzt2tC7x4pNhpoX0VklXAzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eO5Ns51a; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eO5Ns51a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cBlqU3v31THD5gXpB9nn15wD9nofG3PBMtxlPOPDIeI=;
	b=eO5Ns51aDvdeyZqjjDiN/dQAyzOiQnjXJWZPC5YqXZt1TkIiSwWWjQULOz1zKJbRf2L/sN
	zqpqxmx7j7Zjsp+WbTHh1FW8PkupdWmAv6MHN+N6P7L0KFBe9dWO7LvsiyqwC+l08hQnYg
	IcsuVokwET5BDQTToM2Ty+OxUWmaerY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-596-kDLl99H6MBi3PjupvYGleg-1; Mon, 30 Jun 2025 09:01:43 -0400
X-MC-Unique: kDLl99H6MBi3PjupvYGleg-1
X-Mimecast-MFC-AGG-ID: kDLl99H6MBi3PjupvYGleg_1751288502
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a54a8a0122so2169683f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 06:01:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751288502; x=1751893302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cBlqU3v31THD5gXpB9nn15wD9nofG3PBMtxlPOPDIeI=;
        b=T1I9M6bIZhQ4zq5vV8Ps+qPoLHZMaciPiyhMSe/QEDEs1/gLIzjSJMo0Uzgil2bIJ7
         mzTbK/FFAYHAzwu1+ClRrDEpMPNiNrQ9gXJznIc2yy8q/hGUKhi+Wq/AnZSpTifGsOSp
         wVn8pReCIHQOp5vVCi8s3R86ui3+9tybAs1HvKksehClzDvg53zQCtV1/wUmnZ1cmKwN
         qH7c5yMhVybtyNX/Nh8zDG2nd8KAq34o5B31T4D7ENtAvThlFbxLYQu0nqstWI1njpEt
         cnfMq1e2VKNILXZEgFsYpTmPxYjvn1ZGShK1MWaM43lHQ/817oFvSlb94oKNWtgeHej+
         fDmA==
X-Gm-Message-State: AOJu0YwE5SteCuh/j+HvLkf73HLOtA6oexZZ82hYdPMfQ161P5SHpTnU
	QmSZGouPH9rIRHIqg/+vYvTNXXA5en184oyzp+ZynECQYfDY75m7UOOXGCLZ70YcGM183dbj9yO
	cHFzAO6ru3HBEw/1We0tLxpWIZhiHu2aYfY/mBiEz6g3WySuQjcpYFSq4tVl72FhcoUohjrG9yK
	dQ0qOqptrTnJC5wbAVd0tWku0hHu2rye2rlmBGgkcXX3ZhCVwZ
X-Gm-Gg: ASbGncs/zJkuX+oIEpZ26Mx6nZnhw70d68VWmk555wEpaJYSZZujNMN8kgrpRy/BeAx
	R9b3j1BiYwiNtwnNvng+fhB4lf3vFwMd4Y/dPN057LNFcY91rVZdT1z+PW3SlLAgzQ5JPov9Mnq
	MeFB0+RiDLflUoCYu7zhoGuazhY5xmzkZxiJmhXegydFpF5mtLaPJwZhe+6I9tjC4uBIcsP2+9Q
	rD3FV7l3uRlkS9UbJXYb28+lkbpIO4dJyXPSXHP4zvopOF4TdLJ6nSDMqHCrDUWoWyNsCeeIn5i
	+apt1gI/nw2bSigtpKOz5r+2bCD0qoSv9djburmkJIn0jDARzuhqk69KKZ4GuB4Q+P46uEmFRLB
	OLqVbDyk=
X-Received: by 2002:adf:9c85:0:b0:3a4:f90c:31e3 with SMTP id ffacd0b85a97d-3a8ffcca245mr9545930f8f.31.1751288501906;
        Mon, 30 Jun 2025 06:01:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmBHmttdmK2eq+WBU1B9I2DDaPMLfI/76nbXYnXDHgExr/7iQPmKv6fPJxJBiz140zN+RyvQ==
X-Received: by 2002:adf:9c85:0:b0:3a4:f90c:31e3 with SMTP id ffacd0b85a97d-3a8ffcca245mr9545827f8f.31.1751288501169;
        Mon, 30 Jun 2025 06:01:41 -0700 (PDT)
Received: from localhost (p200300d82f40b30053f7d260aff47256.dip0.t-ipconnect.de. [2003:d8:2f40:b300:53f7:d260:aff4:7256])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a892e5f943sm10337130f8f.101.2025.06.30.06.01.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 06:01:40 -0700 (PDT)
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
Subject: [PATCH v1 29/29] mm/balloon_compaction: provide single balloon_page_insert() and balloon_mapping_gfp_mask()
Date: Mon, 30 Jun 2025 15:00:10 +0200
Message-ID: <20250630130011.330477-30-david@redhat.com>
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

Let's just special-case based on IS_ENABLED(CONFIG_BALLOON_COMPACTION
like we did for balloon_page_finalize().

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/balloon_compaction.h | 42 +++++++++++-------------------
 1 file changed, 15 insertions(+), 27 deletions(-)

diff --git a/include/linux/balloon_compaction.h b/include/linux/balloon_compaction.h
index 2fecfead91d26..7cfe48769239e 100644
--- a/include/linux/balloon_compaction.h
+++ b/include/linux/balloon_compaction.h
@@ -77,6 +77,15 @@ static inline void balloon_devinfo_init(struct balloon_dev_info *balloon)
 
 #ifdef CONFIG_BALLOON_COMPACTION
 extern const struct movable_operations balloon_mops;
+/*
+ * balloon_page_device - get the b_dev_info descriptor for the balloon device
+ *			 that enqueues the given page.
+ */
+static inline struct balloon_dev_info *balloon_page_device(struct page *page)
+{
+	return (struct balloon_dev_info *)page_private(page);
+}
+#endif /* CONFIG_BALLOON_COMPACTION */
 
 /*
  * balloon_page_insert - insert a page into the balloon's page list and make
@@ -91,41 +100,20 @@ static inline void balloon_page_insert(struct balloon_dev_info *balloon,
 				       struct page *page)
 {
 	__SetPageOffline(page);
-	SetPageMovableOps(page);
-	set_page_private(page, (unsigned long)balloon);
-	list_add(&page->lru, &balloon->pages);
-}
-
-/*
- * balloon_page_device - get the b_dev_info descriptor for the balloon device
- *			 that enqueues the given page.
- */
-static inline struct balloon_dev_info *balloon_page_device(struct page *page)
-{
-	return (struct balloon_dev_info *)page_private(page);
-}
-
-static inline gfp_t balloon_mapping_gfp_mask(void)
-{
-	return GFP_HIGHUSER_MOVABLE;
-}
-
-#else /* !CONFIG_BALLOON_COMPACTION */
-
-static inline void balloon_page_insert(struct balloon_dev_info *balloon,
-				       struct page *page)
-{
-	__SetPageOffline(page);
+	if (IS_ENABLED(CONFIG_BALLOON_COMPACTION)) {
+		SetPageMovableOps(page);
+		set_page_private(page, (unsigned long)balloon);
+	}
 	list_add(&page->lru, &balloon->pages);
 }
 
 static inline gfp_t balloon_mapping_gfp_mask(void)
 {
+	if (IS_ENABLED(CONFIG_BALLOON_COMPACTION))
+		return GFP_HIGHUSER_MOVABLE;
 	return GFP_HIGHUSER;
 }
 
-#endif /* CONFIG_BALLOON_COMPACTION */
-
 /*
  * balloon_page_finalize - prepare a balloon page that was removed from the
  *			   balloon list for release to the page allocator
-- 
2.49.0

