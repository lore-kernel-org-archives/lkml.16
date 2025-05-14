Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AFC1270ECD
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 10:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747219388; cv=none; b=PmSP8Rhpgby096JnvtAS/iMwrD1ynFioStRBjJGoeV+T1Aiyqdd8qqsfDyuLUlnR8i7AQTRNCWHzjqNvlAzHKXVdOuEbDMSouQoPCHMg0kDtjeSOa+AfKTcIBWl7wy2JrSXp7zx/FfmkHHGhMskiEpo+BWtI5TYhQxpQGWdBIW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747219388; c=relaxed/simple;
	bh=Qy4swRHdqb7GIWMI2+IQEAUo68bT990/p7joY7lPE/A=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=OKFFUpdkcsgB0sXWKwMscoKd7bLv16YNiI6prmGQ3TvRhzVDU76rRwu/yw7I0Q9ElnjDG7hReN3sPFknbKYHIslLgekCTNdcj5umtizkOsTF+wVncohPutA/ccyVSYwapar8qoUB5fRIEywoM1d8bfow+MU5HB+1ZxW5YjTLzfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lbF/mS48; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lbF/mS48"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-442cdf07ad9so28427405e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 03:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747219385; x=1747824185; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mjxA9/NacXyJblHrDl8e4BLWViKbKXNacaYSz8P49QU=;
        b=lbF/mS48jqFEz73lAtKZd1zTZDWmm2G8L/iL15yEc2uUn9YDL0OJIZj6djyJWRKRx6
         3oq2r2kvVRQHPRqTYXg7GMwl/FgTAm+vPTneTjV2LFT/mcX2KktLvGt1sUpE2334xfGk
         E76iTyYIrhc3+iGf+IE758FN/rvs211PoXFduBuWyubU6cGvcx7PoiQn1V7mHcMzu7d+
         ilvVU0k2VN/EjWkoaAIbhQ2N7GeyWTU/ZkfXXU6dmO8yVyZ4eJue33yKHumJX0xNJVNz
         grhB+0uCfor3i9ibzQfQaOcLR+cSTkC2+ZbomSZn2VJ0cjMowmPrWqbJNNuj5YKGDnow
         myfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747219385; x=1747824185;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mjxA9/NacXyJblHrDl8e4BLWViKbKXNacaYSz8P49QU=;
        b=RTYceBchlLZmpWFDnfRHmyj/V4hUC/4/JbtWqCwzSa7pgcbIZXDlnvCaypZpKIKylf
         esijwpfpHRTUaNpTbQkewF0ecS1rTPGq8abiPFKnW6c8qsoMpaF0IiogABKNRtTyQtmW
         NdBEl8RyQl+ztdiOecHnM7PgqkK9ou6MfDysEGtut7d85bGt3qwK0I4MyJjYbeaHyG5X
         pyg38Q6q5d2V/p3S76rnGLzZrSlOqGhsXeFufqR1UtZymz8daWZ6B+oBpPBm00QYCzmg
         9H9iEfnEzjUoEkoaQCNDHyJJJ0cRrGQMaXLWOMbzx46h70Is3zdMf+BXlfed6D7aB6Mb
         TkfQ==
X-Gm-Message-State: AOJu0YwzsJgj/38wc/zhq7AplI7q8pMnfiWrj0NDqSwI+yNM+7zZWN4P
	URJukhV0YJdAzAzbqviybSNFa5Va/k6gz2YvNAIm8AxGF0z7WJ3cYe7SGZJRXZWdsgxlVftCDMm
	NodQcU78J7Fq7gE4k5sbiLhVXJQ6Gqe0xCf6OprYcSqj3THN0Ymm6lUTqy53+DVCCgLnbdUpioN
	NR4Sk+At9/nLYEHIrUmO0N+dnmIWqMJw==
X-Google-Smtp-Source: AGHT+IFX2kxbrlLnmW0JE9ieUKAGCEn6noplLWKDg1OfwKIu+zbE5NRggR/lgchqPwskq9maGr9GcMuV
X-Received: from wmrm4.prod.google.com ([2002:a05:600c:37c4:b0:43d:1dd4:37f2])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:698c:b0:43d:ea:51d2
 with SMTP id 5b1f17b1804b1-442f20d6550mr30021405e9.14.1747219384897; Wed, 14
 May 2025 03:43:04 -0700 (PDT)
Date: Wed, 14 May 2025 12:42:45 +0200
In-Reply-To: <20250514104242.1275040-9-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250514104242.1275040-9-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3118; i=ardb@kernel.org;
 h=from:subject; bh=p2NOqIg6W9MB52am73AAAFc8VSowwxVLbOld/DsZJJY=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIUOleCl33B+xtF/p5ZdUkuOW6TafV7eoffbXITj4dE9Bp
 cSxE80dpSwMYhwMsmKKLAKz/77beXqiVK3zLFmYOaxMIEMYuDgFYCK32Rn+pwrN59r1r/OPhfCe
 X8++tN+NmhVzP37Fw7V7j0z5MeNsYQQjw/mN86bHBHl+C6s+2v0vZX686TLr+t/T5GdIMD2J1Fo 2kQMA
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250514104242.1275040-11-ardb+git@google.com>
Subject: [PATCH v3 2/7] x86/cpu: Allow caps to be set arbitrarily early
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Brian Gerst <brgerst@gmail.com>
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
 arch/x86/kernel/cpu/common.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index 6f7827015834..f6f206743d6a 100644
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
@@ -1708,9 +1708,6 @@ static void __init cpu_parse_early_param(void)
  */
 static void __init early_identify_cpu(struct cpuinfo_x86 *c)
 {
-	memset(&c->x86_capability, 0, sizeof(c->x86_capability));
-	c->extended_cpuid_level = 0;
-
 	if (!have_cpuid_p())
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

