Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294CA27A451
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 06:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751871025; cv=none; b=jSuqEnHEu0eQcnr9WDQ9D68wgSXdUTCXq0RTnqfj2ptKwQfaku+Yv9ltiLgrak8RlrxagQMR0/7PhhXCtSNr60QhT+yKNjC6gR9ZniaqJKFB7HgV8H5NkhIq2DJPCw8XcFFzRjS7b7Bbw/kU9GrrMtmo3THPZNoXs4ijQBBKodA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751871025; c=relaxed/simple;
	bh=2Ck7da429bj6tPACUdRedQc7kvHlhF/GdsKaHEkLWBk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aZsBWMwBdnHl6rg439e7vQU7HIahmrbEdQVpvWQFSHHg7DIopj5JC0uM4EZcjZHCxsAhX2x9sx6YoiInyIYWcRaifgRjkQaIPVHFWT4kJ17eu5x/2ZQqV06TFpveH5vdaIOHmaDGUyort9sclGvqCrlmyYD0+lCmgIfMlJ6oDoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=OepFZ09r; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="OepFZ09r"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-234fcadde3eso40772865ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 23:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1751871024; x=1752475824; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QiHfvwOVI0/DzO8i0IezA1Z19+xb67OoONslKakPCGo=;
        b=OepFZ09ry0Y45kaLbmmVB9g2ZxOIGKThy4FQfyDq2cijzMnT7B/OupDrRWOOK+E/pV
         znqaUrRUGwksQFKcDkPduIMHfHZzpMWNSiwiIrTfy+vVXsY5ID1rj75AiLkr4UhCUOg6
         SRyt4THFnpg/vDLT2QOBm3p4FPyTV9D2gmoS8OeUmR/REj9kjxQXUPm3N0UhJ5h30Kfs
         QeHZMv6LWkHO370X1h5a4uHq9M3tuQj1o9526MAXzjL+5hLpQoG0g27klR81CWrd8Gvk
         9fzM3KnxI+VaWeM7SbiTydNOtHswL+S2wmP0058b9cmQI/ezElMcTb8lzqP+A6gWQDZL
         MLtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751871024; x=1752475824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QiHfvwOVI0/DzO8i0IezA1Z19+xb67OoONslKakPCGo=;
        b=G+BAJr92ZYUMZr8u5UOJ1slk9yymyA6BE/mbDU2t6pNvPpGeqBs3OWH4UESz5l1k1s
         F7wcy7bvhry1iP9Vap1HseG6/9WDr/+TWxH8/gY2ySyq/4OVDoY6iVrdC/deAOAeiReO
         g9VLCpZX/BMal3TRjJlw8tY/RLDtnM9EfLdFmCIsHjPTBwZ1YkpQXVsLcT3iFT4YfhGX
         wm6j21S3Hd9oqAkAKHV300WUwcZDGaak697+4CxriBmbhs7UHTCHEt5fiir+0YxpOFNi
         R3ozHCMxxEZZ3IX8i1iUk7HxZFKwzXxsZZBim5a6Df1JmWTcdLJ5JDeqkToeX8pAeHcs
         9HXg==
X-Forwarded-Encrypted: i=1; AJvYcCWNFrb+uoE05EKZe16mwoAlSIQHtAzjKuI5r72rijYNMi1bp8W2l8Qh/PTu60gmtlLWQcLtJRphcFdaXOA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz3J5nGjKJJNc0cnINnCoLe1RO8zeOHIvCbCk3xupu0t3HArGL
	gY2CDqfwz9brL7k/UPuOrXnXb1X+mn0e0VOkU/P423aAH+RBeCFHh/EUPZKPqauxdHQ=
X-Gm-Gg: ASbGncsIPikx5fwEXmXkWFV2hhUNPvNMReKbVbDHTGI+RmNmBzkxJyfyKPU5IDg9C7f
	GkV8uOjkJS5yD3h3t+kvSOOWKUb4iNTFZfqkkdLUK23vdGhzRsB4LJVm15Jzq6o/PbSI74A1eDs
	d9yaYInBOZleYT7KtpnAbc0PVkO1sKDtZxd8PkP7JdUt05CfTBhsDfm27gmG2tgbEOseut/gsRo
	J+7d4L+jBdiOI4P7FFFiKWN70dUtNtVKjeVfqjrtyHtQJXwNGS3CxrkmBb9QvC38ymJxylwRCFX
	FJKcMwIUxD0PuAAmSDtR7tniZdjUpQ9xvc3fwfxKy3d1OjmemQPzqpBCFPVBy0FRyklFPUyujyr
	uGGHTjZUMfuBqGbXjqT0QjFY=
X-Google-Smtp-Source: AGHT+IFMBY0822v4rgg5psHQsiI89RRrF9TLtvLgFYQSnw9DJEUz57tWFMIxOBTqvqWWyVw9h1H5CA==
X-Received: by 2002:a17:903:1b4d:b0:23a:bc47:381f with SMTP id d9443c01a7336-23c8759dbb3mr181052285ad.36.1751871023683;
        Sun, 06 Jul 2025 23:50:23 -0700 (PDT)
Received: from localhost.localdomain ([203.208.189.9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8431a1aasm77377635ad.15.2025.07.06.23.50.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 06 Jul 2025 23:50:23 -0700 (PDT)
From: lizhe.67@bytedance.com
To: alex.williamson@redhat.com,
	akpm@linux-foundation.org,
	david@redhat.com,
	jgg@ziepe.ca,
	peterx@redhat.com
Cc: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lizhe.67@bytedance.com
Subject: [PATCH v3 3/5] vfio/type1: batch vfio_find_vpfn() in function vfio_unpin_pages_remote()
Date: Mon,  7 Jul 2025 14:49:48 +0800
Message-ID: <20250707064950.72048-4-lizhe.67@bytedance.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250707064950.72048-1-lizhe.67@bytedance.com>
References: <20250707064950.72048-1-lizhe.67@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Li Zhe <lizhe.67@bytedance.com>

The function vpfn_pages() can help us determine the number of vpfn
nodes on the vpfn rb tree within a specified range. This allows us
to avoid searching for each vpfn individually in the function
vfio_unpin_pages_remote(). This patch batches the vfio_find_vpfn()
calls in function vfio_unpin_pages_remote().

Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
---
 drivers/vfio/vfio_iommu_type1.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index 03fce54e1372..b770eb1c4e07 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -794,16 +794,12 @@ static long vfio_unpin_pages_remote(struct vfio_dma *dma, dma_addr_t iova,
 				    unsigned long pfn, unsigned long npage,
 				    bool do_accounting)
 {
-	long unlocked = 0, locked = 0;
+	long unlocked = 0, locked = vpfn_pages(dma, iova, npage);
 	long i;
 
-	for (i = 0; i < npage; i++, iova += PAGE_SIZE) {
-		if (put_pfn(pfn++, dma->prot)) {
+	for (i = 0; i < npage; i++)
+		if (put_pfn(pfn++, dma->prot))
 			unlocked++;
-			if (vfio_find_vpfn(dma, iova))
-				locked++;
-		}
-	}
 
 	if (do_accounting)
 		vfio_lock_acct(dma, locked - unlocked, true);
-- 
2.20.1

