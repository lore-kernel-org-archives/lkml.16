Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E00E2D0291
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 12:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745931369; cv=none; b=qD3l8Yfp8CVCH9nEsT2JwAdToB3YH1CWnzCXb4JmjIh+d5W+ZthXrs3K+WA1pfLjN23cZqnpLBuhd31Vquil55Z3qU7dIjorN2VYfNdxx9lc+WoABaGDEzmEqgInggJAd+Fo9GAHafvDM7YIagIbtPiK+zsVjUw4oZI89c4a0vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745931369; c=relaxed/simple;
	bh=INK9Od3tUzX/v4E46BjhJMmtIlN+Zo0XqWPW2JYr1OI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DUisiUhB3kh2PbvziMhGHstibOBBSkALcYYIy7Y2VBVpT6hB8HgQCdozmcHd6R+OV/UsSPcqUme5fGTN5OndZALDG/VUazrnkCH5DMUjK/DHUBAxRdk+bViGiM/CQO1/esZvI3uhDsvexUG7qbf51HjjjTFCWJeiabVGL95c/MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=wvbJc/Ar; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=f+nwILJs; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="wvbJc/Ar";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="f+nwILJs"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745931365;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GqICM7uyVMGkK7SLU64r2+T/eRW2AwS+gh4wbVwSSF0=;
	b=wvbJc/ArYz1G3ydNa8bWB5oxdrBWIlXYZSgO5X9Ef/NZ/950vJu5OrkYd/A/NNcEzE20S9
	xnRyfqMC6SP75SeayKrFJGFzrpBqJUd4fM6zsL0sx0ahPVVz5BiqK3jb2MEWMvKTgN27au
	qMXB3ezK1iYtPMy86rAfi7D+4rZJfVzLizWvo6Td3F926mGM08G9MeObGhQZqwit9poywc
	zva3wxdcQIpxMLDa7VymSbfgKkcO9+xRi2Zh0T8xqDt2pcLygWAV177uJZOrsR5d+lNaVr
	AIcmNla/V7Cs+TTs4Uh4BGtaElBi+e4nJv2U/3pibo8bTdVTYHs0cN3cRI38xQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745931365;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GqICM7uyVMGkK7SLU64r2+T/eRW2AwS+gh4wbVwSSF0=;
	b=f+nwILJsoAH1P+BArqTVCbZ0crHGk6dErfsx4KHdfW7CTMl/agpQXI0EkV9JZLWJGvVvSV
	ea2j/wKDDehz+pBw==
Date: Tue, 29 Apr 2025 14:55:36 +0200
Subject: [PATCH 1/2] arm64: vdso: Work around invalid absolute relocations
 from GCC
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250429-vdso-absolute-reloc-v1-1-987a0afd10b5@linutronix.de>
References: <20250429-vdso-absolute-reloc-v1-0-987a0afd10b5@linutronix.de>
In-Reply-To: <20250429-vdso-absolute-reloc-v1-0-987a0afd10b5@linutronix.de>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Nam Cao <namcao@linutronix.de>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Thomas Gleixner <tglx@linutronix.de>, Andy Lutomirski <luto@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jan Stancek <jstancek@redhat.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745931364; l=1838;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=INK9Od3tUzX/v4E46BjhJMmtIlN+Zo0XqWPW2JYr1OI=;
 b=5ulHzGKF8eFCCLAu6Yp7Cqqk1q0uP93WsZLqtT+NWoE32DIh15DiO4tlLvTLbzAIl1hroMJFj
 yiovnOdkrEtDrIZnMX0N/vkD6WmdCNt1E1kYrlSvz+ove/PIVfAnVfb
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

All vDSO code needs to be completely position independent.
Symbol references are marked as hidden so the compiler is forced to emit
PC-relative relocations.
However GCC emits absolute relocations for symbol-relative references with
an offset >= 64KiB. This is the case in __arch_get_vdso_u_timens_data()
with a page size of 64KiB.

Work around the issue by preventing the optimizer from seeing the offsets.

Reported-by: Jan Stancek <jstancek@redhat.com>
Closes: https://lore.kernel.org/lkml/aApGPAoctq_eoE2g@t14ultra/
Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=120002
Fixes: 83a2a6b8cfc5 ("vdso/gettimeofday: Prepare do_hres_timens() for introduction of struct vdso_clock")
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/arm64/include/asm/vdso/gettimeofday.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/include/asm/vdso/gettimeofday.h b/arch/arm64/include/asm/vdso/gettimeofday.h
index 92a2b59a9f3df4d20feb483e6d8ebd1d813b7932..3322c7047d84fecae316a2904f1adec0cb458f6f 100644
--- a/arch/arm64/include/asm/vdso/gettimeofday.h
+++ b/arch/arm64/include/asm/vdso/gettimeofday.h
@@ -99,6 +99,19 @@ static __always_inline u64 __arch_get_hw_counter(s32 clock_mode,
 	return res;
 }
 
+#if IS_ENABLED(CONFIG_CC_IS_GCC) && IS_ENABLED(CONFIG_PAGE_SIZE_64KB)
+static __always_inline const struct vdso_time_data *__arch_get_vdso_u_time_data(void)
+{
+	const struct vdso_time_data *ret = &vdso_u_time_data;
+
+	/* Work around invalid absolute relocations */
+	OPTIMIZER_HIDE_VAR(ret);
+
+	return ret;
+}
+#define __arch_get_vdso_u_time_data __arch_get_vdso_u_time_data
+#endif /* IS_ENABLED(CONFIG_CC_IS_GCC) && IS_ENABLED(CONFIG_PAGE_SIZE_64KB) */
+
 #endif /* !__ASSEMBLY__ */
 
 #endif /* __ASM_VDSO_GETTIMEOFDAY_H */

-- 
2.49.0

