Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2086223704
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 19:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748893485; cv=none; b=uhX918/ET379W7fq7zs7krkqRB3IaW46ijUz3AFmuZSgeLzLdc3MFaNAXQmzEPoSWM+NF2qZLvUMfte1nI0gNKonFImrj+EMpZX7fpZtVjY7HI3BiSY5Lz65UEyAGLhhRsGdFauR06H9uGkfmmDH9fxCtr+s3JESoOQM9KlfcIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748893485; c=relaxed/simple;
	bh=/dIcbXD2Yz8NgiFS/BC1NVmG+q34kcpB4tZXORVzkI0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qKjoQiTZxuzpvvcQZZmdepDadwl3dVL//TuI6792wcNXjRUZliCRZONmo3vCDrhfeF9GFDWaQody68X4yHipHN2MEbtUzqS6EOilGxVu4lqeYJQA2Wu0jHgUZHt2Wd9hz75xGGMXehYxKt+GRdx2XUNv+cXmaAGkHsHnBCcm+sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=dfUYE4eC; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="dfUYE4eC"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-23211e62204so37455025ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 12:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1748893483; x=1749498283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Db/Ed44rvRu053l+IvlTe4ds9o8zgJplXr/Yk0XQfi8=;
        b=dfUYE4eCX3fOokvmxM3bhbuZogH6iRH+jdj+bvtPELje4I+SjGTj7YW0+HrUXbX9lG
         3yw8HN9hdAFTURcaJs2EtyyaflIU1BgsMN1ZTjlkO2EjuTZGOiDMlDLPYjFvRfLjHCnr
         QpM0wKqJekYXH6AE0BWFiHrVzK+HbF6hwr90UwgZZeCn6CJD30UjzOxx9pAjKU2PLgO9
         e+eGnb/2wpmbEFpq36U7BL+OUC863MkJJeGZ8DDlfrOZXO/T6ZlBZgrjb37tckbxuExv
         ivNnfiwf0XcKcxaV6xaosExSo7Gtpv8fQZxy9WXKhZ7ePembSJ1rL8kHnWIExMw3v6Fc
         yEhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748893483; x=1749498283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Db/Ed44rvRu053l+IvlTe4ds9o8zgJplXr/Yk0XQfi8=;
        b=qo2nPnaVcx3TSh+OX6/RSsP7CHVAcNcKvdZn9GMWkqeTnZEEnAplYYhiFDsYZOoTQc
         8UPtMFGwwsFKaCae9A66uhj0O3CY5TawqgJA43ZRGGVKBjftvO9zXA4ej+Pt3hhQ3d5Y
         LhIskU2lSf/gQHs2HRWr0xSBVl7Ms7rf9gafZ/YWfdrTPKZ8nT4ntnBuwApo0LU43yzq
         YEvVgNggjZ3uahJyGRJttwDppMu8KM5Goq7YOngADm3rXlFY0gnXCfDk41XANzFvVmhd
         6LiXEWBT4SRhNu7r+OCb0yEKF8Xdvy9Qy4XjdykhEpCIM50eBOIm9GMT6uFqZnOWroXE
         Q06Q==
X-Forwarded-Encrypted: i=1; AJvYcCWaApTTAc/28CEXjwq+ff3wKoqtH9pJZFiTv+loGi13ngxZ1PSrufqEEqDBZoOgx9ZmnDDnzsg/pU3UHp0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz7Ovf3UiBvfOGVG5x5+1IHLygJYz+h0wC7fQbF9xQ6tD0UHwM
	UmTimRfkvVX9jM/q4MMOD4l72gOZG+tyX/2GoFz3d7rG6u91oLRP9MvpqcJldpBjwDs=
X-Gm-Gg: ASbGnctzAQjpTy0+fVesPtzns256bMYTuJ/wQlfbjDTLbs7M1PKRt1zMlwOq6iMxqDr
	5IwxVOPKJ+glpN+Vq7vfUNUzsZbL6/q/FOk4Gh3YFnrmWJzurObzMNRsnJBwlm96TttHdqjZnu1
	7p589g/uUJf0q4XN0N7thaAWAdrLuuCqh5t3sg4Seu2ytpVAzmKvcSROJOG6f+5JXIi66yPyFs3
	JSyAqj3qMyN+WwQ3jzJeAf3pCxo+7sP26zgQmbUj1dCzHpgS2dNNfsdNiPxxChB7mZkP7f7N/68
	F8op1NGscJOTQ+QY2S2l2R6sItSz8xAyCpWbpcbKZBTULid1ZIRx
X-Google-Smtp-Source: AGHT+IFbuzLN7KFe7fs8Vc2nBOhFcNV/tot07VDwvWe1dI2/MhaIzuoXM1xe//BMSqSz86QiYuqiUQ==
X-Received: by 2002:a17:902:e80e:b0:234:d2fb:2d0e with SMTP id d9443c01a7336-235289c81eamr244455005ad.10.1748893483100;
        Mon, 02 Jun 2025 12:44:43 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bd974asm74589615ad.97.2025.06.02.12.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 12:44:42 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	"Maciej W . Rozycki" <macro@orcam.me.uk>,
	David Laight <david.laight.linux@gmail.com>
Subject: [PATCH v2 3/3] riscv: uaccess: do not do misaligned accesses in get/put_user()
Date: Mon,  2 Jun 2025 21:39:16 +0200
Message-ID: <20250602193918.868962-4-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250602193918.868962-1-cleger@rivosinc.com>
References: <20250602193918.868962-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Doing misaligned access to userspace memory would make a trap on
platform where it is emulated. Latest fixes removed the kernel
capability to do unaligned accesses to userspace memory safely since
interrupts are kept disabled at all time during that. Thus doing so
would crash the kernel.

Such behavior was detected with GET_UNALIGN_CTL() that was doing
a put_user() with an unsigned long* address that should have been an
unsigned int*. Reenabling kernel misaligned access emulation is a bit
risky and it would also degrade performances. Rather than doing that,
we will try to avoid any misaligned accessed by using copy_from/to_user()
which does not do any misaligned accesses. This can be done only for
!CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS and thus allows to only generate
a bit more code for this config.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 arch/riscv/include/asm/uaccess.h | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
index 046de7ced09c..d472da4450e6 100644
--- a/arch/riscv/include/asm/uaccess.h
+++ b/arch/riscv/include/asm/uaccess.h
@@ -169,8 +169,19 @@ do {								\
 
 #endif /* CONFIG_64BIT */
 
+unsigned long __must_check __asm_copy_to_user_sum_enabled(void __user *to,
+	const void *from, unsigned long n);
+unsigned long __must_check __asm_copy_from_user_sum_enabled(void *to,
+	const void __user *from, unsigned long n);
+
 #define __get_user_nocheck(x, __gu_ptr, label)			\
 do {								\
+	if (!IS_ENABLED(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS) &&	\
+	    !IS_ALIGNED((uintptr_t)__gu_ptr, sizeof(*__gu_ptr))) {	\
+		if (__asm_copy_from_user_sum_enabled(&(x), __gu_ptr, sizeof(*__gu_ptr))) \
+			goto label;				\
+		break;						\
+	}							\
 	switch (sizeof(*__gu_ptr)) {				\
 	case 1:							\
 		__get_user_asm("lb", (x), __gu_ptr, label);	\
@@ -297,6 +308,13 @@ do {								\
 
 #define __put_user_nocheck(x, __gu_ptr, label)			\
 do {								\
+	if (!IS_ENABLED(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS) &&	\
+	    !IS_ALIGNED((uintptr_t)__gu_ptr, sizeof(*__gu_ptr))) {	\
+		__inttype(x) val = (__inttype(x))x;			\
+		if (__asm_copy_to_user_sum_enabled(__gu_ptr, &(val), sizeof(*__gu_ptr))) \
+			goto label;				\
+		break;						\
+	}							\
 	switch (sizeof(*__gu_ptr)) {				\
 	case 1:							\
 		__put_user_asm("sb", (x), __gu_ptr, label);	\
@@ -450,11 +468,6 @@ static inline void user_access_restore(unsigned long enabled) { }
 	(x) = (__force __typeof__(*(ptr)))__gu_val;			\
 } while (0)
 
-unsigned long __must_check __asm_copy_to_user_sum_enabled(void __user *to,
-	const void *from, unsigned long n);
-unsigned long __must_check __asm_copy_from_user_sum_enabled(void *to,
-	const void __user *from, unsigned long n);
-
 #define unsafe_copy_to_user(_dst, _src, _len, label)			\
 	if (__asm_copy_to_user_sum_enabled(_dst, _src, _len))		\
 		goto label;
-- 
2.49.0

