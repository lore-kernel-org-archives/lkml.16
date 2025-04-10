Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0AA2045B0
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 07:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744268734; cv=none; b=iDlro8wLyJoc9WzA5WVWlKBFn8M1XUNahlh/cBlwYlF1fGzMKlo2UbQnSKgyDYpqdPR7X78SBKJRsp9QH4Q0FCTbe0fvA/WlSQ5YaCfAF4IL929FlYXvxa8vaYUzVqel7dobMZt3v6asMsoVZhX3TT52MfUdxM7lDx4KC+bpbAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744268734; c=relaxed/simple;
	bh=p7gn8HCoRfmei461kdKTMrhmaoZ+R8QG+5SxtGUWr5I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dcmiOGoJtUrhckOjmnPUUBYLVGFrRqQKO33/xHKwu68VfypcNrdL5Ewifu2pAEfwQRrvZQZkPxUt/JRQ4tyrCWoS99GLlh2hSQzU1XveiG+jbdtBE9oLQqzrQv3uUJH91o9U83jUFJz7cNcpKX7t5ZsO8F8K+/liHaheklXJfYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=G3BKhYOz; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="G3BKhYOz"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3f6a92f2328so292896b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 00:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1744268731; x=1744873531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vvw7nYWiLBIqfTSpurYIsb0A2VRmihRadD2HqJzvOMM=;
        b=G3BKhYOzZP4xxuWMSgqCgVjAEzHrd5QEyCSOvh8myjhiGNoF6xkDuZtW1aJOt5sppM
         9Q67xiSs7O2+McVoyKWUeTbdPgwoojZYVqkluaENJQsw9Yor0ORZ1y6MlymFJ9C2z05p
         DAVCrTgO5E1nb66UyWSUw1scLkdl8QKD58UiDjd+2N4bGD+3JS4UXwd7cayFfL6kYoRy
         N9XLJd5hSeRQG5F/SvSQ5RHVSAbK1Ap7tRnVTAV1UslG1j/InDhTZOhpoDDSFhOyW8xG
         m8Q28j/JscHUp+PMIgUFqSyvJzZLwnscgLHmIHvjwdkG5eE6MXoa95dF9eV4Fvvxyg+p
         Z7Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744268731; x=1744873531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vvw7nYWiLBIqfTSpurYIsb0A2VRmihRadD2HqJzvOMM=;
        b=I5VAJJTNxG8iQGlRafUHMEOmSB6CbPa/CfrFV0nFfqFZFx+oma5Vveru88/4BC1WgY
         fZa53SfRDoXgcRkRulLXJV9rA+OQrBXT/qOcODUss+bccAbu48A3/NMuavTu6F8Kh7el
         OcOrB7M+vgbdQAfugWArsIXBoGZ1y+oBIZmp3aTH4IPczXz7n5z1dOx3p1YOvv/kNiO0
         COP8mdDjgVBNxREoC2XqQ0gXeye/+H3rgwG4bZ/Jl4OccmfWZ1x+7bKKOqSMlP4RzGOr
         o+wVJKphrPn2r8By1k9aAf0iwQfj/JmCqR5oNjp5HjEjcAVTuea8G1kqAkMIztIfG+ZZ
         t61w==
X-Forwarded-Encrypted: i=1; AJvYcCXUjbtnRL6dGA10kPGfUSHGnBz+PmUAh01eFhelUHaFKycoiuV9yL1YqofopzW56B2j/DBGDUcroWr7hoE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpNQGFWqHePXbekTKQa/ZHbJGxqYgFdDa0creA9tBfClncI8t7
	fgM7A+nxZQzuk+x/8MddGUrt8M3t6Phn0Z3cykP2ev0PLqumD9UhhqZVSVUHTA==
X-Gm-Gg: ASbGncsDB57xx/dW1NqNUroS9ClzWMAzw/J2NHDzgc1XbiM2COi+5FRIZYjxo6phh2r
	DtaQxXBKaBNRt0hl683fRPzWEGTYpfcwwcgB2b2W/uLMxrCjG9VQbfXBTPGWueNaV5fpGna390B
	wtVM1W/d9zILvU9avtTLapmOm0H1Fz49ifvd3IM95yrR7ga/eVmEYaoAIXktmGXN+werukvzxRt
	cNhVJKcgGj7aqZn0FMnRHAwf2EorCEShY4w9pzUdIXhAOsUvM0IiLsTNCfArkJoPnB5A+ODNWz2
	MT7G/Gs4U75lhPncw5gPUbyjoZTthnj/2+dYYj8bT39v7d7SAFOr0aTUbUKYot8ng33xAw==
X-Google-Smtp-Source: AGHT+IF/4Hhe3gfMVMHnBMPKqqrqs5V8qr1hvivIjhC40n+SJ1Uz45EXIUL/JoOL6so0taxy89Y6cQ==
X-Received: by 2002:a05:6808:11c1:b0:3f9:aeb6:6e92 with SMTP id 5614622812f47-4007bfe2744mr915328b6e.9.1744268730964;
        Thu, 10 Apr 2025 00:05:30 -0700 (PDT)
Received: from aus-ird.tenstorrent.com ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40076282ce8sm461369b6e.9.2025.04.10.00.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 00:05:30 -0700 (PDT)
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
Subject: [PATCH v6 2/5] riscv: implement user_access_begin() and families
Date: Thu, 10 Apr 2025 07:05:23 +0000
Message-Id: <20250410070526.3160847-3-cyrilbur@tenstorrent.com>
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

Currently, when a function like strncpy_from_user() is called,
the userspace access protection is disabled and enabled
for every word read.

By implementing user_access_begin() and families, the protection
is disabled at the beginning of the copy and enabled at the end.

The __inttype macro is borrowed from x86 implementation.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Signed-off-by: Cyril Bur <cyrilbur@tenstorrent.com>
---
 arch/riscv/include/asm/uaccess.h | 76 ++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
index fee56b0c8058..c9a461467bf4 100644
--- a/arch/riscv/include/asm/uaccess.h
+++ b/arch/riscv/include/asm/uaccess.h
@@ -61,6 +61,19 @@ static inline unsigned long __untagged_addr_remote(struct mm_struct *mm, unsigne
 #define __disable_user_access()							\
 	__asm__ __volatile__ ("csrc sstatus, %0" : : "r" (SR_SUM) : "memory")
 
+/*
+ * This is the smallest unsigned integer type that can fit a value
+ * (up to 'long long')
+ */
+#define __inttype(x) __typeof__(		\
+	__typefits(x, char,			\
+	  __typefits(x, short,			\
+	    __typefits(x, int,			\
+	      __typefits(x, long, 0ULL)))))
+
+#define __typefits(x, type, not) \
+	__builtin_choose_expr(sizeof(x) <= sizeof(type), (unsigned type)0, not)
+
 /*
  * The exception table consists of pairs of addresses: the first is the
  * address of an instruction that is allowed to fault, and the second is
@@ -368,6 +381,69 @@ do {									\
 		goto err_label;						\
 } while (0)
 
+static __must_check __always_inline bool user_access_begin(const void __user *ptr, size_t len)
+{
+	if (unlikely(!access_ok(ptr, len)))
+		return 0;
+	__enable_user_access();
+	return 1;
+}
+#define user_access_begin user_access_begin
+#define user_access_end __disable_user_access
+
+static inline unsigned long user_access_save(void) { return 0UL; }
+static inline void user_access_restore(unsigned long enabled) { }
+
+/*
+ * We want the unsafe accessors to always be inlined and use
+ * the error labels - thus the macro games.
+ */
+#define unsafe_put_user(x, ptr, label)	do {				\
+	long __err = 0;							\
+	__put_user_nocheck(x, (ptr), __err);				\
+	if (__err)							\
+		goto label;						\
+} while (0)
+
+#define unsafe_get_user(x, ptr, label)	do {				\
+	long __err = 0;							\
+	__inttype(*(ptr)) __gu_val;					\
+	__get_user_nocheck(__gu_val, (ptr), __err);			\
+	(x) = (__force __typeof__(*(ptr)))__gu_val;			\
+	if (__err)							\
+		goto label;						\
+} while (0)
+
+#define unsafe_copy_loop(dst, src, len, type, op, label)		\
+	while (len >= sizeof(type)) {					\
+		op(*(type *)(src), (type __user *)(dst), label);	\
+		dst += sizeof(type);					\
+		src += sizeof(type);					\
+		len -= sizeof(type);					\
+	}
+
+#define unsafe_copy_to_user(_dst, _src, _len, label)			\
+do {									\
+	char __user *__ucu_dst = (_dst);				\
+	const char *__ucu_src = (_src);					\
+	size_t __ucu_len = (_len);					\
+	unsafe_copy_loop(__ucu_dst, __ucu_src, __ucu_len, u64, unsafe_put_user, label);	\
+	unsafe_copy_loop(__ucu_dst, __ucu_src, __ucu_len, u32, unsafe_put_user, label);	\
+	unsafe_copy_loop(__ucu_dst, __ucu_src, __ucu_len, u16, unsafe_put_user, label);	\
+	unsafe_copy_loop(__ucu_dst, __ucu_src, __ucu_len, u8, unsafe_put_user, label);	\
+} while (0)
+
+#define unsafe_copy_from_user(_dst, _src, _len, label)			\
+do {									\
+	char *__ucu_dst = (_dst);					\
+	const char __user *__ucu_src = (_src);				\
+	size_t __ucu_len = (_len);					\
+	unsafe_copy_loop(__ucu_src, __ucu_dst, __ucu_len, u64, unsafe_get_user, label);	\
+	unsafe_copy_loop(__ucu_src, __ucu_dst, __ucu_len, u32, unsafe_get_user, label);	\
+	unsafe_copy_loop(__ucu_src, __ucu_dst, __ucu_len, u16, unsafe_get_user, label);	\
+	unsafe_copy_loop(__ucu_src, __ucu_dst, __ucu_len, u8, unsafe_get_user, label);	\
+} while (0)
+
 #else /* CONFIG_MMU */
 #include <asm-generic/uaccess.h>
 #endif /* CONFIG_MMU */
-- 
2.34.1

