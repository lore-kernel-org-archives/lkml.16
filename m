Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9679823C367
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 11:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744025619; cv=none; b=OA2xO6AliFsFldXEiEiOlYFIpvPapTSEdeX46fo75YBUiKgSsDOqt7dpsvG0kYAP9lycImzOYpVZzCANZiS3qMFO3I7DQ9XMnEli4AKkG1/dSZL4EqfWJ7/SVgyZOD43KTp+PFCCLIsFv4DwYgPy5+rEB7LZye5qR37spb4t+cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744025619; c=relaxed/simple;
	bh=eOxbz5pZkCGZ7yiGl/bs5nW3aGaLCwolZW+2II12O3U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=LSAcHtQnvX5JGW/FMjzQw8H0pTOQ7PxSOAeNSdNkJQhECiYgU1nhrz/0y1FbSugFpF2ChacDLDf4kHObiuROz353d4XW+GRyhIzp0ZBKTiQ4mzrOzJzcHO4dO9+FQUv/tD1u/kgIFsPB4Vzl0ak0iVaH212+LO3wem8l7r257kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ac28e66c0e1so666110366b.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 04:33:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744025615; x=1744630415;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XpFKLqR6KfBk6N/mW4zFpS+zB3MQPjK8qbiPBNr6GzI=;
        b=KlTaC6fJAUaypLluyDPKq3CGt9aXhsftaFlFHuuYDtdJagLhVINzre76CJaWOZWv04
         0eTf+OO9uamvYs879SFYJDKre72njRynEU7LLATDsZR9ZPt42Gihbn5hhb1BDgFcsghk
         fLkzNzpfekRg9CH8DeR4oJVUv4J5QZHtI4AjEjwEvMU90mIckIhrPTp/mhxbCVX9osLq
         k8yDYa+emmRMhtdSnNNLIAfw5iqWhBUQWZrDYhW+P60nBsSDD7oR2k3NCtkqNTIdTHqH
         BVuU20x3+Pqasag86njzu0vykYdumF/ObiNNu/+bmUmjZ9YmpO7wFaNvk5oFPrPvSeDP
         dheA==
X-Forwarded-Encrypted: i=1; AJvYcCW9EOdYsn3ZBTtsIVY77FaMQfZH0j7JLPnXUI51MwnnvTpBuqijEOIm00UNeyknHbadyNzmljrzHHNKsT8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlNRjN9wWY041nxtIXOUW2tK6FRhk+1gSMOxGscwBFnr/a485r
	pwi5KCrHGtmcIMF3oHhEMSiwVPOPTUFnZe5ap0+qh7p3DJvWfgHKeRujSw==
X-Gm-Gg: ASbGncsa6lRygkUQQwcO5aWNL1ApMtf1SK6uPrC2YvFWe/k8n4/V/dcrwuePM40y+1j
	rV0xtwx+Fu4u16D0ifjK5Vt3ALEn3gj0FlytMhLgQmY+Yer2ee3aFUAQyRKNn6116RGuLRuNMXz
	kmq4SVkQQwOWiSDQFuJIM1TI0r0PP46QCczlk92RK6bOCSiSfVa0ToTXqFi29NjjxLDFa4u2L+c
	WkZj8xC2Uh827GQ8j5y9yW9OgsmAFX38LmToMUlrrDEtPHGV7y6Wl72+1j0h6x8IBUlXnklldzg
	xIfkmYKcpqOEhCE3W7B1je+F9s4sRhwelLM=
X-Google-Smtp-Source: AGHT+IF2aaZkO7nVjA9K/0iq75Czk5dm9yRbO08+u9wz1DCnxIMSTHn+q0hj+kEGx3FRT64/yxZhRA==
X-Received: by 2002:a17:907:c1e:b0:ac6:ffb0:a2be with SMTP id a640c23a62f3a-ac7d6ebb828mr1047119566b.47.1744025615247;
        Mon, 07 Apr 2025 04:33:35 -0700 (PDT)
Received: from localhost ([2a03:2880:30ff:5::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7c01bfa5csm725053266b.166.2025.04.07.04.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 04:33:34 -0700 (PDT)
From: Breno Leitao <leitao@debian.org>
Date: Mon, 07 Apr 2025 04:33:25 -0700
Subject: [PATCH] arm64: vdso: Use __arch_counter_get_cntvct()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-arm-vdso-v1-1-7012de25b195@debian.org>
X-B4-Tracking: v=1; b=H4sIAAW482cC/23MsQ7CIBAA0F8hNxdz0BIik/9hOlC4tjcIBgzRN
 Py7sbPrG94BlQpTBScOKNS4ck7ghBoEhN2njSRHcAI0aoMTaunLQ7ZYswzTguG6jmZEhEHAs9D
 K77O6z4OAnesrl885N/XTP0lTUklN1isdrVFob5EW9umSywZz7/0L77+TdaEAAAA=
X-Change-ID: 20250402-arm-vdso-c4b0c9f35300
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, maz@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel-team@meta.com, Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.15-dev-42535
X-Developer-Signature: v=1; a=openpgp-sha256; l=2681; i=leitao@debian.org;
 h=from:subject:message-id; bh=eOxbz5pZkCGZ7yiGl/bs5nW3aGaLCwolZW+2II12O3U=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBn87gNP4wwTebwP9xuWSPtYKwvUWsNDRGsGrV2T
 fUKbnrwigaJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCZ/O4DQAKCRA1o5Of/Hh3
 bU+2D/9KcoB0Rb3vrcypcIrPQP1jk66SqtiiVV7iARiCKsYXMY39AQSIDAG0rCXn14TCDyxtOB1
 Ek9O+EPxNiZNs9c8MCzUMlS1P4kn1KUs7GiMm+9Z/TKer3M0+zVGeh5Ae4oCUy3KfOOzkJc9NKg
 wm2N31DXWNfsPu1UvmCzkJ23OPqlY8huHiiIB6QP2qsd3PTv5BI9t3YKhEl1YO/2ZX5FpTMzeq4
 e7qM0VDWCrfLH4xYE2Fsqlt1g9v+JCvaPF/PqNO/ggrutJ5+fIBnttwpK3OS56frV+TBbDg6FK1
 pV0BHlhKU2r0i/W0A3g6Amu8HwXXcq3NSUtA2gVukGpRB/6P9M7hb1Tx2c0Ctd4qqi4tDz6L8n1
 WIFxqEHCRSn2TFY7qqnrrk1zNKYv9yllS+AGLf6jyHwABtzYzyTI3IF06cH5pWIryhv0fev9sJs
 56/aJmHlckgG3yHiSJbhWcu+02qiyqkgrCw052zoso5srSN+ejlA+uOwFFa0K9rmqzQPrsY0uPu
 nTYfOsljL6RoJ+FvlZjdWUMW5TxhCN0CchbEuIO4/ijy+vOFmQz6mlLLHhjlFzugdnPp838TthY
 E7cA2kLHlKgDQ/iy7QMLIyRAtGXkGp4v6xuXsjWRGZjyYMf8cBXy3J9Q9O95D8exrSEHbv7NUaU
 zTIi0NBfjO4YFcg==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D

While reading how `cntvct_el0` was read in the kernel, I found that
__arch_get_hw_counter() is doing something very similar to what
__arch_counter_get_cntvct() is already doing.

Use the existing __arch_counter_get_cntvct() function instead of
duplicating similar inline assembly code in __arch_get_hw_counter().

Both functions were performing nearly identical operations to read the
cntvct_el0 register. The only difference was that
__arch_get_hw_counter() included a memory clobber in its inline
assembly, which appears unnecessary in this context.

This change simplifies the code by eliminating duplicate functionality
and improves maintainability by centralizing the counter access logic in
a single implementation.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
Changes from RFC:
- Move the #include files to be alphabetically ordered
- Link to RFC: https://lore.kernel.org/r/20250402-arm-vdso-v1-1-2e7a12d75107@debian.org
---
 arch/arm64/include/asm/vdso/gettimeofday.h | 22 ++--------------------
 1 file changed, 2 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/include/asm/vdso/gettimeofday.h b/arch/arm64/include/asm/vdso/gettimeofday.h
index 92a2b59a9f3df..83c315ed5c6e7 100644
--- a/arch/arm64/include/asm/vdso/gettimeofday.h
+++ b/arch/arm64/include/asm/vdso/gettimeofday.h
@@ -8,6 +8,7 @@
 #ifndef __ASSEMBLY__
 
 #include <asm/alternative.h>
+#include <asm/arch_timer.h>
 #include <asm/barrier.h>
 #include <asm/unistd.h>
 #include <asm/sysreg.h>
@@ -69,8 +70,6 @@ int clock_getres_fallback(clockid_t _clkid, struct __kernel_timespec *_ts)
 static __always_inline u64 __arch_get_hw_counter(s32 clock_mode,
 						 const struct vdso_time_data *vd)
 {
-	u64 res;
-
 	/*
 	 * Core checks for mode already, so this raced against a concurrent
 	 * update. Return something. Core will do another round and then
@@ -79,24 +78,7 @@ static __always_inline u64 __arch_get_hw_counter(s32 clock_mode,
 	if (clock_mode == VDSO_CLOCKMODE_NONE)
 		return 0;
 
-	/*
-	 * If FEAT_ECV is available, use the self-synchronizing counter.
-	 * Otherwise the isb is required to prevent that the counter value
-	 * is speculated.
-	*/
-	asm volatile(
-	ALTERNATIVE("isb\n"
-		    "mrs %0, cntvct_el0",
-		    "nop\n"
-		    __mrs_s("%0", SYS_CNTVCTSS_EL0),
-		    ARM64_HAS_ECV)
-	: "=r" (res)
-	:
-	: "memory");
-
-	arch_counter_enforce_ordering(res);
-
-	return res;
+	return __arch_counter_get_cntvct();
 }
 
 #endif /* !__ASSEMBLY__ */

---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250402-arm-vdso-c4b0c9f35300

Best regards,
-- 
Breno Leitao <leitao@debian.org>

