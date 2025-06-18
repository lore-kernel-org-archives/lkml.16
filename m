Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E00E2F49EB
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 17:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750268439; cv=none; b=QGbBsDmta90gm4DMOAPkN3K/BYdNAs6epRXlZisRCRXTH96i+sjrCKEGI90nYTjevpUIesCYxYgaC9iF6Wpq3Bjh/VU+cyrM1nP+gJbrw4vz/WM0SDto2s4FwCxOj2iYFN8VB2ELCw5TCA8CzY/v8Vu9moTq/UN1rExYjKbB4fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750268439; c=relaxed/simple;
	bh=qK/hSpqxPHXWhlFplYYMa5g7zmr2Q/EzGHQmEAB7ZSY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nzFLylRS3EVuCHGN/3I6wUMHY6qvZK7grEO/CHR/3etDzvnzP8tiFUduyRCnpiWCD14MxjKiZC/Uv7VG2eBaoVp/0M+7mq1n97NinjgKQ2vOc4j0dFz76J5b5CVkTZqKLG1NUxyqzwf5if8OAenZbJKgmGemUio/2G/UOPf//Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EhtLsgzf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EhtLsgzf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268433;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fkYbA0acVo3UX9Us91PPuYxLoMCXI95NEZ07wm0hikY=;
	b=EhtLsgzfMZkgE5F0oWe6t92jj8EvCV5QPrIEAA2XI23MHq7o/UlGBzCWlwaYninRVD6j4e
	ojK4KnQ6Ho4L2lBEAMVqSqpBtHeq8FQ43VWuCxkXt2YQH+5sM9B+J5omI5RgMScd5zUWdK
	f6cnQZW5NjLs1Bvgch2kz0ks0+baWio=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-Drez3u-nP5-id_iZxdEzcA-1; Wed, 18 Jun 2025 13:40:31 -0400
X-MC-Unique: Drez3u-nP5-id_iZxdEzcA-1
X-Mimecast-MFC-AGG-ID: Drez3u-nP5-id_iZxdEzcA_1750268430
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4e713e05bso3281477f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 10:40:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750268430; x=1750873230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fkYbA0acVo3UX9Us91PPuYxLoMCXI95NEZ07wm0hikY=;
        b=VX2snBaKzKpP/hBwTRwR3uxo+iqiPyZRBbnbsFmzT9QziIltMXUX0U4N83HJ431RLD
         KpW/Kr021DaEkD7jX8YLQv7+yb/drgognPY+HCdu964Fih7lrtVfegI/knzUI+y8SvxK
         NZDVvQITbfACRnLXhfNH9zpOb+++z6jN8WlTmpKHnYkAmPnchMpqvuLnJbo1roJZL/a1
         fqksTNMkAaa0NmzCI2Q/dio86J9o5WpOg8SelfceSB6fr8u5Ap/4CpnLFb2m63OGQpzU
         CXk89FqF6vAbO9m9a0ld0nRAIusuoTW+q2SGQiHjNszJVehenL77Mvqu1oL5/dT5BgEE
         egWw==
X-Gm-Message-State: AOJu0YxjSM12xlvTYG9aN3Km7/+Kr/GAO8yfZ9wYcieKJGJPBD7YXlKz
	SqdK7VNeA5zFuvQtqWjjq7esmkfrtshSmTcjeSWXcuRK6GyBqShpeiosmA/ND7hf2Co4UPCyYdI
	eTPEA+ahtlogDXK7MCIDSOyPn4VwabAupPo2mYD84Xmx6268YBSkt9OFSWkPkHxdp15NDrqthqo
	Ca2LBHQgdiMWnYXUVhQDcBJax4IeaPh/AsNuLHMmrfU8BIr1TN
X-Gm-Gg: ASbGnctkjdK9ar8DXOiiW5B6gw3U7zoOnPt6b3ErueEdKf4OztpRMlIaO/B9zshUw5W
	RjwcpBIZx+EgE28wKMcluLolYVrqIkZ0pcJDzgPDy4RnlRkK+nA0HKb7NpUiQnMj+vYCxjYLtmF
	453Uku1l2CYaXguiIjuFXkPCvexp0kMVXIhotIugNhoFgzS1fDX64erSD2cKdFfPJ+Dr5QtfKob
	yUURiGLuUV2xJ4TO02GlXX3Hh7NhwMYHyvtg5/ch/f0xteRBkIUqC86lGp3fnBB3LL9++hv3qsU
	gn9MKEZHeJEIy+c+cBebZPTWa6r+wt69XYrINTwh+QYvMdlPq5PFb334mi4JHGZBiNrQiktREsn
	ZDoQSCQ==
X-Received: by 2002:a05:6000:71c:b0:3a4:dc93:1e87 with SMTP id ffacd0b85a97d-3a572367972mr13745254f8f.1.1750268430503;
        Wed, 18 Jun 2025 10:40:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzzxL/ng01qs/lSRwaNlZPiY9y2+iVmfz3gXJp3VGo7LunL2znQ2yg0q95yDx7nL6kngLoWg==
X-Received: by 2002:a05:6000:71c:b0:3a4:dc93:1e87 with SMTP id ffacd0b85a97d-3a572367972mr13745179f8f.1.1750268430076;
        Wed, 18 Jun 2025 10:40:30 -0700 (PDT)
Received: from localhost (p200300d82f2d2400405203b5fff94ed0.dip0.t-ipconnect.de. [2003:d8:2f2d:2400:4052:3b5:fff9:4ed0])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a568b62ba7sm17864640f8f.91.2025.06.18.10.40.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 10:40:29 -0700 (PDT)
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
Subject: [PATCH RFC 05/29] mm/balloon_compaction: make PageOffline sticky
Date: Wed, 18 Jun 2025 19:39:48 +0200
Message-ID: <20250618174014.1168640-6-david@redhat.com>
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

Let the buddy handle clearing the type.

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

