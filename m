Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B2628C02F
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 16:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746633622; cv=none; b=GBSkQCO2hm6F3gAraJHv7CIRpAzlttsBYOt8sM/7gPvFtMddnP2xCuklf5cm6TRzxoh5Hu8vc04QQrDlc2HCzWWEEYOCBHyARIAwb7msgyMzdHGmK/wlR8gLV6dOeKiW7tX6Q+VWluBCjNqrxINm+cWEye495EC5LXV5Xpp4roE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746633622; c=relaxed/simple;
	bh=pAyN6A46nn56GR0YPDnjGLfQezwwzH+g6/Irv45zKWw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RvSXFR9/BuP6TbS8r1rtV6zIlE3yBumZfRC9sI/WC/6OY1kknYvQ2T2V0EmUZpQRJHf3j85UwIS+BKQMuLpiYnjHKuCyh5xCC8yJcNGx/qdSVakxTvON4v7jdoRAxW4heEWIa1Mauv8uj4CY32F4ONOseeb0g+WDVvfNOYN4P+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--glider.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kjHf2Tod; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--glider.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kjHf2Tod"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-ac79e4764e5so56063266b.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 09:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746633619; x=1747238419; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5rEhFIo2GHvtRIdrC/41qErpe5+c1Mj4STAx/upI2S4=;
        b=kjHf2TodYGIELTwn7+I11Zdpy0dmvJoKnpX1lxuUyLOdr9tczGvk5ZSLGEgcElEJXf
         uFLvChTcXF5KYSey2hXsD437TsETCL5Grp7sboq4+PJkkxp7uZ3Ib985eRuav7Vn1ro8
         d3UL9Mo5waxeR6YqfZOjIBnLtKAbC8kJrXYP6oTlltgykJCczpRJIN6n7vCuIaer0BVv
         9L0NzAUY2/MMcQhfQ1C9AULDzvRIpErm53x/BtScdvM/XBouCXOkSntU7/mjDGcEAGyC
         QULN/GcuUli9h3YeOSdsNWgjfY0o/JVOpsjaDTFW6tBEHt4cefwBy0VgOjMa+UXYIgXc
         9o7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746633619; x=1747238419;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5rEhFIo2GHvtRIdrC/41qErpe5+c1Mj4STAx/upI2S4=;
        b=RWJpEZh/FD+3gY0OihDCp+t0I9IFNLg2BgzopW2Vg8PavBTFgQicoE0v51JkXgwcOY
         FmeQzYpsTtuSESo5WU2yf8V7rxZ1zCRsBKpqGZPRbP0p0GIqGv7Pyn7MWQMGEZcKH2nV
         e2XgLXiu5HULqY70kwPzUyX6oFzMwO+e8OKRto++vG1jOjeEmCzylnlvHEPc0noH2nMc
         itwNtTU630RjaanqbB3uBbD3sSsiYTmanszpr1G1Zc+P9aKHoA+HFRl4eLyExmKOek7w
         KCyrPBeaFMQuoPDOcJ49hC8gnACS2YtGVFUMmMlyQvRh1F7Vg1SwtRHUSLBiRm3o8SJH
         V/Jw==
X-Forwarded-Encrypted: i=1; AJvYcCWwTPXplSjFxaGq1VSK6LQv2kk+kbq++Jrc/4ZEQVSHCi49L63/Ik925S0NVPjay9xVc4dqJRyx3ksAQKY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeL6ThHhXoR/Irq0XVv3HtuYkqsjbIUhjlavqwj/OFIAV6sPSs
	/S3z0khc9J4DJYXu+lLMwXoVynBilizfJOQ8qn2vd5fgkFslGcQPR5Pds2iIwPiCbo3jwM4iLvS
	rxg==
X-Google-Smtp-Source: AGHT+IEUZuXSYGh4XwCwdKgkZN9PicutiymyKjysBo2mHc/328vjUI7Wo3qodJLVv5RiKUa/xkhYSjIfdgk=
X-Received: from ejcji21.prod.google.com ([2002:a17:907:9815:b0:ad1:ec98:13d8])
 (user=glider job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:d14:b0:acf:c:22ca
 with SMTP id a640c23a62f3a-ad1e8c8cb88mr411905466b.1.1746633619050; Wed, 07
 May 2025 09:00:19 -0700 (PDT)
Date: Wed,  7 May 2025 18:00:09 +0200
In-Reply-To: <20250507160012.3311104-1-glider@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250507160012.3311104-1-glider@google.com>
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
Message-ID: <20250507160012.3311104-2-glider@google.com>
Subject: [PATCH 2/5] kmsan: fix usage of kmsan_enter_runtime() in kmsan_vmap_pages_range_noflush()
From: Alexander Potapenko <glider@google.com>
To: glider@google.com
Cc: elver@google.com, dvyukov@google.com, bvanassche@acm.org, 
	kent.overstreet@linux.dev, iii@linux.ibm.com, akpm@linux-foundation.org, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Only enter the runtime to call __vmap_pages_range_noflush(), so that error
handling does not skip kmsan_leave_runtime().

This bug was spotted by CONFIG_WARN_CAPABILITY_ANALYSIS=y

Cc: Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>
Cc: Kent Overstreet <kent.overstreet@linux.dev>
Signed-off-by: Alexander Potapenko <glider@google.com>
---
 mm/kmsan/shadow.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/mm/kmsan/shadow.c b/mm/kmsan/shadow.c
index 6d32bfc18d6a2..54f3c3c962f07 100644
--- a/mm/kmsan/shadow.c
+++ b/mm/kmsan/shadow.c
@@ -247,17 +247,19 @@ int kmsan_vmap_pages_range_noflush(unsigned long start, unsigned long end,
 	kmsan_enter_runtime();
 	mapped = __vmap_pages_range_noflush(shadow_start, shadow_end, prot,
 					    s_pages, page_shift);
+	kmsan_leave_runtime();
 	if (mapped) {
 		err = mapped;
 		goto ret;
 	}
+	kmsan_enter_runtime();
 	mapped = __vmap_pages_range_noflush(origin_start, origin_end, prot,
 					    o_pages, page_shift);
+	kmsan_leave_runtime();
 	if (mapped) {
 		err = mapped;
 		goto ret;
 	}
-	kmsan_leave_runtime();
 	flush_tlb_kernel_range(shadow_start, shadow_end);
 	flush_tlb_kernel_range(origin_start, origin_end);
 	flush_cache_vmap(shadow_start, shadow_end);
-- 
2.49.0.967.g6a0df3ecc3-goog

