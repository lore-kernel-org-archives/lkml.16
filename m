Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444BF22AE6B
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 09:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747215540; cv=none; b=fEm55o7oMPxSoCgKhXDzAzbbUDQtFOwXJKGXr8ySs+ztEK+p6YGQGlsPQoHY1NWzTxSymOFT9T1yp2lT35NU5z11zqmyScYKRi57bqUZ/3Zj+q5gpZDJsV3tnp2AdkCcEsUxkybExRVgUqdfhF0pzsNAWH65116/eC+eZPdgOxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747215540; c=relaxed/simple;
	bh=hjvascFnyqhoz+kSc+/5iaVSkW01jdwzHyYmEuvun40=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gNDgPCdQhCQiBOAvN861CKhJucJMUH4PnoWvi2Z4ekplsU2qYBVComzELDlvnRr/brq7xp5n2IE8OFEHGDsD9+u46+eFWFPIoUa6KSwTYLn7yCnuidAnIiNFbRl8PAuiG07xr5mchCmq6Nsd2GYldjfgHTM5YAbLijzCJ/cE8aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=oEsrci97; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=H6se27k+; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="oEsrci97";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="H6se27k+"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747215537;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DmkEGbAndeVtTbYn7tYJisQDekeRo3+P4y3HvGXWKIM=;
	b=oEsrci97PKBvmdtdmHuqf7heP96ZSnfAv/FhNq1ZSZ2osSholKRJ8B67leodBEv54EP68f
	BmXPWDhMs6q8tsxFsdp8WQCqkYsqYXnQMrTEXjnGMyixJ7kOCVSW28fFHdCH1TOFjaGw3g
	EHE1/F/MskzjUlf+A/14eV5gY0bvk+37yRtG6r69mt+h1ry6IY9epMmyvKWkZkm5D58CpG
	WIGqAKasps2aPe8I6N4MqCgDmegA2NxysGtaeg+lKRUFMG25ZAUHv+VKh36oFcjgDubwWc
	ubW2J0fhDN2fGqdytLHnTUL2M9zcSLIjHWJfnLBMXgeIritrmluIrWwu7ROJbA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747215537;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DmkEGbAndeVtTbYn7tYJisQDekeRo3+P4y3HvGXWKIM=;
	b=H6se27k+mkC0UIQE18mLREaCc8vwNjoFyKRTm+Xxq25ozHqVReL/PM+l6y23QlAm+S4Kd/
	JFWvwQErrw9+kCBg==
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v2 02/11] riscv: kprobes: Move branch_funct3 to insn.h
Date: Wed, 14 May 2025 11:38:41 +0200
Message-Id: <200c29a26338f19d09963fa02562787e8cfa06f2.1747215274.git.namcao@linutronix.de>
In-Reply-To: <cover.1747215274.git.namcao@linutronix.de>
References: <cover.1747215274.git.namcao@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Similar to other instruction-processing macros/functions, branch_funct3
should be in insn.h.

Move it into insn.h as RV_EXTRACT_FUNCT3. This new name matches the style
in insn.h.

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 arch/riscv/include/asm/insn.h            | 4 ++++
 arch/riscv/kernel/probes/simulate-insn.c | 5 +----
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
index 4a26cef3b5c0..ca9628c61885 100644
--- a/arch/riscv/include/asm/insn.h
+++ b/arch/riscv/include/asm/insn.h
@@ -447,6 +447,10 @@ static __always_inline bool riscv_insn_is_c_jalr(u32 c=
ode)
 #define RVC_RS2(insn)		RV_X(insn, SH_RS2C, 5)
 #define RVC_X(X, s, mask)	RV_X_mask(X, s, mask)
=20
+#define RV_EXTRACT_FUNCT3(x) \
+	({typeof(x) x_ =3D (x); \
+	(RV_X_mask(x_, RV_INSN_FUNCT3_OPOFF, RV_INSN_FUNCT3_MASK >> RV_INSN_FUNCT=
3_OPOFF)); })
+
 #define RV_EXTRACT_RS1_REG(x) \
 	({typeof(x) x_ =3D (x); \
 	(RV_X_mask(x_, RVG_RS1_OPOFF, RVG_RS1_MASK)); })
diff --git a/arch/riscv/kernel/probes/simulate-insn.c b/arch/riscv/kernel/p=
robes/simulate-insn.c
index 77be381bb8b4..d5f74fadbc3a 100644
--- a/arch/riscv/kernel/probes/simulate-insn.c
+++ b/arch/riscv/kernel/probes/simulate-insn.c
@@ -121,9 +121,6 @@ bool __kprobes simulate_auipc(u32 opcode, unsigned long=
 addr, struct pt_regs *re
 #define branch_rs1_idx(opcode) \
 	(((opcode) >> 15) & 0x1f)
=20
-#define branch_funct3(opcode) \
-	(((opcode) >> 12) & 0x7)
-
 #define branch_imm(opcode) \
 	(((((opcode) >>  8) & 0xf ) <<  1) | \
 	 ((((opcode) >> 25) & 0x3f) <<  5) | \
@@ -158,7 +155,7 @@ bool __kprobes simulate_branch(u32 opcode, unsigned lon=
g addr, struct pt_regs *r
 		return false;
=20
 	offset_tmp =3D branch_offset(opcode);
-	switch (branch_funct3(opcode)) {
+	switch (RV_EXTRACT_FUNCT3(opcode)) {
 	case RVG_FUNCT3_BEQ:
 		offset =3D (rs1_val =3D=3D rs2_val) ? offset_tmp : 4;
 		break;
--=20
2.39.5

