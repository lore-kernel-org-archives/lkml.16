Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B08D2E9EA7
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 15:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751039229; cv=none; b=QbCj4SzmeGicKXRk/Pt/SFq6U5xl51A0pGgcQYg+dZCOAURuZHtQhRxN+ix/Qb2vEv37PmAFaGwAE+zMaZmq4HjnhP9DgIk1voJyuGWgzJkLxsUP36hEO8TnjdcDy1JSAvzV4/Zqi5EWEwEN9DUn7xYPglHAz2E6iaaQjAH72UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751039229; c=relaxed/simple;
	bh=znDgLA4PCa0dI46kISScS4QqE/4p3uzAS+5TqbQUTHI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=obUa5Z7N+CKGF6w0bxvxuoMT/uIyNP4Mov0cylv3r0paOC5YZecr3jafBqs5CHfjX4Cc5b4fvQfKgDJxJsUOpjlxHbevcwoQFM8DiI2vcevz+x2EQ3tbc6oqGyVWGtZbKF8M8eITMmUEyW+MYNvm5XsQvueApeY9xunWC7iSslA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fqF5i0IE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fqF5i0IE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751039226;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4s5p6yQ8BzE2xSNqwYo7qQuoEVz15qoQNKU3WjAr+jY=;
	b=fqF5i0IExfh7FFoyv79AztQf/2f6C+QhxSEOcKAlsCJuxmEsmyoGyLtSBkIXMpYOB8vYhJ
	yDwdR/urp4zpMETZHUcEZg4VMucg3TiYu++rB3tq5aNAZA+ggnCkCETEMRj5Y+9vNQAn8r
	wQoFaITs8SdMrlrIHHMNGrL+UcjiyKg=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-561-NXpfctAZNe257W2ABn_X1w-1; Fri, 27 Jun 2025 11:47:04 -0400
X-MC-Unique: NXpfctAZNe257W2ABn_X1w-1
X-Mimecast-MFC-AGG-ID: NXpfctAZNe257W2ABn_X1w_1751039224
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fad2a25b65so38077496d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 08:47:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751039224; x=1751644024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4s5p6yQ8BzE2xSNqwYo7qQuoEVz15qoQNKU3WjAr+jY=;
        b=xD/zTtMwQSEGc06I1gd5bvUVrrdCG3A6eSuhVL1QwO5r9ZcZA0TxTiBlyb0Eh0+uoi
         0VA5ywpcAjcoPhQpBbLAmmwFm+2DxYTaO+qwxkLQjLzIi/6lYggQOc3HFMdPBir1qE/t
         +dCiHrMdDYlFfUwQjxxgFJJbfeEKe/TCaAx+0VRqJDD4L/aOW4HtUDcRKY0MaQNWGRA6
         ss2a9X8zVzIoZgSgiWY4w1bYSFcVd4VrlQh634n7DdYUNRu59kiZfjORkrhOLCPuMdDf
         CzucqwCWMC+uyynKitRsxxPEgRDYAc/VQQyn+gfzCPCHlTG2C/dPstW+NGfl2Gt4NJ9Z
         vNAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLZ3vbkRIhDludeIxV2Hi+m1Q/nT3+zvrJu85AezxycVdEIcljxXBPDJni6JAJp3qIreNOFm43bcVCSaQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywxcbovo2MNmMBm+9OPXK9VC1focg45+XLL5QpjGtDbDCujmSpm
	9e+0niCp1uhvXjRpGsz6YwfWKILoV84Knsap3T3phFn7irA2RgOBg3mPU85jB+8NgeUWI7s4Zo2
	+cQkaoiUeBRNw7xGOElk08e/6GdZtqPcdrI5sr2biX0TzMmwLYklXYHSfozhG0YqC0Q==
X-Gm-Gg: ASbGncusrK+NQRm6fE9nRh+GRdLi2T4xT7HICc7UG5I5gcef7GWs/4y7cnAgzbo0Tpo
	gc8q7E+1GS3Fa3SUxJ7ovgTwKxrUxBS+BumCxoUm9irlNsEKOCqvNCbkT2J00QIUQRp8evtmFgX
	ojbTtMXdnmrW7NVV1Zfw6yK6xlphYKh6lRwTMtcIjmpmzTsiTn2zhIunwM/EDy7T9KKKAnno6Nx
	+8A5hfYjesUmfwiq4iiH13GOveHq6hWK61Vqdk+YiWuImPxvnI+ioRZfSliPt/ELZnB9hh1x/gX
	Fo20FQ+iunc=
X-Received: by 2002:a05:6214:248d:b0:6cb:ee08:c1e8 with SMTP id 6a1803df08f44-7001378bc2emr77815216d6.23.1751039224358;
        Fri, 27 Jun 2025 08:47:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrpemk2muCVBZAJdk1MH+sryhPpY7XYDf5g/Kyt5Bk9fidyZgNPYd2fX9DgN0JanIjEVqfIA==
X-Received: by 2002:a05:6214:248d:b0:6cb:ee08:c1e8 with SMTP id 6a1803df08f44-7001378bc2emr77814886d6.23.1751039223990;
        Fri, 27 Jun 2025 08:47:03 -0700 (PDT)
Received: from x1.com ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd772e4fddsm22296066d6.65.2025.06.27.08.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 08:47:02 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: Vlastimil Babka <vbabka@suse.cz>,
	Suren Baghdasaryan <surenb@google.com>,
	Muchun Song <muchun.song@linux.dev>,
	Mike Rapoport <rppt@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Hugh Dickins <hughd@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	James Houghton <jthoughton@google.com>,
	peterx@redhat.com,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Nikita Kalyazin <kalyazin@amazon.com>,
	Michal Hocko <mhocko@suse.com>,
	David Hildenbrand <david@redhat.com>,
	Andrea Arcangeli <aarcange@redhat.com>,
	Oscar Salvador <osalvador@suse.de>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Ujwal Kundur <ujwal.kundur@gmail.com>
Subject: [PATCH v2 2/4] mm/shmem: Support vm_uffd_ops API
Date: Fri, 27 Jun 2025 11:46:53 -0400
Message-ID: <20250627154655.2085903-3-peterx@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250627154655.2085903-1-peterx@redhat.com>
References: <20250627154655.2085903-1-peterx@redhat.com>
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
index 2b19965d27df..9a8b8dd4709b 100644
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

