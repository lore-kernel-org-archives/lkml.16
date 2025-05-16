Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9B913B284
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 14:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747404676; cv=none; b=VWN0s6M5vkBMH/XXGH8+DnK2VpEZh/tL37JBorCv/z4PzhNYPpTLTsX303yMUVR3zJhbj27j7vXMI0+DyCTKyObbjXVtFWASHyFu3uavANXiG3tiPZW/sF/tvMfu0hRNkszzKpsUE7CO9W3xaVRMhpeIohD8ycLiukC+vc4YwEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747404676; c=relaxed/simple;
	bh=bs7bBPlMs6+hxFO3DEcKNKIltaFDx91ztGZ0quZNIi0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bs7WTgDGRyknh2SHz3NB+l5OjYlMy2/Xnh+gygpZ7sCqdG0dJWYW3UEeRMlc8f+DfuMOkZ38ichhOVNrIf+vce9RNkduYxITm/qyZ6RUn8m492B4VShsB1g419ZVk0cuibcLDu6UQQuSi/eh4klyVPh+Unpr3asGCxt7EmLycPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=DTJFdepF; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="DTJFdepF"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-441d437cfaaso12782425e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 07:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747404671; x=1748009471; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CtME0NQJ/mDN72TaHqx9EV/jMwwbiGZ1jCYAZ/15zWw=;
        b=DTJFdepFGI+N2YFb0nmdAZYeiAP9RGoA/vJvL4aG6oyJfnoLvmoT0dggNl9ozYCgCh
         1XVlqIjyVbyNSzKEBpk6z+JU9oPdcLnIUXLBPtYYodGauVm0+7L2fWb/Ux0GEW49uBv1
         6c0j/sqlQzpAfx67HrfJbLQxHgCWxsxoIwTdyJ1loFLZPXeY+Jq93ZYX8xyc1feQ6BUT
         8TLn2/B5jnpQDY9eF65Z/EysXWSBUJung8jSWW0SUx/e9o0daz8YMHOoP2yjbHbLaX4m
         IddJe5p9TZH+pzIMZzmZ2vtP29RSMZXewr3TMAeDzkyZyJw41Cy7l31Sxqcrp9d9aSYR
         KGwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747404671; x=1748009471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CtME0NQJ/mDN72TaHqx9EV/jMwwbiGZ1jCYAZ/15zWw=;
        b=lHoFZq7GlJdRz1YsEebHVJ8bk5PNouogrEp8oiojp00zSwTF1jZVfVnph/E1ONwvCk
         WGnu9/MRcXJE5oPGhww52DRMIYFD89jIa0FA8CVt1c5T6Z1Os4EKPJgVYNk8IHEAK8yT
         5nrPT2V5KAvKROQJaPdvuy6z+F5uYPprup4Hpf4JlYEzZ5vfHA3vgnYwV746Gq+1OzJp
         qss+89nzQojXArPShlfun9Kp58XXQ3uqQctVzjTYyNtNgCDJftK7xltcUvPShyF6mUoU
         cpmD+qOIiQFBVZJK9i8173/LNEE1YCi/aJ9yrCVgnKNqPVe2r5A5sdoErCzSaMT3IO1d
         gJsw==
X-Forwarded-Encrypted: i=1; AJvYcCW1hf2PG/sBnYmLLnWM+hkfZYdW102y5lsxuq0ECo1qsybEGCRMQi176ZbHLcG7iVn057HecQXeHjtlsco=@vger.kernel.org
X-Gm-Message-State: AOJu0YytRwm6tZrl0POqIIcSAbHdVYEU6H44q3RWT4DdNM+suRNVmNvY
	dvvrjcMH0ksGJ6uI/zQCVfRn/q8evLLFynIdmOWKO+lpKxguKlMKK6FxUvCKhN7BIFI=
X-Gm-Gg: ASbGncso7jJkjLyjZBDx/m8bhygPeSijV2J1B7AVamAFRE+M6HVmc2+wSLUwYlA7bcL
	yUvv1K/XB2b202FselgXQRt2mi4OIY7sKdC15u16uQDWHOuqraGTwnPy/V1yHmTyw30pgcA3aAc
	4a+6wMREfafTifU0EoHGlgKrjQHu9rWlPpBWq4cAMwwaigO/6vvr0k7C7aQeza5WxsXLsdIhU37
	03XiqafmYSCI2ujQ0573XlpulQ/1r0AgNb1Mnp73Yz2ggJIbLsSCK18QY7+FCt6Ftgn9i/nnmFB
	RMIeJNUZXvQXV8aITWxF3w/4ZS7hicerqsUEWIlWc/zdUuhLowTEZGvk3g/p1Q==
X-Google-Smtp-Source: AGHT+IExVkJ0nXHGcw/2k4zPhkjrK6H/2b8ooOhoW2Uu9MjLIiXHkV48CQXjL8DDvDmSoA6zj6ai6g==
X-Received: by 2002:a05:600c:b98:b0:43d:8ea:8d80 with SMTP id 5b1f17b1804b1-442fefd5f4dmr28604895e9.5.1747404671330;
        Fri, 16 May 2025 07:11:11 -0700 (PDT)
Received: from alex-rivos.lan ([2001:861:3382:ef90:b6d5:4f19:6a91:78f0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442fd583f71sm34163605e9.27.2025.05.16.07.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 07:11:10 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v4 3/3] riscv: Move all duplicate insn parsing macros into asm/insn.h
Date: Fri, 16 May 2025 16:08:05 +0200
Message-Id: <20250516140805.282770-4-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250516140805.282770-1-alexghiti@rivosinc.com>
References: <20250516140805.282770-1-alexghiti@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kernel/traps_misaligned.c and kvm/vcpu_insn.c define the same macros to
extract information from the instructions.

Let's move the definitions into asm/insn.h to avoid this duplication.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/insn.h        | 171 ++++++++++++++++++++++++++-
 arch/riscv/kernel/traps_misaligned.c | 142 ----------------------
 arch/riscv/kvm/vcpu_insn.c           | 126 --------------------
 3 files changed, 166 insertions(+), 273 deletions(-)

diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
index ac3e606feca2..ad26f859cfe5 100644
--- a/arch/riscv/include/asm/insn.h
+++ b/arch/riscv/include/asm/insn.h
@@ -286,11 +286,172 @@ static __always_inline bool riscv_insn_is_c_jalr(u32 code)
 	       (code & RVC_INSN_J_RS1_MASK) != 0;
 }
 
-#define RV_IMM_SIGN(x) (-(((x) >> 31) & 1))
-#define RVC_IMM_SIGN(x) (-(((x) >> 12) & 1))
-#define RV_X_mask(X, s, mask)  (((X) >> (s)) & (mask))
-#define RV_X(X, s, n) RV_X_mask(X, s, ((1 << (n)) - 1))
-#define RVC_X(X, s, mask) RV_X_mask(X, s, mask)
+#define INSN_MATCH_LB		0x3
+#define INSN_MASK_LB		0x707f
+#define INSN_MATCH_LH		0x1003
+#define INSN_MASK_LH		0x707f
+#define INSN_MATCH_LW		0x2003
+#define INSN_MASK_LW		0x707f
+#define INSN_MATCH_LD		0x3003
+#define INSN_MASK_LD		0x707f
+#define INSN_MATCH_LBU		0x4003
+#define INSN_MASK_LBU		0x707f
+#define INSN_MATCH_LHU		0x5003
+#define INSN_MASK_LHU		0x707f
+#define INSN_MATCH_LWU		0x6003
+#define INSN_MASK_LWU		0x707f
+#define INSN_MATCH_SB		0x23
+#define INSN_MASK_SB		0x707f
+#define INSN_MATCH_SH		0x1023
+#define INSN_MASK_SH		0x707f
+#define INSN_MATCH_SW		0x2023
+#define INSN_MASK_SW		0x707f
+#define INSN_MATCH_SD		0x3023
+#define INSN_MASK_SD		0x707f
+
+#define INSN_MATCH_C_LD		0x6000
+#define INSN_MASK_C_LD		0xe003
+#define INSN_MATCH_C_SD		0xe000
+#define INSN_MASK_C_SD		0xe003
+#define INSN_MATCH_C_LW		0x4000
+#define INSN_MASK_C_LW		0xe003
+#define INSN_MATCH_C_SW		0xc000
+#define INSN_MASK_C_SW		0xe003
+#define INSN_MATCH_C_LDSP	0x6002
+#define INSN_MASK_C_LDSP	0xe003
+#define INSN_MATCH_C_SDSP	0xe002
+#define INSN_MASK_C_SDSP	0xe003
+#define INSN_MATCH_C_LWSP	0x4002
+#define INSN_MASK_C_LWSP	0xe003
+#define INSN_MATCH_C_SWSP	0xc002
+#define INSN_MASK_C_SWSP	0xe003
+
+#define INSN_OPCODE_MASK	0x007c
+#define INSN_OPCODE_SHIFT	2
+#define INSN_OPCODE_SYSTEM	28
+
+#define INSN_MASK_WFI		0xffffffff
+#define INSN_MATCH_WFI		0x10500073
+
+#define INSN_MASK_WRS		0xffffffff
+#define INSN_MATCH_WRS		0x00d00073
+
+#define INSN_MATCH_CSRRW	0x1073
+#define INSN_MASK_CSRRW		0x707f
+#define INSN_MATCH_CSRRS	0x2073
+#define INSN_MASK_CSRRS		0x707f
+#define INSN_MATCH_CSRRC	0x3073
+#define INSN_MASK_CSRRC		0x707f
+#define INSN_MATCH_CSRRWI	0x5073
+#define INSN_MASK_CSRRWI	0x707f
+#define INSN_MATCH_CSRRSI	0x6073
+#define INSN_MASK_CSRRSI	0x707f
+#define INSN_MATCH_CSRRCI	0x7073
+#define INSN_MASK_CSRRCI	0x707f
+
+#define INSN_MATCH_FLW		0x2007
+#define INSN_MASK_FLW		0x707f
+#define INSN_MATCH_FLD		0x3007
+#define INSN_MASK_FLD		0x707f
+#define INSN_MATCH_FLQ		0x4007
+#define INSN_MASK_FLQ		0x707f
+#define INSN_MATCH_FSW		0x2027
+#define INSN_MASK_FSW		0x707f
+#define INSN_MATCH_FSD		0x3027
+#define INSN_MASK_FSD		0x707f
+#define INSN_MATCH_FSQ		0x4027
+#define INSN_MASK_FSQ		0x707f
+
+#define INSN_MATCH_C_FLD	0x2000
+#define INSN_MASK_C_FLD		0xe003
+#define INSN_MATCH_C_FLW	0x6000
+#define INSN_MASK_C_FLW		0xe003
+#define INSN_MATCH_C_FSD	0xa000
+#define INSN_MASK_C_FSD		0xe003
+#define INSN_MATCH_C_FSW	0xe000
+#define INSN_MASK_C_FSW		0xe003
+#define INSN_MATCH_C_FLDSP	0x2002
+#define INSN_MASK_C_FLDSP	0xe003
+#define INSN_MATCH_C_FSDSP	0xa002
+#define INSN_MASK_C_FSDSP	0xe003
+#define INSN_MATCH_C_FLWSP	0x6002
+#define INSN_MASK_C_FLWSP	0xe003
+#define INSN_MATCH_C_FSWSP	0xe002
+#define INSN_MASK_C_FSWSP	0xe003
+
+#define INSN_MATCH_C_LHU		0x8400
+#define INSN_MASK_C_LHU			0xfc43
+#define INSN_MATCH_C_LH			0x8440
+#define INSN_MASK_C_LH			0xfc43
+#define INSN_MATCH_C_SH			0x8c00
+#define INSN_MASK_C_SH			0xfc43
+
+#define INSN_16BIT_MASK		0x3
+#define INSN_IS_16BIT(insn)	(((insn) & INSN_16BIT_MASK) != INSN_16BIT_MASK)
+#define INSN_LEN(insn)		(INSN_IS_16BIT(insn) ? 2 : 4)
+
+#define SHIFT_RIGHT(x, y)		\
+	((y) < 0 ? ((x) << -(y)) : ((x) >> (y)))
+
+#define REG_MASK			\
+	((1 << (5 + LOG_REGBYTES)) - (1 << LOG_REGBYTES))
+
+#define REG_OFFSET(insn, pos)		\
+	(SHIFT_RIGHT((insn), (pos) - LOG_REGBYTES) & REG_MASK)
+
+#define REG_PTR(insn, pos, regs)	\
+	((ulong *)((ulong)(regs) + REG_OFFSET(insn, pos)))
+
+#define GET_RS1(insn, regs)	(*REG_PTR(insn, SH_RS1, regs))
+#define GET_RS2(insn, regs)	(*REG_PTR(insn, SH_RS2, regs))
+#define GET_RS1S(insn, regs)	(*REG_PTR(RVC_RS1S(insn), 0, regs))
+#define GET_RS2S(insn, regs)	(*REG_PTR(RVC_RS2S(insn), 0, regs))
+#define GET_RS2C(insn, regs)	(*REG_PTR(insn, SH_RS2C, regs))
+#define GET_SP(regs)		(*REG_PTR(2, 0, regs))
+#define SET_RD(insn, regs, val)	(*REG_PTR(insn, SH_RD, regs) = (val))
+#define IMM_I(insn)		((s32)(insn) >> 20)
+#define IMM_S(insn)		(((s32)(insn) >> 25 << 5) | \
+				 (s32)(((insn) >> 7) & 0x1f))
+
+#define SH_RD			7
+#define SH_RS1			15
+#define SH_RS2			20
+#define SH_RS2C			2
+#define MASK_RX			0x1f
+
+#if defined(CONFIG_64BIT)
+#define LOG_REGBYTES		3
+#else
+#define LOG_REGBYTES		2
+#endif
+
+#define MASK_FUNCT3		0x7000
+
+#define GET_FUNCT3(insn)	(((insn) >> 12) & 7)
+
+#define RV_IMM_SIGN(x)		(-(((x) >> 31) & 1))
+#define RVC_IMM_SIGN(x)		(-(((x) >> 12) & 1))
+#define RV_X_mask(X, s, mask)	(((X) >> (s)) & (mask))
+#define RV_X(X, s, n)		RV_X_mask(X, s, ((1 << (n)) - 1))
+#define RVC_LW_IMM(x)		((RV_X(x, 6, 1) << 2) | \
+				 (RV_X(x, 10, 3) << 3) | \
+				 (RV_X(x, 5, 1) << 6))
+#define RVC_LD_IMM(x)		((RV_X(x, 10, 3) << 3) | \
+				 (RV_X(x, 5, 2) << 6))
+#define RVC_LWSP_IMM(x)		((RV_X(x, 4, 3) << 2) | \
+				 (RV_X(x, 12, 1) << 5) | \
+				 (RV_X(x, 2, 2) << 6))
+#define RVC_LDSP_IMM(x)		((RV_X(x, 5, 2) << 3) | \
+				 (RV_X(x, 12, 1) << 5) | \
+				 (RV_X(x, 2, 3) << 6))
+#define RVC_SWSP_IMM(x)		((RV_X(x, 9, 4) << 2) | \
+				 (RV_X(x, 7, 2) << 6))
+#define RVC_SDSP_IMM(x)		((RV_X(x, 10, 3) << 3) | \
+				 (RV_X(x, 7, 3) << 6))
+#define RVC_RS1S(insn)		(8 + RV_X(insn, SH_RD, 3))
+#define RVC_RS2S(insn)		(8 + RV_X(insn, SH_RS2C, 3))
+#define RVC_RS2(insn)		RV_X(insn, SH_RS2C, 5)
+#define RVC_X(X, s, mask)	RV_X_mask(X, s, mask)
 
 #define RV_EXTRACT_RS1_REG(x) \
 	({typeof(x) x_ = (x); \
diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index ac8f479a3f9c..b52df35a5e05 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -19,148 +19,6 @@
 #include <asm/vector.h>
 #include <asm/insn.h>
 
-#define INSN_MATCH_LB			0x3
-#define INSN_MASK_LB			0x707f
-#define INSN_MATCH_LH			0x1003
-#define INSN_MASK_LH			0x707f
-#define INSN_MATCH_LW			0x2003
-#define INSN_MASK_LW			0x707f
-#define INSN_MATCH_LD			0x3003
-#define INSN_MASK_LD			0x707f
-#define INSN_MATCH_LBU			0x4003
-#define INSN_MASK_LBU			0x707f
-#define INSN_MATCH_LHU			0x5003
-#define INSN_MASK_LHU			0x707f
-#define INSN_MATCH_LWU			0x6003
-#define INSN_MASK_LWU			0x707f
-#define INSN_MATCH_SB			0x23
-#define INSN_MASK_SB			0x707f
-#define INSN_MATCH_SH			0x1023
-#define INSN_MASK_SH			0x707f
-#define INSN_MATCH_SW			0x2023
-#define INSN_MASK_SW			0x707f
-#define INSN_MATCH_SD			0x3023
-#define INSN_MASK_SD			0x707f
-
-#define INSN_MATCH_FLW			0x2007
-#define INSN_MASK_FLW			0x707f
-#define INSN_MATCH_FLD			0x3007
-#define INSN_MASK_FLD			0x707f
-#define INSN_MATCH_FLQ			0x4007
-#define INSN_MASK_FLQ			0x707f
-#define INSN_MATCH_FSW			0x2027
-#define INSN_MASK_FSW			0x707f
-#define INSN_MATCH_FSD			0x3027
-#define INSN_MASK_FSD			0x707f
-#define INSN_MATCH_FSQ			0x4027
-#define INSN_MASK_FSQ			0x707f
-
-#define INSN_MATCH_C_LD			0x6000
-#define INSN_MASK_C_LD			0xe003
-#define INSN_MATCH_C_SD			0xe000
-#define INSN_MASK_C_SD			0xe003
-#define INSN_MATCH_C_LW			0x4000
-#define INSN_MASK_C_LW			0xe003
-#define INSN_MATCH_C_SW			0xc000
-#define INSN_MASK_C_SW			0xe003
-#define INSN_MATCH_C_LDSP		0x6002
-#define INSN_MASK_C_LDSP		0xe003
-#define INSN_MATCH_C_SDSP		0xe002
-#define INSN_MASK_C_SDSP		0xe003
-#define INSN_MATCH_C_LWSP		0x4002
-#define INSN_MASK_C_LWSP		0xe003
-#define INSN_MATCH_C_SWSP		0xc002
-#define INSN_MASK_C_SWSP		0xe003
-
-#define INSN_MATCH_C_FLD		0x2000
-#define INSN_MASK_C_FLD			0xe003
-#define INSN_MATCH_C_FLW		0x6000
-#define INSN_MASK_C_FLW			0xe003
-#define INSN_MATCH_C_FSD		0xa000
-#define INSN_MASK_C_FSD			0xe003
-#define INSN_MATCH_C_FSW		0xe000
-#define INSN_MASK_C_FSW			0xe003
-#define INSN_MATCH_C_FLDSP		0x2002
-#define INSN_MASK_C_FLDSP		0xe003
-#define INSN_MATCH_C_FSDSP		0xa002
-#define INSN_MASK_C_FSDSP		0xe003
-#define INSN_MATCH_C_FLWSP		0x6002
-#define INSN_MASK_C_FLWSP		0xe003
-#define INSN_MATCH_C_FSWSP		0xe002
-#define INSN_MASK_C_FSWSP		0xe003
-
-#define INSN_MATCH_C_LHU		0x8400
-#define INSN_MASK_C_LHU			0xfc43
-#define INSN_MATCH_C_LH			0x8440
-#define INSN_MASK_C_LH			0xfc43
-#define INSN_MATCH_C_SH			0x8c00
-#define INSN_MASK_C_SH			0xfc43
-
-#define INSN_LEN(insn)			((((insn) & 0x3) < 0x3) ? 2 : 4)
-
-#if defined(CONFIG_64BIT)
-#define LOG_REGBYTES			3
-#define XLEN				64
-#else
-#define LOG_REGBYTES			2
-#define XLEN				32
-#endif
-#define REGBYTES			(1 << LOG_REGBYTES)
-#define XLEN_MINUS_16			((XLEN) - 16)
-
-#define SH_RD				7
-#define SH_RS1				15
-#define SH_RS2				20
-#define SH_RS2C				2
-
-#define RVC_LW_IMM(x)			((RV_X(x, 6, 1) << 2) | \
-					 (RV_X(x, 10, 3) << 3) | \
-					 (RV_X(x, 5, 1) << 6))
-#define RVC_LD_IMM(x)			((RV_X(x, 10, 3) << 3) | \
-					 (RV_X(x, 5, 2) << 6))
-#define RVC_LWSP_IMM(x)			((RV_X(x, 4, 3) << 2) | \
-					 (RV_X(x, 12, 1) << 5) | \
-					 (RV_X(x, 2, 2) << 6))
-#define RVC_LDSP_IMM(x)			((RV_X(x, 5, 2) << 3) | \
-					 (RV_X(x, 12, 1) << 5) | \
-					 (RV_X(x, 2, 3) << 6))
-#define RVC_SWSP_IMM(x)			((RV_X(x, 9, 4) << 2) | \
-					 (RV_X(x, 7, 2) << 6))
-#define RVC_SDSP_IMM(x)			((RV_X(x, 10, 3) << 3) | \
-					 (RV_X(x, 7, 3) << 6))
-#define RVC_RS1S(insn)			(8 + RV_X(insn, SH_RD, 3))
-#define RVC_RS2S(insn)			(8 + RV_X(insn, SH_RS2C, 3))
-#define RVC_RS2(insn)			RV_X(insn, SH_RS2C, 5)
-
-#define SHIFT_RIGHT(x, y)		\
-	((y) < 0 ? ((x) << -(y)) : ((x) >> (y)))
-
-#define REG_MASK			\
-	((1 << (5 + LOG_REGBYTES)) - (1 << LOG_REGBYTES))
-
-#define REG_OFFSET(insn, pos)		\
-	(SHIFT_RIGHT((insn), (pos) - LOG_REGBYTES) & REG_MASK)
-
-#define REG_PTR(insn, pos, regs)	\
-	(ulong *)((ulong)(regs) + REG_OFFSET(insn, pos))
-
-#define GET_RS1(insn, regs)		(*REG_PTR(insn, SH_RS1, regs))
-#define GET_RS2(insn, regs)		(*REG_PTR(insn, SH_RS2, regs))
-#define GET_RS1S(insn, regs)		(*REG_PTR(RVC_RS1S(insn), 0, regs))
-#define GET_RS2S(insn, regs)		(*REG_PTR(RVC_RS2S(insn), 0, regs))
-#define GET_RS2C(insn, regs)		(*REG_PTR(insn, SH_RS2C, regs))
-#define GET_SP(regs)			(*REG_PTR(2, 0, regs))
-#define SET_RD(insn, regs, val)		(*REG_PTR(insn, SH_RD, regs) = (val))
-#define IMM_I(insn)			((s32)(insn) >> 20)
-#define IMM_S(insn)			(((s32)(insn) >> 25 << 5) | \
-					 (s32)(((insn) >> 7) & 0x1f))
-#define MASK_FUNCT3			0x7000
-
-#define GET_PRECISION(insn) (((insn) >> 25) & 3)
-#define GET_RM(insn) (((insn) >> 12) & 7)
-#define PRECISION_S 0
-#define PRECISION_D 1
-
 #ifdef CONFIG_FPU
 
 #define FP_GET_RD(insn)		(insn >> 7 & 0x1F)
diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
index 62cb2ab4b636..de1f96ea6225 100644
--- a/arch/riscv/kvm/vcpu_insn.c
+++ b/arch/riscv/kvm/vcpu_insn.c
@@ -10,132 +10,6 @@
 #include <asm/cpufeature.h>
 #include <asm/insn.h>
 
-#define INSN_OPCODE_MASK	0x007c
-#define INSN_OPCODE_SHIFT	2
-#define INSN_OPCODE_SYSTEM	28
-
-#define INSN_MASK_WFI		0xffffffff
-#define INSN_MATCH_WFI		0x10500073
-
-#define INSN_MASK_WRS		0xffffffff
-#define INSN_MATCH_WRS		0x00d00073
-
-#define INSN_MATCH_CSRRW	0x1073
-#define INSN_MASK_CSRRW		0x707f
-#define INSN_MATCH_CSRRS	0x2073
-#define INSN_MASK_CSRRS		0x707f
-#define INSN_MATCH_CSRRC	0x3073
-#define INSN_MASK_CSRRC		0x707f
-#define INSN_MATCH_CSRRWI	0x5073
-#define INSN_MASK_CSRRWI	0x707f
-#define INSN_MATCH_CSRRSI	0x6073
-#define INSN_MASK_CSRRSI	0x707f
-#define INSN_MATCH_CSRRCI	0x7073
-#define INSN_MASK_CSRRCI	0x707f
-
-#define INSN_MATCH_LB		0x3
-#define INSN_MASK_LB		0x707f
-#define INSN_MATCH_LH		0x1003
-#define INSN_MASK_LH		0x707f
-#define INSN_MATCH_LW		0x2003
-#define INSN_MASK_LW		0x707f
-#define INSN_MATCH_LD		0x3003
-#define INSN_MASK_LD		0x707f
-#define INSN_MATCH_LBU		0x4003
-#define INSN_MASK_LBU		0x707f
-#define INSN_MATCH_LHU		0x5003
-#define INSN_MASK_LHU		0x707f
-#define INSN_MATCH_LWU		0x6003
-#define INSN_MASK_LWU		0x707f
-#define INSN_MATCH_SB		0x23
-#define INSN_MASK_SB		0x707f
-#define INSN_MATCH_SH		0x1023
-#define INSN_MASK_SH		0x707f
-#define INSN_MATCH_SW		0x2023
-#define INSN_MASK_SW		0x707f
-#define INSN_MATCH_SD		0x3023
-#define INSN_MASK_SD		0x707f
-
-#define INSN_MATCH_C_LD		0x6000
-#define INSN_MASK_C_LD		0xe003
-#define INSN_MATCH_C_SD		0xe000
-#define INSN_MASK_C_SD		0xe003
-#define INSN_MATCH_C_LW		0x4000
-#define INSN_MASK_C_LW		0xe003
-#define INSN_MATCH_C_SW		0xc000
-#define INSN_MASK_C_SW		0xe003
-#define INSN_MATCH_C_LDSP	0x6002
-#define INSN_MASK_C_LDSP	0xe003
-#define INSN_MATCH_C_SDSP	0xe002
-#define INSN_MASK_C_SDSP	0xe003
-#define INSN_MATCH_C_LWSP	0x4002
-#define INSN_MASK_C_LWSP	0xe003
-#define INSN_MATCH_C_SWSP	0xc002
-#define INSN_MASK_C_SWSP	0xe003
-
-#define INSN_16BIT_MASK		0x3
-
-#define INSN_IS_16BIT(insn)	(((insn) & INSN_16BIT_MASK) != INSN_16BIT_MASK)
-
-#define INSN_LEN(insn)		(INSN_IS_16BIT(insn) ? 2 : 4)
-
-#ifdef CONFIG_64BIT
-#define LOG_REGBYTES		3
-#else
-#define LOG_REGBYTES		2
-#endif
-#define REGBYTES		(1 << LOG_REGBYTES)
-
-#define SH_RD			7
-#define SH_RS1			15
-#define SH_RS2			20
-#define SH_RS2C			2
-#define MASK_RX			0x1f
-
-#define RVC_LW_IMM(x)		((RV_X(x, 6, 1) << 2) | \
-				 (RV_X(x, 10, 3) << 3) | \
-				 (RV_X(x, 5, 1) << 6))
-#define RVC_LD_IMM(x)		((RV_X(x, 10, 3) << 3) | \
-				 (RV_X(x, 5, 2) << 6))
-#define RVC_LWSP_IMM(x)		((RV_X(x, 4, 3) << 2) | \
-				 (RV_X(x, 12, 1) << 5) | \
-				 (RV_X(x, 2, 2) << 6))
-#define RVC_LDSP_IMM(x)		((RV_X(x, 5, 2) << 3) | \
-				 (RV_X(x, 12, 1) << 5) | \
-				 (RV_X(x, 2, 3) << 6))
-#define RVC_SWSP_IMM(x)		((RV_X(x, 9, 4) << 2) | \
-				 (RV_X(x, 7, 2) << 6))
-#define RVC_SDSP_IMM(x)		((RV_X(x, 10, 3) << 3) | \
-				 (RV_X(x, 7, 3) << 6))
-#define RVC_RS1S(insn)		(8 + RV_X(insn, SH_RD, 3))
-#define RVC_RS2S(insn)		(8 + RV_X(insn, SH_RS2C, 3))
-#define RVC_RS2(insn)		RV_X(insn, SH_RS2C, 5)
-
-#define SHIFT_RIGHT(x, y)		\
-	((y) < 0 ? ((x) << -(y)) : ((x) >> (y)))
-
-#define REG_MASK			\
-	((1 << (5 + LOG_REGBYTES)) - (1 << LOG_REGBYTES))
-
-#define REG_OFFSET(insn, pos)		\
-	(SHIFT_RIGHT((insn), (pos) - LOG_REGBYTES) & REG_MASK)
-
-#define REG_PTR(insn, pos, regs)	\
-	((ulong *)((ulong)(regs) + REG_OFFSET(insn, pos)))
-
-#define GET_FUNCT3(insn)	(((insn) >> 12) & 7)
-
-#define GET_RS1(insn, regs)	(*REG_PTR(insn, SH_RS1, regs))
-#define GET_RS2(insn, regs)	(*REG_PTR(insn, SH_RS2, regs))
-#define GET_RS1S(insn, regs)	(*REG_PTR(RVC_RS1S(insn), 0, regs))
-#define GET_RS2S(insn, regs)	(*REG_PTR(RVC_RS2S(insn), 0, regs))
-#define GET_RS2C(insn, regs)	(*REG_PTR(insn, SH_RS2C, regs))
-#define GET_SP(regs)		(*REG_PTR(2, 0, regs))
-#define SET_RD(insn, regs, val)	(*REG_PTR(insn, SH_RD, regs) = (val))
-#define IMM_I(insn)		((s32)(insn) >> 20)
-#define IMM_S(insn)		(((s32)(insn) >> 25 << 5) | \
-				 (s32)(((insn) >> 7) & 0x1f))
-
 struct insn_func {
 	unsigned long mask;
 	unsigned long match;
-- 
2.39.2

