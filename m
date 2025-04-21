Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A8A13E02D
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 14:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745245712; cv=none; b=BP7lSZVi/9FtMSMT8SSFKDqtZM8pMgkd2atxH0e30YrAjzPWRggd0v1rwog8kgfLEBYhJceGhOG/U3ecLEx0QPbxArQZtBWnTrZawqvPt8YpcdttHytHz44Esd2d5lRvHfJLPii5C0r+xMpSl5JOEQWAlV/YFzJl81oTQbCLBVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745245712; c=relaxed/simple;
	bh=UrUXHDgH8D7X0VsVKQ4vLuQBSFYiJsoAioszkD948cg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RJtXFwoPe0DVIy5ROtXMt4J+cvVrZWcD8MK2oUfEph7z0cx88bWFF1IOlMpEEZuR4bDAEPjmGBRH0BmqbeRH3p0jn4UQdTBkJ7uvzQ2qWx8SZHNJC/5UDq3VTNarjy6xv8Exi9/E4z4AZH63QKMfGV28lq0xAjLDD1lSjl8hoq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=FyJ4/9qW; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="FyJ4/9qW"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso48655585e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 07:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745245709; x=1745850509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fgXsecntwfRSGjrcDXCs8qD6E3/9J+RIf148wqrIpWA=;
        b=FyJ4/9qWnsl8Wgpu7VMF2QVKhEX5xTbbyHc7s7gpsZLzkKkTmxmrXhpEmsgUA+RE8e
         FYt6T9K6ozohuAg7aUiFnstuytdhOXKGw5dwa9f+GTJMOEXwoxiscW2IPATO+TEGv8e9
         jXE5Vh59G8DZTcQ0g4UjGa9erPN9nf2fv8riJTUPCr12TyGNMoz1pxNj1ahQwoaK2cVe
         LeCMq3VR4uEV8BBtGIG07Z8BhVPxkkR3nOc/HvXkVreHCFM/N/BDOgTZhrL3iR0ZEFQB
         LeonTGE13wMqkuBpmBjPkYjJt1KdB8ecpyEAZxS7E5FqCDpcXuJ5xefjLtfOe4qOQc2o
         EYSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745245709; x=1745850509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fgXsecntwfRSGjrcDXCs8qD6E3/9J+RIf148wqrIpWA=;
        b=o8Q2UsC2k9TaGGVXnbjx7SLNA02PNBYhMqmCk6s/vVWGRQH0xzAG8sYOnWdLFwzphI
         9uNf2jJxgv/Rb0LI4mekNanBvQTuuHg13G/he0XHj2nq2skP5+ZjL0lIzBPSZKtg9oWK
         omsVWJUifqDEszHoaeSQIiOpwKUwueYC5gwWdsyeqF3muk0LeUxLTzWj2ka/Hv9eaLIM
         50Z22gyCbKM6M21XSemBSJY0KIV7q36MUpt0Qyr6O8FsBuleyXCbAwD1/7aONftBaDnb
         npti9b8IVVmGr28XYZweIp6GL6Vs1SIs6rfDBnbUTZUNDX1XiBX/Mvvzx1wS9p7RjZwE
         JM9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVtv/jVa8LQQmVHDh1VlCd7rw4cnVLHFVUqfGQW+S0Gw6zHZNp1u8lM8IAL88ky8vYYa9w8mEHFdiYXShs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDfBs83xaQTMqGaRLNog1qTRMgouu77GigXKtFU8JA2nIvu1iT
	/hORzqUsoeZrR1X5SDOhz30yiDYlAj3yzSEh2yWbka1erpjLV3tlIpZWVV2nUUU=
X-Gm-Gg: ASbGncvLZkwlMDDpQrjEltgPfRESna8nE0YcA/ly69ssgdZ5+Hy22FcnEMQKHv5asVp
	dDyAYzNv0Mm7Z7/+lRcta4u1AyKscOjf9AdhM8yxNPzKBRlNbtGNik3+nYhXLo8niJWZ/AoVCcC
	jEHMtYX4pp02sQDjFHpz+z1/STadEGMQ2Hd2J/4uSwFPJkJOotA+ywPSpPe9V9k7eElBXe7gEbY
	krspLFjLw6Lw991gvcfx1cx3amZX5/NCdCLYTVOErVt0aia1Np0ndcE6HahfJrJR6qpnDKhHpZv
	AxQTRPfyY69lTvUWSGkmHJL0zRrJIe+XU/xho7mw76RavVRaVG6sJZYLu+Q=
X-Google-Smtp-Source: AGHT+IF004bhFEXPI3CCJKmdwXsLTAbZYWv5EdIm3QZ5L16mdpCbU2yQOcrSdZib/PGDekiXc//UtA==
X-Received: by 2002:a05:600c:8411:b0:43d:83a:417d with SMTP id 5b1f17b1804b1-4406ab944edmr112676395e9.12.1745245708719;
        Mon, 21 Apr 2025 07:28:28 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:3382:ef90:cd58:9e76:e88c:5cd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5a9e1bsm141981795e9.8.2025.04.21.07.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 07:28:28 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Guo Ren <guoren@linux.alibaba.com>,
	Guo Ren <guoren@kernel.org>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v3 3/4] riscv: Add ARCH_HAS_PREFETCH[W] support with Zicbop
Date: Mon, 21 Apr 2025 16:24:40 +0200
Message-Id: <20250421142441.395849-4-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250421142441.395849-1-alexghiti@rivosinc.com>
References: <20250421142441.395849-1-alexghiti@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Guo Ren <guoren@linux.alibaba.com>

Enable Linux prefetch and prefetchw primitives using Zicbop.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Link: https://lore.kernel.org/r/20231231082955.16516-3-guoren@kernel.org
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/processor.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 09d4c963399a..39dfab495a4c 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -13,6 +13,9 @@
 #include <vdso/processor.h>
 
 #include <asm/ptrace.h>
+#include <asm/insn-def.h>
+#include <asm/alternative-macros.h>
+#include <asm/hwcap.h>
 
 #define arch_get_mmap_end(addr, len, flags)			\
 ({								\
@@ -135,6 +138,27 @@ static inline void arch_thread_struct_whitelist(unsigned long *offset,
 #define KSTK_EIP(tsk)		(task_pt_regs(tsk)->epc)
 #define KSTK_ESP(tsk)		(task_pt_regs(tsk)->sp)
 
+#define PREFETCH_ASM(x)							\
+	ALTERNATIVE(__nops(1), PREFETCH_R(x, 0), 0,			\
+		    RISCV_ISA_EXT_ZICBOP, CONFIG_RISCV_ISA_ZICBOP)
+
+#define PREFETCHW_ASM(x)						\
+	ALTERNATIVE(__nops(1), PREFETCH_W(x, 0), 0,			\
+		    RISCV_ISA_EXT_ZICBOP, CONFIG_RISCV_ISA_ZICBOP)
+
+#ifdef CONFIG_RISCV_ISA_ZICBOP
+#define ARCH_HAS_PREFETCH
+static inline void prefetch(const void *x)
+{
+	__asm__ __volatile__(PREFETCH_ASM(%0) : : "r" (x) : "memory");
+}
+
+#define ARCH_HAS_PREFETCHW
+static inline void prefetchw(const void *x)
+{
+	__asm__ __volatile__(PREFETCHW_ASM(%0) : : "r" (x) : "memory");
+}
+#endif /* CONFIG_RISCV_ISA_ZICBOP */
 
 /* Do necessary setup to start up a newly executed thread. */
 extern void start_thread(struct pt_regs *regs,
-- 
2.39.2

