Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3ECE19F461
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 16:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747930199; cv=none; b=AYH+0ThoNWXdCJxD3gWTqtLvuQghBGoVHnwz0sYr3Zfmsmn7uTXu97DoucBnKnoq6DGW/1iqtp40I1D0EfpiqtVR2A3IU6sMjJwYpDOIqlhOaf5vfqK7HdfuSzfDx20Lhvl0Jq449ibgnf5PkYxniMtLjsBbWY36MqfTXfucgu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747930199; c=relaxed/simple;
	bh=tst1Po6ozz3pJTzX7J5A5WCysYhemMzcgeMymEJXJ9Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TbQdBjj1PfvkbGuujZIBuUKbRTYpumqe6mOudCRU3P3suU1gWY9gUTJ4IXFx2AkTLkLHd+KzW1O1LUbzlr/zK1DgUCKtt2XZo63TEm2BgNyQly+ZXfG/ljOYJAAITwV/MW3+wDDEl8qP2hzRI2VaS4NmklLjsK5zHKtZ9wU0zzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=DKRsxm/h; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="DKRsxm/h"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-601a8b6c133so13258eaf.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 09:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1747930197; x=1748534997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5txajPoK02leRSID3w5St6cITh88qbWPgXm254RBils=;
        b=DKRsxm/hl9MF+x3P+FDBrZ6hfw0opM9pGPorCml2WlOLfZ9EE5ijJl6/k+p12tykoM
         QdsYkyYvSLmA1jfPfa09TR/zTb0zN/ITbZcA3WCVpXcEr71Nq/JlVLxBNqMiQtpS5s+a
         +C76r+0eJBbowYf4dLOAdsG+fNfBaOpwcHT6/Tq7TdaaSBwLxtsyOGkylKhy+PkPpYAi
         PyqAnilbY8rP31eMJggX/lVLwgUtisezWLTK17qovuT/CW2mGTk1VOvRnZF/GFgFC9yS
         UeoUK/CrvBj3kgfz5ndD/4Wys2ARnwurLji+pL8Osl7LgVujn2j1w/H+F+0REZVNFP+T
         lscw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747930197; x=1748534997;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5txajPoK02leRSID3w5St6cITh88qbWPgXm254RBils=;
        b=oP6JTDTHzfdQhIela510mFS47MmzA4/Gmz+CmAZOvHE26R41sHmSzezV4vm5K+qZJQ
         D6Yp3g1iyqNQCLapVTkczOAI5BLq2oZ7842zdCyYmZFXRwkOC4jm/Pt3mwVbu7AHue7x
         fH00V+ZYRGTPymxLWxnAhdia1Sh5gExhSIEDRYZy6p7JjsTy69L74ZhoO1uXHUdREJky
         ksg4pfOI5KkNCe31dJntHQE/3FeM/Doh4SQWeiXuQASklzIgBWBdnW0GXGVs27g83tqb
         m5Myb5FNBQCRYoaTKRNSxMZ9ydsqtXtZqKTWbkiCOb8eFmxG7ei2cptk27mMWvrB1jrb
         EdlA==
X-Forwarded-Encrypted: i=1; AJvYcCXTzuj+XHxJzypUrCxqnupjFxP7Msm+FIEj/hdrU0uRHAlmchMmK88N5Mx3qim5S4audRovzjep+FNUM7k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx203kwZ+sSU1nrRMEdJhVkHKnmFqa4bp1j/i4j4uWJ+f3KhiE0
	fwABhonE4Y95eLdp/OdjKXh+Rw4jP2woe9rmtqiYpXSee31oprOozkJOkIKb9FO8PA==
X-Gm-Gg: ASbGncvSdYP9VDiDgZIHBRAkOBhYlghmdRtxCuHWsuWc7Ov0lTDSLHkL34Ucmisy3OJ
	90mpkry9pJf3VGydRa5hbcOVRYDhU/zqBArlK5bQhb0WgmXTUnM7xjnCxjVwheiyxJri1tzK5el
	OAG20lN4ZPX/0X3I1duklWVEhUz7foEbTdKQhyy2Lr7pltsZ07czJfWcqDcYlyL+BH3lmI+b2/k
	brjbBASnOgu/YEy70WM5HiqrK8T+pfZaThljDetjHfo6ZGrlemCLIAavs+FjV5xqcM2TIov1yGd
	dPqW4H/y3tZzlK8JXhVvoJVeNqZJqXH3XgFxs63+pyab1ZOpuwGCM680//S2opGcBNBJWQ==
X-Google-Smtp-Source: AGHT+IH19b+MIj5PYSfaf6y9UStpP/b5HIL66R1l+D0oZALB8RGrhGav3hq01rMAYcQDEE5AYTNfCA==
X-Received: by 2002:a05:6870:7302:b0:2e4:9c8e:f59c with SMTP id 586e51a60fabf-2e83e974461mr8522fac.19.1747930196705;
        Thu, 22 May 2025 09:09:56 -0700 (PDT)
Received: from aus-ird.tenstorrent.com ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2e3c06af18esm3104863fac.13.2025.05.22.09.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 09:09:55 -0700 (PDT)
From: Cyril Bur <cyrilbur@tenstorrent.com>
To: samuel.holland@sifive.com,
	ben.dooks@codethink.co.uk,
	palmer@dabbelt.com,
	alex@ghiti.fr,
	linux-kernel@vger.kernel.org
Cc: jszhang@kernel.org,
	paul.walmsley@sifive.com,
	charlie@rivosinc.com,
	jrtc27@jrtc27.com,
	aou@eecs.berkeley.edu
Subject: [PATCH] riscv: uaccess: Only restore the CSR_STATUS SUM bit
Date: Thu, 22 May 2025 16:09:54 +0000
Message-Id: <20250522160954.429333-1-cyrilbur@tenstorrent.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During switch to csrs will OR the value of the register into the
corresponding csr. In this case we're only interested in restoring the
SUM bit not the entire register.

Fixes: 788aa64c0 ("riscv: save the SR_SUM status over switches")
Signed-off-by: Cyril Bur <cyrilbur@tenstorrent.com>
---
I've put the Fixes tag in but I assume this will get squashed into the
patch. Either way I hope this works to fix the immediate issue.

 arch/riscv/kernel/entry.S | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 00bd0de9faa2..6ed3bd80903d 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -399,14 +399,18 @@ SYM_FUNC_START(__switch_to)
 	REG_S s11, TASK_THREAD_S11_RA(a3)
 
 	/* save the user space access flag */
-	li    s0, SR_SUM
-	csrr  s1, CSR_STATUS
-	REG_S s1, TASK_THREAD_STATUS_RA(a3)
+	csrr  s0, CSR_STATUS
+	REG_S s0, TASK_THREAD_STATUS_RA(a3)
 
 	/* Save the kernel shadow call stack pointer */
 	scs_save_current
-	/* Restore context from next->thread */
+	/*
+	 * Restore context from next->thread. csrs will OR the bits from s0 and
+	 * only want to restore the SR_SUM bit
+	 */
 	REG_L s0,  TASK_THREAD_STATUS_RA(a4)
+	li    s1,  SR_SUM
+	and   s0,  s0, s1
 	csrs  CSR_STATUS, s0
 	REG_L ra,  TASK_THREAD_RA_RA(a4)
 	REG_L sp,  TASK_THREAD_SP_RA(a4)
-- 
2.34.1

