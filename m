Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D68D15746E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 06:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751005371; cv=none; b=dMAA9BSyoL1kG9zxL0hZxRgZccnjaZSNFJ/L0/llK4b5oFdpz4liplwrANokpPynfYd7396FJThkZ5zj1JpXTt0fwZqYoUjK32YfKmjfsjcxCAroaiirdhSROF4YKpPpMfrP/hOxJryqYLPZF/Ab4e4EwTDFVQ6hcNO5Hv0E96o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751005371; c=relaxed/simple;
	bh=sMzcydJGDBsWjPrRWFzyKAcbh3UK5atqGzi5zVIOv70=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FMbqGrLQEvVXpHEi1v87Y1dAi6RX9AFvOadeilc1HVCNmw2MmP62iX43q8JBrawyuH4Zhp7LnxmcDmtm/azAk1UN3yXJ3TKHBpKMYRB9OlwstbwQQEmRI+jA3A80xKBxNLQbdGqSmZB4D++8sbT9PIMvDFDmC2O1rm6U38Lfbm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g8Kt66gp; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g8Kt66gp"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-74924255af4so1617617b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 23:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751005369; x=1751610169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/hWgoWI8jaJ1OTfxVEFPXPhBOEtz+zuwq/NuSmx4sE0=;
        b=g8Kt66gpUR7HFS5EoHNvOdLX4CD2hju0VqJBoZ+9uNRwmT/Jtn5dpALTiUBAI5RxSq
         vHHmicXgd7Q6D7Nj4NncFTf7mfjS+bEaMOCS8rliRLGFsY4iUErg30kljAbd87MxVMIo
         ohprFTEzcyxrVVgkh/XF6w8TPPQ7fWynYbOziYrw4pIslaAs+ZQKoB/u9YgQs+x7nfnI
         lBv8bUkIgPljt8HQiq35+61p2LHJ5FVliu7IzYFQWDPasYqKM4F8E5+ZGifwx4zGfkEa
         RWua10ZB72AmAuvTbeazJ5NtHzyDjx2ujGjmmBoI//rb74kgehNiWVOi0ut+wTIlwJLJ
         IxSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751005369; x=1751610169;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/hWgoWI8jaJ1OTfxVEFPXPhBOEtz+zuwq/NuSmx4sE0=;
        b=h41S6mdU8XG3xm2KL4bZ1X7XeAxHgPS6yznS0yUIa2z116EhRqA1uWWbswLkulI17T
         crlPe55B93peROIpCrtBkWP1QwxPRWYJAXsBcQqKNxKy5Qo/jsJS31EyJIi3rxbxwdzb
         D8oaabzHk1qlcX8Wa294awA+gR7tKZ1tRrfvD3YVBF5CT1kAORcIKIBpYBWBNC0Ujbpc
         61yM4AOIP4XNRAT/3XvsTdK3J3pOSLbF/h7rNvrFoLIxe5NzL9yQTczbzFWJp4CXuvEZ
         7i0OoA+1L2C51bShM4hX7fZr+v0XOTSopzgqXpXr1h6iRWiYaU8Dkgsgx6H5BJv6gXU4
         wodg==
X-Forwarded-Encrypted: i=1; AJvYcCUcuFCB440qLwGHJLTrJLkvT80Rza6FnYyZiJjwGsIEW8PYE1Epqow3RjCxPOqQuuY2tUhw1dj7HDVCz8o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8Sbmu+gVYIundFh1cKdr/mNxkMzb27GjKyZMkE6Qsi0zqqf/9
	LNMxLfazEOZtN1JQ6VpY8Pd8CW8r8JCPGVWtrjTuFJsoSuf7ld95eQ8t
X-Gm-Gg: ASbGncu0atRmtxTWUNQInS7kricGaJj1Mzn0rc9EoVpVrmh9RxEuePMtD3h6HXJ0LN/
	3cZGKAyf699xgH9svfPYb6gQkfU1DElZqJVeUmTX0hj5Q3oWq0RJa/u4wpe4L0s+GIcy+mJ0Kg1
	cIBk5HyrK8pKbq06xcTll5/n8cqrdyPSI55NoIPWVSpTgGfdnsOjpLMdTzKKuv1nRciKUVR7qPE
	HKvNiE7kkJTzS1/UFDMioLKbNVTKwny5hEtBbJdNz5elHTZhEwtyVAoA9NAGvo+7InGhzCkuMdI
	cK6bNYsGicSXUMJ8pgZ9nl6wI8sBjWHTGVY2szCPeLvVwVwjgDn4Jsh7YYxaToTZXNfITRYoMBC
	EjsN3CM3kGwQ=
X-Google-Smtp-Source: AGHT+IGEMRNMMobFjW+JqiZRS8skcEyEbLLPp5CM2aFvT1VUOfcS0+W5bUpwPXWMXSptyteMv7HUMw==
X-Received: by 2002:a05:6a00:130a:b0:742:da7c:3f30 with SMTP id d2e1a72fcca58-74af6f4cf7cmr2863972b3a.19.1751005368810;
        Thu, 26 Jun 2025 23:22:48 -0700 (PDT)
Received: from KASONG-MC4 ([43.132.141.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af5409cb6sm1456212b3a.23.2025.06.26.23.22.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Jun 2025 23:22:48 -0700 (PDT)
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
Subject: [PATCH v3 2/7] mm/shmem, swap: avoid redundant Xarray lookup during swapin
Date: Fri, 27 Jun 2025 14:20:15 +0800
Message-ID: <20250627062020.534-3-ryncsn@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250627062020.534-1-ryncsn@gmail.com>
References: <20250627062020.534-1-ryncsn@gmail.com>
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

