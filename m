Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F821CAA9E
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 21:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743196540; cv=none; b=usztvAE1bqH2iF3g0QrJVh78eQ4gQkXkzElHibnfnq8ygt48/zWj3FQrKj9AT8X3KVj3KK6pWH1zkXGqUwixSivnvgiL77YYZvdjh8n+/TLRXroQmjoXuT7BuF+FTh30tsdb6sVGrLY6Hxc0Y/H2826uwNMndKdFLXMyDU5hw9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743196540; c=relaxed/simple;
	bh=tZFwzGfSYAuIByw2ZdY1WpwZUroqIUlEQluU1a14x2I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qpfMqT8ZBIZ/JBomeo34y/PEQUhOx0/1vh19sFxkM6RY519lz3acVNN5/iDKf0tWLcsU3LFsH5PnpcAl3QU4/FBIfGKADB0RP2QfrWk7XZPCUOQZUcHAE+CjOB6UJ6csRxyHd81qMu4WkydKA8s9ngs6u18vLQegooarQmW09ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Eev4V3bc; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Eev4V3bc"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-223a7065ff8so17735755ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 14:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743196538; x=1743801338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qbUbFTWJD7pwB3jiRDiQvtUN69ijb2DE0TXBdNZ7PTw=;
        b=Eev4V3bcDX5YGIMxMo1tybarkR0JyblsNaazw5uux4w/iLFzan0fRml10hUputx63A
         dc0o69MykzI2Fg8HdfReCMtqZaOwVw3rwHUA01Aa9ppPD2knCzj6Y/fFO8bT3n145AdY
         gX1wBfmQvGKslgqSVMCFdvltXOjw5FdYq9ioJxwi6b9qMAARg/auRG4hAUVkm7AKvNgT
         qn3pHNXkGodFWZ+SqSPi/J+OKXqLDPhXO9KrgrXwYJr0ONHMDBpOTA91PHzo08E82zJB
         K3Ba3b5yLfVajcvlR6CZHTCLWZzd91LzsZTh3vV3Qupb3RJpycjUnPrpQfHZ2VAeZODm
         9Ytg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743196538; x=1743801338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qbUbFTWJD7pwB3jiRDiQvtUN69ijb2DE0TXBdNZ7PTw=;
        b=GqiFvHLnjQNygYMXqOfC/1r82HR43SGUkYv2N9YRBZ5BOV3HtskTtgVIjAUXhGZ6ua
         i2cvealiV5OICFwihjH9lAk7LTaGaehOgXE+MUdoC2H+hvEe7IgvqYTzG+tK8QdZEmhe
         w3WCtoeYxbqECDaq4HCgdd2caq79oGfFwNPf22l4it2Y6KsU8GpocZRDyQ5yPYE9BcHF
         0+tJsCcRh4FyPEMpStqXey/3drfd5tE/126zXWWDt+9KtB6pwizckdtX6xbW8hVdtkjy
         l9gKCSj0dzIza8jLYKfBz5zkzssa4Z0BFM9h5d+s0Uly9rkQAsCR1o9IdYZGThLjDbkV
         3wNg==
X-Forwarded-Encrypted: i=1; AJvYcCWoKqTqnFQIr9qr6L8u44DceYSl7kmB+W+VUml4McCN7hmmwi6HousT3aw+57KTyr6p/F7b1C29B9CK3oI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOwEsB/uXSlwuhoABtCClHzG7OEmc5ZrCl++E75Z9T7gBQVLvZ
	52NH+RdxWQzw3fcT2e/MFpIMyyNTmzZx+/qwqKusYHcZmg6uCPpb
X-Gm-Gg: ASbGncthernVW7JJrVRM8+ZUK3oT1Aye4qUlBmyxLKLm/SrFCArw7M8FW4i9CY6ZYGI
	JgpTRm7m1c3MMMjAfOhatk3v0LJXNXSdDhCuVGgw2F5hGIgeBtf4dMBi+koMqpm4efftp8mA2QF
	5b8BVbxBacQ9umG3zI0vUrPPDICseSyiBxp1amSJNZLaCc/PJcU8flgZp4ZCYL7CSCbqQvlqDvw
	B8sGArC0oZRA5j6le5zqHMPrf+M7hLI8yb4z9U6pTpBOpCMh07SI22y+ei0QVEU8nfWI6GfEWdh
	PSQ4MWTm/icX+J5jxB1m/tqMcjNF1sz0OYTU53xn4p8r0zRsyd/T7GLoNBivYXBBVhM8KNZX/hi
	4WHtjHQqbacG85w==
X-Google-Smtp-Source: AGHT+IHDjHmSibHj5GGIUXlXojDC4EIiLsffxfiVyP6HzgNznyb+FNdMvwg2bsWgDhCZDfRyWVRkGw==
X-Received: by 2002:a17:90b:51c6:b0:2ff:5ed8:83d1 with SMTP id 98e67ed59e1d1-305320af2camr1021006a91.19.1743196537935;
        Fri, 28 Mar 2025 14:15:37 -0700 (PDT)
Received: from fedora.. (c-67-164-59-41.hsd1.ca.comcast.net. [67.164.59.41])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-30516d55fbasm2407137a91.15.2025.03.28.14.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 14:15:37 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Brendan Jackman <jackmanb@google.com>,
	Huan Yang <link@vivo.com>,
	linux-kernel@vger.kernel.org,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Subject: [RFC PATCH v2 1/1] mm/vmalloc: Introduce vmap_file()
Date: Fri, 28 Mar 2025 14:13:49 -0700
Message-ID: <20250328211349.845857-2-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250328211349.845857-1-vishal.moola@gmail.com>
References: <20250328211349.845857-1-vishal.moola@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vmap_file() is effectively an in-kernel equivalent to calling mmap()
on a file. A user can pass in a file mapping, and vmap_file() will map
the specified portion of that file directly to kernel virtual space.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 include/linux/vmalloc.h |   2 +
 mm/vmalloc.c            | 113 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 115 insertions(+)

diff --git a/include/linux/vmalloc.h b/include/linux/vmalloc.h
index 31e9ffd936e3..d5420985865f 100644
--- a/include/linux/vmalloc.h
+++ b/include/linux/vmalloc.h
@@ -192,6 +192,8 @@ extern void vfree_atomic(const void *addr);
 
 extern void *vmap(struct page **pages, unsigned int count,
 			unsigned long flags, pgprot_t prot);
+void *vmap_file(struct address_space *mapping, loff_t start, loff_t end,
+			unsigned long flags, pgprot_t prot);
 void *vmap_pfn(unsigned long *pfns, unsigned int count, pgprot_t prot);
 extern void vunmap(const void *addr);
 
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 3ed720a787ec..b94489032ab5 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3475,6 +3475,119 @@ void *vmap(struct page **pages, unsigned int count,
 }
 EXPORT_SYMBOL(vmap);
 
+/**
+ * vmap_file - map all folios in a file to virtually contiguous space.
+ * @mapping: The address space to map.
+ * @start: The starting byte.
+ * @end: The final byte to map.
+ * @flags: vm_area->flags.
+ * @prot: page protection for the mapping.
+ *
+ * Maps a file into contiguous kernel virtual space. The caller is expected
+ * to ensure that the folios caching the file are present and uptodate. The
+ * folios must remain so until the file is unmapped.
+ *
+ * If @start or @end are not PAGE_ALIGNED, vmap_file() will round
+ * @start down and @end up to encompass the desired pages. The
+ * address returned is always PAGE_ALIGNED.
+ *
+ * Return: the address of the area or %NULL on failure.
+ */
+void *vmap_file(struct address_space *mapping, loff_t start, loff_t end,
+		unsigned long flags, pgprot_t prot)
+{
+	struct vm_struct *area;
+	struct folio *folio;
+	unsigned long addr, end_addr;
+	const pgoff_t first = start >> PAGE_SHIFT;
+	const pgoff_t last = end >> PAGE_SHIFT;
+	XA_STATE(xas, &mapping->i_pages, first);
+
+	unsigned long size = (last - first + 1) << PAGE_SHIFT;
+
+	if (WARN_ON_ONCE(flags & VM_FLUSH_RESET_PERMS))
+		return NULL;
+
+	/*
+	 * Your top guard is someone else's bottom guard. Not having a top
+	 * guard compromises someone else's mappings too.
+	 */
+	if (WARN_ON_ONCE(flags & VM_NO_GUARD))
+		flags &= ~VM_NO_GUARD;
+
+	area = get_vm_area_caller(size, flags, __builtin_return_address(0));
+	if (!area)
+		return NULL;
+
+	addr = (unsigned long) area->addr;
+	end_addr = addr + size;
+
+	rcu_read_lock();
+	xas_for_each(&xas, folio, last) {
+		phys_addr_t map_start;
+		int map_size, err;
+		bool pmd_bound, is_first_map;
+
+		if (xas_retry(&xas, folio))
+			continue;
+		if (!folio || xa_is_value(folio) ||
+				!folio_test_uptodate(folio))
+			goto out;
+
+		is_first_map = (addr == (unsigned long) area->addr);
+		map_start = folio_pfn(folio) << PAGE_SHIFT;
+		map_size = folio_size(folio);
+
+		/* We can unconditionally calculate values for the first
+		 * folio. This lets us handle skipping pages in the first
+		 * folio without verifying addresses every iteration.
+		 */
+		if (is_first_map) {
+			map_size -= (first - folio->index) << PAGE_SHIFT;
+			map_start += (first - folio->index) << PAGE_SHIFT;
+		}
+
+		if (addr + map_size > end_addr)
+			map_size = end_addr - addr;
+
+		/* We need to check if this folio will cross the pmd boundary.
+		 * If it does, we drop the rcu lock to allow for a new page
+		 * table allocation.
+		 */
+
+		pmd_bound = is_first_map ||
+			(IS_ALIGNED(addr, PMD_SIZE)) ||
+			((addr & PMD_MASK) !=
+			((addr + map_size) & PMD_MASK));
+
+		if (pmd_bound) {
+			xas_pause(&xas);
+			rcu_read_unlock();
+		}
+
+		err = vmap_range_noflush(addr, addr + map_size,
+				map_start, prot, PAGE_SHIFT);
+
+		if (pmd_bound)
+			rcu_read_lock();
+
+		if (err) {
+			vunmap(area->addr);
+			area->addr = NULL;
+			goto out;
+		}
+
+		addr += map_size;
+	}
+
+out:
+	rcu_read_unlock();
+	flush_cache_vmap((unsigned long)area->addr, end_addr);
+
+	return area->addr;
+}
+EXPORT_SYMBOL_GPL(vmap_file);
+
 #ifdef CONFIG_VMAP_PFN
 struct vmap_pfn_data {
 	unsigned long	*pfns;
-- 
2.48.1

