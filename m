Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F0D272E7A
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 10:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747219390; cv=none; b=W5jR54bhtK9QGzL6XQBzhcsoYDtNTe+FVUHT+G5hoXE/11/o0qqVX3b3mE2GrWXVUUXml7mu3V7v/odfBJBaXGlPnpQT5DU4/1196UIgk7HQ05fPxBre1j4Yfi3mck/rmCBrLwKATVu08nkaCX6rAVAoyMiinZz7K9X9GIGofG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747219390; c=relaxed/simple;
	bh=y8s4bUb0IxHXfTiRhIemGG3ymnvZm5HHi84sBsqj+KE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=EFjPj0Fn3bFGhu+3lcW0EuhO8XWMqH/brozAixwAXmy+Yekfy0eqCF23viEcR8Bc2y6P7kDnB0FZ0N9sPZB6YpSg+gCqbM28hsm72IP0cL26P/tXoHlNu/qlsHUZxgLVOG51el/3Qz6TnFD9sD8pVHgySTq2ybdpaGGlEEXavhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2lZBn4Jf; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2lZBn4Jf"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-442d472cf7fso40457855e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 03:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747219387; x=1747824187; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=80flvzp8IqtGF+d/LETZ/1H5RL6Q/J5ql9Ob81N5sfU=;
        b=2lZBn4JfFRnV21ywWCkHoJkkRdj+BF8lbw8X2jC4V4YukIx8/PZKTM73A8r8y1Ohw+
         H5qwe4ja6o+zoUbWtbYbchVsOEELyKpKcNUNBslrbOkHLd5gIbpBl8HS/n5RJyh5Hm4o
         fWaHA5q5XXGnjSSHSJisx8e4N/cOlY6+F/OSr/FFX9knPb2BPn/lQv+rXPUMmZ8w0ptr
         cgyrDPPmf8FiRpiPRIOJYVjIq2a2ykElUzHyIsinFx35SCTj0BX2tgZfWZXd7t6Vy75Q
         nq1j0wjGwVlQgw+YB/15NuG7xKTlFRTOf8MFKXaxOM9pdaCk+oiROnIB0fd5/t+G1oDt
         KCeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747219387; x=1747824187;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=80flvzp8IqtGF+d/LETZ/1H5RL6Q/J5ql9Ob81N5sfU=;
        b=a4Xkdtayzcq09PwIt6/p8Ij1nG7vSK7cwtD4omsn6r/e7qa8iA5+Jnty6WCxBR44JU
         644XbaolEv+ig1bVe2PwnWlkKlDcYV80NOefvlbdff92TRlfoWPUvwA+mdZxm59/1hZp
         MMp4+FuhLB+0hybHFYChMAUozCb82aZ4LpYojnya0l3pBJwC2SXyNUce4QjtwUlI/HfQ
         zqLRkLQxlGBd4B9YDdkumZDgrRCczmE/ScCeydoXO5dh/Sr9Y57Klq+9vqYBNpUjvezo
         AybfWAoayN4JOWWoJaN42riWx4XOGVMRu8wtVrg3VQWGtz7GBsJLrBbbfVhgOWZaJ9Hx
         2X5A==
X-Gm-Message-State: AOJu0YwTI75sLCrbVxWRvUGB/zUvdBzSrXCUDkv/Fy/J49tq0FBfZFTb
	haJHPYPaS9f7OSQmADS+SdaPUGjOs+D4OYOJgqqQK+H+cQ757+XgVSeWmBpPYHrL2Tz4Su3ysa1
	sJgz1XM5Vh1/NygNpL/+akuyfsxx+xnR6+/v4qoNVxzZVy0+ohHCC6L8sZyxIVbz1rLzJiQ+bRn
	+Jx/rbYrF4E4WN1qxIs4+Jsf4Bnm5OCw==
X-Google-Smtp-Source: AGHT+IGvStNzVZduVnJp5jbauCg8hcm+MkhkDAG+ox0YT0WOikip+U1D4kw7j4LLGRzWddDifNmPGi1e
X-Received: from wmpz14.prod.google.com ([2002:a05:600c:a0e:b0:442:cab2:15c3])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:a40a:b0:439:9b2a:1b2f
 with SMTP id 5b1f17b1804b1-442f285da1dmr23267445e9.3.1747219386877; Wed, 14
 May 2025 03:43:06 -0700 (PDT)
Date: Wed, 14 May 2025 12:42:46 +0200
In-Reply-To: <20250514104242.1275040-9-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250514104242.1275040-9-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1881; i=ardb@kernel.org;
 h=from:subject; bh=gBGqkNnrw35rPAatB03sACotWjygpNGNTzKZnb9kfW4=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIUOleNmpnreVusbbpf6s5Zr5ZSODRbTIb+7O8DNy/3wvZ
 28O3jito5SFQYyDQVZMkUVg9t93O09PlKp1niULM4eVCWQIAxenAEwksoKRYVXMdx9Lt8eOa2Zn
 676TkeA4xV/9zjhI0ll36gKVuQctpzL8U7x6yK/x9cS34Sd3+Es/8AmVEmA4Hvul/Mer/zy+W7X 6OQA=
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250514104242.1275040-12-ardb+git@google.com>
Subject: [PATCH v3 3/7] x86/asm-offsets: Export struct cpuinfo_x86 layout for
 asm use
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Brian Gerst <brgerst@gmail.com>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Expose struct cpuinfo_x86 via asm-offsets for x86_64 too so that it will
be possible to set CPU capabilities from asm code.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/kernel/asm-offsets.c    | 8 ++++++++
 arch/x86/kernel/asm-offsets_32.c | 9 ---------
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/arch/x86/kernel/asm-offsets.c b/arch/x86/kernel/asm-offsets.c
index ad4ea6fb3b6c..6259b474073b 100644
--- a/arch/x86/kernel/asm-offsets.c
+++ b/arch/x86/kernel/asm-offsets.c
@@ -33,6 +33,14 @@
 
 static void __used common(void)
 {
+	OFFSET(CPUINFO_x86, cpuinfo_x86, x86);
+	OFFSET(CPUINFO_x86_vendor, cpuinfo_x86, x86_vendor);
+	OFFSET(CPUINFO_x86_model, cpuinfo_x86, x86_model);
+	OFFSET(CPUINFO_x86_stepping, cpuinfo_x86, x86_stepping);
+	OFFSET(CPUINFO_cpuid_level, cpuinfo_x86, cpuid_level);
+	OFFSET(CPUINFO_x86_capability, cpuinfo_x86, x86_capability);
+	OFFSET(CPUINFO_x86_vendor_id, cpuinfo_x86, x86_vendor_id);
+
 	BLANK();
 	OFFSET(TASK_threadsp, task_struct, thread.sp);
 #ifdef CONFIG_STACKPROTECTOR
diff --git a/arch/x86/kernel/asm-offsets_32.c b/arch/x86/kernel/asm-offsets_32.c
index 2b411cd00a4e..e0a292db97b2 100644
--- a/arch/x86/kernel/asm-offsets_32.c
+++ b/arch/x86/kernel/asm-offsets_32.c
@@ -12,15 +12,6 @@ void foo(void);
 
 void foo(void)
 {
-	OFFSET(CPUINFO_x86, cpuinfo_x86, x86);
-	OFFSET(CPUINFO_x86_vendor, cpuinfo_x86, x86_vendor);
-	OFFSET(CPUINFO_x86_model, cpuinfo_x86, x86_model);
-	OFFSET(CPUINFO_x86_stepping, cpuinfo_x86, x86_stepping);
-	OFFSET(CPUINFO_cpuid_level, cpuinfo_x86, cpuid_level);
-	OFFSET(CPUINFO_x86_capability, cpuinfo_x86, x86_capability);
-	OFFSET(CPUINFO_x86_vendor_id, cpuinfo_x86, x86_vendor_id);
-	BLANK();
-
 	OFFSET(PT_EBX, pt_regs, bx);
 	OFFSET(PT_ECX, pt_regs, cx);
 	OFFSET(PT_EDX, pt_regs, dx);
-- 
2.49.0.1101.gccaa498523-goog

