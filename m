Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02BDA191F89
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 17:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747934855; cv=none; b=LWnlla8iQW1ePx0MG7ovpfnvkdC17t92G07HFJkpx5FxsaFiJoIVQR4vSd/W2FZk0QErWZaJD6xZQtC4AuR7kso/RCE0P5tDf1B/4iClr2B9s7qvZGHGfJ+XUvDSniZlrolWPTjKENZLW7kIW+ghR1F4/hEqJaJzGgQltAYlLS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747934855; c=relaxed/simple;
	bh=yW9gsHpWkfMK1ZcNHbBKCRZKeOGiHGCk9YfoEUGeKqc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VGrudbIvpFIr6N4CFv40xGvUwREzWxpUU8eAZ7ZKoak2G4DFonA0grDwNq6MV8XyTXp4WIQ6/abLfZApmQM9HK7vjL2a3HjYc4GxFTolhFkUnQtO6m/ZsK8oWGXeF9VrtEbUoL2dhccYhC9OTr2q2OJjjDLh4Zrr5x1Tf5cWX0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UjY/is0t; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UjY/is0t"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-22e033a3a07so82136355ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 10:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747934852; x=1748539652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/ztGTHofDD0QlJWRuLcr8IoncE0qHTx6dcK54AezMcs=;
        b=UjY/is0tjBjMxcHtTSywva4NxzkKOz6WQ0M0o9Qqw58rApXR8672XHZZW+3dWGCf1c
         MqqCEIHx4/HhMKoW8vg8pSKgjf1wCshLCFlM8YmqOWeAZMlaaqUPiVMxT9o0ipmZqk+a
         5IjIxA0xMU0I0K9f9WfvbfD8CeA2sa5E3OWnhRDNUFyzEvde6StiidB9BEiTJ4YWuIpf
         fKOM1l2FiTPu3LDp91kWCH5pqf1Dc33/6U1ZI7SRvxCBsDIsyvo+r8/CQCuxqSo1exD3
         /VGsJJxVwVB2gyg2l1IvA6wiU9dSn7I12L5NuBJgCxFITVbJpLzxSZPcxu2RAgB6+hkh
         uZqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747934852; x=1748539652;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ztGTHofDD0QlJWRuLcr8IoncE0qHTx6dcK54AezMcs=;
        b=uayyySuIaQUu/8bvh/D5ZWpQ52Iqry9XjbJ0JeqUfSy5Stnraj3Ea2YS5nj64I5I4y
         I7VvmKBE9jDci1Ruuc5+8/LGAeDAIX3cNKAjwKxfhBYijhYswmlTPHdNmqiZ86tOp1JB
         psTv77j+fjQubzyxLCK4mGSaz4xgBzitLmOn91S7h78c78K/hkyu/hg4tgHH8xiBzRL+
         64eeOK1p26EEgFzPMDkNxdcm6jNiNLAYDCFBdlIC8dTBAKOvoXITJ1UvCaoETdP0ezOH
         44sI2hqJwNbQJyRQK1Ln/6+mvaWqdJ3S1YpE8McbOGRA3IZvEg9C+sWLIyXXunbH3tfa
         1RhA==
X-Forwarded-Encrypted: i=1; AJvYcCV74/3HqSse16A/umKvsEWhGCHC5SVELUCRb+ojAp6XxTH6Xt8zD5y85E4mMnq3P/BK60GiQvSamJ2dg+A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbU8YZsCwxB/C5R2MAktTymgOlYxD8W5ptCUU12VvEyak2nvC7
	Hkyn5yMMHiIqp9TSZP9ZiCux/lw91zf5pHbnRwc4NJEf9jX/7wsmasYm
X-Gm-Gg: ASbGnct5r7RM+KGLimzO62YSPjM1dFGnREijYcJJqA59TZNSq26i47dP19U0FLIqwR3
	g/JpJF7hmrzGHJuA2+OyN8RbEmgzNZVYgMADLmhMmE9uU74lvuudnZyAbxNEgohOCsVpDIn1VCK
	49e20+pI55F8N9tnCyS0qYzQRg48XJZpgpl0PhM8ngX9t+4o914i9CnHGW2V2q2Vgd5mMTKcA3b
	8wcCO1N8A9SOvDPnZN/3pWjw8ZxHG2aj9O4f2T9GTVS+22rF4D504UkQDKDeL2hMbapANqx7C6e
	a2nhmRwymykRgCsahNpNtPVLAhw8kBSGRA2xdyZa/jy50sr6JMBm68xKeyfz1Q==
X-Google-Smtp-Source: AGHT+IG7bPR8dyYr5GWSAWbH798rbSA8VE+03g42gPIXsWNEbWya72hArENXMGWvl9e7aXzqPUj+WA==
X-Received: by 2002:a17:902:f645:b0:223:4d7e:e52c with SMTP id d9443c01a7336-231d43d9a3amr401362305ad.5.1747934851951;
        Thu, 22 May 2025 10:27:31 -0700 (PDT)
Received: from localhost.localdomain ([119.8.44.69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e97227sm110993875ad.109.2025.05.22.10.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 10:27:31 -0700 (PDT)
From: Han Gao <rabenda.cn@gmail.com>
To: linux-riscv@lists.infradead.org,
	Han Gao <rabenda.cn@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Jesse Taube <jesse@rivosinc.com>,
	Andy Chiu <andybnac@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: vector: fix xtheadvector save/restore
Date: Fri, 23 May 2025 01:27:01 +0800
Message-ID: <c221c98dc2369ea691e3eb664bf084dc909496f6.1747934680.git.rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix [1] save/restore vector register error

Link: https://lore.kernel.org/all/20241113-xtheadvector-v11-9-236c22791ef9@rivosinc.com/ [1]

Signed-off-by: Han Gao <rabenda.cn@gmail.com>
---
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

