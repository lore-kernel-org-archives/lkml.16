Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E717118024
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 01:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744420218; cv=none; b=XIO7jrKkjoPB2P0dBq7oWrFraYkroAHGH+STOkaQJjjZSJrpjh806Aptnbtgdm9PN7WpdHWaa/PTTMMpNpHFYC5t09ERJ+qYPLJRAmjMlH4XXWnDgT9vVMHNRbugowDxfWV2mMWJvNV8fqqpCnMW7SLlNMG9HQlhjLw8i+zOzGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744420218; c=relaxed/simple;
	bh=C5rogbPNUI6pHPavbIdCjxlMXwhFBMWl+E2se2tXjDY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=n18GZsITvNjQHrJ/YE/vEUlZtTOBWGc/Z/5Z/ITZ5Q1hVYKy3oDzYmqd03NgZz2zeG7NEPwJpI0suIeVDLUd8SfRRA+uzXlLgk4J84GpaRzj97qW9SD/LkcQ27pE24gUwsCHO6dOLp+i49R2JsAqrGglssNP1jzEPmq8xsLsK2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dylanbhatch.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Kl02uR/f; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dylanbhatch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Kl02uR/f"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2242ade807fso39242355ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 18:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744420216; x=1745025016; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bWDHpUBhtTe2FgO8fryMDFRusp4rjFHy5/tTaSl+b7o=;
        b=Kl02uR/fSXOpeM/M9QoOvuqCFZIjOLg0onSJGa2SBgqgtJc7yy3WwAKyHT+YaSsTRE
         HQhrrfHXGvbfBBXKoaqjaYpxaPf/ndxqmpWSs/VPOn5NdcxW7+Ui0AGXQkO/Vy4TWOAh
         d9xfjaw7kEnQwLil/pDnSnypGSp9+Mu3F3IDqbpcm/HFa2NZB8p9DIJyekl1hWveS0Um
         XMqoksvna7Y7vEtzZnSoFQ+kVKvzGeNmUKF2UUZTUUXQ+WcZk/FQeQQ30yMC5Rmvuzdf
         MfALmHDEbvRP4npQKfJSiN2KVP8MAM/EgYn2u6HU2WPQNxLjeu6bF4221OFQ3UpABkvP
         Vfag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744420216; x=1745025016;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bWDHpUBhtTe2FgO8fryMDFRusp4rjFHy5/tTaSl+b7o=;
        b=gJm3T5x/BwzLhAfUCoBuVr0E084nLLzJBpwJbYBmwfzSdia6dkCteMOOSGSfE1/gh4
         2SYtsbqEygTpHbR6J/Ba2eTeGuAzHlpM0gzOLTT1hdCMBqcLyPEyTjGYyK3hAqAZ+2Xd
         WTM9rGVMq664ZwJCGPw8i+qHzOtt+e6HpUOJgUE4l71BpZlKibpwLXFwKXl+q6qg8aQ8
         6l1tRQD2xYwf87S8o9DEuJffHbcpiUNNmYmrLOcuBCIdtH4Eo5h8AXtc/9oLhviA58R9
         fz4LrUuUW0zNMMOqGhivhWY3yfeizwWHK/DdYROHJe6nBA01SbHiOlDtUwL2/6TAup88
         bFQg==
X-Forwarded-Encrypted: i=1; AJvYcCWEYX8PuD0TS5MQh0UE09MYVTWv5JbQC2uMmP1nTqHh2+toldRgATx62dzLuFT0QCz3cJGcbRd0pJSmLEE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTPFKH/eEtI5ATG/JGGhLT6hyX6BCAW2Q82XaB8sMNEEM43S38
	iC4ntcmUONT2fTacQDVV4Yrrw9SNJ/10RY5FHfVsOMIK0V/1T99UJoyuT3SceH2LFWC73Vej/vA
	ph/aBg9f8/BxpSjsZLD1rIQ==
X-Google-Smtp-Source: AGHT+IHVLYuzqpZRTCktPu5rFIJT1KD3DgXm1NNnlt3I7puZQhJBEjVGAwIu34AVxzFmVqO3ENhw/4jf261UUYOPSg==
X-Received: from pltf12.prod.google.com ([2002:a17:902:74cc:b0:224:2ae9:b271])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:1aa5:b0:223:377f:9795 with SMTP id d9443c01a7336-22bea3de1a8mr72996465ad.0.1744420216287;
 Fri, 11 Apr 2025 18:10:16 -0700 (PDT)
Date: Sat, 12 Apr 2025 01:09:38 +0000
In-Reply-To: <20250412010940.1686376-1-dylanbhatch@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250412010940.1686376-1-dylanbhatch@google.com>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250412010940.1686376-2-dylanbhatch@google.com>
Subject: [PATCH v2 1/2] arm64: patching: Rename aarch64_insn_copy to text_poke.
From: Dylan Hatch <dylanbhatch@google.com>
To: Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
	Xu Kuohai <xukuohai@huaweicloud.com>, 
	"=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=" <philmd@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Song Liu <song@kernel.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Dylan Hatch <dylanbhatch@google.com>, Roman Gushchin <roman.gushchin@linux.dev>
Content-Type: text/plain; charset="UTF-8"

Match the name and signature of the equivalent in the x86 text-poke API.
Making the src pointer const also allows this function to be
interchangeable with memcpy().

Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
---
 arch/arm64/include/asm/text-patching.h |  2 +-
 arch/arm64/kernel/patching.c           | 12 ++++++------
 arch/arm64/net/bpf_jit_comp.c          |  2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/include/asm/text-patching.h b/arch/arm64/include/asm/text-patching.h
index 587bdb91ab7a6..450d806d11109 100644
--- a/arch/arm64/include/asm/text-patching.h
+++ b/arch/arm64/include/asm/text-patching.h
@@ -9,7 +9,7 @@ int aarch64_insn_write(void *addr, u32 insn);
 
 int aarch64_insn_write_literal_u64(void *addr, u64 val);
 void *aarch64_insn_set(void *dst, u32 insn, size_t len);
-void *aarch64_insn_copy(void *dst, void *src, size_t len);
+void *text_poke(void *dst, const void *src, size_t len);
 
 int aarch64_insn_patch_text_nosync(void *addr, u32 insn);
 int aarch64_insn_patch_text(void *addrs[], u32 insns[], int cnt);
diff --git a/arch/arm64/kernel/patching.c b/arch/arm64/kernel/patching.c
index 1041bc67a3eee..e07dc32620053 100644
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
 
@@ -145,14 +145,14 @@ static void text_poke_memset(void *dst, void *src, size_t patched, size_t len)
 }
 
 /**
- * aarch64_insn_copy - Copy instructions into (an unused part of) RX memory
+ * text_poke - Copy instructions into (an unused part of) RX memory
  * @dst: address to modify
  * @src: source of the copy
  * @len: length to copy
  *
  * Useful for JITs to dump new code blocks into unused regions of RX memory.
  */
-noinstr void *aarch64_insn_copy(void *dst, void *src, size_t len)
+noinstr void *text_poke(void *dst, const void *src, size_t len)
 {
 	/* A64 instructions must be word aligned */
 	if ((uintptr_t)dst & 0x3)
diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
index 70d7c89d3ac90..b5be90edff410 100644
--- a/arch/arm64/net/bpf_jit_comp.c
+++ b/arch/arm64/net/bpf_jit_comp.c
@@ -2047,7 +2047,7 @@ bool bpf_jit_supports_kfunc_call(void)
 
 void *bpf_arch_text_copy(void *dst, void *src, size_t len)
 {
-	if (!aarch64_insn_copy(dst, src, len))
+	if (!text_poke(dst, src, len))
 		return ERR_PTR(-EINVAL);
 	return dst;
 }
-- 
2.49.0.604.gff1f9ca942-goog

