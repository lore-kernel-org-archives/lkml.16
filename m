Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54DC51CBEB9
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 19:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750446238; cv=none; b=XgnhgcnqMD02pK70KuRDp733ajGldZiDkayctmRMjPLaoaa1jZ62bFrhkMJp9iUshJTWaremqczCIwxC2dOp31BUWZ9474nRgOC9u181QuClybcBgkihM4Y67ipJM4S1MCUPX4/j5wfinFJc9pBMbaMv+Wp7BnOfHKZVn6Sl9iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750446238; c=relaxed/simple;
	bh=CHbka3kwIlIu5uqoSTJK00+tYhE92ZV/8pgE2O6+INo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CfnPNb64WBYTywk6wG0r/dsYPDtapDtu0Cws976BmqwVUyvcyYJ9R5PCn70bCTV6Yv2c09ecmFPDIcrBumJKb5BCYoN3HKVd/CnO43zEJ5T2TGk34cU2Ib+SV0yj4uVuaaOhRYzCvWfHj032jcFJont43dGIY3hnDteu/l5BfSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TY7tAl8L; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TY7tAl8L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750446236;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MlVYTqcNyEXwc8zN1rOa2F8O42Bhf5IYSqZeViP+B0U=;
	b=TY7tAl8LbDllrR9GEvsW3xy+bGnIXH6P59+omB5pPP7vbNkXoWfCuaNJT2veYipVsSRMox
	zJHRxiltgzdF2JDidnvGiZCuyeLn6dPVgWPU/CgtdI0oOn1p9Bdyb5A6mETroHoaKMATXv
	HdiBKVZ2bWogLrr+ZsOqGxdz56IxSJ8=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-480-zGLW6fCuNwur870TXoOEGg-1; Fri, 20 Jun 2025 15:03:55 -0400
X-MC-Unique: zGLW6fCuNwur870TXoOEGg-1
X-Mimecast-MFC-AGG-ID: zGLW6fCuNwur870TXoOEGg_1750446234
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-235eefe6a8fso16131285ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 12:03:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750446234; x=1751051034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MlVYTqcNyEXwc8zN1rOa2F8O42Bhf5IYSqZeViP+B0U=;
        b=qpxIuq5lPD5ALd9rtO6G9GBCtrLCg68GqToFErftObhEM+y6wu1+q2ZPCWMLsVK93i
         Tj0h+OnKLYVjg8HKcYYRxIHuFdcFLK/NrrYWk7VzBtYjYbCVXPf1/ZBm2/oiPctdEJ26
         Aa/irn6FyT4j+GM9AZQ0UxTZllL55nnfugZD5xmMb3oTkw5cJ/vlElOOqAAQ+ww2xFCw
         sxn4pU9KKduX/K/g+i+cuMc6iu+bI8C+Ef254YHM3+HYbHo2aeY50GBGWvaKIg1qp9yW
         +0vUkTg66kAm2b3Kt+tx7JESDPYYrq7J33fltpEOwvrmgRuG31sTHsz8OQPlhtNr90oV
         ds9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVZbv9FlDbRoyjpQP2xJ6ibyHGZ5zlxckjohjf2Jr6wSZLJcILbIKWgeqeRfQc6q9fknRZjHu/elsRjvSo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx060FTWIoUDE6lscZ4vbxWczyRdNDUGP+L/jQt4gYibNtX8V7M
	KFx0BnXlQyNubjFzrX3TgDf0SDFlJI2SHilC27byMEOqzyBDbbkdrvLMARtUwGh1I0lPV07Lv3J
	EcnUO9tjfjlRVWgn1KbJRvYIcc5SCpTN+VmXZSZuqlQSNdLN1XDFTaeRQgvKnQUhbCA==
X-Gm-Gg: ASbGncv22pazZxtlUXNgQEjF/ZDBDT/a0ekUNXy13Pb6XX1npJWOENzuhbDVk/xWR6d
	XeBAGB+MSH/i10XaixRaTALxXsk2e3nDL1juqj9o1j2IK41Mllzxqq8yzmq0VxfsHmRtGOA84BG
	pcC34SLaXAxeqze4tcMhEs4da7eHWm5hQHbJowRgj/QNI1MLhJTdh8MrYZUezceQ3QWMIbALqOL
	s34VwnBfcG9mJdzi1HXDA/E1KRBAZ6+ZGxzgspy5HMSN2xG6VNYd9vu7atgrKS8sKZ9S2ddifmk
	CzmuVWOAXc0=
X-Received: by 2002:a17:902:e842:b0:235:ea0d:ae21 with SMTP id d9443c01a7336-237d996585fmr70252305ad.35.1750446233784;
        Fri, 20 Jun 2025 12:03:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+SvCa7Srq7yrsaP9omrf+ymFZqhKwNSmDUngwJyl3buQUDwE3xOiUUDw2ItAjef9vi4uYAw==
X-Received: by 2002:a17:902:e842:b0:235:ea0d:ae21 with SMTP id d9443c01a7336-237d996585fmr70251825ad.35.1750446233263;
        Fri, 20 Jun 2025 12:03:53 -0700 (PDT)
Received: from x1.com ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8609968sm24235535ad.136.2025.06.20.12.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 12:03:52 -0700 (PDT)
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
Subject: [PATCH 2/4] mm/shmem: Support vm_uffd_ops API
Date: Fri, 20 Jun 2025 15:03:40 -0400
Message-ID: <20250620190342.1780170-3-peterx@redhat.com>
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

Add support for the new vm_uffd_ops API for shmem.  Note that this only
introduces the support, the API is not yet used by core mm.

Due to the tailored uffd_copy() API, shmem is extremely easy to support it
by reusing the existing mfill function.

It only needs a separate uffd_get_folio() definition but that's oneliner.

Cc: Hugh Dickins <hughd@google.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 mm/shmem.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/mm/shmem.c b/mm/shmem.c
index 0bc30dafad90..bd0a29000318 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -3151,6 +3151,13 @@ static inline struct inode *shmem_get_inode(struct mnt_idmap *idmap,
 #endif /* CONFIG_TMPFS_QUOTA */
 
 #ifdef CONFIG_USERFAULTFD
+
+static int shmem_uffd_get_folio(struct inode *inode, pgoff_t pgoff,
+				struct folio **folio)
+{
+	return shmem_get_folio(inode, pgoff, 0, folio, SGP_NOALLOC);
+}
+
 int shmem_mfill_atomic_pte(pmd_t *dst_pmd,
 			   struct vm_area_struct *dst_vma,
 			   unsigned long dst_addr,
@@ -5194,6 +5201,19 @@ static int shmem_error_remove_folio(struct address_space *mapping,
 	return 0;
 }
 
+#ifdef CONFIG_USERFAULTFD
+static const vm_uffd_ops shmem_uffd_ops = {
+	.uffd_features	= 	__VM_UFFD_FLAGS,
+	.uffd_ioctls	= 	BIT(_UFFDIO_COPY) |
+				BIT(_UFFDIO_ZEROPAGE) |
+				BIT(_UFFDIO_WRITEPROTECT) |
+				BIT(_UFFDIO_CONTINUE) |
+				BIT(_UFFDIO_POISON),
+	.uffd_get_folio	=	shmem_uffd_get_folio,
+	.uffd_copy	=	shmem_mfill_atomic_pte,
+};
+#endif
+
 static const struct address_space_operations shmem_aops = {
 	.dirty_folio	= noop_dirty_folio,
 #ifdef CONFIG_TMPFS
@@ -5296,6 +5316,9 @@ static const struct vm_operations_struct shmem_vm_ops = {
 	.set_policy     = shmem_set_policy,
 	.get_policy     = shmem_get_policy,
 #endif
+#ifdef CONFIG_USERFAULTFD
+	.userfaultfd_ops = &shmem_uffd_ops,
+#endif
 };
 
 static const struct vm_operations_struct shmem_anon_vm_ops = {
@@ -5305,6 +5328,9 @@ static const struct vm_operations_struct shmem_anon_vm_ops = {
 	.set_policy     = shmem_set_policy,
 	.get_policy     = shmem_get_policy,
 #endif
+#ifdef CONFIG_USERFAULTFD
+	.userfaultfd_ops = &shmem_uffd_ops,
+#endif
 };
 
 int shmem_init_fs_context(struct fs_context *fc)
-- 
2.49.0

