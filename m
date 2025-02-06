Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D910E1AA1C9
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 18:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738867895; cv=none; b=sowRZ3tQD/QPPoLN8NtOlQmC6ayLgRUFF+psSPciuSjHRDm5R+Lcp1WlKHUUcBe2tzQ36QFoSWmpt9Gg2jkPL2O9LWTj9eO5YDMkZAmpCP9aEEn5ZdqAxZjDZj/fGSOcwuZ+BcaUS9i8XdAkH80UzPeTPa/aSo/mTHn6CUMgblc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738867895; c=relaxed/simple;
	bh=4I6z/LNscwuvV7r5B+sccqHhY2UFpLlyeFFA+UED/14=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=B9Hl0ciJFGvczxMHnVvAIAusBODAiUnySN6Kt8DnUzpKXXRrJ1eop53ghLSwZ11CGw+Bhloy4PjxSTo5KMpzQzwk02d92IktyWqm4Wvm9ElFSoL5FDfz5JIYODIISWmTrV8oeUaWpD8V3rLOvMzOq93B4KOTmd/eD3L64TqtOuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gQUUEdgE; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gQUUEdgE"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2f9e3a00fcdso2787449a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 10:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738867891; x=1739472691; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Avpy7BuEP02ffYq1Owfnvcdb9scYtoUfsZ01E274s1M=;
        b=gQUUEdgESUAh1mRws4vXsuHyHKSn8XtZfWOwrDA1t5XQ+XiQNgkK6nlMICVVZALt5f
         7djR2LQ5ZTUmUr05w6XFmV/ZTE2Cf88Zu29me7Ie3+dV006Np6A+VGfciQnq2XE51upG
         XkxMnubQxzOqvWctg9pcfd20nfVqn+MoJtGijYr84DpqV9th97Lcg/DoIetJ2UaaPB/L
         XgBwgY6Owob0spAcXwf+5pg1a3Vgfdt40EoHO5LFsu4GwdZvQQ+jbMqKrkmUmbCLp5Q+
         Ly6y9Dr43Yffnsn88v58pinzNiAQW1Dw9DJrzXB6b5C8bjHtyj4fgndogttYxJkSwEY1
         kGEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738867891; x=1739472691;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Avpy7BuEP02ffYq1Owfnvcdb9scYtoUfsZ01E274s1M=;
        b=o9dL/7ocfrrykGBS5A9IjOxQKqLNBtLEVIKf0NGOFcy/07+wwJOR7onEoyzkCGcmFx
         wFWPPDjHMMvOvxbDXnWMzdq7oEUD7ZYbJM5JV7CT3mNPQw2RtJ71GsRsEYtXM2IJFx08
         LGPbAMMXLyeOeEuFFcIyTTV//7/ewfrfszLM5GKnX7B2aoabwotA5/tMNz2iDVOkTxwp
         usvmvZLqc7Ah+bkmQNUukjLRKY2mQkq0xyMyMz8X2ms0dH8yu9wu+gZ7vAOzeVK6i1rb
         eVVlDyuByVCrPVDHkMRhNX5I3msrLLDW5ui7iKEn6qCXBkkir1KyOo7UY+LYK51I4ZwC
         2A8g==
X-Forwarded-Encrypted: i=1; AJvYcCU1U8+bCSkPbWvLttFjMXS/Y7sv0hMGDN7QKTbLMtuaJJ70BVLOeYXkbp2w2LlHdYjPZgr03AHOhPE+Et0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0YJBtB4NUcDF1n0lNWiWp9VXFeLtSZMRJd1odlKKMfw7UrE3L
	duRTGw7mzuBLXQUYTRQGrmu/KfrZfWZox8G70biw6/u+Co/jJh+AUbeJrlv5F6CNVDHUHg==
X-Google-Smtp-Source: AGHT+IFX3NvACBJ1xhrHGkex/mQRvyXzqKTeTXis5hJniSsUBBE3cj7dQzcaYViSr3/nKGrkfs3yIvZW
X-Received: from pjbpq3.prod.google.com ([2002:a17:90b:3d83:b0:2ef:701e:21c1])
 (user=fvdl job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:510e:b0:2ee:8430:b831
 with SMTP id 98e67ed59e1d1-2fa23f55c3bmr201823a91.2.1738867891288; Thu, 06
 Feb 2025 10:51:31 -0800 (PST)
Date: Thu,  6 Feb 2025 18:50:49 +0000
In-Reply-To: <20250206185109.1210657-1-fvdl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250206185109.1210657-1-fvdl@google.com>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <20250206185109.1210657-10-fvdl@google.com>
Subject: [PATCH v3 09/28] x86/mm: make register_page_bootmem_memmap handle PTE mappings
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
2.48.1.502.g6dc24dfdaf-goog

