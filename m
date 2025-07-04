Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119A72FD5AD
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 10:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751624804; cv=none; b=oLYnn6EL4MOb1p6IP5G6LhQzv4V2XE/+n5rRF2F/jcYlEpN7wLCkE96+Gi5XW4hBo4UVGqZzOtg3UF4FvbM78CD7ao9E1bTV7Cp0e5JKfcGpjN0kDRgoQoBiH8KfcE0tQhpdkYPWa8xGOtr+QyYfJXq6BhK+ahBVOHbWnUiYDN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751624804; c=relaxed/simple;
	bh=E7QNy7Hdv+Y8vIwxIlhZiDTu7KEk+npvDBgCx+4vSO8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AjFJ4jKizMtgYgLRpPpAWdjgiHRPAeK0jW6+HlpE2a8QlZHphgBgSTQlVPf/6ee3E2Mt+7wrLAMQrOYHBbv/1BKkIyMmLBOw7EHbWZCE3zykL64MTftQRjHeoPtyoMFVPF3bNOFo2rTzgVo4rf4wEbilYBPtqLVwoJsSpLK2Y8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VxjtwtOB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VxjtwtOB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751624802;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PJaNSOUY9l76maSUsyNVNOCD+/VPGSxzGfUbWAq4maw=;
	b=VxjtwtOB/X0IPPDaEVLwvXMHqPwLNLrRmwpUZbId9BrF/qjVx2YryyyxEg0D+cLxo53Ypk
	JqmkolI65KN/x4mWLQKB6xIa+n793QJJWffDIoX5gkS2VFo3Wr5NxAQcyNGzIn5VOsW540
	enaT1QBFoQyBwuU+8klWU3rn3K9yUgA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-rWOFYEoePeKlQrLPzx7qbA-1; Fri, 04 Jul 2025 06:26:41 -0400
X-MC-Unique: rWOFYEoePeKlQrLPzx7qbA-1
X-Mimecast-MFC-AGG-ID: rWOFYEoePeKlQrLPzx7qbA_1751624800
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-450db029f2aso3495655e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 03:26:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751624800; x=1752229600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PJaNSOUY9l76maSUsyNVNOCD+/VPGSxzGfUbWAq4maw=;
        b=gs5JxXdUVvMDusWqZW3ZG7+tJelmd/Dfaa2f/K6+6vNwH8Zhwm7izHZV0A0OelTSaY
         EiFMo37VODZaLapaiyLqrhfCiQiFXVO1hAB897vYhJUgF7L5cH4f+KoV6Zj0KOLw0eJX
         5IhQz+kpsck0DAFG8SZ8MapoQfGvnnaYZpuwyAcSOU4J/At0Ip+Ih/Vj++8dFt3tjV0G
         6OdZA+zYP37fCk3oOEEf0cDKU4oNzgRyrrVJsUW1Q+oBfmubqFwej9x+dF6+vSWNucMu
         mDO51Opd4dgIxiIzdMUhlUPh/X9pinG96Iv5hH1L9C+VnjDbXRo5BKB3yi5QiRwyYHgP
         M9IQ==
X-Gm-Message-State: AOJu0Ywlvk6OEvTIgEr0nqXK+tw2Y35qEO7BlyumItCbzk6nno/33SKw
	cxjdMAZ4HSNi3x6bRfTUGSPSvGXfuPLGncWX0aJdT/njuRGnAVoUWEH0Ipwgv5LspbaPNHethFB
	KrHcj7QLHH8MGIYMOdorD+OQYW8x9gze1EMoRKK2y/eNLYaOBstO06FnhOON9/FxhD9j3/gWBdr
	zCbGuT7GO2VRKep8wwV0/IjeCqCcpyHDT7RmFC8YzKeDdSZA==
X-Gm-Gg: ASbGncu3hEt514kCVK977R/iTGopsYf3k1pvAauMDvBVaw1fAb+MTNgxthDoXtPyQWC
	hNJ99GgrGziVHB2/BSpDUSrnkAd44z4ytGatgAGBCM9QEMqrFRFKu6DmUOnvrTzogX6Y7OCWV0g
	88/VjIH5bYuAQPMsNgmNGMg2tDCjV2Cr/+52HD7tlRHCHAMn/OuaniWnEDZI32MMs/gj4Svp8B5
	ux8nFpTQQL9Hri7wZwkHTytHdlJOewQIOn6fMLOqn7Rkvi2NgF5lvk8a5KIZP+giar0dJmE2SFb
	PPBxPGEez4RmfKHz+zPPUYgtEf+roeUQPj33mzfEDcopPkVVcM5+9x0/FCEqpzxWZp+GkrwzNR4
	GqXYHyg==
X-Received: by 2002:a05:6000:24c1:b0:3a1:f564:cd9d with SMTP id ffacd0b85a97d-3b4964dbbcemr1548432f8f.36.1751624799879;
        Fri, 04 Jul 2025 03:26:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG//N9DaWJpqR05PkmLCvqepmh6sjEbIjzOMJ6H89vpgrAi3DitTSNnZ5FWKxlekTJwwx1oMQ==
X-Received: by 2002:a05:6000:24c1:b0:3a1:f564:cd9d with SMTP id ffacd0b85a97d-3b4964dbbcemr1548348f8f.36.1751624799228;
        Fri, 04 Jul 2025 03:26:39 -0700 (PDT)
Received: from localhost (p200300d82f2c5500098823f9faa07232.dip0.t-ipconnect.de. [2003:d8:2f2c:5500:988:23f9:faa0:7232])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-454b1628d6csm23008015e9.10.2025.07.04.03.26.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 03:26:38 -0700 (PDT)
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
Subject: [PATCH v2 25/29] mm: simplify folio_expected_ref_count()
Date: Fri,  4 Jul 2025 12:25:19 +0200
Message-ID: <20250704102524.326966-26-david@redhat.com>
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

Reviewed-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Reviewed-by: Harry Yoo <harry.yoo@oracle.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/mm.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index ef40f68c1183d..805108d7bbc31 100644
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

