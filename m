Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9CC233144
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 08:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744793717; cv=none; b=npZZPs4s3/RIBpdA+59vpxmOjNov0cZX5S7Dw481G9tDK+krSwy12Zqbk8Oligt0czwdEoezmER44s3fxr9KlFuYXw5BJBNafH0FGGxiYZ6CIUwbyFjxzcsusCKY9o9Ef/FM7FpbC8jxwxAlx8tv9EKlDv0XpfG0jzbK2sAalrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744793717; c=relaxed/simple;
	bh=er+DJxKzIeHX5hexvve8j1XLT4IbutWOowishPWCDrs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pEanvhTiKc37ijg7GHEJYRyjz9L7sWusQD9DtEKbNjRalBgq4E6IzIPSm/GBk9MXa1i2HBuG3WonqP6iP1Rs2vWNboUyySPZcgg91iWItE9OzO3tyxO8lrdK+lSjnmjpuInNJb5BybpSiE1h1sXSJ6fOvPuOuqApM7Xu9fgNOb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--glider.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Lw3WE8Zu; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--glider.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Lw3WE8Zu"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-5f435440ea1so2938031a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 01:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744793713; x=1745398513; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=JTFzqr/xcSaN2yUJr69OYVSpzwgxx9PIurYAIv+eQpU=;
        b=Lw3WE8ZumWnyiVTE2yqIvs431G1XmQ6o5dZHKkIPqBqJr4qXt5Wkx3FaRiVIw/QKZm
         gRydfrEhiiHTPeAODwqG2w10qYO3TORtfT5EMSCEDcfqu2QpmD677FICNnCi7aEEylG/
         ZiEKyCN4WDYcCvDLwxwd81ZZze2B062ykMLaP5TcxoeQcDf2O8V3nfumUziDm6EbM2vZ
         udy0//ptfu9T70tkCbNnnAJsZEsVifNU/UlBX2LtgnXW9DRLeDOaqmInKCHdQQQj31s0
         CLm/XTvr5er5iStbUjJNB6cmhgROY/od+shE2U3Y/HXQMGPXgcmNfbu8ekNG37kGXIIB
         QLSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744793713; x=1745398513;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JTFzqr/xcSaN2yUJr69OYVSpzwgxx9PIurYAIv+eQpU=;
        b=VXNbD+fAs4ckA1luFMKbSCxS/cxZw65WpD+QFikrJwtyWgb7Wp1Dhsw+rea0Tut0+x
         r9MWEOyigvus0iXaHxyTHedcP8VtC5EuMxdsmBBQjwVjTz0JIHFCoJupUfB8RdPLI8/8
         exIOalmavAss91t+u2mGcJkwaTOq8DE2h9j4iyPd6XCMiMIzqfzn+YHq9b/Cur32N9cy
         7q8IEIL55W9pr30QrpMJwCqZxu0QjPN+8zqW5ctkbTm0YVcoMgylhq7S+fozVFimdUeB
         GGsBJatYM5wu1q6V9q/oPoqT0jI8AkatS0BfXLXbMwAI9XmXRhLBSwtm8HxAdssZ5UNr
         Q1lw==
X-Forwarded-Encrypted: i=1; AJvYcCVSxp4ERy/T/4jh0EnTMkJ4alfM/XrEdE8i9V21kmgMT0Br4DBFwZDpw926jngKuTdRvzAE3SIBVyVY88g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzxfn6CTwH+NOztRLhFGvCseX/ELmwiJJFScIEtW5+k6619zwS0
	F1H6M8doqqUHW0eTm1G6a/1rcymcVq4dri8I8mwetOp6WnON835MWPyXhIQi4yczq4hHZfEIbEk
	imQ==
X-Google-Smtp-Source: AGHT+IGa+BXef7MTLYEDEJ5TGukgjebm/ZwTNU9BAmLBbXlnhC1Rts2yCTcbcszxgvnuWzaU+YMGv+E91QA=
X-Received: from edjb8.prod.google.com ([2002:a50:ccc8:0:b0:5e0:677b:d382])
 (user=glider job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:1e91:b0:5ec:9352:7b20
 with SMTP id 4fb4d7f45d1cf-5f4b6dfb88dmr841880a12.0.1744793713231; Wed, 16
 Apr 2025 01:55:13 -0700 (PDT)
Date: Wed, 16 Apr 2025 10:54:44 +0200
In-Reply-To: <20250416085446.480069-1-glider@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250416085446.480069-1-glider@google.com>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250416085446.480069-7-glider@google.com>
Subject: [PATCH 6/7] x86: objtool: add support for R_X86_64_REX_GOTPCRELX
From: Alexander Potapenko <glider@google.com>
To: glider@google.com
Cc: quic_jiangenj@quicinc.com, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, x86@kernel.org, 
	Aleksandr Nogikh <nogikh@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Ingo Molnar <mingo@redhat.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Marco Elver <elver@google.com>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"

When compiling modules with -fsanitize-coverage=trace-pc-guard, Clang
will emit R_X86_64_REX_GOTPCRELX relocations for the
__start___sancov_guards and __stop___sancov_guards symbols. Although
these relocations can be resolved within the same binary, they are left
over by the linker because of the --emit-relocs flag.

This patch makes it possible to resolve the R_X86_64_REX_GOTPCRELX
relocations at runtime, as doing so does not require a .got section.
In addition, add a missing overflow check to R_X86_64_PC32/R_X86_64_PLT32.

Cc: x86@kernel.org
Signed-off-by: Alexander Potapenko <glider@google.com>
---
 arch/x86/include/asm/elf.h      | 1 +
 arch/x86/kernel/module.c        | 8 ++++++++
 arch/x86/um/asm/elf.h           | 1 +
 tools/objtool/arch/x86/decode.c | 1 +
 4 files changed, 11 insertions(+)

diff --git a/arch/x86/include/asm/elf.h b/arch/x86/include/asm/elf.h
index 1fb83d47711f9..15d0438467e94 100644
--- a/arch/x86/include/asm/elf.h
+++ b/arch/x86/include/asm/elf.h
@@ -63,6 +63,7 @@ typedef struct user_i387_struct elf_fpregset_t;
 #define R_X86_64_8		14	/* Direct 8 bit sign extended  */
 #define R_X86_64_PC8		15	/* 8 bit sign extended pc relative */
 #define R_X86_64_PC64		24	/* Place relative 64-bit signed */
+#define R_X86_64_REX_GOTPCRELX	42	/* R_X86_64_GOTPCREL with optimizations */
 
 /*
  * These are used to set parameters in the core dumps.
diff --git a/arch/x86/kernel/module.c b/arch/x86/kernel/module.c
index 8984abd91c001..6c8b524bfbe3b 100644
--- a/arch/x86/kernel/module.c
+++ b/arch/x86/kernel/module.c
@@ -133,6 +133,14 @@ static int __write_relocate_add(Elf64_Shdr *sechdrs,
 		case R_X86_64_PC32:
 		case R_X86_64_PLT32:
 			val -= (u64)loc;
+			if ((s64)val != *(s32 *)&val)
+				goto overflow;
+			size = 4;
+			break;
+		case R_X86_64_REX_GOTPCRELX:
+			val -= (u64)loc;
+			if ((s64)val != *(s32 *)&val)
+				goto overflow;
 			size = 4;
 			break;
 		case R_X86_64_PC64:
diff --git a/arch/x86/um/asm/elf.h b/arch/x86/um/asm/elf.h
index 62ed5d68a9788..f314478ce9bc3 100644
--- a/arch/x86/um/asm/elf.h
+++ b/arch/x86/um/asm/elf.h
@@ -119,6 +119,7 @@ do {								\
 #define R_X86_64_8		14	/* Direct 8 bit sign extended  */
 #define R_X86_64_PC8		15	/* 8 bit sign extended pc relative */
 #define R_X86_64_PC64		24	/* Place relative 64-bit signed */
+#define R_X86_64_REX_GOTPCRELX	42	/* R_X86_64_GOTPCREL with optimizations */
 
 /*
  * This is used to ensure we don't load something for the wrong architecture.
diff --git a/tools/objtool/arch/x86/decode.c b/tools/objtool/arch/x86/decode.c
index fe1362c345647..8736524d60344 100644
--- a/tools/objtool/arch/x86/decode.c
+++ b/tools/objtool/arch/x86/decode.c
@@ -93,6 +93,7 @@ bool arch_pc_relative_reloc(struct reloc *reloc)
 	case R_X86_64_PLT32:
 	case R_X86_64_GOTPC32:
 	case R_X86_64_GOTPCREL:
+	case R_X86_64_REX_GOTPCRELX:
 		return true;
 
 	default:
-- 
2.49.0.604.gff1f9ca942-goog

