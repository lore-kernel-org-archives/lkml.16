Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC6719EED3
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 08:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744963698; cv=none; b=kbsBgOrg4u878eF0alQYqxJ0+wgnr1ypo2O7r78c1bR8NZnfUaDmqEmlxxsv3yKtrtP5THu7Hq8tqCGFbNgROWXCTHIcV14gybRXruS73KeoTZVFEbPFpTy8Ux7tP3r5C1fDeDffmVYDJ9lRgqiC50xVCdmh0cvQCZe+JTEKCCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744963698; c=relaxed/simple;
	bh=KFc7NxazWbecdf/pQ8MPoSpDthgZbbErE5r5870t1K4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TDLo84yw10tK435wuLaZo9QePbsvC7BIAlq7PXtXxCnHovhXAUTrZuKjzt5Kjn2gVeDWp55hEEJP6uJVfYg24Ug1xYRscj5DXxn/kW7jYOueY6XVuxWvvKEaNElgMOjmjXQmRhgoi0Ld/sXctA+5U/zuMiicqZEGthnkVrIpSBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W3rKu0fW; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W3rKu0fW"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ac2bb7ca40bso305889066b.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 01:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744963694; x=1745568494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d0L8YvnzE0pi2bEGvACdQZtJxO8WbkqI0hMXvgVv5oE=;
        b=W3rKu0fW3QgZGd1SPYNtfKK6ck4QKO7wQCU5bDWL0/LsxrB6FzF907HeVmL8yh21Ws
         hXhte/tsMM3z9Y1Lpp+QjvWGE73Un8uGV/rNSSbsU5Os8aBt8wnNGd+4tZNUSka9nQzx
         WwMgr2m6UU1y8Dw3l1jKYveTSnIjRXl25yZ4IfmbgcjKWRq6nMCgC8sBbCp8KD3sQRpv
         K5dS7zBH0gKBsjI7S7Z+qzRf1AYiC/LR+l+YWcm5hWt1gj5flwhu/nv1ov8gpfVyNcBA
         U4MZyA7vFhd9SF0ordpkxmE94kaxf9qkNKr9TJABf+7228HJSfkxL6OrCixowMIiQbjk
         p0Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744963694; x=1745568494;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d0L8YvnzE0pi2bEGvACdQZtJxO8WbkqI0hMXvgVv5oE=;
        b=wLTxu2eSBxmfJ+x6FznupPOHQIQNkDBt9hYWKAmOQLQi/5nG7ag/s0lkuIkB78di2w
         HeYzjh/shI0dmcHCvwWD2qKMihMPtHRXDM/N34ccjuo+zmOz9TVL+SD4RNmRyU6T8Oc3
         WyqoM/N47Gp7y+tyTVZ4pofArhawmhdUR2wuAIq5TeMWLCygFUhXp4oz6oPvzGCRhKdR
         nCT/zdaroQK8yeO46Y876ef8jUiXXRgXEFICHjg9z4E3xbRY8FwUPxIuY7OUNHCzLEJL
         ptEl5CtoNkfNiAd5kH+omm9NvyPRX/9Zoqd19BZ8xFLgGop77ETY46APBIjgvNVA8Wdu
         2y9g==
X-Forwarded-Encrypted: i=1; AJvYcCWgVL8u2p/yfApJVu/mcOrmt9Gp9LCxRCmKhT5yAFxF7abdGgQ+PghDJeK8PxhG4QbnuOU59ytZL+vcSJs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwehpXp4pRgIz5vOq7RCWwFyZAuuw8R9CvJU3955FAuRf8db3v
	GwNuXi4KIGmf0dpeIw3L1PNpvvKEUPmlTuoJBRWleaDgsDkBNABZu6sb0hoA
X-Gm-Gg: ASbGncvsym1Qq1+czB+7vzgokFHwccNMLnBYQjgHmUjav7sTnaEzKTEyRrvoXuZVEqQ
	FTLKQ2RN9QIIeBNnkcBxraCLUrsNqpmS5LfpJjwS8Oe/vUEk4rW1JJwN1mvPmxDzlO236nJNlh0
	SK3sGOnwZ4H0bmrGjZLlHMtXI8iBfp4JyE3Sdtcy3ORFnjou4uf1wsLrVEuojwl9q6QDrZ2LAtI
	cGF4QFy5wuV7KuUmUMpGcmwIm4j1dn0fDKJmx/a+cbF6eN5fnkbugjzCxc4dkCoskdBCgADsYTC
	Q2+9IL+3zJ/7uyIgOJRGFIwhJA463KmYpCmxaTmfzjM=
X-Google-Smtp-Source: AGHT+IHzQWd3ZDnvlz3re6FuiGWL4ndTHggjRJghLHawbxSsLHlHYZYMoc6FXtEkAQ3MIZkTXztSpg==
X-Received: by 2002:a17:907:d1b:b0:ac3:4487:6a99 with SMTP id a640c23a62f3a-acb74db7e5emr161244366b.47.1744963694141;
        Fri, 18 Apr 2025 01:08:14 -0700 (PDT)
Received: from fedora.. ([193.77.86.199])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef49ff9sm90053366b.158.2025.04.18.01.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 01:08:13 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH -tip v2 1/2] x86/asm: Rename rep_nop() to native_pause()
Date: Fri, 18 Apr 2025 10:07:43 +0200
Message-ID: <20250418080805.83679-1-ubizjak@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename rep_nop() function to what it really does.

No functional change intended.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
---
v2: Rename rep_nop() to native_pause() first.
---
 arch/x86/include/asm/vdso/processor.h | 4 ++--
 arch/x86/kernel/apic/io_apic.c        | 2 +-
 arch/x86/lib/delay.c                  | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/include/asm/vdso/processor.h b/arch/x86/include/asm/vdso/processor.h
index c9b2ba7a9ec4..895333b52cb3 100644
--- a/arch/x86/include/asm/vdso/processor.h
+++ b/arch/x86/include/asm/vdso/processor.h
@@ -8,14 +8,14 @@
 #ifndef __ASSEMBLER__
 
 /* REP NOP (PAUSE) is a good thing to insert into busy-wait loops. */
-static __always_inline void rep_nop(void)
+static __always_inline void native_pause(void)
 {
 	asm volatile("rep; nop" ::: "memory");
 }
 
 static __always_inline void cpu_relax(void)
 {
-	rep_nop();
+	native_pause();
 }
 
 struct getcpu_cache;
diff --git a/arch/x86/kernel/apic/io_apic.c b/arch/x86/kernel/apic/io_apic.c
index eebc360ed1bb..ba5a4ccda37a 100644
--- a/arch/x86/kernel/apic/io_apic.c
+++ b/arch/x86/kernel/apic/io_apic.c
@@ -1486,7 +1486,7 @@ static void __init delay_with_tsc(void)
 	 * 1 GHz == 40 jiffies
 	 */
 	do {
-		rep_nop();
+		native_pause();
 		now = rdtsc();
 	} while ((now - start) < 40000000000ULL / HZ &&	time_before_eq(jiffies, end));
 }
diff --git a/arch/x86/lib/delay.c b/arch/x86/lib/delay.c
index e86eda2c0b04..eb2d2e1cbddd 100644
--- a/arch/x86/lib/delay.c
+++ b/arch/x86/lib/delay.c
@@ -75,7 +75,7 @@ static void delay_tsc(u64 cycles)
 
 		/* Allow RT tasks to run */
 		preempt_enable();
-		rep_nop();
+		native_pause();
 		preempt_disable();
 
 		/*
-- 
2.49.0

