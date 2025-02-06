Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630B61A01CC
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 18:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738867894; cv=none; b=ZWcAkKG70pxkeLnei5Oh2tEAD0y73x8mYtDiQq2LBlGDYLmCL44NNsSchkiQy2jIZlUOEwfxEqq4Sp8oCTvBvL+0S7kOT05NEe54VfcW0nmvmnE59TgwKRV1If4ZiPWnNZOwmwBo5r3ThModPLxd6hfFzptEXCHV3/8DA2mm3NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738867894; c=relaxed/simple;
	bh=l5bPVm7m9Up4DS/ePsgdGmNzbRXRNd7MVW6ZKnyXIow=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=s9LjslkGuxSLuIBHphHuBSwhGUi9k82UvAi5bbLIDkSsnSmML9SlEn4os6ozIcxTzXlH1Z10A4BfITk5x755ENI9UDrDY28Qk1IFnaQb7tsC3P+CYvOEoPJTTwkP7pdnC67dfrihV3JS32ANDbNujyZEXbQMcVdtSVb+YvkjEdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PMPRDgzy; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PMPRDgzy"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2f83e54432dso3847098a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 10:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738867893; x=1739472693; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZM2K7Fz2wY4XMJIGW8UIEY9GhsBMo7TuugczH48eoOc=;
        b=PMPRDgzyUg5N4ZExgVnHTuEFu9A3XK67IXLt7pKEOhdHKrLW0zRsfZ3ZhjpO6KxYtX
         5VQOFnFgM0ZzqZPQhE+DraJfPbf8Nk3sjgaBkAdxjhEcEPpXfzT1vC3NdgYNd/43lGS0
         EggksKCjFa/h5hVjmh/oaSHyog31QxYmt/4BNPmDZajRgpd1DnM6ADOhN8UDrCS7xOao
         Hraoe4GIfInKf0Q6IxXRMVnNt9neCswXP1V8oLZnYCRw5vdH7MUPCE2Hp++thDx3LZtM
         RQFM1kR+USdc2KsSeVFQFNfCc/ik1Hf+TIKc4SP5XSGG5mdcaJNnCcubW9Y6rba3YPuB
         ci3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738867893; x=1739472693;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZM2K7Fz2wY4XMJIGW8UIEY9GhsBMo7TuugczH48eoOc=;
        b=MXqPt6sy3v/y2w08D6dfLjg7izE3UggTKeP8VadD5SRh6yBAms9elQgjkhA9SsHHLb
         ESumV5CuzediPC9JzRVrinRGgm1Yewxzx3MZ2PlaoTC7eGe3u5AbRntI2Y/5wSIHUJgs
         2aMv8IMBbtXyK0i7vC2sopDeXN1ENRzOBGCq+2aAY3Fae0ciDtnfOuIEXIby1Oh9yOia
         AeYbnFZKVp2D935FEKbt0wIk1q+mGKYkf9UxoFjmEyToM2KeDKdCrZ35QlWEvTbSapqO
         FrnARmlfE4+jK29nZ2H/83lGROuUwnVnxOpbVLMGOSw+PT8wees7GWyUizQZ+z8ew8M7
         ro2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXzc/MMb2d5eqDRyfLmjWi+KdDkqZKQmcw4uzSq6ZngQbbjKhqhEobEzq5hyyCzAouQoebbt6HF2maWCug=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9/t0UhjYxzSsr7FtM0hli206I2bHdWTeoocVxoz7LfZ0YTK/T
	eyhNx7drpiAfm4Ds5IeDB5XaAXmc75Zk4Gb3HRzryDkfmoNFec2Tea6a7qTB11JSqJo1IQ==
X-Google-Smtp-Source: AGHT+IFVHLzvQXhhOOlHiOL7BAHshrKvK37YtrOlJQtEUP1k+IFRDA6RXf7GAghzr6oe2lWRYNCvHguW
X-Received: from pfbha22.prod.google.com ([2002:a05:6a00:8516:b0:728:e76c:253f])
 (user=fvdl job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:84c:b0:72d:80da:aff
 with SMTP id d2e1a72fcca58-7305d463bb9mr573392b3a.9.1738867892913; Thu, 06
 Feb 2025 10:51:32 -0800 (PST)
Date: Thu,  6 Feb 2025 18:50:50 +0000
In-Reply-To: <20250206185109.1210657-1-fvdl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250206185109.1210657-1-fvdl@google.com>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <20250206185109.1210657-11-fvdl@google.com>
Subject: [PATCH v3 10/28] mm/bootmem_info: export register_page_bootmem_memmap
From: Frank van der Linden <fvdl@google.com>
To: akpm@linux-foundation.org, muchun.song@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Cc: yuzhao@google.com, usamaarif642@gmail.com, joao.m.martins@oracle.com, 
	roman.gushchin@linux.dev, Frank van der Linden <fvdl@google.com>
Content-Type: text/plain; charset="UTF-8"

If other mm code wants to use this function for early
memmap inialization (on the platforms that have it),
it should be made available properly, not just
unconditionally in mm.h

Make this function available for such cases.

Signed-off-by: Frank van der Linden <fvdl@google.com>
---
 arch/powerpc/mm/init_64.c    | 4 ++++
 include/linux/bootmem_info.h | 7 +++++++
 include/linux/mm.h           | 3 ---
 3 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/mm/init_64.c b/arch/powerpc/mm/init_64.c
index d96bbc001e73..b6f3ae03ca9e 100644
--- a/arch/powerpc/mm/init_64.c
+++ b/arch/powerpc/mm/init_64.c
@@ -41,6 +41,7 @@
 #include <linux/libfdt.h>
 #include <linux/memremap.h>
 #include <linux/memory.h>
+#include <linux/bootmem_info.h>
 
 #include <asm/pgalloc.h>
 #include <asm/page.h>
@@ -386,10 +387,13 @@ void __ref vmemmap_free(unsigned long start, unsigned long end,
 }
 
 #endif
+
+#ifdef CONFIG_HAVE_BOOTMEM_INFO_NODE
 void register_page_bootmem_memmap(unsigned long section_nr,
 				  struct page *start_page, unsigned long size)
 {
 }
+#endif /* CONFIG_HAVE_BOOTMEM_INFO_NODE */
 
 #endif /* CONFIG_SPARSEMEM_VMEMMAP */
 
diff --git a/include/linux/bootmem_info.h b/include/linux/bootmem_info.h
index d8a8d245824a..4c506e76a808 100644
--- a/include/linux/bootmem_info.h
+++ b/include/linux/bootmem_info.h
@@ -18,6 +18,8 @@ enum bootmem_type {
 
 #ifdef CONFIG_HAVE_BOOTMEM_INFO_NODE
 void __init register_page_bootmem_info_node(struct pglist_data *pgdat);
+void register_page_bootmem_memmap(unsigned long section_nr, struct page *map,
+				  unsigned long nr_pages);
 
 void get_page_bootmem(unsigned long info, struct page *page,
 		enum bootmem_type type);
@@ -58,6 +60,11 @@ static inline void register_page_bootmem_info_node(struct pglist_data *pgdat)
 {
 }
 
+static inline void register_page_bootmem_memmap(unsigned long section_nr,
+		struct page *map, unsigned long nr_pages)
+{
+}
+
 static inline void put_page_bootmem(struct page *page)
 {
 }
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 7b1068ddcbb7..6dfc41b461af 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3918,9 +3918,6 @@ static inline bool vmemmap_can_optimize(struct vmem_altmap *altmap,
 }
 #endif
 
-void register_page_bootmem_memmap(unsigned long section_nr, struct page *map,
-				  unsigned long nr_pages);
-
 enum mf_flags {
 	MF_COUNT_INCREASED = 1 << 0,
 	MF_ACTION_REQUIRED = 1 << 1,
-- 
2.48.1.502.g6dc24dfdaf-goog

