Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CACD11E1A3B
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 09:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747473418; cv=none; b=kJ5V86jeOsG3KAl65/6i369Yv/FgGUM9GAxRSxQc4W+prFHkkmCuj3DwBDDlHRjusFaFXPe1aoFvZKcX+nDXEvj8XkpmbQDqEAmqS9YX1z/Vfd1mbfWUNi/dlu5JyIVDW7uXHqfdxXojzhMPtSX0JEE7RN1gr33PPhN8igQX324=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747473418; c=relaxed/simple;
	bh=ZWEpqE9ktHgh077E7w6k+BuB8NwD4CPevNMgyEcZOpU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MM1/pRnH6oyKv/nINxhT6c8ikAfDo6P3eaDHnOIHexrcHF2cqtUy0DOdrOn2nUTVbZAbi/5zwkvvzjjeaaw87V6eT0LTbqj3jX/hd9MQXcW24B1y+3vDrCirMNT7qa0FEXC/HqNgLIffulM0EIuAplz478lTbkoM03tP/Cvel0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FV4ilwoK; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FV4ilwoK"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-445135eb689so104285e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 02:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747473415; x=1748078215; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9M+b2tkrDVZQ50Sd4UaKGxHHMqCit92UPEaKkgiQe7Q=;
        b=FV4ilwoKgbk3ArTbtQ/gZ3jrj2PQu6AnGHWfR8SjFWKiSs+K8tvplKR2UHbRqALWtk
         Hfu/ZLvBv/xbqj4/Hv0Bmu/zNbRCYSOih1KkkRm/8jUNoFe3b5+aW+0tKj0ArNouVJz5
         HYGEZzm5l8vbjmxfcQzK34JYxFliPDxRhKjFD2kT3TCPlU7xx5IgSjJaUfHsl790jJmH
         jcKKRHwm27O5Nape2uo+4vqjhEti1h1dXfltIlf7zL8fA2aqoSUDCoTU+bNdcut6EWJf
         JaQfFTq3a2lGdTlacyBW+NoHG5Cu2MBxn1dyEYkdQUiapMmfjI42nrhs+YbklWyFyAsJ
         K0Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747473415; x=1748078215;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9M+b2tkrDVZQ50Sd4UaKGxHHMqCit92UPEaKkgiQe7Q=;
        b=jvjT9WTWRxRbn0rzLUKwNozQ296VR1X4YgyEBKL7Hd+nQHMJocLMtQ3DkAukg1LNe/
         NF6x/GpP6dbQmrXr9zwzTvwZjuTg/Vj0g3kW/eERHgalup9aVsfWotenLCXM5B2uoCZR
         mPOFd3PqCB1um4zV3pCTa6cszdAj9M3N5QBM00M4CD9zHJo0asrfUCDntoBFXLbeG3LT
         6ZhYV8cLAZpxhBBAv7FxmRqHJ3GzhaeHvhZ+O6zel1l+VLht1s+Gtd1x51+W319YY3DT
         dvjnAxC9lI6YnepHWqG51oW0x6Wws8Ow0t2lFSb6AmPZo1MqUrBAhjI7uOI/HtIkQndg
         K8Kw==
X-Gm-Message-State: AOJu0YyQafXhm75WZ55rNu/FL2xvGNBYiH03ZS1GFWTs+1qM998Z4S6V
	jO7oMNmTBJvQCBxC4EreI3gai2h1BnQpVb0XFLRdajm7yZupc9a4kEoF4pqV9b0C+5p9ky6frn7
	TJK/SOgm93LOEO/83VEhqxZum3x6P9WLI+FGMepq0RVkKtyj32A5SV+GDXugNaxMiyliIV11b6t
	0ITEpkcj4+1cSD5oKVAJe/LIOMNBXpI/HOmA==
X-Google-Smtp-Source: AGHT+IHHOrp2s3H+1dqsxzAqJxAtSzcdGgUM7/yqWj7wrZnUVpJcPOX6JJnGfYcgfgqUM93D+pbzljVp
X-Received: from wmbay14.prod.google.com ([2002:a05:600c:1e0e:b0:442:ddce:d53c])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3e0a:b0:43c:e478:889
 with SMTP id 5b1f17b1804b1-442fd5a2c09mr79651695e9.0.1747473415200; Sat, 17
 May 2025 02:16:55 -0700 (PDT)
Date: Sat, 17 May 2025 11:16:43 +0200
In-Reply-To: <20250517091639.3807875-8-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250517091639.3807875-8-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2436; i=ardb@kernel.org;
 h=from:subject; bh=Es9VKr7BFTHF7N5t1z+PF2rgAMg95nxzCelW5j1DcSU=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIUMj+BeH/onzaybzTN/2SdJ1s+etDXm5bl9Mb9/L8t6Qd
 it2X86XjlIWBjEOBlkxRRaB2X/f7Tw9UarWeZYszBxWJpAhDFycAjCRC8cYGRbXbIjjW+WzWe7T
 q51vxa3dqy9vb1ieyPX/qYJXRkuDmyIjw7nSP9Esv7fsvfa8xio5RG1+ivI1xp0OMo93X5hVdeX kWjYA
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250517091639.3807875-11-ardb+git@google.com>
Subject: [PATCH v4 3/6] x86/cpu: Allow caps to be set arbitrarily early
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Brian Gerst <brgerst@gmail.com>, 
	"Kirill A. Shutemov" <kirill@shutemov.name>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

cpu_feature_enabled() uses a ternary alternative, where the late variant
is based on code patching and the early variant accesses the capability
field in boot_cpu_data directly.

This allows cpu_feature_enabled() to be called quite early, but it still
requires that the CPU feature detection code runs before being able to
rely on the return value of cpu_feature_enabled().

This is a problem for the implementation of pgtable_l5_enabled(), which
is based on cpu_feature_enabled(X86_FEATURE_5LEVEL_PAGING), and may be
called extremely early. Currently, there is a hacky workaround where
some source files that may execute before (but also after) CPU feature
detection have a different version of pgtable_l5_enabled(), based on the
USE_EARLY_PGTABLE_L5 preprocessor macro.

Instead, let's make it possible to set CPU feature arbitrarily early, so
that the X86_FEATURE_5LEVEL_PAGING capability can be set before even
entering C code, by making sure that boot_cpu_data.x86_capability[] is
not [redundantly] wiped again when detecting CPU features.

Note that forcing a capability requires setting it in cpu_caps_set[]
too, which has been moved out of BSS in a preceding patch.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/kernel/cpu/common.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index 579d5b84e183..7392a75d85c3 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -1708,9 +1708,6 @@ static void __init cpu_parse_early_param(void)
  */
 static void __init early_identify_cpu(struct cpuinfo_x86 *c)
 {
-	memset(&c->x86_capability, 0, sizeof(c->x86_capability));
-	c->extended_cpuid_level = 0;
-
 	if (!cpuid_feature())
 		identify_cpu_without_cpuid(c);
 
@@ -1922,7 +1919,6 @@ static void identify_cpu(struct cpuinfo_x86 *c)
 	c->x86_virt_bits = 32;
 #endif
 	c->x86_cache_alignment = c->x86_clflush_size;
-	memset(&c->x86_capability, 0, sizeof(c->x86_capability));
 #ifdef CONFIG_X86_VMX_FEATURE_NAMES
 	memset(&c->vmx_capability, 0, sizeof(c->vmx_capability));
 #endif
@@ -2084,6 +2080,7 @@ void identify_secondary_cpu(unsigned int cpu)
 		*c = boot_cpu_data;
 	c->cpu_index = cpu;
 
+	memset(&c->x86_capability, 0, sizeof(c->x86_capability));
 	identify_cpu(c);
 #ifdef CONFIG_X86_32
 	enable_sep_cpu();
-- 
2.49.0.1101.gccaa498523-goog

