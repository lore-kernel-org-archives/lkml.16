Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C551EDA2C
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 20:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747947153; cv=none; b=d1nZnlqigPBmgwPMyPDSDFtpYFSnja513neByRLGPWy4EVyRWa19NRw0UBSvE+oKyPNIeg3/7/mzbvSsmcjRdo63cadEvGhZieXmyOnONBd7HhyyfmPI4/28KMI1j+IKuEIn0dEHdHpZW0xzi6xyPLOsy7JPn11UdE1XVECvykE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747947153; c=relaxed/simple;
	bh=HSKU8ik1pPODiDQMC3LXLLv9yDDoUv+H/CpmsKgtK6E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=APxSg0NamsyYr16ZL+DgEdFJR8Q7TI+xzLKtwFljpK2u2xLpGcuj4faJzgYpMF1qyx1FSsYRWZNwIPGQWNeW6dCScUC8Y6kQNeyyR9FCoiR8OE/8o0Z5a1NwLIG2dxV7r2S2g2hDxTlHi1JknKVM1wShPRKvF2sGb0b8fsh/oqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dylanbhatch.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Q3nAi/HD; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dylanbhatch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Q3nAi/HD"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-73e0094706bso11692123b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 13:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747947151; x=1748551951; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lTNsWaa+xXDWy+Z07MlUMIrgcNV8S+7CewyD0hTqQ8A=;
        b=Q3nAi/HDW/0NfDaq3okJsawwhxMzPij4ZaDbHAkU8GZxxeH+c+qosznnEdAf5Dlj+p
         nwQsYXcYngcw5zeOa2ooCaya1UjT+3l9Et2GC+PLAptNUiivrfhL+H3jAjUC6GwR1K7J
         AQj+g9p7bwoDHwJqDsR+tVQIaj7xa3THAIdszeFvB6dI1nNl16l0hE2GYB7+BLS4SIqI
         3xoYNvbRBomZzcpCEO5fzLNrOt94k/3qVOnYG174/SNxFG4iU+C4f/fXM3a0fIBxWWK4
         /LlJ0ySZipcdZjnuT0Q7FRzyvwWQrF5FVBILHi0To6IpVuhOiw+MnSoq4QS6BGBMxd5f
         LhQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747947151; x=1748551951;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lTNsWaa+xXDWy+Z07MlUMIrgcNV8S+7CewyD0hTqQ8A=;
        b=OJ//7FMzCZ4fPDVKeE7O+onYZ5c+Ifr8Ow08bhexOt/qXdXuHKnsNnIIRAisyeKXkB
         48rbqX8AeK/6tlLPtS4nM/Kqk4s7TbafS/994Y3hKXmxn6EjPylcDd4DFiVt34meaP5P
         YkGSJgUO8SBwhn6lbXtIquECZ0piev3W+R9VaP5GfMOt3veOVu0RhlFg8yUwLCuyK6SV
         4ok8PI7b0OwWlEo9mpGYuDqBkPwQfdu5kijAZ5AxzsBrtj4WwgPowg76n+/hJ4sb57YV
         KgygwYuV87MITVEsA5t5htXIornoGxFJ3nRtKE8CbKSU2kVgP6AqDdZbGQbIwEAmER37
         q7Sg==
X-Forwarded-Encrypted: i=1; AJvYcCX/quB3DueJj3fGXG6JaH5aKHOItObJKtV3ReBO32RG0Dmu+ZS4tml51tXPpYh1prUMRmx4f+muovCnklk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGcIlWCLwe/K/kJgoXXI/aGdiUCnWe2bpCLGmrq2gZoYHJeLKX
	yQbw59zGqwVSto95xtPhE8R1M0DDP4xwRG70gdc5qfWZoQ62l+vR1Zqnh1L68unuivf0xAHuwpn
	2bpINvmax1InJyHvssiFTduaPbw==
X-Google-Smtp-Source: AGHT+IHLdqAzTz34viFnps5+L1k4uqKuPTmizbaw4PZVV/o+hYa+CWaACxRXdV6L90Y51rrMf50EFhy74KUBFkj1Ig==
X-Received: from pfblm17.prod.google.com ([2002:a05:6a00:3c91:b0:739:56be:f58c])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:138e:b0:73f:f816:dd78 with SMTP id d2e1a72fcca58-745ed8f7a7bmr630155b3a.15.1747947151473;
 Thu, 22 May 2025 13:52:31 -0700 (PDT)
Date: Thu, 22 May 2025 20:52:04 +0000
In-Reply-To: <20250522205205.3408764-1-dylanbhatch@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250522205205.3408764-1-dylanbhatch@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250522205205.3408764-2-dylanbhatch@google.com>
Subject: [PATCH v4 1/2] livepatch, x86/module: Generalize late module
 relocation locking.
From: Dylan Hatch <dylanbhatch@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
	Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
	Joe Lawrence <joe.lawrence@redhat.com>
Cc: Dylan Hatch <dylanbhatch@google.com>, Song Liu <song@kernel.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Peter Zijlstra <peterz@infradead.org>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	live-patching@vger.kernel.org, Roman Gushchin <roman.gushchin@linux.dev>, 
	Toshiyuki Sato <fj6611ie@aa.jp.fujitsu.com>
Content-Type: text/plain; charset="UTF-8"

Late module relocations are an issue on any arch that supports
livepatch, so move the text_mutex locking to the livepatch core code.

Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
Acked-by: Song Liu <song@kernel.org>
---
 arch/x86/kernel/module.c |  8 ++------
 kernel/livepatch/core.c  | 18 +++++++++++++-----
 2 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/arch/x86/kernel/module.c b/arch/x86/kernel/module.c
index ff07558b7ebc6..38767e0047d0c 100644
--- a/arch/x86/kernel/module.c
+++ b/arch/x86/kernel/module.c
@@ -197,18 +197,14 @@ static int write_relocate_add(Elf64_Shdr *sechdrs,
 	bool early = me->state == MODULE_STATE_UNFORMED;
 	void *(*write)(void *, const void *, size_t) = memcpy;
 
-	if (!early) {
+	if (!early)
 		write = text_poke;
-		mutex_lock(&text_mutex);
-	}
 
 	ret = __write_relocate_add(sechdrs, strtab, symindex, relsec, me,
 				   write, apply);
 
-	if (!early) {
+	if (!early)
 		text_poke_sync();
-		mutex_unlock(&text_mutex);
-	}
 
 	return ret;
 }
diff --git a/kernel/livepatch/core.c b/kernel/livepatch/core.c
index 0e73fac55f8eb..9968441f73510 100644
--- a/kernel/livepatch/core.c
+++ b/kernel/livepatch/core.c
@@ -294,9 +294,10 @@ static int klp_write_section_relocs(struct module *pmod, Elf_Shdr *sechdrs,
 				    unsigned int symndx, unsigned int secndx,
 				    const char *objname, bool apply)
 {
-	int cnt, ret;
+	int cnt, ret = 0;
 	char sec_objname[MODULE_NAME_LEN];
 	Elf_Shdr *sec = sechdrs + secndx;
+	bool early = pmod->state == MODULE_STATE_UNFORMED;
 
 	/*
 	 * Format: .klp.rela.sec_objname.section_name
@@ -319,12 +320,19 @@ static int klp_write_section_relocs(struct module *pmod, Elf_Shdr *sechdrs,
 					  sec, sec_objname);
 		if (ret)
 			return ret;
-
-		return apply_relocate_add(sechdrs, strtab, symndx, secndx, pmod);
 	}
 
-	clear_relocate_add(sechdrs, strtab, symndx, secndx, pmod);
-	return 0;
+	if (!early)
+		mutex_lock(&text_mutex);
+
+	if (apply)
+		ret = apply_relocate_add(sechdrs, strtab, symndx, secndx, pmod);
+	else
+		clear_relocate_add(sechdrs, strtab, symndx, secndx, pmod);
+
+	if (!early)
+		mutex_unlock(&text_mutex);
+	return ret;
 }
 
 int klp_apply_section_relocs(struct module *pmod, Elf_Shdr *sechdrs,
-- 
2.49.0.1151.ga128411c76-goog

