Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8EEC21C17B
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 09:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746004819; cv=none; b=Feg1Pul4KLYts3QQj3GLg5cutmuPLBg2vgPf0lXlmh98xshquaFKFc9I1YRSA2h/+dC5T0FtI4dFQMFWSNc1w/cYXk61iV/8BlZ+ChMT4a0zSmYsggOKCyuFv09KXp/2DRmZVW9G9IR6cnNx4HsJlgK2eHiLPbGHT9ASjxBJzfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746004819; c=relaxed/simple;
	bh=wPiVAyb4i0INmlrU5d1yJoYnmvXNkJvqm5DWeZRgR8w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SHzeSd1hrTbah2J1/OzODWOoMet9WfDeDLgDSqQk9FLJFZYTbLezLTAMv4mPwqv1pa2n+QrP6WIvBUulOvX9dJNTfWUrC5JBUGmXFOAXd6sqVZTtPuzIKBXNrvVX2gQshsbUeNMuxIKevNjlPdILvM1XonVSLRUWurmkaJjwydE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=TlV2k7Hj; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=6o6yeKl2; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="TlV2k7Hj";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="6o6yeKl2"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746004815;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tdw8tH4FhSz345Xupp3UnovvlZsLVACqjoY1xoiC/XI=;
	b=TlV2k7HjEyUtI111dsE8HdMprDL8k8ChNFqGvZZgGQg5RSs1dNwn7D4/yRXcTOMXqFWVjF
	gXX4LZhlK6lfTIwtqQzamEYSHqrpaVHq+4I6YdtXGUsJ2OH4+H/95dnj2v934vCKX05Ysr
	X1NziDjXAgXJ8NJ4dtRiBiQU5nKZrptXTxeP7oJyQX+81UArqmE1KwIcM6OARtKfCwbvWi
	vBCQVB56SyH7vz9DJ7ldbVmhpe6HJikB5gdRK7aiYgDwdJXHB25aQTkjACsDRcjZaW659p
	VEGypwiZ1x1CTyb5kvWdlDustiZnSZe6jxDQZVoNQOxJzp1RUr91g+bj+A/tNA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746004815;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tdw8tH4FhSz345Xupp3UnovvlZsLVACqjoY1xoiC/XI=;
	b=6o6yeKl2GNoHSR63/A4JZRNlkRy1NlvQuK+afR0NPgbHOONIBm3YfS26FUtfSM91EYAB1L
	7KYJ8WToW5yI3sBg==
Date: Wed, 30 Apr 2025 11:20:13 +0200
Subject: [PATCH v2 1/2] arm64: vdso: Work around invalid absolute
 relocations from GCC
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250430-vdso-absolute-reloc-v2-1-5efcc3bc4b26@linutronix.de>
References: <20250430-vdso-absolute-reloc-v2-0-5efcc3bc4b26@linutronix.de>
In-Reply-To: <20250430-vdso-absolute-reloc-v2-0-5efcc3bc4b26@linutronix.de>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Nam Cao <namcao@linutronix.de>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Thomas Gleixner <tglx@linutronix.de>, Andy Lutomirski <luto@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jan Stancek <jstancek@redhat.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746004814; l=1869;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=wPiVAyb4i0INmlrU5d1yJoYnmvXNkJvqm5DWeZRgR8w=;
 b=OjSnD9IkRXm7nMcxWypWAcqqSkKe9ShzBQuKcW5bcMFfpvC3AHuQDqr8Masw4P8vEGYwKl1sd
 t1dW5bq6bkUCHEYe4JaHZmqp51QRvnIBf/DI/VUZn6OGmSayc6j8mUj
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

All vDSO code needs to be completely position independent.
Symbol references are marked as hidden so the compiler emits
PC-relative relocations.
However GCC emits absolute relocations for symbol-relative references with
an offset >= 64KiB. After recent refactorings in the vDSO code this is the
case in __arch_get_vdso_u_timens_data() with a page size of 64KiB.

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

