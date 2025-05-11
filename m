Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4BD18E050
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 21:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746998293; cv=none; b=Lk73jGED4QUnoi6zw4b0iz2wLQz6lU6VQJMu44nNuHk1kHShuw/QeqDomnzhVzeFA/Vk64V0wzCqzx2+Gku8gjWmQNnTTvRMe0StnEMGzfRskD1CUZipvwtB7Bxk0bufNcfEwKq3udGuRB4MHWnLANeaxnlaeZTsZv6twHNw/jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746998293; c=relaxed/simple;
	bh=mNT5Bq+QZxOSTBdgVRIYyBAGQoBjIS3WObapx8ALvzI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Pxm+XKkTYqh8+NszLVSwUaMIPH3xTycqz6eXHQUtSbQ+aw7RxwBKQ1MP+QMP2kmeixs32ut1UXKTyl9qnWnsxNyDw8SJy2jlmB0HAgeDGtsVMLoeAHJjWoP8HFsCRsmpSbdCQbBKS5WgXCLhos/S1vOZ3wloarivvOvCth3SK+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=mmcyJI9F; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Pl7w8vku; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="mmcyJI9F";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Pl7w8vku"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746998290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cxxjh0b5jumKoKypnaWi9zZMzSNoHhSBLqb0wOUfsZM=;
	b=mmcyJI9Fd+mOyzbsckx1w2mioDoRsrF0PpkrTiXA1dRBc1zyMH1djc/h3AysVv49tHMDzT
	PaK1pjydlNl1t7xHQkeeoo2vR0nKlZInRO5rD5b33axd07HPRoR9BA+ljCior3p+0kOiWU
	Wcz5RrMe8CrUKFk2sp80jZuj7dnXUTCYd7NIIE5239Mk0EW3mKw8ntMj3O+fu4qkevAx10
	rZx7TLvpfK0Ls7l1yQzHpoDhltfhcwcmpJKUKJSmlj/ByAWlfDSuYgrVneKSoTVIM7knnt
	v1eu5v5GSu6Jd+hCVDDfCfUffuK8bN7oDHnWAJqAKHBTQA2l8s8c95wsjuVs1g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746998290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cxxjh0b5jumKoKypnaWi9zZMzSNoHhSBLqb0wOUfsZM=;
	b=Pl7w8vkujNyPkohfv2Sf83rZWH+JUDJYZ4cpoMV2OdNODA9n5AWEoHqsC2+kKfzlEmcOFL
	zfhC4y5wi1huzYAw==
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH 02/11] riscv: kprobes: Move branch_funct3 to insn.h
Date: Sun, 11 May 2025 23:17:54 +0200
Message-Id: <71c57502962d8b2663fd2fb74738374e1ead740d.1746997351.git.namcao@linutronix.de>
In-Reply-To: <cover.1746997351.git.namcao@linutronix.de>
References: <cover.1746997351.git.namcao@linutronix.de>
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

Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 arch/riscv/include/asm/insn.h            | 4 ++++
 arch/riscv/kernel/probes/simulate-insn.c | 5 +----
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
index debac13a3476..80901b36fd22 100644
--- a/arch/riscv/include/asm/insn.h
+++ b/arch/riscv/include/asm/insn.h
@@ -292,6 +292,10 @@ static __always_inline bool riscv_insn_is_c_jalr(u32 c=
ode)
 #define RV_X(X, s, mask)  (((X) >> (s)) & (mask))
 #define RVC_X(X, s, mask) RV_X(X, s, mask)
=20
+#define RV_EXTRACT_FUNCT3(x) \
+	({typeof(x) x_ =3D (x); \
+	(RV_X(x_, RV_INSN_FUNCT3_OPOFF, RV_INSN_FUNCT3_MASK >> RV_INSN_FUNCT3_OPO=
FF)); })
+
 #define RV_EXTRACT_RS1_REG(x) \
 	({typeof(x) x_ =3D (x); \
 	(RV_X(x_, RVG_RS1_OPOFF, RVG_RS1_MASK)); })
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

