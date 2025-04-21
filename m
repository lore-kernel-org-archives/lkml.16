Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F7419CD1D
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 14:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745245589; cv=none; b=llyA/6VzKxky7KERMpw469/sbj98B3Nj+AOJ3Pths8TO0yeGiRekpBvlYXYKq6kYpIydh0TyrWaoTrSflOcKLvRt+m0pOq6v9GcAqXyD13z+ZzMrWa0i7j/2OVGpXeZcSvKL10brAz006aaeJWDqu31hXxTGpqKmF8bMB63jaZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745245589; c=relaxed/simple;
	bh=Utwokb7er4q5JknyfiZW2i0dXjwbYWTz3mwbW9uIn3o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=d1w3Uu3IXBb6ora9FHPflgeOgD/sgyZT3ds73wJ/94o4o7QaSYR98xpHkoiNG7zbACannX33/lfs7ze1+eu2BSXrLrLu0IyJep/vvE+1ErtQBOOku2Xx822SWM2sxrTaDOxI8NwWfCcUzWfRtNRfNfVJwzEx8dNUaKh6Su8ueB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=hzrHaTIQ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="hzrHaTIQ"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso33658835e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 07:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745245585; x=1745850385; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r8EzXGFQbwSP2O8EyG3ctzvPoUfJEY6y+SbPIPc5xJE=;
        b=hzrHaTIQvtTYKqt0N6zcmzNroJcC3zz0wH3fo/vYL9bxk8MVj/2NiMYwJhEzd4wIei
         mfUV1xQ5MCpyvYssCRNZEu9G7BTL9+ksE2vDjZI+U7iLfTOMy0+25FqtAon0DbHCtmIK
         pOiOfFfY76yYaHajyL4w71IGfs4QpWT3nhHlZAJNENl5qGm5piDtAATY3/48dEPolA/l
         +CHxYTOc2C/WHwrxwqjO7zSlDxAmGBBaxTVU5wIIOQEdjiiTs3cpJo8xXQKV6MlJzA0p
         RXm0VySbnY9kjzTOnpgbTV0iIORX1QmQJ9qRGexnhT7ue7lc3icH5I5AuKvJOGKyubwx
         vwZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745245585; x=1745850385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r8EzXGFQbwSP2O8EyG3ctzvPoUfJEY6y+SbPIPc5xJE=;
        b=b/iYpkLFTf7/fH6PsVWpxkxZBYTjAwzlmbcH3vzYBSv8Wbt0DITD1CvjNRnnrLfsu/
         6Bw9M0Dfliiw5bzyWNc2fgLVTkvuFSsHAGWr1OAawKXE+1IZ3bdvvw5Avo+48cQ9KVUj
         7kYhHYSNUmwtULwLL0qgMqVOLqVvUm0786t70G/wZNyBIeBHo+gbFldfavCHHr0k28uH
         c1lngwnJeFrAhptNu5qEPsbTDc5BOsXnSzGUhaRDsdP1fCa4V0dO5xj3l/OoTtcAmJ2w
         0u8xe+imfA6fdrIZi1yjXvd3ZUAkBCKFQjRV5lMkAEgK5AyfTbEGHkCNiX2o4v1h1ZrT
         qadQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7B+DkUwBNTpy4P+mQcuHbWWhdlHyiZP0iQRAVwO9HpsJ35mTJyIMTKsFuw2OoHGWIV5gODP8na5AXk5Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0HCSf+4UoHGCxNSGoQgp1EZyApU+cDBpkgplpqL+0l8S19bNH
	8u4DzxGpGxWi/EGAebfIH8rm6y4vnksjtkQVsYktM+J3srCTuVR37EctcVAwDlg=
X-Gm-Gg: ASbGncsKFbi6jnoGpyn1XUhnwMbBua1vb9j/KD6xCdZaCg8oEud1tuxXpQTB/vXdRWo
	qFpjyar2AU9iHqlcsocooKF7XxRY72U22pTkLbZAqAmTEYoozYymxWsm6MRdH2N9lod2FoStCa9
	nvzjayatcAeloLAbv2v6HgcBjmYiC3k9l0g8O/16WVyd88ma2ZLDnQ3cIay9Nu3QC5bt4eosdep
	bruoKuYwqxLuit5fD8va34EqIUlS7tivhSD38ycm2agCBfCn0icsHrV+tUphTE7KazcvGXz7Fqk
	DDqCbGlN1EGpA/PBsXh/UfZdA939U5OinPnRxYqr7e+8EoN9r8DIwNZ9MhE=
X-Google-Smtp-Source: AGHT+IGbR8cH86R+FPRiB//fxh3ANX3cYxfoHYfa1pDXh1hmpUYRDkZBnNT8HxNX2o8g7qT41lDP+Q==
X-Received: by 2002:a05:600c:1e14:b0:43d:abd:ad0e with SMTP id 5b1f17b1804b1-4406aba617dmr115364515e9.18.1745245585543;
        Mon, 21 Apr 2025 07:26:25 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:3382:ef90:cd58:9e76:e88c:5cd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5a9ed9sm139610375e9.3.2025.04.21.07.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 07:26:25 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH v3 1/4] riscv: Introduce Zicbop instructions
Date: Mon, 21 Apr 2025 16:24:38 +0200
Message-Id: <20250421142441.395849-2-alexghiti@rivosinc.com>
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

The S-type instructions are first introduced and then used to define the
encoding of the Zicbop prefetching instructions.

Co-developed-by: Guo Ren <guoren@kernel.org>
Signed-off-by: Guo Ren <guoren@kernel.org>
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/insn-def.h | 60 +++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/riscv/include/asm/insn-def.h b/arch/riscv/include/asm/insn-def.h
index 71060a2f838e..02c92c1657d2 100644
--- a/arch/riscv/include/asm/insn-def.h
+++ b/arch/riscv/include/asm/insn-def.h
@@ -18,6 +18,13 @@
 #define INSN_I_RD_SHIFT			 7
 #define INSN_I_OPCODE_SHIFT		 0
 
+#define INSN_S_SIMM7_SHIFT		25
+#define INSN_S_RS2_SHIFT		20
+#define INSN_S_RS1_SHIFT		15
+#define INSN_S_FUNC3_SHIFT		12
+#define INSN_S_SIMM5_SHIFT		 7
+#define INSN_S_OPCODE_SHIFT		 0
+
 #ifdef __ASSEMBLY__
 
 #ifdef CONFIG_AS_HAS_INSN
@@ -30,6 +37,10 @@
 	.insn	i \opcode, \func3, \rd, \rs1, \simm12
 	.endm
 
+	.macro insn_s, opcode, func3, rs2, simm12, rs1
+	.insn	s \opcode, \func3, \rs2, \simm12(\rs1)
+	.endm
+
 #else
 
 #include <asm/gpr-num.h>
@@ -51,10 +62,20 @@
 		 (\simm12 << INSN_I_SIMM12_SHIFT))
 	.endm
 
+	.macro insn_s, opcode, func3, rs2, simm12, rs1
+	.4byte	((\opcode << INSN_S_OPCODE_SHIFT) |		\
+		 (\func3 << INSN_S_FUNC3_SHIFT) |		\
+		 (.L__gpr_num_\rs2 << INSN_S_RS2_SHIFT) |	\
+		 (.L__gpr_num_\rs1 << INSN_S_RS1_SHIFT) |	\
+		 ((\simm12 & 0x1f) << INSN_S_SIMM5_SHIFT) |	\
+		 (((\simm12 >> 5) & 0x7f) << INSN_S_SIMM7_SHIFT))
+	.endm
+
 #endif
 
 #define __INSN_R(...)	insn_r __VA_ARGS__
 #define __INSN_I(...)	insn_i __VA_ARGS__
+#define __INSN_S(...)	insn_s __VA_ARGS__
 
 #else /* ! __ASSEMBLY__ */
 
@@ -66,6 +87,9 @@
 #define __INSN_I(opcode, func3, rd, rs1, simm12)	\
 	".insn	i " opcode ", " func3 ", " rd ", " rs1 ", " simm12 "\n"
 
+#define __INSN_S(opcode, func3, rs2, simm12, rs1)	\
+	".insn	s " opcode ", " func3 ", " rs2 ", " simm12 "(" rs1 ")\n"
+
 #else
 
 #include <linux/stringify.h>
@@ -92,12 +116,26 @@
 "		 (\\simm12 << " __stringify(INSN_I_SIMM12_SHIFT) "))\n"	\
 "	.endm\n"
 
+#define DEFINE_INSN_S							\
+	__DEFINE_ASM_GPR_NUMS						\
+"	.macro insn_s, opcode, func3, rs2, simm12, rs1\n"		\
+"	.4byte	((\\opcode << " __stringify(INSN_S_OPCODE_SHIFT) ") |"	\
+"		 (\\func3 << " __stringify(INSN_S_FUNC3_SHIFT) ") |"	\
+"		 (.L__gpr_num_\\rs2 << " __stringify(INSN_S_RS2_SHIFT) ") |" \
+"		 (.L__gpr_num_\\rs1 << " __stringify(INSN_S_RS1_SHIFT) ") |" \
+"		 ((\\simm12 & 0x1f) << " __stringify(INSN_S_SIMM5_SHIFT) ") |" \
+"		 (((\\simm12 >> 5) & 0x7f) << " __stringify(INSN_S_SIMM7_SHIFT) "))\n" \
+"	.endm\n"
+
 #define UNDEFINE_INSN_R							\
 "	.purgem insn_r\n"
 
 #define UNDEFINE_INSN_I							\
 "	.purgem insn_i\n"
 
+#define UNDEFINE_INSN_S							\
+"	.purgem insn_s\n"
+
 #define __INSN_R(opcode, func3, func7, rd, rs1, rs2)			\
 	DEFINE_INSN_R							\
 	"insn_r " opcode ", " func3 ", " func7 ", " rd ", " rs1 ", " rs2 "\n" \
@@ -108,6 +146,11 @@
 	"insn_i " opcode ", " func3 ", " rd ", " rs1 ", " simm12 "\n" \
 	UNDEFINE_INSN_I
 
+#define __INSN_S(opcode, func3, rs2, simm12, rs1)			\
+	DEFINE_INSN_S							\
+	"insn_s " opcode ", " func3 ", " rs2 ", " simm12 ", " rs1 "\n"	\
+	UNDEFINE_INSN_S
+
 #endif
 
 #endif /* ! __ASSEMBLY__ */
@@ -120,6 +163,10 @@
 	__INSN_I(RV_##opcode, RV_##func3, RV_##rd,		\
 		 RV_##rs1, RV_##simm12)
 
+#define INSN_S(opcode, func3, rs2, simm12, rs1)			\
+	__INSN_S(RV_##opcode, RV_##func3, RV_##rs2,		\
+		 RV_##simm12, RV_##rs1)
+
 #define RV_OPCODE(v)		__ASM_STR(v)
 #define RV_FUNC3(v)		__ASM_STR(v)
 #define RV_FUNC7(v)		__ASM_STR(v)
@@ -133,6 +180,7 @@
 #define RV___RS2(v)		__RV_REG(v)
 
 #define RV_OPCODE_MISC_MEM	RV_OPCODE(15)
+#define RV_OPCODE_OP_IMM	RV_OPCODE(19)
 #define RV_OPCODE_SYSTEM	RV_OPCODE(115)
 
 #define HFENCE_VVMA(vaddr, asid)				\
@@ -196,6 +244,18 @@
 	INSN_I(OPCODE_MISC_MEM, FUNC3(2), __RD(0),		\
 	       RS1(base), SIMM12(4))
 
+#define PREFETCH_I(base, offset)				\
+	INSN_S(OPCODE_OP_IMM, FUNC3(6), __RS2(0),		\
+	       SIMM12((offset) & 0xfe0), RS1(base))
+
+#define PREFETCH_R(base, offset)				\
+	INSN_S(OPCODE_OP_IMM, FUNC3(6), __RS2(1),		\
+	       SIMM12((offset) & 0xfe0), RS1(base))
+
+#define PREFETCH_W(base, offset)				\
+	INSN_S(OPCODE_OP_IMM, FUNC3(6), __RS2(3),		\
+	       SIMM12((offset) & 0xfe0), RS1(base))
+
 #define RISCV_PAUSE	".4byte 0x100000f"
 #define ZAWRS_WRS_NTO	".4byte 0x00d00073"
 #define ZAWRS_WRS_STO	".4byte 0x01d00073"
-- 
2.39.2

