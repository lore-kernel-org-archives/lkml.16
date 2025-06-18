Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00138304310
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 17:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750268487; cv=none; b=LKytjAzDoK7kmI3zuB1v4XKN8zaA2m2Oz3L7xTRemaiXEkQz6FlvJHFUkvlzawIUkg6GlDW6kOXxAjl8ru60K+dt9YwsGn7ktNtPI1XzhZ0g1OHnfl5N2UX6/dh3zqusyDKFLkqHgPdOWrlWIQaPCuul8x++yBfQIIEYV2kfLAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750268487; c=relaxed/simple;
	bh=/g8pHF1/RVrgJ0Pc+SNNZki6HQmNZWyjtOO510JBXkM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sZFefF7Bx8Ound9zJ2xsdr5ydWCfSNr73PIHBQKKrfOiP0tZqlU5NShsQSdwVPcMUxslEyT+Gs3DB/YxFjoFY2lYqJrYfuzJwDdhIn/pWslepIbmYVsxARP2v+LzEvXsXmcP/yDV5Z70WcQVSSczjvmr1D6B78wgtH28qVhT9xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dbFqTpNV; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dbFqTpNV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268485;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CdeAYiIbvuQl6YyCSbJM0KZ+PwGvgoJ4GiSuuebq9Wc=;
	b=dbFqTpNVHhNZMpsUo+zFiZioHGOyFqWZeJ8+k4rQt7Y0mLV7gAx0amZoYSYoa0SMzMHoOY
	SOGzcTaQWI0IxykAYRqwp+39+hkKVxbYlUSVE1wbq2wmqa9GM6+YRugizfxlPwgHM6ZsHp
	J6kh/N0rers3xEFZvGG0CsiU1MKfDt0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-381-H6deV7rBPimKwF6SZDF2Bw-1; Wed, 18 Jun 2025 13:41:23 -0400
X-MC-Unique: H6deV7rBPimKwF6SZDF2Bw-1
X-Mimecast-MFC-AGG-ID: H6deV7rBPimKwF6SZDF2Bw_1750268483
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-45311704d1fso40533165e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 10:41:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750268482; x=1750873282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CdeAYiIbvuQl6YyCSbJM0KZ+PwGvgoJ4GiSuuebq9Wc=;
        b=nFKDv9TnwbmjksIOdHly+4MdepOnGabo7zgaNaKkquM+1XBF1/6FuP2f6eY0NYm+NE
         i7685MyqcJQOAV6bnSvywEzEnAnRHbQguwmWd2NY1KrP2/SljQQ5zLdf5mNzNd1kiMDv
         GaK/ftEWYqaDdIRQO2gQgnX1+GOpBuDUasifuaxCrhcsmqhNc1/qf7GfOf8AUuxzzYD1
         2k8DPhZAOXZ1iSlvM3SfJxMK/tdFKx2EtElrYxRIbZ6g6Bc726GOxUDZoGhjMgQGv1V/
         mD2wZ5Z6mCiy4y+kNW8o20J0CtX0tVm26XIUI5mmFBUbzOSg7X8rnlRY2gq3iD2kbqap
         90IQ==
X-Gm-Message-State: AOJu0Yx4WGfXhK/csMpiq5pGDRfD8Bn2LoOvXHN2aAkhLQIaPRpVXM2J
	oetdtkRQNRe4zVYwFS7pmhF6Y7JBzHWh7WmpQWwdp96wuPE5gmxZcOO66JXlnnvKLSo69jevuvS
	vbnX73dgWdzuxKZs01u16gxGxEEo90yT0s5GzHppPky6FQZuoDvxk5m6tmcuo+gHR1pnjwYMwEu
	qbGXh1mclTfqZ/Hb6UHK47icqdLtUNkNovBoMWMOtMIvw+2I1l
X-Gm-Gg: ASbGnctPfxHELLTnL9kNPgjf5KErhcS0cx9M4I3LiWAZKULHfr1ITAtIRe/TuT6z/f6
	9ofV0XK2PgrvEw8gnEvBEIvdLSJC2F2ghei6v5cTyP6p+++dFJoDUHnNJ1z5LLu3nDWvQBMIszC
	nYJS+CO725AuMimVIrvY60TWzfNTdQ3/Apfu/FnbhmzvqKJwbiFHKLiU95zq1GtfWhVLelFaJ23
	nYUzoGmu5oTn1fbY86R/sWEFMXhZ9AkKckox2h68ok78d9ajIrfscSFpMxztxNM/HYCzD991J/Z
	Fzbn1eRH1SvfmByCsIFr5d2A/IZI55cIKpom6r5NVYrUQNaUEz4tF0MoHLBVcezRPg5FSnc2ldG
	nig9Ubw==
X-Received: by 2002:a05:600c:3489:b0:453:78f:faa8 with SMTP id 5b1f17b1804b1-4533cacf0b2mr167448235e9.6.1750268482567;
        Wed, 18 Jun 2025 10:41:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrKZ8zfCrGufAh/HvE/XIf55Hjs+1HFJqQV1cfkKzvu6o7QRQJ1IpAcZ7M33DksKCqTfpzKA==
X-Received: by 2002:a05:600c:3489:b0:453:78f:faa8 with SMTP id 5b1f17b1804b1-4533cacf0b2mr167447475e9.6.1750268482090;
        Wed, 18 Jun 2025 10:41:22 -0700 (PDT)
Received: from localhost (p200300d82f2d2400405203b5fff94ed0.dip0.t-ipconnect.de. [2003:d8:2f2d:2400:4052:3b5:fff9:4ed0])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4535ebcee09sm3315485e9.38.2025.06.18.10.41.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 10:41:21 -0700 (PDT)
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
Subject: [PATCH RFC 24/29] mm/page-flags: remove folio_mapping_flags()
Date: Wed, 18 Jun 2025 19:40:07 +0200
Message-ID: <20250618174014.1168640-25-david@redhat.com>
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

It's unused and the page counterpart is gone, so let's remove it.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/page-flags.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index f539bd5e14200..b42986a578b71 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -718,11 +718,6 @@ PAGEFLAG_FALSE(VmemmapSelfHosted, vmemmap_self_hosted)
 #define PAGE_MAPPING_KSM	(PAGE_MAPPING_ANON | PAGE_MAPPING_ANON_KSM)
 #define PAGE_MAPPING_FLAGS	(PAGE_MAPPING_ANON | PAGE_MAPPING_ANON_KSM)
 
-static __always_inline bool folio_mapping_flags(const struct folio *folio)
-{
-	return ((unsigned long)folio->mapping & PAGE_MAPPING_FLAGS) != 0;
-}
-
 static __always_inline bool folio_test_anon(const struct folio *folio)
 {
 	return ((unsigned long)folio->mapping & PAGE_MAPPING_ANON) != 0;
-- 
2.49.0

