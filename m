Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1128223DFB
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 18:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751653090; cv=none; b=HhrQTbFmeNNNp7yGgzf4t/d/r41YaRWv6HERzdxaWrygJ6VK2JqPOKlP5E4IFipFqdfa0AJu15AesEKecKxt1TBNsarENCKZzd7o4Yjn1JllbIU+JF2GFHc+MyeZhd0rL2PwIMqDgNVGVvhBSX9+I0U8Q4WBFnE5MNGhVSWDqjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751653090; c=relaxed/simple;
	bh=sMzcydJGDBsWjPrRWFzyKAcbh3UK5atqGzi5zVIOv70=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AWi/6pkF57TL5y2mV9Ck7iPvzxrE6jVrB9hT7JIGaPtvaVVtERgfXHcWsOsM8XkzXbVZK3IpW+w5ygIeouyOQgkhIOArgiVi7fFWrJCMmG88hLK6YOOo0zZ44lhq4F9nj3LCa2FBrl4gJrg2W25fwhrbJYmr6b5PPHuvXRxEkCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IfibfP30; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IfibfP30"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7d0a0bcd3f3so137161485a.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 11:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751653087; x=1752257887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/hWgoWI8jaJ1OTfxVEFPXPhBOEtz+zuwq/NuSmx4sE0=;
        b=IfibfP30W4RdEL/zc7MGW332r9Qjaok0DZ296HJ/SpGCDLrKAqPffCFqzYcKR2b/OX
         1S8lc3TVxERreNAVb9MMKiLgirvwgTrsEqVQYPO/pgf40BLhd+Njy5GB7ACHY/utZRx/
         YzWuTD9ruT9anlMFn6V/XxBP0S0cuL/yYSuD4seRgkZSaK2AUda8NMizHUDhCYYlreld
         oJ1wDHh5uu7Xu4sOoNuf8vHHNxiuzMdWpSk+gkWmNxmj/2eXdIC8nOScsCa5813M+aWd
         cFBrHfUgABemsoy82/NjyTG7jGG3nOYvqiSgO5exo01LHYVea3hWcDkxWw2agv2QBAcd
         RRYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751653087; x=1752257887;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/hWgoWI8jaJ1OTfxVEFPXPhBOEtz+zuwq/NuSmx4sE0=;
        b=va97vK1pDmAMR4FsEoTdwyLCXcQioekQtPQOaAwjTswiZvOdQ+qLTzck1N19TprTUo
         y2mx+PckpHZysfafi115MocjbSA+9JDsOoHgLt6eF6ABv8ivRNhETmSx/Ns/qmhOvzZZ
         iaX9LN30Uk3LO2IVVls/T9XFDdD+qawX7pJjOv7tDMRhf8OEynrhSw6mTwg8NEFvxQwi
         BMR6UyjH/9EBMmsJwPEMexfHPPUaxvXL5NFS4JZMOjDaef9P6ESf3Csfl7hSggCYohH1
         s3bMj05CjWCL0r5tXRif2yl9wstVjYA01OWRlXYP1BGRZhHal/vKj2u6e77j7n5DLlvw
         +b/A==
X-Forwarded-Encrypted: i=1; AJvYcCUQ32gw0f29BZRpawVpCrSJ/ggVTbt8OxUlEL87Q08yGgD9Vf1Kn7SLmU1JIpjJ1BYRK9m2DlUECUzzxR0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyB7a0TUikljhj0egPrM0Rdjd/fo58KENpVTgARmmNp19nIgCrg
	YNMw60P4/B4oTsN/M/n25U+hg5pBz22ZPGcItrbnVU6bdbfczDkgjQ/4
X-Gm-Gg: ASbGncsFtfl/CuCPI4ues9FcmQpHS29elvDmDMCiiBibQieca+GlG8zrWqzox1t1c82
	J436tlM9Mtj0Y6Iqa1f/aE9EfO2dMHcu+xvXeiDJQQh3BYuateh0WUXjBulWZJL9RPKmGppjHRF
	Xv4ezBFI2JxDSoYPL7BBZBZUu62/t644ORFJbetND+ZG4iyG3+IRiwYR6lZy6wXWHfSa4VVRbNf
	C0GeXAWkRMUtDYz+14mDqUkUU8+Jaa5B3vskyg5FM0seKFQPpCxGFWV7aH8a+JC74ELtGp/sBxG
	p/jwFpWGDnZ11xE5wUFEYg+3qO/clpVXdJr75el6iY5a9BV7Nt5rgdIKXacbS+1uGXE=
X-Google-Smtp-Source: AGHT+IHcGsS8lCBCc2bG6GiwF3Ci1TV5JesuDe1bXsduyBVEYl+kCzXmLRqAZibZ2g+n+KoEDJjbSw==
X-Received: by 2002:a05:620a:1908:b0:7d3:92bd:21b8 with SMTP id af79cd13be357-7d5dcd15dc8mr574698785a.17.1751653087454;
        Fri, 04 Jul 2025 11:18:07 -0700 (PDT)
Received: from KASONG-MC4 ([101.32.222.185])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d5dbe7c188sm183300585a.59.2025.07.04.11.18.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 04 Jul 2025 11:18:06 -0700 (PDT)
From: Kairui Song <ryncsn@gmail.com>
To: linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Hugh Dickins <hughd@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Matthew Wilcox <willy@infradead.org>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Chris Li <chrisl@kernel.org>,
	Nhat Pham <nphamcs@gmail.com>,
	Baoquan He <bhe@redhat.com>,
	Barry Song <baohua@kernel.org>,
	linux-kernel@vger.kernel.org,
	Kairui Song <kasong@tencent.com>,
	Dev Jain <dev.jain@arm.com>
Subject: [PATCH v4 2/9] mm/shmem, swap: avoid redundant Xarray lookup during swapin
Date: Sat,  5 Jul 2025 02:17:41 +0800
Message-ID: <20250704181748.63181-3-ryncsn@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250704181748.63181-1-ryncsn@gmail.com>
References: <20250704181748.63181-1-ryncsn@gmail.com>
Reply-To: Kairui Song <kasong@tencent.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kairui Song <kasong@tencent.com>

Currently shmem calls xa_get_order to get the swap radix entry order,
requiring a full tree walk.  This can be easily combined with the swap
entry value checking (shmem_confirm_swap) to avoid the duplicated lookup,
which should improve the performance.

Signed-off-by: Kairui Song <kasong@tencent.com>
Reviewed-by: Kemeng Shi <shikemeng@huaweicloud.com>
Reviewed-by: Dev Jain <dev.jain@arm.com>
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
 mm/shmem.c | 33 ++++++++++++++++++++++++---------
 1 file changed, 24 insertions(+), 9 deletions(-)

diff --git a/mm/shmem.c b/mm/shmem.c
index e3c9a1365ff4..033dc7a3435d 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -505,15 +505,27 @@ static int shmem_replace_entry(struct address_space *mapping,
 
 /*
  * Sometimes, before we decide whether to proceed or to fail, we must check
- * that an entry was not already brought back from swap by a racing thread.
+ * that an entry was not already brought back or split by a racing thread.
  *
  * Checking folio is not enough: by the time a swapcache folio is locked, it
  * might be reused, and again be swapcache, using the same swap as before.
+ * Returns the swap entry's order if it still presents, else returns -1.
  */
-static bool shmem_confirm_swap(struct address_space *mapping,
-			       pgoff_t index, swp_entry_t swap)
+static int shmem_confirm_swap(struct address_space *mapping, pgoff_t index,
+			      swp_entry_t swap)
 {
-	return xa_load(&mapping->i_pages, index) == swp_to_radix_entry(swap);
+	XA_STATE(xas, &mapping->i_pages, index);
+	int ret = -1;
+	void *entry;
+
+	rcu_read_lock();
+	do {
+		entry = xas_load(&xas);
+		if (entry == swp_to_radix_entry(swap))
+			ret = xas_get_order(&xas);
+	} while (xas_retry(&xas, entry));
+	rcu_read_unlock();
+	return ret;
 }
 
 /*
@@ -2256,16 +2268,20 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
 		return -EIO;
 
 	si = get_swap_device(swap);
-	if (!si) {
-		if (!shmem_confirm_swap(mapping, index, swap))
+	order = shmem_confirm_swap(mapping, index, swap);
+	if (unlikely(!si)) {
+		if (order < 0)
 			return -EEXIST;
 		else
 			return -EINVAL;
 	}
+	if (unlikely(order < 0)) {
+		put_swap_device(si);
+		return -EEXIST;
+	}
 
 	/* Look it up and read it in.. */
 	folio = swap_cache_get_folio(swap, NULL, 0);
-	order = xa_get_order(&mapping->i_pages, index);
 	if (!folio) {
 		int nr_pages = 1 << order;
 		bool fallback_order0 = false;
@@ -2415,7 +2431,7 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
 	*foliop = folio;
 	return 0;
 failed:
-	if (!shmem_confirm_swap(mapping, index, swap))
+	if (shmem_confirm_swap(mapping, index, swap) < 0)
 		error = -EEXIST;
 	if (error == -EIO)
 		shmem_set_folio_swapin_error(inode, index, folio, swap,
@@ -2428,7 +2444,6 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
 		folio_put(folio);
 	}
 	put_swap_device(si);
-
 	return error;
 }
 
-- 
2.50.0

