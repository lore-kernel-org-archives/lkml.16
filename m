Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29F72F234F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 10:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751624736; cv=none; b=aJKtj6M6jdw7cU/T3uHnjnQSuGS/3BJngpD4r4EZ1otSTrfesRByspwla6K0NRzLay20QIGBM1cMombtsoW2OnmG62A3p9mHtzb3HqJUlszPggvTgD9sKtYYYOoAonFp1VjvOlU3VAr7Nm00LQCSPEhrQXEddtQo/4YZujayADk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751624736; c=relaxed/simple;
	bh=N0i0mDmhVdZqrTyFYSoYTge/lbt5vfjL3ApU/H749m0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DfDVLGVqdjFmadBVmo/nSIOgHXURXpa3CdjV7NT1IkPNY2TK9CtGo/inFItc4gYbz+a/E5tP1rdsRcnOk9FSv6okWfpC2aIyS2fcnvcAmSrOx/f3OQiqjN4HrdyoI1N9OQfYI4djjjrcU7WEceKrqW5V7ONJbRgRyA0s+VOopvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Dv4e5rzU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Dv4e5rzU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751624733;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cQQqBmPuJGjYXvvpwjiHFMj2XowEg2vBjzCyliDZdkg=;
	b=Dv4e5rzUQuJCJ7ENSuydkFd18om1f8WJUMM3YG8INvtYAmiObPBojwsb943cyS9gzH0Un3
	NRufT3WHp88ntXe/muVCv3syPsZ1/IoDnnEQYnZGE1rEfILbM6eCHVu4VQ6jeiY1JN+y4w
	OuqG7S9UlZWH2cRKBaZ8BAvOblK/4Tc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-660-dyCMqBWqOxqxbTPoQi9prg-1; Fri, 04 Jul 2025 06:25:32 -0400
X-MC-Unique: dyCMqBWqOxqxbTPoQi9prg-1
X-Mimecast-MFC-AGG-ID: dyCMqBWqOxqxbTPoQi9prg_1751624731
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4536962204aso3196945e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 03:25:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751624731; x=1752229531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cQQqBmPuJGjYXvvpwjiHFMj2XowEg2vBjzCyliDZdkg=;
        b=L5FVUdFf6EW1OnqMFy7xYt/VoakH/2kNOB3OazDco+P2EqWxBLjnMztCTfiok1moXn
         JatAf7Kq1rnCaVH19KwY+iXcQNu8FfjxdFEsu2/wTFvFzj5gINy/YP4gNqvlUlSs+lL4
         Mh3AW08HRIrPXH2NgbjKBeKfTJqKM26kIJ9aoFfSDmYON8h1fXL6bKRz7O7HHu6XmV/O
         fyNUdin+01oTy/EdEPrsgeSX2Osx3Nux1YPuQa4kTS6PfKr7PFL9Wv4zVucoNQMbfP0y
         8D/AvSg1ftl7JctmGKXUnuKmdqc9rheZaPCMpudzlGPBVhHpxkdw13evCkS7IvmIl0d8
         HumA==
X-Gm-Message-State: AOJu0YzwHxMkolkERg1wVVwxfLzlwaTiHrg+PNRYFkA5p2guav6qqanS
	2EMrDlUthwT49HCbrfcGHyve0iRh2Dqi9zq4/FpTVjlxZ4V/RYkjNAdHMHouh1NKhe5iFKIOxZg
	HF9PIXgKIIjKGaMUmbi8xRXSLWYjPFPhytV29JD3i2l+2dLuem+yOvggCIk5EODtSfFOWpXbPUF
	4oXaCZ/nzU8erzqiIom1BL+7BhKRKrDjd946rPAvHvLRlDgA==
X-Gm-Gg: ASbGncv8lC86PjqR5Qnx0SabRf7dKDwluYn9xn6sdH3ebp28nCpEF8DZmNyt1sGFXNt
	+EXBhz9vcL29PndURncUqKqEAs8zpbz92hy4THvsDOmCFE2Qu8fjh7Vx/gl3dJISHZ2xqgFP7qW
	pXIvXci8s7hh10IPWmIcv0dpZysnIj8fQZ39ZGBOvQhJ3dQXrygPv3GNGMvCoTaHTZLvWD6WUvr
	fTpO1Rt0nfwFy43lGd8wlLu0kFpyS+O5F/RghIkAILbuS0sCv7eEZshw5rewt4Lt7zpNvhCvmvb
	uAXpB8gqFkLK7W+C01moDWOus8wVNvdofsSGAm0zYCFkvWXnNU+uQMKHqdimWwDrhC4ShZsRdo/
	Klc86Lg==
X-Received: by 2002:a05:600c:1c19:b0:43c:f8fc:f697 with SMTP id 5b1f17b1804b1-454b4e74ba9mr16508115e9.9.1751624731043;
        Fri, 04 Jul 2025 03:25:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2JCKcFSESlucn/AkzEEQU5f9yWEwz5OrnoWVnvSvIPUgrXnOXbfSZDcsxaTgozbAMtqKAdQ==
X-Received: by 2002:a05:600c:1c19:b0:43c:f8fc:f697 with SMTP id 5b1f17b1804b1-454b4e74ba9mr16507075e9.9.1751624730349;
        Fri, 04 Jul 2025 03:25:30 -0700 (PDT)
Received: from localhost (p200300d82f2c5500098823f9faa07232.dip0.t-ipconnect.de. [2003:d8:2f2c:5500:988:23f9:faa0:7232])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-454a9989fcesm51185055e9.16.2025.07.04.03.25.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 03:25:29 -0700 (PDT)
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
Subject: [PATCH v2 01/29] mm/balloon_compaction: we cannot have isolated pages in the balloon list
Date: Fri,  4 Jul 2025 12:24:55 +0200
Message-ID: <20250704102524.326966-2-david@redhat.com>
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

The core will set PG_isolated only after mops->isolate_page() was
called. In case of the balloon, that is where we will remove it from
the balloon list. So we cannot have isolated pages in the balloon list.

Let's drop this unnecessary check.

Acked-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
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

