Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C2B3009B5
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 17:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750268471; cv=none; b=ZJ5V0Y9VU8goqTobd5WebeE9RWmbmNGLME/lhSR/MzirkIR6dNy/0R+2rHhLEspoqvCJHqM9z3pu7IDGd639bMOkqJsPqxefk9UPWS1RxvAh2oHVa5uigWb6BI5cEJDU8Abj9J5AhEcPNwNo9hnDhsc/2grCsPzr95bVGMe9z/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750268471; c=relaxed/simple;
	bh=0evh8/P+NmJQ1hFz8tzRv5gkRTQcHLHrxi5Nv+XvqCw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GmlWQF26ptq/Y5RcZYaz0XBTjanZwImZANYmpYWuDsp4wwQNWgFWvqxV9OXsX1e8Ar/xHeEeKPssAsyxdZHBx0g6ii/cZlEzeDjPbArjjXpVqAUzZ4vxOgnRbekg8rMaESROgB7Bjuz4Ak3WnjkTOIzxHLDYY9wg6lH37SUsv2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Lf/v1WoG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Lf/v1WoG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268465;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iZh2vT8OhFDnKR2hfytPb7VOtq98Q1N4tcWXpFSfOT0=;
	b=Lf/v1WoGNfdJWpjvHWaEdIqCe1OX99Rlgk9Ij/xdBDOWkSlGuvURUSWKPROkcC9tpL4Rhq
	KNjaPHF5jKiMgWprJJjjLLYM3UAgMQOsj8lICZSv7ioUNlpu03DOzNYo415GkQrwlW/cZU
	Xb8u3zIZg7mCVN8jlTnSeX9a3cdZ+W8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-121-_Fq86aqxMCiCZKp_4FyRnA-1; Wed, 18 Jun 2025 13:41:04 -0400
X-MC-Unique: _Fq86aqxMCiCZKp_4FyRnA-1
X-Mimecast-MFC-AGG-ID: _Fq86aqxMCiCZKp_4FyRnA_1750268463
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a5780e8137so531024f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 10:41:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750268463; x=1750873263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iZh2vT8OhFDnKR2hfytPb7VOtq98Q1N4tcWXpFSfOT0=;
        b=qczFDp4hNKwpvBwMZ7DHkuqbmNHuZyDSHd43obCowh7tkz555v9T6GnlOQ1wuJ5oTG
         CvGllX8jlPDo1GipUja4YLVCuSjJFDibjd2JmTGaHZmO2HX6+aqEcC8plTCCpJePsNLG
         GCzcA5z3z6gnOE8hsDYwzsfS9VeM47Cs4taLh+uoWIUgpH1r6eTetAXR04pM6kg8Uzga
         mRQL/It7XrGsYdz+IiebpwbaN3QtiNEg0u4QXPgsJtgMWmqVDU4LuBI2pSMXSJpy8ZeB
         cw49EMZIvOPZp2BtxEPfQhvvYEJPwCnO5IELJE0ZPrGv3eqS3/Cjn9o3pKiAvqb+uIBM
         vagQ==
X-Gm-Message-State: AOJu0YzyVqn+gZdQhAcsmj7+Fm2jCUZzGjnd9NhcUR/fCKSP8bA6x0Gf
	pgfJU6dqY2ivFfSF9TAJtd5ObFFdhEB4N2s7GcG9/vNcRhSv4ZiP0tRbhEqKGizVifVhz3d87B+
	bbvLpSWoclBgxrLuVDwSVUtq0RaRA/c8bl+BIT8cA59pe8VQa0zLIDN50FpJbAEpmJlNLIQgi/3
	D2Y9kWCTf7aqSFNl8XFU3holNeO90iyNWgTMG8pmT6sU8F9VpZ
X-Gm-Gg: ASbGncszO+KeDwbGxzuA73hQJqYjyEEWXBa12UBq+IWo7iDP6WR8MflBSKFJ/9jMT3E
	Wx1Vdt3EfCrwdvb3oPHrnuwdgELR+3+liLr5CHakGtlNf3GxXtu6On9X3f4BnmKMS7Uj5z0K8UB
	9Nte7LmP+h3P4mYXXk1T3tFzwvikyCc7B5zCaabiXcPe2TNo830JsgxvNGvV85OEIu5JrmFt1Y+
	Vwvlieyvxc+GMi4Ka74xTzNtREwtnCyeF0Cj6EyFqzkE6NN0HeZKjZOulnHtZw6sNuu+EYTQkyc
	hsKjkH5wUQ0FtpuSJUGisWrjXZcb0XwOXuadiepnDlrVpd0owBDtG7vNa8SGDGkhBJcq3Xc5KtW
	B3EC0gw==
X-Received: by 2002:a05:6000:2a04:b0:3a4:e1f5:41f4 with SMTP id ffacd0b85a97d-3a6c971ce8dmr252847f8f.17.1750268463078;
        Wed, 18 Jun 2025 10:41:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIfeWEl0T3CJLW2Q374pwGp0+w6+6OG/MMLaU0GvL+YMoweLR1hXiYpIsPjINzwYBpzh5jeg==
X-Received: by 2002:a05:6000:2a04:b0:3a4:e1f5:41f4 with SMTP id ffacd0b85a97d-3a6c971ce8dmr252776f8f.17.1750268462550;
        Wed, 18 Jun 2025 10:41:02 -0700 (PDT)
Received: from localhost (p200300d82f2d2400405203b5fff94ed0.dip0.t-ipconnect.de. [2003:d8:2f2d:2400:4052:3b5:fff9:4ed0])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-453596df276sm20306265e9.0.2025.06.18.10.41.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 10:41:02 -0700 (PDT)
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
Subject: [PATCH RFC 17/29] mm/page_isolation: drop __folio_test_movable() check for large folios
Date: Wed, 18 Jun 2025 19:40:00 +0200
Message-ID: <20250618174014.1168640-18-david@redhat.com>
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

Currently, we only support migration of individual non-folio pages, so
we can not run into that.

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

