Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B96218E81
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 20:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748638634; cv=none; b=gMNG6TdfwRw5NkhzZ63KcKv8jEuCuzrNpWaJfv4JrVbfY2AWGJDa2jHXUaH/T/EUpv3H54mrKblbAxSLzKMnT7hzaRWnPA8c2wSJpw0KKY9G0AI0lIz8d1n3dAk9q3dfV418Gzbn84IhO5oPj16tlgJa5QT7ebzIjVJNYRkBQ2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748638634; c=relaxed/simple;
	bh=7U5wQvWbXxBMolCumFWsOE/r+lyaWSRfdA7Nr4AbUVE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oo2XpXYtrMd6hH+VZM+JyNffBq4FzXjKbcHipWbscfJ90xLBHGM0EWp4juqUu+JuKq8Bvj1fpLkhXZWuo163wsnaoztcfJGQO0oohYJDxuvhIdw5c757O2K4huegt6pE14SC9puwFPELEPM1me0uz8xemQyGlWgTtw/IrdoB9Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=Vu16c3/k; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="Vu16c3/k"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-442f9043f56so15030445e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 13:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1748638631; x=1749243431; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PjZYZIbC6S4Uuu7UtNzxv6J4SIuS9iTbb5YJqO45QR4=;
        b=Vu16c3/kzBZhbSjA8wbvXlFCbpWa6YwlEEUCnVHiVU/MVoxQtRdqko+uc9khalArT/
         BVK63jBu6G145I5FyRRr+01yxk0/oyY7E34jJbwQgfj94K5k0j5+oNKDnEZ7CS0fa0dm
         J3M0wOJYXAF9ajGa8+oXxS2d9ECrJCTQYMDMS1SZYF1zpHw146chSFFN+CjdX6fodhGs
         F5cZSGP81XhMBeetLqR9bdsYw8smydar2Z5qx2Wlek6wnjod5QforBkKkRKeeB4v5CRk
         iVw6xALawqRrDVi/E6+D75TtFhkGSlAjg/R9W6J9Vnmlw2YEzgJUjTNfqoSnuxKs0Jn9
         tdeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748638631; x=1749243431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PjZYZIbC6S4Uuu7UtNzxv6J4SIuS9iTbb5YJqO45QR4=;
        b=wJcNJYo00AzSfqz5P5N8iq/ohRJJoDh1fXf5msu0gocvOhtcO0aTh8q4S+H4zKY35V
         vCgOVfKAE4l4McitQtzQXA3jbyIyjwqqprI9diZGy1HOXOkWioBYm9EwqhDwrSRC3SHI
         UrJ7lOpW7u6c2v4wBk67w+v2921zrn6BvTeZoVSqHhgtATYUoGW9XEMwAh+TSK+RdnFg
         JSxxdp/+ruDrBh5gIXPZ1XFZP9xAo6r5xc/Nzzjon67VAswdF1dwiyNl/n/T3G3JBwOG
         EIxvggSIDSX5JfyCN+Mtzcli9pK2uGQ+zEEo3lxbX3pobK/efh3lHgFZcajwQkuAfmZQ
         FY9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUqoAuU7/eHwhr9CUPOyCPi4JXjLh9Ef49MGzx7fQIT0PDp5n/TeycLYtV2Ltwh8HGqEHEQxFouizQeAM0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8GeeYWze27JaqNNldPHvcCkB8EtEClpdT1pK0yXHnTUYEEmb+
	T/CiYSfdz42L0ZzXvJW6ugaFoaXiF11zRCL529rofn2/tMTAq2HyGTUUw6b09CdUpTjL3T+fMfA
	Mz1hj
X-Gm-Gg: ASbGncs0jfCi1UE3CzLazpIr7oyqaFN7OhZnSt+m3W7sxjM7FABDbJPj1c2dhIU07q8
	tn7FlaERQH0z5GAiA4fu7YdtOWGAk3WvtJoiE9gYwY0J3F1+PC+hx7ZEZqDKifttytu2k4LLdS6
	7FAaelgghMDu7mLp1QCwSaiqVRrIhWSd8vCeCX+TE1IvfdLwE0EMtZPkkttegjMm2Rq6TR9DYKd
	qoXGHaY7MCzhELklNU63EhD3vXg+gWYb8ODIgJrJsuiVpOEs1SxqsIgyRZ8M8ajxW7f/xtwdP1B
	LYq8kFvVup7BVu2Ioaedr1m1onmyqUzq6xKvcbVNEfNWrzfmvPOEJ3dalBZy+ZyyoQlCLskgCo9
	gnVBxGzautUOttJR1FdGWgHsA7dAKb2EG
X-Google-Smtp-Source: AGHT+IFFDiOg0ELjNJBx/TmG4aDGrLUMzGWJBFq4CzZb3gUeDCQ/BIo5wyF05rQAokGbHbkjDRQWAg==
X-Received: by 2002:a05:6000:2c0d:b0:3a4:d994:be7d with SMTP id ffacd0b85a97d-3a4f7a5d340mr3529790f8f.23.1748638630978;
        Fri, 30 May 2025 13:57:10 -0700 (PDT)
Received: from carbon-x1.. (amontpellier-552-1-200-51.w109-210.abo.wanadoo.fr. [109.210.255.51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe5b79asm5666527f8f.2.2025.05.30.13.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 13:57:10 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Subject: [PATCH 2/2] riscv: uaccess: do not do misaligned accesses in get/put_user()
Date: Fri, 30 May 2025 22:56:58 +0200
Message-ID: <20250530205658.624195-3-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250530205658.624195-1-cleger@rivosinc.com>
References: <20250530205658.624195-1-cleger@rivosinc.com>
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
 arch/riscv/include/asm/uaccess.h | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
index 046de7ced09c..b542c05f394f 100644
--- a/arch/riscv/include/asm/uaccess.h
+++ b/arch/riscv/include/asm/uaccess.h
@@ -169,8 +169,21 @@ do {								\
 
 #endif /* CONFIG_64BIT */
 
+unsigned long __must_check __asm_copy_to_user(void __user *to,
+	const void *from, unsigned long n);
+unsigned long __must_check __asm_copy_from_user(void *to,
+	const void __user *from, unsigned long n);
+
 #define __get_user_nocheck(x, __gu_ptr, label)			\
 do {								\
+	if (!IS_ENABLED(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS)) {			\
+		if (!IS_ALIGNED((uintptr_t)__gu_ptr, sizeof(*__gu_ptr))) {		\
+			if (__asm_copy_from_user(&(x), __gu_ptr, sizeof(*__gu_ptr)))	\
+				goto label;			\
+			else					\
+				break;				\
+		}						\
+	}							\
 	switch (sizeof(*__gu_ptr)) {				\
 	case 1:							\
 		__get_user_asm("lb", (x), __gu_ptr, label);	\
@@ -297,6 +310,15 @@ do {								\
 
 #define __put_user_nocheck(x, __gu_ptr, label)			\
 do {								\
+	if (!IS_ENABLED(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS)) {			\
+		if (!IS_ALIGNED((uintptr_t)__gu_ptr, sizeof(*__gu_ptr))) {		\
+			unsigned long val = (unsigned long)(x);				\
+			if (__asm_copy_to_user(__gu_ptr, &(val), sizeof(*__gu_ptr)))	\
+				goto label;			\
+			else					\
+				break;				\
+		}						\
+	}							\
 	switch (sizeof(*__gu_ptr)) {				\
 	case 1:							\
 		__put_user_asm("sb", (x), __gu_ptr, label);	\
@@ -385,12 +407,6 @@ err_label:							\
 		-EFAULT;					\
 })
 
-
-unsigned long __must_check __asm_copy_to_user(void __user *to,
-	const void *from, unsigned long n);
-unsigned long __must_check __asm_copy_from_user(void *to,
-	const void __user *from, unsigned long n);
-
 static inline unsigned long
 raw_copy_from_user(void *to, const void __user *from, unsigned long n)
 {
-- 
2.49.0

