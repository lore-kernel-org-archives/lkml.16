Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D54228B514
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 05:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747978347; cv=none; b=J+OEuoEMYGsO51mZOgtSerV/97mxpg5rPgwETQ7MmvygoLKgf+b/L1LrMJ4VMztMTPDX7nDeqY27IdeFTGdl85m2v2kEr9B3y1k9PvTRtOe6PaCm/+1tOK6SorRgoZJbi4OeeyW6dazQaVmm2layDVjuI6zMtaIkhV26n4/A9z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747978347; c=relaxed/simple;
	bh=fgM4DxuXyswQwWUgiwSMnk3UHniH160971fZistB2MI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nkXTc7e/hB+zbJ8f3JiYHcLjTgGKw6V40M2Z7jutgGN21UfOT8Z53heTQBu19vwiOH2eHVAefQe0U9S2uGuj78yF5ZPuffw21422kQXA4jUE0M89hn2kHATMzB9wVyUaH3DC2/5u10xj6BMYP65LPEFHtYTbwieBXvGiDqmMdoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=lhPSdUlZ; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="lhPSdUlZ"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-742b614581dso7273837b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 22:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747978345; x=1748583145; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SRVZyg5TbDWDMLZOF7W+PGgxfQ2OnZA5ElwRPiEh+VA=;
        b=lhPSdUlZwvTIBJeaW9rgffp82ffsp3MMGZ8Ib75JxKRSw1p882QhJoPNOfRs6nieL+
         s99ez/+bzxjqEXTSqMVUJviF6O5X5Edlz9ScG7vMs4GZErHk1t31FV9iIFp9mfDCq2Pp
         1gyLK1M4SraaTlZRaH5CR2a40qFU6NvquK0aAOYNqYjwiXy/+tpwV3hKnqdIoz53zW62
         leQWnYIC30YO13DKwmKr6ExM2OvxtJ53j2+olJAuAtWSrPLpqPTJosWVaf7e2th46vsd
         sd1a1Vpa95W3xalvmvImNW7XxlsK3+o+znIPIyZdBzZh//x+TKe3fmEbWXIDJPZSkh0R
         +v8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747978345; x=1748583145;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SRVZyg5TbDWDMLZOF7W+PGgxfQ2OnZA5ElwRPiEh+VA=;
        b=jGFhq0LpgBCX/RMM3kOOFtqF1iDIaSDaOjLcX/yPgk5Idn7LMhSL1yihQ+IsqTpHz5
         0m8b2cxYab7bQgqG5eC+G0jFpf9ObpiKSNb21BCWVBYZhTu/DKFdLwaByqGsBVtUkIBA
         9fI5JEnSwDxIJ5LwVN4bVJmpkGxiII0z86AO3mzpFWgjncEgcwYySfK2H06+AEjxustz
         FlnGNlqGSYFdrHbTyevS6+PqEyZY6GqDJRXFUup3JgnbiFqg0py51LFtxknJFz+2LaNV
         jv0A+bw0cmfucLEaC0MTQWLy/JJEshhYWAzCooHpyMLHm9moWWagU6vPpnJLbomBlnf9
         GE7g==
X-Gm-Message-State: AOJu0YynQuybUnO1uLUu/hduEh/WvjJ6VyfKB+/CbSLVRfm7WTeRgGJt
	Ncvwv2Ol9qIOmhCVdXmHQQqG2z6782Y3wPddPZxMQCiK1jldv9z1FItTL+csv93fwEA=
X-Gm-Gg: ASbGnctr9rD1iWhPrOu4I42qRb+h/8buaWCh5YTEDA82dFHi0z7BC3f2UMTutOHWDJB
	4hzvuOkgSyheToQS1p1QzUC0ZnQn/5Lv8HkXcp7NoF49BxGIfOfVfpog1kVdZ8Suzz+ga8XPfEU
	z4k822WdKzKTXGlg578Iwc69DgpzgnDpFHO40B8uje3WQNwW5btoQOSBkQAQYpQvg5Hgpl5m/cX
	H+ZvsnTE6XUS4zLAiMt2slHaIHLtlEACgmpD/IqmFf5MmCDOCSXtpeCV3tXdFH/ifT51PHAqhSP
	/34WPg+bzM8l+W2BrFOdI2SMBlKIAi+sUswklxiaujAyetQjvGlDOxoqhSSNtQ==
X-Google-Smtp-Source: AGHT+IGgDsB+8A3CR4+XkLmuNbK4RRzT3we3lC5k1xa9cQRvQgCx14SHfbPxiY0t9umJbxGQZcGV5Q==
X-Received: by 2002:a05:6a20:cfa2:b0:204:4573:d856 with SMTP id adf61e73a8af0-216fba27c2cmr39932928637.4.1747978345559;
        Thu, 22 May 2025 22:32:25 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a982a0a4sm12474336b3a.101.2025.05.22.22.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 22:32:25 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 22 May 2025 22:31:25 -0700
Subject: [PATCH v16 22/27] riscv: enable kernel access to shadow stack
 memory via FWFT sbi call
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-v5_user_cfi_series-v16-22-64f61a35eee7@rivosinc.com>
References: <20250522-v5_user_cfi_series-v16-0-64f61a35eee7@rivosinc.com>
In-Reply-To: <20250522-v5_user_cfi_series-v16-0-64f61a35eee7@rivosinc.com>
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
 arch/riscv/kernel/asm-offsets.c |  6 ++++++
 arch/riscv/kernel/head.S        | 27 +++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
index f33945432f8f..91738394f834 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -514,4 +514,10 @@ void asm_offsets(void)
 	DEFINE(FREGS_A6,	    offsetof(struct __arch_ftrace_regs, a6));
 	DEFINE(FREGS_A7,	    offsetof(struct __arch_ftrace_regs, a7));
 #endif
+#ifdef CONFIG_RISCV_SBI
+	DEFINE(SBI_EXT_FWFT, SBI_EXT_FWFT);
+	DEFINE(SBI_EXT_FWFT_SET, SBI_EXT_FWFT_SET);
+	DEFINE(SBI_FWFT_SHADOW_STACK, SBI_FWFT_SHADOW_STACK);
+	DEFINE(SBI_FWFT_SET_FLAG_LOCK, SBI_FWFT_SET_FLAG_LOCK);
+#endif
 }
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 356d5397b2a2..7eae9a172351 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -15,6 +15,7 @@
 #include <asm/image.h>
 #include <asm/scs.h>
 #include <asm/xip_fixup.h>
+#include <asm/usercfi.h>
 #include "efi-header.S"
 
 __HEAD
@@ -164,6 +165,19 @@ secondary_start_sbi:
 	call relocate_enable_mmu
 #endif
 	call .Lsetup_trap_vector
+#if defined(CONFIG_RISCV_SBI) && defined(CONFIG_RISCV_USER_CFI)
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
+#endif
 	scs_load_current
 	call smp_callin
 #endif /* CONFIG_SMP */
@@ -320,6 +334,19 @@ SYM_CODE_START(_start_kernel)
 	la tp, init_task
 	la sp, init_thread_union + THREAD_SIZE
 	addi sp, sp, -PT_SIZE_ON_STACK
+#if defined(CONFIG_RISCV_SBI) && defined(CONFIG_RISCV_USER_CFI)
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
+#endif
 	scs_load_current
 
 #ifdef CONFIG_KASAN

-- 
2.43.0

