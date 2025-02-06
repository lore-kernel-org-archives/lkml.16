Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9889819DFA7
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 18:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738867906; cv=none; b=fQIOyFs8VilxIYinlNb4N/V8FlS6KWBa94sfKt1KcV8TvBptj518Td2ngJDYv5SNnRR3q8pHmUlJY/N7xZioYUNb5GSFuueB+72LHVCVqQrHm+5XHJGPIezWhnZaIkNV8E+7n7DwYfJ9ncYoR/94ZRP3/4+oEBJuhuDV/Yw5W2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738867906; c=relaxed/simple;
	bh=w163y2nRosE//joPGzINC1pFP0PswLMjSdcp4uQ9LCw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=f4dXAw1lpmD67ZRgOfNPsGF97G92uMDN0Kz0Hya07Fnfwwc1ZW0b5+pvfBqHpObVbFwd0DK+6Fz07NGoNSSz0R3u0MinoELKA4aWh6wuFVu24anm0eUJ/p6yXn14cvIVRE+CCEM9XvJG926E3MNJYncsRAvwEm6rm3ST9c6qq6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=31dFP5CM; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="31dFP5CM"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2f9f90051a2so2490043a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 10:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738867904; x=1739472704; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mjgqfpoeBSlwN57iYwWF6PWmjsHMNrUorj8RHJy/6t4=;
        b=31dFP5CMRtAn1WnO7aYYzbznl3cBuG9xznmsvWk9tXBp565CUeCm8IPiLM4iGpQt60
         T0NaOvxAg48B/b5owX0i1OkDB35L9T1CmtiWhzrKINIswNlV6kwInCAdT9fB+BR1aqgU
         K5EmYMcAvky3y/dYt4fB3KJPAfIIiLxoFlSr8RmVMXF83swgEywMQ8CE8jSOb4SmK66U
         Y4HyBGTld0fKXl8jUZ8aIVDrr//+H5Y59osJAZHc7E9GThg6GOd0JlSIJn77ur4eo/zG
         vH+Hemj4BuKsyGsBENQLMDQcUu7U8gwC6FmeCzKbIxeLcF0IK1NlEELlwVig1UDwinfT
         KoDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738867904; x=1739472704;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mjgqfpoeBSlwN57iYwWF6PWmjsHMNrUorj8RHJy/6t4=;
        b=NfujLwudei7X6F5+/BPNOJ6dk+Ja19KDFG908YLP9MjkaEyokB95xtmRLrcKWG1Vp7
         lTxFAd9Lw7IPlT/FMy4BDdaQQMrLuyzGvjGwcSnOcpngQUb2i1W3DCy4n/xfBY6A291T
         IwwxKNKrrvMbl89t+8rFrnTjwUHQqa2C83HLp8lgbUlsAl/vAeVH6iAtxFNcHXSA6hh5
         5d2l7pcrt6htyXkP3N4qUDbvlxKxWehFpk4HN2BEpIp4b5pbRb95jULl4qgn2MasajF+
         zodFieGKsWzov86xZ8yj2ULCF8PetVdUN7/FdXbDVQhoi96Jk5YWsxpR4VF/sW/Olv6x
         An3A==
X-Forwarded-Encrypted: i=1; AJvYcCW6nhbxuC7sdQWll55AqE8+Suc9iD96gt8t6k/Q7nyTDbwB6csw/GfNmKsbR66lPcgaKkbYAdc7oiHSzBg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGsoO/q+fQhgfGiJlM+U7EFDsPaey5YOgCuQreFOWznO69uJ32
	4qDgGqPQV5bVBSj2uZop9zibG1yraKec7pIUyi99hz70boXg07IdSNLWlTEv96E6kSI9sg==
X-Google-Smtp-Source: AGHT+IGsb48koloxCQu/0NbdMR5X4NhMSEmqGncLGIVHRlgshaXB4vQQkIYCmgOftKiKB7i67AnhOHrr
X-Received: from pjboe12.prod.google.com ([2002:a17:90b:394c:b0:2ef:9239:aab1])
 (user=fvdl job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3d03:b0:2f6:d266:f45e
 with SMTP id 98e67ed59e1d1-2fa23f42672mr204592a91.2.1738867903837; Thu, 06
 Feb 2025 10:51:43 -0800 (PST)
Date: Thu,  6 Feb 2025 18:50:57 +0000
In-Reply-To: <20250206185109.1210657-1-fvdl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250206185109.1210657-1-fvdl@google.com>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <20250206185109.1210657-18-fvdl@google.com>
Subject: [PATCH v3 17/28] mm/hugetlb: move huge_boot_pages list init to hugetlb_bootmem_alloc
From: Frank van der Linden <fvdl@google.com>
To: akpm@linux-foundation.org, muchun.song@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Cc: yuzhao@google.com, usamaarif642@gmail.com, joao.m.martins@oracle.com, 
	roman.gushchin@linux.dev, Frank van der Linden <fvdl@google.com>
Content-Type: text/plain; charset="UTF-8"

Instead of initializing the per-node hugetlb bootmem pages list
from the alloc function, we can now do it in a somewhat cleaner
way, since there is an explicit hugetlb_bootmem_alloc function.
Initialize the lists there.

Signed-off-by: Frank van der Linden <fvdl@google.com>
---
 mm/hugetlb.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 3db980db15ec..52ee5514a1f2 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -3578,7 +3578,6 @@ static unsigned long __init hugetlb_pages_alloc_boot(struct hstate *h)
 static void __init hugetlb_hstate_alloc_pages(struct hstate *h)
 {
 	unsigned long allocated;
-	static bool initialized __initdata;
 
 	/* skip gigantic hugepages allocation if hugetlb_cma enabled */
 	if (hstate_is_gigantic(h) && hugetlb_cma_size) {
@@ -3586,17 +3585,6 @@ static void __init hugetlb_hstate_alloc_pages(struct hstate *h)
 		return;
 	}
 
-	/* hugetlb_hstate_alloc_pages will be called many times, initialize huge_boot_pages once */
-	if (!initialized) {
-		int i = 0;
-
-		for (i = 0; i < MAX_NUMNODES; i++)
-			INIT_LIST_HEAD(&huge_boot_pages[i]);
-		h->next_nid_to_alloc = first_online_node;
-		h->next_nid_to_free = first_online_node;
-		initialized = true;
-	}
-
 	/* do node specific alloc */
 	if (hugetlb_hstate_alloc_pages_specific_nodes(h))
 		return;
@@ -4920,13 +4908,20 @@ bool __init hugetlb_bootmem_allocated(void)
 void __init hugetlb_bootmem_alloc(void)
 {
 	struct hstate *h;
+	int i;
 
 	if (__hugetlb_bootmem_allocated)
 		return;
 
+	for (i = 0; i < MAX_NUMNODES; i++)
+		INIT_LIST_HEAD(&huge_boot_pages[i]);
+
 	hugetlb_parse_params();
 
 	for_each_hstate(h) {
+		h->next_nid_to_alloc = first_online_node;
+		h->next_nid_to_free = first_online_node;
+
 		if (hstate_is_gigantic(h))
 			hugetlb_hstate_alloc_pages(h);
 	}
-- 
2.48.1.502.g6dc24dfdaf-goog

