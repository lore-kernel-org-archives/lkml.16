Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6911A288C28
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 13:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746623428; cv=none; b=DL6V4pVh1U7g4KBYjDZgjeF9pc90B01EGIMTaTaA8rdLAO0M+9NSRC4Ut6sLT22oCbUlHkySvW4ZFfctaS2EX5WmvuN1lKAr/jK7PHEL8o0u8pyMBJmXhUDJHaluju+rZg/JDe5Fi3yGV5zxHRxrcTPg3QLQGgN1/dcF8B/ULEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746623428; c=relaxed/simple;
	bh=YF1vIiH/qOVYzV937TzGqNitr/Wij5jIw0YiTEHw5Lk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O5CgjiS3kEdfOo4wC5xwDKSP8EFVLj0DdVLHhflJuFZIGh5oaBzV89Gia+m17jPgba8kvtb4+/Bg9Dc4Xa0mQARIZzdjg5jvixsTviIbEF/LGumym4JIgwUybFV9acujbmf9iORRmEiTsM/Vl9gqI7XjevdWRaglei0hrsKEn0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mlTsqZt6; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mlTsqZt6"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43d16a01deaso6352335e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 06:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746623425; x=1747228225; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lC+ktlKoRWuVQ406Z311foD+S65DvOr4KvPAMwhmT4Q=;
        b=mlTsqZt69p/fvhvApfk1tZlrydOSfrOtI+mrTj8i1lbEQ5uTdtt2U1RcL4eis6g8ho
         kuuZg4guRdn1Yw3DW+tYUK7FfZ2EiQJiGQXr9fvhK+qyL+Zln+o+HT3Kq+hNVV1RXjEI
         YD7GSqnKlYBSy3oEuvZnKRZnzyGfCNRf1y6T0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746623425; x=1747228225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lC+ktlKoRWuVQ406Z311foD+S65DvOr4KvPAMwhmT4Q=;
        b=Ffv/hDhlwB+1ERy2ZeYXMhLNxEbU+z+WAyVweTOu41tqUwejRQybBx44STkN88x7o2
         +qEQLGPGzDGP8q9WoG/rkakXzOJGeOKAp3It4cgPjQ3DBBSic1M7Bkh/z0ILqTQ3mUSJ
         yN+QX1nd0skXbvKXGa2ujweNhzt8JkqufjEwF9KVrJ+H63Qv05TOldLIKzFBg7kd0f75
         X96/pl4AmDMtNTo/3HVCVkghrPbLS7TZHvLC7ir6P1gCRFXOtMV2dH6wsKLpWYBISkbi
         LJkfyfEY2cVGtDQgF8CLyj5hnzVGp/+/3WqECuZUJcw8yKreNa7lk0NO/e78BFW+t7zo
         pHbg==
X-Forwarded-Encrypted: i=1; AJvYcCV29FRH0ML0i3gKJzYME0LkD2yk5B5PTC9JJBenkYoey6q3fiWaeEdNDaqzOmkIJsNONovw8VDobmSfNeE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyE9oNPVialXi21gOWmK+aH95ofsWuNBbS93qHKl6xingk6+Un6
	zvwJ54BOWtRK6KrubIBOxl/m10aZDZXItBM67vXQFAjAyHy0l7i7Y9/NPgq2VTsUOz7/NPNJ7CL
	zvg==
X-Gm-Gg: ASbGncsiFgjmujhHlV6qt1Lj1rJapvk+vhpBG3/Qu0E1x/na7j8DhP9Zl2vCCT17sxQ
	DRWlE6X+JXzdLF5Bxqzj8VTO/oau7X363h5AKq0A01Hgityfg1l7c4Ue17jj+TRXE1zQQNwWNy0
	g3m1efgwNwmLqNxtVaOYhWnB7JtluV75FWdjKnjfzJGElRFmb0lL6Mf4FpCLQeWOA0fFMDBSDmx
	9koAih/r3UjCfMvXYzy5F/cs/z2akB5ypT4oUjZXZv0p7+oLlHh6QkX5IwbMGoeo6LsfMkU7JZ5
	Uy3d7tJKy20NMDPgrT5dklNLAfwTob3/zWbfJ7Jk7g3kheUa6AfzzdRi
X-Google-Smtp-Source: AGHT+IHfIoz1B8ERUft6e6R9XHeFEZYHizVLysz1ooqXs2VtmpBSdGwrsOUK5GBUxOo0UEdbIamAwA==
X-Received: by 2002:a05:600c:cca:b0:439:a3df:66f3 with SMTP id 5b1f17b1804b1-441d44e57d6mr10555525e9.6.1746623424618;
        Wed, 07 May 2025 06:10:24 -0700 (PDT)
Received: from revest.zrh.corp.google.com ([2a00:79e0:9d:6:558d:e1fb:c2ec:7513])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd32adcasm647435e9.6.2025.05.07.06.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 06:10:24 -0700 (PDT)
From: Florent Revest <revest@chromium.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	akpm@linux-foundation.org,
	broonie@kernel.org,
	thiago.bauermann@linaro.org,
	jackmanb@google.com,
	Florent Revest <revest@chromium.org>
Subject: [PATCH v2 2/4] mm: remove CONFIG_ARCH_USES_HIGH_VMA_FLAGS
Date: Wed,  7 May 2025 15:09:58 +0200
Message-ID: <20250507131000.1204175-3-revest@chromium.org>
X-Mailer: git-send-email 2.49.0.987.g0cc8ee98dc-goog
In-Reply-To: <20250507131000.1204175-1-revest@chromium.org>
References: <20250507131000.1204175-1-revest@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Over the years, include/linux/mm.h has grown to use high VMA flags bits
in various ways. Some usages, like mseal(), are guarded by CONFIG_64BIT
while others like CONFIG_ARM64_MTE select
CONFIG_ARCH_USES_HIGH_VMA_FLAGS and depend on the VM_HIGH_ARCH* macros that
are guarded by that config.

Since CONFIG_ARCH_USES_HIGH_VMA_FLAGS only guards bit mask definitions,
it is safe to use on any CONFIG_64BIT config. Additionally, since all
configs that currently select CONFIG_ARCH_USES_HIGH_VMA_FLAGS depend on
CONFIG_64BIT, there should be no regressions.

Signed-off-by: Florent Revest <revest@chromium.org>
---
 arch/arm64/Kconfig   | 3 ---
 arch/powerpc/Kconfig | 1 -
 arch/x86/Kconfig     | 2 --
 include/linux/mm.h   | 4 ++--
 mm/Kconfig           | 2 --
 5 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index a182295e6f08b..2a0d45b16b7fd 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -2149,7 +2149,6 @@ config ARM64_MTE
 	# Required for tag checking in the uaccess routines
 	select ARM64_PAN
 	select ARCH_HAS_SUBPAGE_FAULTS
-	select ARCH_USES_HIGH_VMA_FLAGS
 	select ARCH_USES_PG_ARCH_2
 	select ARCH_USES_PG_ARCH_3
 	help
@@ -2196,7 +2195,6 @@ menu "ARMv8.9 architectural features"
 config ARM64_POE
 	prompt "Permission Overlay Extension"
 	def_bool y
-	select ARCH_USES_HIGH_VMA_FLAGS
 	select ARCH_HAS_PKEYS
 	help
 	  The Permission Overlay Extension is used to implement Memory
@@ -2235,7 +2233,6 @@ config ARM64_GCS
 	bool "Enable support for Guarded Control Stack (GCS)"
 	default y
 	select ARCH_HAS_USER_SHADOW_STACK
-	select ARCH_USES_HIGH_VMA_FLAGS
 	depends on !UPROBES
 	help
 	  Guarded Control Stack (GCS) provides support for a separate
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 6722625a406a0..e444191206b32 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -1043,7 +1043,6 @@ config PPC_MEM_KEYS
 	def_bool y
 	depends on PPC_BOOK3S_64
 	depends on PPC_64S_HASH_MMU
-	select ARCH_USES_HIGH_VMA_FLAGS
 	select ARCH_HAS_PKEYS
 	help
 	  Memory Protection Keys provides a mechanism for enforcing
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 4b9f378e05f6b..e74ba77a066e6 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -1818,7 +1818,6 @@ config X86_INTEL_MEMORY_PROTECTION_KEYS
 	def_bool y
 	# Note: only available in 64-bit mode
 	depends on X86_64 && (CPU_SUP_INTEL || CPU_SUP_AMD)
-	select ARCH_USES_HIGH_VMA_FLAGS
 	select ARCH_HAS_PKEYS
 	help
 	  Memory Protection Keys provides a mechanism for enforcing
@@ -1900,7 +1899,6 @@ config X86_USER_SHADOW_STACK
 	bool "X86 userspace shadow stack"
 	depends on AS_WRUSS
 	depends on X86_64
-	select ARCH_USES_HIGH_VMA_FLAGS
 	select ARCH_HAS_USER_SHADOW_STACK
 	select X86_CET
 	help
diff --git a/include/linux/mm.h b/include/linux/mm.h
index fdda6b16263b3..da8f99a026deb 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -297,7 +297,7 @@ extern unsigned int kobjsize(const void *objp);
 #define VM_NOHUGEPAGE	0x40000000	/* MADV_NOHUGEPAGE marked this vma */
 #define VM_MERGEABLE	0x80000000	/* KSM may merge identical pages */
 
-#ifdef CONFIG_ARCH_USES_HIGH_VMA_FLAGS
+#ifdef CONFIG_64BIT
 #define VM_HIGH_ARCH_BIT_0	32	/* bit only usable on 64-bit architectures */
 #define VM_HIGH_ARCH_BIT_1	33	/* bit only usable on 64-bit architectures */
 #define VM_HIGH_ARCH_BIT_2	34	/* bit only usable on 64-bit architectures */
@@ -312,7 +312,7 @@ extern unsigned int kobjsize(const void *objp);
 #define VM_HIGH_ARCH_4	BIT(VM_HIGH_ARCH_BIT_4)
 #define VM_HIGH_ARCH_5	BIT(VM_HIGH_ARCH_BIT_5)
 #define VM_HIGH_ARCH_6	BIT(VM_HIGH_ARCH_BIT_6)
-#endif /* CONFIG_ARCH_USES_HIGH_VMA_FLAGS */
+#endif /* CONFIG_64BIT */
 
 #ifdef CONFIG_ARCH_HAS_PKEYS
 # define VM_PKEY_SHIFT VM_HIGH_ARCH_BIT_0
diff --git a/mm/Kconfig b/mm/Kconfig
index e113f713b4938..1fff7f8bfa96f 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -1127,8 +1127,6 @@ config DEVICE_PRIVATE
 config VMAP_PFN
 	bool
 
-config ARCH_USES_HIGH_VMA_FLAGS
-	bool
 config ARCH_HAS_PKEYS
 	bool
 
-- 
2.49.0.987.g0cc8ee98dc-goog

