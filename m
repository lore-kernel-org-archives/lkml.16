Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48E38F4C
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 00:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738282769; cv=none; b=oIxbXElyE20PNV0vS9DfnFmv2p604jF7iA4YTBgVI/AK2D7caaFHu7g94MQ6XWPiovoX48Rydzya0El/xX5aOTLvEC/4SoIZyvB/0QGTuW1sc22jsUN4SLzadHp/r2qYydfIZWmRc8r7GFiclWX8eMhR4gjflKGlnQ/hOn6FnbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738282769; c=relaxed/simple;
	bh=Z8A8zDbagp/XGpsnfvOBu/9pG4H2jbSPaAAgIqxxrKc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HZ4MswTq4xpjhNNRKQEbbL2Irr3azcrJjUIJNizkKK6Mwz41G/DhWNczaGGL+jOQhtdXU57wyMGfsbv2bPYZJFzaqfzCJG87m5H0haLlKSjY29LOod0fjSEopQc5IYrnDvIAHOFjminHE8vI8FvBL4djxiOTX2aYYNY6XOFqmps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eyMwiKTf; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eyMwiKTf"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2f13acbe29bso3989825a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 16:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738282767; x=1738887567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TyKozpykEAjFCoENnU5v7/kSmkHMXuR/AybReX8XXa8=;
        b=eyMwiKTfsG8wsdIU8P29WQJRpfAeKbnVkH0tw/p1VgozGoiYbuUHosW2+Nzejrm35+
         Op0KLEfDr0C5O2gsQXBgsJdG2gNKx6e7ILMCk64fQaDHM+26pvlB+LyiKhq0N69dMxNj
         w0XTu/fJeSWWn3VxoWAiigZM85xzdCGv7lDnib+dNPJAxtFxxJKxtArhrLNbJTWgwton
         dgY9FKT1eLcuyaAbN0svdAwyGBjq7P+5VZtSoSDpIGenEuMJWi/2NFi8pVTC+cwgvFpC
         4WohGDrcTdyfGxnh6oz/0vDoC9TLDGecjAdHTkjcpnw4qtAPAVMm78M55ZgalTo2DOCF
         uSkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738282767; x=1738887567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TyKozpykEAjFCoENnU5v7/kSmkHMXuR/AybReX8XXa8=;
        b=rVGR/G9VAQbfRjdyNyzzSWTxmKh56lcXnIVBe1Nl2KQ6zeVcmKeeQ8pQGseBhVJ+Ct
         +2LQ8wX5sVTJT6mYQwrXz2YpxyXIDP0CnJLoRb49a8o1oNHzdg6BazloftGVmTjLfc59
         y7v7zMzwaLNPWUWlc5KemfwgTVmo5QBUUjrGRyOP85LwOFInMgnUaPMwkvl7b3zy1jPt
         kvLmc+aVlY437J7RnwzH98bkvbRXbZbCdw+SpPlnXRaYLSMSQQCTci0HJSqvW5phovYe
         37AqmMIDtA/AfAYjQpQhss5msSTucZthgzodY8Zshc+dnchWRDYY14M2C3fxOt+vYJtq
         yxxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEhIowDzdiKJJf7iUD37diCaaKtEfJWSSXsUi2KJks0y2kd08tkWiFF3O+prBL+KYbRV8/3cBk+3K3Y6A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLEKZk3R4lb3m01dRo+PwwuUYGOiTCJ6O8JPv5E82xQoEftAeI
	MbiSJ66u5BCzkh0PwGR98pUXjbcFMpjltTjOmRguZ8c7VRJhR+YWKQmLVw==
X-Gm-Gg: ASbGncv09LpTFZmQq7eAtofyUw34rdXAlxZMrcsUPHpf6+CsnALrcW7nBS2vLPSstwr
	qhXZRzarafxSUaWfrs0ms5EUtKouHtsHBBcMD3fy/T4oWkEw1WPi4k2UKiGX87/e9bgYJP1tkdh
	Pze8PYk5NVeVCALGWag0bzb/O2NgGWmbIjyDnNYju3PQZ+JoMOl/43uUz30JOBChmQrBkM/8joI
	6t+jjHnaJAlMTmEE/GT01KAnuU/22I5jJlqJP+d3dLU8g5xVvcDI4d03XkUCAXKSxa1ap27n1G6
	wh2o86PFZmj/r6tnNMjc8hN174Cx3lWP0wBv/jX90HV4JARbrQ==
X-Google-Smtp-Source: AGHT+IGTcJ0wEj7nw/VAr9mFtCvAOb9swQCbE3NNKbAN9EVVCz2Q0TQQOwiAKxPFXeABEt6KtjxpUQ==
X-Received: by 2002:a05:6a00:1386:b0:725:41c4:dbc7 with SMTP id d2e1a72fcca58-72fe2d1f669mr9530361b3a.4.1738282766749;
        Thu, 30 Jan 2025 16:19:26 -0800 (PST)
Received: from fedora.. (c-67-164-59-41.hsd1.ca.comcast.net. [67.164.59.41])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-72fe6429218sm2148234b3a.66.2025.01.30.16.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 16:19:26 -0800 (PST)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: akpm@linux-foundation.org
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	hch@infradead.org,
	urezki@gmail.com,
	intel-gfx@lists.freedesktop.org,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Subject: [PATCH 1/2] mm/vmalloc: Introduce vmap_file()
Date: Thu, 30 Jan 2025 16:18:05 -0800
Message-ID: <20250131001806.92349-2-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250131001806.92349-1-vishal.moola@gmail.com>
References: <20250131001806.92349-1-vishal.moola@gmail.com>
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
 include/linux/vmalloc.h |  2 +
 mm/vmalloc.c            | 97 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 99 insertions(+)

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
index a6e7acebe9ad..4b1e31a8aad9 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3475,6 +3475,103 @@ void *vmap(struct page **pages, unsigned int count,
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
+ * @start down and @end up to encompass the entire range. The
+ * address returned is always PAGE_ALIGNED.
+ *
+ * Return: the address of the area or %NULL on failure.
+ */
+void *vmap_file(struct address_space *mapping, loff_t start, loff_t end,
+		unsigned long flags, pgprot_t prot)
+{
+	struct vm_struct *area;
+	struct folio *folio;
+	unsigned long addr;
+	pgoff_t first = start >> PAGE_SHIFT;
+	pgoff_t last = end >> PAGE_SHIFT;
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
+
+	rcu_read_lock();
+	xas_for_each(&xas, folio, last) {
+		int err;
+		bool pmd_bound;
+
+		if (xas_retry(&xas, folio))
+			continue;
+		if (!folio || xa_is_value(folio) ||
+				!folio_test_uptodate(folio))
+			goto out;
+
+		/* We need to check if this folio will cross the pmd boundary.
+		 * If it does, we drop the rcu lock to allow for a new page
+		 * table allocation.
+		 */
+
+		pmd_bound = (addr == (unsigned long) area->addr) ||
+			(IS_ALIGNED(addr, PMD_SIZE)) ||
+			((addr & PMD_MASK) !=
+			((addr + folio_size(folio)) & PMD_MASK));
+
+		if (pmd_bound) {
+			xas_pause(&xas);
+			rcu_read_unlock();
+		}
+
+		err = vmap_range_noflush(addr, addr + folio_size(folio),
+				folio_pfn(folio) << PAGE_SHIFT, prot,
+				PAGE_SHIFT);
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
+		addr += folio_size(folio);
+	}
+
+out:
+	rcu_read_unlock();
+	flush_cache_vmap((unsigned long)area->addr,
+			 (unsigned long)area->addr + size);
+
+	return area->addr;
+}
+EXPORT_SYMBOL(vmap_file);
+
 #ifdef CONFIG_VMAP_PFN
 struct vmap_pfn_data {
 	unsigned long	*pfns;
-- 
2.47.1

