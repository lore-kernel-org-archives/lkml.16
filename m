Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0797B2FCE1C
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 10:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751624796; cv=none; b=iNfrQdnPyTgEZBdfMsDvN8ALCXpI1YmbqlqFkqoLSGKkktcUPT8FJa5Vy6tuEXPGNMttEk+SJM86v+8LVhFVavYqJaGZkOXozsMsUtR5EzkewAcf3njLeGGo0/9+bSFM4PUG5m1PlEfQkLhjLJbp2UJO+oDxfQtSKHxjSdDcBXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751624796; c=relaxed/simple;
	bh=pHyy8UC6aDtzrad/rUQe1SyqR3fae/2pllZmxoCrbEg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rBt0EqJgSQhBNXikqvb4+zzNjGMudyzJ+aypRXr/ljF+B7heeBUzVKsmHJqmqgw754K3hMv06fYQ/s2rFFkk+Bn1mLLfFhiTmxedwHYaeYNsX4YSQmhbtrHk02NS6oHE1eXud44FVQdWXqRzoof8Dul0Z81u0z6OGcHReGgpjeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GNsUcNcQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GNsUcNcQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751624794;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pi83bTeEFwDlpM8pJuM4mqXwpOj3VH8gXnt6oQN+QH8=;
	b=GNsUcNcQpY1m2me+d0hH+J0RNWvi7Wr3zHKamu2rSkbtohJRrZhi3j6CABfFIUdIUNQiKx
	v2RoJ6JthDd9IBos3XpAhf8gNK120b8Q9L9MLkHfmpzjq2jqegSPPLNG3/DJ0vlaqa7Brn
	2Dhp9J68Ytb/KWhmIPQ58BT9R06bKgU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-256-GWgS70NhOpu2tz2KV8lxPw-1; Fri, 04 Jul 2025 06:26:32 -0400
X-MC-Unique: GWgS70NhOpu2tz2KV8lxPw-1
X-Mimecast-MFC-AGG-ID: GWgS70NhOpu2tz2KV8lxPw_1751624792
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a4e713e05bso317752f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 03:26:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751624792; x=1752229592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pi83bTeEFwDlpM8pJuM4mqXwpOj3VH8gXnt6oQN+QH8=;
        b=U3uE6Z57eJD6gAxKjiNYXp7DQ7qDYjiutgfFPNzIW36UKNosG1bIg4HF3vWNFjzMz6
         BJcTXGs7MxWT5FZMwdgfY4p18LBzPRNfjpl9XgE3OG3X3Hp4aPJwmC9/c+WPVY4GCseQ
         PJcDx4j9fNlbcksY3VXEYprf5ZxfJU+EVDMDODYU+gj0OdEXWh9wFGxEOMgpCREs1GzL
         8EBHa+x2U/zcK9JYDsWUAZSuaB5SGIg7jEMpKFGKE3+dqld46Vfw9M6cWQkqu55o4KoR
         A0sSCxTawHB8u6ce8ryr+3X339lvQpSscKEB65hFHrf0/TV+hVp5bTx39my71VsJ7Qkp
         cj3Q==
X-Gm-Message-State: AOJu0YwQX/r3o7ivY5D5lbrrGfC1M92KPnetPDYY4Yw/6PKkViDlfrg7
	0GeTspC0T+b8nvVRRee0XWavk2GzxUD1yylhJPfEsXTY3QoWWIgyJ9hPDX5tShfMi6QNEUNb+Gk
	6tFZjbIIniXxMngDEMpFJ+FZPw3x8t4V7ARzWCgkl3hqdhbPHlO0u5Xvnj3pUIFS53f6aYS/XHA
	/LD5EW4+JUJ/aNWDVq+H0hXM/TR9T2QWZ3C1llEpBHhLvhXQ==
X-Gm-Gg: ASbGncuXbxdNi7nPaGJq/lVIyqB2c+rik0NBGC3sQxAxVW94yXw+qaPTLYzaxxJR2Tg
	u67fFzsuldibrVPzjZAZsp6iTa9SLLCT7tfUBIG0Bqt8VUBzHawr6FH/BCWSi+7PIrMkmJMgSpC
	F6tl1nS9nosn+5+LbZacjEDQ5ln6HgfQsFsE3csDQ7gTCMIfwzgJJZJcctGrx31C47RKyh0Rgri
	eM+icYDu4gFTFdqGDjkeIErHN1KwD2bRYUefoSnobyNwSXtYxsq0Rfn8ONiQEU0d5M9KQl+S7ls
	VUXhdgASCbhvTRcFGhvIdieybMeDajz8I9gGiygp26h8offZzAyJYilcS8iee1jAfaLkU54Mxtx
	/viyKSQ==
X-Received: by 2002:a05:6000:420f:b0:3a5:25e0:ab53 with SMTP id ffacd0b85a97d-3b497038f53mr1271136f8f.32.1751624791658;
        Fri, 04 Jul 2025 03:26:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrTbC9DKT0t3aMKhVtx8nltW/QfximYUsOEu1FNJGdEflOepjIkffBp71QlqU0uLEDVp5xtw==
X-Received: by 2002:a05:6000:420f:b0:3a5:25e0:ab53 with SMTP id ffacd0b85a97d-3b497038f53mr1271044f8f.32.1751624790899;
        Fri, 04 Jul 2025 03:26:30 -0700 (PDT)
Received: from localhost (p200300d82f2c5500098823f9faa07232.dip0.t-ipconnect.de. [2003:d8:2f2c:5500:988:23f9:faa0:7232])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b471b97732sm2167298f8f.59.2025.07.04.03.26.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 03:26:30 -0700 (PDT)
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
Subject: [PATCH v2 22/29] mm/page-flags: rename PAGE_MAPPING_MOVABLE to PAGE_MAPPING_ANON_KSM
Date: Fri,  4 Jul 2025 12:25:16 +0200
Message-ID: <20250704102524.326966-23-david@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250704102524.326966-1-david@redhat.com>
References: <20250704102524.326966-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

KSM is the only remaining user, let's rename the flag. While at it,
adjust to remaining page -> folio in the doc.

Reviewed-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Reviewed-by: Harry Yoo <harry.yoo@oracle.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/page-flags.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index 8b0e5c7371e67..094c8605a879e 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -697,10 +697,10 @@ PAGEFLAG_FALSE(VmemmapSelfHosted, vmemmap_self_hosted)
  * folio->mapping points to its anon_vma, not to a struct address_space;
  * with the PAGE_MAPPING_ANON bit set to distinguish it.  See rmap.h.
  *
- * On an anonymous page in a VM_MERGEABLE area, if CONFIG_KSM is enabled,
- * the PAGE_MAPPING_MOVABLE bit may be set along with the PAGE_MAPPING_ANON
+ * On an anonymous folio in a VM_MERGEABLE area, if CONFIG_KSM is enabled,
+ * the PAGE_MAPPING_ANON_KSM bit may be set along with the PAGE_MAPPING_ANON
  * bit; and then folio->mapping points, not to an anon_vma, but to a private
- * structure which KSM associates with that merged page.  See ksm.h.
+ * structure which KSM associates with that merged folio.  See ksm.h.
  *
  * Please note that, confusingly, "folio_mapping" refers to the inode
  * address_space which maps the folio from disk; whereas "folio_mapped"
@@ -714,9 +714,9 @@ PAGEFLAG_FALSE(VmemmapSelfHosted, vmemmap_self_hosted)
  * See mm/slab.h.
  */
 #define PAGE_MAPPING_ANON	0x1
-#define PAGE_MAPPING_MOVABLE	0x2
-#define PAGE_MAPPING_KSM	(PAGE_MAPPING_ANON | PAGE_MAPPING_MOVABLE)
-#define PAGE_MAPPING_FLAGS	(PAGE_MAPPING_ANON | PAGE_MAPPING_MOVABLE)
+#define PAGE_MAPPING_ANON_KSM	0x2
+#define PAGE_MAPPING_KSM	(PAGE_MAPPING_ANON | PAGE_MAPPING_ANON_KSM)
+#define PAGE_MAPPING_FLAGS	(PAGE_MAPPING_ANON | PAGE_MAPPING_ANON_KSM)
 
 static __always_inline bool folio_mapping_flags(const struct folio *folio)
 {
-- 
2.49.0

