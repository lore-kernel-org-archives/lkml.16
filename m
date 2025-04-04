Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320804438B
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 08:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743754091; cv=none; b=lQo5aS0gAVF7Cp7m+oJmVUUfbUgVJjJesx2tQI3ogpuXqXPJX1zquqX7RtmJ4ppSefEEW52pppJcmncM0E8SmY3ljI+yY9vT2DJgH+GbBd6zUKvquWmbhONoV6oYqTl8XgJSyRIxKkzQSzELT80NGGVfywCY+13rgCAKMnp2vg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743754091; c=relaxed/simple;
	bh=c4sT/4Cg0GK7NzPFjQL6s9d9K/L5ZvbXIPAGDyjjlzI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Frnv8IBoSDawQ1bxGLMatHpX0tu1knZHaOrbFGiAyy00XR06R63ELtDGdYUqR3OEqOQirZ77zQL9p9Ja8qWhgvfv9mXLZFmlue147n93FJUZdvAqluPeXM7qKkprJvNlbg93SBS6qLhmjKsy620R62ZmqUKoRCFfeY9FM2rOUYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VirPVIqF; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VirPVIqF"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ac345bd8e13so290797866b.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 01:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743754086; x=1744358886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=at+DVf5sqM2qaZ54UFdc7UDcOua5nPvf4TYMr1TI2OM=;
        b=VirPVIqFm+iqvcSMbP/7avSrWe9WNbAMVhIqGs5Uw4osxjNSmEU2QpxR6T8cEHIqdC
         ltRiqedjyBHNeGZTFZYe1nfb3SXoqcdgqHtF4JAw5E6WPTSFbQ/IMrczEz9WmlrV6ON7
         F/TMDhBp6KmtHoGKoLeOEVA7O9ZBrOU4SkFVmtlSf+5wltLEUzu1S657V1t9AsymoJOi
         HmQDM8nra4nDuu4kGO17n6Tz1ndRE2NjPR1P3HEgx0JRWpBoOQg3QtKI62jnG1Hbzweg
         ch1i5BT6+kj2HTHDTAZH+4OILtaztnq2UMFvx3oEILO7lLLDDqXvlM8sMBk8KHzu9QE4
         UzZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743754086; x=1744358886;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=at+DVf5sqM2qaZ54UFdc7UDcOua5nPvf4TYMr1TI2OM=;
        b=Zks5F0yiGckB2dhq7tKHe3C+SRNI8RospA/1IF2eTUMyag3UV+SPiPs9MThNFsWkYN
         kHMoN/Q8BhiYgq4EoHodUjzMAHIDYuT8I3BUUSm23sgfuP1pmfPZuHcLIIFqFJRZHSl0
         uQwRMu8LLM7iq6hV3qF1uP/3GfRaO82LZbpbt+VhtoeYb+eq7E8ohxCcfPmKqXYSPz7V
         dLynQR0Ly6zQXuo90sJsMM7jGP7gkxjY8MKSxTj8OKaO49E7E/KT16KYCLf3IiHR1yIq
         s51Lc9H2Vt/r8Zd2iguFCEqzqVvuiKk5gQQcB3GxI1qom6wuCK37qGdigsoziZYY8gq+
         W+iw==
X-Gm-Message-State: AOJu0YzVHtr1n3euw49yuPj7dPF3PBSOPgNBf1PQwdHmnIAid6oVDSv4
	UEeKZWjxXpgnqULrSA4x9G20z4axe1zwy1ATGclqo4ldxQa/FHO45QGEW3SH
X-Gm-Gg: ASbGncus6US601CK5i2foYBMdE4mUVIizAuNflO1+T7AjMme4Aks81R/P6nkrUAK5Rd
	Vm7xxORRpqiDq6cysfce09qS/TXKR4OJNXWRTeLSkLoMdFsIB4vcQP+ap4HvV+jTrhgee4yizk0
	XzO21tPgucU3KvnHMihZPvkw/8eQ9sSaE41ox3XxoPvQ5xvIODHXQWE42ErCgb/Kd7i3xeBHu5s
	uiUUugHif6DkjkB3Hy18QR7ITt0XDwTsES1gU+l8d2c7VLH08/6LeyaORptsjbBVFSOwWQf9won
	JOMmE3AxC5jwpzcU171xXV8oUaQdJ9HVvCeI
X-Google-Smtp-Source: AGHT+IHOP3hoGFy3f35T13B3RByWzaKueyDSRPHT3/aFOrhGMGxg6jLmKWH2Qi3uLD9o1lbIrFXv1A==
X-Received: by 2002:a17:907:3f08:b0:ac6:f976:31da with SMTP id a640c23a62f3a-ac7d190fe18mr224242866b.44.1743754086382;
        Fri, 04 Apr 2025 01:08:06 -0700 (PDT)
Received: from fedora.. ([193.77.86.199])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7c018ac4bsm212005566b.129.2025.04.04.01.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 01:08:05 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH] lib/raid6: Remove CONFIG_AS_AVX512 handling
Date: Fri,  4 Apr 2025 10:07:52 +0200
Message-ID: <20250404080803.555424-1-ubizjak@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Current minimum required version of binutils is 2.25,
which supports AVX-512 instruction mnemonics.

Remove check for assembler support of AVX-512 instructions
and all relevant macros for conditional compilation.

No functional change intended.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
---
 lib/raid6/algos.c        | 6 ------
 lib/raid6/avx512.c       | 4 ----
 lib/raid6/recov_avx512.c | 6 ------
 lib/raid6/test/Makefile  | 3 ---
 4 files changed, 19 deletions(-)

diff --git a/lib/raid6/algos.c b/lib/raid6/algos.c
index cd2e88ee1f14..dfd3f800ac9b 100644
--- a/lib/raid6/algos.c
+++ b/lib/raid6/algos.c
@@ -28,10 +28,8 @@ EXPORT_SYMBOL_GPL(raid6_call);
 
 const struct raid6_calls * const raid6_algos[] = {
 #if defined(__i386__) && !defined(__arch_um__)
-#ifdef CONFIG_AS_AVX512
 	&raid6_avx512x2,
 	&raid6_avx512x1,
-#endif
 	&raid6_avx2x2,
 	&raid6_avx2x1,
 	&raid6_sse2x2,
@@ -42,11 +40,9 @@ const struct raid6_calls * const raid6_algos[] = {
 	&raid6_mmxx1,
 #endif
 #if defined(__x86_64__) && !defined(__arch_um__)
-#ifdef CONFIG_AS_AVX512
 	&raid6_avx512x4,
 	&raid6_avx512x2,
 	&raid6_avx512x1,
-#endif
 	&raid6_avx2x4,
 	&raid6_avx2x2,
 	&raid6_avx2x1,
@@ -96,9 +92,7 @@ EXPORT_SYMBOL_GPL(raid6_datap_recov);
 
 const struct raid6_recov_calls *const raid6_recov_algos[] = {
 #ifdef CONFIG_X86
-#ifdef CONFIG_AS_AVX512
 	&raid6_recov_avx512,
-#endif
 	&raid6_recov_avx2,
 	&raid6_recov_ssse3,
 #endif
diff --git a/lib/raid6/avx512.c b/lib/raid6/avx512.c
index 9c3e822e1adf..009bd0adeebf 100644
--- a/lib/raid6/avx512.c
+++ b/lib/raid6/avx512.c
@@ -17,8 +17,6 @@
  *
  */
 
-#ifdef CONFIG_AS_AVX512
-
 #include <linux/raid/pq.h>
 #include "x86.h"
 
@@ -560,5 +558,3 @@ const struct raid6_calls raid6_avx512x4 = {
 	.priority = 2		/* Prefer AVX512 over priority 1 (SSE2 and others) */
 };
 #endif
-
-#endif /* CONFIG_AS_AVX512 */
diff --git a/lib/raid6/recov_avx512.c b/lib/raid6/recov_avx512.c
index fd9e15bf3f30..310c715db313 100644
--- a/lib/raid6/recov_avx512.c
+++ b/lib/raid6/recov_avx512.c
@@ -6,8 +6,6 @@
  * Author: Megha Dey <megha.dey@linux.intel.com>
  */
 
-#ifdef CONFIG_AS_AVX512
-
 #include <linux/raid/pq.h>
 #include "x86.h"
 
@@ -377,7 +375,3 @@ const struct raid6_recov_calls raid6_recov_avx512 = {
 #endif
 	.priority = 3,
 };
-
-#else
-#warning "your version of binutils lacks AVX512 support"
-#endif
diff --git a/lib/raid6/test/Makefile b/lib/raid6/test/Makefile
index 2abe0076a636..8f2dd2210ba8 100644
--- a/lib/raid6/test/Makefile
+++ b/lib/raid6/test/Makefile
@@ -54,9 +54,6 @@ endif
 ifeq ($(IS_X86),yes)
         OBJS   += mmx.o sse1.o sse2.o avx2.o recov_ssse3.o recov_avx2.o avx512.o recov_avx512.o
         CFLAGS += -DCONFIG_X86
-        CFLAGS += $(shell echo "vpmovm2b %k1, %zmm5" |          \
-                    gcc -c -x assembler - >/dev/null 2>&1 &&    \
-                    rm ./-.o && echo -DCONFIG_AS_AVX512=1)
 else ifeq ($(HAS_NEON),yes)
         OBJS   += neon.o neon1.o neon2.o neon4.o neon8.o recov_neon.o recov_neon_inner.o
         CFLAGS += -DCONFIG_KERNEL_MODE_NEON=1
-- 
2.49.0

