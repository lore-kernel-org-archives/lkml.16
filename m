Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCAA62475C2
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 11:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744716412; cv=none; b=a62BxAUDkHIRnMU3iCDrHgAXVEdytRwrDMZXa7lvyLkw77wQkWYPgAtRyDNROHCZxH+oscPTB4Aa1xHfBKQFjg4kZkX6+Ebx+xmKguSyE3HnjXiqcpUkLel0tVrJMfc+HgzZwZK6KvTvk35Ws75X5Fd54XhrGH4jhrdVq4eOTPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744716412; c=relaxed/simple;
	bh=1lvlm0rOtEEi2CD0DFC4F6gzjLvuIlQ4WS063WSEIi4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aL7LnBXtYGKUVBnLhM/SM1C/VSUCUy9BuGoJaxIEcTULHO3lw1pC6A0HtQ7TOoUKdkAkqzr8ANhU8EyXFcrM/AlQzMRsAsfsNs/xZCDe9mM53Vxp20MunUbV/543lzV8emRxnk5vM9SoGBUdZuKosD6WeRGTocZJDckh+1C3Sgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dGk+UUMi; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dGk+UUMi"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30ddad694c1so54176951fa.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 04:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744716409; x=1745321209; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ae2vhRMvIWUBa1bi47eF6Ga7Y/YbQJwW6SK4mLPFno0=;
        b=dGk+UUMiT2dLySiy4KgBzx7xV39kMndi7JevKFHQ85c43fg8a4+HBAD/HzaPrhBDsq
         LptrmZ3zbmdTlmZfG2FVpZk9YHgwXvk11YsXL2AnP7jhNx4JXuocMJDwS4Ix3sLeFaK8
         cpYpkp2H85lq/2lWXRj57ZeFcFcIEP5yIrwyBij+tfEb/rm0JiYjfXLvXU1wx1WVI9jn
         VMLC933LZEiFSijQJDG93f0LHmeS3YisQIvesEBGPdGdp/Euh4zESzy5+l+H9yYsIkJX
         TdUAb+cJiP7iwhqFHYjx1jl0lAjzxdXft88ePcSFAMypXC7i3ncnhuSDoFrKyIml8z3L
         BDYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744716409; x=1745321209;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ae2vhRMvIWUBa1bi47eF6Ga7Y/YbQJwW6SK4mLPFno0=;
        b=eUUdr5JXf5sPGaBNWtFcsRsYIydmWWfeQRnA3YbrjFqow6UdoOLg/+5nCgd/ZjetJa
         WSR4/Ud3+73pc+Ja/0WAu00b7NmVLX9s1ozuowNr3qeWOmCLI7bU23BBdSfmmAOvA3ZD
         FRtd7+x6ZeGfhJ3DoDIOfUiKZmnk14+Ii995PRHwYBR+gCOqxntw78tRKIb4TGag3t0z
         G8Bxe6OBH2pAMLAA4xQFPvCnJKsH+dUE1pOGJpHyKg0UQRihY0sA5WfApwwcJg3MQ9BP
         XO7nqM8RccAqGOkqS6U4JhzO/mcMZBQl9OcmTNeeasU7gvbvZsKo3pxhLH5Rmd39yEVE
         sqpw==
X-Forwarded-Encrypted: i=1; AJvYcCVIFfA1fOc2SyDX057UdsTUJFJhpF6MitdZZ8/51bHLOvshUSM2ATIkDUshmwvekeiIbDQ4kbRwdVtRzBU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoqyrPt5smB0E68xKCAWoCXS6WuZ06TpP6NTuPpBmaAU/Stbpw
	a37KRBfz4i8ImM8DNTdMkbVRt6oV5olr57kvXEq3etYH55Xn5Z7F
X-Gm-Gg: ASbGnct3NxZJMt6zgwH/Q04RPFlPbgGi7X0H2je/9NFD5+BG7D3vlHMv/lgm5YbvuvL
	4D9llsfIVyDseUimGNIUlAfD6vnNaW1DXyMIR4WtO0iqu20jA3iDnb0ahJRoiUUUdiTANsbkWXH
	uJnDeCyYDWf+ZOJ+bARLa0Q1s40L3hhG+EW6qKa3ozyv/WyTInDtGe2E/qp6nFBtStWRvF2Q6Mm
	rngFYRpXsPqOQEFj7jMiDpCYIk/GN+UzqERKVtcWqgczL48mlnM7oAvqk5bSL0Q7UxcQaP+W4X1
	2MUWLIvTBpoQIXx9s02LBLAchNY5ZibjBJS7
X-Google-Smtp-Source: AGHT+IHf31KluLOI1TeXjsIV5f6k4fYrZpAtXvgClNVdm8sYzKQ8FM9K2CDwvmNrMd2hDUyQo/i0LQ==
X-Received: by 2002:a05:651c:2212:b0:30c:2e22:c893 with SMTP id 38308e7fff4ca-310499fbf5dmr50004841fa.23.1744716408778;
        Tue, 15 Apr 2025 04:26:48 -0700 (PDT)
Received: from pc638.lan ([2001:9b1:d5a0:a500:2d8:61ff:fec9:d743])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f4638da16sm21394461fa.0.2025.04.15.04.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 04:26:48 -0700 (PDT)
From: "Uladzislau Rezki (Sony)" <urezki@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org,
	LKML <linux-kernel@vger.kernel.org>,
	Baoquan He <bhe@redhat.com>,
	Christoph Hellwig <hch@infradead.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Oleksiy Avramchenko <oleksiy.avramchenko@sony.com>
Subject: [PATCH] vmalloc: Use atomic_long_add_return_relaxed()
Date: Tue, 15 Apr 2025 13:26:46 +0200
Message-Id: <20250415112646.113091-1-urezki@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch from the atomic_long_add_return() to its relaxed version.

We do not need a full memory barrier or any memory ordering during
increasing the "vmap_lazy_nr" variable. What we only need is to do it
atomically. This is what atomic_long_add_return_relaxed() guarantees.

AARCH64:

<snip>
Default:
    40ec:       d34cfe94        lsr     x20, x20, #12
    40f0:       14000044        b       4200 <free_vmap_area_noflush+0x19c>
    40f4:       94000000        bl      0 <__sanitizer_cov_trace_pc>
    40f8:       90000000        adrp    x0, 0 <__traceiter_alloc_vmap_area>
    40fc:       91000000        add     x0, x0, #0x0
    4100:       f8f40016        ldaddal x20, x22, [x0]
    4104:       8b160296        add     x22, x20, x22

Relaxed:
    40ec:       d34cfe94        lsr     x20, x20, #12
    40f0:       14000044        b       4200 <free_vmap_area_noflush+0x19c>
    40f4:       94000000        bl      0 <__sanitizer_cov_trace_pc>
    40f8:       90000000        adrp    x0, 0 <__traceiter_alloc_vmap_area>
    40fc:       91000000        add     x0, x0, #0x0
    4100:       f8340016        ldadd   x20, x22, [x0]
    4104:       8b160296        add     x22, x20, x22
<snip>

Signed-off-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
---
 mm/vmalloc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 7bb32f498d39..9d4027041a3f 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -2370,7 +2370,7 @@ static void free_vmap_area_noflush(struct vmap_area *va)
 	if (WARN_ON_ONCE(!list_empty(&va->list)))
 		return;
 
-	nr_lazy = atomic_long_add_return(va_size(va) >> PAGE_SHIFT,
+	nr_lazy = atomic_long_add_return_relaxed(va_size(va) >> PAGE_SHIFT,
 					 &vmap_lazy_nr);
 
 	/*
-- 
2.39.5

