Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADE52F5478
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 17:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750268436; cv=none; b=Lq1kbgmf7mALCMSvEZMoXL/2FHPGAj5fZRUCoiJkN/p6HIWPn2DqpMHwxQaRFnNq3jkJT4uQtkBpCXV+rLutGb1mkCHTOK46aDFAfgSEm5iPfugcbvE0GPm0DXd1uQXMgBUGAKtGLPCBp6k2RJ0LfjbrlBlOX65YbZyuT8rU5Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750268436; c=relaxed/simple;
	bh=/qlovm8p0zMtgfIRyfEk2trttNuw5S14EvQzs1QPFl4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Px34ImHmlQN7ns4l69GsOXQZLe3LbWDl9dbbnsePQIn30+iJiqfQtX9jiesgic40/EM9UiJzCc2u6s9VCXWBy2htx5e/jgYDGsXikhToQZHachVeMNT6+jqgT9Bav7+BsaILIF7/WseRSMKeFeUI/wZrgBwBahe2DaweCURoYfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H9lNKl9G; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H9lNKl9G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268430;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nTkPO9qqkPL3+EL3rvp7Awl5YkqXAjOFp3B2ZpZgv4c=;
	b=H9lNKl9G71TX/Xm36Zp99AJjpIJ6HE2CvKVcWwLq+YZL6TomGkVGY/QbJyY1lw/M6D4+Ok
	F5aWLMLOow8naKsR9DpEorTF66HP+Gsp/8NOWyAfXEHeo3GkXWzASzt3z9xE5VF/fyxc3P
	9elk1grsZ08b2GG5zNOLQfvkszRJ7g8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-446-cZgNEBNXP8WNxNgWLpAzHA-1; Wed, 18 Jun 2025 13:40:29 -0400
X-MC-Unique: cZgNEBNXP8WNxNgWLpAzHA-1
X-Mimecast-MFC-AGG-ID: cZgNEBNXP8WNxNgWLpAzHA_1750268428
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43e9b0fd00cso5758155e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 10:40:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750268428; x=1750873228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nTkPO9qqkPL3+EL3rvp7Awl5YkqXAjOFp3B2ZpZgv4c=;
        b=stG8t538bbRqCmFyoKhhXTxLzGjnJ/H0ACPyofO5ZY3uubDmvEPSrEAb8DnQvC0Dyp
         2bUpOxZ8c5oDz9dbpOSaupOw1HakCawaTryHoV0O5Tlb79MCI9ZM3jcOj6W0eE519+Py
         xbVfVRaDrg8BtJyWkT1bgydXznFLIdmTpFgWVJzvpms7DU6c4rK4FGp80vRmqK2fYy6g
         xa6QGV5iq6wIxdhp1dwCkVGDU8GcNk5jKFza5LhvabMZdMGyukoh3fpnByuqD7JqRGxv
         jQoQ/t1GCQE4J1fKCJiYFnOobngBJD63hOnnDRG4ymEcYGgPCRtAfbwF5CRgliJb+WOE
         v0+A==
X-Gm-Message-State: AOJu0YxPipVNQsKilTDDsRlGRRrweMRef5zre7Ydjjfe9vV5ssxYtJng
	KtBYhSj8NUoquxcV9RagB0bzY+IIBhhYEfTOW/riqUVmd0IjMPuoRtRgGxCqci4m4pbuSD3biLl
	4GRI2YxNx9CZSxHMG6UYoU+UyF1EJVr1w7gOmDek3EDtb//tCkn4UrRTMN7A6fA0vPia615E0Zq
	q6b/67Edj80b27qmit7Ten/ZoBPF2XYqxL6vmuJyGx57R1Jjpt
X-Gm-Gg: ASbGnctXkHN/fFsfGFCEJNSM4Kuyk+FH9i8XWHfSWMRdeuJtyC77ruCr6pZfHLVmXHM
	ttLvjN5ISyLltJnYStHa+n+X9oiB6z2ntujE4dMOAhKydC8yvw3G4cr09r7TJZt9RuD7U8GO1uM
	ihg5w+dSnoQWX56Kx4sMy7I7wWop1l4EzC3Q99/V+zoCgmb2QxYmafUSANKlKNHC/Xjvo1LGhK6
	Z8LIDT9zIreVhdapUE/C9GYcru8zdFmxlSZkxHQ07MNDUtYFFRW/UQ+ys6smdfoxlvmEaZD9U9l
	pGQBIoqSlpuA94otczLrH2l1bufRf7Nf2wXK6NMA29feNm0VOUaxR4BsPDWRUqEXk4q4b/AOhIZ
	DVbkRRg==
X-Received: by 2002:a05:600c:4b16:b0:453:92e:a459 with SMTP id 5b1f17b1804b1-4535ec85c23mr3140095e9.16.1750268427870;
        Wed, 18 Jun 2025 10:40:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFkzVO1ODwNAxaNuTK2n5Qmy81cmyi9pmESLWNLzISSPT37JEqPUHdRyxt0ThuYLp1iDunnjA==
X-Received: by 2002:a05:600c:4b16:b0:453:92e:a459 with SMTP id 5b1f17b1804b1-4535ec85c23mr3139385e9.16.1750268427286;
        Wed, 18 Jun 2025 10:40:27 -0700 (PDT)
Received: from localhost (p200300d82f2d2400405203b5fff94ed0.dip0.t-ipconnect.de. [2003:d8:2f2d:2400:4052:3b5:fff9:4ed0])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a568a5407csm17710458f8f.12.2025.06.18.10.40.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 10:40:26 -0700 (PDT)
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
Subject: [PATCH RFC 04/29] mm/page_alloc: allow for making page types sticky until freed
Date: Wed, 18 Jun 2025 19:39:47 +0200
Message-ID: <20250618174014.1168640-5-david@redhat.com>
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

Let's allow for not clearing a page type before freeing a page to the
buddy.

We'll focus on having a type set on the first page of a larger
allocation only.

With this change, we can reliably identify typed folios even though
they might be in the process of getting freed, which will come in handy
in migration code (at least in the transition phase).

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/page_alloc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 858bc17653af9..44e56d31cfeb1 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -1380,6 +1380,9 @@ __always_inline bool free_pages_prepare(struct page *page,
 			mod_mthp_stat(order, MTHP_STAT_NR_ANON, -1);
 		page->mapping = NULL;
 	}
+	if (unlikely(page_has_type(page)))
+		page->page_type = UINT_MAX;
+
 	if (is_check_pages_enabled()) {
 		if (free_page_is_bad(page))
 			bad++;
-- 
2.49.0

