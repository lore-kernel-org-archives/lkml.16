Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D46A15E96
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 00:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749600809; cv=none; b=rSKksICBDZTdp4Cl62jwbUsYO1oHvwYGuLjSmgwl4vSsCBDQiUbTIEofOY4GllpvHGWJ176DP3fnpOE4QZyyM8509dvSavEoZV4i5lIbB32hg9x4oDGsm7DV84nJr0iloym/fw7o5BBLzNOE3P6HD7Y8sqqM8WEyInLo/L0DKZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749600809; c=relaxed/simple;
	bh=dwUJ7UY4/AdpLsjkizOjRC8+Cmv//bzgTORe5RWfApU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rD+olOaySos8qtzc2dYogPQzVIYVD7x8pewnb/3sXMFueoVMhnUAq7x/KmzmDRrC1epO93O6O1Sa6Yq7PuBce7Nwkgb34VNFfMV9z9O3WXYVKaacnCXkvU+S43ECc/UX82sVLij0T6FOqt9+RLJy5M23dANPS3ZoNPoRp/Xxb5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J8jwS5vW; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J8jwS5vW"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-311da0bef4aso6405575a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 17:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749600807; x=1750205607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KyrdBaG/o2f9v9S5ulHJy7hZxE9PG3XIz3q5zTdj/0U=;
        b=J8jwS5vWVDNRvTer6H4vvfABk49TTTeuM/q4tErrnLVgMJpzuinfsWOiNC5NxQu19I
         sOUpykN4W1z7gEEI282TNitkLhJPHhSJv+VZFrZnyu/s8KBzsPGb/i9bYW7v5dxrMkl/
         GPi3CCEptuAVhFs6T0BTicMOK9EQliWE6IO5Q/OHRVl2Lxwij6l+ZFmpKMRTFDEkK69r
         IGjleCGDEem9ctiW//YxgKOhS17EJtei2+7WtXg2dOhPgDRfqrbpXIXrZvT+44u8WPhR
         S81lOb6gitC0zZ49dLFN81YL/wXbrBSgpx+mV/XF+NVRSUguyEi1SKREUx+0SGtAuKie
         Gz3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749600807; x=1750205607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KyrdBaG/o2f9v9S5ulHJy7hZxE9PG3XIz3q5zTdj/0U=;
        b=SWFlbuHnZu4zMb5mXoekdTvgjHodeKPp2ua6Kss+2ncxrBlEyL2Yg+IyW4+COzGrQf
         dRhAqRdRZRo+db0aUXwe3CwA14uy8bKRStjy5eI1EN9oipbqUOy6PyamKu/Qw2DK0J7R
         Ec67eZrF3WrFMOFYgP1SSCcIpftiap9weMLSNzm+vxEc5mMjaBpcUJjgNrDUVGmSPEL2
         OvbtDhgqkVdQGnSp40+svzkk5p9LPxsveA0J+6sPlFWP3ZtLTVgfKXt0Gri/VeVJlXtW
         z8U9I1EnIyydUEnhXhJDkaSiBW+8E8Lm22C9VMgmF0R+fJ7BvoeDIo+H15S4xngiN3oC
         5LNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnZ0WpvVAPRUJfh4GftZd0GE4VNQbvCvnOY51BwgwOz08X+8Chb9xRnAsuOfVZZkLvex//GjbxJ2Ixb40=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrDnJQ7SP9Qg5N6AEXcGEgLBFbYboGK1lU3vVSpwJiNvGJ6zN8
	QhHP2ix/eaty5oti+OI+P8p4h92WnOkjdNSnLA6wTRo8pIm+R0gVwbYX
X-Gm-Gg: ASbGnctl8pA3emDr+D0P7D3WieD29l+Qx95pPEfrlY9ZL8o6abVPwSfVrdPErKLJjjD
	sdZyXldPVSgBmHXxVEAPEvLBzunIQSPKZuMh+FSlyAHgjFUHmx6QpagAdZiRU/Z/WM+2JXxjonV
	FfQ8X1a9H0hiyIYHjX80kPAP1NxRnoG0EDy0zTK8BxkMfTbKTb4Qdck/B9+JYo1gpJBd9Ut/K5H
	fnmoUf4jBmQNPzLFviK0KhCVWtJPKXWd9CmD36z7ez50lt+MTF9IgIFafF9LWkMyGLeWeUxv33j
	Yjg5Rt7vFyYmh8FrcJ2DO0qEdo/sKkWyrGzkYM3O4QLRHzuw58yzn3tVSXJsH0VMF1+9KxfaGaa
	dSHv+erHEJopfc7mnvXYn
X-Google-Smtp-Source: AGHT+IEaWPUEFyrcYIrlxXbVgER+aXtbaiqm9DJoQ0ba6gY2akRmhHIZeKUuESnsAXIcvcpp5vW0zg==
X-Received: by 2002:a17:90b:1b0e:b0:313:14b5:2532 with SMTP id 98e67ed59e1d1-313af292ec3mr1569683a91.34.1749600806727;
        Tue, 10 Jun 2025 17:13:26 -0700 (PDT)
Received: from fedora.. (c-67-164-59-41.hsd1.ca.comcast.net. [67.164.59.41])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-313b2137b77sm161367a91.34.2025.06.10.17.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 17:13:26 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Subject: [PATCH 3/4] m68k: mm: Convert init_pointer_table() to use ptdescs
Date: Tue, 10 Jun 2025 17:12:54 -0700
Message-ID: <20250611001255.527952-4-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611001255.527952-1-vishal.moola@gmail.com>
References: <20250611001255.527952-1-vishal.moola@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Motorola uses init_pointer_table() for page tables, so it should be using
struct ptdesc, not struct page.

This helps us prepare to allocate ptdescs as their own memory
descriptor, and prepares to remove a user of page->lru.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/m68k/mm/motorola.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/m68k/mm/motorola.c b/arch/m68k/mm/motorola.c
index 6a459710b2a7..9bd79f42abd5 100644
--- a/arch/m68k/mm/motorola.c
+++ b/arch/m68k/mm/motorola.c
@@ -121,10 +121,10 @@ void __init init_pointer_table(void *table, int type)
 {
 	ptable_desc *dp;
 	unsigned long ptable = (unsigned long)table;
-	unsigned long page = ptable & PAGE_MASK;
-	unsigned int mask = 1U << ((ptable - page)/ptable_size(type));
+	unsigned long pt_addr = ptable & PAGE_MASK;
+	unsigned int mask = 1U << ((ptable - pt_addr)/ptable_size(type));
 
-	dp = PD_PTABLE(page);
+	dp = PD_PTABLE(pt_addr);
 	if (!(PD_MARKBITS(dp) & mask)) {
 		PD_MARKBITS(dp) = ptable_mask(type);
 		list_add(dp, &ptable_list[type]);
@@ -133,9 +133,9 @@ void __init init_pointer_table(void *table, int type)
 	PD_MARKBITS(dp) &= ~mask;
 	pr_debug("init_pointer_table: %lx, %x\n", ptable, PD_MARKBITS(dp));
 
-	/* unreserve the page so it's possible to free that page */
-	__ClearPageReserved(PD_PAGE(dp));
-	init_page_count(PD_PAGE(dp));
+	/* unreserve the ptdesc so it's possible to free that ptdesc */
+	__ClearPageReserved(ptdesc_page(PD_PTDESC(dp)));
+	init_page_count(ptdesc_page(PD_PTDESC(dp)));
 
 	return;
 }
-- 
2.49.0

