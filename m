Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F2A1F0991
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 11:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746271375; cv=none; b=MO6KwmySoFs6z1RU8/XBRVePOUWtrNswPcNuuqtW34g1fkj/OocVFcMa2PR/jUjtoeKHZUez8KiE9sL2cIkm2V6PVV975CXRepMSdIDQd7wMRusVkg3+p4R79A956hS98fYg9rcuEHhff7W6xePsPs3CdIDOcfMHyA9YFegmBqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746271375; c=relaxed/simple;
	bh=+VDQbT7DbDc/3D5PDwuSsfdKs0/KBM0En23dVlhtcXw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KZTgUMBlrjIr3UJeEw1R/mqbS+KSKx4QAAJf3GctLEl3gQu7WXZ5Z0ei9pWNvlCByqBPuv/iHBH0yrTSuu+OdMPt79paqYv78ERCkzkLS4n164qXb/c1Iuz5p2mn0sqeoN92xGpJodpxISEdiVlXV4V1n8sRjbXkRl4aPS4vdSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1mzddDoW; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1mzddDoW"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-44059976a1fso12403315e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 03 May 2025 04:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746271372; x=1746876172; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q7pRJ8N5ohYmMmQpK3FOw1IcRE7JKZ5K0Zu4pd8yknU=;
        b=1mzddDoWfQvFXk8GmLVVNL5wGkuznEdemWO3P459C7ZZVImyi8K1AboF+LldPbpW6M
         CGc1dDkGZwvg4NYn6ifymmcUCQgmxqBxmLfHiO0OnO5mXj1dsmWQnX3eP1yKqGdRy5sl
         trvVOQVH1rng3s5B7l9ZvP7H3w1pKCsabL/1F5pgomOfWdJqFwEOm2zz9/wtwtUTC3JH
         R3xDgylIfzn6tnGHHEk2sc12CoybZ5j8qANcSYFfAPITu4hP8891Wsi851zuXy7Tuvqd
         CQJM5K83eqTl8hRqV1g7CEL93cPh2Irc6h6oaa/XgjmT6U++LDkf/T+QClrMRNZ7dCi2
         aI1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746271372; x=1746876172;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q7pRJ8N5ohYmMmQpK3FOw1IcRE7JKZ5K0Zu4pd8yknU=;
        b=BMtjGK9kLZ3+CLWJol1fcZEO1TK6vE1opJ9H+27ZvG9cKsQ1TqKJU8UK6OZWFL9VCg
         v8nUFkwHmMvLnx0iTk8vzY80tLiT+QGltkxX8KhADQXA7UdtD4pgfeTY288Ujn0jfP0z
         NCB35FRvFX61yIMgxbdMPpksRpcrW+NPF3FJW3mg22BRroRi07DvPp4HMyeI+YRRckxg
         dkzmxBe9C1IHttn++rOYH41cY40PMlYug+tPLEmg8JAXj7O0OpdpXrt0hljau+9bUVAK
         CBOvpf/dQ+kcEHFvIgz2Dy9/+Emado3jsb4gTN02iY6uKo8eeU8aaDzwIvFjP9nHeoEC
         jf/Q==
X-Gm-Message-State: AOJu0YwKRQMR4+jL4yOPD+sXB0kTLK20gmpZHgw3sEUfFyqA7PaUqD1b
	zGhjkBTAvkk2Z9UO0S2imuglvyRI8k9VmB9oRQqizLsqCNL65sESZtlNjRn8HYp39cimJg==
X-Google-Smtp-Source: AGHT+IGboVfEOD8882gZCl/QlgqflxehOhB9nxaCA5MID+YskJ5d9TwwGKK3gZH+A3IjbiJJ2z9JfmFe
X-Received: from wmbhh15.prod.google.com ([2002:a05:600c:530f:b0:43b:c336:7b29])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:19c6:b0:43c:e9f7:d6a3
 with SMTP id 5b1f17b1804b1-441bbec2a80mr53186055e9.13.1746271372192; Sat, 03
 May 2025 04:22:52 -0700 (PDT)
Date: Sat,  3 May 2025 13:21:40 +0200
In-Reply-To: <20250503112137.1962910-5-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250503112137.1962910-5-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=4347; i=ardb@kernel.org;
 h=from:subject; bh=FO55xdVOEfcY87NzOXPLkNoCVvwAS3bVLAgszquzX5g=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIUP0j0v0th2fdRYv7OQpeHRav4OzfLFqgYBZ2bwDyi7H3
 QVsK0w6SlkYxDgYZMUUWQRm/3238/REqVrnWbIwc1iZQIYwcHEKwES2azEyHNzXzGsqayex1MKt
 RGqis3SjaVvopJir969OPyoirNAYxfCb7U6F0Q9J45j4Oj/GK+8EGE+vXP9gea6jR967Oj6h2hm 8AA==
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <20250503112137.1962910-7-ardb+git@google.com>
Subject: [PATCH 3/3] arm64/boot: Disallow BSS exports to startup code
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	mark.rutland@arm.com, Ard Biesheuvel <ardb@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

BSS might be uninitialized when entering the startup code, so forbid the
use of any variables that live after __bss_start in the linker map.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/kernel/image-vars.h  | 66 +++++++++++---------
 arch/arm64/kernel/vmlinux.lds.S |  2 +
 2 files changed, 37 insertions(+), 31 deletions(-)

diff --git a/arch/arm64/kernel/image-vars.h b/arch/arm64/kernel/image-vars.h
index a0977f7cd3ec..a70244d1aa2a 100644
--- a/arch/arm64/kernel/image-vars.h
+++ b/arch/arm64/kernel/image-vars.h
@@ -10,6 +10,12 @@
 #error This file should only be included in vmlinux.lds.S
 #endif
 
+#define PI_EXPORT_SYM(sym)		\
+	__PI_EXPORT_SYM(sym, __pi_ ## sym, Cannot export BSS symbol sym to startup code)
+#define __PI_EXPORT_SYM(sym, pisym, msg)\
+	PROVIDE(pisym = sym);		\
+	ASSERT(sym < __bss_start, #msg)
+
 PROVIDE(__efistub_primary_entry		= primary_entry);
 
 /*
@@ -36,39 +42,37 @@ PROVIDE(__pi___memcpy			= __pi_memcpy);
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
-PROVIDE(__pi_init_idmap_pg_dir		= init_idmap_pg_dir);
-PROVIDE(__pi_init_idmap_pg_end		= init_idmap_pg_end);
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
+PI_EXPORT_SYM(init_idmap_pg_dir);
+PI_EXPORT_SYM(init_idmap_pg_end);
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
index 73fa57f341b0..bd7626b8c7a3 100644
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
2.49.0.906.g1f30a19c02-goog

