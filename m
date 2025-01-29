Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F7D1F03C2
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 22:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738190565; cv=none; b=CmtKPsA1eV88xe/R7mgOF+7WvsquQdTs5mSFHOOuccI7WoSsHS2gxLW8mFSZmZmZ1g6w5CXY2BsESG7/dfj7QbItEKn3XfezJWZ8BHGcwZuOEGndAtACTDsqAzMWYE3pdt0FxGsg+ejeszBrTe3B3KfPQS/j6+QYYCbZPCDmiq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738190565; c=relaxed/simple;
	bh=6bj6ZRW/p7dPQYiEdbPQw97OkjElbWxQy/n31wZ6H6A=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tUoe06kXDSfJ4rd5fy8xnCSkZvJ3helll8xHRbCWQgUunNtUMQtqI3xcGOtzPQDFFZEtTmdhvjxPyiAC0UyCUGliZkEsDdJ3KnnGDDCHCbwsfCIhq5fY/r1QSQ+1WjI+lKw4D/zsjxLQBXhADVMKvhb2t92gkYMYJTXmYQiAXVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Zfe5agDH; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Zfe5agDH"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-216266cc0acso22035475ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 14:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738190564; x=1738795364; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=owdlgfr/VPS42Eha44p1LufvQJZlV8Uk+cba5IVjd9o=;
        b=Zfe5agDHDsjzQnLAKtb6INd2NRQT+/SgZW8LFdqB1u5P+S7uo6oSDz/arblpAxO+Do
         RWAhh168O0P/OCvBp9uuuEpgoaRe6L7gG2uqJVmWuK+gRradS/k0lzj9aaD6O/YhB17/
         APPH9NEFisDmnxwoq7W7eLXt/vnz8QGpUbCe+VxwEqIiZEgSTAufEvmqY3DdTktoI3Aa
         t88bFoGOYTehNc1djbkDAHZtyGxmsVxMLp/Yt6MgJhmht5e64An886LujLaLJKnonMVz
         Tsm9/QBM/hkIovjwo9Zx7wOkJ0TT+MqvUeGqAF44Yr5oXzNapASqH+jbGPO7Q495gRlk
         3u6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738190564; x=1738795364;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=owdlgfr/VPS42Eha44p1LufvQJZlV8Uk+cba5IVjd9o=;
        b=ZY/kJu8GAcB2O7irLps0mqQk8zrk7Y0uIgaZzmxDLmuL+RYIcEZSct3DAyARi3W/F6
         Rs4Nt5ehNjrB5fgIH69wq8EYIJfdZwQVZmlaUod4ZDXBkQBWf1OPMeF8toMqM06WDCR+
         6Mz4FqKHPPAfG/t4rdGGSlOWWPfWK5a24DpStnwqXnLjIwrIRHiqmfrFYYdjAwzLCC7C
         /aLGj/1OFPIZ0HrNmuHrXX9bSEoiXekhC5DbOozjwsdBT7+CKETso1ei+d1PJNICMjPv
         xu4DRowL1lmYw3644/L6agNwSfdKkU9kNHrga4YpSVyK5SAVdGLkiOUCg2TFKRUX1biV
         yjTQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7Nql0r+8GXKACfFq6/N3VGeZFKzwwnRpn+3RgIaBJN4YnL7byGFAY1RL/wYixqLzaFJXA04ZCHkLv25c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8z27EdKwXFEGNnzX9Dy9O4s8yqDuNjdZ/JGEJ5mTwMWnfD1gZ
	1M3TpYxjBriK51BNzK7E96ByEXIlLCz2GmiYPVf/EkVWcXhCY0JNWlC03fzp4EK5kQhICg==
X-Google-Smtp-Source: AGHT+IHEVdOPU8hWxfFhDQfhZQ8pAOtZCFOUBUvtqAFn5Pxdp3YDWz7gu5clrbq1G86WIUxTF3GKcBps
X-Received: from pfbeg27.prod.google.com ([2002:a05:6a00:801b:b0:72a:89d4:9641])
 (user=fvdl job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:388:b0:725:d64c:f122
 with SMTP id d2e1a72fcca58-72fe2ccbc83mr1635907b3a.2.1738190563842; Wed, 29
 Jan 2025 14:42:43 -0800 (PST)
Date: Wed, 29 Jan 2025 22:41:46 +0000
In-Reply-To: <20250129224157.2046079-1-fvdl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250129224157.2046079-1-fvdl@google.com>
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
Message-ID: <20250129224157.2046079-18-fvdl@google.com>
Subject: [PATCH v2 17/28] mm/hugetlb: move huge_boot_pages list init to hugetlb_bootmem_alloc
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
index 0a27659d9290..7879e772c0d9 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -3579,7 +3579,6 @@ static unsigned long __init hugetlb_pages_alloc_boot(struct hstate *h)
 static void __init hugetlb_hstate_alloc_pages(struct hstate *h)
 {
 	unsigned long allocated;
-	static bool initialized __initdata;
 
 	/* skip gigantic hugepages allocation if hugetlb_cma enabled */
 	if (hstate_is_gigantic(h) && hugetlb_cma_size) {
@@ -3587,17 +3586,6 @@ static void __init hugetlb_hstate_alloc_pages(struct hstate *h)
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
@@ -4921,13 +4909,20 @@ bool __init hugetlb_bootmem_allocated(void)
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
2.48.1.262.g85cc9f2d1e-goog

