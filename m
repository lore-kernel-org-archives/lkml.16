Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B4219C54C
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 17:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743614705; cv=none; b=lm8Ptmo61+stmIW+XzLAXnW0hh/OgWZnE4u+/kKXOJYUzFbObjWybXmv+WI08D+9f6WsdfMMGd/mGuQ4r6XxMxtypCEy1MgPD5MZVpO8M0hCZLQRKl0t1iPEPbhKsnk1Tqqwb5mtpW1fQeD56LfltV7U7EZWrhHohoN5LNLMV0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743614705; c=relaxed/simple;
	bh=TgIr2NDKkj74x/2NbOGJikktGxZikty6LWZP3F1uGPU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uEILTGclnIfaRHbOp1PDRmU+kBZNCe4IzBUmAZRWqbsNIJThOKmITdMzKiRHlTf9rp3mMU5p4UHgwyC8uLP3uirWAVLFpO9HoryvqdffQ8TderKVEkEEqjkETC57T+HzuD4AHOu075n6Kh+djng914vK3NnU/10U3ZVcrEBPKl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com; spf=pass smtp.mailfrom=cloud.com; dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b=VgMaMrPA; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="VgMaMrPA"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so8510605e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 10:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743614701; x=1744219501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G+vmCFRBwsqvZP2d/t/KmjCWvMFBtPU1+nLgWVJPIwg=;
        b=VgMaMrPAH9O0nRDPCCcMccyM6jD4hTrwHnwSxEASFUkA+WjWyfC4gS1jG/EPvQmUgN
         o5ExZ+BfM03xq6ijh7WRT5NNEVPGBT0exPJBF0JJ5OzAv5Cmd6XKsy4pb/sTvnTp+w6e
         9WZHNUtBNARwy8Gq0pVpIJ9Bbpoc52NrfZz1M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743614701; x=1744219501;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G+vmCFRBwsqvZP2d/t/KmjCWvMFBtPU1+nLgWVJPIwg=;
        b=fVan/RGaImOhgfcl1AOz3I1U9ViFUrQBxmuN2aqZnWuOiOk1nK0A+nC7pLzz+Ps72L
         +1mY7i0hmInLYqN3TRextCPKbObDcLhaIM6GQa4OJP4g+VDpMRf53ATLdJp6HKdUVWhK
         4hEra1bRsViQJo7JVwXJMshGw8S3Sf1YVVTQzS7dRECm3YQf53oCBYC5MUViJuZY+Btb
         zZ23S1p8VrR33M00NnOwJzXPkolNkbR04tvUObvXrUcod9qyFNtysz03IgL3A4ouDyuA
         Wrvdawg/9cLpP8NYic0JSMNis5c8PjpBZZbW4CVgnKPEsuZyKEKYTtZMHjIO2YKeLpk+
         vBPA==
X-Gm-Message-State: AOJu0YwOUW4x2weXzP6jE2/ZJsm8VXMulDOBdQcNcjGlVxnVTl/VCF47
	8ZAIoXLbkhLLkP1opm33FoLaV6Y4tk29jji48xiSQx/piYc3kbZbmZ4aLEYnbZuSjI40XnM3nhE
	g4kY=
X-Gm-Gg: ASbGncurYJKc/kT1OpICrR7/stEWnn9qc2frmfKT/5TwS5IU+KFZlTtZ7xVTrbd/bU0
	N1n0mIHZRgPPaTSbgEBaiuNhpWwOhE3wynU1Qxic6MVR8KOF3B2x+NjlRICIeWBXFDj9MnpIwWL
	jyRLBZmCfBLH3/TudfrElGHksq9MyH6LBqsv3KTCSEHWTn9oInoOlf14hmvm9sW5r7eVRtESJZJ
	qVEmartxpL09g8YSre204J+dvb9plUu43kAzCJdgOTSMXe4ce2hy8L5EiHk6v7FpBu0YhZQBEAm
	ggvJRao/SIWlVk6zQrLy3nR4/Pb9jepZcAKpklzs6EmiD6/LIPKJvF8Yy0KGqgjArGPKpAuNAJL
	Y+Hf9Ezz1SMmNp2Rzeg==
X-Google-Smtp-Source: AGHT+IFVMVbp+Z6UWb19aspj30De+0ix7H7P9nLAnGm2POjhbpHWclm3cNODMyt3jprEFsvMCC3UcQ==
X-Received: by 2002:a05:6000:2401:b0:399:6d8a:3f with SMTP id ffacd0b85a97d-39c2e636a70mr410726f8f.27.1743614701339;
        Wed, 02 Apr 2025 10:25:01 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net. [92.26.98.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b66a8d4sm17424016f8f.45.2025.04.02.10.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 10:25:00 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v2] x86/idle: Remove MFENCEs for X86_BUG_CLFLUSH_MONITOR
Date: Wed,  2 Apr 2025 18:24:58 +0100
Message-Id: <20250402172458.1378112-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 7e98b7192046 ("x86, idle: Use static_cpu_has() for CLFLUSH
workaround, add barriers") adds barriers, justified with:

  ... and add memory barriers around it since the documentation is explicit
  that CLFLUSH is only ordered with respect to MFENCE.

This also triggered the same adjustment in commit
f8e617f45829 ("sched/idle/x86: Optimize unnecessary mwait_idle() resched
IPIs") during development, although it failed to get the static_cpu_has_bug()
treatment.

X86_BUG_CLFLUSH_MONITOR (a.k.a the AAI65 errata) is specific to Intel CPUs,
and the SDM currently states:

  Executions of the CLFLUSH instruction are ordered with respect to each
  other and with respect to writes, locked read-modify-write instructions,
  and fence instructions[1].

With footnote 1 reading:

  Earlier versions of this manual specified that executions of the CLFLUSH
  instruction were ordered only by the MFENCE instruction.  All processors
  implementing the CLFLUSH instruction also order it relative to the other
  operations enumerated above.

i.e. The SDM was incorrect at the time, and barriers should not have been
inserted.  Double checking the original AAI65 errata (not available from
intel.com any more) shows no mention of barriers either.

Note: If this were a general codepath, the MFENCEs would be needed, because
      AMD CPUs of the same vintage do sport otherwise-unordered CLFLUSHs.

Furthermore, use a plain alternative, rather than static_cpu_has_bug() and/or
no optimisation.  The workaround is a single instruction.

Use an explicit %rax pointer rather than a general memory operand, because
MONITOR takes the pointer implicitly in the same way.

Link: https://web.archive.org/web/20090219054841/http://download.intel.com/design/xeon/specupdt/32033601.pdf
Fixes: 7e98b7192046 ("x86, idle: Use static_cpu_has() for CLFLUSH workaround, add barriers")
Fixes: f8e617f45829 ("sched/idle/x86: Optimize unnecessary mwait_idle() resched IPIs")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Thomas Gleixner <tglx@linutronix.de>
CC: Ingo Molnar <mingo@redhat.com>
CC: Borislav Petkov <bp@alien8.de>
CC: Dave Hansen <dave.hansen@linux.intel.com>
CC: x86@kernel.org
CC: "H. Peter Anvin" <hpa@zytor.com>
CC: linux-kernel@vger.kernel.org

v2:
 * Fix the same pattern in mwait_idle() too
 * Expand on why we're not using a general memory operand.
---
 arch/x86/include/asm/mwait.h | 11 +++++------
 arch/x86/kernel/process.c    | 10 ++++------
 2 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/arch/x86/include/asm/mwait.h b/arch/x86/include/asm/mwait.h
index ce857ef54cf1..108d25bd4597 100644
--- a/arch/x86/include/asm/mwait.h
+++ b/arch/x86/include/asm/mwait.h
@@ -116,13 +116,12 @@ static __always_inline void __sti_mwait(unsigned long eax, unsigned long ecx)
 static __always_inline void mwait_idle_with_hints(unsigned long eax, unsigned long ecx)
 {
 	if (static_cpu_has_bug(X86_BUG_MONITOR) || !current_set_polling_and_test()) {
-		if (static_cpu_has_bug(X86_BUG_CLFLUSH_MONITOR)) {
-			mb();
-			clflush((void *)&current_thread_info()->flags);
-			mb();
-		}
 
-		__monitor((void *)&current_thread_info()->flags, 0, 0);
+		const void *addr = &current_thread_info()->flags;
+
+		alternative_input("", "clflush (%[addr])", X86_BUG_CLFLUSH_MONITOR,
+				  [addr] "a" (addr));
+		__monitor(addr, 0, 0);
 
 		if (!need_resched()) {
 			if (ecx & 1) {
diff --git a/arch/x86/kernel/process.c b/arch/x86/kernel/process.c
index 91f6ff618852..a1a41b3d94d2 100644
--- a/arch/x86/kernel/process.c
+++ b/arch/x86/kernel/process.c
@@ -907,13 +907,11 @@ static __init bool prefer_mwait_c1_over_halt(void)
 static __cpuidle void mwait_idle(void)
 {
 	if (!current_set_polling_and_test()) {
-		if (this_cpu_has(X86_BUG_CLFLUSH_MONITOR)) {
-			mb(); /* quirk */
-			clflush((void *)&current_thread_info()->flags);
-			mb(); /* quirk */
-		}
+		const void *addr = &current_thread_info()->flags;
 
-		__monitor((void *)&current_thread_info()->flags, 0, 0);
+		alternative_input("", "clflush (%[addr])", X86_BUG_CLFLUSH_MONITOR,
+				  [addr] "a" (addr));
+		__monitor(addr, 0, 0);
 		if (!need_resched()) {
 			__sti_mwait(0, 0);
 			raw_local_irq_disable();

base-commit: acc4d5ff0b61eb1715c498b6536c38c1feb7f3c1
-- 
2.39.5

