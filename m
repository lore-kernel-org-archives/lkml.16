Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D811D197A8A
	for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 14:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745157899; cv=none; b=sgStRXt4e0Nez75USlliYQjvYfD0WVZl5Q6n72FOlQ7frszD3VTaIuXsMBKBlnvAartufSF8wsmIZYI1Lq6JDjCdqrkInJSpMV/GGMcyda3DRdjuNu7VExVsfP/hByFH+z75fAgqETEPmeZb1fwdLNBH69trEfys5dI9c28gTAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745157899; c=relaxed/simple;
	bh=xkvR/X+zXW0W4VKxOZyOUY1H47WWZqGZDwMukFejhyY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dntG6znnHYiIMW4su28an7u5k+CJaKZx+jm3Oq99pZmLOoBFbQY/hHCOYFNQJQ0T/8DTDE4QHkvllHQ1yla8+Y2DbuMLig8IipnnEyH2fxc7ixH1SrZgi319PVvC2QJTR+j4KxSDQ21kvNlnAV9aCFxhwirlV+M1dR4PnidkmXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WEd4L/3u; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WEd4L/3u"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-224100e9a5cso37675635ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 07:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745157897; x=1745762697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9ZIqmKHNV8CejitTITi4WXYVX1dQ+AeACuVEThJLEYg=;
        b=WEd4L/3u59KQNhTTOCKLazKOAeurCkfXZ0fOEBa3XAX8t+fS5T6/nOUdCRTbbPd3bJ
         nemBg67YExQOHLjQVxIvEXSoXUZOM84rFaIcBjr0wWC71/oScFTe2wYfDyJVk51JDcRd
         6eX8Uoz6mteMKTTZx0hoROBHYdT93tXZLTxyX1HxVGG1PUOwKuCqEwYPihKsGkbMhqRr
         fGy7LWV5X5O0mN9xCGlbTZuWbaycxqXG0gCjamVsnMN2IEWqfhwubbo8W3+J5NGjZx2d
         lp/ceX/5MXCsymaOVLdN41NK85dbPaJJkyWhQKOph8XYcYxtbdA9CM36hxYgr1d9A0gn
         r2ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745157897; x=1745762697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ZIqmKHNV8CejitTITi4WXYVX1dQ+AeACuVEThJLEYg=;
        b=gUiHhTlHE8hklbx0kfpblR8TeBWGsRU2kq5QsOEEjIbONEsef6ILLFIrc7Tzk9qA7g
         CKgCQMulgACBRF2y5VGcrKMmi0kSeWl56hBL1+sEFRBbtST08ddcmV5MyTRHqORTmZQs
         rTssnB4LBfN+EHHi3kAb2Ssfg166LLvV3JqyklaL7w9S/tpQaEA8CiWGoB2hTIo5hLk3
         rmYzcM12at1bxMeLHRVEKgsqAD/tEb1+IR5OVw9aBwX80SOQ/rwqaYpIyMllmDoEtk4N
         FFsiuBZCzwnqJuyoQorZH0RCmhl3aP3mAyTxrF6sl71wx3ggwaqmkkbADuqOdYSRNRLG
         I62A==
X-Forwarded-Encrypted: i=1; AJvYcCX2G0zhitoZOBS/HEZFvITwyQcSH1dtW84wWdIfRAC/0SGMxc9YyencUyN8IvNgXOarLIyV0tDLTjOsgEA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLeP5VJQK5yX4lZpH/Og0RB7zoQIgvICDe/1DKibAPL+bZ7xgk
	qD15ysQyIf5AmbE1fM/mC98Xsf+F7YNOelhxI4cFxrS71/7QVlZf
X-Gm-Gg: ASbGncvrs7N7k+kEp39nqy5pg1jp9NvS4fitkbw/G31kBNDZQsP4vzpcZs+mbZncTA6
	8NgiNs/hzIknQvY6u1b3yHZ0ktd7LgDR3w+LGN3xpWz/hsiwrS0o1i3i3exnh0Ukd/MV9MoJrZo
	NHX7g+J4r/1jI9wRZPhUiPJrh/jUG54iN4+i/fiRvjKURYC8QSbBug9VSnISkclGllEvGUeqt0d
	FTuVdqIiweX//Wml4x0CePOi1Qu8+yzRo9N25Tv38B1rlUz3lDNd92+wO8NiZXTomf2Zz899115
	dZYshGjHPfuLC0cW4zzXsqvLB8FTGBNYE6ODN+XmK2c=
X-Google-Smtp-Source: AGHT+IFGfXSNCkwqnDfirZFbGga2eIrwPevEPntcSLypscl0h3E0CAJLa5ZVgTEg0/i099fntAtzuQ==
X-Received: by 2002:a17:902:e5cf:b0:223:5525:6239 with SMTP id d9443c01a7336-22c53600e34mr138091415ad.38.1745157896957;
        Sun, 20 Apr 2025 07:04:56 -0700 (PDT)
Received: from prabhav.. ([115.99.107.22])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb4bc9sm48447075ad.128.2025.04.20.07.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 07:04:56 -0700 (PDT)
From: Prabhav Kumar Vaish <pvkumar5749404@gmail.com>
To: rppt@kernel.org,
	akpm@linux-foundation.org
Cc: Prabhav Kumar Vaish <pvkumar5749404@gmail.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mm: Fix typos in comments in mm_init.c
Date: Sun, 20 Apr 2025 19:34:40 +0530
Message-Id: <20250420140440.18817-1-pvkumar5749404@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Corrected minor typos in comments:
	- 'contigious' -> 'contiguous'
	- 'hierarcy' -> 'hierarchy'

This is a non-functional change in comment text only.

Signed-off-by: Prabhav Kumar Vaish <pvkumar5749404@gmail.com>
---
 mm/mm_init.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/mm_init.c b/mm/mm_init.c
index 9659689b8ace..7f3361fd5392 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -828,7 +828,7 @@ overlap_memmap_init(unsigned long zone, unsigned long *pfn)
  * - physical memory bank size is not necessarily the exact multiple of the
  *   arbitrary section size
  * - early reserved memory may not be listed in memblock.memory
- * - non-memory regions covered by the contigious flatmem mapping
+ * - non-memory regions covered by the contiguous flatmem mapping
  * - memory layouts defined with memmap= kernel parameter may not align
  *   nicely with memmap sections
  *
@@ -1908,7 +1908,7 @@ void __init free_area_init(unsigned long *max_zone_pfn)
 		free_area_init_node(nid);
 
 		/*
-		 * No sysfs hierarcy will be created via register_one_node()
+		 * No sysfs hierarchy will be created via register_one_node()
 		 *for memory-less node because here it's not marked as N_MEMORY
 		 *and won't be set online later. The benefit is userspace
 		 *program won't be confused by sysfs files/directories of
-- 
2.34.1

