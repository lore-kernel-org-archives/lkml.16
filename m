Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602D11EF37A;
	Thu, 10 Apr 2025 15:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744299966; cv=none; b=k/x/5k9GNRHyRU8n+a2kUZbGi4hxGHmN+DgKo2M1ezApsvau0/+wmfVvNo+OAa1CVCnNizdsdtwqSps7UoAkIXcpyR9wOcO6oZwUXd/DFYiarIRWNxf49vpFYImEtLqD3wPwqIvFDhk542+IIEuTdbN++V9crgnikZDwXV0xwC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744299966; c=relaxed/simple;
	bh=mBWPzY/oLlYlxt7dU7C0mAUnfYylWWSdNqiv95dvA6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mJLQ7Fmnj93VRibazoJVOVJDcLcHCi1k6FMcif2fhHo7BFQLXhV9jnCzbn8iNH6ifvp96RKjtaxp9VCltGrRj2U7jUWe0bBY28/bsbBHHLTMDceJYoef/d7vVIowaY3Pu/vfSPDG6MCKkbvEtqa/V9eCYCM3Kkzl9DcofjH+lns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=LkUsOMU7; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="LkUsOMU7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=pFkrBvG2mx6ZEqS42jE/fH2ceu93D90WMLv65S7BVO8=; b=LkUsOMU7ZWY+tIv+8a1CPZDDY8
	cGEbYoC9abcvy9O59WWyA7P4SW1tznFe9Oac4TTqyongaPq1nsITGmh9lJhrfdVBdr2t9k6nhD4UW
	V83vZ8EnZoIHbGQJqOS5alfOpmKCSUevQLwxsjWB0YVd8/0VOimeE5/hBwTlP+P9fhUR8mfzwk/XE
	bdTNAvD5FnxxYZGFmTZIun7WO2dXqGlOWW695AKLt0tCsgNciYgOJyFb6SrKk/k1LTqNsaj9ybMoK
	Ty9lJlqV+o63/YlRznMFuJ8mU8bbwx8PIXlBbccMbWlwzqzX8utZg+PbJE36u+EqMyuZA4nIvvVXh
	s+tQAhFA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2u6H-000000035Qr-0ciZ;
	Thu, 10 Apr 2025 15:45:57 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id F25F03003FA; Thu, 10 Apr 2025 17:45:56 +0200 (CEST)
Date: Thu, 10 Apr 2025 17:45:56 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: =?utf-8?B?UGF3ZcWC?= Anikiel <panikiel@google.com>
Cc: Sami Tolvanen <samitolvanen@google.com>, Kees Cook <kees@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Alice Ryhl <aliceryhl@google.com>,
	Nathan Chancellor <nathan@kernel.org>, x86@kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Josh Poimboeuf <jpoimboe@redhat.com>
Subject: [PATCH] objtool: Detect __nocfi calls
Message-ID: <20250410154556.GB9003@noisy.programming.kicks-ass.net>
References: <20250410115420.366349-1-panikiel@google.com>
 <20250410123602.GZ9833@noisy.programming.kicks-ass.net>
 <20250410124526.GB9833@noisy.programming.kicks-ass.net>
 <CAM5zL5okN67bsTs6ZodcJd45zQ_BP+ruUwOkPMY97Snma0ugzQ@mail.gmail.com>
 <20250410132522.GD9833@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410132522.GD9833@noisy.programming.kicks-ass.net>

On Thu, Apr 10, 2025 at 03:25:22PM +0200, Peter Zijlstra wrote:

> I should get objtool to warn about those. They undermine the point of
> CFI.

---
Subject: objtool: Detect __nocfi calls

Detect and WARN about no_sanitize(kcfi) indirect calls.

Apparently there were a few in some Rust 'core' that got included in the
kernel and things went *bang*.

This is not a supported form for kernel code. So detect and warn about
it.

Adds an annotation for the two cases where we have to live with them:

 - EFI stubs;
 - kexec handover.

Notably, EFI calls fully disable IBT, as such using runtime EFI services
is a significant security issue. If you can exploit the kexec handover,
you get to keep it.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
diff --git a/arch/x86/kernel/machine_kexec_64.c b/arch/x86/kernel/machine_kexec_64.c
index cc73f9708464..67ba0db92272 100644
--- a/arch/x86/kernel/machine_kexec_64.c
+++ b/arch/x86/kernel/machine_kexec_64.c
@@ -442,6 +442,7 @@ void __nocfi machine_kexec(struct kimage *image)
 
 	__ftrace_enabled_restore(save_ftrace_enabled);
 }
+ANNOTATE_NOCFI_SYM(machine_kexec);
 
 /* arch-dependent functionality related to kexec file-based syscall */
 
diff --git a/arch/x86/platform/efi/efi_stub_64.S b/arch/x86/platform/efi/efi_stub_64.S
index 2206b8bc47b8..2bee139ae1ee 100644
--- a/arch/x86/platform/efi/efi_stub_64.S
+++ b/arch/x86/platform/efi/efi_stub_64.S
@@ -11,6 +11,7 @@
 #include <asm/nospec-branch.h>
 
 SYM_FUNC_START(__efi_call)
+	ANNOTATE_NOCFI
 	pushq %rbp
 	movq %rsp, %rbp
 	and $~0xf, %rsp
diff --git a/include/linux/objtool.h b/include/linux/objtool.h
index 366ad004d794..518daea19699 100644
--- a/include/linux/objtool.h
+++ b/include/linux/objtool.h
@@ -185,6 +185,8 @@
  */
 #define ANNOTATE_REACHABLE(label)	__ASM_ANNOTATE(label, ANNOTYPE_REACHABLE)
 
+#define ANNOTATE_NOCFI_SYM(sym)		asm(__ASM_ANNOTATE(sym, ANNOTYPE_NOCFI))
+
 #else
 #define ANNOTATE_NOENDBR		ANNOTATE type=ANNOTYPE_NOENDBR
 #define ANNOTATE_RETPOLINE_SAFE		ANNOTATE type=ANNOTYPE_RETPOLINE_SAFE
@@ -194,6 +196,7 @@
 #define ANNOTATE_INTRA_FUNCTION_CALL	ANNOTATE type=ANNOTYPE_INTRA_FUNCTION_CALL
 #define ANNOTATE_UNRET_BEGIN		ANNOTATE type=ANNOTYPE_UNRET_BEGIN
 #define ANNOTATE_REACHABLE		ANNOTATE type=ANNOTYPE_REACHABLE
+#define ANNOTATE_NOCFI			ANNOTATE type=ANNOTYPE_NOCFI
 #endif
 
 #if defined(CONFIG_NOINSTR_VALIDATION) && \
diff --git a/include/linux/objtool_types.h b/include/linux/objtool_types.h
index df5d9fa84dba..aceac94632c8 100644
--- a/include/linux/objtool_types.h
+++ b/include/linux/objtool_types.h
@@ -65,5 +65,6 @@ struct unwind_hint {
 #define ANNOTYPE_IGNORE_ALTS		6
 #define ANNOTYPE_INTRA_FUNCTION_CALL	7
 #define ANNOTYPE_REACHABLE		8
+#define ANNOTYPE_NOCFI			9
 
 #endif /* _LINUX_OBJTOOL_TYPES_H */
diff --git a/tools/include/linux/objtool_types.h b/tools/include/linux/objtool_types.h
index df5d9fa84dba..aceac94632c8 100644
--- a/tools/include/linux/objtool_types.h
+++ b/tools/include/linux/objtool_types.h
@@ -65,5 +65,6 @@ struct unwind_hint {
 #define ANNOTYPE_IGNORE_ALTS		6
 #define ANNOTYPE_INTRA_FUNCTION_CALL	7
 #define ANNOTYPE_REACHABLE		8
+#define ANNOTYPE_NOCFI			9
 
 #endif /* _LINUX_OBJTOOL_TYPES_H */
diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 4a1f6c3169b3..868601760953 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -1382,6 +1382,26 @@ static int add_call_dest(struct objtool_file *file, struct instruction *insn,
 
 static int add_retpoline_call(struct objtool_file *file, struct instruction *insn)
 {
+	struct symbol *sym = insn->sym;
+
+	/*
+	 * kCFI call sites look like:
+	 *
+	 *     movl $(-0x12345678), %r10d
+	 *     addl -4(%r11), %r10d
+	 *     jz 1f
+	 *     ud2
+	 *  1: cs call __x86_indirect_thunk_r11
+	 *
+	 * Verify all indirect calls are kCFI adorned by checking for the UD2.
+	 * Notably, doing __nocfi calls to regular (cfi) functions is broken.
+	 */
+	if (opts.cfi && sym && sym->type == STT_FUNC && !sym->nocfi) {
+		struct instruction *prev = prev_insn_same_sym(file, insn);
+		if (!prev || prev->type != INSN_BUG)
+			WARN_INSN(insn, "no-cfi indirect call!");
+	}
+
 	/*
 	 * Retpoline calls/jumps are really dynamic calls/jumps in disguise,
 	 * so convert them accordingly.
@@ -2334,6 +2354,8 @@ static int read_annotate(struct objtool_file *file,
 
 static int __annotate_early(struct objtool_file *file, int type, struct instruction *insn)
 {
+	struct symbol *sym;
+
 	switch (type) {
 
 	/* Must be before add_special_section_alts() */
@@ -2348,6 +2370,19 @@ static int __annotate_early(struct objtool_file *file, int type, struct instruct
 		insn->noendbr = 1;
 		break;
 
+	/*
+	 * Must be before add_{jump,call}_destination(), specifically any
+	 * add_retpoline_call().
+	 */
+	case ANNOTYPE_NOCFI:
+		sym = insn->sym;
+		if (!sym) {
+			WARN_INSN(insn, "dodgy NOCFI annotation");
+			break;
+		}
+		insn->sym->nocfi = 1;
+		break;
+
 	default:
 		break;
 	}
@@ -2428,6 +2463,10 @@ static int __annotate_late(struct objtool_file *file, int type, struct instructi
 		insn->dead_end = false;
 		break;
 
+	case ANNOTYPE_NOCFI:
+		/* early */
+		break;
+
 	default:
 		ERROR_INSN(insn, "Unknown annotation type: %d", type);
 		return -1;
diff --git a/tools/objtool/include/objtool/elf.h b/tools/objtool/include/objtool/elf.h
index c7c4e87ebe88..f60604d30793 100644
--- a/tools/objtool/include/objtool/elf.h
+++ b/tools/objtool/include/objtool/elf.h
@@ -70,6 +70,7 @@ struct symbol {
 	u8 local_label       : 1;
 	u8 frame_pointer     : 1;
 	u8 ignore	     : 1;
+	u8 nocfi             : 1;
 	struct list_head pv_target;
 	struct reloc *relocs;
 };
