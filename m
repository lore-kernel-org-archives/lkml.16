Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C03290098
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 20:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744315578; cv=none; b=AZLhZWsmjrU2Y7FgOd6j0OUbbnQOfdSRXiv8zFGqNLuKdrQt1uQ3OtnsYll/ILgNNtuT0VYYr+fKJ1qxdl4wBfuzpmlZ3I98E+zgzs7GYHDoSi0pxqPsM1cdjGNR5Yg0uJOsYvFENoQWVOEHkDI+tP2W2jNN5lOSiYlGcfGPNx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744315578; c=relaxed/simple;
	bh=xD9ApAaVPyeGascG2+ua9jd5S2N8UZHcaeWpYZQvO5I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Y5kfYQhWdO1IgNp7XnTw1PSricdy1RGvvdVXnvG6F14WuB5HtHc+rmVmIWQPK6pPsgzxfMrItQJ9wlwOdlKLx8JBAY/CLqJDZU5CU8YBf0okvJIYfq0RGXisP6cfLDrQuJL8crBsJXtiZ7fxlOegFES9q/zJSmgISpr93D8KqgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dylanbhatch.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=v8FVh2IE; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dylanbhatch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="v8FVh2IE"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-af5cd71de6aso802902a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 13:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744315576; x=1744920376; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7kS8vY4y5fNjBDG1XCbo8zqqTmNANV4Y3M3y6uH8wf8=;
        b=v8FVh2IEwCbUprN4R2U1q3eDpxUPysvUzPQ6iP/iev8GO2tWEuaGsrGPQHP0wF/coU
         Wig1pdyUYF5m3GH/c12Z7hzAg/DFb06pfEfgedVwfVi/DjO9tKpbnGA1sOanrxf6CN1u
         LIWmcaHHRY7xrHGPwVTpKPV49wJ6PIIxdWBa22iSrD/vZsz33a9YotiqzFVvC2u1zDaE
         SCi+jMeAVl6ObSc8da6vGx7Yr23CgbkVOxW76y0wEdoAPvRWtSdOJbvKx3f84rluqgD+
         84W53RLxdWitgnD0zDOcULO/CmOpw26mqMzb6LWhtpaggDRkgj7j9l0zQ1HPFNUhWXZU
         0k2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744315576; x=1744920376;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7kS8vY4y5fNjBDG1XCbo8zqqTmNANV4Y3M3y6uH8wf8=;
        b=u1TPMJiAjvXaWkNWGOidVby9bGAJgwkElTZetJ9+N8atc+CN3BAjFIrS58WGfUkWOc
         ticBjQxcy8s65xcuoIerClAsqqR6yyN61jdFcFI18bSQjoSQu7h24ZvE1DrBm4Oqn0pr
         cd6SdagOMSCiJtO12iDKoIj4qbXJT1W3l7M2iHPIGcmj7FLAyrWsyJKSU1q+EfNCRiSc
         uiL3WnPHrquyM5QGjEB3/Ktz7ZpZgQGmlXGWAXLKM2XY4ab6x4N+uQHA55T31ZVgVEaK
         hw7flLSfTvwIi/ZJpw4GoEFbUGfEY78NsWTotKpZHUv8Y0R+FjImXbeI9N4xG0es4j+B
         sceQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaohnDkexOjeZpy7ldgWBBK1b4ajAc81SbwzWn1mpQU1ULbbJ4WRejbnlzPw7ygqgi30BL1kJMqDf/ed8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0hNOZjwn/yHY2XQTn2qJrwrmOYkHnZfrJKXE67SSVuh4EG+vp
	GH1I+D94Ovxgm+tzxiavDFOc1th0WZAchirtKij85qUZwU8rsCTSvlFrtjtwtnX+Sdup3xGhjPa
	ik7LGkOdSiOYRe5HIhsIhtQ==
X-Google-Smtp-Source: AGHT+IGQRaRiD7tN7okaIW2bRMXMvAm26kWqcBfhZ+Bflriw74pMndYmCVVrb+m1DAVrC3q+nit0w4aTmBZQpFpAig==
X-Received: from pglw29.prod.google.com ([2002:a63:161d:0:b0:af2:4e8c:1cc0])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:318c:b0:1f5:889c:3ccc with SMTP id adf61e73a8af0-201797a30b0mr320101637.14.1744315576290;
 Thu, 10 Apr 2025 13:06:16 -0700 (PDT)
Date: Thu, 10 Apr 2025 20:06:05 +0000
In-Reply-To: <20250410200606.20318-1-dylanbhatch@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250410200606.20318-1-dylanbhatch@google.com>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250410200606.20318-2-dylanbhatch@google.com>
Subject: [PATCH 1/2] arm64: patching: Make text-poke src pointer const.
From: Dylan Hatch <dylanbhatch@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Song Liu <song@kernel.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Dylan Hatch <dylanbhatch@google.com>, Roman Gushchin <kfree@google.com>
Content-Type: text/plain; charset="UTF-8"

Match the signature of memcpy() and enforce this envariant. Allows this
API to be interchangeable with memcpy().

Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
---
 arch/arm64/include/asm/text-patching.h |  2 +-
 arch/arm64/kernel/patching.c           | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/text-patching.h b/arch/arm64/include/asm/text-patching.h
index 587bdb91ab7a6..d61280238c81d 100644
--- a/arch/arm64/include/asm/text-patching.h
+++ b/arch/arm64/include/asm/text-patching.h
@@ -9,7 +9,7 @@ int aarch64_insn_write(void *addr, u32 insn);
 
 int aarch64_insn_write_literal_u64(void *addr, u64 val);
 void *aarch64_insn_set(void *dst, u32 insn, size_t len);
-void *aarch64_insn_copy(void *dst, void *src, size_t len);
+void *aarch64_insn_copy(void *dst, const void *src, size_t len);
 
 int aarch64_insn_patch_text_nosync(void *addr, u32 insn);
 int aarch64_insn_patch_text(void *addrs[], u32 insns[], int cnt);
diff --git a/arch/arm64/kernel/patching.c b/arch/arm64/kernel/patching.c
index 1041bc67a3eee..69494db3a578e 100644
--- a/arch/arm64/kernel/patching.c
+++ b/arch/arm64/kernel/patching.c
@@ -102,9 +102,9 @@ noinstr int aarch64_insn_write_literal_u64(void *addr, u64 val)
 	return ret;
 }
 
-typedef void text_poke_f(void *dst, void *src, size_t patched, size_t len);
+typedef void text_poke_f(void *dst, const void *src, size_t patched, size_t len);
 
-static void *__text_poke(text_poke_f func, void *addr, void *src, size_t len)
+static void *__text_poke(text_poke_f func, void *addr, const void *src, size_t len)
 {
 	unsigned long flags;
 	size_t patched = 0;
@@ -132,12 +132,12 @@ static void *__text_poke(text_poke_f func, void *addr, void *src, size_t len)
 	return addr;
 }
 
-static void text_poke_memcpy(void *dst, void *src, size_t patched, size_t len)
+static void text_poke_memcpy(void *dst, const void *src, size_t patched, size_t len)
 {
 	copy_to_kernel_nofault(dst, src + patched, len);
 }
 
-static void text_poke_memset(void *dst, void *src, size_t patched, size_t len)
+static void text_poke_memset(void *dst, const void *src, size_t patched, size_t len)
 {
 	u32 c = *(u32 *)src;
 
@@ -152,7 +152,7 @@ static void text_poke_memset(void *dst, void *src, size_t patched, size_t len)
  *
  * Useful for JITs to dump new code blocks into unused regions of RX memory.
  */
-noinstr void *aarch64_insn_copy(void *dst, void *src, size_t len)
+noinstr void *aarch64_insn_copy(void *dst, const void *src, size_t len)
 {
 	/* A64 instructions must be word aligned */
 	if ((uintptr_t)dst & 0x3)
-- 
2.49.0.604.gff1f9ca942-goog

