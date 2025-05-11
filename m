Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BFAF2641FC
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 21:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746998297; cv=none; b=TOQKFW2Ivy/uwgFa/rjZBrvwptdeMU2G+B/jNsTimPGHrkknHojdgz8jsaSwopXXmVmI7IARZ3LNxlXcFIXrB5WfzmFASIa3/UD9ELHqU7ZxMacBk2luKDA+AKlMVT+fKcgnFxVl7yg/jQZ65UB3QNPBoNAy3iYxQ4wd0Dywt3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746998297; c=relaxed/simple;
	bh=no4qakD4nxljmSj0dNsH7cHTRGfko3yxxNeYW0VDHXA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WyhYQFGNCJofPf3TvE3tgdlmhrEp0BA/NOCOpbXB6N5PlFSPjI5jay+FW+dNF+x76f492pegG+lG6kljyB3JICVBp1Gx4XFg1OECn9Q4N60n0ls2tkazGWKTHhj5QCWXqEC0PMh8WFb9VNpPq+GmGZ7GqBhdvLnCN0be9+x99TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=tPRJhreh; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=eyG41UCA; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="tPRJhreh";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="eyG41UCA"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746998292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E7nRg54MLFX0wtJKb5RifAgoyTmks+tvfzWz8EaXC+I=;
	b=tPRJhrehBPcmassI4U6hQ+6Hdpv9rxGcGNrQJirTHwzDfsrdCwUgu1sjMtAwWAWj967XL3
	NPJkg9F2+CbJLbRnlWVKQf3SFVdTZSNsOl71R4G5wGIJXdIZAbtbDto+lvdGpmDcoHIp3F
	j/nDpgmezlvFIWck+//t/Sg03WFdmMdpsdfW5nHJOim7NGw7lYCsozyN6cUc+0wOxtyao+
	MVHoFIPLkXd8XadAu5jVxP1Ikf/NDgJUV4p639ybA5iup8oGq/tGt0EVMEpFSEnM7Yc2bN
	n++vMbSHO8/XbKN/vq+fmiS9rp45cVkLp5kjXs2pzE2ZYjmaT1LdKCaBpFrE8A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746998292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E7nRg54MLFX0wtJKb5RifAgoyTmks+tvfzWz8EaXC+I=;
	b=eyG41UCA5GOgr6jB0HFIk7/4ZIzC8VjG+m2YtoWBEGjkRvhqXmWnPrPkGsG39JCdE9XsZX
	cTwKh1rcOE1ZuFBA==
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH 08/11] riscv: kprobes: Remove duplication of RVC_EXTRACT_BTYPE_IMM
Date: Sun, 11 May 2025 23:18:00 +0200
Message-Id: <fc9a3dc0a7365800edf8c300b73d6f82ef761ff0.1746997351.git.namcao@linutronix.de>
In-Reply-To: <cover.1746997351.git.namcao@linutronix.de>
References: <cover.1746997351.git.namcao@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Use RVC_EXTRACT_BTYPE_IMM, instead of reimplementing it in
simulate_c_bnez_beqz().

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

