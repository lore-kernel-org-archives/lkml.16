Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270AF2472AA
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 14:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744642247; cv=none; b=otiV5QCt9pTJTd672snGnh+1VEBBW1Km9F8UKN5ZPQtKt7oBYWugk/cQfNnTtGmz07/NBQP2f4EBoZJRj/MQYwiTq31ZYwT3Zdp71yopcjR0h94xZGk2nx8JJDXdGDXdEqWBA+UlDsQVs0bqDMgh/fWADNKv2esLfQqPzE7NyzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744642247; c=relaxed/simple;
	bh=1cNUdVBNF5L4jP69xn5kNCssT395B1rOHUlO/zXhIZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Kk1v5AR5SJQ8EaUrNveWaQIpZR4NpxjK3s8IstQ/OyVUzX+13t3A+GF9kMGlkLvwRhL2QSi/uKdeYl26iAroRiVpiCgJiq4JfChS21wXJLD+mgIy2uq09hrxKqc2JhKAXAcfzicVUUQB2JLmEZH8xjQGrFxFQggNMmLo9z81WxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KMs5AmOV; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KMs5AmOV"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac2bb7ca40bso846139466b.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 07:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744642244; x=1745247044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2jSZ7P5EK4ntSUyVVbtWMQorbJrnvttn95r3YH37JNs=;
        b=KMs5AmOVYFJHdqzpP8MnGgf2cnA9yOhDZVS4D+zpuhydgbM8yK0CA7WbnvTGgowmJO
         Lqtp2rdSPAMYEuJBkHjWZKpU6vw4amWp5Q06TaPVtBKKcJUUW/8vqBUP152+YLKuMqI7
         j9klST1yUfKk+rfNNiXQOJY8k4JiuohE6/EUYF89d0XUuzBXdfhy72WTUnv/aq9cIutm
         JOLoC8d4sWbpYPlC4Nm5Ir8pJX8cg6CCrXEKiYDEJTgtS+0FgAPZIjfABXGIBSM78o88
         ybDsBWC8v74DX9ZXNLOUMtBSpwfaCq2hM/sa8tUQ48OflvERzrrdmnvfcrkispmh3taK
         Y/pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744642244; x=1745247044;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2jSZ7P5EK4ntSUyVVbtWMQorbJrnvttn95r3YH37JNs=;
        b=M8SiKLRxhHtM1ZVpseF1FBF7moaV6v+8sbw+kcCe8Sn83toWh/UpEvIruvzRiCky8S
         UQHasOdSTdBUHDsHVi+WKNysudxYtFE8WV4p03wEjgC9t8xi/PJOPiTS4PDJu1XgUcta
         RMRYNdPyP4TZU/bw8D0buskjbz0/lj2f3QWXWqMtozjHdVUBjKG/mltxASXA8jQgBxrm
         od8tF1WVq0TxKHf5bEsE+dW2HcEGqqm6pKbwKvHAcCYbgAzeOtjW65pRygEnw6EQZmYV
         sW/M9oV1A+f/3M5U0pOkEmKM4wf1sb4k+3jPgFIWEyEUwwW18W6JtE8OYdwJ8q0rzLHh
         kxrA==
X-Forwarded-Encrypted: i=1; AJvYcCV9bbTUCuLONXaE8MWDRyiIhw51CnGenpavRZuqSu23K5OGxSBHHUKRPq+TWp/tQhz35zPx9juhJjysEtI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuRZjvE2SdKT2NbjnMY8fK3o+QY2GHHso2W/BzrFxVsWaL+dAM
	SXQNuoc4SC61JK84461CGKsn+aQs46b1+e+wnnq7v++ZMdqFZUTgXB7uOnVFnjQ=
X-Gm-Gg: ASbGncsDf1iy7LvJxoyQEMRTBFnnBmyjlwN0Atc96SdfOQ3PEASb63NzWR1d9A2y8b3
	2rK36FFJPZuroMdcf+QSCiNzu2/uE5mKG7We9Zcw/mJ4pdSYRpPW4V4evjL/uK0aLuI5UpjwAOm
	Uci5SAGx7RDHWGyKoTwo4UdyleCkfk+7ddAouLGvmPjDyTVt06zIydh4HwWiJO61iIQBgQa6/6b
	VZ17wuTm25k7gGTlJwqqx1WqZavCYGENHTLKNuR1/7AL3rYdIXQWwuvACn6MzGJIDjzZQY22sbM
	RjvhyPwEXunq5aKoh4ZJi66gb1+t3HEkqLVuuvAbZ+oSWbaAcy+niFBjFe73
X-Google-Smtp-Source: AGHT+IG6KwneKw28LEByH4RbJhOfqIEtuMAyWnNIg313KlhptrSxzpj0BaoDZbLsbYcE7aX1xjTFAw==
X-Received: by 2002:a17:906:e208:b0:acb:1184:cc29 with SMTP id a640c23a62f3a-acb1184dd72mr36520266b.59.1744642244035;
        Mon, 14 Apr 2025 07:50:44 -0700 (PDT)
Received: from localhost.localdomain ([46.248.82.114])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1bb3120sm909232766b.1.2025.04.14.07.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 07:50:43 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH -tip] x86/asm: Replace "REP; NOP" with PAUSE mnemonic
Date: Mon, 14 Apr 2025 16:50:17 +0200
Message-ID: <20250414145033.10511-1-ubizjak@gmail.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Current minimum required version of binutils is 2.25,
which supports PAUSE instruction mnemonic.

Replace "REP; NOP" with this proper mnemonic.

No functional change intended.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
---
 arch/x86/boot/boot.h                  | 2 +-
 arch/x86/include/asm/vdso/processor.h | 2 +-
 arch/x86/kernel/relocate_kernel_64.S  | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/boot/boot.h b/arch/x86/boot/boot.h
index f3771a6373c7..60580836daf7 100644
--- a/arch/x86/boot/boot.h
+++ b/arch/x86/boot/boot.h
@@ -34,7 +34,7 @@
 extern struct setup_header hdr;
 extern struct boot_params boot_params;
 
-#define cpu_relax()	asm volatile("rep; nop")
+#define cpu_relax()	asm volatile("pause")
 
 static inline void io_delay(void)
 {
diff --git a/arch/x86/include/asm/vdso/processor.h b/arch/x86/include/asm/vdso/processor.h
index c9b2ba7a9ec4..02b8340c6546 100644
--- a/arch/x86/include/asm/vdso/processor.h
+++ b/arch/x86/include/asm/vdso/processor.h
@@ -10,7 +10,7 @@
 /* REP NOP (PAUSE) is a good thing to insert into busy-wait loops. */
 static __always_inline void rep_nop(void)
 {
-	asm volatile("rep; nop" ::: "memory");
+	asm volatile("pause" ::: "memory");
 }
 
 static __always_inline void cpu_relax(void)
diff --git a/arch/x86/kernel/relocate_kernel_64.S b/arch/x86/kernel/relocate_kernel_64.S
index 1d6355227bf6..ea604f4d0b52 100644
--- a/arch/x86/kernel/relocate_kernel_64.S
+++ b/arch/x86/kernel/relocate_kernel_64.S
@@ -405,7 +405,7 @@ SYM_CODE_START_LOCAL_NOALIGN(pr_char_8250)
 	inb	%dx, %al
 	testb	$XMTRDY, %al
 	jnz	.Lready
-	rep nop
+	pause
 	jmp .Lxmtrdy_loop
 
 .Lready:
@@ -426,7 +426,7 @@ SYM_CODE_START_LOCAL_NOALIGN(pr_char_8250_mmio32)
 	movb	(LSR*4)(%rdx), %ah
 	testb	$XMTRDY, %ah
 	jnz	.Lready_mmio
-	rep nop
+	pause
 	jmp .Lxmtrdy_loop_mmio
 
 .Lready_mmio:
-- 
2.42.0

