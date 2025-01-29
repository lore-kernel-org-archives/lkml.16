Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419EE1E25EC
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 22:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738190553; cv=none; b=G3EVg9FMYihfqyr3PSTg5tImMYsz1JbtKPkI405oLIWFdygM3d7C8hmLZWnEn2YbZI+wmo+T9/hh7czMTJIDHbtuDoJOCvt7a7qnQ1jloJ2hoRbIalxjPwaOdlHILqsj/sz5De0BybIBeXd1gz0HLzJKRzuHo0wIi2ASZbglk+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738190553; c=relaxed/simple;
	bh=w2N6ciGEMzDasE8zwLLcmma2BXE5QxdMUWrsHXmFKeU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KBbREE5c4uhaTAAHtIJVsnGscKyblhH+tWYYfc0hOkXZKgbvDfg3QlhSyKXNdnnD2G8C3t70ZLsQGhl5aRetK9/F2PvQFOTWPPo3MPmEZ+5GOU/5sDEd58cK7Hh//49Cz2rWoGgx/Ww1KhzWel8a6NyMyD2brnoxR70+CLsQzOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QFCygw2H; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QFCygw2H"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2f46b7851fcso350034a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 14:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738190551; x=1738795351; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NdaXvVKgkNqaabYpHFU5W/ymB41iIHIErbbYhcizrz0=;
        b=QFCygw2HeuLI3l45oe21/UVh/6n6x8uODeKcuTLPBwE27EQ+Q6lum/GHoLSDFCDYUB
         b45MQvzU9ge8RSVlVGkMp3+QliQCJ+fBarc5JgB3wg5cgPiz9OGj6v67CYlVBb0YZU3t
         X5gzF8OLoOKmEuORdJKhUsjVRw4aV8YLutV5EOBQSWpDYK115RRxWIhmS+HJSUEqNPVb
         07dL3uja+pkOeoC20LIxDakkJYhU1LyYwLQbU1Vtsv4orsZImSiP8UhQdi5h5movbesQ
         Bj6OC9ncqsuhMCO9xwZlp92eTX7hEBDsXZ+xjuiLdexAR5B6sUy07VQ6FVL4g5asLox9
         6sbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738190551; x=1738795351;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NdaXvVKgkNqaabYpHFU5W/ymB41iIHIErbbYhcizrz0=;
        b=wwWxH3P99To0h7kO/uyoM0//YwactEwdni8PFacRThtz2G3GW/9BaTsXi0MsoCpTbi
         43LQfEi5u8Zn2m3hd3Xn0gaHdPD04jfnGHCiLlAdlv0p6nqlLU5Ng7mPe+qbC90mTRIE
         0E4hXHndPCbQnL5y4J0OGcPhBlwkp096ArJ4d+nN9gr+6RsyPrCzF3pZTp4rNJoYHGP/
         X5wyC+lM08c4Z3WY2y8+yHHl7lOHrwSgrI6kpUOrrv8MyKgchbtXBHW8lunVa1HYrreR
         qmv06LXdNl0SYK5gXvQ4y2oR0y4Zx9Ine+gpn7w3Xn+C5NEh7a0HUoHyHB9ZTCNSxB5v
         I2sw==
X-Forwarded-Encrypted: i=1; AJvYcCXwVzdUE3LZ2RgbdSUSgw08Ir2QOYkjbul9eEEbqntXL8Ot6GBoaIUn1r5qnwYGn0ASg+tjWz5PQ1wYilY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb4fJc53ryyiHN2VGzRepB/af/nhw8CzV42rYGN/46y7/ZUaAm
	5kslQd5Dt3UUfW9AFz4e4+wVRzWbVrM81allnGovDCfoNVqkwc9aRIqO8icVfAujPQDlbg==
X-Google-Smtp-Source: AGHT+IHw/wrvs6eYtSXxybbi6ZpEmFFHuoZkE0uX4Iwdoy1hJPle0E2kJ2J6Mh6qYpoJPyZfUbzKoCH1
X-Received: from pfxa13.prod.google.com ([2002:a05:6a00:1d0d:b0:725:d9ab:3f2e])
 (user=fvdl job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:10d1:b0:72a:8b8f:a0f1
 with SMTP id d2e1a72fcca58-72fd0c9460cmr6874234b3a.20.1738190551535; Wed, 29
 Jan 2025 14:42:31 -0800 (PST)
Date: Wed, 29 Jan 2025 22:41:38 +0000
In-Reply-To: <20250129224157.2046079-1-fvdl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250129224157.2046079-1-fvdl@google.com>
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
Message-ID: <20250129224157.2046079-10-fvdl@google.com>
Subject: [PATCH v2 09/28] x86/mm: make register_page_bootmem_memmap handle PTE mappings
From: Frank van der Linden <fvdl@google.com>
To: akpm@linux-foundation.org, muchun.song@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Cc: yuzhao@google.com, usamaarif642@gmail.com, joao.m.martins@oracle.com, 
	roman.gushchin@linux.dev, Frank van der Linden <fvdl@google.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"

register_page_bootmem_memmap expects that vmemmap pages handed
to it are PMD-mapped, and that the number of pages to call
get_page_bootmem on is PMD-aligned.

This is currently a correct assumption, but will no longer be
true once pre-HVO of hugetlb pages is implemented.

Make it handle PTE-mapped vmemmap pages and a nr_pages argument
that is not necessarily PAGES_PER_SECTION.

Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Frank van der Linden <fvdl@google.com>
---
 arch/x86/mm/init_64.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
index 01ea7c6df303..e7572af639a4 100644
--- a/arch/x86/mm/init_64.c
+++ b/arch/x86/mm/init_64.c
@@ -1599,11 +1599,12 @@ void register_page_bootmem_memmap(unsigned long section_nr,
 		}
 		get_page_bootmem(section_nr, pud_page(*pud), MIX_SECTION_INFO);
 
-		if (!boot_cpu_has(X86_FEATURE_PSE)) {
+		pmd = pmd_offset(pud, addr);
+		if (pmd_none(*pmd))
+			continue;
+
+		if (!boot_cpu_has(X86_FEATURE_PSE) || !pmd_leaf(*pmd)) {
 			next = (addr + PAGE_SIZE) & PAGE_MASK;
-			pmd = pmd_offset(pud, addr);
-			if (pmd_none(*pmd))
-				continue;
 			get_page_bootmem(section_nr, pmd_page(*pmd),
 					 MIX_SECTION_INFO);
 
@@ -1614,12 +1615,7 @@ void register_page_bootmem_memmap(unsigned long section_nr,
 					 SECTION_INFO);
 		} else {
 			next = pmd_addr_end(addr, end);
-
-			pmd = pmd_offset(pud, addr);
-			if (pmd_none(*pmd))
-				continue;
-
-			nr_pmd_pages = 1 << get_order(PMD_SIZE);
+			nr_pmd_pages = (next - addr) >> PAGE_SHIFT;
 			page = pmd_page(*pmd);
 			while (nr_pmd_pages--)
 				get_page_bootmem(section_nr, page++,
-- 
2.48.1.262.g85cc9f2d1e-goog

