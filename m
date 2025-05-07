Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019CE28A1E3
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 13:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746623431; cv=none; b=HooG7nkfNiryaYqbBHltWGZuHfyOifYIS0TpWtE0NTV9wORQYVXOrxrt5pUiU0t1fBa6JILdK2Fuq3C/Wt8JdpgILb6tlTtPPezqa07fftPXiXhBsAaEa8dA3P5D1HlFnc02BYydF/dpNOHJUDTF+Leqwd69J3CfzNyINVTDrzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746623431; c=relaxed/simple;
	bh=6oaz6WNMnyB1I2YwJHBELbK6HcLsWp3MdBi8+Vr6HRk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mRo49x6Z+ljQDKx6AdAv4C5MpIhLpBIJyLHcrKGcVdCb/VnsTLdNeqqPGWF4V3mKuS9L0jmDn8lZzT+T34hVGzC9hNOJsL3fEn3VNAL4Wk7yM89FPkKniHkaRGf/2PZeoMwablmGav4UbIjvrDHe6Kj3T1RZSfVr4hzV8IEu/j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=AGVhOKpB; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AGVhOKpB"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43e9ccaa1ebso8650875e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 06:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746623428; x=1747228228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SFFedIQoVt5THh/dDr0azukH/sRWNDMHFAQOWykjhMU=;
        b=AGVhOKpBPFPzROy/rDfXeemUJzYb2bIGslIMboEvi9aYS1etvUbGN1SLD7sN3hNdXY
         cGc8lJKhVmn1R84Oc9UHDrHidW8+i+WFqy3Yhwf2wuZ4PafclgHWe1rlwe/OqYBk6SpZ
         HIlCDC/fjqir2eOo2cRdGDV0/auOoPO2a5mjo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746623428; x=1747228228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SFFedIQoVt5THh/dDr0azukH/sRWNDMHFAQOWykjhMU=;
        b=lRMLinqZ0FSGq4lhntK9xNlIv4cMj9nYTPWdlK0lRHtp7kJ21Xt/NRgC6zqffQ1mzj
         R72llLRQDSJ5hLvE5gE2ZFEaMpyKgB4bFUZroZTy9clm7hgyu+CFGAwkq5xGYXvAp1qU
         beqe6v8a/2yT8nytqn2MBQCtJg0yo3H7iImwbd0W94GrQWreSeolXO3eXjDonhHew3qU
         m/204eXvHVZme690ENVye/Oapd7N5jBvI4JuIIIRKoyk3jo5nNvoiSR3K3UAVThh+aao
         51G4gEIkZGq7ciUNmLuQ6gYY3O6nyeWAffhw8HJZ220fHz1uImxkPyt4M88hU9dB7qBk
         Pm4w==
X-Forwarded-Encrypted: i=1; AJvYcCWg8A5cLIERG1N8oxrH1b2+K9xvgStv1t8ch7NaF0Rq24Ei4dLxx8usuWYqYdjG+F4djk23A7KCnfwVvxo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzgh8Nth7NrUjLxaYjDP3mae3XUkmaYm5+pXSJGcQIAHlvd/F1L
	6vrz5BLEPMkkl//oALxbtz3E+IuPdFmzVpHQNfQ57qa4zLOFGVw2XXZKJKRVDA==
X-Gm-Gg: ASbGncuzNsNt2hk/kEv2vx80ykH3g1qIla6EWiI6yxtpckqtKjtciHhj5W+XdbgY/Uo
	8rOCdHlH6mzsYYRd8U4vYCnuTa0Ra+JkAqNutqlFAmlt5TtrNtR/2BhFOD5QQ4iuMTXpoI41CzC
	oAqNc37UHjZ9ZuVhtYpYqszm85oKpAKJ3XqU/ilomr1ml/AoNsLqLszzSLLbNifmtcBjBFj1A2G
	k1Rrw95VeMw2TPtnY3G4/WgoTsrE+OuwCuejHSJZyc7gy9fchMrEEarUt5x5mpV1DHkauvtCgna
	Zqxc3QcnAJdy6+y0ZFlmbU4AMIurvIvL9Wkuqsf3Pxs1K1dqTg8/VLjv
X-Google-Smtp-Source: AGHT+IElR75OEHwMKC4gYQ5ikVeEAK7dbCSsz3voaw3tMaHSvQvvHy+t/om+lnqAq9lqYbAjHGVGzw==
X-Received: by 2002:a05:600c:1ca3:b0:439:94f8:fc7b with SMTP id 5b1f17b1804b1-441d448b936mr9664875e9.0.1746623428057;
        Wed, 07 May 2025 06:10:28 -0700 (PDT)
Received: from revest.zrh.corp.google.com ([2a00:79e0:9d:6:558d:e1fb:c2ec:7513])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd32adcasm647435e9.6.2025.05.07.06.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 06:10:27 -0700 (PDT)
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
Subject: [PATCH v2 4/4] mm: consolidate VM_HIGH_ARCH_* macros into parametric macros
Date: Wed,  7 May 2025 15:10:00 +0200
Message-ID: <20250507131000.1204175-5-revest@chromium.org>
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

This reduces code duplication and chances of mistakes.

Signed-off-by: Florent Revest <revest@chromium.org>
---
 include/linux/mm.h | 52 ++++++++++++++--------------------------------
 1 file changed, 16 insertions(+), 36 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index b12549f0a6dce..a53394d928585 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -298,42 +298,22 @@ extern unsigned int kobjsize(const void *objp);
 #define VM_MERGEABLE	0x80000000	/* KSM may merge identical pages */
 
 #ifdef CONFIG_64BIT
-#define VM_HIGH_ARCH_BIT_0	32	/* bit only usable on 64-bit architectures */
-#define VM_HIGH_ARCH_BIT_1	33	/* bit only usable on 64-bit architectures */
-#define VM_HIGH_ARCH_BIT_2	34	/* bit only usable on 64-bit architectures */
-#define VM_HIGH_ARCH_BIT_3	35	/* bit only usable on 64-bit architectures */
-#define VM_HIGH_ARCH_BIT_4	36	/* bit only usable on 64-bit architectures */
-#define VM_HIGH_ARCH_BIT_5	37	/* bit only usable on 64-bit architectures */
-#define VM_HIGH_ARCH_BIT_6	38	/* bit only usable on 64-bit architectures */
-#define VM_HIGH_ARCH_BIT_7	39	/* bit only usable on 64-bit architectures */
-#define VM_HIGH_ARCH_BIT_8	40	/* bit only usable on 64-bit architectures */
-#define VM_HIGH_ARCH_BIT_9	41	/* bit only usable on 64-bit architectures */
-#define VM_HIGH_ARCH_BIT_10	42	/* bit only usable on 64-bit architectures */
-#define VM_HIGH_ARCH_0	BIT(VM_HIGH_ARCH_BIT_0)
-#define VM_HIGH_ARCH_1	BIT(VM_HIGH_ARCH_BIT_1)
-#define VM_HIGH_ARCH_2	BIT(VM_HIGH_ARCH_BIT_2)
-#define VM_HIGH_ARCH_3	BIT(VM_HIGH_ARCH_BIT_3)
-#define VM_HIGH_ARCH_4	BIT(VM_HIGH_ARCH_BIT_4)
-#define VM_HIGH_ARCH_5	BIT(VM_HIGH_ARCH_BIT_5)
-#define VM_HIGH_ARCH_6	BIT(VM_HIGH_ARCH_BIT_6)
-#define VM_HIGH_ARCH_7	BIT(VM_HIGH_ARCH_BIT_7)
-#define VM_HIGH_ARCH_8	BIT(VM_HIGH_ARCH_BIT_8)
-#define VM_HIGH_ARCH_9	BIT(VM_HIGH_ARCH_BIT_9)
-#define VM_HIGH_ARCH_10	BIT(VM_HIGH_ARCH_BIT_10)
+#define VM_HIGH_ARCH_BIT(i)	(32+i)	/* bit only usable on 64-bit architectures */
+#define VM_HIGH_ARCH(i)		BIT(VM_HIGH_ARCH_BIT(i))
 #endif /* CONFIG_64BIT */
 
 #ifdef CONFIG_ARCH_HAS_PKEYS
-# define VM_PKEY_SHIFT VM_HIGH_ARCH_BIT_0
-# define VM_PKEY_BIT0  VM_HIGH_ARCH_0
-# define VM_PKEY_BIT1  VM_HIGH_ARCH_1
-# define VM_PKEY_BIT2  VM_HIGH_ARCH_2
+# define VM_PKEY_SHIFT VM_HIGH_ARCH_BIT(0)
+# define VM_PKEY_BIT0  VM_HIGH_ARCH(0)
+# define VM_PKEY_BIT1  VM_HIGH_ARCH(1)
+# define VM_PKEY_BIT2  VM_HIGH_ARCH(2)
 #if CONFIG_ARCH_PKEY_BITS > 3
-# define VM_PKEY_BIT3  VM_HIGH_ARCH_3
+# define VM_PKEY_BIT3  VM_HIGH_ARCH(3)
 #else
 # define VM_PKEY_BIT3  0
 #endif
 #if CONFIG_ARCH_PKEY_BITS > 4
-# define VM_PKEY_BIT4  VM_HIGH_ARCH_4
+# define VM_PKEY_BIT4  VM_HIGH_ARCH(4)
 #else
 # define VM_PKEY_BIT4  0
 #endif
@@ -349,7 +329,7 @@ extern unsigned int kobjsize(const void *objp);
  * (x86). See the comments near alloc_shstk() in arch/x86/kernel/shstk.c
  * for more details on the guard size.
  */
-# define VM_SHADOW_STACK	VM_HIGH_ARCH_5
+# define VM_SHADOW_STACK	VM_HIGH_ARCH(5)
 #endif
 
 #if defined(CONFIG_ARM64_GCS)
@@ -357,7 +337,7 @@ extern unsigned int kobjsize(const void *objp);
  * arm64's Guarded Control Stack implements similar functionality and
  * has similar constraints to shadow stacks.
  */
-# define VM_SHADOW_STACK	VM_HIGH_ARCH_6
+# define VM_SHADOW_STACK	VM_HIGH_ARCH(6)
 #endif
 
 #ifndef VM_SHADOW_STACK
@@ -381,8 +361,8 @@ extern unsigned int kobjsize(const void *objp);
 #endif
 
 #if defined(CONFIG_ARM64_MTE)
-# define VM_MTE		VM_HIGH_ARCH_4	/* Use Tagged memory for access control */
-# define VM_MTE_ALLOWED	VM_HIGH_ARCH_5	/* Tagged memory permitted */
+# define VM_MTE		VM_HIGH_ARCH(4)	/* Use Tagged memory for access control */
+# define VM_MTE_ALLOWED	VM_HIGH_ARCH(5)	/* Tagged memory permitted */
 #else
 # define VM_MTE		VM_NONE
 # define VM_MTE_ALLOWED	VM_NONE
@@ -393,7 +373,7 @@ extern unsigned int kobjsize(const void *objp);
 #endif
 
 #ifdef CONFIG_HAVE_ARCH_USERFAULTFD_MINOR
-# define VM_UFFD_MINOR		VM_HIGH_ARCH_9	/* UFFD minor faults */
+# define VM_UFFD_MINOR		VM_HIGH_ARCH(9)	/* UFFD minor faults */
 #else /* !CONFIG_HAVE_ARCH_USERFAULTFD_MINOR */
 # define VM_UFFD_MINOR		VM_NONE
 #endif /* CONFIG_HAVE_ARCH_USERFAULTFD_MINOR */
@@ -406,13 +386,13 @@ extern unsigned int kobjsize(const void *objp);
  * if KVM does not lock down the memory type.
  */
 #ifdef CONFIG_64BIT
-#define VM_ALLOW_ANY_UNCACHED		VM_HIGH_ARCH_7
+#define VM_ALLOW_ANY_UNCACHED		VM_HIGH_ARCH(7)
 #else
 #define VM_ALLOW_ANY_UNCACHED		VM_NONE
 #endif
 
 #ifdef CONFIG_64BIT
-#define VM_DROPPABLE		VM_HIGH_ARCH_8
+#define VM_DROPPABLE		VM_HIGH_ARCH(8)
 #elif defined(CONFIG_PPC32)
 #define VM_DROPPABLE		VM_ARCH_1
 #else
@@ -421,7 +401,7 @@ extern unsigned int kobjsize(const void *objp);
 
 #ifdef CONFIG_64BIT
 /* VM is sealed, in vm_flags */
-#define VM_SEALED	VM_HIGH_ARCH_10
+#define VM_SEALED	VM_HIGH_ARCH(10)
 #endif
 
 /* Bits set in the VMA until the stack is in its final location */
-- 
2.49.0.987.g0cc8ee98dc-goog

