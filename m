Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A155A28B519
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 13:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751288434; cv=none; b=Zf0ENKFWyMz7ETFQYVrNbg16aw1YpsErJWuC49WQmo+9Nob2G6jl2MWAQOgSZi/yXsBnOkBRlPwSqcSW5PnJzO9dwIeZxDxC9VcO83FP5S6WVqhb54RpTwVbLDK4L9teL87GF9iwxYqy2VV8p2xCjDnP1n7sEX6vHBjObTKsIvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751288434; c=relaxed/simple;
	bh=4MxWzYVQT6MaRWyD8DaQIwXKPr34x2kzXAmctRW17zM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QNiierCJYfWPIQqtjLtmGC+zxMeQx2kkmaO3SkE/CXHVSVwfVzLu/j2wTdSJBYSr7unH4mbAITqltB/oilBOLNB+yd0X/9dwljvZZam/H2laxcwZ63lHiBQG8hcE9TdCQmj/j+T45japxSrmApjbhUQXKBhoEblBmDb5je1DA6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YL1ueV3l; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YL1ueV3l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288431;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zonaY4DxD0y8MNMLsQ+Z7vSDV1xV1t770zE0DCe01j4=;
	b=YL1ueV3lc1htpNu3DOcnqiA6+6Ibra5y40drML+EwbXy9ogJ7g6rYd4JOdM7Qlk+HOyP3N
	R81paSK0QRl9RNgSUyRJIaVduSjfJyZ9QIDxSNsFRnkiokhar7ykWMy8OzUAl7CMFfa2TW
	CcInASjBhh/er0bGdMXw4EwgSoJi7qA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-407-eQjIIMptNEmZW2K1395HxQ-1; Mon, 30 Jun 2025 09:00:30 -0400
X-MC-Unique: eQjIIMptNEmZW2K1395HxQ-1
X-Mimecast-MFC-AGG-ID: eQjIIMptNEmZW2K1395HxQ_1751288429
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4530c186394so9153895e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 06:00:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751288429; x=1751893229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zonaY4DxD0y8MNMLsQ+Z7vSDV1xV1t770zE0DCe01j4=;
        b=kW7hTFRYA0nIiqLMHTjHRN2WBq2tXts4cIahfwzpx7Rr/sG9Y2EWUkjHDKSds6E8fr
         tp11sN1s2ptsvfyxPe75tcrPJg1kq/ypC5E7JITX0MQWHm+8QvsQPdQYksjZ29jnBm7q
         pnhDpT/lcATw+fmRpCne51y56M4/jp8IXy6+UOMVzA/zmNAKtqFCSB9XyJ82hJOOyPVm
         yTWPJFiRzmmP1c6ZqjGQ1b5EmNN3LkaM/WW88MwxMFThIHEjuIU8ulfmgy0sFxJ5h/Zb
         PLZfq2BYB7vaw1PH6YYXFN+LUdqBC14i4V1jy+9wH2sXKd6dwXQw1Ou1odVV8T4LHqas
         b6ow==
X-Gm-Message-State: AOJu0Yzr4Uraj4ZA177XXWNDeMAOcBT0dwxj0QucP6bPE1GmirODy2iH
	qailXEzzBck8fdwrPu7TN8yyGKxXMbFQOfwosl2CN+J/9RvA1If4RyI5UD0qqDLbcnnkzy47BSK
	50dlBkbz35SmpT+2wWyXyROn4RI9cQFgxEeWWTuJgnpqu2nXJMgnxjMm1D4HyAAWjqtYdI6X+09
	wBujw8aPMIlYaNNBuIqZD9k0t0OEL1GDi6ReQ+hsQps/0LNkW7
X-Gm-Gg: ASbGnctmEOT++FhD4wLmdNOu9k0lV3vqy+SLdYvXAntyYvDZF6VM4xRHCkUGZlWN+zi
	CwO7fHNketQdnERCyedhtimChWs5xGvu7/FsFsow4/tXgaCtJiVCTma99FlPFylbiXjjbLXw+wF
	F3R2Nvvnr/v4hD6CMOMeg1Pfksizbh62qVgtS/ssvjaK9Zy+9eGSmUXySBTU9ckcQJvLKVW/eKc
	adx2EI3z9UYAqg9tFNX1jHc/DP4+6YI1FakxUcbNn+XsgudPQyKljCr8DM8oY6DjYZ0RKjiPqIO
	H+fLqabXuVVzi9dsDENSeRnu2i93MrdZ7pFqNZt8jPSUlPMGkpz5JVMfqJ9ir2aRChkeJsOFhHl
	jKdNU9SI=
X-Received: by 2002:a05:600c:3b8e:b0:43c:f513:9591 with SMTP id 5b1f17b1804b1-453913c5a63mr120767195e9.14.1751288428984;
        Mon, 30 Jun 2025 06:00:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQsOsTnGBejCVgyOLl0Qh2EVLJQ4G+kbMgNeqpJuJaGM9Kh9Xe41tPUK3+55dbuJ7ci0FJ3Q==
X-Received: by 2002:a05:600c:3b8e:b0:43c:f513:9591 with SMTP id 5b1f17b1804b1-453913c5a63mr120766035e9.14.1751288428255;
        Mon, 30 Jun 2025 06:00:28 -0700 (PDT)
Received: from localhost (p200300d82f40b30053f7d260aff47256.dip0.t-ipconnect.de. [2003:d8:2f40:b300:53f7:d260:aff4:7256])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-453823ad0fesm169262535e9.25.2025.06.30.06.00.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 06:00:27 -0700 (PDT)
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
Subject: [PATCH v1 05/29] mm/balloon_compaction: make PageOffline sticky until the page is freed
Date: Mon, 30 Jun 2025 14:59:46 +0200
Message-ID: <20250630130011.330477-6-david@redhat.com>
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

Let the page freeing code handle clearing the page type.

Acked-by: Zi Yan <ziy@nvidia.com>
Acked-by: Harry Yoo <harry.yoo@oracle.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/balloon_compaction.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/balloon_compaction.h b/include/linux/balloon_compaction.h
index b9f19da37b089..bfc6e50bd004b 100644
--- a/include/linux/balloon_compaction.h
+++ b/include/linux/balloon_compaction.h
@@ -140,7 +140,7 @@ static inline void balloon_page_finalize(struct page *page)
 		__ClearPageMovable(page);
 		set_page_private(page, 0);
 	}
-	__ClearPageOffline(page);
+	/* PageOffline is sticky until the page is freed to the buddy. */
 }
 
 /*
-- 
2.49.0

