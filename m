Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3BA28B7FE
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 13:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751288493; cv=none; b=Cra7quxUisWV8pvOwDCEsp81jOZQQZqj9jzkkX0R3/5QgDHADxgLs8k3BWdGxjwdFsWXYrvN4+FSdmuS9YrLyhsyTDAzH1cBt2+zXzwtaGLhmxuEAHc5EQhyhmiH+hugdWc39RMejSumbdJSi9ivx1zW6NMIw+uoNqzLMQMKHyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751288493; c=relaxed/simple;
	bh=isaI58t0kWAv0VvFIE40k9qBORzA058ggEZ88nMmJIs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oLNvC84ckBuwhXH5xoYL/3wKrKMfivG9DbMlkuuCrIkUZWoWxN4OyvGUetDJB0zvAUCKOo6RKuHvJnIG4E+VvPLm+UhfgtszhcSzrWVYO0rOP5kiU5oQucoN7hpror3uIUtV1UEdFTRTDN474m4R2b3tDwl/tOiuz1//cEjLhJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DjcjmF5Q; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DjcjmF5Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=olXYTUdhc5G5HcwZfX2j4qOOcGFF0hDyepBOzPt910g=;
	b=DjcjmF5QXc4e4sCCO+Y+sKXbONV97BF2T9CM950rqRPpWxOAFha0su0cBeKrUKFT4O3zek
	tPuCDnGPtAM4yhMwCO8zBLKvf3exzFrVygM/cL05QObO4JzmPuojvE6Y5Lt8wlsqzlrfbT
	BAVEQiDEjJ5JFncrracmQSku/rd4Hko=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-481-12c2_6HIPl6J9-uC3n7dKw-1; Mon, 30 Jun 2025 09:01:28 -0400
X-MC-Unique: 12c2_6HIPl6J9-uC3n7dKw-1
X-Mimecast-MFC-AGG-ID: 12c2_6HIPl6J9-uC3n7dKw_1751288487
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-45320bfc18dso22231915e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 06:01:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751288487; x=1751893287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=olXYTUdhc5G5HcwZfX2j4qOOcGFF0hDyepBOzPt910g=;
        b=F0WC+GHbFMIXloZu1BSw47RZs5ykWkaQ2MnonAF3sjv/hannmlhNOsELQ3E1OcKH71
         rh+K8nSY7DNlfFRaoWY03bmhv4XoO3r/iaYJIa9c080r9DZSu/zIIERi2g+AUNHEFvpR
         hP9DLssxDOe3WyW40654YeDl/iZe+8Ppw4Nom4zeNrw1ihvM4J3EnLyb541h4V6z3Ubi
         0Q2E/eRfjbXAdcmxmjAPvUlwyuZ25VaiEuyligiKq6oWDbHJf0/BPIMNiDBOsLiXLgn9
         nrqakA4BcdCs9roZB6eO0Q3bTHG9f4nFwjDrnqSsiv/nBVY39OL0szIqBiihtuMsa/d/
         xukw==
X-Gm-Message-State: AOJu0YzHjCxvVCqtxekSx0tHsi9DfOqAqU0pPckEM1k9iHxIF98eYRdD
	aK9L32N3Q31j7Yz64SmlzsezsIzbQ49bdm1Yv2kKj5kDToVa61m9oc0y2mXonZM2BBawc0CIHWh
	odG5AutjLroFuTKQpnvRzld9vJd7FrBsC8Gh86qA98uYR6rfXtB642Ii1o+RuPQrSc3IwN511Cm
	9+m75eGrbit75JejT4gkMfbP688MLDnx+tdqYwm6XSo4iibIYS
X-Gm-Gg: ASbGncuV77BwM7kWGVIeM4Ni9pevutC7uLSEgS5lxH1y/TDw3rDHe4cmqw1l9rqjvug
	y69XF0uz3tkej1IhrHHLNkdl4LemzdiRLKtZYoO4/gs/jILyLkrBhyEtnEWOgfpmSRWSr0W2eAH
	pTSowJKxVlPDsDaCI21QIu5XXb7loLx5qIYKVicOH1U0rmJB4ChEh1zrWOAq5xeV7XX6sby0T15
	rKvlQeduBsFISmZuFL1xLaMXAsHOMBFHavLHDWcvKR3XweydR3EIMGdRylajMNGsadkMoLCG0aL
	RQh0p0f/pRZodPH5+Y/GC1x26MKLPYfpSGntionK9dzIsx0h71Z0U46LRRdPnC8VqWWYV+QSp4Q
	YKjg7zCo=
X-Received: by 2002:a05:600c:5306:b0:442:f4a3:a2c0 with SMTP id 5b1f17b1804b1-4538f308f2amr124064825e9.13.1751288486413;
        Mon, 30 Jun 2025 06:01:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9JbLrxBujZu2VjgMn1mCOlcQzRUhKdRhzGdc0P5pPEt9jKXPpDvx4Rwh6D/+Yae/APwbOBQ==
X-Received: by 2002:a05:600c:5306:b0:442:f4a3:a2c0 with SMTP id 5b1f17b1804b1-4538f308f2amr124062795e9.13.1751288484673;
        Mon, 30 Jun 2025 06:01:24 -0700 (PDT)
Received: from localhost (p200300d82f40b30053f7d260aff47256.dip0.t-ipconnect.de. [2003:d8:2f40:b300:53f7:d260:aff4:7256])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-453823b913esm162071665e9.33.2025.06.30.06.01.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 06:01:24 -0700 (PDT)
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
Subject: [PATCH v1 24/29] mm/page-flags: remove folio_mapping_flags()
Date: Mon, 30 Jun 2025 15:00:05 +0200
Message-ID: <20250630130011.330477-25-david@redhat.com>
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

It's unused and the page counterpart is gone, so let's remove it.

Reviewed-by: Zi Yan <ziy@nvidia.com>
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

