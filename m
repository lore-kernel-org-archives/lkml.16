Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D5722D4DA
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 09:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747215543; cv=none; b=VkO7I5fwkbDPIm05nnmEf6q2eTiGpqfcr/CIgHPf3uSVQHPsXea7g4H2f+ik/yE7Jv+cFLS6pfR+oC3JPvMWmUjZJzue0KCXBJVpfjY/E9nA8TdDxDO5Wa25Lo8IhXGUeWu0h3X0l8BKTpfbRH5cFEw2UwlqQnSgdQuphBas0GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747215543; c=relaxed/simple;
	bh=r5hPhpC1GQ6SEgltegt9K/1SJ5+8vaXWcQjlQm5YELc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Y1RUDLFjHH0mIzrDD9zj8RCF8101Oj9kbzvu2l4kkd9K4RTy1Ey/+opwA44gf3rg60sZO558M+9Y0NkrKCoHp26U2PSbtv32oFwY/G/jlGdC/YmZ++zt+zueXEpb6S7DdH+1x9T6QyZGOoxmfyUWoMMZ77dOKR/qznBmQVg1SBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=NG6681rr; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=CkBVkwXf; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="NG6681rr";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="CkBVkwXf"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747215540;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KXzuHHlv6vCMZTxsn57Dyo4HmF+FRIx0y/mPLwDhWDc=;
	b=NG6681rr3N6qsdJvQl8R0k8Cxji29Zvu6cMLF5+HemAByizo6iFP5p59IsPg1tjnQf2Byy
	dI8m3wTM8iYbHKpssw/5neDMZIdXZI7MJHrqACe1HVGqgp91t82yLKc0smlZW6Ax+STRo9
	cy5XAwokypHhHeokqY8A+xAqNYjtZ43TU3qcVG0a/B9YkOe2ULwaJJlso0lPeUkcdvfRL0
	ZlWiWSXu/pL5tLR4gqSVjU8WPupjBW5K+10WAtBW/cudGQmAtpk6+XFe9tS0gvqmbOleo3
	VNiwCg6NE92RjR5MJfUbx8XrdRClmOs3JAkf6VJEaMLwiBSy98h1H7doLwpXhA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747215540;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KXzuHHlv6vCMZTxsn57Dyo4HmF+FRIx0y/mPLwDhWDc=;
	b=CkBVkwXfZ408sLldQe42mDAtMW4btZ/H0/yh2VHbMOiRmnwGu5fCKGBwrjvcTpGgbk08RO
	+xRPFdd4M8pZfHCA==
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v2 08/11] riscv: kprobes: Remove duplication of RVC_EXTRACT_BTYPE_IMM
Date: Wed, 14 May 2025 11:38:47 +0200
Message-Id: <8a8ed970f279fa5f24c90d840c2130e37bc6d16e.1747215274.git.namcao@linutronix.de>
In-Reply-To: <cover.1747215274.git.namcao@linutronix.de>
References: <cover.1747215274.git.namcao@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Use RVC_EXTRACT_BTYPE_IMM, instead of reimplementing it in
simulate_c_bnez_beqz().

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 arch/riscv/kernel/probes/simulate-insn.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/kernel/probes/simulate-insn.c b/arch/riscv/kernel/p=
robes/simulate-insn.c
index f5d64613dab5..e670e55954d2 100644
--- a/arch/riscv/kernel/probes/simulate-insn.c
+++ b/arch/riscv/kernel/probes/simulate-insn.c
@@ -232,16 +232,10 @@ static bool __kprobes simulate_c_bnez_beqz(u32 opcode=
, unsigned long addr, struc
 	if (!rv_insn_reg_get_val(regs, rs1, &rs1_val))
 		return false;
=20
-	if ((rs1_val !=3D 0 && is_bnez) || (rs1_val =3D=3D 0 && !is_bnez)) {
-		offset =3D  ((opcode >> 3)  & 0x3) << 1;
-		offset |=3D ((opcode >> 10) & 0x3) << 3;
-		offset |=3D ((opcode >> 2)  & 0x1) << 5;
-		offset |=3D ((opcode >> 5)  & 0x3) << 6;
-		offset |=3D ((opcode >> 12) & 0x1) << 8;
-		offset =3D sign_extend32(offset, 8);
-	} else {
+	if ((rs1_val !=3D 0 && is_bnez) || (rs1_val =3D=3D 0 && !is_bnez))
+		offset =3D RVC_EXTRACT_BTYPE_IMM(opcode);
+	else
 		offset =3D 2;
-	}
=20
 	instruction_pointer_set(regs, addr + offset);
=20
--=20
2.39.5

