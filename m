Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF00189F20
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 10:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747995969; cv=none; b=pykojrbPOJwpv0bT7riawsHSZ8TAq+cux8coBv6UUUq7nJaNvUQWBx6iUr8j63N0VdyGTv0cIulL0j80upfVUDw0couXkxpdTFhVIvK8hrZteOvwavAz1Q4iAASf6uvocklSyIqvQACBbhykotmsZX0toR86SuBsJaywTz+Aegc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747995969; c=relaxed/simple;
	bh=bcYsnin9VPXR/y8tWclWXvzWwofXEviKydxbQaAZorY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XjN5icrf5zZEtq+eTcJmRJPwEBZnl/guIhRhtlGxoNQkVaE1UUSXVIHa+rZV9yRzr2+hKnjgoMT/may9/aa36duu1MsOfRlojb+oS36o7ZzB1rx81EOftA0D5sshAmysjIMgAopghB72dQOB223HtOoVKwsDusLj+4qQFwEtJxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UhPN5MkU; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UhPN5MkU"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b0b2d0b2843so6531624a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 03:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747995967; x=1748600767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AK+EJDvvd5AljdjD7isL+zEpSV7/XSrQxGsCRQ6yYBY=;
        b=UhPN5MkU2akpUS8WNHjMV4cqMXmfBWXx8U/d3et8yFjVkvZp0hO2sjZyRUC5tc+Mg8
         yKstFo6VEB9nyyTfkGdQwaYc57kyrqhzUTTRku6SyPf8qwCwC2NvtPkiVAbYww+/WSEb
         CL8N6Sjdw/9nKGq7TRUZgApUvuVV2AD0IMnyp/e0YJfbN1+kiyFGo3L/0561oCWrTFjb
         hOVaWWg7Lv5u9PYRkhzLSanxY+nfpFCpQ42KxOFtFRQEQtWB7q0Y8d6fSLsQrfl63wg7
         2DzLDQROr+TnjnLBnfVqrgFxFKidxEL5r88AP2BZ7xiNNV3PU33Zg5/3fR92rTqkoUz6
         h5Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747995967; x=1748600767;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AK+EJDvvd5AljdjD7isL+zEpSV7/XSrQxGsCRQ6yYBY=;
        b=bmy7lGLdZtSyVcL65AxwTu+iz2v3vp8DRN/J8jffpEtaZF9axC7NBv4yenD5Gz0bgZ
         GYocRVbpaLy2an2fsiwI0RIFxoIZMQbYnVmpSUj/hdzIJi95GO2lNgU1o9e85nNEVbAi
         PXEEQlRH1MagFCpVFmEq3XDXi0soafcLsQEWA1bzN66CJ/kn3vTEH0eY1iGYNjdeqT2D
         nnLVfvxg8fJJCtQ5TMOC4jesM4qlvH7UADZLIy1/Im5asNA1DRQm4Q5duTbVeW6VZ70S
         QcBQgMOOPWPrDVIa+njUHAwIlqeAtq0s1X7/I/Aj1VexlNWIfsppWdLDoGzKLgTg/yNl
         51zQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPa8u5N21wSgSuOQ6WbxGKaZYH8BH7UdO0RyCG3B+mI8D9/RiDjhhHVR36p+QFWxlr9NollrIc4TgDwAk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzA0wXxHOS/SjOfv/elCvRAoeXsbWwagWzq8RVkCgx89QcKRPHp
	uL9go+Uyolg2juSYIJGUhTfFheP0PRew7oPFYjK4wRVEOkLSBkCIoeeeVqzkKhpBGiz85Q==
X-Gm-Gg: ASbGncvIWgmmpTo1RpibptqF6NxfhNo+3+5MxIaOTDMOkStBB4tttCtYZ8lPYQFzVlX
	P6sWkE1K6+J1DGvrUCfqKWtVgFjojSTp4CxMjbKJZRhaO7t419Skktk6yVQ3IbFruIvB76aNpQe
	6Y4Tzr9Du6pyKoVf52m8fU1rN7G8yeTx0Tn6K+09c1CUlDyxT8v4yBqxIk8KPIVtIkRckidN7vz
	ZvJQi6I2Ws+0AkL+o4jaU7ruzrdZHwH6FdNLffhvOEGdowsJRINJLNMCWX5VOg93h7yT/PZYnLj
	S+V1pPAXNAEPsc0MCnphj0D2AqKgqKOf8GFtlnjhBYqdADhRMtifKcqZtwO9tQ==
X-Google-Smtp-Source: AGHT+IGYZ3xu64EEpf40Lpn20P4asck9u2uViBBVoTKBG4PoULWz4zZWgr27PM3ydvGtebRsXF2kzA==
X-Received: by 2002:a17:902:f791:b0:223:501c:7576 with SMTP id d9443c01a7336-231d439b01dmr439171545ad.12.1747995966386;
        Fri, 23 May 2025 03:26:06 -0700 (PDT)
Received: from localhost.localdomain ([119.8.44.69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-233f3e046bbsm8181845ad.50.2025.05.23.03.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 03:26:06 -0700 (PDT)
From: Han Gao <rabenda.cn@gmail.com>
To: linux-riscv@lists.infradead.org,
	Han Gao <rabenda.cn@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Andy Chiu <andybnac@gmail.com>,
	Jesse Taube <jesse@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Xiongchuan Tan <tanxiongchuan@isrc.iscas.ac.cn>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] riscv: vector: Fix context save/restore with xtheadvector
Date: Fri, 23 May 2025 18:25:56 +0800
Message-ID: <9b9eb2337f3d5336ce813721f8ebea51e0b2b553.1747994822.git.rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Previously only v0-v7 were correctly saved/restored,
and the context of v8-v31 are damanged.
Correctly save/restore v8-v31 to avoid breaking userspace.

Fixes: d863910eabaf ("riscv: vector: Support xtheadvector save/restore")
Signed-off-by: Han Gao <rabenda.cn@gmail.com>
Tested-by: Xiongchuan Tan <tanxiongchuan@isrc.iscas.ac.cn>
Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
---

Changes in v2:
  Add fix tag
  Improve commit mesage

v1: https://lore.kernel.org/linux-riscv/c221c98dc2369ea691e3eb664bf084dc909496f6.1747934680.git.rabenda.cn@gmail.com/

 arch/riscv/include/asm/vector.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index e8a83f55be2b..7df6355023a3 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -200,11 +200,11 @@ static inline void __riscv_v_vstate_save(struct __riscv_v_ext_state *save_to,
 			THEAD_VSETVLI_T4X0E8M8D1
 			THEAD_VSB_V_V0T0
 			"add		t0, t0, t4\n\t"
-			THEAD_VSB_V_V0T0
+			THEAD_VSB_V_V8T0
 			"add		t0, t0, t4\n\t"
-			THEAD_VSB_V_V0T0
+			THEAD_VSB_V_V16T0
 			"add		t0, t0, t4\n\t"
-			THEAD_VSB_V_V0T0
+			THEAD_VSB_V_V24T0
 			: : "r" (datap) : "memory", "t0", "t4");
 	} else {
 		asm volatile (
@@ -236,11 +236,11 @@ static inline void __riscv_v_vstate_restore(struct __riscv_v_ext_state *restore_
 			THEAD_VSETVLI_T4X0E8M8D1
 			THEAD_VLB_V_V0T0
 			"add		t0, t0, t4\n\t"
-			THEAD_VLB_V_V0T0
+			THEAD_VLB_V_V8T0
 			"add		t0, t0, t4\n\t"
-			THEAD_VLB_V_V0T0
+			THEAD_VLB_V_V16T0
 			"add		t0, t0, t4\n\t"
-			THEAD_VLB_V_V0T0
+			THEAD_VLB_V_V24T0
 			: : "r" (datap) : "memory", "t0", "t4");
 	} else {
 		asm volatile (
-- 
2.47.2

