Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661DB23F420
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 12:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744893397; cv=none; b=gRpESWVahBITLg/4oN46ry03iscrCp16u8PYAonhDPVfpAYYCK7vVP9PoTC4H6O53DY7W0iYHeRKz7672wChIZOjY/txmHKDWPSDCnXYBFHuRjl+x/UpceSdDaffXLadffNJNxTYqo8o6Q2tgUi6VC+6NFvkvVeNS8sdtSPOWXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744893397; c=relaxed/simple;
	bh=DbgAr120ZJ/oglJvicAM8qq360FFfU7e6moUmCBiDME=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gugDs13koqAmpJiJLK9LV8z5Fbkq/sjmdUxreyCkqo4dRV0AtlAME7dTV3NEc4iMWcym5KJwIet8691ZXsgSc23aCWKiWlUMAxOWMjpNmfhi00b/ZTWm2KhubDQ5znSIlPE0O8xEC65+saAYiXRImO98ykhIr8EZZku3iF6moSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lu3R8JPJ; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lu3R8JPJ"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2ff784dc055so584611a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 05:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744893394; x=1745498194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=8Fw9lZ2AAOJ4B3rMfETmlXbnFb/XEHSXRiuFDan0ofE=;
        b=Lu3R8JPJr8LT4cx/meMhiS5OP0OclOK2DpR2gk3EFbcFhiPAgCji8YYlBrtnrSdk4M
         9Uytt/uevkx2k+mS51eIDJMPOv9KceLwzh7moswxzMx1fmMgZDaeVQ9xuoyayrUnnrHg
         ymlNdHOS8u+W3fQI6HPOT6dFtH4rM2n05tF2ZwzHE27MARhhLYgMC7kHSbHvBJgzynsF
         ptwikrcC1mH8NcrGfOaGE8cgp+4osM05zI7H7QT4mkGYNhZ4EUhvqWjWvVMrq5gzbFAi
         ufGaBZnTD8VmR/H8WlHs9B99JU5zX6DYD0VwUMEbppgiDo2jXKu/fBB+bywd77gP3d23
         TIsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744893394; x=1745498194;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Fw9lZ2AAOJ4B3rMfETmlXbnFb/XEHSXRiuFDan0ofE=;
        b=Gx5Fw3ykv34BeQi5sMCx3+RNe6jItRckxkHcfV/klxqDtq2hu/ACQSBADqyCClVhAl
         a3YJ93zap4aoyZevgjnRFo0uAoNGNsIwUmpTX9LKr92xiaH8WNLxy5lfOHNWuIBTELel
         vmK7tEjm8YAaQV/HlKap0KkyyX5ecSuDv1SptLz7E2ogaj3ObZtthUSHtVhFb4XCEka9
         FsBPN+bxWjgVhEmOlASPDm4zv8t8zt9eOdblvFNWsK+oojOmG3gkHkEeGWnO7En3a++r
         rTHHSzkINlx5n4HlVFj8cszZGKWzY3oy+235phAnLk+ZS9bE/aOzP0iPraTqM8aD7nnJ
         /1UA==
X-Forwarded-Encrypted: i=1; AJvYcCU1VCrUSgBZjIPEKPc4dcQlnBRM+37duRZOFtWFoArL0DS1YRIBReF1wSNy8uoHspbFIl8sKesQ+a93hrk=@vger.kernel.org
X-Gm-Message-State: AOJu0YycsHDnK4h0Lj+uoeZJFvP6dRm0/8bTL1YZzFF/TQFmeugAOcQf
	hm7WJnOd5cvEcmGIBE2Q8SRDOxyFl+4fwJlKBQO2CFIBrVTCTSyS
X-Gm-Gg: ASbGncvhXxIngFfcpeM0ckPJuCIgYl8CKS2AL5w5QSTM8tUj/cUlwQve5bE8bNIx5eM
	E2SoO5CCxv9w2Q/DeirF6O8/9x5kupRmt99QsCi2u7SUiVNEsTluqSk23XGbQxr6YEVkOfuKSFw
	ws83b8RoZmTGHudLdkzjJ3hD7Nr5YY+97Z3jIQz+kAy7YJUe69P5nPoeaqgo+qSNxIWJlaAEYGy
	cseUlSWHN/R+6L/t33cZbKTujzVl5jetWCkYtHslXoCuTmHS9l1pU9zvPuTmOo/N7w6PKs5WgRK
	4G86pdmWvYtIHWsKiJD20b4mw9RJUw8lAqErRByuOHNAlytR+w9EHA==
X-Google-Smtp-Source: AGHT+IHOWz2iwllSEqC34uJoNwIUBXIK+gTbRIfeDBMTWSWDYOIzLvL+FAw1ev+bcqLE7Wre+EGB3Q==
X-Received: by 2002:a17:90b:2b45:b0:2ff:6e72:b8e2 with SMTP id 98e67ed59e1d1-3086417297dmr7524864a91.31.1744893394519;
        Thu, 17 Apr 2025 05:36:34 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-308611d617csm3917601a91.9.2025.04.17.05.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 05:36:33 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: x86@kernel.org
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	kasan-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH v4] x86: Disable image size check for test builds
Date: Thu, 17 Apr 2025 05:36:27 -0700
Message-ID: <20250417123627.2223800-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

64-bit allyesconfig builds fail with

x86_64-linux-ld: kernel image bigger than KERNEL_IMAGE_SIZE

Bisect points to commit 6f110a5e4f99 ("Disable SLUB_TINY for build
testing") as the responsible commit. Reverting that patch does indeed
fix the problem. Further analysis shows that disabling SLUB_TINY enables
KASAN, and that KASAN is responsible for the image size increase.

Solve the build problem by disabling the image size check for test
builds.

While at it, fix typo in associated comment (sink -> sync).

Fixes: 6f110a5e4f99 ("Disable SLUB_TINY for build testing")
Suggested-by: Andrew Morton <akpm@linux-foundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v4: Added comment explaining the change
    Fixed sink -> sync comment
    (both thanks to Andrew).

v3: Disabled image size check instead of disabling KASAN
    Updated subject to match change
    Updated Cc: list to reflect affected maintainers

v2: Disabled KASAN unconditionally for test builds
    Link: https://lore.kernel.org/lkml/20250416230559.2017012-1-linux@roeck-us.net/

Link to RFC:
    https://lore.kernel.org/lkml/20250414011345.2602656-1-linux@roeck-us.net/

 arch/x86/kernel/vmlinux.lds.S | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
index ccdc45e5b759..453f5b5e4817 100644
--- a/arch/x86/kernel/vmlinux.lds.S
+++ b/arch/x86/kernel/vmlinux.lds.S
@@ -466,10 +466,18 @@ SECTIONS
 }
 
 /*
- * The ASSERT() sink to . is intentional, for binutils 2.14 compatibility:
+ * COMPILE_TEST kernels can be large - CONFIG_KASAN, for example, can cause
+ * this. Let's assume that nobody will be running a COMPILE_TEST kernel and
+ * let's assert that fuller build coverage is more valuable than being able to
+ * run a COMPILE_TEST kernel.
+ */
+#ifndef CONFIG_COMPILE_TEST
+/*
+ * The ASSERT() sync to . is intentional, for binutils 2.14 compatibility:
  */
 . = ASSERT((_end - LOAD_OFFSET <= KERNEL_IMAGE_SIZE),
 	   "kernel image bigger than KERNEL_IMAGE_SIZE");
+#endif
 
 /* needed for Clang - see arch/x86/entry/entry.S */
 PROVIDE(__ref_stack_chk_guard = __stack_chk_guard);
-- 
2.45.2

