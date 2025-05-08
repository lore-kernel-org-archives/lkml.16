Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA80A223DE8
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 11:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746704626; cv=none; b=mr511cWI5UceGbjJryhoA3eZJZi/IS67SY/4UqchLnuG9w4+K23Bl54XVZ+Jw7HPXdd18ZDdeHTNPppyZdCYovW2BXystNRlysUCuPDh5umMeGWs6fkiTamU8Qx4sRCr8XYC/nv5JyvI5EJgOAZlhbk+Axj8cmPvLCjC6E3yaDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746704626; c=relaxed/simple;
	bh=SNkN+aUxCD4khnvAOEVbcOq4dfyvknF/k2ubANz9rSs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nrAh88sdCOBmWDh89/gz1vnDQ/BpY/T9fPQ346YQwPOE/2nP4bIyG66k1SEUlL3MwNjlbM+PJlmSVOdUpomwvbkVkCAZh0yWlFbnwdRb4qzZhD6GOSKLYmttCMpGYf8hfBwR9jPTjMCHRsMeJZmr02hc6bmvnWA3v1FW0ODVApo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CNxOF+cA; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CNxOF+cA"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-442cdf07ad9so3801825e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 04:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746704623; x=1747309423; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OFL6LCOiCuB4AhqO2WO2qSyMds3tZvVGSAG8TlD6fm8=;
        b=CNxOF+cAogGpctO7kcy9I3N0R+jWF6U8jYDByBmz1gkJpVONf/DWaiZ1WK0wBMOmzx
         G8/vZeIQPx7FNuj65Wrmr4/8gNyQ5kt33+fLjtOTvCS8GoSKJbrcMBQe77CmthBt8ajS
         IEXpK5IaqFN8dtgmKszkDrW9S7mPXorwlpEWsGO0Nn4U89d3iitgojSeq09Rga+MYqzV
         GRcuEtY8a+4JZg9NNYfhm3ktXUiHzV4Ll6gOmR50Zl53+7IDaz7Bh1yVZQ2q0ktc/tYP
         t1dDdxeWyQ4q9NRed08kqGMs8erR7TQSGWXDRumgJvts4h31SOHGR14sIJpq3vt3vS+O
         v+Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746704623; x=1747309423;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OFL6LCOiCuB4AhqO2WO2qSyMds3tZvVGSAG8TlD6fm8=;
        b=jlOOgbIlfwWlmmfDzhrshcvUyLAlwqT2rRWigzJhrikZOBtbCMXXIZ1IupRxwkUUNg
         vspDPlXipvJeYHduWWg33kgPDkMnv3c9EPLrbZ3A47oBlG5ua4QZtkJ+Jr2euCD60+WU
         ya9vVX9pTub/8GAeClFSSycGZPIZZhStqNBirRLtuClM/1o6N3iLqm2Wuo1brXSuZaNA
         ih9a7cfqrxjEzg4zbqJ4fn7zlZHgo2smc3IX98MoxALn8NV9pPYea2Q4i8BtyxOGGxXv
         2wx6OZTx/iZtEq910sUlHsk8TPOc9SdTq8fW24HdkPLv3LFLLmzgoP7NXSZvKiKBVfsL
         JDOg==
X-Gm-Message-State: AOJu0YxOWitr0HsrJ48vlyM+ICvmq+iQLSRCiS83gUqsHz/zDkY440nk
	7wBlvuZxwR31WwlZ6JnluS7/LgDVUCkzjipsDpNwV3Dni3iMgdsVKUVkX1K+nULm+Ifryg==
X-Google-Smtp-Source: AGHT+IHhgjjPcSzSlIvKKbGxCHF4/xh5ayQlKt49bS4/7hxPqwU88888d3Bex6M06x7UUFIZSSVblKdy
X-Received: from wmbem23.prod.google.com ([2002:a05:600c:8217:b0:441:b661:2d94])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3d13:b0:43c:f3e4:d6f6
 with SMTP id 5b1f17b1804b1-441d44e3660mr72820155e9.31.1746704623167; Thu, 08
 May 2025 04:43:43 -0700 (PDT)
Date: Thu,  8 May 2025 13:43:32 +0200
In-Reply-To: <20250508114328.2460610-5-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250508114328.2460610-5-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=4218; i=ardb@kernel.org;
 h=from:subject; bh=j8k/j5lLwOtOO5g2RunsS1a0UPrHZPgoaoPHRVCj0HU=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIUNmxtNDLXyH4vbP5Hn2N3xteLLlH9mFD+alrm7kKly3W
 eLd4e+rO0pZGMQ4GGTFFFkEZv99t/P0RKla51myMHNYmUCGMHBxCsBEbi9lZGh+6vuo8tplgY66
 2R3/RSr/Fy7eV5byx/cO7yFOxgb98iWMDHdPm57KuGFZE86venruP3lRDoPFOk/SGjfantBpO/x /FxcA
X-Mailer: git-send-email 2.49.0.987.g0cc8ee98dc-goog
Message-ID: <20250508114328.2460610-8-ardb+git@google.com>
Subject: [PATCH v2 3/3] arm64/boot: Disallow BSS exports to startup code
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	mark.rutland@arm.com, Ard Biesheuvel <ardb@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

BSS might be uninitialized when entering the startup code, so forbid the
use by the startup code of any variables that live after __bss_start in
the linker map.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/kernel/image-vars.h  | 62 +++++++++++---------
 arch/arm64/kernel/vmlinux.lds.S |  2 +
 2 files changed, 35 insertions(+), 29 deletions(-)

diff --git a/arch/arm64/kernel/image-vars.h b/arch/arm64/kernel/image-vars.h
index c3b4c0479d5c..a928e0c0b45a 100644
--- a/arch/arm64/kernel/image-vars.h
+++ b/arch/arm64/kernel/image-vars.h
@@ -10,6 +10,12 @@
 #error This file should only be included in vmlinux.lds.S
 #endif
 
+#define PI_EXPORT_SYM(sym)		\
+	__PI_EXPORT_SYM(sym, __pi_ ## sym, Cannot export BSS symbol sym to startup code)
+#define __PI_EXPORT_SYM(sym, pisym, msg)\
+	PROVIDE(pisym = sym);		\
+	ASSERT((sym - KIMAGE_VADDR) < (__bss_start - KIMAGE_VADDR), #msg)
+
 PROVIDE(__efistub_primary_entry		= primary_entry);
 
 /*
@@ -36,37 +42,35 @@ PROVIDE(__pi___memcpy			= __pi_memcpy);
 PROVIDE(__pi___memmove			= __pi_memmove);
 PROVIDE(__pi___memset			= __pi_memset);
 
-PROVIDE(__pi_id_aa64isar1_override	= id_aa64isar1_override);
-PROVIDE(__pi_id_aa64isar2_override	= id_aa64isar2_override);
-PROVIDE(__pi_id_aa64mmfr0_override	= id_aa64mmfr0_override);
-PROVIDE(__pi_id_aa64mmfr1_override	= id_aa64mmfr1_override);
-PROVIDE(__pi_id_aa64mmfr2_override	= id_aa64mmfr2_override);
-PROVIDE(__pi_id_aa64pfr0_override	= id_aa64pfr0_override);
-PROVIDE(__pi_id_aa64pfr1_override	= id_aa64pfr1_override);
-PROVIDE(__pi_id_aa64smfr0_override	= id_aa64smfr0_override);
-PROVIDE(__pi_id_aa64zfr0_override	= id_aa64zfr0_override);
-PROVIDE(__pi_arm64_sw_feature_override	= arm64_sw_feature_override);
-PROVIDE(__pi_arm64_use_ng_mappings	= arm64_use_ng_mappings);
+PI_EXPORT_SYM(id_aa64isar1_override);
+PI_EXPORT_SYM(id_aa64isar2_override);
+PI_EXPORT_SYM(id_aa64mmfr0_override);
+PI_EXPORT_SYM(id_aa64mmfr1_override);
+PI_EXPORT_SYM(id_aa64mmfr2_override);
+PI_EXPORT_SYM(id_aa64pfr0_override);
+PI_EXPORT_SYM(id_aa64pfr1_override);
+PI_EXPORT_SYM(id_aa64smfr0_override);
+PI_EXPORT_SYM(id_aa64zfr0_override);
+PI_EXPORT_SYM(arm64_sw_feature_override);
+PI_EXPORT_SYM(arm64_use_ng_mappings);
 #ifdef CONFIG_CAVIUM_ERRATUM_27456
-PROVIDE(__pi_cavium_erratum_27456_cpus	= cavium_erratum_27456_cpus);
-PROVIDE(__pi_is_midr_in_range_list	= is_midr_in_range_list);
+PI_EXPORT_SYM(cavium_erratum_27456_cpus);
+PI_EXPORT_SYM(is_midr_in_range_list);
 #endif
-PROVIDE(__pi__ctype			= _ctype);
-PROVIDE(__pi_memstart_offset_seed	= memstart_offset_seed);
-
-PROVIDE(__pi_swapper_pg_dir		= swapper_pg_dir);
-
-PROVIDE(__pi__text			= _text);
-PROVIDE(__pi__stext               	= _stext);
-PROVIDE(__pi__etext               	= _etext);
-PROVIDE(__pi___start_rodata       	= __start_rodata);
-PROVIDE(__pi___inittext_begin     	= __inittext_begin);
-PROVIDE(__pi___inittext_end       	= __inittext_end);
-PROVIDE(__pi___initdata_begin     	= __initdata_begin);
-PROVIDE(__pi___initdata_end       	= __initdata_end);
-PROVIDE(__pi__data                	= _data);
-PROVIDE(__pi___bss_start		= __bss_start);
-PROVIDE(__pi__end			= _end);
+PI_EXPORT_SYM(_ctype);
+PI_EXPORT_SYM(memstart_offset_seed);
+
+PI_EXPORT_SYM(swapper_pg_dir);
+
+PI_EXPORT_SYM(_text);
+PI_EXPORT_SYM(_stext);
+PI_EXPORT_SYM(_etext);
+PI_EXPORT_SYM(__start_rodata);
+PI_EXPORT_SYM(__inittext_begin);
+PI_EXPORT_SYM(__inittext_end);
+PI_EXPORT_SYM(__initdata_begin);
+PI_EXPORT_SYM(__initdata_end);
+PI_EXPORT_SYM(_data);
 
 #ifdef CONFIG_KVM
 
diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
index 466544c47dca..e4a525a865c1 100644
--- a/arch/arm64/kernel/vmlinux.lds.S
+++ b/arch/arm64/kernel/vmlinux.lds.S
@@ -319,6 +319,7 @@ SECTIONS
 
 	/* start of zero-init region */
 	BSS_SECTION(SBSS_ALIGN, 0, 0)
+	__pi___bss_start = __bss_start;
 
 	. = ALIGN(PAGE_SIZE);
 	__pi_init_pg_dir = .;
@@ -332,6 +333,7 @@ SECTIONS
 	. = ALIGN(SEGMENT_ALIGN);
 	__pecoff_data_size = ABSOLUTE(. - __initdata_begin);
 	_end = .;
+	__pi__end = .;
 
 	STABS_DEBUG
 	DWARF_DEBUG
-- 
2.49.0.987.g0cc8ee98dc-goog

