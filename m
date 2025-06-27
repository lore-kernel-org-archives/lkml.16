Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6875D155757
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 15:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751039227; cv=none; b=WtbhbNOjbxXGS8BCfo9oiwndwTUuq4l5U6ANe2UMG30QMOidKimqVuZ6EKJj8EjQ4k4Cpn7AXbIH1qHRaELe1JiVREPGa1f1FW2Svd72uf2w+RWyAZHy1tsr1HR2hEqUkZQFvT5gl0k4JkmvG5vCj3aPYccPR3V9U7hyRRTHwnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751039227; c=relaxed/simple;
	bh=5y2NXz4YcakKthlfKuz6nEMFhFMBDqUAhRLuI0MP5Rk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BIDHWkemgMWsQLZyYnQtWjzDtfiPGHFqIO8B08B5jXq8gLD/Zjo1R3SRkfXRB/ssy9/cuumoZ2LN46efKk2iX21W/kqj+yuQKU5d8nXICm+SG7/m+ah8V1yrQFOP+EvvzgdhOsToqMsLszPzn08PfG8GTuYROO2mtTpVZFF0OyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VqpRFRjq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VqpRFRjq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751039224;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DdfSKdvyHqltB4jBxjhCDVFPXPlOAjjmfzthyT7ql+g=;
	b=VqpRFRjq/sDXYemcSdXlSDf/KgBwvlrQIFW7msj43bPOxrabwmb0xsnJdpwUnHuHlxMHUP
	4Bd03R/wgXqjV1a0tZfxAlTVhZjX3W2nPDFt3sXXaBhtc928NGNoRiSCwez5oip+5nByCF
	jPIi/rSD95qrusp5azSipR/6k2/gqeI=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-70-Xqz-G3FYPG2u_w_9TCqa8A-1; Fri, 27 Jun 2025 11:47:02 -0400
X-MC-Unique: Xqz-G3FYPG2u_w_9TCqa8A-1
X-Mimecast-MFC-AGG-ID: Xqz-G3FYPG2u_w_9TCqa8A_1751039222
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fd3aeb2825so78104586d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 08:47:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751039222; x=1751644022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DdfSKdvyHqltB4jBxjhCDVFPXPlOAjjmfzthyT7ql+g=;
        b=tbz9+j7YuhLRBQOkXAxBEmCQmmF49QdsRamfQrAHreRRKCOb70lT0XDQXbTY6h4txi
         rfcLBM9gyBE/W4b9wkmFHHkuld4Vxsa1Z/7zNgVeZKe5UAPszHmhem959yV6jDo15nUw
         HGG8G7lh3iTcnidV0z1cxKGi2FfV802GcDq1QDxWA0wHSLetLBGh6DdyzjEcUH4rmge7
         uHlioJH5jM9YrrRDPS9GloE/TJ2h8EiogDHzAD1PolsJB5YuHJERKUsFDdlfSCtyvoBV
         0+riqTVARwFO2ToVQKZqaOUDc+V+thvKBXUl6pZXS6Wih2Ul1glfPtOVozomY2Hjf99s
         3NHA==
X-Forwarded-Encrypted: i=1; AJvYcCV4C6bzN3HQh4AduqBkzCOo0wmA5Av3uQMrOyoAfpG4GY53ziWV5xxSVYJ7sddsyLfODrUl1YPsfqNZxKY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4O4xnaqqyIMRcgP+7ohLxbRd/CF4v95VS4ZUCb6XboCrTsuOW
	ogDeh5a9fgD6gAgeLe9VwsWnTiT2fekGXv0FjG8PRfcaU3F+E4HXbJk0yu+Y80oHWL+42osZisR
	vktv15MRWRP8ro2cjoYmDm4bk7eVlA8eTX4R4q/GI+6QAx4I2S/7zquZ1cZI2v8UUKg==
X-Gm-Gg: ASbGncvaU1/pmaWH3g6KuwXP1w9mIG9wDcN7XjaSFuLtcVrtSOwMZS/hd43WMfa3jvo
	k/SA1KEpwIGoq7hH0ot+fXLW51uFtLTxJoFvIXLXV1vqhNRNvlcdH9sZXz5cWlROPSXZLKuuiwL
	BrUBxM0bHURiMuWByqhaZU+0GYWp3ebuKqfRzosjhcRoxdfYidpqmpI0v/HDqAnZl+cjOIDy73I
	pPJwuNPkt3VJqGa5PL57z6FYMwF6SIXh+6oaaxikJX31FsbOmpP04J9EMaoxTHn1roh6igUo3i5
	CpYt4lA2WcA=
X-Received: by 2002:a05:6214:4287:b0:6fa:b03f:8a39 with SMTP id 6a1803df08f44-70002918557mr69776216d6.35.1751039222191;
        Fri, 27 Jun 2025 08:47:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqPx1Yiq6pj0PPzBl/SyDQ/yJvfWNr26rAFkehOuVMiuG+zZIZjshG/+mWcNwt5gDb3iVcZA==
X-Received: by 2002:a05:6214:4287:b0:6fa:b03f:8a39 with SMTP id 6a1803df08f44-70002918557mr69775896d6.35.1751039221825;
        Fri, 27 Jun 2025 08:47:01 -0700 (PDT)
Received: from x1.com ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd772e4fddsm22296066d6.65.2025.06.27.08.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 08:47:01 -0700 (PDT)
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
Subject: [PATCH v2 1/4] mm: Introduce vm_uffd_ops API
Date: Fri, 27 Jun 2025 11:46:52 -0400
Message-ID: <20250627154655.2085903-2-peterx@redhat.com>
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

Introduce a generic userfaultfd API for vm_operations_struct, so that one
vma, especially when as a module, can support userfaults without modifying
the core files.  More importantly, when the module can be compiled out of
the kernel.

So, instead of having core mm referencing modules that may not ever exist,
we need to have modules opt-in on core mm hooks instead.

After this API applied, if a module wants to support userfaultfd, the
module should only need to touch its own file and properly define
vm_uffd_ops, instead of changing anything in core mm.

Note that such API will not work for anonymous. Core mm will process
anonymous memory separately for userfault operations like before.

This patch only introduces the API alone so that we can start to move
existing users over but without breaking them.

Currently the uffd_copy() API is almost designed to be the simplistic with
minimum mm changes to move over to the API.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/linux/mm.h            |  9 ++++++
 include/linux/userfaultfd_k.h | 52 +++++++++++++++++++++++++++++++++++
 2 files changed, 61 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index ef40f68c1183..6a5447bd43fd 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -576,6 +576,8 @@ struct vm_fault {
 					 */
 };
 
+struct vm_uffd_ops;
+
 /*
  * These are the virtual MM functions - opening of an area, closing and
  * unmapping it (needed to keep files on disk up-to-date etc), pointer
@@ -653,6 +655,13 @@ struct vm_operations_struct {
 	 */
 	struct page *(*find_special_page)(struct vm_area_struct *vma,
 					  unsigned long addr);
+#ifdef CONFIG_USERFAULTFD
+	/*
+	 * Userfaultfd related ops.  Modules need to define this to support
+	 * userfaultfd.
+	 */
+	const struct vm_uffd_ops *userfaultfd_ops;
+#endif
 };
 
 #ifdef CONFIG_NUMA_BALANCING
diff --git a/include/linux/userfaultfd_k.h b/include/linux/userfaultfd_k.h
index df85330bcfa6..c9a093c4502b 100644
--- a/include/linux/userfaultfd_k.h
+++ b/include/linux/userfaultfd_k.h
@@ -92,6 +92,58 @@ enum mfill_atomic_mode {
 	NR_MFILL_ATOMIC_MODES,
 };
 
+/* VMA userfaultfd operations */
+struct vm_uffd_ops {
+	/**
+	 * @uffd_features: features supported in bitmask.
+	 *
+	 * When the ops is defined, the driver must set non-zero features
+	 * to be a subset (or all) of: VM_UFFD_MISSING|WP|MINOR.
+	 */
+	unsigned long uffd_features;
+	/**
+	 * @uffd_ioctls: ioctls supported in bitmask.
+	 *
+	 * Userfaultfd ioctls supported by the module.  Below will always
+	 * be supported by default whenever a module provides vm_uffd_ops:
+	 *
+	 *   _UFFDIO_API, _UFFDIO_REGISTER, _UFFDIO_UNREGISTER, _UFFDIO_WAKE
+	 *
+	 * The module needs to provide all the rest optionally supported
+	 * ioctls.  For example, when VM_UFFD_MISSING was supported,
+	 * _UFFDIO_COPY must be supported as ioctl, while _UFFDIO_ZEROPAGE
+	 * is optional.
+	 */
+	unsigned long uffd_ioctls;
+	/**
+	 * uffd_get_folio: Handler to resolve UFFDIO_CONTINUE request.
+	 *
+	 * @inode: the inode for folio lookup
+	 * @pgoff: the pgoff of the folio
+	 * @folio: returned folio pointer
+	 *
+	 * Return: zero if succeeded, negative for errors.
+	 */
+	int (*uffd_get_folio)(struct inode *inode, pgoff_t pgoff,
+			      struct folio **folio);
+	/**
+	 * uffd_copy: Handler to resolve UFFDIO_COPY|ZEROPAGE request.
+	 *
+	 * @dst_pmd: target pmd to resolve page fault
+	 * @dst_vma: target vma
+	 * @dst_addr: target virtual address
+	 * @src_addr: source address to copy from
+	 * @flags: userfaultfd request flags
+	 * @foliop: previously allocated folio
+	 *
+	 * Return: zero if succeeded, negative for errors.
+	 */
+	int (*uffd_copy)(pmd_t *dst_pmd, struct vm_area_struct *dst_vma,
+			 unsigned long dst_addr, unsigned long src_addr,
+			 uffd_flags_t flags, struct folio **foliop);
+};
+typedef struct vm_uffd_ops vm_uffd_ops;
+
 #define MFILL_ATOMIC_MODE_BITS (const_ilog2(NR_MFILL_ATOMIC_MODES - 1) + 1)
 #define MFILL_ATOMIC_BIT(nr) BIT(MFILL_ATOMIC_MODE_BITS + (nr))
 #define MFILL_ATOMIC_FLAG(nr) ((__force uffd_flags_t) MFILL_ATOMIC_BIT(nr))
-- 
2.49.0

