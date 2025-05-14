Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B069125D1FD
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 23:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747266240; cv=none; b=BUp0oDZNK++ZQcivVjxkZql/I9NkwPVs6BWg0igyoeV4uPZBpgWyXFIurd++QDF9wq5EEb3tGWQZ82GMcGyM1QsAKsWCwNkDZop62B7cFQpJ/vAPRMI4+j5k3NJgk61BG/DSMyCcWEVLijFf7emNVe+bWfDk+/Q+Q0JMgKx5FTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747266240; c=relaxed/simple;
	bh=102GvifG4zt1ttrSz67mMu9EOxHXu/R1+sbn9BQTSZg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MPpNLVud1I1CZKp/wiya60bDe8MvrEPFMAfCzIIcR2TWmIbcpBALEd5WjRb73kgHS7fDGKmoNPJUBV6FGkVoyLyFfXPwWBIyhKvT+3oa4clsiOtJl2Ny5pIPm92mRSLTP+PZhKhVCp9oryfdUcs27Fg3D97lHhPN6bBBwzskHpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=N+4E1C+O; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="N+4E1C+O"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-22e45821fd7so3487065ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 16:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747266238; x=1747871038; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=pmGFcMqll2ZECWkoZDuet36vvCpdEEo2q3JYb5OCRKk=;
        b=N+4E1C+O66u/2AsRaBgT91MJS9ng42C+9NjRXQ3YNyKU42nyuFhpbcN/JwWuKvlEPU
         en9fcu8azoG/a1PQ9ifKcy0UelB0dOwmMHBEn3F8BobX7Y0NcbQu84cWord+3mL4H/ln
         xiQIdnqLrpcgCGVHBFog50fU327p7AhtoEDvulCt5TV1Ze50XVp/fOCRUloIh8ssPVQ5
         QIVgG7r7e36Z6YwJl7QyeK0b4B+WCmU4koDKATAzizKCStQeElL5CQBd25B78Mmo1UDa
         xfPtDymGbD34ZlOi7ghcLmQfbgRHlM3lNj5NTX7DORFiAHu4VCebVNrob22VaWRdbc6f
         K2XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747266238; x=1747871038;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pmGFcMqll2ZECWkoZDuet36vvCpdEEo2q3JYb5OCRKk=;
        b=DJCgROdP5ugMuWknl+l8x30YAfkilGlc59Mhf+WgUKo/pLs2KQagPzKHIfvX1vTHMQ
         Is8+EkhswW+qoN5Os797nqE2AU4rnBwkeLaiBPZ59leYsM33qD+Lfez2Lbful7DQc/fE
         HV6WN81Qmp2z/DDeo8mb+4h671xpIDOX4LOZJUs518zVsFGv2u8uX1zvTlcqQAm+Rr8d
         Iz90GSuucEJ6wROfywCVZErj1Bu1gHZFXHkaK48NNmk7zhcJX7/bODhXiSx4Ie6l/h89
         KAbYVcTCqquDrD2hslLt2SAtm1W5TOGL6wxWD9mQDRLBBSQ+kS/iZd1g/1q06vZeyHGu
         IAZg==
X-Forwarded-Encrypted: i=1; AJvYcCWzloIRZta1/ae6z7lI/WWQlxtRt8v8jHlvqOz8QrQx9SO1fxePvYxBi/WC9LKrTSov9HEmvgXtdtd9Zww=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo4QUSl824taSvHoMbneWq+Hhx4cWmAW+f+U/270OpFNBUBgdZ
	wUEVapzUNUuP/4lMUZf+x+I1zb3PPhu0Um49Iy1KAj49qRx01WGjxzYVdGCj+Dif9RwP7IOZKUO
	IIAOMFff2wOYJNzSviLaJ3A==
X-Google-Smtp-Source: AGHT+IGyG3aK+TPRgSsxWpjag/A4ruHzJ2SmD21jLoxWwmPBfdNpP7Yc+Ypfwlkx2TEetNXBaMC3rrsf4RqZeQwBkA==
X-Received: from pjbsz11.prod.google.com ([2002:a17:90b:2d4b:b0:308:7499:3dfc])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:228a:b0:223:60ce:2451 with SMTP id d9443c01a7336-231b5e26004mr6306905ad.15.1747266237995;
 Wed, 14 May 2025 16:43:57 -0700 (PDT)
Date: Wed, 14 May 2025 16:42:18 -0700
In-Reply-To: <cover.1747264138.git.ackerleytng@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1747264138.git.ackerleytng@google.com>
X-Mailer: git-send-email 2.49.0.1045.g170613ef41-goog
Message-ID: <625bd9c98ad4fd49d7df678f0186129226f77d7d.1747264138.git.ackerleytng@google.com>
Subject: [RFC PATCH v2 39/51] KVM: guest_memfd: Merge and truncate on fallocate(PUNCH_HOLE)
From: Ackerley Tng <ackerleytng@google.com>
To: kvm@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	x86@kernel.org, linux-fsdevel@vger.kernel.org
Cc: ackerleytng@google.com, aik@amd.com, ajones@ventanamicro.com, 
	akpm@linux-foundation.org, amoorthy@google.com, anthony.yznaga@oracle.com, 
	anup@brainfault.org, aou@eecs.berkeley.edu, bfoster@redhat.com, 
	binbin.wu@linux.intel.com, brauner@kernel.org, catalin.marinas@arm.com, 
	chao.p.peng@intel.com, chenhuacai@kernel.org, dave.hansen@intel.com, 
	david@redhat.com, dmatlack@google.com, dwmw@amazon.co.uk, 
	erdemaktas@google.com, fan.du@intel.com, fvdl@google.com, graf@amazon.com, 
	haibo1.xu@intel.com, hch@infradead.org, hughd@google.com, ira.weiny@intel.com, 
	isaku.yamahata@intel.com, jack@suse.cz, james.morse@arm.com, 
	jarkko@kernel.org, jgg@ziepe.ca, jgowans@amazon.com, jhubbard@nvidia.com, 
	jroedel@suse.de, jthoughton@google.com, jun.miao@intel.com, 
	kai.huang@intel.com, keirf@google.com, kent.overstreet@linux.dev, 
	kirill.shutemov@intel.com, liam.merwick@oracle.com, 
	maciej.wieczor-retman@intel.com, mail@maciej.szmigiero.name, maz@kernel.org, 
	mic@digikod.net, michael.roth@amd.com, mpe@ellerman.id.au, 
	muchun.song@linux.dev, nikunj@amd.com, nsaenz@amazon.es, 
	oliver.upton@linux.dev, palmer@dabbelt.com, pankaj.gupta@amd.com, 
	paul.walmsley@sifive.com, pbonzini@redhat.com, pdurrant@amazon.co.uk, 
	peterx@redhat.com, pgonda@google.com, pvorel@suse.cz, qperret@google.com, 
	quic_cvanscha@quicinc.com, quic_eberman@quicinc.com, 
	quic_mnalajal@quicinc.com, quic_pderrin@quicinc.com, quic_pheragu@quicinc.com, 
	quic_svaddagi@quicinc.com, quic_tsoni@quicinc.com, richard.weiyang@gmail.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, roypat@amazon.co.uk, 
	rppt@kernel.org, seanjc@google.com, shuah@kernel.org, steven.price@arm.com, 
	steven.sistare@oracle.com, suzuki.poulose@arm.com, tabba@google.com, 
	thomas.lendacky@amd.com, usama.arif@bytedance.com, vannapurve@google.com, 
	vbabka@suse.cz, viro@zeniv.linux.org.uk, vkuznets@redhat.com, 
	wei.w.wang@intel.com, will@kernel.org, willy@infradead.org, 
	xiaoyao.li@intel.com, yan.y.zhao@intel.com, yilun.xu@intel.com, 
	yuzenghui@huawei.com, zhiquan1.li@intel.com
Content-Type: text/plain; charset="UTF-8"

Merge and truncate on fallocate(PUNCH_HOLE), but if the file is being
closed, defer merging to folio_put() callback.

Change-Id: Iae26987756e70c83f3b121edbc0ed0bc105eec0d
Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 virt/kvm/guest_memfd.c | 76 +++++++++++++++++++++++++++++++++++++-----
 1 file changed, 68 insertions(+), 8 deletions(-)

diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index cb426c1dfef8..04b1513c2998 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -859,6 +859,35 @@ static int kvm_gmem_restructure_folios_in_range(struct inode *inode,
 	return ret;
 }
 
+static long kvm_gmem_merge_truncate_indices(struct inode *inode, pgoff_t index,
+					   size_t nr_pages)
+{
+	struct folio *f;
+	pgoff_t unused;
+	long num_freed;
+
+	unmap_mapping_pages(inode->i_mapping, index, nr_pages, false);
+
+	if (!kvm_gmem_has_safe_refcount(inode->i_mapping, index, nr_pages, &unused))
+		return -EAGAIN;
+
+	f = filemap_get_folio(inode->i_mapping, index);
+	if (IS_ERR(f))
+		return 0;
+
+	/* Leave just filemap's refcounts on the folio. */
+	folio_put(f);
+
+	WARN_ON(kvm_gmem_merge_folio_in_filemap(inode, f));
+
+	num_freed = folio_nr_pages(f);
+	folio_lock(f);
+	truncate_inode_folio(inode->i_mapping, f);
+	folio_unlock(f);
+
+	return num_freed;
+}
+
 #else
 
 static inline int kvm_gmem_try_split_folio_in_filemap(struct inode *inode,
@@ -874,6 +903,12 @@ static int kvm_gmem_restructure_folios_in_range(struct inode *inode,
 	return 0;
 }
 
+static long kvm_gmem_merge_truncate_indices(struct inode *inode, pgoff_t index,
+					   size_t nr_pages)
+{
+	return 0;
+}
+
 #endif
 
 #else
@@ -1182,8 +1217,10 @@ static long kvm_gmem_truncate_indices(struct address_space *mapping,
  *
  * Removes folios beginning @index for @nr_pages from filemap in @inode, updates
  * inode metadata.
+ *
+ * Return: 0 on success and negative error otherwise.
  */
-static void kvm_gmem_truncate_inode_aligned_pages(struct inode *inode,
+static long kvm_gmem_truncate_inode_aligned_pages(struct inode *inode,
 						  pgoff_t index,
 						  size_t nr_pages)
 {
@@ -1191,19 +1228,34 @@ static void kvm_gmem_truncate_inode_aligned_pages(struct inode *inode,
 	long num_freed;
 	pgoff_t idx;
 	void *priv;
+	long ret;
 
 	priv = kvm_gmem_allocator_private(inode);
 	nr_per_huge_page = kvm_gmem_allocator_ops(inode)->nr_pages_in_folio(priv);
 
+	ret = 0;
 	num_freed = 0;
 	for (idx = index; idx < index + nr_pages; idx += nr_per_huge_page) {
-		num_freed += kvm_gmem_truncate_indices(
-			inode->i_mapping, idx, nr_per_huge_page);
+		if (mapping_exiting(inode->i_mapping) ||
+		    !kvm_gmem_has_some_shared(inode, idx, nr_per_huge_page)) {
+			num_freed += kvm_gmem_truncate_indices(
+				inode->i_mapping, idx, nr_per_huge_page);
+		} else {
+			ret = kvm_gmem_merge_truncate_indices(inode, idx,
+							      nr_per_huge_page);
+			if (ret < 0)
+				break;
+
+			num_freed += ret;
+			ret = 0;
+		}
 	}
 
 	spin_lock(&inode->i_lock);
 	inode->i_blocks -= (num_freed << PAGE_SHIFT) / 512;
 	spin_unlock(&inode->i_lock);
+
+	return ret;
 }
 
 /**
@@ -1252,8 +1304,10 @@ static void kvm_gmem_zero_range(struct address_space *mapping,
  *
  * Removes full (huge)pages from the filemap and zeroing incomplete
  * (huge)pages. The pages in the range may be split.
+ *
+ * Return: 0 on success and negative error otherwise.
  */
-static void kvm_gmem_truncate_inode_range(struct inode *inode, loff_t lstart,
+static long kvm_gmem_truncate_inode_range(struct inode *inode, loff_t lstart,
 					  loff_t lend)
 {
 	pgoff_t full_hpage_start;
@@ -1263,6 +1317,7 @@ static void kvm_gmem_truncate_inode_range(struct inode *inode, loff_t lstart,
 	pgoff_t start;
 	pgoff_t end;
 	void *priv;
+	long ret;
 
 	priv = kvm_gmem_allocator_private(inode);
 	nr_per_huge_page = kvm_gmem_allocator_ops(inode)->nr_pages_in_folio(priv);
@@ -1279,10 +1334,11 @@ static void kvm_gmem_truncate_inode_range(struct inode *inode, loff_t lstart,
 		kvm_gmem_zero_range(inode->i_mapping, start, zero_end);
 	}
 
+	ret = 0;
 	if (full_hpage_end > full_hpage_start) {
 		nr_pages = full_hpage_end - full_hpage_start;
-		kvm_gmem_truncate_inode_aligned_pages(inode, full_hpage_start,
-						      nr_pages);
+		ret = kvm_gmem_truncate_inode_aligned_pages(
+			inode, full_hpage_start, nr_pages);
 	}
 
 	if (end > full_hpage_end && end > full_hpage_start) {
@@ -1290,6 +1346,8 @@ static void kvm_gmem_truncate_inode_range(struct inode *inode, loff_t lstart,
 
 		kvm_gmem_zero_range(inode->i_mapping, zero_start, end);
 	}
+
+	return ret;
 }
 
 static long kvm_gmem_punch_hole(struct inode *inode, loff_t offset, loff_t len)
@@ -1298,6 +1356,7 @@ static long kvm_gmem_punch_hole(struct inode *inode, loff_t offset, loff_t len)
 	pgoff_t start = offset >> PAGE_SHIFT;
 	pgoff_t end = (offset + len) >> PAGE_SHIFT;
 	struct kvm_gmem *gmem;
+	long ret;
 
 	/*
 	 * Bindings must be stable across invalidation to ensure the start+end
@@ -1308,8 +1367,9 @@ static long kvm_gmem_punch_hole(struct inode *inode, loff_t offset, loff_t len)
 	list_for_each_entry(gmem, gmem_list, entry)
 		kvm_gmem_invalidate_begin_and_zap(gmem, start, end);
 
+	ret = 0;
 	if (kvm_gmem_has_custom_allocator(inode)) {
-		kvm_gmem_truncate_inode_range(inode, offset, offset + len);
+		ret = kvm_gmem_truncate_inode_range(inode, offset, offset + len);
 	} else {
 		/* Page size is PAGE_SIZE, so use optimized truncation function. */
 		truncate_inode_pages_range(inode->i_mapping, offset, offset + len - 1);
@@ -1320,7 +1380,7 @@ static long kvm_gmem_punch_hole(struct inode *inode, loff_t offset, loff_t len)
 
 	filemap_invalidate_unlock(inode->i_mapping);
 
-	return 0;
+	return ret;
 }
 
 static long kvm_gmem_allocate(struct inode *inode, loff_t offset, loff_t len)
-- 
2.49.0.1045.g170613ef41-goog

