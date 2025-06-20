Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C792ECE8A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 19:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750446243; cv=none; b=ClBvy8ucdrBS165g8w2F2OLJ0kdphWw1Y/iiOGN7ou2B/zKSlK6Q3N3YwBy8YUoR1ATOfx+D8jrornGuBOE+V+Acxli6AVWvb1DRu78GSYS7ajVJbktOzrugPRQXiHKBzAWEvztv9oeCT9cD6fOrm7Tpz0r17f67wJEoVAZu6R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750446243; c=relaxed/simple;
	bh=isjtrVfx0a6AusOG3S8uk5U68yHrDAf7ViRy4In41N4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hgYmstWA1CpFABwuQ3zm3CDOjfv1fIhDK2cVk91xmYSKuq1nouiveIAKigxG7k9fmznDGQYz4ZgZrQyLoYReUTd05vVsREGwFzq2115tKWIBnjXUaBohYdgclTrsoXWcMkM7UFVlQaWcEWAPFk6GggBJ0a2ri+3aX4tfva6rsMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=P65FvqkY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P65FvqkY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750446239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cZDbbtIAa6EPMWRofMi/kXSaO7jdlCdJOMqHnRdeIWA=;
	b=P65FvqkYntdZusaKBWXMydPRQ5ZuBy6C+PKBaBLNjup+gcd+K9vX8liErnQD8kqCWgXUeS
	9RLqWmtjDmC7qJnAgu3dj9l7rcNaPbBpMOoi14tyTZGqKU+bWBJTRdXE7Wnm3UHtreiiMG
	1DVlYsYloo8dWmaea4y5YsqXdES9urE=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-370-eNVSKvCqPril4U1uqMb4iA-1; Fri, 20 Jun 2025 15:03:57 -0400
X-MC-Unique: eNVSKvCqPril4U1uqMb4iA-1
X-Mimecast-MFC-AGG-ID: eNVSKvCqPril4U1uqMb4iA_1750446236
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-235f77f86f6so22539795ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 12:03:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750446236; x=1751051036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cZDbbtIAa6EPMWRofMi/kXSaO7jdlCdJOMqHnRdeIWA=;
        b=qlbtDiQzxTs3oRsak3MsjKWHf1LXoMGMveB0e1eQIrQ3EJ6Yt8AEQMSjmYzlgQhUVY
         /oHeM5bFiet9ZXeL+Lu+98O9qn9UgB2B25853ppWMRr4SaD9HzC22mvalBisYEte8xAU
         3XlUPdFUI+aIF8ZpZeZQq7eOpNA6hqbRS3lwS6er89z7d54WGE2jOaq62nV5d+i/iZr8
         zH3ggqhfkufAToqFtXsK5NmwaELgWBfJlJyIzMTvcjTAVLCrV0/xdZ3r3RVas79l3z5x
         6bBuCwkFd18PV5pqym8YEno4yN2cKQhnW2uTEWChb2ghlU1okX7CzesUeUFBWPwtHrzT
         5e1w==
X-Forwarded-Encrypted: i=1; AJvYcCVtqxS3axqJWR4oGzYP6nBqN2e2jQ0gz3dwycJwPhqU6KjrQwicajursNHFPTmGHs15jDd+zFwgCfj/z7c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHt5+pqtvIk6T2WvHDQRxRa52J+Ul4j/3DtNnM+9vk2Myrso6P
	thLwL+CYd1FZsrOo6ib20hzB8Y8WlW/MBCdrs/WU7YPiQh3kRGbhA9BnbsG/emTniGrSgW04NFl
	zcjiztwLPieI56n+pCfzCBcLW8VsDnhk5uCD+b1h6gol7i9nUsaPtFOp7GMtQwdmJRw==
X-Gm-Gg: ASbGnctA4SHjQfvFPn/IEXLROFCA1NueC6nWrmH35MRgEYdpxkC239iNC6NZQunHGe9
	rmjR3/PZmT4fpvhEGHAtKzVO09y/YPMJGK5C8CQfqnKwQf2KXwHamwuH6h80OKnIWwZHaLcpGfe
	SZSy/qdvThdNzllBvKkZqcV2XGmIpC3OsQKFGJB4n4Qh1kEelCwUDByNk0cEIRdxJ8lel+meIPQ
	kuJKUUROOG6dlusudjNDwHieTkN/8q4QJX36WLA5P0PC1wX4wfwAOh/7v2C5aioZDHlin/mcEA8
	zP/S6MC2rus=
X-Received: by 2002:a17:902:d542:b0:234:d399:f948 with SMTP id d9443c01a7336-237d997fda8mr56957855ad.33.1750446236391;
        Fri, 20 Jun 2025 12:03:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGWRVo9lU6CN1+qf1IBzFazCaFwiIFN8m5Wc6/OgMNQb0aQQjMN6hDbpeBJmQP3cfZ3Z1D5Q==
X-Received: by 2002:a17:902:d542:b0:234:d399:f948 with SMTP id d9443c01a7336-237d997fda8mr56957375ad.33.1750446235934;
        Fri, 20 Jun 2025 12:03:55 -0700 (PDT)
Received: from x1.com ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8609968sm24235535ad.136.2025.06.20.12.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 12:03:55 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: Nikita Kalyazin <kalyazin@amazon.com>,
	peterx@redhat.com,
	Hugh Dickins <hughd@google.com>,
	Oscar Salvador <osalvador@suse.de>,
	Michal Hocko <mhocko@suse.com>,
	David Hildenbrand <david@redhat.com>,
	Muchun Song <muchun.song@linux.dev>,
	Andrea Arcangeli <aarcange@redhat.com>,
	Ujwal Kundur <ujwal.kundur@gmail.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	James Houghton <jthoughton@google.com>,
	Mike Rapoport <rppt@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Axel Rasmussen <axelrasmussen@google.com>
Subject: [PATCH 3/4] mm/hugetlb: Support vm_uffd_ops API
Date: Fri, 20 Jun 2025 15:03:41 -0400
Message-ID: <20250620190342.1780170-4-peterx@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250620190342.1780170-1-peterx@redhat.com>
References: <20250620190342.1780170-1-peterx@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the new vm_uffd_ops API for hugetlb.  Note that this only
introduces the support, the API is not yet used by core mm.

Due to legacy reasons, it's still not trivial to move hugetlb completely to
the API (like shmem).  But it will still use uffd_features and uffd_ioctls
properly on the API because that's pretty general.

Cc: Muchun Song <muchun.song@linux.dev>
Cc: Oscar Salvador <osalvador@suse.de>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 mm/hugetlb.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 3d61ec17c15a..b9e473fab871 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -5459,6 +5459,22 @@ static vm_fault_t hugetlb_vm_op_fault(struct vm_fault *vmf)
 	return 0;
 }
 
+#ifdef CONFIG_USERFAULTFD
+static const vm_uffd_ops hugetlb_uffd_ops = {
+	.uffd_features	= 	__VM_UFFD_FLAGS,
+	/* _UFFDIO_ZEROPAGE not supported */
+	.uffd_ioctls	= 	BIT(_UFFDIO_COPY) |
+				BIT(_UFFDIO_WRITEPROTECT) |
+				BIT(_UFFDIO_CONTINUE) |
+				BIT(_UFFDIO_POISON),
+	/*
+	 * Hugetlbfs still has its own hard-coded handler in userfaultfd,
+	 * due to limitations similar to vm_operations_struct.fault().
+	 * TODO: generalize it to use the API functions.
+	 */
+};
+#endif
+
 /*
  * When a new function is introduced to vm_operations_struct and added
  * to hugetlb_vm_ops, please consider adding the function to shm_vm_ops.
@@ -5472,6 +5488,9 @@ const struct vm_operations_struct hugetlb_vm_ops = {
 	.close = hugetlb_vm_op_close,
 	.may_split = hugetlb_vm_op_split,
 	.pagesize = hugetlb_vm_op_pagesize,
+#ifdef CONFIG_USERFAULTFD
+	.userfaultfd_ops = &hugetlb_uffd_ops,
+#endif
 };
 
 static pte_t make_huge_pte(struct vm_area_struct *vma, struct folio *folio,
-- 
2.49.0

