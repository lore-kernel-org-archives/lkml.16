Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50227801
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 00:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749600807; cv=none; b=sV3ZaErspdViyvvG9gXTDLXD4foxkc4jJzcuCoFeh0h3KflM/mg4++iZ9Q+0XiOFZ5inWL4IAKeb3oZ6wcGnPvEtsPLS0+cf44tpbBG9uBlHxzTUHrTQCLkSIo/ZyXcbVrvuqyNXmrrSAHy1zUCWBe+m6JuBq2vJ0cPxUuFIcJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749600807; c=relaxed/simple;
	bh=upZ5tIofQze3ejJqQCCQGr80sdlpcEmZzD/ZXL1PN80=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s0iEefVXGhg3PjKvKuyk0EUe70EhPDP4Qc0JBPqLkcBcuf85dwzWGHtw5D04I6N0FHFomGHMQVDLAmsWwQw9+JCXM1KaPNdO+0hJCpTipvJTe8+JcKAdVENchBt8xEo97BZKwylDpw6J2izRkbU5ci0EbiOPyMvnYRmTGtEPeqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V6b1p8Ua; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V6b1p8Ua"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-742c73f82dfso4990709b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 17:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749600805; x=1750205605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mlSU4jpCWDBdI4veUkREkqvjB82MepIf/LKbKmw4O7M=;
        b=V6b1p8UaF1BvAcdSGRWlCcj4oAGZSH/3aDD5BcPG3r5v9QYmxltSxUH1wZdrQVDoOp
         FTbAJrJ83O/02jARCBvF7lkuDA+TTgl6AGFvxXR89IP/Y+bzeW/0wAbVVw3u9yJCDfqI
         4d+cCe7TVUkeN18S5pFKXd8VZrBIIIC5hH6mqU7kUEjkbRkRlwe7/Rlt9cWFOSs55Klz
         gJM8nkSrAVw22vW16Dh9X9cEj6UV78TWT90GMp23TfXliOFLDqQBpAt7qO6mJPxgk1Bs
         Eye32l0Fi8t8bhIeBz60P3EN1PLXAlPPmPzcBYrE7XX9SSJh77G1IxQNoRjwx8Ps4JZC
         2bRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749600805; x=1750205605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mlSU4jpCWDBdI4veUkREkqvjB82MepIf/LKbKmw4O7M=;
        b=Atf95Tyv/Tt8w+o2oLyl2vb4m8QtZ0b7y+u/x0ay795zaVBJMX6aImVV7pIwlTrTSk
         KW+8rzrjdZv75k2bzAvPyYzRQu+wODLy2zJJjpeDI5xOe5MHaWsqhyblZiHULTgzWWkX
         6+bGOmrFPanL6Sb5AMw5kgu4qhgEQ8YI5enHQWl9ONKa0z3vhODiULZtE0NeOGSWTB8O
         VgVBRqE20dDjrByWmNLBBjXCsHbBV5+SDVjCmiZYqm4/oIhR8U/G045/k1gWHTdN5k5E
         xuJp/yZn2MAaCvEfC0JQAXYLNx2yOMkf/ED56T2GZ1R6uq0afh+lAaekVQuzorDN3Eh8
         kBFw==
X-Forwarded-Encrypted: i=1; AJvYcCXqCqfTbLZ+g6FCA1EVo0lCC8JmJmxXowvE3ijQkQd01qg+18IDAuvi1H3RjZvjRSuP/4oI/KOGr3lp1NI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyDYBCSuxuxmWhQQ3FBfnXetDr0ShunYmQ+rKAos4AKTPvdWv5
	v8+ZnRLRegqNrt0ek44aW1feJBGc4OyAOu/Xd/BueIP+PLL0yBSsqO59
X-Gm-Gg: ASbGnctQnoE918MffGEGbgR8er4UExfVD3ZabTp5yBK2U6ukVIL0aFVr8L+nIvKp0nz
	K3qB9U2npaRQ1vip7A6hYyj/d50s9lzqfagwxxKqf7HUmV0AtENyFuAbE1auZlPQ7SkYWozp6/S
	/W220ddmJ6tVWUqIHpuD5LCfisiEhUmnoqJV4xQPP5qPdQIpYY/vDMYTSSAKQ2Nsu2WS1wIRcBN
	RzCdk+KDirD0Q4jxGMBmOF78Ho6LfJ3255Wmqf3R+lxvFqkyyDaKhSGrBE+27UK6zvTIpEdv3ta
	zUI6qiJqbAdg47yP/8ISz6oXLnOgKgGCK+uL4Jd7Q+OyG5BRdk3zAY6A6jJ0WbesxnasjW6aHm7
	fzJfLe3qYdSRHdNheOmqsCyeL9/SVg1o=
X-Google-Smtp-Source: AGHT+IE2MxKPxK6KnSy8t+jfSq7ys8qoXWj29rbTSR2ikUVUTNQCBj2S10f8+8rgAuGmp4fyImoeew==
X-Received: by 2002:a17:90b:4e90:b0:311:f05b:869b with SMTP id 98e67ed59e1d1-313af21acdbmr1835486a91.30.1749600805524;
        Tue, 10 Jun 2025 17:13:25 -0700 (PDT)
Received: from fedora.. (c-67-164-59-41.hsd1.ca.comcast.net. [67.164.59.41])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-313b2137b77sm161367a91.34.2025.06.10.17.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 17:13:25 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Subject: [PATCH 2/4] m68k: mm: Convert free_pointer_table() to use ptdescs
Date: Tue, 10 Jun 2025 17:12:53 -0700
Message-ID: <20250611001255.527952-3-vishal.moola@gmail.com>
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

Motorola uses free_pointer_table() for page tables, so it should be using
struct ptdesc, not struct page.

This helps us prepare to allocate ptdescs as their own memory
descriptor, and prepares to remove a user of page->lru.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/m68k/mm/motorola.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/m68k/mm/motorola.c b/arch/m68k/mm/motorola.c
index 35c3571ffbef..6a459710b2a7 100644
--- a/arch/m68k/mm/motorola.c
+++ b/arch/m68k/mm/motorola.c
@@ -200,21 +200,20 @@ int free_pointer_table(void *table, int type)
 {
 	ptable_desc *dp;
 	unsigned long ptable = (unsigned long)table;
-	unsigned long page = ptable & PAGE_MASK;
-	unsigned int mask = 1U << ((ptable - page)/ptable_size(type));
+	unsigned long pt_addr = ptable & PAGE_MASK;
+	unsigned int mask = 1U << ((ptable - pt_addr)/ptable_size(type));
 
-	dp = PD_PTABLE(page);
+	dp = PD_PTABLE(pt_addr);
 	if (PD_MARKBITS (dp) & mask)
 		panic ("table already free!");
 
 	PD_MARKBITS (dp) |= mask;
 
 	if (PD_MARKBITS(dp) == ptable_mask(type)) {
-		/* all tables in page are free, free page */
+		/* all tables in ptdesc are free, free ptdesc */
 		list_del(dp);
-		mmu_page_dtor((void *)page);
-		pagetable_dtor(virt_to_ptdesc((void *)page));
-		free_page (page);
+		mmu_page_dtor((void *)pt_addr);
+		pagetable_dtor_free(virt_to_ptdesc((void *)pt_addr));
 		return 1;
 	} else if (ptable_list[type].next != dp) {
 		/*
-- 
2.49.0

