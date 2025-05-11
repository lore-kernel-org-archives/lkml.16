Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6C62641FB
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 21:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746998296; cv=none; b=l2+MzcMbEblb3yAb/i66pSLDcC18jvwvJlfsAwySw1pyedx6AZ+zoB5IWimeYkx88uR5ZOiAcPlBOURz6dSNamqzB1wl2YjEQFrXcSMzQEJBu1yD18lvpZ+1qZ6S6tBcJRKlFEgl0TnZJCTbaRffrPlXE02zNDw4k/Q7ibmizqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746998296; c=relaxed/simple;
	bh=mnvYMX5AgX/+YGXJjtOtVwrFHsHIWxFK98GYj03OCUY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cG5zEmtfqM9Rfwq7Yn+BXI0AdqgLvXI2zFDKTGCAVzO1LDd97utJjzbXxXBs7AwQXq6SULvEwjPLdwFzVqVS9psSj1tjt0Ne7dwqcaA7Q6fstYXHKMlAe5Y4rMxmX+v2HV+5tNLBKJ4BBTmCkLmVyPoE6txMx1X5XL4Nk2wrY5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=iv0xgamO; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=wEzs5iLY; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="iv0xgamO";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="wEzs5iLY"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746998292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s4YToDIER8H6nwFDI0QIaa0HWbI2B/uQuBCnhyXETH8=;
	b=iv0xgamOdlWgoRLYIquiePlF1sRtPhuhM8ks2maPBrgysF+5o7bViA516VlTG5u7f29QLl
	QWpKziOIyYHPU1V8iu/XCSmwd9lYAY6zvJ8VX6VAdMIlcRwXvJjR1Ycgb/IB/FfOme0aVu
	SWnHiJp6xBg4s9qrzXyyC+IuN3HMKUP/h6mfnbe9okvVPo01X/0A3raLzLAYOjn7zWTdWP
	DXkvQ1fWUIn6aCtWI+EKEb1KCkhnPEy/FKfTcUud+htZEyF2OVg9EDWPUBhLPGMOpVZo5O
	jRahUpdr/Dm7/FW6QkzWTr0XVRBuzj0Y6iL65LBQVjtE/qHy9Vz1htqUO9jkdg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746998292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s4YToDIER8H6nwFDI0QIaa0HWbI2B/uQuBCnhyXETH8=;
	b=wEzs5iLYHFw2oTfS/sZ/KT/gPE2ygLqG1lQ6V3ParOCPIp9HVi3ZN0sjeUa+BLCtapVBub
	Z4E+KEN1lp+JtlDA==
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH 10/11] riscv: kprobes: Remove duplication of RV_EXTRACT_UTYPE_IMM
Date: Sun, 11 May 2025 23:18:02 +0200
Message-Id: <e1e26af7130aa39ce4c8c99e50038273fa32a1ee.1746997351.git.namcao@linutronix.de>
In-Reply-To: <cover.1746997351.git.namcao@linutronix.de>
References: <cover.1746997351.git.namcao@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Use RV_EXTRACT_UTYPE_IMM, instead of reimplementing it in simulate_auipc().

Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 arch/riscv/kernel/probes/simulate-insn.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/arch/riscv/kernel/probes/simulate-insn.c b/arch/riscv/kernel/p=
robes/simulate-insn.c
index 1717df780409..2b3cd69d6f8e 100644
--- a/arch/riscv/kernel/probes/simulate-insn.c
+++ b/arch/riscv/kernel/probes/simulate-insn.c
@@ -81,17 +81,6 @@ bool __kprobes simulate_jalr(u32 opcode, unsigned long a=
ddr, struct pt_regs *reg
 	return ret;
 }
=20
-#define auipc_imm(opcode) \
-	((((opcode) >> 12) & 0xfffff) << 12)
-
-#if __riscv_xlen =3D=3D 64
-#define auipc_offset(opcode)	sign_extend64(auipc_imm(opcode), 31)
-#elif __riscv_xlen =3D=3D 32
-#define auipc_offset(opcode)	auipc_imm(opcode)
-#else
-#error "Unexpected __riscv_xlen"
-#endif
-
 bool __kprobes simulate_auipc(u32 opcode, unsigned long addr, struct pt_re=
gs *regs)
 {
 	/*
@@ -102,7 +91,7 @@ bool __kprobes simulate_auipc(u32 opcode, unsigned long =
addr, struct pt_regs *re
 	 */
=20
 	u32 rd_idx =3D RV_EXTRACT_RD_REG(opcode);
-	unsigned long rd_val =3D addr + auipc_offset(opcode);
+	unsigned long rd_val =3D addr + (s32)RV_EXTRACT_UTYPE_IMM(opcode);
=20
 	if (!rv_insn_reg_set_val(regs, rd_idx, rd_val))
 		return false;
--=20
2.39.5

