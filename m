Received: from mail-lj1-f202.google.com (mail-lj1-f202.google.com [209.85.208.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70583237A3B
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 08:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747817565; cv=none; b=CluqZ19ufJpKdIwRbrDJc/FoV8nbOQNXRXiTHg2jEnnqAbiiohrUZCCxPye/XmH6LO/uUIsIzx+9LI2EhVe04J622sfx6VzpUY1Bw6RRkEpa9aVjQDAVH2JwQ1SO+JQpI5DlidJzRGgpka+HVp7cqXrl8JhCV3z6vszUHZbl3j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747817565; c=relaxed/simple;
	bh=camf3GO2Tud40W0EVzvx6255cHllttpLo07ATEHkw9I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=OvYoVxbCyN8+/3Qw4sTTVhOJbRcuyap+daJ3xM8YuAYL0TX0zSoakwJMD/7P6mMDJMg2eOsPXOayiSYBUUZcB4N97o/wFlgeSHqIzl6RGMUA6T139RBf72lXUWvo8Ab+O4xziUxBIO8ZbiYLZyUKF/ftVVP4AYOvQfk21is7/CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dvyukov.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KP/FU3ST; arc=none smtp.client-ip=209.85.208.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dvyukov.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KP/FU3ST"
Received: by mail-lj1-f202.google.com with SMTP id 38308e7fff4ca-3290bc321a6so24301621fa.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 01:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747817560; x=1748422360; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WNoBQfA/IQC/YYpacvNXlhrzua/HY9YirhkydO/KS+M=;
        b=KP/FU3STth/Avf0/trRFFD8TbDGqgZfbR7Dd+nZ3PreUAudO0wt8f2E6WLCKBhwVM8
         H6N9YXAL7fM2gCCQZ5ajsU32riNtvjs0ynUtuaThaiqwyD+fxafWNpE3tgsYMrfXFZcM
         nLFYQi/UJyTRmMbJTmcqA1GODDsQlJemyRVKoC0pf0SdPBMv7ojXEH/tjtLe7BsVyyvz
         K4H8T3FR5+a5nSO/GfemcigJojBrnCfYMJ4uyZIxNtWM9AuY4zZubLnb8RicB8IeYp+1
         rqIShvHaHy9eWm/E5+wXzyzrEjyOkz1R7u/6faSGXIn99K71PStY73kSO7JxVIN9RsAB
         14Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747817560; x=1748422360;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WNoBQfA/IQC/YYpacvNXlhrzua/HY9YirhkydO/KS+M=;
        b=j9xcdQmYRZnnhqrR5kWTh5mG+X6J5U7OE9ziLBDFNNoC01jkFR82vvEFxkqpbXZU1D
         wsqgK+h3ouYb1cFtFWf0BAN2k1/S6cbiHRWkCtqvtU+5+9wNUyAm2adrx+n2P9eqARQk
         4DI3a/QB9pslLxMJCjDpdwYY1m5hW425loXyNonmrKt56XIu+OzN5DPO2/3/aqL3N8y9
         xjANhaOzg/ue7e14D19vg/U4iznbgRIGWNjWr9dbIc5keWfF6bjZgzykPo29j0cWpYE0
         vQ9QbaPPi55HMMbY21IiyABcjyt+TqIxebx2wvUo4hCGnAoW16X7JxJuKSOFFAgVM5hK
         0NGg==
X-Forwarded-Encrypted: i=1; AJvYcCWkKYXItfDwxQoue3i92ZQAmaC/3e1m0u2M7Ifr0BOjaBJv8FfoFYoZusroEkkvAS6iXOsd6ADqPM0f7iU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8ghLDKXL/VR2T2AJn1KATIakR0P6B/xxv/Popdn6drwTXweNf
	nH5Cfs9lEU6RbGhPlg50fvDBPyqgIW3y1noKDfh1mN0XC4/I5677BSeuEEvWhpSG7EDy/YKGNhw
	H9bH7Kt3esA==
X-Google-Smtp-Source: AGHT+IHWDG5pW542MTNGAZV/c69QibZMHkxG6r/hjurBVXLKMjKC1/4FTSuaCFyEIACWOBO5QP40tA7KrQ9q
X-Received: from wrut15.prod.google.com ([2002:a5d:690f:0:b0:3a3:6a82:b2a2])
 (user=dvyukov job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:2902:b0:3a3:6c37:eb48
 with SMTP id ffacd0b85a97d-3a36c37edadmr10301693f8f.19.1747817550101; Wed, 21
 May 2025 01:52:30 -0700 (PDT)
Date: Wed, 21 May 2025 10:47:46 +0200
In-Reply-To: <cover.1747817128.git.dvyukov@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1747817128.git.dvyukov@google.com>
X-Mailer: git-send-email 2.49.0.1143.g0be31eac6b-goog
Message-ID: <4092b965068efe1077cc3e83724ede18866b9241.1747817128.git.dvyukov@google.com>
Subject: [PATCH v7 1/4] pkeys: add API to switch to permissive/zero pkey register
From: Dmitry Vyukov <dvyukov@google.com>
To: mathieu.desnoyers@efficios.com, peterz@infradead.org, boqun.feng@gmail.com, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, hpa@zytor.com, aruna.ramakrishna@oracle.com, 
	elver@google.com
Cc: Dmitry Vyukov <dvyukov@google.com>, "Paul E. McKenney" <paulmck@kernel.org>, x86@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The API allows to switch to permissive pkey register that allows accesses
to all PKEYs, and to a value that allows access to the 0 (default) PKEY.
x86 signal delivery already uses switching to permissive PKEY register
value, and rseq needs to allow access to PKEY 0 while accessing
struct rseq/rseq_cs.

Signed-off-by: Dmitry Vyukov <dvyukov@google.com>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Aruna Ramakrishna <aruna.ramakrishna@oracle.com>
Cc: x86@kernel.org
Cc: linux-kernel@vger.kernel.org
Reviewed-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Fixes: d7822b1e24f2 ("rseq: Introduce restartable sequences system call")

---
Changes in v5:
 - Removed leftover dead code in enable_zero_pkey_val
 - Clarified commit message

Changes in v4:
 - Added Fixes tag

Changes in v3:
 - Renamed API functions to write_permissive_pkey_val/write_pkey_val
 - Added enable_zero_pkey_val for rseq
 - Added Reviewed-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>

Changes in v2:
 - Fixed typo in commit description
---
 arch/x86/Kconfig             |  1 +
 arch/x86/include/asm/pkeys.h | 30 ++++++++++++++++++++++++++++++
 arch/x86/include/asm/pkru.h  | 10 +++++++---
 include/linux/pkeys.h        | 31 +++++++++++++++++++++++++++++++
 mm/Kconfig                   |  2 ++
 5 files changed, 71 insertions(+), 3 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index e21cca404943e..90e60f5651bb6 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -1820,6 +1820,7 @@ config X86_INTEL_MEMORY_PROTECTION_KEYS
 	depends on X86_64 && (CPU_SUP_INTEL || CPU_SUP_AMD)
 	select ARCH_USES_HIGH_VMA_FLAGS
 	select ARCH_HAS_PKEYS
+	select ARCH_HAS_PERMISSIVE_PKEY
 	help
 	  Memory Protection Keys provides a mechanism for enforcing
 	  page-based protections, but without requiring modification of the
diff --git a/arch/x86/include/asm/pkeys.h b/arch/x86/include/asm/pkeys.h
index 2e6c04d8a45b4..614099766d5f2 100644
--- a/arch/x86/include/asm/pkeys.h
+++ b/arch/x86/include/asm/pkeys.h
@@ -2,6 +2,8 @@
 #ifndef _ASM_X86_PKEYS_H
 #define _ASM_X86_PKEYS_H
 
+#include "pkru.h"
+
 /*
  * If more than 16 keys are ever supported, a thorough audit
  * will be necessary to ensure that the types that store key
@@ -123,4 +125,32 @@ static inline int vma_pkey(struct vm_area_struct *vma)
 	return (vma->vm_flags & vma_pkey_mask) >> VM_PKEY_SHIFT;
 }
 
+typedef u32 pkey_reg_t;
+
+static inline pkey_reg_t write_permissive_pkey_val(void)
+{
+	return write_pkru(0);
+}
+
+static inline pkey_reg_t enable_zero_pkey_val(void)
+{
+	u32 pkru;
+
+	if (!cpu_feature_enabled(X86_FEATURE_OSPKE))
+		return 0;
+	/*
+	 * WRPKRU is relatively expensive compared to RDPKRU,
+	 * avoid it if possible.
+	 */
+	pkru = rdpkru();
+	if ((pkru & (PKRU_AD_BIT|PKRU_WD_BIT)) != 0)
+		wrpkru(pkru & ~(PKRU_AD_BIT|PKRU_WD_BIT));
+	return pkru;
+}
+
+static inline void write_pkey_val(pkey_reg_t val)
+{
+	write_pkru(val);
+}
+
 #endif /*_ASM_X86_PKEYS_H */
diff --git a/arch/x86/include/asm/pkru.h b/arch/x86/include/asm/pkru.h
index 74f0a2d34ffdd..b9bf9b7f2753b 100644
--- a/arch/x86/include/asm/pkru.h
+++ b/arch/x86/include/asm/pkru.h
@@ -39,16 +39,20 @@ static inline u32 read_pkru(void)
 	return 0;
 }
 
-static inline void write_pkru(u32 pkru)
+static inline u32 write_pkru(u32 pkru)
 {
+	u32 old_pkru;
+
 	if (!cpu_feature_enabled(X86_FEATURE_OSPKE))
-		return;
+		return 0;
 	/*
 	 * WRPKRU is relatively expensive compared to RDPKRU.
 	 * Avoid WRPKRU when it would not change the value.
 	 */
-	if (pkru != rdpkru())
+	old_pkru = rdpkru();
+	if (pkru != old_pkru)
 		wrpkru(pkru);
+	return old_pkru;
 }
 
 static inline void pkru_write_default(void)
diff --git a/include/linux/pkeys.h b/include/linux/pkeys.h
index 86be8bf27b41b..262d60f6a15f8 100644
--- a/include/linux/pkeys.h
+++ b/include/linux/pkeys.h
@@ -48,4 +48,35 @@ static inline bool arch_pkeys_enabled(void)
 
 #endif /* ! CONFIG_ARCH_HAS_PKEYS */
 
+#ifndef CONFIG_ARCH_HAS_PERMISSIVE_PKEY
+
+/*
+ * Common name for value of the register that controls access to PKEYs
+ * (called differently on different arches: PKRU, POR, AMR).
+ */
+typedef char pkey_reg_t;
+
+/*
+ * Sets PKEY access register to the most permissive value that allows
+ * accesses to all PKEYs. Returns the current value of PKEY register.
+ * Code should generally arrange switching back to the old value
+ * using write_pkey_val(old_value).
+ */
+static inline pkey_reg_t write_permissive_pkey_val(void)
+{
+	return 0;
+}
+
+/*
+ * Sets PKEY access register to a value that allows access to the 0 (default)
+ * PKEY. Returns the current value of PKEY register.
+ */
+static inline pkey_reg_t enable_zero_pkey_val(void)
+{
+	return 0;
+}
+
+static inline void write_pkey_val(pkey_reg_t val) {}
+#endif /* ! CONFIG_ARCH_HAS_PERMISSIVE_PKEY */
+
 #endif /* _LINUX_PKEYS_H */
diff --git a/mm/Kconfig b/mm/Kconfig
index e113f713b4938..37f5706445e2e 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -1131,6 +1131,8 @@ config ARCH_USES_HIGH_VMA_FLAGS
 	bool
 config ARCH_HAS_PKEYS
 	bool
+config ARCH_HAS_PERMISSIVE_PKEY
+	bool
 
 config ARCH_USES_PG_ARCH_2
 	bool
-- 
2.49.0.1143.g0be31eac6b-goog

