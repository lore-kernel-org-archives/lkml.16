Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266FC4315F
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 07:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743663900; cv=none; b=lAy551q+fKlpswDc0zYfYyL0JazCcmnNX+T5sanvpNYwCIag/hD5aczqRP9SFmzZT2A1Q+uFvoVZyU7hTgsrb32KmvHK+8woE4RZm/LVjrdZJoLeFZjqoXY3GHayMtxKLDPMXovHQvyNLFG9fZo7dr8ZeFIRra0WhWQqu+2G/gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743663900; c=relaxed/simple;
	bh=qAMVftuvTioi0sDQPfPaDU8gUE2J9SoKnK+nb4/KLhg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YmN2KqFYvIr3LJa0gqkMXhcnCwH4Uo+Zm1QuiRgfKjZwelff596doeSXY14JYFOcvLQlFNWd5Qqzp1PlYgFuC/qiy1Rt+Ej1OAqAkS44/7a+VLim/Nc4RxRKAhNbiVZckBtR5GULV34EBliTNgMofpSZSSFOrwt/4KbUSOo3c4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lsEdRX1n; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lsEdRX1n"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5ed43460d6bso891479a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 00:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743663897; x=1744268697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MrF8MRS6l1LfsFdDql+P3vqT33uif0E6R/hk0Jh7V/o=;
        b=lsEdRX1nLohlnEjPy/8DdaERKKohhl1Hu5NyrFH9o3wu6Fzd2yq0nhz+/w8ZyWWbT4
         KSD0BRTNiluSg+8Zko1DRkJA9JYyWURAqaucgNz+3Gv0LfYAzqsYlV580FOuhwicB2zU
         X8A8thYBPgqBgyW1ixsl0TPcGN12IgTvjDCIdeegqw0pHpZHG/kF+goyg3eoOAnkDtPj
         Kbrg0nF0k8vqTreIYWJC5MwP91LHFuwqJDNegYigCLjukI7ZpTnE24cJvsOX1XGtB5MW
         9xzII8zjyj95V9OZsXuLoL8BKkJr5HqY92XiburN7TGBdzw2mJzMqcgC9Bsgh/oztKXv
         9JLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743663897; x=1744268697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MrF8MRS6l1LfsFdDql+P3vqT33uif0E6R/hk0Jh7V/o=;
        b=sglqwVQpuGNkP7N0fAiOZlsQCcvzWwR2IjrAwS/PQsah6HGt47elu0Vf0Z83dt8CKh
         kYDWX4T9OOdmpUblsdoGOTQl5q+51qroWU8uWgw5S0P22+74HQm4/JJECGwkExWUharI
         9dI1CLBK/eZWNbFzICMIxbRZRg1Z00x4U/3gUN0TdP9rU5GnwsOcde7+LQpid+rDJlMW
         zcWSUniaxSXK5QWupF1DbF/B19u22rqiqa1yTpvbTcySB1jb2N0DdXUVvAKDPD0z3k35
         k3uZ44154AyWFYo9Diun1aWnyyTOI5TwiWg8UBS80IYArxv/aDmfZzvCHNJhES5wl8EH
         xa7g==
X-Forwarded-Encrypted: i=1; AJvYcCXhobUNyoYGiCxFgWyyHRwwTkYUx4AoiozKmM3HHsC9q31I37+mAVoQrkpT3ZnITP7+Mhpsb0iYoYTD8Dw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyF/wz/rDnhBn26rRVPGAtVe6ZRrqH5IeHWm4UJFBv6wonqBOy
	MfZeWRbpT4tp00QhhDWC8UqQ9yZd74O2gUZcijk5EeFnHEMnSMXl
X-Gm-Gg: ASbGncsNLd2uGc25LDnw12NgzJpvOwNMudmIll7p2Y9k1zOZtc1hBOXzDKKtA6jxZRn
	BbKwW6QV10YhLQ864k0LslEfD+AFwG/cgvUtwWGfvpgvSl6fyMNtYSk5wxGR+lt9stsUCQuo7DM
	UnQd8BTdrGFPeZNpEez073Xtw6LCDiebj+XNYxbgZrQfZtWJNV+rm/P1Ju01LvoZcNNuiutOfcu
	x+c9dgPmsK8aKl7F7PUen/h6/9CPGPFbpXlw6kDA3TQzQI0tnBAEX8kSj4inwIQWOje/Ap8PJmd
	caKYpSqWz9PGVrxL9E66NdefX8O7iKKkcFeX
X-Google-Smtp-Source: AGHT+IFfGhd9UT+NWtQKYZrH9V0xiMNQBBL9loil5YmYLR5emOkwZ3bMYT1lUm9lSLvzrDepUKth1Q==
X-Received: by 2002:a17:907:3e1d:b0:ac3:8537:903c with SMTP id a640c23a62f3a-ac738bc07d7mr1671280066b.37.1743663897280;
        Thu, 03 Apr 2025 00:04:57 -0700 (PDT)
Received: from fedora.. ([193.77.86.199])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7bfe5d44dsm47098766b.13.2025.04.03.00.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 00:04:56 -0700 (PDT)
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
Subject: [PATCH -tip] x86/idle: Work around LLVM assembler bug with MONITOR and MWAIT insn
Date: Thu,  3 Apr 2025 09:04:37 +0200
Message-ID: <20250403070453.214190-1-ubizjak@gmail.com>
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

Use instruction mnemonics with implicit operands when LLVM assembler
is detected to work around this issue.

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
 arch/x86/include/asm/mwait.h | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/arch/x86/include/asm/mwait.h b/arch/x86/include/asm/mwait.h
index 5141d2acc0ef..d956d1be4873 100644
--- a/arch/x86/include/asm/mwait.h
+++ b/arch/x86/include/asm/mwait.h
@@ -25,9 +25,18 @@
 #define TPAUSE_C01_STATE		1
 #define TPAUSE_C02_STATE		0
 
+#ifdef CONFIG_LD_IS_LLD
+# define ASM_MONITOR	"monitor"
+# define ASM_MWAIT	"mwait"
+#else
+# define ASM_MONITOR	"monitor %[eax], %[ecx], %[edx]"
+# define ASM_MWAIT	"mwait %[eax], %[ecx]"
+#endif
+
 static __always_inline void __monitor(const void *eax, u32 ecx, u32 edx)
 {
-	asm volatile("monitor %0, %1, %2" :: "a" (eax), "c" (ecx), "d" (edx));
+	asm volatile(ASM_MONITOR
+		     :: [eax] "a" (eax), [ecx] "c" (ecx), [edx] "d" (edx));
 }
 
 static __always_inline void __monitorx(const void *eax, u32 ecx, u32 edx)
@@ -41,7 +50,7 @@ static __always_inline void __mwait(u32 eax, u32 ecx)
 {
 	mds_idle_clear_cpu_buffers();
 
-	asm volatile("mwait %0, %1" :: "a" (eax), "c" (ecx));
+	asm volatile(ASM_MWAIT :: [eax] "a" (eax), [ecx] "c" (ecx));
 }
 
 /*
@@ -92,7 +101,8 @@ static __always_inline void __sti_mwait(u32 eax, u32 ecx)
 {
 	mds_idle_clear_cpu_buffers();
 
-	asm volatile("sti; mwait %0, %1" :: "a" (eax), "c" (ecx));
+	asm volatile("sti\n\t"
+		     ASM_MWAIT :: [eax] "a" (eax), [ecx] "c" (ecx));
 }
 
 /*
-- 
2.49.0

