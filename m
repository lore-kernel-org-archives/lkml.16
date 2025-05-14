Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E62921348
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 18:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747245735; cv=none; b=VTWXIxDbndfM1NCQU9Hzlj39ni/38zwj3Kyoo7sLZkS88jIW2NKPK5IiTbrMAe+mzRUML/DwaY1Gxij/wnCeeMQMCB6bbyRJ4UlO06dddMOTxj54jArAcpsH5RUl5jldGu6Z4KhVeEP6LxHoBWzYtRCyHojnagkXoDMZXLxnIsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747245735; c=relaxed/simple;
	bh=0Nrfm3Nf9Zx8RUs1cbKjPiuKqqo5HNgrXRNIgxSHjUg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A9gq+3XGTeyhzGJYwFkWNwR7ZW7MNMKWiK/cVpDqS8+R4rPpnJxOFphfoh6arS/9XmpBv7bLJNGAQOgkLXhrowxIUubbwmHRpI9NlwMcC4GIzq+gU4Jz4JVcY7N5NBAtCmE0kxSwE0XBBS1sFz5sqe+pIkdTVEQAc8sye7mY8dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F3XpEkHg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F3XpEkHg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747245732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=829jWq9v+mfMDPX2geL7wicz1x81Omla9QORxkV/k20=;
	b=F3XpEkHgqhKduXCu7aXa8Gf7iwMc3cytpHMRcirIRFW8brKmtDbGuc2YcEQ9ZyYTMAoSq8
	/LBhc+6tVeyu/E7whe/whbaZX0qfiQqHEA5JYjGjmwgXQjzYwfHTZYYrGFOeOonVJShbRu
	Wkj+8tox1IXqgiY3ooua6CzZATVjQZ0=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-125-7eAi1eN5MICRqXyuSMu4Dg-1; Wed, 14 May 2025 14:02:11 -0400
X-MC-Unique: 7eAi1eN5MICRqXyuSMu4Dg-1
X-Mimecast-MFC-AGG-ID: 7eAi1eN5MICRqXyuSMu4Dg_1747245731
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f5486b2f00so2220436d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 11:02:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747245731; x=1747850531;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=829jWq9v+mfMDPX2geL7wicz1x81Omla9QORxkV/k20=;
        b=gZZ5ZUxN7gVIH1WPBCvjk3Rs2NiwrHx/hgAI935hb+1qqnq59jU9WKfvaqihwYtTkr
         UwrQ2diPcLryPFQ/IcR9aheXJzdY5c5Ydw+2wx8Okd+CvXQGSCaDhvZ5BtR4fBiVSV1a
         ODdGYaTvtBVjoQm0C/dgpztqUF79NJMeKl+vBbvG51XKtFPXfV49ydHMpiFcuWkEDA8z
         Kv3GNGawzA8iAHj5snCRmhcFw50Qh7eZ/dmXrvmADFCbkHJz5pdw03BhhPud5IUD5eLw
         W5RV7Vkuzl6kQ+mPNPZH3ohaozj5IkWl9O1gja/n3WM97GrIfOQf+Px1aLZ0ekwRusH5
         FmxA==
X-Gm-Message-State: AOJu0YxtrNRfIdOCcWs61YJOJQSbjuysM6ZfBI+MsmxBf4qFK+Z/rIjp
	1T9pD6P8NM6ltadIMZhGTcZHc0JZOQ3i9Yos/KQ+t+nSR/fxCUZ0bsvvscHfLSDIbbzOOTMOOH3
	vX6nbVHXpAmMWRqHyr1zwYmK2JuweJr4f865wGlH0FQjoQEOXC9vyqmU1bR7pLQ==
X-Gm-Gg: ASbGncsXCofVyKPSZGmFJHpl5P7oeZQaPDj8B2l1ZL6Ry8wAJk4Av+Nddggn/fVVnNy
	9wHH5zHcVEoDbU18v2lXsLh9HmtdQbn4TmdOONq1QrutsfoKS1LwxtdeirA+UrYEu3d7OpckpmK
	csagb9oUx9QYkwKb1hVUmxTR01ssRcuqmoFfQ6UT+B7d6PuA92uhn6J9f4P/0yw0Ka8CvklnqT7
	hZMEhDGUZsnwd1IIBrZsgi5jVFX6QNJbXSqNnAwVwP0igcyY4fD1DNBluK1Ihuc9L94pNbRVLhJ
	ijNnax/mvEgWWGyoFBbotL4J5iQgXuDalt1Y3f9/WOA=
X-Received: by 2002:ad4:5ba3:0:b0:6e2:3761:71b0 with SMTP id 6a1803df08f44-6f8a318471cmr7623846d6.5.1747245730835;
        Wed, 14 May 2025 11:02:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHihCvsDNg+KNgZipkOFnNnS70/fG6gACBZer5xpIAo6hhWZo3wAparzap8rnzwGYfpQthN7Q==
X-Received: by 2002:ad4:5ba3:0:b0:6e2:3761:71b0 with SMTP id 6a1803df08f44-6f8a318471cmr7623206d6.5.1747245730233;
        Wed, 14 May 2025 11:02:10 -0700 (PDT)
Received: from jkangas-thinkpadp1gen3.rmtuswa.csb ([2601:1c2:4301:5e20:98fe:4ecb:4f14:576b])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f6e3a60479sm83616096d6.120.2025.05.14.11.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 11:02:09 -0700 (PDT)
From: Jared Kangas <jkangas@redhat.com>
To: willy@infradead.org,
	akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	Jared Kangas <jkangas@redhat.com>
Subject: [PATCH] radix tree: fix kmemleak false positive in radix_tree_shrink()
Date: Wed, 14 May 2025 11:01:37 -0700
Message-ID: <20250514180137.363929-1-jkangas@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Kmemleak periodically produces a false positive report that resembles
the following:

unreferenced object 0xffff00000db613b8 (size 576):
  comm "systemd", pid 1, jiffies 4294987015
  hex dump (first 32 bytes):
    00 22 01 00 00 00 00 00 28 1c d5 c5 00 00 ff ff  ."......(.......
    10 e4 6c c0 00 00 ff ff d0 13 b6 0d 00 00 ff ff  ..l.............
  backtrace (crc 520d6e1c):
    kmemleak_alloc+0xb4/0xc4
    kmem_cache_alloc+0x288/0x2b0
    radix_tree_node_alloc.constprop.0+0x214/0x364
    idr_get_free+0x3d0/0x690
    idr_alloc_u32+0x120/0x280
    idr_alloc_cyclic+0xe8/0x1b4
    __kernfs_new_node+0x118/0x5a0
    kernfs_create_dir_ns+0x8c/0x1fc
    cgroup_create+0x1cc/0x8a0
    cgroup_mkdir+0x13c/0x90c
    kernfs_iop_mkdir+0x108/0x184
    vfs_mkdir+0x3c8/0x5f0
    do_mkdirat+0x218/0x290
    __arm64_sys_mkdirat+0xe0/0x140
    invoke_syscall.constprop.0+0x74/0x1e4
    do_el0_svc+0xd0/0x1dc

This is a transient leak that can be traced to radix_tree_shrink(): when
root->xa_head is set, kmemleak may have already started traversing the
radix tree. If this has happened, but kmemleak fails to scan the new
xa_head before it moves, kmemleak will see it as a leak until the radix
tree is scanned again.

Mark the new xa_head as a transient leak to prevent this false positive
report.

Signed-off-by: Jared Kangas <jkangas@redhat.com>
---
 lib/radix-tree.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/lib/radix-tree.c b/lib/radix-tree.c
index 976b9bd02a1b5..79b3702a0cb54 100644
--- a/lib/radix-tree.c
+++ b/lib/radix-tree.c
@@ -509,6 +509,14 @@ static inline bool radix_tree_shrink(struct radix_tree_root *root)
 		if (is_idr(root) && !tag_get(node, IDR_FREE, 0))
 			root_tag_clear(root, IDR_FREE);
 
+		/*
+		 * Kmemleak might report a false positive if it traverses the
+		 * tree while we're shrinking it, since the reference moves
+		 * from node->slots[0] to root->xa_head.
+		 */
+		if (radix_tree_is_internal_node(child))
+			kmemleak_transient_leak(entry_to_node(child));
+
 		/*
 		 * We have a dilemma here. The node's slot[0] must not be
 		 * NULLed in case there are concurrent lookups expecting to
-- 
2.49.0

