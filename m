Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75912CA6
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 09:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743671876; cv=none; b=FP4r8qMxioawZR2ym2uP+U7UckAD/rkEUokFrdg1ad05V022RVnKivOYQvTpxKZ7SmG6h5VgrIyfY4XVaQjXcCtlln1r7sFMOSNUX5r8LuvDF/s8nYB7r9xAVnmAOxrCizDg9U+2+eFaCEjeBsfMDVoMRATUPPB5N67m1gYuKjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743671876; c=relaxed/simple;
	bh=jQ9+fwzuNf6jX4e7aSVFKBcYVb+Tg7FEbr1mLvUlUL4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aeJ//5oZKgiMITVePERi5oyCP1FItCfs095+RM4oNFDaHVBa4SvF6lUSP86LyQ+f3mgG7vwPKZqR+KJ1LRC249OYGkBzYrlAy5QiUTtMps4v0IMP52nmuTvBjL0teVH6WPDXh6nq7yT9TB9mj6l60hhdVtpcXUEDfGjhHj9sEyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mJzfkNvr; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mJzfkNvr"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ac2af2f15d1so92774166b.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 02:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743671873; x=1744276673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5xX40rL3gdXNZ4i7gN9zf1Ts2gTH5EwVkfVVyu2Wjqk=;
        b=mJzfkNvrGP9/4L3INQd0kCclXxl9uT0NDmKhhY39DZiFw5J3aYfQrI7og0wdC7wAO/
         JMMTN7lW32rldPv0HvcWi43S8F2+gmPU8KSzSXEgyKVE8Yv06iskbDdEuSqd8qlTf805
         hm612P/cTGoGqEx+AMidWpjjt/B4UcTvYZpZaXUf5wDSNCj8hfTKiLgotxeb+aowhNBB
         NDj2jTp/JS1HzOSgX2DFMlXNP2R6501ZREEZKiYx0HwmPSa5Tw/fkg2wSs1ESDVj3Woi
         6evKNSBjXcEbhbbgEunYPQWyOYU8nd+ibG9WPO4sF1vufKRa+TJ6pyC+QNWbRxrBbr9d
         QD6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743671873; x=1744276673;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5xX40rL3gdXNZ4i7gN9zf1Ts2gTH5EwVkfVVyu2Wjqk=;
        b=wBkQuTwXRmr1PSAJ31FxN8bs98npkRY/d4/whrgis+sDcmYtw8wR4t/ekdUaGugZAl
         hcpKji0nnvcYlbDbVjaz+WBH20h/sAOypu+3LbyUf6h58VdCM73Ddyt/WA/DEOVDYqFI
         pIWwj6GoKA9lflzeZzSByDy6oOTKLc7tdI75GK1KzWW62IhVKr/A5SwmhDsJuuqCXDR5
         JUO6IOF7NEweqDIMI4e1REE6FLWD8NiszTi6aaaicA1MpOyxxVE4RMilC/8URMGn0ix6
         4qp+7BD2ZZ/mcyysVxPK3GLgqU58+h1RByN2oVSMMkPYiWIFE+/4heHvt/f6uMkt6FHV
         zE3A==
X-Forwarded-Encrypted: i=1; AJvYcCV6s9AGtAqurqX1e5MdU1meiuaG+icHFDlC8dYpvKarahm2pipRF8lLhz/bPx/KGpJRsAWZlLKtyUhwBlw=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv2Tqoob6z+FxVGuZQ6YH0vRx9tKxNptCNgj8+JVnB8bjhyqsw
	QwqUWpJngtaoO3G3L4d7HgvHYn87KIhQkeI+dnxdvxFxJ2FXKpvb
X-Gm-Gg: ASbGncuXGXVmw58i2ET20zMvBL77I6X7EgsoNyA5Co8/VdhQhTrTygKQlpqOzKHkOkt
	C05kNgF9ReHDh+M94MuUsz+p3xAKiJcOurMdf67uph63f2gnHRHYfVX6bRwRi8FvFSnQK1nLPqn
	ZbqJWbDUZkeK7/hFv7ZP+JHmQ6DXNfc2VFa8c83tXERIkFJGFpwGGT8xZm6g3BgT1vgTypx8VQY
	lJRUDMOHiz4ADXQLsqu1ekzHpXLXjXkcwxyM0XlBEqYJhq5f/q84hEPzr4u+vzI55OVkoqcjnvb
	+/JT9GhntXBMzW6htHlv3/tR+cx6QjW6LF+m
X-Google-Smtp-Source: AGHT+IGh+ohI4v3lzWYYyCCrY7XRuOqkndGRO+CJ1kxxTRvEMgPK9ymsjIO7FRJTXWjM6veVku0PYA==
X-Received: by 2002:a17:906:6a1c:b0:ac6:e33a:6a0d with SMTP id a640c23a62f3a-ac7a1a1d5d4mr618022466b.55.1743671872829;
        Thu, 03 Apr 2025 02:17:52 -0700 (PDT)
Received: from fedora.. ([193.77.86.199])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7bfee25fesm61790866b.77.2025.04.03.02.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 02:17:52 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH -tip v2] x86/idle: Work around LLVM assembler bug with MONITOR and MWAIT insn
Date: Thu,  3 Apr 2025 11:17:19 +0200
Message-ID: <20250403091737.344149-1-ubizjak@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

LLVM assembler is not able to assemble correct forms of MONITOR
and MWAIT instructions with explicit operands:

  error: invalid operand for instruction
          monitor %rax,%ecx,%edx
                       ^~~~

Use instruction mnemonics with implicit operands to
work around this issue.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Fixes: cd3b85b27542 ("x86/idle: Use MONITOR and MWAIT mnemonics in <asm/mwait.h>")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202504030802.2lEVBSpN-lkp@intel.com/
---
v2: Use instruction mnemonics with implicit operands.
---
 arch/x86/include/asm/mwait.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/include/asm/mwait.h b/arch/x86/include/asm/mwait.h
index 5141d2acc0ef..8f2cfc9cc3d8 100644
--- a/arch/x86/include/asm/mwait.h
+++ b/arch/x86/include/asm/mwait.h
@@ -27,7 +27,7 @@
 
 static __always_inline void __monitor(const void *eax, u32 ecx, u32 edx)
 {
-	asm volatile("monitor %0, %1, %2" :: "a" (eax), "c" (ecx), "d" (edx));
+	asm volatile("monitor" :: "a" (eax), "c" (ecx), "d" (edx));
 }
 
 static __always_inline void __monitorx(const void *eax, u32 ecx, u32 edx)
@@ -41,7 +41,7 @@ static __always_inline void __mwait(u32 eax, u32 ecx)
 {
 	mds_idle_clear_cpu_buffers();
 
-	asm volatile("mwait %0, %1" :: "a" (eax), "c" (ecx));
+	asm volatile("mwait" :: "a" (eax), "c" (ecx));
 }
 
 /*
@@ -92,7 +92,7 @@ static __always_inline void __sti_mwait(u32 eax, u32 ecx)
 {
 	mds_idle_clear_cpu_buffers();
 
-	asm volatile("sti; mwait %0, %1" :: "a" (eax), "c" (ecx));
+	asm volatile("sti; mwait" :: "a" (eax), "c" (ecx));
 }
 
 /*
-- 
2.49.0

