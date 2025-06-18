Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0652FBFE8
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 17:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750268491; cv=none; b=Iw5SOnNOgeCKZiAwLpfPczApGCoJSE2lEt0M0orGR8eh/o2PqmgkBU+rtBCpz52hvpUGbC61RxkENqTjmWTzx/0HSsmVpFJvDfDG4V8RaEEbWGEP0wbcHlJoPn/EEO9wtBSV1+PGmtARY0BTj1be59EXMbLkrV9OiXekDnpKPY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750268491; c=relaxed/simple;
	bh=klS5wctUdaGGEO0GDFp0U+oLqOtRx0jqeVG9P2Se0qU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DH7kS1uxrbS0aor1cmQNGAXNCLHcwUoGNzEPZ0VXvq2Lo80mu0uXCq4bEjv+WsxRgIyHXLMBhLeQAJDK84OzdB6pWrjoZiONF42IDoC4+4gZB2F81d+wAL87Iags7urgr85a1z5YiI7PDKdmPsUG2Pstz8qE3etbcZIcKlm0c64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EjNJwPwC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EjNJwPwC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268489;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UnwUSh7o+5ZmaRZCKb6UInkhBSWZlCwshIxY9Qz5Cgk=;
	b=EjNJwPwCoZ6wmrrUKTjRbGbAOnTZg93QQzrb7Iocs/VQdILH334rfW3xVnLFiV+2CT+6pj
	x9NuE3rgfx8HgSnl6l41CIJFBFrbv7bkyCDISz7u8Xuz41Tlih6xdFyPIeYY+VKYuYdCLU
	zoZMwVFven7rk28v9Wu+dSuWD7s7GPo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-673-xQCCJaNAM4-6Wc3slZ5C8Q-1; Wed, 18 Jun 2025 13:41:26 -0400
X-MC-Unique: xQCCJaNAM4-6Wc3slZ5C8Q-1
X-Mimecast-MFC-AGG-ID: xQCCJaNAM4-6Wc3slZ5C8Q_1750268485
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-450d6768d4dso47063355e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 10:41:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750268485; x=1750873285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UnwUSh7o+5ZmaRZCKb6UInkhBSWZlCwshIxY9Qz5Cgk=;
        b=Ps6mxSIYdqcUlWY6scraLTE6DIu6Ega03oHcVabBZpRS6qWjtFvGtcN6+sMwhRSXlo
         DsHSh2vNwVe6EccePrXf2+TfoSUrmCQRqsOqFE1ieDWWif+cs2ZlKzXHw0xifGKigdKO
         8Gn6BaKlWFFCsWX4LXptzPI5pqd1JRpk2WMCQugs/LZu7MAfRLet1VkyeedaQrWZRLbe
         XG+HCPPo35LDASrOtzt06KAC2seF+CtenkKUjRXp+i8/LV6nFJ/mDnZhynEBMECoSC+n
         hnYlyqfpJuS93ITk74ln3BhesjRNYyHtvh+Quvdp9KdFlEFtcStDCO1cqmOfinq6SQAL
         sgDg==
X-Gm-Message-State: AOJu0YxHUQUXSVM6HA3CBh/TojF7nAHIkWMhxr5vFOOP0yinXHRZMHkL
	u/gU4KOatPJUzvH7dPAEvdXrItBK/a3IiHo/WyHGhZfgenybsUMfqehqjANTcSQjmoGEPzKZGP+
	XpoUnv3/2QYmaRMryfeLTw7FMEfIpaSqw1587nVJyh1acDHGDv+Ifs3i7JnqkVbt5UabYwXWv18
	KSa0GWZsl3uXUltFui6MF0jJaoau9uDX6Kv2FRIir/VyTjezzg
X-Gm-Gg: ASbGncsJpdvXfFpzvUNMEPZRVWAi1C9uWMB3x8YmKD5poYQ9neba4n7o3+jVHt3LvfF
	thio7/RWyeMZxWSirwa6UiJ2EUxMKL80x4xAX6p+aStE63g42g0VYOUUL4KIXB3MY3huQLUPqps
	6eLS8jQnKXwGv3lo+7JxBdG/H8MX/j+rEHQFLb7hOA6rn004j9M1yzzi/jGf8vYF9KRZOgTpajq
	e2IrEIek5oHX4GrAzL7qjkvkqhNXn4k2/oftClWoY0RRCM6/MGsl4ffLm3eYT1WJErpwukLYSWY
	vuCM0GKMtz8EGPgkxVusbJ5JEk/3JiSDWN81vXd9i4dDudeClC3CtbqW1ircdN/WOcnfiHmk62W
	R9oFtCQ==
X-Received: by 2002:a05:600d:1:b0:453:5a04:b60e with SMTP id 5b1f17b1804b1-4535a04bc8amr21843395e9.26.1750268485456;
        Wed, 18 Jun 2025 10:41:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEv5K+zuY4+JCApu2tViRQi8tnrUP4BMaDADA459jpWP1i37cwdJ2pp4j+WJZa019DgSPcT4A==
X-Received: by 2002:a05:600d:1:b0:453:5a04:b60e with SMTP id 5b1f17b1804b1-4535a04bc8amr21842675e9.26.1750268484986;
        Wed, 18 Jun 2025 10:41:24 -0700 (PDT)
Received: from localhost (p200300d82f2d2400405203b5fff94ed0.dip0.t-ipconnect.de. [2003:d8:2f2d:2400:4052:3b5:fff9:4ed0])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4535ebced8asm3463925e9.40.2025.06.18.10.41.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 10:41:24 -0700 (PDT)
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
Subject: [PATCH RFC 25/29] mm: simplify folio_expected_ref_count()
Date: Wed, 18 Jun 2025 19:40:08 +0200
Message-ID: <20250618174014.1168640-26-david@redhat.com>
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

Now that PAGE_MAPPING_MOVABLE is gone, we can simplify and rely on the
folio_test_anon() test only.

... but staring at the users, this function should never even have been
called on movable_ops pages. E.g.,
* __buffer_migrate_folio() does not make sense for them
* folio_migrate_mapping() does not make sense for them
* migrate_huge_page_move_mapping() does not make sense for them
* __migrate_folio() does not make sense for them
* ... and khugepaged should never stumble over them

Let's simply refuse typed pages (which includes slab) except hugetlb,
and WARN.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/mm.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 98a606908307b..61da588dda892 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2167,13 +2167,13 @@ static inline int folio_expected_ref_count(const struct folio *folio)
 	const int order = folio_order(folio);
 	int ref_count = 0;
 
-	if (WARN_ON_ONCE(folio_test_slab(folio)))
+	if (WARN_ON_ONCE(page_has_type(&folio->page) && !folio_test_hugetlb(folio)))
 		return 0;
 
 	if (folio_test_anon(folio)) {
 		/* One reference per page from the swapcache. */
 		ref_count += folio_test_swapcache(folio) << order;
-	} else if (!((unsigned long)folio->mapping & PAGE_MAPPING_FLAGS)) {
+	} else {
 		/* One reference per page from the pagecache. */
 		ref_count += !!folio->mapping << order;
 		/* One reference from PG_private. */
-- 
2.49.0

