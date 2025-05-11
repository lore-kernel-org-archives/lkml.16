Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD0F19C578
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 21:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746998294; cv=none; b=f40IWVGK4/rg+O7vVWWhMA/O/HSDXNtyrgBqdNdczZA266jwOq9JdA/6A1mIkqyBAFiS7L0Ngscn5gSAPMNPlOY0iPDGwRIiJxE3PBxaueiiDa53vUfixTLBSufIQzSnkY4KC2fzc8LcnFvK7YA3FyHXg7mG/vTiMCHiBwP1ZzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746998294; c=relaxed/simple;
	bh=7m/qqnL0PAK7Y0tfHeOZaCUGqWyUTDJAqIsQ4KnxLb0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=i7GWixBEb2VL1BxBvZj0lKCYLBP/TprJ3jLbW+UgEiYadvT51wRUA/C7qhwojjgKo94M1NbVNlNQ9VbP63lxg8jH2yKQrno6cJFV5kjqFeRrKmx9l8Pcupa4HaX1wcr8cmJhjaR1YKv+QP5r06vgz0SDGu9+la89lIMc2WfDDQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=VOmvd4Ek; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=uOOI5eog; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="VOmvd4Ek";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="uOOI5eog"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746998290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GsddRiOpi8XPygRa69KJPJp3ShvkCz7BnK7OzU9yZH0=;
	b=VOmvd4EkuOEEmkpZTBoebEM+0zppjg1sQy6OS4LIJ94ImG1Mhzv0n1cs+fMPsOM8OSLuRx
	SxkR0vxY6z9x6hh7BVIJwrNq2SbnNvJWpu3LpBndS36oCTzlek94Ao+J3MrpGwRNYqhPxd
	60W+RSTl8Kg+fgSps9gWUTv9QrIT44cn91//RkZsXR67Le0sebQQFZpv3US5WrWeIF0rnW
	jp9YbpLhDjvtPQXZqFdUra2Mb+ekO8eulfSxeekeDqOZ1MxVVEwptIyKEAiIPPGH58rzzM
	Gphc3KIE3LFzJM3/FT8AWsTKlTuqKH+7LlJqCmRGsI1X6qAIp+pUcJGsyCnTaA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746998290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GsddRiOpi8XPygRa69KJPJp3ShvkCz7BnK7OzU9yZH0=;
	b=uOOI5eogQWrO2bwxjPHhV6QHYKorOMnN8McHcLSSYB1FBZWgQ7nYW1RiHrEJZWwb6yqBjB
	GFIkJxMH3UyP5dDQ==
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH 03/11] riscv: kprobes: Remove duplication of RV_EXTRACT_JTYPE_IMM
Date: Sun, 11 May 2025 23:17:55 +0200
Message-Id: <10dd59c17c7c6f4700d92f988292ee3bdcaad71b.1746997351.git.namcao@linutronix.de>
In-Reply-To: <cover.1746997351.git.namcao@linutronix.de>
References: <cover.1746997351.git.namcao@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Use RV_EXTRACT_JTYPE_IMM, instead of reimplementing it in simulate_jal().

Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 arch/riscv/kernel/probes/simulate-insn.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/kernel/probes/simulate-insn.c b/arch/riscv/kernel/p=
robes/simulate-insn.c
index d5f74fadbc3a..b76a691d0d9a 100644
--- a/arch/riscv/kernel/probes/simulate-insn.c
+++ b/arch/riscv/kernel/probes/simulate-insn.c
@@ -41,19 +41,16 @@ bool __kprobes simulate_jal(u32 opcode, unsigned long a=
ddr, struct pt_regs *regs
 	 *     1         10          1           8       5    JAL/J
 	 */
 	bool ret;
-	u32 imm;
+	s32 imm;
 	u32 index =3D (opcode >> 7) & 0x1f;
=20
 	ret =3D rv_insn_reg_set_val(regs, index, addr + 4);
 	if (!ret)
 		return ret;
=20
-	imm  =3D ((opcode >> 21) & 0x3ff) << 1;
-	imm |=3D ((opcode >> 20) & 0x1)   << 11;
-	imm |=3D ((opcode >> 12) & 0xff)  << 12;
-	imm |=3D ((opcode >> 31) & 0x1)   << 20;
+	imm =3D RV_EXTRACT_JTYPE_IMM(opcode);
=20
-	instruction_pointer_set(regs, addr + sign_extend32((imm), 20));
+	instruction_pointer_set(regs, addr + imm);
=20
 	return ret;
 }
--=20
2.39.5

