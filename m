Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3520527BF99
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 10:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747737729; cv=none; b=eSNbBRLtLAvY1Uq+kfjns3qsbClgVxf9TSpDum1AM4qVAPmdkayd+9s+uSWOjvWMxkb+i1MpyU1hhLFn8zm/g18oGRIaIiao+BSo52QYLnjKeTfy23LCJt2F9dBC0lCX4Ei2uKzi1T9wNnAhs6ZvhyksJltrk9zST20E8rEChWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747737729; c=relaxed/simple;
	bh=W45HmT31ninpjRwuuev/CEMZQel6YkRqcj7JoSvkj8k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=OP3tMVUwqdDmN3PaqPITLsKfmyWP+o1r35iAXmclMi1t2+BWTVI1xlmqrVw4DzWXqtd7FtgJKHuU1NOnP6zYiJIe11QLt/HRTuYtR8VL3NYKH+pTc3JWcV9LG33h3zxik0zb1tGoht4GIQ41deYOIQop8WCOfG0ZpZdwTniVMqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=P8CNxTYM; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="P8CNxTYM"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43d0830c3f7so38639765e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 03:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747737726; x=1748342526; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fZy+IDBXzgKLanKZ+xE2V66+tUBkSAhldyPA1OsbtpY=;
        b=P8CNxTYMy3gGp85smoz3PY14N4/5QvF891lWS4TZr0AFwrqPD6k5Hj9tVPyeE4d2SS
         /PsfoVA1XJv36UEE+yqxKhmNUJ73LAY5CJt2YVamvIfrC3A1JtHZu3luoqzhG1eATUKD
         /VcYvkLekh9SgRSJGuIA+nkUco7pv1NhFscmNLHw/foFtbApR80pK1DVE9TmdYFkPtZY
         zrbPPPECYLwlnwebOKvOtZdZ2qOqq46hDR7ZxGFJDDeKg3mNoSE3KRJ1g58t43Eg0U2O
         HaTE5E0Lr16FgxNKfJJ+vRXeAUd+HlUOJev8Z4gbD74iVbbMt+6gSkI8tAXkHDQeYm1V
         So/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747737726; x=1748342526;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fZy+IDBXzgKLanKZ+xE2V66+tUBkSAhldyPA1OsbtpY=;
        b=RikIHpNPXfF4C+I9hzaMwWA9fucVRiT0t0/piiE8MF27jt4dDx8Sx8RIkA69YagDBJ
         jj3GyJ+tBh5vxgXRbnA5W7xn6WwSnwHJ7Nz9hb1HtA1E15AeHCkbjQSAb9d60YO+6LO7
         f+PjUhOJyiTlaPJYnLvC7uei85UdafajLUAcTLge10CBM/9PdTkkaVajo7vqbw/k0kj8
         rIbF6mgxCv16M/vzpFNfopgtjezRZYKMuHDkNbwCBYXvgDKtd3Pk8IcaegIELE1UgoEG
         ss/mufbMyKU6i+9I9K2J6ULc0PHnJHw0eA+lu4DAM2pTNpJkjoJLVwLpLXiktLyND1ZD
         aaUw==
X-Gm-Message-State: AOJu0Yy4Bzn6wWyaOvaA0w/I6xFXu1WCK5uoH5OzI/vskTY2aLL1Ep09
	rmaPbYZc35JOQjWYQ7d+jUZMuNFkbb+/M7Lv9pEDELGr2cEEy8NXEXg6gG9z6LL7lzmXnTQV/KQ
	mcakl6jULovBoS7Su145wFrIV4rfLaliwri/MoNNbC5/NRVpDzFrjQbvxJdguq34Uioxz4fL75S
	Q8+gAzQ9Fz3j4GeA2ybT4YOYX6L53uFZ/mAQ==
X-Google-Smtp-Source: AGHT+IG21xn4BDd/lcmmmbmv++gdXJKOAo/qD1hl2zhpIFaXJF2i00ZU0FZcxZJwvhs0XzRg9BSSLN1y
X-Received: from wmrm14.prod.google.com ([2002:a05:600c:37ce:b0:43c:f7c3:c16e])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3554:b0:442:ccfa:fa
 with SMTP id 5b1f17b1804b1-442fd671f7emr149158615e9.27.1747737726496; Tue, 20
 May 2025 03:42:06 -0700 (PDT)
Date: Tue, 20 May 2025 12:41:44 +0200
In-Reply-To: <20250520104138.2734372-9-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250520104138.2734372-9-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2931; i=ardb@kernel.org;
 h=from:subject; bh=EiXObQsxSUMA1XlkIY52ZfeO4kPGYTYzqe8TcVZxEnw=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIUMnJmfl1JzwVZ/O7M4Us1P68I7z7Qb7Nw8uqW6psk++W
 xO3U+hgRykLgxgHg6yYIovA7L/vdp6eKFXrPEsWZg4rE8gQBi5OAZjIXBNGhmm/uewWM9Z8tMrr
 12SoWrJb6pBsgFzg353x5i2PRIOzljMyXD3mUJ8trBhoor7pabap1uX3dtV3p97XfSOet9B4S2s 1PwA=
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250520104138.2734372-14-ardb+git@google.com>
Subject: [PATCH v5 5/7] x86/boot: Drop USE_EARLY_PGTABLE_L5 definitions
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Brian Gerst <brgerst@gmail.com>, 
	"Kirill A. Shutemov" <kirill@shutemov.name>, Borislav Petkov <bp@alien8.de>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Drop USE_EARLY_PGTABLE_L5 definitions, which no longer have any effect.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/boot/compressed/misc.h | 3 ---
 arch/x86/boot/startup/sme.c     | 9 ---------
 arch/x86/kernel/cpu/common.c    | 3 ---
 arch/x86/kernel/head64.c        | 3 ---
 arch/x86/mm/kasan_init_64.c     | 3 ---
 5 files changed, 21 deletions(-)

diff --git a/arch/x86/boot/compressed/misc.h b/arch/x86/boot/compressed/misc.h
index 3157f2fbc593..7f79c426f542 100644
--- a/arch/x86/boot/compressed/misc.h
+++ b/arch/x86/boot/compressed/misc.h
@@ -16,9 +16,6 @@
 
 #define __NO_FORTIFY
 
-/* cpu_feature_enabled() cannot be used this early */
-#define USE_EARLY_PGTABLE_L5
-
 /*
  * Boot stub deals with identity mappings, physical and virtual addresses are
  * the same, so override these defines.
diff --git a/arch/x86/boot/startup/sme.c b/arch/x86/boot/startup/sme.c
index 70ea1748c0a7..a6c25d005991 100644
--- a/arch/x86/boot/startup/sme.c
+++ b/arch/x86/boot/startup/sme.c
@@ -25,15 +25,6 @@
 #undef CONFIG_PARAVIRT_XXL
 #undef CONFIG_PARAVIRT_SPINLOCKS
 
-/*
- * This code runs before CPU feature bits are set. By default, the
- * pgtable_l5_enabled() function uses bit X86_FEATURE_LA57 to determine if
- * 5-level paging is active, so that won't work here. USE_EARLY_PGTABLE_L5
- * is provided to handle this situation and, instead, use a variable that
- * has been set by the early boot code.
- */
-#define USE_EARLY_PGTABLE_L5
-
 #include <linux/kernel.h>
 #include <linux/mm.h>
 #include <linux/mem_encrypt.h>
diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index 8feb8fd2957a..256613b24bd4 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -1,7 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/* cpu_feature_enabled() cannot be used this early */
-#define USE_EARLY_PGTABLE_L5
-
 #include <linux/memblock.h>
 #include <linux/linkage.h>
 #include <linux/bitops.h>
diff --git a/arch/x86/kernel/head64.c b/arch/x86/kernel/head64.c
index fe0770f468c3..5e5da6574a83 100644
--- a/arch/x86/kernel/head64.c
+++ b/arch/x86/kernel/head64.c
@@ -5,9 +5,6 @@
  *  Copyright (C) 2000 Andrea Arcangeli <andrea@suse.de> SuSE
  */
 
-/* cpu_feature_enabled() cannot be used this early */
-#define USE_EARLY_PGTABLE_L5
-
 #include <linux/init.h>
 #include <linux/linkage.h>
 #include <linux/types.h>
diff --git a/arch/x86/mm/kasan_init_64.c b/arch/x86/mm/kasan_init_64.c
index 0539efd0d216..7c4fafbd52cc 100644
--- a/arch/x86/mm/kasan_init_64.c
+++ b/arch/x86/mm/kasan_init_64.c
@@ -1,9 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 #define pr_fmt(fmt) "kasan: " fmt
 
-/* cpu_feature_enabled() cannot be used this early */
-#define USE_EARLY_PGTABLE_L5
-
 #include <linux/memblock.h>
 #include <linux/kasan.h>
 #include <linux/kdebug.h>
-- 
2.49.0.1101.gccaa498523-goog

