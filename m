Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6098222D9EF
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 08:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746779738; cv=none; b=pn/dX1E7tKTcEmfU0Ud5ry2nXeD0QOF1r7jPCvPYiEY7qBxwjFSoqDY+WxdTWqYe9THr/o4xOwAOtwpFI9LEjXsUS3NE6zBgjaGmCKDkVLrLDe7mXSUICvtlnbZvck1DsLuGzAcWNdAhn1SxjW7pK3Ew7+0HmjFXy0z1MMjYIYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746779738; c=relaxed/simple;
	bh=0Xp0GO75PBpONHR7HLR0B2leD+ryz9SVbxLg3RxYCe8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AnSf0U6Wsj/0X87t0uu2kl2HuwrqlkI5kK1h1N7fSdG/CNlFHRFiDXd3ekunylMfUAy+aelfQ6bmzHbJ2rtTb33p2D9WmuKyVbmUncJ9CYxDK9ROOiN/pG2zLJVaemcnmtF+m3IuRZWtCw23KX7hXHNShi0lMnLyFPD9M1g6b5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Bm52AU8D; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Bm52AU8D"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7398d65476eso1629815b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 01:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1746779735; x=1747384535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JFRSAYyLY03v/Pm2mGj9x9sQ5Ba8Q6PzpP4ygjWrdTY=;
        b=Bm52AU8DImh8s0x2AvONd4B0KvX4/pU2Qu9KJqEuZdFbMjKODN8GPRC77mufn96Yll
         IzguApgB+fnA69ABlb4L5Qtmiff0Xckf2SZMo5KzAbmuSzxd4q+hdgNQ24Zfov8onNrF
         G/nENKiTjuryahaYd5oHs9V0EVXxNII2Fay0rsE3VyyY47J9Ht6tXPquC7CEB7RCHz5g
         IrpiuG/3R6qkF46m0gpz20QJjkmsxbOqc8GSIDWB1x4ci+g2ooDQHaZFPCbtMVW7pcUn
         Z4TJoeF7xc1TI0L/66W3PW8NbBoouCgnZGJeNXB/mAdpxiU6kCwKfc+rbS1oLGJ/yMP5
         KICg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746779735; x=1747384535;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JFRSAYyLY03v/Pm2mGj9x9sQ5Ba8Q6PzpP4ygjWrdTY=;
        b=UCkuTcbl67J4fXEcpEOOEY6jXmIM3KQpGhndzhMEYEiQoYFUax/P325PlIyWPJesBR
         ghvjvS2MFgz7H22BWbLg9l3cFJdHNIdiwY3RiQAr3veA+1CgaVcrnGR/XX2UTJ8qbnUO
         lNPxKComvERaiOpklIsaJU+AHwv1LvxKQOZwa1o5D9U1ky6oaLOFPE0A2Ikha98YXjjs
         N7EA643rJk+pI+4WLs42EAPGOYzmVaAiA6pQiL5TIKpSETx73yr5akQTV7NVJNmz2O2r
         pkaY4CQdPTDm3xodipW/4Vr92/sfKbB6xBxhnOO5TKER5Z04EgGFNpBa4t/KBVevGIFq
         sRWA==
X-Forwarded-Encrypted: i=1; AJvYcCVCIRQpkadPkMrLkE2EthWSXlg7A3ThEQmHDtLFdFWWhFjG5IOUe2G6YUNv1fYEsYYDVtYb7yuCI5asuaI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqblAVm/YOcM8v7z3qFwQzOJ4MAt/AkOjltKkZv/e2LdGEvtBr
	eodxKWMxXQNZeW9/4KAgDi1wETPRY1/80cgkmitOfPW9scgrZ/mJskTEC0jC2nc=
X-Gm-Gg: ASbGncvuFrJoSSkKTnLIOMmsGJXQhW4ZRmSat+L3SHAnVWqZaaOLQj0lO7v1A57Sh40
	kfxw/k8G9omhl+oH6C6vW6XCFQYiomYdt9N06YR3eu0/HNcQ5Ucjh9KD3fZwwH2Hd460+2z2F43
	uI+bP0dpHbL/o7mww/nz4Hm5F+Pd6AAnzDSectj/84L2WozeId5ZzvYZ3cA9Ag2DgPa0Ahyarew
	0ZH27Ia45sCRcTHk91nYBwQkK2mfw+OttEDOIQ4fPSykPe0TW9Uqaaxv1BJXdJeTBa3nPmLCDxA
	1JLQ1R9Myb4Nv04xs+aRQuSqjyM/9jG/MdLaPgb+XSM2DNsrLd1CgJnrfXFLxr/Q9Q==
X-Google-Smtp-Source: AGHT+IFqCX8jHlBu3tZ4yXs4zjeguMBtn7lr/n+czWq9cOGJ8eV6AzfIjFuHctHzE6ZHY8P0T4qWbA==
X-Received: by 2002:a62:ea0e:0:b0:736:4c3d:2cba with SMTP id d2e1a72fcca58-740a94e6378mr7899947b3a.9.1746779735532;
        Fri, 09 May 2025 01:35:35 -0700 (PDT)
Received: from n37-069-081.byted.org ([115.190.40.14])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237727a78sm1304933b3a.53.2025.05.09.01.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 01:35:34 -0700 (PDT)
From: Zhongkun He <hezhongkun.hzk@bytedance.com>
To: akpm@linux-foundation.org
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Zhongkun He <hezhongkun.hzk@bytedance.com>
Subject: [PATCH] mm: cma: Set early_pfn and bitmap as a union in cma_memrange
Date: Fri,  9 May 2025 16:35:28 +0800
Message-Id: <20250509083528.1360952-1-hezhongkun.hzk@bytedance.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since early_pfn and bitmap are never used at the same time,
they can be defined as a union to reduce the size of the
data structure. This change can save 8 * u64 entries per CMA.

Signed-off-by: Zhongkun He <hezhongkun.hzk@bytedance.com>
---
 mm/cma.c | 11 ++++++-----
 mm/cma.h |  6 ++++--
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/mm/cma.c b/mm/cma.c
index 15632939f20a..ec4b9a401b7d 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -143,13 +143,14 @@ bool cma_validate_zones(struct cma *cma)
 
 static void __init cma_activate_area(struct cma *cma)
 {
-	unsigned long pfn, end_pfn;
+	unsigned long pfn, end_pfn, early_pfn[CMA_MAX_RANGES];
 	int allocrange, r;
 	struct cma_memrange *cmr;
 	unsigned long bitmap_count, count;
 
 	for (allocrange = 0; allocrange < cma->nranges; allocrange++) {
 		cmr = &cma->ranges[allocrange];
+		early_pfn[allocrange] = cmr->early_pfn;
 		cmr->bitmap = bitmap_zalloc(cma_bitmap_maxno(cma, cmr),
 					    GFP_KERNEL);
 		if (!cmr->bitmap)
@@ -161,13 +162,13 @@ static void __init cma_activate_area(struct cma *cma)
 
 	for (r = 0; r < cma->nranges; r++) {
 		cmr = &cma->ranges[r];
-		if (cmr->early_pfn != cmr->base_pfn) {
-			count = cmr->early_pfn - cmr->base_pfn;
+		if (early_pfn[r] != cmr->base_pfn) {
+			count = early_pfn[r] - cmr->base_pfn;
 			bitmap_count = cma_bitmap_pages_to_bits(cma, count);
 			bitmap_set(cmr->bitmap, 0, bitmap_count);
 		}
 
-		for (pfn = cmr->early_pfn; pfn < cmr->base_pfn + cmr->count;
+		for (pfn = early_pfn[r]; pfn < cmr->base_pfn + cmr->count;
 		     pfn += pageblock_nr_pages)
 			init_cma_reserved_pageblock(pfn_to_page(pfn));
 	}
@@ -193,7 +194,7 @@ static void __init cma_activate_area(struct cma *cma)
 		for (r = 0; r < allocrange; r++) {
 			cmr = &cma->ranges[r];
 			end_pfn = cmr->base_pfn + cmr->count;
-			for (pfn = cmr->early_pfn; pfn < end_pfn; pfn++)
+			for (pfn = early_pfn[r]; pfn < end_pfn; pfn++)
 				free_reserved_page(pfn_to_page(pfn));
 		}
 	}
diff --git a/mm/cma.h b/mm/cma.h
index 41a3ab0ec3de..c70180c36559 100644
--- a/mm/cma.h
+++ b/mm/cma.h
@@ -25,9 +25,11 @@ struct cma_kobject {
  */
 struct cma_memrange {
 	unsigned long base_pfn;
-	unsigned long early_pfn;
 	unsigned long count;
-	unsigned long *bitmap;
+	union {
+		unsigned long early_pfn;
+		unsigned long *bitmap;
+	};
 #ifdef CONFIG_CMA_DEBUGFS
 	struct debugfs_u32_array dfs_bitmap;
 #endif
-- 
2.39.5

