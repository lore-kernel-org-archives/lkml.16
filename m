Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A83D14B965
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 09:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746525183; cv=none; b=qv+qXOMr4ezPAmnVsWP7lnIYEY8e/rVXBrT9HB30FVfsqwLYUMNpt+xQg5uLsmIG7aXRsKafn5IGEeNF2RhvhhLnIlKduIc3mMwDNUbrDMD5IAMMkpEiFzZdrCpwNFzgBBC6MzcpF9gJyWX4E+E3mNJic8Kz15rStGHdNyzJNw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746525183; c=relaxed/simple;
	bh=S1wWO8TnSaKl3RcppjsccS2lidIwJmBAs0ZKqfh3PCE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=utsqEK7/wo8ZfmhLCqleYBCMNcbc+qsZ3DFKKeAsH3zS+yTeK02uPeUNkV3PfF3muUor52n1YNkSacuqf21R2EbXKThY3aD0IK/b+l4xyLIAE4NdEtJ8QBGZFOdLdFF7U5vfNz6akRXwAHJOahDseyvol2GQ8G6HHc2ivWQZgtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=AGyXp3qm; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AGyXp3qm"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3912622c9c0so280738f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 02:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746525180; x=1747129980; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4NGd39kNyH5imgbx4iJNuF/o2b5vxFS/Ovh2fwMTeXE=;
        b=AGyXp3qm0SpPahPL2gjAE9Qx4mggRCsMyzgW56V6adsxJSlMPgmEGyEDVctbycE7ww
         lP0jqOs5UNbdt5jTnnkIr9+yd4r2h7QDiGf7CUSXYMYEv1tAhQuURvnf1BRs5VL8zWIz
         /ja6iE0kqcgCgUwxbz/jtbbUPwe6Nox0N0Ygc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746525180; x=1747129980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4NGd39kNyH5imgbx4iJNuF/o2b5vxFS/Ovh2fwMTeXE=;
        b=Bhlc1Cb3DDfHrI5qwKpOFiAd7A9GAuz1r0dY+ZjoDJiB1MzwEElbjp2+14j0S+CMv0
         OvTbC0V9UuHH/NlbP7fNJ96aIMsT81rhSAsRq2dAP6UPwAPGqh+NM96nQJddO9VuVoYA
         MPAFqcaNVu5F3BCDrAZ8ThMEw0pmXCrOBbdJnoSdPpsUaYHNSpQPJ/MSUmQSRS32qbyl
         HpM9SenWhp+2U5+OXQbQhVtNxBjOGacZuefJS6co2CtscnXAIvXzypiIoDXGk/eAx/NE
         1VlShOR9kYMBrkyxqlf5nNjL18D7xeSeu7NbQK5g7I5XStjYgI810U9EHbGGqll9uDvO
         nOhg==
X-Forwarded-Encrypted: i=1; AJvYcCUTzN/ApvI28sOKqbJPfjsg+aJL1qZZ89LNslaLqJCISeox4rDY466SH86T355UhSjB3wnPe2lu3hBZyJg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYwB5gTTB3pT1bSx5qhU/ZBd6WzjewGgG7qI0tOpPXNALuOVQy
	rCnuGvFho/NQq+L/Ot8s+Eaa501YKmjghY3f+rwica3ZOhdyzohdcTfLbtAbAQ==
X-Gm-Gg: ASbGncvLk4kRLO3Rh7tePep696GfcYYihy9bk27ZutWnOT3nll1RhffKRvUBT5Jqhvf
	krc/XW/11HgV3YQTg6fS2g2KuIvFIT2NRhQSdIZESykBx/YLQRRBF+5I6bBnkQyRh1dt8BauFnw
	GXVhEeZ+Igb35VwrrSjEuIDZSPm2UCDCqNXlHi2FiiH22gnqe4PhlYqqYxpsn2O9TlHUJpj4rT/
	VZKiXTZyOfgyvHl+cb4+EXKkhmfCkrFgaxYiRWkiRh/JwcsiJ6InBVilw/zGei5DVcf1rlUjn8s
	bIRQuxUSOGESUWa4C6YKdtYTQ275WfWdmOtdx4Z8djYrRnDnL12YyCjI
X-Google-Smtp-Source: AGHT+IFvoJ9VWnqzz0zwnnsYUFSbSXpLp8LA0nWbcwEm8mbzOzc2XLDUuiuHDk1KqlBG5f0OAuY0kw==
X-Received: by 2002:a5d:64ef:0:b0:3a0:86f3:451f with SMTP id ffacd0b85a97d-3a099af1f69mr4374591f8f.12.1746525179837;
        Tue, 06 May 2025 02:52:59 -0700 (PDT)
Received: from revest.zrh.corp.google.com ([2a00:79e0:9d:6:7196:3093:b0e3:1016])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae7a46sm12879860f8f.44.2025.05.06.02.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 02:52:59 -0700 (PDT)
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
Subject: [PATCH 2/4] mm: remove CONFIG_ARCH_USES_HIGH_VMA_FLAGS
Date: Tue,  6 May 2025 11:52:22 +0200
Message-ID: <20250506095224.176085-3-revest@chromium.org>
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
In-Reply-To: <20250506095224.176085-1-revest@chromium.org>
References: <20250506095224.176085-1-revest@chromium.org>
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
2.49.0.967.g6a0df3ecc3-goog

