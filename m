Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DCB61917F9
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 21:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746998294; cv=none; b=mnsOTAR39E0C5Baty0HoP8Z0F5FzwfrNcAnN+z5MjsfvyIw3S1OqCY2pPSHIN8mvvkdUJ5Z+/XZ/puOILSD3GOgozNMZ9Fsioj7h0V4iziQ+7myFrn3luI0nZ3xcdxBKguMBpktzvhjVfJampVasuTFPJVlSkj15MzfNMb+QGD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746998294; c=relaxed/simple;
	bh=bCd4WxovOxu6jIn0P0BMOxj7qEYqaxkyzqHS+tdq100=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gOn03ssXa2iTOxM7hQM4UZ61RP0dOsAkAlxfWllItwzp/VGROa56jXkkAiTwnexCsZiht1bnaEiIpdJa7Kb+1oWjwzjwswxyEUWtyOyhdiOtff/DBhn3ujNyV4/54UBnIbio6oFXtESkZmr1VHS8/gDQRe4n6IsXT3w2dDypFss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=C8n56BwQ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Wx2X3fXd; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="C8n56BwQ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Wx2X3fXd"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746998290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B+ZSGPGR1f44374iB4VtgRiL39ZDvHo9xWVozgwsi6A=;
	b=C8n56BwQkdOcM2T/ujlGMwbhhVjja4cdRNIJfbUNpfxyeTVhV7ZOg/LkrrEziEznjuPdbn
	mZV43gA1D/Y7+oVN6nsJcBm57XJDOWzYKBYrUbRI5ncqZj/AHnzr3S636va3MvkvgsGoqx
	wbBxy4dksn8Qe/gRhd5C8EBcUJergrCEVn6wxcQrsoCD59GkVIEMR/MMzJNZItYrOatuug
	zD//vHfFb7mHmEFpcuT2HhVt82IuKYKZ/220+lKpx+8u1c8Wh74JjRD3/TAU0DN40XokFW
	tkXIJX7gNN7sk6ULQhUhJrMluereYg4fQl/SLdiffvaP5mwzSAES5r7uhc4Vjw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746998290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B+ZSGPGR1f44374iB4VtgRiL39ZDvHo9xWVozgwsi6A=;
	b=Wx2X3fXdRGH2Qz8zFXmmXNC9GnAg+b6EZ282vCoOxESZxHB5AyUlLSjYaK3HbaG+UQG/mU
	5lKB7hbXt9P0KxCQ==
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH 04/11] riscv: kprobes: Remove duplication of RV_EXTRACT_RS1_REG
Date: Sun, 11 May 2025 23:17:56 +0200
Message-Id: <0b74924c188537b7834c9aa98aeab7c4d76dee0b.1746997351.git.namcao@linutronix.de>
In-Reply-To: <cover.1746997351.git.namcao@linutronix.de>
References: <cover.1746997351.git.namcao@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Use RV_EXTRACT_RS1_REG instead of reimplementing its code.

Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 arch/riscv/kernel/probes/simulate-insn.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/kernel/probes/simulate-insn.c b/arch/riscv/kernel/p=
robes/simulate-insn.c
index b76a691d0d9a..625d514c4ada 100644
--- a/arch/riscv/kernel/probes/simulate-insn.c
+++ b/arch/riscv/kernel/probes/simulate-insn.c
@@ -66,7 +66,7 @@ bool __kprobes simulate_jalr(u32 opcode, unsigned long ad=
dr, struct pt_regs *reg
 	unsigned long base_addr;
 	u32 imm =3D (opcode >> 20) & 0xfff;
 	u32 rd_index =3D (opcode >> 7) & 0x1f;
-	u32 rs1_index =3D (opcode >> 15) & 0x1f;
+	u32 rs1_index =3D RV_EXTRACT_RS1_REG(opcode);
=20
 	ret =3D rv_insn_reg_get_val(regs, rs1_index, &base_addr);
 	if (!ret)
@@ -115,9 +115,6 @@ bool __kprobes simulate_auipc(u32 opcode, unsigned long=
 addr, struct pt_regs *re
 	return true;
 }
=20
-#define branch_rs1_idx(opcode) \
-	(((opcode) >> 15) & 0x1f)
-
 #define branch_imm(opcode) \
 	(((((opcode) >>  8) & 0xf ) <<  1) | \
 	 ((((opcode) >> 25) & 0x3f) <<  5) | \
@@ -147,7 +144,7 @@ bool __kprobes simulate_branch(u32 opcode, unsigned lon=
g addr, struct pt_regs *r
 	unsigned long rs1_val;
 	unsigned long rs2_val;
=20
-	if (!rv_insn_reg_get_val(regs, branch_rs1_idx(opcode), &rs1_val) ||
+	if (!rv_insn_reg_get_val(regs, RV_EXTRACT_RS1_REG(opcode), &rs1_val) ||
 	    !rv_insn_reg_get_val(regs, RV_EXTRACT_RS2_REG(opcode), &rs2_val))
 		return false;
=20
--=20
2.39.5

