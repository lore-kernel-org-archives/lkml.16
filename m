Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC29261594
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 21:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746998295; cv=none; b=Kxe+u0qbqrYzFMN67Cg35abUzadoE1rppuzox59t61iGpPURxlngRGiuvkwrJPYR8ryuxkRSM6XdrFtNAmJkrToSX/XlloiTV/e4MrfeOpAVwdnympt6ep3miWJKv1BUS9ev2M3IiHJfGz2Mt/QTG35wA3+JyuvX2IGxNc5RmzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746998295; c=relaxed/simple;
	bh=STVmF42kLVmoDkOiA2IdeI9QL+pCOmCowxDQiKg+Mcw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HLL8A/rS1BxNcAbMP8bUn6x9ZcVd7CCngefKmVk7hwxXglYFAditZrLatEtCMGw50pZPhyesap4Rds/qiytNWHTlwyjgcMkvxZ/vwCxNMQyzHV7wIEcq6NIkpOxevwn0z9LIKDS76aef483Ql/njIqoycZ7aGQafVoR3qar1QLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=K9edcgy2; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=0wQUYP/7; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="K9edcgy2";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0wQUYP/7"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746998291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z1LlZOoLaS1B4vzBVZP0EbbDkdO6N0U0HywBnUrr4mA=;
	b=K9edcgy2AqS6myyr8osxsH/m4ft3ZfK51MHm6QBJV7NqlDms9fM2z2UCCcKLKCI0+/4wRR
	KL8TlSzPZlrkJlvVqo52dKnNGx2VoRI4l6t/43jUe4PWqq/WIHt6tsA1dQe6ZDW4Zy4IW4
	f7WnEsCZjeb808ODmTUKjUBkHV56wf/HFLSwoQu0qS0ufGAMWp6bdRLliKeZe3tT30Bi8n
	bOaFEeqq/QWWn+aUNqNwwJCrXg4AbOuzVVxBW9kBVg8r2J4WrZnU+UtjS52tigmxAO+eNH
	MmWz9p9MlswKCwLm+wsklKs3bGBO5+4WpaXWp9K/7RMh41qMsnMeoEnUVVEdMQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746998291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z1LlZOoLaS1B4vzBVZP0EbbDkdO6N0U0HywBnUrr4mA=;
	b=0wQUYP/7DRKfmnvIEK+XjjotpML9prs2X8tQzmteXC1Zehb0qD1MQQ1oCeUaej5Q2mw4fV
	HhSaAfV28a873fAQ==
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH 06/11] riscv: kproves: Remove duplication of RVC_EXTRACT_JTYPE_IMM
Date: Sun, 11 May 2025 23:17:58 +0200
Message-Id: <64739c38b3b22633cf76b392720028821f4c5a74.1746997351.git.namcao@linutronix.de>
In-Reply-To: <cover.1746997351.git.namcao@linutronix.de>
References: <cover.1746997351.git.namcao@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Use RVC_EXTRACT_JTYPE_IMM, instead of reimplementing it in simulate_c_j().

Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 arch/riscv/kernel/probes/simulate-insn.c | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/arch/riscv/kernel/probes/simulate-insn.c b/arch/riscv/kernel/p=
robes/simulate-insn.c
index 3ba97e79a2a3..5defbde4dd50 100644
--- a/arch/riscv/kernel/probes/simulate-insn.c
+++ b/arch/riscv/kernel/probes/simulate-insn.c
@@ -170,24 +170,9 @@ bool __kprobes simulate_branch(u32 opcode, unsigned lo=
ng addr, struct pt_regs *r
=20
 bool __kprobes simulate_c_j(u32 opcode, unsigned long addr, struct pt_regs=
 *regs)
 {
-	/*
-	 *  15    13 12                            2 1      0
-	 * | funct3 | offset[11|4|9:8|10|6|7|3:1|5] | opcode |
-	 *     3                   11                    2
-	 */
-
-	s32 offset;
-
-	offset  =3D ((opcode >> 3)  & 0x7) << 1;
-	offset |=3D ((opcode >> 11) & 0x1) << 4;
-	offset |=3D ((opcode >> 2)  & 0x1) << 5;
-	offset |=3D ((opcode >> 7)  & 0x1) << 6;
-	offset |=3D ((opcode >> 6)  & 0x1) << 7;
-	offset |=3D ((opcode >> 9)  & 0x3) << 8;
-	offset |=3D ((opcode >> 8)  & 0x1) << 10;
-	offset |=3D ((opcode >> 12) & 0x1) << 11;
+	s32 offset =3D RVC_EXTRACT_JTYPE_IMM(opcode);
=20
-	instruction_pointer_set(regs, addr + sign_extend32(offset, 11));
+	instruction_pointer_set(regs, addr + offset);
=20
 	return true;
 }
--=20
2.39.5

