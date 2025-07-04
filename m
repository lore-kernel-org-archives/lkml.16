Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA182F3C0D
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 10:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751624744; cv=none; b=fqnNoKdXA3OHJLAmcY9S2P1sYThlzFcYrUd9omD8wTyyxM0UZM3U33vGdFgem9eZYPEhDT7zRgkFG8rTwfuVnNK9/qSdXusC3rYTKgFmKVsS3OAMreZGgyp3Alq73LXMqZgD9k0ZTAmihjP/sMb5HimgTr6nm428l7aUcsM0cZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751624744; c=relaxed/simple;
	bh=AM3xYskqV1GdLk2CfAavrgvRU1Z8ivBgX0T2p7YhDTk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HjEcuq0uHsSIY2SatOOBgwjck+icVZ9AZC+nVu4NVMajRYoZhIh7bsr33z7l697Rh41onndXvrhaZPkMJvd+jBH/WRQrjJ27H1Uis+nMZ2yAFe5IqZa2++2vElZkuoWtvTq6VBDT/XHDUcWJgOVyJ9bqcI1+ZFyKb7aI4PVcTjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dn+Gth0w; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dn+Gth0w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751624742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CYTSovr6D54lprWegV/WfQaWtrhfAm9Hhj9zhgiC0NY=;
	b=dn+Gth0wa1D+SSUkSqzR8RHdADz23WiU3biqXTvhh1vJPdsj5uiDGGktI5jrNZmQrpPjbz
	Nugl9ow9Od5Cu7YriQTtCvh8SowioJxlVajM9kZ1ho8wxElPrOFEktR3s1frLPFLgkPTil
	BeMdUkx4D73XmKhkwtpLqHamZlj/Y6g=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-332-m-JpfE6oNFya3LIgzVb8Zw-1; Fri, 04 Jul 2025 06:25:40 -0400
X-MC-Unique: m-JpfE6oNFya3LIgzVb8Zw-1
X-Mimecast-MFC-AGG-ID: m-JpfE6oNFya3LIgzVb8Zw_1751624740
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-450eaae2934so6575475e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 03:25:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751624739; x=1752229539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CYTSovr6D54lprWegV/WfQaWtrhfAm9Hhj9zhgiC0NY=;
        b=QweMKfb1/V6/lWLC1fdiQF/LVWo2Lt/eM5EZ1ewKEU3FqKUEBhJGuxQlO4UmbVx2GP
         V4p1jxJ0UIgevYazVeVlNpTS+kti33+HZPPne3Wm+kSLZ7hU96IGnw6EGeh+62uD3rK+
         teHJ8yPTSvi+L/oQQzc5yOoMVzPJADXN5t3sFfkklV9euRDEjPHNT6DYxP9FaU8fCpLK
         Qb1Qk7LNy/CqXskd6tA4nZ9+k1QTxgAi9d1TDSRA5GO/JYYbIJUngspl34fyl9KZ9qyR
         Nv3Fr++92o3s7tZ1yzH8MhBoD7Gygp4+ytia27PDBBSsn2kdCMCdH3/arxOTfCDQn2z6
         VKHg==
X-Gm-Message-State: AOJu0YyP1l/ig7PeonNqR+wSUcSWcB/S+Ve6lUo78WP8ld//uzc2rpsU
	rXQHriCJ/dW6JxXXFezHa3x3CswaciIHSW68WRRbPbIYXylYlUHgjqMoKwZ1xEqQDoDVn2JjRzW
	J0ReHQj2EoGPMUVMJtDlw05prKbQT0WwUEpYMEfgbEgtEfuI9S5NNCB+6yUSdPIpYp4ZMJWzWQ7
	htOc1VhQlsvpeeCIQaZRj3ImE4rAyShwq1Cd2/ki68mY5YCQ==
X-Gm-Gg: ASbGncs/QhqERy6fJRUT4DS90PWJijFv+xtguT34YuOx53aZSKOIe9+V+RY9syIJ3q5
	xpY8BhVFyrTLhvzLVMvOFA5+RVMpMX8HxemEaeiLAj5F4Y4Z29xzdm56dZt5uRLr9kRjHZHc7kc
	utvjy2qirQddrTcfLRjOn837QM3RoOtCDsId6/UZ2dHPkpF7fjReoW34ymq5v9qdJeeXR6te0iD
	enkQHoYC1olu53ndMiv1Pc+KNDJZKzO+KUPTdIgxaXTVQJf70xXZfYMdUXyhkRVzc5fgAE3Up8+
	qDgKY4hQPWUEaa7Z/RM8SsHdG4oZIzr5W+msDloRTZKG4Xnv+KuwH3yuykVixmDcOhgZlqHaaqh
	HdMJ1ww==
X-Received: by 2002:a05:600c:3e1a:b0:450:d01f:de6f with SMTP id 5b1f17b1804b1-454b30aff3dmr25066705e9.15.1751624739363;
        Fri, 04 Jul 2025 03:25:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEabPcFPa9J30O6qNf8/Kx6cfnBeZR0NWqXc94Uy+RT4akZprmrg4imDnBXRg/gEanMTx6ZJQ==
X-Received: by 2002:a05:600c:3e1a:b0:450:d01f:de6f with SMTP id 5b1f17b1804b1-454b30aff3dmr25065735e9.15.1751624738758;
        Fri, 04 Jul 2025 03:25:38 -0700 (PDT)
Received: from localhost (p200300d82f2c5500098823f9faa07232.dip0.t-ipconnect.de. [2003:d8:2f2c:5500:988:23f9:faa0:7232])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b47285d3c6sm2121167f8f.95.2025.07.04.03.25.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 03:25:38 -0700 (PDT)
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
Subject: [PATCH v2 04/29] mm/page_alloc: let page freeing clear any set page type
Date: Fri,  4 Jul 2025 12:24:58 +0200
Message-ID: <20250704102524.326966-5-david@redhat.com>
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

Currently, any user of page types must clear that type before freeing
a page back to the buddy, otherwise we'll run into mapcount related
sanity checks (because the page type currently overlays the page
mapcount).

Let's allow for not clearing the page type by page type users by letting
the buddy handle it instead.

We'll focus on having a page type set on the first page of a larger
allocation only.

With this change, we can reliably identify typed folios even though
they might be in the process of getting freed, which will come in handy
in migration code (at least in the transition phase).

In the future we might want to warn on some page types. Instead of
having an "allow list", let's rather wait until we know about once that
should go on such a "disallow list".

Reviewed-by: Zi Yan <ziy@nvidia.com>
Acked-by: Harry Yoo <harry.yoo@oracle.com>
Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/page_alloc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 858bc17653af9..b825f224af01f 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -1380,6 +1380,10 @@ __always_inline bool free_pages_prepare(struct page *page,
 			mod_mthp_stat(order, MTHP_STAT_NR_ANON, -1);
 		page->mapping = NULL;
 	}
+	if (unlikely(page_has_type(page)))
+		/* Reset the page_type (which overlays _mapcount) */
+		page->page_type = UINT_MAX;
+
 	if (is_check_pages_enabled()) {
 		if (free_page_is_bad(page))
 			bad++;
-- 
2.49.0

