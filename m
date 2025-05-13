Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4A328D82E
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 11:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747134740; cv=none; b=p3/dGeesUlReP6qrGvNUBMGVAftmyP4JmAnt6TU2keXtYNZDK//ayPMclRXbBq+cEV2ekhR4zQB5W6JZZtqTv2W9xkiPRsW+BUdvKugB6CtpPs2M3oo1kEALtEZcozl6lYr95XfUeHvmEUsEykS/rexvqanoKQ+n1W2Yx0VHVOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747134740; c=relaxed/simple;
	bh=xVxttg+Ki0H7qV3QXQdqHqVoJRGNW84rRIVdoWDdCoA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=cDQHFs2quOUz2Ej1lj3Dd9rJ2Wk2JpyHbrIAJsuQ4dvb3HtOWsMKztlrde89cHnao2Q2DqWCSb0WAjnfm17SK9/XLbNzARy36FsbcvxCQe2KAb/k/l4lqLuisFizryNiUDvIaFVFjSjpF7sYRKtBxtRDy59PSdrvKRJVcWuBpwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DrnORwE/; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DrnORwE/"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43d0830c3f7so35117725e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 04:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747134736; x=1747739536; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dZTpfF8cA7D0pCmiXbDGe34Zc8XEwsH5jH7PDUOh2wE=;
        b=DrnORwE/I7EyaWnxPwP51R7pEMOUgGJtij3HHB5P/tsEDrj7krsV0jQiwuiqw0JxOx
         p7gUx55Qgk9PumBLe+C4hyy26XVu5jQHO27YcVjURz+tOyworRMEZ0gxCe3T9H5iUhoi
         GGQPFn6FbbpoMnWp0xClxQt8fXYhJny/Edf9yTwKzbZKdBI5ESvDZBNBWA856avVTFk0
         rcHQJLZO6TJvYcUC+qzl0Ls3PyrBaP0xaj5TkxyuEF4ybpkvIjl2B60X91+/KY1/axI4
         F8rDnCcESPyNWekexLh7NsoyM8Ty+Ddh+Icoy7768UjLpG5rN2NKWfBHAdAPzfPqi1vf
         htqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747134736; x=1747739536;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dZTpfF8cA7D0pCmiXbDGe34Zc8XEwsH5jH7PDUOh2wE=;
        b=UlhcNlKM5pyUkmK7urJdeSZ9swpz15ed75KFh3zjKoZRmjPker35IgmgHY2N6o/Baw
         EEW46qqUz2Py+Abo5L9fcBNGZe6X9KrdEqhHbIIVrvhPeoZ1ifAZEDH4Is2oTG+mOZWj
         x6flyv1Wuk80T3h5actoNKQTtydYRf1noZ5/zPjmE3hcJ2ub/3cJpkTjZ6T5wECnED/U
         /X6UwRYGbrj3FkOE6CUo31Jeoqi6nKcgz6Ivqc+C+DyaDjhLp18NFtwqV3KzcpEtU6Oi
         FftdVDZAN0R8abW8leFE3DwHnZNUpqnYBNrUoUEtt5oA/tNMjctVx2HJebrvVeV9Wfyt
         alPg==
X-Gm-Message-State: AOJu0Yz+tNC/KiY2M1pSiSi4YKxmRtmUcs4H6yDhRz5rfRFkslGaXJsk
	WfUc6jbTbjcY6YZrgGRD6jy/giIkl6VKU62BbhVHQIeGmwwvjQdsvIPLeuWslCzTmn4h70TDPRl
	twMBZ2BMlyMThWSqvYQ/enikDO7RDVsKQbDq53UwBJyE7hCzlXmqYbiBPpJnXwHPAZUsfNtx9BL
	yt2L5yy3RcwxEuYf060ulKjFEQB3pbvA==
X-Google-Smtp-Source: AGHT+IFbjhW7iHTgI2oIXprmoB/IDk/7xkxLNv3b93TPgxieC7Ak5juYx7DpQTTS9RTcnBdGeYrvWr5B
X-Received: from wmcn15.prod.google.com ([2002:a05:600c:c0cf:b0:43c:fe64:2de3])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:45d1:b0:43c:f63c:babb
 with SMTP id 5b1f17b1804b1-442d6d18a81mr110937645e9.1.1747134736552; Tue, 13
 May 2025 04:12:16 -0700 (PDT)
Date: Tue, 13 May 2025 13:12:01 +0200
In-Reply-To: <20250513111157.717727-8-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250513111157.717727-8-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2966; i=ardb@kernel.org;
 h=from:subject; bh=dwocxnQDWmEMf8E6vMAUpfYBmpwDUYGcnjgv0Zwk36w=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIUNZk8ns9e0OhbzK1dfW2ct9aV7GaJLa4tsrZHS4NsiOm
 VH32/aOUhYGMQ4GWTFFFoHZf9/tPD1RqtZ5lizMHFYmkCEMXJwCMBHPOIZ/2i9exXQ9DD+itDL+
 T8eZ7WwT74e+avNYueLArCnb7kUetWRkePWeM9WZeeHMywcKdCaUCMS0/vxaL8n7hHeZ45ed8b6 TGQE=
X-Mailer: git-send-email 2.49.0.1045.g170613ef41-goog
Message-ID: <20250513111157.717727-11-ardb+git@google.com>
Subject: [RFC PATCH v2 3/6] x86/cpu: Allow caps to be set arbitrarily early
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>
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
entering C code.

This involves relying on static initialization of boot_cpu_data and the
cpu_caps_set/cpu_caps_cleared arrays, so they all need to reside in
.data. This ensures that they won't be cleared along with the rest of
BSS.

Note that forcing a capability involves setting it in both
boot_cpu_data.x86_capability[] and cpu_caps_set[].

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/kernel/cpu/common.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index bbec5c4cd8ed..aaa6d9e51ef1 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -704,8 +704,8 @@ static const char *table_lookup_model(struct cpuinfo_x86 *c)
 }
 
 /* Aligned to unsigned long to avoid split lock in atomic bitmap ops */
-__u32 cpu_caps_cleared[NCAPINTS + NBUGINTS] __aligned(sizeof(unsigned long));
-__u32 cpu_caps_set[NCAPINTS + NBUGINTS] __aligned(sizeof(unsigned long));
+__u32 __read_mostly cpu_caps_cleared[NCAPINTS + NBUGINTS] __aligned(sizeof(unsigned long));
+__u32 __read_mostly cpu_caps_set[NCAPINTS + NBUGINTS] __aligned(sizeof(unsigned long));
 
 #ifdef CONFIG_X86_32
 /* The 32-bit entry code needs to find cpu_entry_area. */
@@ -1628,9 +1628,6 @@ static void __init cpu_parse_early_param(void)
  */
 static void __init early_identify_cpu(struct cpuinfo_x86 *c)
 {
-	memset(&c->x86_capability, 0, sizeof(c->x86_capability));
-	c->extended_cpuid_level = 0;
-
 	if (!have_cpuid_p())
 		identify_cpu_without_cpuid(c);
 
@@ -1842,7 +1839,8 @@ static void identify_cpu(struct cpuinfo_x86 *c)
 	c->x86_virt_bits = 32;
 #endif
 	c->x86_cache_alignment = c->x86_clflush_size;
-	memset(&c->x86_capability, 0, sizeof(c->x86_capability));
+	if (c != &boot_cpu_data)
+		memset(&c->x86_capability, 0, sizeof(c->x86_capability));
 #ifdef CONFIG_X86_VMX_FEATURE_NAMES
 	memset(&c->vmx_capability, 0, sizeof(c->vmx_capability));
 #endif
-- 
2.49.0.1045.g170613ef41-goog

