Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B99263898
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 21:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746998296; cv=none; b=aJMJuWSZjRdazww52k5Z2KrpZcQzjjk7R2BcUVyLaOAlLtylMWjrIeFoXhB3HKn0I1L1W6fZf2lOTQCbqts3VPC6KY5GoPye+1HyawFgMDGQ2vy+rpUhAWadpuyGNsHtM9jWbi/Gqf3YvJWaijNoTJT7X5uTkRS2P7xQIznwduo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746998296; c=relaxed/simple;
	bh=0+/um2kJNRDLk3EFkIOR6EKeAhQZ5jg8wpzCgOrkVzQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=k3W9EzuBe+Lu2O49SlP8F+N+SI8dnKcD9GiqdqP2NxlruG8Wagit2UIUAVtn6+UdtNgE4AL8Rlj5BJOyPxxSwU1NwYlXpcfXAJWMnYDmobgM4YM4nyJkoFIP+zA6EgdiWXF3QB72xQRxovadz7jrr9NzIZ1xudrFYpdyZASXIjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=gKj7ol7G; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=5BgFKKgs; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="gKj7ol7G";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="5BgFKKgs"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746998291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kuh4owOv0RzlQSco6IKhRzdD1qqjlGpYcTbO1rvk8z0=;
	b=gKj7ol7G2ufttDRdEfBOlzR3Rgz1xvGVIjLBseZ8MKCYDjyL29s3FhWiq5ZyWEU8q9QpOg
	Y+PPVAI7xdcATY6Y2kW8eviGXhW18HY45XTqPQ5gQaL6bcAvo/jn4JghhBtBZih6ibRg2s
	fCAPTQuNypEHo4lia8iI1tdWBc+eAmH+l2cwYmx3UMallu16o8AJQZPWAZ2fKNjzvV7oy6
	d7zZvgCcDiz8MjuLkoZRL/+CwEhOC7daHUJyvR8DjSPDKLW8Z7PWOY/d5goHB2LHo1iyJB
	lXCpy1++IesTGCOOu39OaPD7GW7aWtA4fmOEFqkawGvzqAoX35jKL7n5jLz3Cw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746998291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kuh4owOv0RzlQSco6IKhRzdD1qqjlGpYcTbO1rvk8z0=;
	b=5BgFKKgsItCzaNlFc0kSoIIaSJmfKjK/9eYHN8xJmdDWDIkWrrKfDCtkvb5A+j1yMGPp8W
	cuhkpD6qJgoMxeBg==
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH 05/11] riscv: kprobes: Remove duplication of RV_EXTRACT_BTYPE_IMM
Date: Sun, 11 May 2025 23:17:57 +0200
Message-Id: <1510a1a9674e84c9ba9a5a57e21d0f2aed3a3f48.1746997351.git.namcao@linutronix.de>
In-Reply-To: <cover.1746997351.git.namcao@linutronix.de>
References: <cover.1746997351.git.namcao@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Use RV_EXTRACT_BTYPE_IMM, instead of reimplementing it in
simulate_branch().

Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 arch/riscv/kernel/probes/simulate-insn.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/arch/riscv/kernel/probes/simulate-insn.c b/arch/riscv/kernel/p=
robes/simulate-insn.c
index 625d514c4ada..3ba97e79a2a3 100644
--- a/arch/riscv/kernel/probes/simulate-insn.c
+++ b/arch/riscv/kernel/probes/simulate-insn.c
@@ -115,15 +115,6 @@ bool __kprobes simulate_auipc(u32 opcode, unsigned lon=
g addr, struct pt_regs *re
 	return true;
 }
=20
-#define branch_imm(opcode) \
-	(((((opcode) >>  8) & 0xf ) <<  1) | \
-	 ((((opcode) >> 25) & 0x3f) <<  5) | \
-	 ((((opcode) >>  7) & 0x1 ) << 11) | \
-	 ((((opcode) >> 31) & 0x1 ) << 12))
-
-#define branch_offset(opcode) \
-	sign_extend32((branch_imm(opcode)), 12)
-
 bool __kprobes simulate_branch(u32 opcode, unsigned long addr, struct pt_r=
egs *regs)
 {
 	/*
@@ -148,7 +139,7 @@ bool __kprobes simulate_branch(u32 opcode, unsigned lon=
g addr, struct pt_regs *r
 	    !rv_insn_reg_get_val(regs, RV_EXTRACT_RS2_REG(opcode), &rs2_val))
 		return false;
=20
-	offset_tmp =3D branch_offset(opcode);
+	offset_tmp =3D RV_EXTRACT_BTYPE_IMM(opcode);
 	switch (RV_EXTRACT_FUNCT3(opcode)) {
 	case RVG_FUNCT3_BEQ:
 		offset =3D (rs1_val =3D=3D rs2_val) ? offset_tmp : 4;
--=20
2.39.5

