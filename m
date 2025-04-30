Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F14280337
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 00:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745972258; cv=none; b=SN8FWUwvWcIKofMu5v+4Z+ILaF4tksEsJOlPkgiWGap4XFtxCKi/k7GxQKTSOCo8IVWPU0jDFOPH0wiml5pVHoGsKN7yggo7fDG8qkyqsPicfoSEGn1YTIurdvQx90rYH7ivvrKDbR49+pc008WY7fv5XLEmLWgXFx6rSydRrvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745972258; c=relaxed/simple;
	bh=HeEhrFdxIZkQYvMh1TS0vNcMiKQtB2zGzKWdCZ88v3U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eobffsyw3xx4+I/ecuvKbZJkvVHvBqbPdmMneoDUh59xU1hiYUDcYdZKschBciaB1xxZTXMSDoGFH31FBfdsSqN4qiG1I58xBdTGxb9/RL18sn7vLjSdH1yPTnNfD9eN2RregBIPrPsc20qEwNlHIyoDa/ZGdxAry3Zp0M/q6UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=cu1YOhGh; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="cu1YOhGh"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-224019ad9edso100161725ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 17:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745972256; x=1746577056; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3X/LDbKk/o1pYr+8FDgOywQj6F1nn1j7yhy5R3Qqub8=;
        b=cu1YOhGhGwjH8PrOO65W05sud1FjY1ZHyiqzPu2np4Y7UqtTcGj2wC2MeFGtWzOmlX
         um5FYNGCKHLPOIysEypnE4dAnUDbpHXQDdgsrwZTbfCGFtEtZfWE9sVoB0mn2rlPZOZe
         aE63RZJIreHRYpOwcm+YbSA93pBkusxCp2EeVCpbs5vnRCs+YhpNPytZiUiZTpBQOOe9
         aUaJjCob8Ot2Ko59RZZiFc2VzKTWQXlnd6KXnvGQ4HNe1yAIyxP+F6JR8z4X03Ly1pbh
         YUCtIob/gt6kmPD8s+liNOhMjhRL8u7mFR7us/c5xCnwB98Rwvjwj1IdFtXXPsHqTxD6
         JduQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745972256; x=1746577056;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3X/LDbKk/o1pYr+8FDgOywQj6F1nn1j7yhy5R3Qqub8=;
        b=OO4+npHbrcClvih6N1yhfRyLqwFsekX54xBfkkXOi0xD0R6pR8omW8JYx82e8h5mvC
         MgkZYfWyUTAEiGl2+1QC0DQxvi01HRmRnlFT6FwqAS7PnTj7nZEHCww8/+bmKlULYG3Z
         seSaKRkt7vxr8mru1AkmNoKLFE39ZL6dFuxJ4252dq4JlnryJbA1kZuRswREmWE1qgyF
         Wrrnn4IPXrQpjqTlpAUIme+6TKwYTkTnipC4DWK4qYXaSofb4V6dLTw3gBOGnUmhcrmR
         /lwJAvDNX6yUaC7rNEfvKq+nP6czb7Mx8z5ER2ZVqV9UmpD6qQLlHNWwL0GBGtkC/c4e
         6bIw==
X-Gm-Message-State: AOJu0YyIexJj0swdhRvd0g9CT1FEmA6l6jKlj3jJF0kyML3SQ3TqZZSc
	aWo2PkCtwM6CF9qOFAIOMRyT/95vd/B0MqPjBUZLHfVdRrAMvzbLu7x5RoGsBg8=
X-Gm-Gg: ASbGncvV645dfl1B/ajg0/zNlH2N1e8eWernSvT3nwWBxUMkAx6PYq3NmE1q8htE7PP
	SUc8CQ06/H2Sg+LpF2xzIhdHKSBqQPfeHrUF2gBWzpNWr/L/dr8IJLApIai4XfI7f/j6iPB340u
	hiv4KVgo1lIxCPOhAFDw95hBu6UZbgyWm5OO9KosEnWzcP1CKTt+U5b4nvsqe88kOO5uVXbO4vg
	IILHD0Y00604yagqCiM6I42cGSltaIXrj0kEdAbyQ183ks/zE2+Yh7Wh6pnp2SWo/PsOUKjSS62
	4qyy4/9chpDarzVzHr1Vg6c8dHjmdO++GhVvaVccGz02FeKzzLI=
X-Google-Smtp-Source: AGHT+IHHiQ90NWkmdJz7M9swMrFnKHR4s4NkPbBiQVDZe2SW7TM+doWonipVtWWfmLVLaK7GwA0N+Q==
X-Received: by 2002:a17:902:d488:b0:22d:e695:6e09 with SMTP id d9443c01a7336-22df359c71fmr19979435ad.34.1745972256086;
        Tue, 29 Apr 2025 17:17:36 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4d770d6sm109386035ad.17.2025.04.29.17.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 17:17:35 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 29 Apr 2025 17:16:39 -0700
Subject: [PATCH v14 22/27] riscv: enable kernel access to shadow stack
 memory via FWFT sbi call
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-v5_user_cfi_series-v14-22-5239410d012a@rivosinc.com>
References: <20250429-v5_user_cfi_series-v14-0-5239410d012a@rivosinc.com>
In-Reply-To: <20250429-v5_user_cfi_series-v14-0-5239410d012a@rivosinc.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Christian Brauner <brauner@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Oleg Nesterov <oleg@redhat.com>, 
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, rust-for-linux@vger.kernel.org, 
 Zong Li <zong.li@sifive.com>, Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0

Kernel will have to perform shadow stack operations on user shadow stack.
Like during signal delivery and sigreturn, shadow stack token must be
created and validated respectively. Thus shadow stack access for kernel
must be enabled.

In future when kernel shadow stacks are enabled for linux kernel, it must
be enabled as early as possible for better coverage and prevent imbalance
between regular stack and shadow stack. After `relocate_enable_mmu` has
been done, this is as early as possible it can enabled.

Reviewed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/kernel/asm-offsets.c |  4 ++++
 arch/riscv/kernel/head.S        | 23 +++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
index f33945432f8f..7ab41f01aa17 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -514,4 +514,8 @@ void asm_offsets(void)
 	DEFINE(FREGS_A6,	    offsetof(struct __arch_ftrace_regs, a6));
 	DEFINE(FREGS_A7,	    offsetof(struct __arch_ftrace_regs, a7));
 #endif
+	DEFINE(SBI_EXT_FWFT, SBI_EXT_FWFT);
+	DEFINE(SBI_EXT_FWFT_SET, SBI_EXT_FWFT_SET);
+	DEFINE(SBI_FWFT_SHADOW_STACK, SBI_FWFT_SHADOW_STACK);
+	DEFINE(SBI_FWFT_SET_FLAG_LOCK, SBI_FWFT_SET_FLAG_LOCK);
 }
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 356d5397b2a2..d47876eca637 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -15,6 +15,7 @@
 #include <asm/image.h>
 #include <asm/scs.h>
 #include <asm/xip_fixup.h>
+#include <asm/usercfi.h>
 #include "efi-header.S"
 
 __HEAD
@@ -164,6 +165,17 @@ secondary_start_sbi:
 	call relocate_enable_mmu
 #endif
 	call .Lsetup_trap_vector
+	li a7, SBI_EXT_FWFT
+	li a6, SBI_EXT_FWFT_SET
+	li a0, SBI_FWFT_SHADOW_STACK
+	li a1, 1 /* enable supervisor to access shadow stack access */
+	li a2, SBI_FWFT_SET_FLAG_LOCK
+	ecall
+	beqz a0, 1f
+	la a1, riscv_nousercfi
+	li a0, CMDLINE_DISABLE_RISCV_USERCFI_BCFI
+	REG_S a0, (a1)
+1:
 	scs_load_current
 	call smp_callin
 #endif /* CONFIG_SMP */
@@ -320,6 +332,17 @@ SYM_CODE_START(_start_kernel)
 	la tp, init_task
 	la sp, init_thread_union + THREAD_SIZE
 	addi sp, sp, -PT_SIZE_ON_STACK
+	li a7, SBI_EXT_FWFT
+	li a6, SBI_EXT_FWFT_SET
+	li a0, SBI_FWFT_SHADOW_STACK
+	li a1, 1 /* enable supervisor to access shadow stack access */
+	li a2, SBI_FWFT_SET_FLAG_LOCK
+	ecall
+	beqz a0, 1f
+	la a1, riscv_nousercfi
+	li a0, CMDLINE_DISABLE_RISCV_USERCFI_BCFI
+	REG_S a0, (a1)
+1:
 	scs_load_current
 
 #ifdef CONFIG_KASAN

-- 
2.43.0

