Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50BB205E2D
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 07:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744268736; cv=none; b=VhFyf4pIZ8VFG8uzFwy9ZnAZez+8Zc8W1PIzyGhD13G15+oVngoQ0MbFC3jXDWxCUkYDZW+vn4T7Iah6jnS0349GwRIRzBe6/egNMuGa0DFQXhTrQe48LI/z2u5Kt5bxj9pl3U4pUXAgv1tK1l8nbUTfM2+LRWa/fVToq5J2gpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744268736; c=relaxed/simple;
	bh=6Rd4HzTmjSi8Wj2+T4c6yX3o6/8i9wfFJ0rHfw2fL5Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OR99lT3Tfc8/iJp7pXeYBwjw4jXvZun8lTN5JYQ+zhoZj7tIQ4DhpEHbBZvx+8DCFLlDr5N3vXkwDJ45lN5zG61Y9I193F/0CraMIS2li3VaOLHW19/uSXKI0S6vjU40BISp0chqf/LZQFpG6T+i0rEG8o3alG2sy93o/c0uN7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=LqykwAYT; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="LqykwAYT"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-72c1818c394so302902a34.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 00:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1744268734; x=1744873534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DpC/LMch4vBncOIb4H+uNBUj+A3evJlilB0f5X4S7k8=;
        b=LqykwAYT5O0mCChVjXZhRiaVVDxoUCScgNVWukCLAaMyh/dvFdomPAp3w1DP2mjYmg
         mkZ0lXFspDkgoh9oSqC7x8nZlZczPudWloTiD/2/ZZSytlzKiGRy3hsABQEvnCxvgymU
         0/ypkWuKuUO5RbuJOFpFDYJliYyCw6QV1l6z2HDHGjBm8FumbWlDCQXpQwPNtTZ8s1eq
         D46157ckE2CE9xtQlnwpvAOkyj8a6atC9dWjyc5yuS3ZxYwk8B1kQLZQWcCf8fZ2RaJT
         Q+DHEUx+AcgsvwwD06rBU+SKAWIhuN1iCcLfSI2RRh3kz0rgsBEPhoQPt+iMXhsJw3xi
         GR1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744268734; x=1744873534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DpC/LMch4vBncOIb4H+uNBUj+A3evJlilB0f5X4S7k8=;
        b=Omk6ufzF9wsI3YvR95a8Bdc7yvZxmUIeyShKDcENQpg7aYhzLLHJTTAQtVYwV6zFwb
         IgVHtSyzEewPW8z24vplOZ9DN7M+UigCt0cqElZAnS43NhF4tQ2sKb0b6qWwQ1rNUHc/
         l8kw4pn1PnhgR7JgIeEP9I0F5bW+xWiXWRkz0jWkvH7ohyxGEKfRt1vP0JtAWhGNr/vt
         C/fXzPr3FNvHCLm6vnh0w29H3T7OAjdSzs7Dkw5FC1Y691KK0S8CcU0AnFshVGgjUuTP
         F4OCG2ZjCHBk/ElPINQWly/nbSa/B1Obih19RlMhV5yuhk0i9X5BqESvPMA1UZMIpoAf
         ALmg==
X-Forwarded-Encrypted: i=1; AJvYcCX2+gF5zR4lUrQ4GeKKBLOgS0MouQAXu45L6SzlSdlfbQDzNDfxgZMWXCB9JABZCkhrDyuugKFsYAcb5qc=@vger.kernel.org
X-Gm-Message-State: AOJu0YweOv5E3LfqbEfaw7EujkNrlxS+UShYfmxG8fb2L2IDL6xKGVJ8
	jO1Wd/jquL8sEdOYoQCRLRkuAyux1+znqbhlDoVKhqnoTN4q6rpIbleMsmKvoA==
X-Gm-Gg: ASbGncuBv67ROFpHQ9MnmQ0SHAjQczIeijA8C4D6xTwI9CjWNXN0H5HLve0OMflXcjK
	9RhQW3zMUyFzNlPW3fmc+bJp+gKnCKPsiCK2DlXQYjoCtQVHDpJxVBvWz+9vCKdKe38LIXVLu3s
	HWvo2/U++b3nUxY64oB7x67aPvECow0XvyXrD5R3qp4gdIhglllgfu9BmVQGDW2dkZekFRCfDXA
	Twd9tX3QB1ywkf0xWFXhCtdx30LIboybch86Gm7tmR1RxfIBaJ9RiCr7fnCdgfuMQR+mT5QHG5Y
	j7uLPl3MRyAo+7CCQJx9rLRo7VQTZsEmLondzO6bAPMaKjI5OZ3sVLpUc5Y=
X-Google-Smtp-Source: AGHT+IE+XtNq4lkOGfL5MMqTmIpDIasL7LqvEU62Fpm528DyNXHH0ktFXep74oD9/woVq59pGry6bA==
X-Received: by 2002:a05:6808:14c2:b0:3fa:7328:b9a8 with SMTP id 5614622812f47-4007bcda67dmr907210b6e.18.1744268733620;
        Thu, 10 Apr 2025 00:05:33 -0700 (PDT)
Received: from aus-ird.tenstorrent.com ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40076282ce8sm461369b6e.9.2025.04.10.00.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 00:05:33 -0700 (PDT)
From: Cyril Bur <cyrilbur@tenstorrent.com>
To: palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	paul.walmsley@sifive.com,
	charlie@rivosinc.com,
	jrtc27@jrtc27.com,
	ben.dooks@codethink.co.uk,
	alex@ghiti.fr
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jszhang@kernel.org
Subject: [PATCH v6 4/5] riscv: uaccess: use 'asm goto' for put_user()
Date: Thu, 10 Apr 2025 07:05:25 +0000
Message-Id: <20250410070526.3160847-5-cyrilbur@tenstorrent.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250410070526.3160847-1-cyrilbur@tenstorrent.com>
References: <20250410070526.3160847-1-cyrilbur@tenstorrent.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jisheng Zhang <jszhang@kernel.org>

With 'asm goto' we don't need to test the error etc, the exception just
jumps to the error handling directly.

Because there are no output clobbers which could trigger gcc bugs [1]
the use of asm_goto_output() macro is not necessary here. Not using
asm_goto_output() is desirable as the generated output asm will be
cleaner.

Use of the volatile keyword is redundant as per gcc 14.2.0 manual section
6.48.2.7 Goto Labels:
> Also note that an asm goto statement is always implicitly considered
  volatile.

Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=113921 # 1

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
[Cyril Bur: Rewritten commit message]
Signed-off-by: Cyril Bur <cyrilbur@tenstorrent.com>
---
 arch/riscv/include/asm/uaccess.h | 71 +++++++++++++++-----------------
 1 file changed, 33 insertions(+), 38 deletions(-)

diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
index da36057847f0..719c9179a751 100644
--- a/arch/riscv/include/asm/uaccess.h
+++ b/arch/riscv/include/asm/uaccess.h
@@ -214,61 +214,66 @@ do {								\
 		((x) = (__force __typeof__(x))0, -EFAULT);	\
 })
 
-#define __put_user_asm(insn, x, ptr, err)			\
+#define __put_user_asm(insn, x, ptr, label)			\
 do {								\
 	__typeof__(*(ptr)) __x = x;				\
-	__asm__ __volatile__ (					\
+	asm goto(						\
 		"1:\n"						\
-		"	" insn " %z1, %2\n"			\
-		"2:\n"						\
-		_ASM_EXTABLE_UACCESS_ERR(1b, 2b, %0)		\
-		: "+r" (err)					\
-		: "rJ" (__x), "m"(*(ptr)));			\
+		"	" insn " %z0, %1\n"			\
+		_ASM_EXTABLE(1b, %l2)				\
+		: : "rJ" (__x), "m"(*(ptr)) : : label);		\
 } while (0)
 
 #ifdef CONFIG_64BIT
-#define __put_user_8(x, ptr, err) \
-	__put_user_asm("sd", x, ptr, err)
+#define __put_user_8(x, ptr, label) \
+	__put_user_asm("sd", x, ptr, label)
 #else /* !CONFIG_64BIT */
-#define __put_user_8(x, ptr, err)				\
+#define __put_user_8(x, ptr, label)				\
 do {								\
 	u32 __user *__ptr = (u32 __user *)(ptr);		\
 	u64 __x = (__typeof__((x)-(x)))(x);			\
-	__asm__ __volatile__ (					\
+	asm goto(						\
 		"1:\n"						\
-		"	sw %z1, %3\n"				\
+		"	sw %z0, %2\n"				\
 		"2:\n"						\
-		"	sw %z2, %4\n"				\
-		"3:\n"						\
-		_ASM_EXTABLE_UACCESS_ERR(1b, 3b, %0)		\
-		_ASM_EXTABLE_UACCESS_ERR(2b, 3b, %0)		\
-		: "+r" (err)					\
-		: "rJ" (__x), "rJ" (__x >> 32),			\
+		"	sw %z1, %3\n"				\
+		_ASM_EXTABLE(1b, %l4)				\
+		_ASM_EXTABLE(2b, %l4)				\
+		: : "rJ" (__x), "rJ" (__x >> 32),		\
 			"m" (__ptr[__LSW]),			\
-			"m" (__ptr[__MSW]));			\
+			"m" (__ptr[__MSW]) : : label);		\
 } while (0)
 #endif /* CONFIG_64BIT */
 
-#define __put_user_nocheck(x, __gu_ptr, __pu_err)					\
+#define __put_user_nocheck(x, __gu_ptr, label)			\
 do {								\
 	switch (sizeof(*__gu_ptr)) {				\
 	case 1:							\
-		__put_user_asm("sb", (x), __gu_ptr, __pu_err);	\
+		__put_user_asm("sb", (x), __gu_ptr, label);	\
 		break;						\
 	case 2:							\
-		__put_user_asm("sh", (x), __gu_ptr, __pu_err);	\
+		__put_user_asm("sh", (x), __gu_ptr, label);	\
 		break;						\
 	case 4:							\
-		__put_user_asm("sw", (x), __gu_ptr, __pu_err);	\
+		__put_user_asm("sw", (x), __gu_ptr, label);	\
 		break;						\
 	case 8:							\
-		__put_user_8((x), __gu_ptr, __pu_err);	\
+		__put_user_8((x), __gu_ptr, label);		\
 		break;						\
 	default:						\
 		BUILD_BUG();					\
 	}							\
 } while (0)
 
+#define __put_user_error(x, ptr, err)				\
+do {								\
+	__label__ err_label;					\
+	__put_user_nocheck(x, ptr, err_label);			\
+	break;							\
+err_label:							\
+	(err) = -EFAULT;					\
+} while (0)
+
 /**
  * __put_user: - Write a simple value into user space, with less checking.
  * @x:   Value to copy to user space.
@@ -299,7 +304,7 @@ do {								\
 	__chk_user_ptr(__gu_ptr);				\
 								\
 	__enable_user_access();					\
-	__put_user_nocheck(__val, __gu_ptr, __pu_err);		\
+	__put_user_error(__val, __gu_ptr, __pu_err);		\
 	__disable_user_access();				\
 								\
 	__pu_err;						\
@@ -373,13 +378,7 @@ do {									\
 } while (0)
 
 #define __put_kernel_nofault(dst, src, type, err_label)			\
-do {									\
-	long __kr_err = 0;						\
-									\
-	__put_user_nocheck(*((type *)(src)), (type *)(dst), __kr_err);	\
-	if (unlikely(__kr_err))						\
-		goto err_label;						\
-} while (0)
+	__put_user_nocheck(*((type *)(src)), (type *)(dst), err_label)
 
 static __must_check __always_inline bool user_access_begin(const void __user *ptr, size_t len)
 {
@@ -398,12 +397,8 @@ static inline void user_access_restore(unsigned long enabled) { }
  * We want the unsafe accessors to always be inlined and use
  * the error labels - thus the macro games.
  */
-#define unsafe_put_user(x, ptr, label)	do {				\
-	long __err = 0;							\
-	__put_user_nocheck(x, (ptr), __err);				\
-	if (__err)							\
-		goto label;						\
-} while (0)
+#define unsafe_put_user(x, ptr, label)					\
+	__put_user_nocheck(x, (ptr), label)
 
 #define unsafe_get_user(x, ptr, label)	do {				\
 	long __err = 0;							\
-- 
2.34.1

